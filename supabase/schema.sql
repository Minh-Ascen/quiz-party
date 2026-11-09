-- QUIZ PARTY: schema + RPCs for a code-based multiplayer quiz gameshow.
-- Run the whole file in Supabase SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  round_no int not null default 1,
  question_no int not null,
  category text not null,
  prompt text not null,
  options jsonb not null check (jsonb_typeof(options) = 'array' and jsonb_array_length(options) >= 2),
  correct_index int not null check (correct_index between 0 and 3),
  explanation text,
  image_url text,
  audio_url text,
  video_url text,
  youtube_video_id text,
  question_type text not null default 'MULTIPLE_CHOICE' check (question_type in ('MULTIPLE_CHOICE', 'IMAGE_GUESS', 'AUDIO_GUESS', 'VIDEO_GUESS', 'TRUE_FALSE')),
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  points int not null default 1000,
  time_limit int not null default 20,
  source text,
  is_double_points boolean not null default false,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.quiz_rooms (
  id uuid primary key default gen_random_uuid(),
  room_code text not null unique,
  room_name text not null default 'Quiz Party Gameshow',
  status text not null default 'lobby' check (status in ('lobby','playing','reveal','finished')),
  current_index int not null default 0,
  categories text[] not null default '{}',
  difficulty text not null default 'all',
  question_count int not null default 20,
  time_limit int not null default 20,
  media_mode text not null default 'all',
  question_ids uuid[] not null default '{}',
  current_question_started_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  started_at timestamptz,
  host_player_id uuid
);

create table if not exists public.quiz_players (
  id uuid primary key default gen_random_uuid(),
  room_id uuid not null references public.quiz_rooms(id) on delete cascade,
  display_name text not null,
  player_token uuid not null,
  avatar text not null default '🦊',
  score int not null default 0,
  correct_count int not null default 0,
  total_answer_time numeric not null default 0,
  is_host boolean not null default false,
  joined_at timestamptz not null default now(),
  unique(room_id, player_token)
);

do $$
begin
  if not exists (
    select 1 from pg_constraint where conname = 'quiz_rooms_host_player_fk'
  ) then
    alter table public.quiz_rooms
      add constraint quiz_rooms_host_player_fk
      foreign key (host_player_id) references public.quiz_players(id)
      deferrable initially deferred;
  end if;
end $$;

create table if not exists public.quiz_answers (
  id uuid primary key default gen_random_uuid(),
  room_id uuid not null references public.quiz_rooms(id) on delete cascade,
  player_id uuid not null references public.quiz_players(id) on delete cascade,
  question_id uuid not null references public.quiz_questions(id),
  answer_index int not null check (answer_index between 0 and 3),
  is_correct boolean not null,
  points_awarded int not null default 0,
  answered_at timestamptz not null default now(),
  unique(room_id, player_id, question_id)
);

create index if not exists quiz_players_room_idx on public.quiz_players(room_id);
create index if not exists quiz_answers_room_question_idx on public.quiz_answers(room_id, question_id);
create index if not exists quiz_questions_category_idx on public.quiz_questions(category);
create index if not exists quiz_questions_difficulty_idx on public.quiz_questions(difficulty);
create index if not exists quiz_questions_active_idx on public.quiz_questions(active);

alter table public.quiz_questions enable row level security;
alter table public.quiz_rooms enable row level security;
alter table public.quiz_players enable row level security;
alter table public.quiz_answers enable row level security;

revoke all on public.quiz_questions, public.quiz_rooms, public.quiz_players, public.quiz_answers from anon, authenticated;
grant usage on schema public to anon, authenticated;

-- RPC: create_room
create or replace function public.create_room(
  p_host_name text,
  p_player_token uuid,
  p_room_name text default 'Quiz Party Gameshow',
  p_categories text[] default '{}',
  p_difficulty text default 'all',
  p_question_count int default 20,
  p_time_limit int default 20,
  p_media_mode text default 'all',
  p_avatar text default '🦊'
)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_player public.quiz_players;
  v_count int;
  v_limit int;
