import { NextRequest, NextResponse } from "next/server";
import fs from "fs";
import os from "os";
import path from "path";
import { selectQuestionsForRoom, LOCAL_QUESTION_BANK } from "@/lib/questionBank";
import { Player, Question, QuestionDifficulty, RoomState } from "@/lib/types";

interface StoredAnswer {
  playerId: string;
  answerIndex: number;
  isCorrect: boolean;
  pointsAwarded: number;
  elapsedSeconds: number;
}

interface StoredRoom {
  code: string;
  roomName: string;
  status: "lobby" | "playing" | "reveal" | "finished";
  currentIndex: number;
  totalQuestions: number;
  timeLimit: number;
  difficulty: "all" | QuestionDifficulty;
  categories: string[];
  mediaMode: string;
  hostToken: string;
  questionStartedAt: number;
  players: Array<Player & { token: string }>;
  questions: Question[];
  answersByQuestion: Record<number, Record<string, StoredAnswer>>;
  createdAt: number;
  updatedAt: number;
}

// Giữ bộ nhớ đệm trên globalThis để xử lý tức thì (<1ms) cho 10-50 người chơi cùng lúc
const globalForQuiz = globalThis as unknown as {
  quizRooms?: Record<string, StoredRoom>;
  saveTimer?: ReturnType<typeof setTimeout> | null;
};

const ROOMS_FILE = path.join(process.cwd(), "data", "activeRooms.json");
const FALLBACK_ROOMS_FILE = path.join(os.tmpdir(), "quiz-party-activeRooms.json");

function loadRooms(): Record<string, StoredRoom> {
  if (globalForQuiz.quizRooms) {
    return globalForQuiz.quizRooms;
  }
  for (const filePath of [ROOMS_FILE, FALLBACK_ROOMS_FILE]) {
    try {
      if (fs.existsSync(filePath)) {
        const raw = fs.readFileSync(filePath, "utf8");
        const parsed = JSON.parse(raw);
        globalForQuiz.quizRooms = parsed;
        return parsed;
      }
    } catch {
      // Ignore file read errors
    }
  }
  globalForQuiz.quizRooms = {};
  return globalForQuiz.quizRooms;
}

function saveRooms(rooms: Record<string, StoredRoom>) {
  globalForQuiz.quizRooms = rooms;

  // Debounce việc ghi xuống ổ cứng để khi 8-50 người chơi bấm trả lời cùng 1 mili-giây không bị nghẽn I/O
  if (globalForQuiz.saveTimer) {
    return;
  }
  globalForQuiz.saveTimer = setTimeout(() => {
    globalForQuiz.saveTimer = null;
    try {
      const now = Date.now();
      for (const code of Object.keys(rooms)) {
        if (now - rooms[code].updatedAt > 12 * 3600 * 1000) {
          delete rooms[code];
        }
      }
      const payload = JSON.stringify(rooms);
      try {
        fs.writeFileSync(ROOMS_FILE, payload, "utf8");
      } catch {
        // Trên môi trường Serverless (Vercel), thư mục gốc là read-only nên ghi vào os.tmpdir()
        fs.writeFileSync(FALLBACK_ROOMS_FILE, payload, "utf8");
      }
    } catch {
      // Ignore file write errors
    }
  }, 250);
}

function normalizeVietnamese(str: string): string {
  if (!str) return "";
  return str
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[đĐ]/g, "d")
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function generateRoomCode(rooms: Record<string, StoredRoom>): string {
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  for (let attempt = 0; attempt < 50; attempt++) {
    let code = "";
    for (let i = 0; i < 6; i++) {
      code += chars[Math.floor(Math.random() * chars.length)];
    }
    if (!rooms[code]) return code;
  }
  return "QP" + Math.floor(1000 + Math.random() * 9000);
}