begin
  if length(trim(p_host_name)) = 0 then
    raise exception 'Vui lòng nhập tên người chơi';
  end if;

  v_count := coalesce(p_question_count, 20);
  if v_count not in (10, 20, 30, 50) then v_count := 20; end if;

  v_limit := coalesce(p_time_limit, 20);
  if v_limit not in (15, 20, 30, 45) then v_limit := 20; end if;

  insert into quiz_rooms(
    room_code,
    room_name,
    categories,
    difficulty,
    question_count,
    time_limit,
    media_mode
  ) values (
    upper(substr(encode(gen_random_bytes(5), 'hex'), 1, 6)),
    coalesce(nullif(trim(p_room_name), ''), 'Quiz Party Gameshow'),
    coalesce(p_categories, '{}'::text[]),
    coalesce(nullif(trim(p_difficulty), ''), 'all'),
    v_count,
    v_limit,
    coalesce(nullif(trim(p_media_mode), ''), 'all')
  )
  returning * into v_room;

  insert into quiz_players(
    room_id,
    display_name,
    player_token,
    is_host,
    avatar
  ) values (
    v_room.id,
    left(trim(p_host_name), 24),
    p_player_token,
    true,
    coalesce(nullif(trim(p_avatar), ''), '🦊')
  )
  returning * into v_player;

  update quiz_rooms set host_player_id = v_player.id where id = v_room.id;

  return jsonb_build_object(
    'room_code', v_room.room_code,
    'player_id', v_player.id
  );
end; $$;

-- RPC: join_room
create or replace function public.join_room(
  p_code text,
  p_display_name text,
  p_player_token uuid,
  p_avatar text default '🐻'
)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_player public.quiz_players;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code)) for update;
  if not found then
    raise exception 'Không tìm thấy phòng. Hãy kiểm tra lại mã phòng.';
  end if;

  if v_room.status <> 'lobby' then
    raise exception 'Phòng đã bắt đầu, không thể tham gia lúc này.';
  end if;

  if (select count(*) from quiz_players where room_id = v_room.id) >= 50 then
    raise exception 'Phòng đã đủ 50 người chơi.';
  end if;

  if length(trim(p_display_name)) = 0 then
    raise exception 'Vui lòng nhập tên hiển thị.';
  end if;

  insert into quiz_players(room_id, display_name, player_token, avatar)
  values(
    v_room.id,
    left(trim(p_display_name), 24),
    p_player_token,
    coalesce(nullif(trim(p_avatar), ''), '🐻')
  )
  returning * into v_player;

  return jsonb_build_object(
    'room_code', v_room.room_code,
    'player_id', v_player.id
  );
end; $$;

-- RPC: start_game
create or replace function public.start_game(p_code text, p_player_token uuid)
returns boolean language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_host public.quiz_players;
  v_selected_ids uuid[];
  v_supplemental_ids uuid[];
  v_target_count int;
  v_current_count int;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code)) for update;
  if not found then raise exception 'Phòng không tồn tại'; end if;

  select * into v_host from quiz_players where room_id = v_room.id and player_token = p_player_token;
  if not found or not v_host.is_host then raise exception 'Chỉ chủ phòng mới được bắt đầu game'; end if;
  if v_room.status <> 'lobby' then raise exception 'Trò chơi đã bắt đầu hoặc đã kết thúc'; end if;

  v_target_count := coalesce(v_room.question_count, 20);

  select coalesce(array_agg(id), '{}'::uuid[]) into v_selected_ids
  from (
    select id from quiz_questions
    where active = true
      and (
        cardinality(v_room.categories) = 0
        or category = any(v_room.categories)
      )
      and (
        v_room.difficulty = 'all'
        or difficulty = v_room.difficulty
      )
    order by random()
    limit v_target_count
  ) s;

  v_current_count := cardinality(v_selected_ids);

  if v_current_count < v_target_count then
    select coalesce(array_agg(id), '{}'::uuid[]) into v_supplemental_ids
    from (
      select id from quiz_questions
      where active = true
        and not (id = any(v_selected_ids))
      order by random()
      limit (v_target_count - v_current_count)
    ) sup;

    v_selected_ids := v_selected_ids || v_supplemental_ids;
  end if;

  if cardinality(v_selected_ids) = 0 then
    raise exception 'Chưa có câu hỏi nào trong ngân hàng. Vui lòng nạp câu hỏi trước!';
  end if;

  update quiz_rooms
  set
    status = 'playing',
    current_index = 0,
    started_at = now(),
    question_ids = v_selected_ids,
    question_count = cardinality(v_selected_ids),
    current_question_started_at = now()
  where id = v_room.id;

  return true;
end; $$;

-- RPC: get_room_state
create or replace function public.get_room_state(p_code text, p_player_token uuid)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_me public.quiz_players;
  v_current_q_id uuid;
  v_q public.quiz_questions;
  v_total_q int;
  v_current_idx int;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code));
  if not found then raise exception 'Phòng không tồn tại'; end if;

  select * into v_me from quiz_players where room_id = v_room.id and player_token = p_player_token;
  if not found then raise exception 'Phiên người chơi không hợp lệ. Hãy tham gia lại.'; end if;

  v_total_q := case
    when cardinality(v_room.question_ids) > 0 then cardinality(v_room.question_ids)
    else (select count(*) from quiz_questions where active = true)
  end;

  v_current_idx := v_room.current_index;

  if cardinality(v_room.question_ids) > 0 and v_current_idx < cardinality(v_room.question_ids) then
    v_current_q_id := v_room.question_ids[v_current_idx + 1];
    select * into v_q from quiz_questions where id = v_current_q_id;
  else
    select * into v_q from quiz_questions where active = true order by round_no, question_no offset v_current_idx limit 1;
    v_current_q_id := v_q.id;
  end if;

  return jsonb_build_object(
    'room_code', v_room.room_code,
    'room_name', v_room.room_name,
    'status', v_room.status,
    'current_index', v_room.current_index,
    'total_questions', v_total_q,
    'time_limit', coalesce(v_q.time_limit, v_room.time_limit, 20),
    'current_question_started_at', v_room.current_question_started_at,
    'categories', v_room.categories,
    'difficulty', v_room.difficulty,
    'is_host', v_me.is_host,
    'my_player_id', v_me.id,
    'answered_count', (select count(*) from quiz_answers where room_id = v_room.id and question_id = v_current_q_id),
    'players', (
      select coalesce(jsonb_agg(jsonb_build_object(
        'id', p.id,
        'display_name', p.display_name,
        'avatar', coalesce(p.avatar, '🦊'),
        'score', p.score,
        'is_host', p.is_host,
        'correct_count', p.correct_count,
        'average_time', case when p.correct_count > 0 then round(p.total_answer_time / p.correct_count, 1) else 0 end,
        'has_answered', exists(
          select 1 from quiz_answers a
          where a.room_id = v_room.id and a.player_id = p.id and a.question_id = v_current_q_id
        )
      ) order by p.score desc, p.joined_at asc), '[]'::jsonb)
      from quiz_players p where p.room_id = v_room.id
    ),
    'question', case when v_q.id is null then null else jsonb_build_object(
      'id', v_q.id,
      'round_no', coalesce(v_q.round_no, 1),
      'question_no', v_current_idx + 1,
      'category', v_q.category,
      'prompt', v_q.prompt,
      'options', v_q.options,
      'question_type', coalesce(v_q.question_type, 'MULTIPLE_CHOICE'),
      'difficulty', coalesce(v_q.difficulty, 'medium'),
      'points', coalesce(v_q.points, 1000),
      'time_limit', coalesce(v_q.time_limit, v_room.time_limit, 20),
      'is_double_points', coalesce(v_q.is_double_points, false),
      'image_url', v_q.image_url,
      'audio_url', v_q.audio_url,
      'video_url', v_q.video_url,
      'youtube_video_id', v_q.youtube_video_id,
      'source', v_q.source,
      'correct_index', case when v_room.status in ('reveal', 'finished') then v_q.correct_index else null end,
      'explanation', case when v_room.status in ('reveal', 'finished') then v_q.explanation else null end
    ) end
  );
end; $$;