function buildClientState(room: StoredRoom, playerToken: string): RoomState {
  const currentQ = room.questions[room.currentIndex] || null;

  // Tự động chuyển sang trạng thái 'reveal' nếu đã hết thời gian trả lời của câu hiện tại
  if (room.status === "playing" && room.questionStartedAt > 0) {
    const elapsedSec = (Date.now() - room.questionStartedAt) / 1000;
    const qLimit = currentQ?.time_limit || room.timeLimit || 20;
    if (elapsedSec >= qLimit + 2) {
      room.status = "reveal";
      room.updatedAt = Date.now();
    }
  }

  // Fail-safe: Tự động chuyển sang câu tiếp theo nếu ở 'reveal' quá 9.5s (đủ thời gian hiện đáp án + bảng xếp hạng)
  if (room.status === "reveal" && room.updatedAt > 0) {
    const revealElapsed = (Date.now() - room.updatedAt) / 1000;
    if (revealElapsed >= 9.5) {
      if (room.currentIndex + 1 >= room.totalQuestions) {
        room.status = "finished";
      } else {
        room.currentIndex++;
        room.status = "playing";
        room.questionStartedAt = Date.now();
      }
      room.updatedAt = Date.now();
    }
  }

  const me = room.players.find((p) => p.token === playerToken);
  const currentAnswers = room.answersByQuestion[room.currentIndex] || {};
  const answeredCount = Object.keys(currentAnswers).length;

  const isReveal = room.status === "reveal";

  const publicPlayers: Player[] = room.players.map((p) => {
    const ans = currentAnswers[p.id];
    const pts = isReveal && ans && ans.isCorrect ? ans.pointsAwarded : 0;
    return {
      id: p.id,
      display_name: p.display_name,
      score: p.score,
      is_host: p.is_host,
      avatar: p.avatar,
      has_answered: Boolean(ans),
      streak: p.streak || 0,
      correct_count: p.correct_count || 0,
      last_points: pts,
      previous_score: isReveal ? Math.max(0, p.score - pts) : p.score
    };
  });

  let clientQuestion: Question | null = null;
  if (currentQ && (room.status === "playing" || room.status === "reveal")) {
    clientQuestion = {
      ...currentQ,
      time_limit: room.timeLimit,
      // Chỉ gửi đáp án đúng và lời giải thích khi đã ở trạng thái 'reveal'
      correct_index: room.status === "reveal" ? currentQ.correct_index : undefined,
      explanation: room.status === "reveal" ? currentQ.explanation : undefined
    };
  }

  return {
    room_code: room.code,
    room_name: room.roomName,
    status: room.status,
    current_index: room.currentIndex,
    total_questions: room.questions.length,
    time_limit: room.timeLimit,
    difficulty: room.difficulty,
    categories: room.categories,
    answered_count: answeredCount,
    is_host: Boolean(me?.is_host || room.hostToken === playerToken),
    my_player_id: me?.id || "",
    current_question_started_at: new Date(room.questionStartedAt || Date.now()).toISOString(),
    players: publicPlayers,
    question: clientQuestion,
    my_answer: me && currentAnswers[me.id] ? {
      is_correct: isReveal ? currentAnswers[me.id].isCorrect : undefined,
      points_awarded: isReveal ? currentAnswers[me.id].pointsAwarded : undefined,
      answer_index: currentAnswers[me.id].answerIndex
    } : undefined
  };
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const { action } = body;
    const rooms = loadRooms();

    // 1. TẠO PHÒNG MỚI VỚI BỘ LỌC CHỦ ĐỀ, ĐỘ KHÓ, SỐ LƯỢNG CÂU, THỜI GIAN & RANDOM CÂU HỎI
    if (action === "create_room") {
      const hostName = (body.p_host_name || "Chủ phòng").trim();
      const playerToken = body.p_player_token || `tk-${Date.now()}`;
      const roomName = (body.p_room_name || "Quiz Party Gameshow").trim();
      const categories: string[] = Array.isArray(body.p_categories) ? body.p_categories : [];
      const difficulty: "all" | QuestionDifficulty = body.p_difficulty || "all";
      const questionCount = Number(body.p_question_count) || 20;
      const timeLimit = Number(body.p_time_limit) || 20;
      const mediaMode = body.p_media_mode || "all";
      const avatar = body.p_avatar || "🦊";
      const customPool: Question[] | undefined = Array.isArray(body.p_custom_questions)
        ? body.p_custom_questions
        : undefined;

      const activePool =
        customPool && customPool.length > 0 ? customPool : LOCAL_QUESTION_BANK;

      const selectedQuestions = selectQuestionsForRoom(
        categories,
        difficulty,
        questionCount,
        timeLimit,
        activePool
      );

      const code = generateRoomCode(rooms);
      const hostPlayerId = `player-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`;

      const newRoom: StoredRoom = {
        code,
        roomName,
        status: "lobby",
        currentIndex: 0,
        totalQuestions: selectedQuestions.length,
        timeLimit,
        difficulty,
        categories,
        mediaMode,
        hostToken: playerToken,
        questionStartedAt: Date.now(),
        players: [
          {
            id: hostPlayerId,
            token: playerToken,
            display_name: hostName,
            score: 0,
            is_host: true,
            avatar,
            has_answered: false,
            streak: 0,
            correct_count: 0
          }
        ],
        questions: selectedQuestions,
        answersByQuestion: {},
        createdAt: Date.now(),
        updatedAt: Date.now()
      };

      rooms[code] = newRoom;
      saveRooms(rooms);

      return NextResponse.json({
        data: {
          room_code: code,
          player_id: hostPlayerId,
          state: buildClientState(newRoom, playerToken)
        },
        error: null
      });
    }

    // 2. THAM GIA PHÒNG BẰNG MÃ CODE
    if (action === "join_room") {
      const code = (body.p_code || "").trim().toUpperCase();
      const displayName = (body.p_display_name || "Người chơi").trim();
      const playerToken = body.p_player_token || `tk-${Date.now()}`;
      const avatar = body.p_avatar || "🐻";

      const room = rooms[code];
      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: `Không tìm thấy phòng chơi có mã "${code}".` } },
          { status: 404 }
        );
      }

      if (room.players.length >= 50) {
        return NextResponse.json(
          { data: null, error: { message: "Phòng chơi đã đầy (tối đa 50 người)." } },
          { status: 400 }
        );
      }

      let existing = room.players.find((p) => p.token === playerToken);
      if (!existing) {
        existing = {
          id: `player-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`,
          token: playerToken,
          display_name: displayName,
          score: 0,
          is_host: false,
          avatar,
          has_answered: false,
          streak: 0,
          correct_count: 0
        };
        room.players.push(existing);
        room.updatedAt = Date.now();
        saveRooms(rooms);
      } else {
        existing.display_name = displayName;
        existing.avatar = avatar;
        room.updatedAt = Date.now();
        saveRooms(rooms);
      }

      return NextResponse.json({
        data: {
          room_code: room.code,
          player_id: existing.id,
          state: buildClientState(room, playerToken)
        },
        error: null
      });
    }

    // 3. LẤY TRẠNG THÁI PHÒNG HIỆN TẠI
    if (action === "get_room_state") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const room = rooms[code];

      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Phòng chơi không tồn tại hoặc đã kết thúc." } },
          { status: 404 }
        );
      }

      const prevStatus = room.status;
      const clientState = buildClientState(room, playerToken);
      if (room.status !== prevStatus) {
        saveRooms(rooms);
      }

      return NextResponse.json({
        data: clientState,
        error: null
      });
    }

    // 4. BẮT ĐẦU VÁN ĐẤU (HOẶC CHƠI LẠI VỚI BỘ CÂU HỎI RANDOM MỚI)
    if (action === "start_game" || action === "restart_game") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const room = rooms[code];

      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy phòng chơi." } },
          { status: 404 }
        );
      }

      if (room.hostToken !== playerToken) {
        return NextResponse.json(
          { data: null, error: { message: "Chỉ chủ phòng mới có quyền bắt đầu ván đấu." } },
          { status: 403 }
        );
      }

      // Mỗi lần bắt đầu mới hoặc chơi lại: RANDOM LẠI BỘ CÂU HỎI MỚI theo đúng cấu hình Chủ đề + Độ khó + Số câu + Thời gian của phòng!
      const freshQuestions = selectQuestionsForRoom(
        room.categories,
        room.difficulty,
        room.totalQuestions,
        room.timeLimit,
        LOCAL_QUESTION_BANK
      );

      room.questions = freshQuestions;
      room.currentIndex = 0;
      room.status = "playing";
      room.questionStartedAt = Date.now();
      room.answersByQuestion = {};
      room.players.forEach((p) => {
        p.score = 0;
        p.streak = 0;
        p.correct_count = 0;
      });
      room.updatedAt = Date.now();
      saveRooms(rooms);

      return NextResponse.json({
        data: buildClientState(room, playerToken),
        error: null
      });
    }

    // 5. GỬI CÂU TRẢ LỜI & TÍNH ĐIỂM THƯỞNG TỐC ĐỘ (LINE ĐIỂM TỪ 1000 TRỞ XUỐNG)
    if (action === "submit_answer") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const answerIndex = body.p_answer_index !== undefined && body.p_answer_index !== null ? Number(body.p_answer_index) : -1;
      const textAnswer = typeof body.p_text_answer === "string" ? body.p_text_answer.trim() : "";
      const clientElapsed = Number(body.p_client_elapsed);
      const clientPoints = body.p_client_points !== undefined && body.p_client_points !== null ? Number(body.p_client_points) : null;

      const room = rooms[code];
      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy phòng chơi." } },
          { status: 404 }
        );
      }

      if (room.status !== "playing") {
        return NextResponse.json(
          { data: null, error: { message: "Câu hỏi này đã khóa đáp án." } },
          { status: 400 }
        );
      }

      const player = room.players.find((p) => p.token === playerToken);
      if (!player) {
        return NextResponse.json(
          { data: null, error: { message: "Bạn chưa tham gia phòng này." } },
          { status: 403 }
        );
      }

      const qIdx = room.currentIndex;
      const currentQ = room.questions[qIdx];
      if (!currentQ) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy câu hỏi hiện tại." } },
          { status: 400 }
        );
      }

      room.answersByQuestion[qIdx] = room.answersByQuestion[qIdx] || {};
      if (room.answersByQuestion[qIdx][player.id]) {
        // Người chơi đã trả lời câu này rồi
        return NextResponse.json({
          data: buildClientState(room, playerToken),
          error: null
        });
      }

      const serverElapsed = Math.max(0.1, (Date.now() - room.questionStartedAt) / 1000);
      const effectiveElapsed =
        !isNaN(clientElapsed) && clientElapsed > 0
          ? Math.min(serverElapsed + 1, clientElapsed)
          : serverElapsed;

      let isCorrect = false;
      const basePoints = currentQ.points || 1000;
      const limit = Math.max(5, room.timeLimit || 20);
      // Điểm trả lời đúng đếm lùi từ 1000 trở xuống theo thời gian nếu chọn trễ (tối thiểu 100 điểm)
      const fractionRemaining = Math.max(0.1, Math.min(1, 1 - (effectiveElapsed / limit)));
      let pointsAwarded = 0;

      if (textAnswer) {
        // 1. Chế độ đoán tên bài hát (nhập chữ tiếng Việt Unikey)
        const userNorm = normalizeVietnamese(textAnswer);
        const correctOpt = currentQ.options && currentQ.correct_index !== undefined ? currentQ.options[currentQ.correct_index] : "";
        const correctOptNorm = normalizeVietnamese(correctOpt);
        const sourceNorm = currentQ.source ? normalizeVietnamese(currentQ.source) : "";

        let isMatch = false;
        if (userNorm && correctOptNorm) {
          if (userNorm === correctOptNorm) isMatch = true;
          else if (userNorm.length >= 3 && correctOptNorm.includes(userNorm)) isMatch = true;
          else if (correctOptNorm.length >= 3 && userNorm.includes(correctOptNorm)) isMatch = true;
        }
        if (!isMatch && userNorm && sourceNorm) {
          if (sourceNorm.includes(userNorm) || userNorm.includes(sourceNorm)) isMatch = true;
        }

        if (isMatch) {
          isCorrect = true;
        } else {
          // Thử sai trong chế độ đoán nhạc: cho phép gõ thử lại tiếp tục trước khi hết giờ!
          return NextResponse.json({
            data: buildClientState(room, playerToken),
            error: null,
            wrongTry: true,
            message: "Chưa chính xác, thử lại nhé!"
          });
        }
      } else {
        // 2. Chế độ trắc nghiệm 4 đáp án (Multiple Choice cho các quiz chủ đề khác)
        isCorrect = answerIndex === currentQ.correct_index;
      }

      if (isCorrect) {
        const isDouble = Boolean(currentQ.is_double_points);
        const maxPts = isDouble ? basePoints * 2 : basePoints;
        const minPts = Math.round(maxPts * 0.1);
        let calcPts = Math.round(basePoints * fractionRemaining);
        if (isDouble) calcPts *= 2;

        // Khớp 100% số điểm giữa client và server (loại bỏ sai số làm tròn và độ trễ mạng)
        if (clientPoints !== null && !isNaN(clientPoints) && clientPoints >= minPts && clientPoints <= maxPts) {
          if (clientPoints <= calcPts + 150) {
            pointsAwarded = clientPoints;
          } else {
            pointsAwarded = calcPts;
          }
        } else {
          pointsAwarded = calcPts;
        }

        player.score += pointsAwarded;
        player.streak = (player.streak || 0) + 1;
        player.correct_count = (player.correct_count || 0) + 1;
      } else {
        player.streak = 0;
      }

      room.answersByQuestion[qIdx][player.id] = {
        playerId: player.id,
        answerIndex: answerIndex >= 0 ? answerIndex : -1,
        isCorrect,
        pointsAwarded,
        elapsedSeconds: effectiveElapsed
      };

      // Nếu tất cả người chơi trong phòng đều đã trả lời -> tự động chuyển sang mở đáp án (reveal)
      if (Object.keys(room.answersByQuestion[qIdx]).length >= room.players.length) {
        room.status = "reveal";
      }

      room.updatedAt = Date.now();
      saveRooms(rooms);

      return NextResponse.json({
        data: buildClientState(room, playerToken),
        error: null
      });
    }

    // 6. CHỐT CÂU HỎI & MỞ ĐÁP ÁN (REVEAL ANSWER)
    if (action === "reveal_answer") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const room = rooms[code];

      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy phòng chơi." } },
          { status: 404 }
        );
      }

      room.status = "reveal";
      room.updatedAt = Date.now();
      saveRooms(rooms);

      return NextResponse.json({
        data: buildClientState(room, playerToken),
        error: null
      });
    }

    // 7. CHUYỂN SANG CÂU HỎI TIẾP THEO (NEXT QUESTION) HOẶC KẾT THÚC VÁN ĐẤU
    if (action === "next_question") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const room = rooms[code];

      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy phòng chơi." } },
          { status: 404 }
        );
      }

      if (room.hostToken !== playerToken) {
        return NextResponse.json(
          { data: null, error: { message: "Chỉ chủ phòng mới có thể chuyển câu hỏi." } },
          { status: 403 }
        );
      }

      if (room.currentIndex + 1 >= room.questions.length) {
        room.status = "finished";
      } else {
        room.currentIndex += 1;
        room.status = "playing";
        room.questionStartedAt = Date.now();
      }

      room.updatedAt = Date.now();
      saveRooms(rooms);

      return NextResponse.json({
        data: buildClientState(room, playerToken),
        error: null
      });
    }

    // 8. ĐƯA PHÒNG VỀ LẠI LOBBY CHỜ NGƯỜI VÀO PHÒNG (RESET TO LOBBY)
    if (action === "reset_to_lobby") {
      const code = (body.p_code || "").trim().toUpperCase();
      const playerToken = body.p_player_token || "";
      const room = rooms[code];

      if (!room) {
        return NextResponse.json(
          { data: null, error: { message: "Không tìm thấy phòng chơi." } },
          { status: 404 }
        );
      }

      // Đặt lại phòng về trạng thái phòng chờ (lobby)
      room.status = "lobby";
      room.currentIndex = 0;
      room.answersByQuestion = {};
      room.players.forEach((p) => {
        p.score = 0;
        p.streak = 0;
        p.correct_count = 0;
        p.has_answered = false;
      });
      room.updatedAt = Date.now();
      saveRooms(rooms);

      return NextResponse.json({
        data: buildClientState(room, playerToken),
        error: null
      });
    }

    return NextResponse.json(
      { data: null, error: { message: `Hành động không hợp lệ: ${action}` } },
      { status: 400 }
    );
  } catch (err) {
    return NextResponse.json(
      {
        data: null,
        error: {
          message: err instanceof Error ? err.message : "Lỗi xử lý máy chủ."
        }
      },
      { status: 500 }
    );
  }
}