-- RPC: submit_answer
create or replace function public.submit_answer(
  p_code text,
  p_player_token uuid,
  p_question_id uuid,
  p_answer_index int,
  p_client_elapsed numeric default null
)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_player public.quiz_players;
  v_q public.quiz_questions;
  v_current_q_id uuid;
  v_base_points int;
  v_points int := 0;
  v_correct boolean;
  v_total_players int;
  v_answered int;
  v_time_limit numeric;
  v_elapsed numeric;
  v_speed_ratio numeric;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code)) for update;
  if not found or v_room.status <> 'playing' then raise exception 'Câu hỏi hiện không nhận câu trả lời'; end if;

  select * into v_player from quiz_players where room_id = v_room.id and player_token = p_player_token;
  if not found then raise exception 'Người chơi không hợp lệ'; end if;

  if cardinality(v_room.question_ids) > 0 and v_room.current_index < cardinality(v_room.question_ids) then
    v_current_q_id := v_room.question_ids[v_room.current_index + 1];
  else
    select id into v_current_q_id from quiz_questions where active = true order by round_no, question_no offset v_room.current_index limit 1;
  end if;

  if v_current_q_id is null or v_current_q_id <> p_question_id then
    raise exception 'Câu hỏi không hợp lệ hoặc đã qua lượt';
  end if;

  select * into v_q from quiz_questions where id = p_question_id;

  if exists(select 1 from quiz_answers where room_id = v_room.id and player_id = v_player.id and question_id = v_q.id) then
    raise exception 'Bạn đã trả lời câu này rồi';
  end if;

  v_correct := (p_answer_index = v_q.correct_index);
  v_time_limit := coalesce(v_q.time_limit, v_room.time_limit, 20);

  v_elapsed := extract(epoch from (now() - coalesce(v_room.current_question_started_at, now())));
  if p_client_elapsed is not null and p_client_elapsed >= 0 and p_client_elapsed <= (v_time_limit + 3) then
    v_elapsed := least(v_elapsed, p_client_elapsed);
  end if;
  v_elapsed := greatest(0.1, least(v_elapsed, v_time_limit));

  if v_correct then
    v_base_points := coalesce(v_q.points, 1000);
    v_speed_ratio := greatest(0, (v_time_limit - v_elapsed) / v_time_limit);
    v_points := round(v_base_points * (0.6 + 0.4 * v_speed_ratio));
    if coalesce(v_q.is_double_points, false) then
      v_points := v_points * 2;
    end if;
  else
    v_points := 0;
  end if;

  insert into quiz_answers(
    room_id,
    player_id,
    question_id,
    answer_index,
    is_correct,
    points_awarded
  ) values (
    v_room.id,
    v_player.id,
    v_q.id,
    p_answer_index,
    v_correct,
    v_points
  );

  update quiz_players
  set
    score = score + v_points,
    correct_count = correct_count + (case when v_correct then 1 else 0 end),
    total_answer_time = total_answer_time + v_elapsed
  where id = v_player.id;

  select count(*) into v_total_players from quiz_players where room_id = v_room.id;
  select count(*) into v_answered from quiz_answers where room_id = v_room.id and question_id = v_q.id;
  if v_answered >= v_total_players then
    update quiz_rooms set status = 'reveal' where id = v_room.id;
  end if;

  return jsonb_build_object(
    'is_correct', v_correct,
    'points_awarded', v_points,
    'elapsed_seconds', round(v_elapsed, 1)
  );
end; $$;

-- RPC: reveal_answer
create or replace function public.reveal_answer(p_code text, p_player_token uuid)
returns boolean language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_host public.quiz_players;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code)) for update;
  if not found then raise exception 'Phòng không tồn tại'; end if;

  select * into v_host from quiz_players where room_id = v_room.id and player_token = p_player_token;
  if not found or not v_host.is_host then raise exception 'Chỉ chủ phòng mới được chốt câu hỏi'; end if;
  if v_room.status <> 'playing' then raise exception 'Trạng thái phòng không hợp lệ'; end if;

  update quiz_rooms set status = 'reveal' where id = v_room.id;
  return true;
end; $$;

-- RPC: next_question
create or replace function public.next_question(p_code text, p_player_token uuid)
returns boolean language plpgsql security definer set search_path = public as $$
declare
  v_room public.quiz_rooms;
  v_host public.quiz_players;
  v_total int;
begin
  select * into v_room from quiz_rooms where room_code = upper(trim(p_code)) for update;
  if not found then raise exception 'Phòng không tồn tại'; end if;

  select * into v_host from quiz_players where room_id = v_room.id and player_token = p_player_token;
  if not found or not v_host.is_host then raise exception 'Chỉ chủ phòng mới được chuyển câu'; end if;
  if v_room.status <> 'reveal' then raise exception 'Hãy chốt đáp án trước khi chuyển câu'; end if;

  v_total := case
    when cardinality(v_room.question_ids) > 0 then cardinality(v_room.question_ids)
    else (select count(*) from quiz_questions where active = true)
  end;

  if v_room.current_index + 1 >= v_total then
    update quiz_rooms set status = 'finished' where id = v_room.id;
  else
    update quiz_rooms
    set
      status = 'playing',
      current_index = current_index + 1,
      current_question_started_at = now()
    where id = v_room.id;
  end if;

  return true;
end; $$;

-- RPC: get_question_bank_stats
create or replace function public.get_question_bank_stats()
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_total int;
  v_categories jsonb;
  v_difficulties jsonb;
  v_types jsonb;
begin
  select count(*) into v_total from quiz_questions where active = true;

  select coalesce(jsonb_agg(jsonb_build_object('category', category, 'count', c)), '[]'::jsonb)
  into v_categories
  from (
    select category, count(*) as c
    from quiz_questions
    where active = true
    group by category
    order by c desc
  ) s;

  select coalesce(jsonb_agg(jsonb_build_object('difficulty', difficulty, 'count', c)), '[]'::jsonb)
  into v_difficulties
  from (
    select difficulty, count(*) as c
    from quiz_questions
    where active = true
    group by difficulty
  ) s;

  select coalesce(jsonb_agg(jsonb_build_object('type', question_type, 'count', c)), '[]'::jsonb)
  into v_types
  from (
    select question_type, count(*) as c
    from quiz_questions
    where active = true
    group by question_type
  ) s;

  return jsonb_build_object(
    'total_active_questions', v_total,
    'categories', v_categories,
    'difficulties', v_difficulties,
    'types', v_types
  );
end; $$;

-- RPC: admin_get_questions
create or replace function public.admin_get_questions(
  p_search text default '',
  p_category text default '',
  p_difficulty text default '',
  p_type text default '',
  p_limit int default 50,
  p_offset int default 0
)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_total int;
  v_items jsonb;
begin
  select count(*) into v_total
  from quiz_questions
  where (nullif(p_search, '') is null or prompt ilike '%' || p_search || '%' or category ilike '%' || p_search || '%')
    and (nullif(p_category, '') is null or category = p_category)
    and (nullif(p_difficulty, '') is null or difficulty = p_difficulty)
    and (nullif(p_type, '') is null or question_type = p_type);

  select coalesce(jsonb_agg(row_to_json(q)), '[]'::jsonb)
  into v_items
  from (
    select *
    from quiz_questions
    where (nullif(p_search, '') is null or prompt ilike '%' || p_search || '%' or category ilike '%' || p_search || '%')
      and (nullif(p_category, '') is null or category = p_category)
      and (nullif(p_difficulty, '') is null or difficulty = p_difficulty)
      and (nullif(p_type, '') is null or question_type = p_type)
    order by round_no asc, question_no asc, prompt asc
    limit coalesce(p_limit, 50)
    offset coalesce(p_offset, 0)
  ) q;

  return jsonb_build_object('total', v_total, 'items', v_items);
end; $$;

-- RPC: admin_upsert_question
create or replace function public.admin_upsert_question(p_question jsonb)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_id uuid;
  v_res public.quiz_questions;
begin
  v_id := nullif(p_question->>'id', '')::uuid;

  if v_id is not null and exists(select 1 from quiz_questions where id = v_id) then
    update quiz_questions
    set
      category = coalesce(p_question->>'category', category),
      prompt = coalesce(p_question->>'prompt', prompt),
      options = case when p_question ? 'options' then (p_question->'options') else options end,
      correct_index = case when p_question ? 'correct_index' then (p_question->>'correct_index')::int else correct_index end,
      explanation = p_question->>'explanation',
      image_url = p_question->>'image_url',
      audio_url = p_question->>'audio_url',
      video_url = p_question->>'video_url',
      youtube_video_id = p_question->>'youtube_video_id',
      question_type = coalesce(p_question->>'question_type', question_type),
      difficulty = coalesce(p_question->>'difficulty', difficulty),
      points = coalesce((p_question->>'points')::int, points),
      time_limit = coalesce((p_question->>'time_limit')::int, time_limit),
      source = p_question->>'source',
      is_double_points = coalesce((p_question->>'is_double_points')::boolean, is_double_points),
      active = coalesce((p_question->>'active')::boolean, active)
    where id = v_id
    returning * into v_res;
  else
    insert into quiz_questions(
      round_no,
      question_no,
      category,
      prompt,
      options,
      correct_index,
      explanation,
      image_url,
      audio_url,
      video_url,
      youtube_video_id,
      question_type,
      difficulty,
      points,
      time_limit,
      source,
      is_double_points,
      active
    ) values (
      coalesce((p_question->>'round_no')::int, 1),
      coalesce((p_question->>'question_no')::int, (select coalesce(max(question_no),0)+1 from quiz_questions)),
      coalesce(p_question->>'category', 'Kiến thức tổng hợp'),
      coalesce(p_question->>'prompt', 'Câu hỏi'),
      coalesce(p_question->'options', '["A","B","C","D"]'::jsonb),
      coalesce((p_question->>'correct_index')::int, 0),
      p_question->>'explanation',
      p_question->>'image_url',
      p_question->>'audio_url',
      p_question->>'video_url',
      p_question->>'youtube_video_id',
      coalesce(p_question->>'question_type', 'MULTIPLE_CHOICE'),
      coalesce(p_question->>'difficulty', 'medium'),
      coalesce((p_question->>'points')::int, 1000),
      coalesce((p_question->>'time_limit')::int, 20),
      p_question->>'source',
      coalesce((p_question->>'is_double_points')::boolean, false),
      coalesce((p_question->>'active')::boolean, true)
    )
    returning * into v_res;
  end if;

  return row_to_json(v_res)::jsonb;
end; $$;

-- RPC: admin_delete_question
create or replace function public.admin_delete_question(p_id uuid)
returns boolean language plpgsql security definer set search_path = public as $$
begin
  delete from quiz_questions where id = p_id;
  return true;
end; $$;

-- RPC: admin_bulk_import_questions
create or replace function public.admin_bulk_import_questions(p_questions jsonb)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_elem jsonb;
  v_inserted int := 0;
  v_skipped int := 0;
  v_prompt text;
  v_category text;
  v_max_q int;
begin
  select coalesce(max(question_no), 0) into v_max_q from quiz_questions;

  for v_elem in select * from jsonb_array_elements(p_questions)
  loop
    v_prompt := trim(v_elem->>'prompt');
    v_category := coalesce(trim(v_elem->>'category'), 'Kiến thức tổng hợp');

    if v_prompt is null or length(v_prompt) = 0 or (v_elem->'options') is null then
      v_skipped := v_skipped + 1;
      continue;
    end if;

    if exists(select 1 from quiz_questions where lower(trim(prompt)) = lower(v_prompt)) then
      v_skipped := v_skipped + 1;
      continue;
    end if;

    v_max_q := v_max_q + 1;

    insert into quiz_questions(
      round_no,
      question_no,
      category,
      prompt,
      options,
      correct_index,
      explanation,
      image_url,
      audio_url,
      video_url,
      youtube_video_id,
      question_type,
      difficulty,
      points,
      time_limit,
      source,
      is_double_points,
      active
    ) values (
      coalesce((v_elem->>'round_no')::int, 1),
      v_max_q,
      v_category,
      v_prompt,
      v_elem->'options',
      coalesce((v_elem->>'correct_index')::int, 0),
      v_elem->>'explanation',
      v_elem->>'image_url',
      v_elem->>'audio_url',
      v_elem->>'video_url',
      v_elem->>'youtube_video_id',
      coalesce(v_elem->>'question_type', 'MULTIPLE_CHOICE'),
      coalesce(v_elem->>'difficulty', 'medium'),
      coalesce((v_elem->>'points')::int, 1000),
      coalesce((v_elem->>'time_limit')::int, 20),
      v_elem->>'source',
      coalesce((v_elem->>'is_double_points')::boolean, false),
      coalesce((v_elem->>'active')::boolean, true)
    );

    v_inserted := v_inserted + 1;
  end loop;

  return jsonb_build_object(
    'inserted', v_inserted,
    'skipped', v_skipped,
    'total_processed', v_inserted + v_skipped
  );
end; $$;

grant execute on function public.create_room(text,uuid,text,text[],text,int,int,text,text) to anon, authenticated;
grant execute on function public.join_room(text,text,uuid,text) to anon, authenticated;
grant execute on function public.start_game(text,uuid) to anon, authenticated;
grant execute on function public.get_room_state(text,uuid) to anon, authenticated;
grant execute on function public.submit_answer(text,uuid,uuid,int,numeric) to anon, authenticated;
grant execute on function public.reveal_answer(text,uuid) to anon, authenticated;
grant execute on function public.next_question(text,uuid) to anon, authenticated;
grant execute on function public.get_question_bank_stats() to anon, authenticated;
grant execute on function public.admin_get_questions(text,text,text,text,int,int) to anon, authenticated;
grant execute on function public.admin_upsert_question(jsonb) to anon, authenticated;
grant execute on function public.admin_delete_question(uuid) to anon, authenticated;
grant execute on function public.admin_bulk_import_questions(jsonb) to anon, authenticated;
