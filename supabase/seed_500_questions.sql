-- SEED FILE: 504 CÂU HỎI QUIZ PARTY CHẤT LƯỢNG CAO (ĐẦY ĐỦ HÌNH ẢNH MINH HỌA)
-- Phân bố đều qua 12 chủ đề bắt buộc + Cập nhật hình ảnh cho 20 câu hỏi gốc

DO $$
BEGIN
  RAISE NOTICE 'Bắt đầu cập nhật hình ảnh và nạp ngân hàng câu hỏi...';
END $$;

-- 1. CẬP NHẬT HÌNH ẢNH CHO 20 CÂU HỎI GỐC TRONG SUPABASE (NẾU ĐANG CÓ)
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png' WHERE prompt ILIKE '%tỷ phú thiên tài%Marvel%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg' WHERE prompt ILIKE '%Harry Potter%bạn thân%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE prompt ILIKE '%mèo máy đến từ tương lai%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE prompt ILIKE '%Thám tử bị teo nhỏ%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png' WHERE prompt ILIKE '%con tàu nổi tiếng bị chìm%Jack%Rose%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png' WHERE prompt ILIKE '%Let It Go%Elsa%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE prompt ILIKE '%Nhóm nhạc Hàn Quốc%Dynamite%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE prompt ILIKE '%Ông hoàng nhạc Pop%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png' WHERE prompt ILIKE '%The Legend of Zelda%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5c/Mario_by_Shigehisa_Nakaue.png' WHERE prompt ILIKE '%nấm%công chúa Peach%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/26/Cristiano_Ronaldo_Croatia_v_Portugal_2_July_2026-075_%28cropped%29.jpg/330px-Cristiano_Ronaldo_Croatia_v_Portugal_2_July_2026-075_%28cropped%29.jpg' WHERE prompt ILIKE '%biệt danh CR7%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/e/e3/2022_FIFA_World_Cup.svg/330px-2022_FIFA_World_Cup.svg.png' WHERE prompt ILIKE '%World Cup nam năm 2022%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/330px-Apple_logo_black.svg.png' WHERE prompt ILIKE '%quả táo bị cắn%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/330px-Flag_of_Italy.svg.png' WHERE prompt ILIKE '%hình chiếc ủng%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png/330px-Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png' WHERE prompt ILIKE '%Hành tinh Đỏ%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE prompt ILIKE '%năm nhuận%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG' WHERE prompt ILIKE '%🐼🥋%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png' WHERE prompt ILIKE '%🕷️🧑%';
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/330px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg' WHERE prompt ILIKE '%Thành phố Ánh sáng%';
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg' WHERE prompt ILIKE '%Vua Sư Tử%Simba%';

-- 2. NẠP 504 CÂU HỎI MỚI VÀ CẬP NHẬT HÌNH ẢNH NẾU ĐÃ TỒN TẠI
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 1, 'Doraemon', 'Chú mèo máy Doraemon sinh vào ngày tháng năm nào theo cốt truyện?', '["03/09/2112","01/01/2100","08/08/2112","12/12/2200"]'::jsonb, 0, 'Doraemon được sản xuất tại xưởng robot Matsushiba vào ngày 3 tháng 9 năm 2112.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú mèo máy Doraemon sinh vào ngày tháng năm nào theo cốt truyện?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Chú mèo máy Doraemon sinh vào ngày tháng năm nào theo cốt truyện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 2, 'Doraemon', 'Màu sắc nguyên bản của Doraemon khi mới được sản xuất là màu gì?', '["Màu xanh lam","Màu trắng","Màu đỏ","Màu vàng"]'::jsonb, 3, 'Ban đầu Doraemon có màu vàng và có hai tai, sau khi bị chuột gặm tai và khóc trôi lớp sơn vàng thì chuyển sang màu xanh lam.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Màu sắc nguyên bản của Doraemon khi mới được sản xuất là màu gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Màu sắc nguyên bản của Doraemon khi mới được sản xuất là màu gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 3, 'Doraemon', 'Món ăn khoái khẩu nhất của chú mèo máy Doraemon là gì?', '["Bánh bao xá xíu","Bánh mì kẹp thịt","Bánh rán Dorayaki","Mì Ramen"]'::jsonb, 2, 'Doraemon cực kỳ mê bánh rán Dorayaki (bánh rán nhân đậu đỏ truyền thống Nhật Bản).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Dorayaki_001_%283%29.jpg/330px-Dorayaki_001_%283%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Món ăn khoái khẩu nhất của chú mèo máy Doraemon là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Dorayaki_001_%283%29.jpg/330px-Dorayaki_001_%283%29.jpg' WHERE lower(trim(prompt)) = lower('Món ăn khoái khẩu nhất của chú mèo máy Doraemon là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 4, 'Doraemon', 'Nỗi sợ hãi lớn nhất trong đời của Doraemon là loài vật nào?', '["Loài gián","Loài chuột","Loài chó","Loài rắn"]'::jsonb, 1, 'Do tai của chú từng bị chuột máy gặm cụt nên Doraemon mắc chứng sợ chuột kinh niên.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nỗi sợ hãi lớn nhất trong đời của Doraemon là loài vật nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Nỗi sợ hãi lớn nhất trong đời của Doraemon là loài vật nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 5, 'Doraemon', 'Bảo bối nào giúp người sử dụng có thể bay lượn tự do trên bầu trời bằng cách gắn lên đầu?', '["Chong chóng tre","Cánh cửa thần kỳ","Thảm bay","Đèn pin thu nhỏ"]'::jsonb, 0, 'Chong chóng tre (Take-copter) là bảo bối bay phổ biến và gắn liền nhất với nhóm bạn.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người sử dụng có thể bay lượn tự do trên bầu trời bằng cách gắn lên đầu?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người sử dụng có thể bay lượn tự do trên bầu trời bằng cách gắn lên đầu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 6, 'Doraemon', 'Cánh cửa thần kỳ của Doraemon có màu sắc đặc trưng gì?', '["Màu xanh dương","Màu đỏ","Màu vàng","Màu hồng"]'::jsonb, 3, 'Cánh cửa thần kỳ có màu hồng phấn rực rỡ, mở ra bất kỳ địa điểm nào cách tối đa 10 vạn năm ánh sáng.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cánh cửa thần kỳ của Doraemon có màu sắc đặc trưng gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Cánh cửa thần kỳ của Doraemon có màu sắc đặc trưng gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 7, 'Doraemon', 'Cỗ máy thời gian của Doraemon được đặt lối ra vào ở vị trí nào trong nhà Nobita?', '["Gác xép của ngôi nhà","Tủ quần áo của Nobita","Ngăn kéo bàn học của Nobita","Dưới gầm giường"]'::jsonb, 2, 'Lối vào cỗ máy thời gian được kết nối trực tiếp với ngăn kéo bàn học của Nobita.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cỗ máy thời gian của Doraemon được đặt lối ra vào ở vị trí nào trong nhà Nobita?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Cỗ máy thời gian của Doraemon được đặt lối ra vào ở vị trí nào trong nhà Nobita?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 8, 'Doraemon', 'Tên đầy đủ của cô em gái mèo máy chu đáo của Doraemon là gì?', '["Dorako","Dorami","Doramimi","Minidora"]'::jsonb, 1, 'Dorami là em gái thông minh, chu đáo và mạnh mẽ hơn cả Doraemon.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên đầy đủ của cô em gái mèo máy chu đáo của Doraemon là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Tên đầy đủ của cô em gái mèo máy chu đáo của Doraemon là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 9, 'Doraemon', 'Món ăn mà cô bé mèo máy Dorami yêu thích nhất là gì?', '["Bánh mì dưa lưới (Melonpan)","Bánh rán","Kem dâu","Socola"]'::jsonb, 0, 'Khác với Doraemon thích bánh rán, Dorami lại rất thích bánh mì dưa lưới (Melonpan).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Dorayaki_001_%283%29.jpg/330px-Dorayaki_001_%283%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Món ăn mà cô bé mèo máy Dorami yêu thích nhất là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Dorayaki_001_%283%29.jpg/330px-Dorayaki_001_%283%29.jpg' WHERE lower(trim(prompt)) = lower('Món ăn mà cô bé mèo máy Dorami yêu thích nhất là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  1, 10, 'Doraemon', 'Nobita có tài năng thiên bẩm xuất sắc nhất ở hai bộ môn nào sau đây?', '["Bơi lội và võ thuật","Toán học và hội họa","Đá bóng và đánh cờ","Bắn súng và chơi dây"]'::jsonb, 3, 'Nobita là xạ thủ bắn bách phát bách trúng và có khả năng chơi trò tạo hình bằng dây thừng cực đỉnh.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nobita có tài năng thiên bẩm xuất sắc nhất ở hai bộ môn nào sau đây?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Nobita có tài năng thiên bẩm xuất sắc nhất ở hai bộ môn nào sau đây?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 11, 'Doraemon', 'Biệt tài ''lập kỷ lục thế giới'' mà Nobita có thể làm chỉ trong 0.93 giây là gì?', '["Giải xong một câu đố","Tháo giày ra","Chìm vào giấc ngủ","Uống hết cốc nước"]'::jsonb, 2, 'Nobita chỉ mất vỏn vẹn 0.93 giây kể từ khi đặt lưng xuống chiếu là đã có thể ngủ say sưa.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Biệt tài ''lập kỷ lục thế giới'' mà Nobita có thể làm chỉ trong 0.93 giây là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Biệt tài ''lập kỷ lục thế giới'' mà Nobita có thể làm chỉ trong 0.93 giây là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 12, 'Doraemon', 'Ai là người gửi Doraemon từ thế kỷ 22 về quá khứ để giúp đỡ Nobita?', '["Nobisuke (bố Nobita)","Sewashi (chắt của Nobita)","Shizuka","Dekisugi"]'::jsonb, 1, 'Sewashi (chắt của Nobita) đã gửi Doraemon về để thay đổi vận mệnh nghèo khó của dòng họ.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là người gửi Doraemon từ thế kỷ 22 về quá khứ để giúp đỡ Nobita?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Ai là người gửi Doraemon từ thế kỷ 22 về quá khứ để giúp đỡ Nobita?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 13, 'Doraemon', 'Ước mơ cháy bỏng nhưng là nỗi ám ảnh kinh hoàng của Jaian (Chaien) là gì?', '["Trở thành đầu bếp và ca sĩ","Trở thành phi hành gia","Trở thành bác sĩ phẫu thuật","Trở thành họa sĩ truyện tranh"]'::jsonb, 0, 'Jaian luôn ước mơ trở thành ca sĩ và đầu bếp nổi tiếng, nhưng giọng hát và món ăn của cậu đều là ác mộng với bạn bè.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ước mơ cháy bỏng nhưng là nỗi ám ảnh kinh hoàng của Jaian (Chaien) là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Ước mơ cháy bỏng nhưng là nỗi ám ảnh kinh hoàng của Jaian (Chaien) là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 14, 'Doraemon', 'Tên thật của nhân vật Jaian (Chaien) trong bản gốc tiếng Nhật là gì?', '["Nobisuke Nobi","Suneo Honekawa","Hidetoshi Dekisugi","Takeshi Goda"]'::jsonb, 3, 'Tên tiếng Nhật đầy đủ của Jaian là Takeshi Goda (Goda Takeshi).',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên thật của nhân vật Jaian (Chaien) trong bản gốc tiếng Nhật là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Tên thật của nhân vật Jaian (Chaien) trong bản gốc tiếng Nhật là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 15, 'Doraemon', 'Nhân vật Suneo (Xêkô) thường được biết đến với đặc điểm ngoại hình và gia thế nào?', '["Đeo kính cận, học rất giỏi","Béo ú, thích đánh nhau","Mỏ nhọn, nhà rất giàu và thích khoe khoang","Cao gầy, thích thể thao"]'::jsonb, 2, 'Suneo có khuôn mặt mỏ nhọn đặc trưng, gia đình giàu có và thường xuyên khoe đồ chơi đắt tiền.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhân vật Suneo (Xêkô) thường được biết đến với đặc điểm ngoại hình và gia thế nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Nhân vật Suneo (Xêkô) thường được biết đến với đặc điểm ngoại hình và gia thế nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 16, 'Doraemon', 'Bảo bối nào của Doraemon giúp ghi nhớ kiến thức sách vở bằng cách in vào đồ ăn rồi nuốt vào bụng?', '["Bút điểm 100","Bánh mì giúp trí nhớ","Kẹo thông minh","Trà nhớ dai"]'::jsonb, 1, 'Bánh mì giúp trí nhớ (Memory Bread) in trang sách lên bánh rồi ăn là nhớ ngay nội dung.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon giúp ghi nhớ kiến thức sách vở bằng cách in vào đồ ăn rồi nuốt vào bụng?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon giúp ghi nhớ kiến thức sách vở bằng cách in vào đồ ăn rồi nuốt vào bụng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 17, 'Doraemon', 'Nhân vật nữ chính xinh xắn, chăm chỉ, thường xuyên đi tắm trong Doraemon là ai?', '["Shizuka Minamoto","Jaiko Goda","Non-chan","Miyoko"]'::jsonb, 0, 'Shizuka Minamoto (Xuka) là cô bạn gái dịu dàng, thích chơi đàn piano, violin và rất thích tắm.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhân vật nữ chính xinh xắn, chăm chỉ, thường xuyên đi tắm trong Doraemon là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Nhân vật nữ chính xinh xắn, chăm chỉ, thường xuyên đi tắm trong Doraemon là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 18, 'Doraemon', 'Món ăn vặt bí mật mà Shizuka cực kỳ thích nhưng luôn xấu hổ không dám cho ai biết là gì?', '["Mì cay","Bánh tráng nướng","Kẹo mút khổng lồ","Khoai lang nướng"]'::jsonb, 3, 'Shizuka rất thích ăn khoai lang nướng nhưng sợ bị trêu chọc nên luôn giấu kín sở thích này.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Gungoguma_%28roasted_sweet_potatoes%29_2.jpg/330px-Gungoguma_%28roasted_sweet_potatoes%29_2.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Món ăn vặt bí mật mà Shizuka cực kỳ thích nhưng luôn xấu hổ không dám cho ai biết là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Gungoguma_%28roasted_sweet_potatoes%29_2.jpg/330px-Gungoguma_%28roasted_sweet_potatoes%29_2.jpg' WHERE lower(trim(prompt)) = lower('Món ăn vặt bí mật mà Shizuka cực kỳ thích nhưng luôn xấu hổ không dám cho ai biết là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 19, 'Doraemon', 'Em gái của Chaien (Jaian) có tên là gì và có ước mơ trở thành ai?', '["Shizuka - muốn làm nghệ sĩ vĩ cầm","Dorami - muốn làm cảnh sát thời gian","Jaiko - muốn trở thành họa sĩ truyện tranh","Mii-chan - muốn làm người mẫu"]'::jsonb, 2, 'Jaiko (Chubiko) có bút danh là Christine Goda, rất đam mê sáng tác manga.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Em gái của Chaien (Jaian) có tên là gì và có ước mơ trở thành ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Em gái của Chaien (Jaian) có tên là gì và có ước mơ trở thành ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  2, 20, 'Doraemon', 'Thầy giáo chủ nhiệm lớp của Nobita thường phạt cậu làm gì khi đi học muộn hoặc bị điểm 0?', '["Quét dọn sân trường cả tháng","Đứng ngoài hành lang bê xô nước","Chép phạt 1000 lần","Làm bài kiểm tra lại ngay"]'::jsonb, 1, 'Hình phạt kinh điển mà thầy giáo dành cho Nobita là đứng ngoài hành lang hành xác.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thầy giáo chủ nhiệm lớp của Nobita thường phạt cậu làm gì khi đi học muộn hoặc bị điểm 0?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Thầy giáo chủ nhiệm lớp của Nobita thường phạt cậu làm gì khi đi học muộn hoặc bị điểm 0?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 21, 'Doraemon', 'Cậu học sinh hoàn hảo, học giỏi, chơi thể thao cừ khôi và là tình địch của Nobita tên là gì?', '["Hidetoshi Dekisugi","Takeshi Goda","Suneo Honekawa","Nobisuke"]'::jsonb, 0, 'Dekisugi Hidetoshi (Đêkhi) luôn đạt điểm tuyệt đối và rất thân thiết với Shizuka.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cậu học sinh hoàn hảo, học giỏi, chơi thể thao cừ khôi và là tình địch của Nobita tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Cậu học sinh hoàn hảo, học giỏi, chơi thể thao cừ khôi và là tình địch của Nobita tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 22, 'Doraemon', 'Bảo bối nào có thể thay đổi kích thước của sinh vật hoặc đồ vật khi chiếu luồng sáng vào?', '["Bình xịt đông cứng","Gương nhân đôi","Khăn trùm thời gian","Đèn pin thu nhỏ / phóng to"]'::jsonb, 3, 'Đèn pin thu nhỏ (Small Light) và đèn pin phóng to (Big Light) là bảo bối biến đổi kích thước kinh điển.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào có thể thay đổi kích thước của sinh vật hoặc đồ vật khi chiếu luồng sáng vào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào có thể thay đổi kích thước của sinh vật hoặc đồ vật khi chiếu luồng sáng vào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 23, 'Doraemon', 'Chiếc túi không gian bốn chiều dự phòng của Doraemon thường được cất giấu ở đâu?', '["Trong két sắt của gia đình","Trong ngăn kéo bàn học","Dưới đệm ngủ trong tủ của Doraemon","Trong bụng Nobita"]'::jsonb, 2, 'Doraemon giấu chiếc túi dự phòng bốn chiều sơ cua ngay dưới tấm nệm ngủ trong tủ tường.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiếc túi không gian bốn chiều dự phòng của Doraemon thường được cất giấu ở đâu?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Chiếc túi không gian bốn chiều dự phòng của Doraemon thường được cất giấu ở đâu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 24, 'Doraemon', 'Nhìn vào ảnh và cho biết đây là bảo bối quen thuộc nào của Doraemon?', '["Cánh cửa thần kỳ","Khăn trùm thời gian","Thảm bay vũ trụ","Vải tàng hình"]'::jsonb, 1, 'Khăn trùm thời gian (Time Furoshiki) có 2 mặt: mặt đỏ làm vật cũ thành mới, mặt xanh làm mới thành cũ.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Furoshiki_wrapping_cloth.jpg/640px-Furoshiki_wrapping_cloth.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là bảo bối quen thuộc nào của Doraemon?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Furoshiki_wrapping_cloth.jpg/640px-Furoshiki_wrapping_cloth.jpg' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là bảo bối quen thuộc nào của Doraemon?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 25, 'Doraemon', 'Trong tập phim dài ''Chú khủng long của Nobita'', chú khủng long đầu tiên mà Nobita ấp nở tên là gì?', '["Pi-suke","Fuku","Kyu","Myu"]'::jsonb, 0, 'Pi-suke là chú khủng long cổ dài Futabasaurus rất gắn bó và trung thành với Nobita.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tập phim dài ''Chú khủng long của Nobita'', chú khủng long đầu tiên mà Nobita ấp nở tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg' WHERE lower(trim(prompt)) = lower('Trong tập phim dài ''Chú khủng long của Nobita'', chú khủng long đầu tiên mà Nobita ấp nở tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 26, 'Doraemon', 'Bảo bối nào của Doraemon có hình chiếc điện thoại cổ, dùng để tạo ra một thế giới giả định theo ý muốn?', '["Hộp thư gửi thời gian","Điện thoại liên lạc xuyên không","Bộ đàm tương lai","Tủ điện thoại yêu cầu (Nếu như)"]'::jsonb, 3, 'Tủ điện thoại nếu như (Moshi-wake Box) cho phép người bước vào nói ''Nếu như thế giới...'' để tạo hiện thực song song.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon có hình chiếc điện thoại cổ, dùng để tạo ra một thế giới giả định theo ý muốn?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon có hình chiếc điện thoại cổ, dùng để tạo ra một thế giới giả định theo ý muốn?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 27, 'Doraemon', 'Tác giả sáng tạo ra bộ truyện tranh huyền thoại Doraemon là ai?', '["Eiichiro Oda","Gosho Aoyama","Fujiko F. Fujio","Akira Toriyama"]'::jsonb, 2, 'Fujiko F. Fujio (bút danh của họa sĩ Hiroshi Fujimoto) là tác giả vĩ đại sáng tạo nên Doraemon.',
  'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tác giả sáng tạo ra bộ truyện tranh huyền thoại Doraemon là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg' WHERE lower(trim(prompt)) = lower('Tác giả sáng tạo ra bộ truyện tranh huyền thoại Doraemon là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 28, 'Doraemon', 'Bảo bối nào có dạng bánh quy hình con vật, khi người ăn vào sẽ biến thành con vật đó trong 10 phút?', '["Bánh mì nhân thú","Bánh quy biến hình","Kẹo cao su dã thú","Sôcôla muông thú"]'::jsonb, 1, 'Bánh quy biến hình (Transformation Biscuits) biến người ăn thành hình dạng con vật của chiếc bánh trong vòng 10 phút.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào có dạng bánh quy hình con vật, khi người ăn vào sẽ biến thành con vật đó trong 10 phút?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào có dạng bánh quy hình con vật, khi người ăn vào sẽ biến thành con vật đó trong 10 phút?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 29, 'Doraemon', 'Ai là bạn gái mèo mà Doraemon hay hẹn hò trên mái nhà?', '["Mii-chan (Mimi)","Tamako","Jaiko","Dorami"]'::jsonb, 0, 'Mii-chan là cô mèo trắng xinh đẹp sống gần nhà mà Doraemon rất si mê.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là bạn gái mèo mà Doraemon hay hẹn hò trên mái nhà?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Ai là bạn gái mèo mà Doraemon hay hẹn hò trên mái nhà?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  3, 30, 'Doraemon', 'Chiếc đuôi nhỏ màu đỏ sau mông của Doraemon có công dụng bí mật gì?', '["Nút tự hủy","Ăng-ten thu sóng tương lai","Còi báo động","Công tắc tắt nguồn khẩn cấp"]'::jsonb, 3, 'Khi kéo chiếc đuôi màu đỏ, toàn bộ hệ thống của Doraemon sẽ lập tức ngắt nguồn và bất động.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiếc đuôi nhỏ màu đỏ sau mông của Doraemon có công dụng bí mật gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Chiếc đuôi nhỏ màu đỏ sau mông của Doraemon có công dụng bí mật gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 31, 'Doraemon', 'Tên thật của mẹ Nobita là gì?', '["Shizuka Minamoto","Miyoko Nobi","Tamako Nobi (họ thời con gái: Kataoka)","Yukiko"]'::jsonb, 2, 'Mẹ của Nobita tên là Nobi Tamako (trước khi kết hôn mang họ Kataoka).',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên thật của mẹ Nobita là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Tên thật của mẹ Nobita là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 32, 'Doraemon', 'Bảo bối nào giúp người ta có thể đi xuyên qua các bức tường vững chắc?', '["Cánh cửa tàng hình","Vòng xuyên thấu","Áo choàng vô hình","Búa đập tường"]'::jsonb, 1, 'Vòng xuyên thấu (Pass Loop) dán lên bất kỳ bề mặt cứng nào sẽ tạo thành lỗ hổng để chui qua.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người ta có thể đi xuyên qua các bức tường vững chắc?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người ta có thể đi xuyên qua các bức tường vững chắc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 33, 'Doraemon', 'Nhóm Doraemon thường tụ tập sinh hoạt và chơi bóng chày ở địa điểm quen thuộc nào?', '["Bãi đất trống có ba ống cống bê tông","Công viên trung tâm thành phố","Sân thượng trường tiểu học","Bờ sông Tama"]'::jsonb, 0, 'Bãi đất trống với ba ống cống xếp chồng là nơi tụ họp và tổ chức các trận bóng chày kinh điển.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg/330px-Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm Doraemon thường tụ tập sinh hoạt và chơi bóng chày ở địa điểm quen thuộc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg/330px-Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg' WHERE lower(trim(prompt)) = lower('Nhóm Doraemon thường tụ tập sinh hoạt và chơi bóng chày ở địa điểm quen thuộc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 34, 'Doraemon', 'Bảo bối nào giúp người dùng dịch chuyển tức thời đồ vật hoặc người khác đến gần mình?', '["Huy hiệu thu hút","Găng tay bắt dính","Cây gậy dịch chuyển","Khăn trùm hút vật"]'::jsonb, 3, 'Khăn trùm hoặc găng tay bắt dính là công cụ dịch chuyển đồ vật thuận tiện.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người dùng dịch chuyển tức thời đồ vật hoặc người khác đến gần mình?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp người dùng dịch chuyển tức thời đồ vật hoặc người khác đến gần mình?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 35, 'Doraemon', 'Trong tập truyện ''Đêm trước ngày cưới của Nobita'', thầy hiệu trưởng đã khen ngợi Nobita có phẩm chất đáng quý nhất là gì?', '["Rất dũng cảm trước mọi hiểm nguy","Rất giàu có và hào phóng","Biết cảm thông với nỗi đau và biết chung vui với hạnh phúc của người khác","Có trí thông minh hơn người"]'::jsonb, 2, 'Bố của Shizuka đã dặn con gái rằng Nobita là người biết cảm thông sâu sắc với nỗi buồn và san sẻ niềm vui với người khác.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tập truyện ''Đêm trước ngày cưới của Nobita'', thầy hiệu trưởng đã khen ngợi Nobita có phẩm chất đáng quý nhất là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Trong tập truyện ''Đêm trước ngày cưới của Nobita'', thầy hiệu trưởng đã khen ngợi Nobita có phẩm chất đáng quý nhất là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 36, 'Doraemon', 'Bảo bối ''Bình xịt nói thật'' hoặc ''Con rối nói thật'' có tác dụng gì?', '["Khiến người ta biến thành pho tượng","Khiến người bị tác động phải nói ra toàn bộ suy nghĩ thật trong lòng","Khiến người ta quên hết mọi ký ức","Biến lời nói dối thành sự thật"]'::jsonb, 1, 'Bảo bối này ép người đối diện bộc bạch tất cả suy nghĩ chân thật mà không thể giấu giếm.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối ''Bình xịt nói thật'' hoặc ''Con rối nói thật'' có tác dụng gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối ''Bình xịt nói thật'' hoặc ''Con rối nói thật'' có tác dụng gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 37, 'Doraemon', 'Con mèo máy Doraemon có số đo ba vòng hình thể và cân nặng đặc biệt như thế nào?', '["Đều xoay quanh con số 129.3 (cao 129.3cm, nặng 129.3kg, vòng ngực 129.3cm)","Đều là con số 100","Đều là con số 99.9","Đều là con số 150"]'::jsonb, 0, 'Con số 129.3 là con số may mắn của Doraemon (chiều cao, cân nặng, vòng ngực và tốc độ chạy khi sợ chuột).',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Con mèo máy Doraemon có số đo ba vòng hình thể và cân nặng đặc biệt như thế nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Con mèo máy Doraemon có số đo ba vòng hình thể và cân nặng đặc biệt như thế nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 38, 'Doraemon', 'Doraemon có một đội quân bảo bối mini nhiều màu sắc, rất dễ thương tên là gì?', '["Nano-Dora","Chibi-Cat","Dora-Bots","Mini-Dora"]'::jsonb, 3, 'Mini-Dora là những chú robot mèo nhỏ xíu với túi thần kỳ mini phát ra tiếng kêu ''Dora-ra''.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Doraemon có một đội quân bảo bối mini nhiều màu sắc, rất dễ thương tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Doraemon có một đội quân bảo bối mini nhiều màu sắc, rất dễ thương tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 39, 'Doraemon', 'Bảo bối ''Hơi gas phóng đại'' hoặc ''Hơi gas tưởng tượng'' có công dụng gì?', '["Thổi bay kẻ thù lên mây","Tạo ra khói độc mê ngủ","Biến những điều tưởng tượng thành thực thể tạm thời","Làm thay đổi trọng lượng"]'::jsonb, 2, 'Khí gas tưởng tượng giúp hiện thực hóa những hình tượng người dùng suy nghĩ trong đầu.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối ''Hơi gas phóng đại'' hoặc ''Hơi gas tưởng tượng'' có công dụng gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối ''Hơi gas phóng đại'' hoặc ''Hơi gas tưởng tượng'' có công dụng gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  4, 40, 'Doraemon', 'Nobita sinh vào ngày tháng nào?', '["03/09","07/08","01/01","12/05"]'::jsonb, 1, 'Nobita sinh vào ngày 7 tháng 8 năm 1964 trong nguyên tác truyện tranh.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nobita sinh vào ngày tháng nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Nobita sinh vào ngày tháng nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 41, 'Doraemon', 'Chiếc chuông vàng trên cổ của Doraemon ban đầu có chức năng gốc là gì trước khi bị hỏng?', '["Máy phát sóng triệu hồi mèo lân cận","Máy ghi âm giọng nói","Bộ đàm tương lai","Đèn pin khẩn cấp"]'::jsonb, 0, 'Chiếc chuông vàng trên cổ vốn là máy triệu hồi mèo quanh khu vực, nhưng về sau bị hỏng trở thành vật trang trí và kỷ niệm tình bạn với Nobita.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiếc chuông vàng trên cổ của Doraemon ban đầu có chức năng gốc là gì trước khi bị hỏng?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Chiếc chuông vàng trên cổ của Doraemon ban đầu có chức năng gốc là gì trước khi bị hỏng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 42, 'Doraemon', 'Bảo bối ''Thuốc viên nói dối'' (Usotsuki) giúp người uống đạt được điều gì?', '["Xóa trí nhớ người đối diện","Người uống chỉ nói được sự thật","Biến người nghe thành đá","Bất kỳ lời nói dối nào thốt ra cũng sẽ trở thành sự thật đối với người nghe"]'::jsonb, 3, 'Khi uống thuốc nói dối (hoặc dùng thuốc biến lời nói dối thành thật), mọi điều nói dối sẽ xoay chuyển hiện thực.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối ''Thuốc viên nói dối'' (Usotsuki) giúp người uống đạt được điều gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối ''Thuốc viên nói dối'' (Usotsuki) giúp người uống đạt được điều gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 43, 'Doraemon', 'Trong Doraemon, bảo bối nào giúp người dùng nói và hiểu được ngôn ngữ của mọi loài động vật?', '["Bánh quy biến hình","Kẹo dẻo phiên dịch","Bánh mì chuyển ngữ","Ống nghe tâm tình"]'::jsonb, 2, 'Bánh mì chuyển ngữ không chỉ dịch tiếng nước ngoài mà còn giúp hiểu được ngôn ngữ giao tiếp trong nhiều tập truyện.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Doraemon, bảo bối nào giúp người dùng nói và hiểu được ngôn ngữ của mọi loài động vật?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong Doraemon, bảo bối nào giúp người dùng nói và hiểu được ngôn ngữ của mọi loài động vật?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 44, 'Doraemon', 'Tên chú chó cưng của cô bạn Shizuka trong bộ truyện Doraemon là gì?', '["Peko","Pero","Pochi","Muku"]'::jsonb, 1, 'Pero là chú chó gắn bó với Shizuka từ nhỏ và từng được Doraemon cứu sống.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên chú chó cưng của cô bạn Shizuka trong bộ truyện Doraemon là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Tên chú chó cưng của cô bạn Shizuka trong bộ truyện Doraemon là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 45, 'Doraemon', 'Chú mèo hoang hay bắt nạt chó mèo trong khu phố nhà Nobita tên là gì?', '["Muku","Kuro","Bư (Bell)","Chibi"]'::jsonb, 0, 'Muku là chú chó của Jaian, còn chú mèo hoang dữ tợn trong khu phố thường đối đầu với Doraemon.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú mèo hoang hay bắt nạt chó mèo trong khu phố nhà Nobita tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Chú mèo hoang hay bắt nạt chó mèo trong khu phố nhà Nobita tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 46, 'Doraemon', 'Bảo bối nào giúp Nobita có thể bơi lội ngay trong lòng đất như bơi dưới nước?', '["Kem bơi trong đất","Quần bơi xuyên thấu","Thuốc viên lặn đất","Phao bơi lòng đất"]'::jsonb, 3, 'Phao bơi lòng đất và bột bơi lội giúp bơi dưới mặt đất dễ dàng như trong bể bơi.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp Nobita có thể bơi lội ngay trong lòng đất như bơi dưới nước?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Bảo bối nào giúp Nobita có thể bơi lội ngay trong lòng đất như bơi dưới nước?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 47, 'Doraemon', 'Trong tập truyện dài ''Nobita và mê cung thiếc'', khách sạn trên đảo hoang có tên là gì?', '["Khách sạn Không Người","Khách sạn Hoàng Gia","Khách sạn Brikin (Thiếc)","Khách sạn Tương Lai"]'::jsonb, 2, 'Khách sạn Brikin (Brikin Hotel) được điều hành hoàn toàn bởi các robot bằng thiếc.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tập truyện dài ''Nobita và mê cung thiếc'', khách sạn trên đảo hoang có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Trong tập truyện dài ''Nobita và mê cung thiếc'', khách sạn trên đảo hoang có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 48, 'Doraemon', 'Bảo bối ''Khăn trùm thời gian'' có hai mặt màu gì để điều khiển thời gian tiến hoặc lùi?', '["Trắng và Đen","Đỏ và Xanh","Vàng và Tím","Hồng và Lục"]'::jsonb, 1, 'Khăn trùm thời gian có một mặt màu đỏ và một mặt màu xanh (hoặc đen) với họa tiết đồng hồ.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối ''Khăn trùm thời gian'' có hai mặt màu gì để điều khiển thời gian tiến hoặc lùi?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối ''Khăn trùm thời gian'' có hai mặt màu gì để điều khiển thời gian tiến hoặc lùi?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 49, 'Doraemon', 'Mẹ của Suneo thường bắt cậu đi học thêm những môn năng khiếu nào?', '["Tiếng Pháp và Violon","Võ thuật và Bơi lội","Cờ vây và Thư pháp","Bóng chày và Đấu kiếm"]'::jsonb, 0, 'Mẹ Suneo rất chuộng phong cách quý tộc nên thường bắt cậu học thêm tiếng Pháp, hội họa và âm nhạc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg/330px-Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Mẹ của Suneo thường bắt cậu đi học thêm những môn năng khiếu nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg/330px-Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg' WHERE lower(trim(prompt)) = lower('Mẹ của Suneo thường bắt cậu đi học thêm những môn năng khiếu nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  5, 50, 'Doraemon', 'Ai là tác giả của bộ truyện tranh nổi tiếng ''Con ma Q-Taro'' cùng cha đẻ với Doraemon?', '["Eiichiro Oda","Osamu Tezuka","Akira Toriyama","Fujiko F. Fujio"]'::jsonb, 3, 'Bộ đôi họa sĩ Fujiko Fujio là tác giả của cả Doraemon và Con ma Q-Taro.',
  'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là tác giả của bộ truyện tranh nổi tiếng ''Con ma Q-Taro'' cùng cha đẻ với Doraemon?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg' WHERE lower(trim(prompt)) = lower('Ai là tác giả của bộ truyện tranh nổi tiếng ''Con ma Q-Taro'' cùng cha đẻ với Doraemon?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 51, 'Doraemon', 'Khi Doraemon bị chuột gặm mất đôi tai ở thế kỷ 22, lớp sơn màu vàng bị tróc ra khiến cậu chuyển sang màu gì?', '["Màu hồng","Màu trắng","Màu xanh lam","Màu tím"]'::jsonb, 2, 'Vì khóc suốt 3 ngày 3 đêm nên lớp sơn vàng tróc hết, lộ ra màu xanh lam đặc trưng của Doraemon.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Khi Doraemon bị chuột gặm mất đôi tai ở thế kỷ 22, lớp sơn màu vàng bị tróc ra khiến cậu chuyển sang màu gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Khi Doraemon bị chuột gặm mất đôi tai ở thế kỷ 22, lớp sơn màu vàng bị tróc ra khiến cậu chuyển sang màu gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 52, 'Doraemon', 'Bảo bối nào của Doraemon phát ra sóng âm khiến mọi người xung quanh phải nhảy múa theo nhạc?', '["Micro hát hay","Giày khiêu vũ tự động","Loa thôi miên","Kèn điều khiển"]'::jsonb, 1, 'Đôi giày khiêu vũ hoặc các bảo bối âm nhạc của Doraemon thường tạo ra tình huống dở khóc dở cười.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon phát ra sóng âm khiến mọi người xung quanh phải nhảy múa theo nhạc?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối nào của Doraemon phát ra sóng âm khiến mọi người xung quanh phải nhảy múa theo nhạc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 53, 'Conan – Thám tử lừng danh', 'Tên thật của Conan Edogawa trước khi bị teo nhỏ là gì?', '["Saguru Hakuba","Heiji Hattori","Kaito Kuroba","Shinichi Kudo"]'::jsonb, 3, 'Shinichi Kudo là thám tử học sinh nổi tiếng trường cấp ba Teitan trước khi bị Tổ chức Áo Đen ép uống thuốc độc.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên thật của Conan Edogawa trước khi bị teo nhỏ là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Tên thật của Conan Edogawa trước khi bị teo nhỏ là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 54, 'Conan – Thám tử lừng danh', 'Tên loại độc dược mà Tổ chức Áo Đen đã ép Shinichi Kudo uống tại công viên miền nhiệt đới là gì?', '["Cyanide 007","VX Gas","APTX 4869","BTX 9981"]'::jsonb, 2, 'APTX 4869 (Apotoxin 4869) do Shiho Miyano phát triển đã kích hoạt phản ứng tự phân rỉ tế bào và làm Shinichi bị teo nhỏ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên loại độc dược mà Tổ chức Áo Đen đã ép Shinichi Kudo uống tại công viên miền nhiệt đới là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Tên loại độc dược mà Tổ chức Áo Đen đã ép Shinichi Kudo uống tại công viên miền nhiệt đới là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 55, 'Conan – Thám tử lừng danh', 'Ai là người chế tạo nơ biến đổi giọng nói, giày tăng lực và đồng hồ bắn kim gây mê cho Conan?', '["Thám tử Kogoro Mori","Tiến sĩ Hiroshi Agasa","Bố của Shinichi - Yusaku Kudo","Cảnh sát trưởng Megure"]'::jsonb, 1, 'Tiến sĩ Agasa là nhà phát minh thiên tài sống cạnh nhà Shinichi và là người đầu tiên biết bí mật của cậu.',
  'https://upload.wikimedia.org/wikipedia/en/5/55/Shinichi_Kudo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là người chế tạo nơ biến đổi giọng nói, giày tăng lực và đồng hồ bắn kim gây mê cho Conan?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/55/Shinichi_Kudo.png' WHERE lower(trim(prompt)) = lower('Ai là người chế tạo nơ biến đổi giọng nói, giày tăng lực và đồng hồ bắn kim gây mê cho Conan?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 56, 'Conan – Thám tử lừng danh', 'Hai thành viên cốt cán của Tổ chức Áo Đen đã tấn công và cho Shinichi uống thuốc độc tên là gì?', '["Gin và Vodka","Bourbon và Rye","Vermouth và Chianti","Korn và Tequila"]'::jsonb, 0, 'Gin và Vodka là hai kẻ đã đánh lén và ép Shinichi uống viên thuốc độc APTX 4869.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hai thành viên cốt cán của Tổ chức Áo Đen đã tấn công và cho Shinichi uống thuốc độc tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Hai thành viên cốt cán của Tổ chức Áo Đen đã tấn công và cho Shinichi uống thuốc độc tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 57, 'Conan – Thám tử lừng danh', 'Tên mã của cô gái Shiho Miyano (Ai Haibara) trong Tổ chức Áo Đen là gì?', '["Chianti","Vermouth","Kir","Sherry"]'::jsonb, 3, 'Shiho Miyano mang mật danh Sherry khi làm nhà khoa học nghiên cứu thuốc cho Tổ chức Áo Đen.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên mã của cô gái Shiho Miyano (Ai Haibara) trong Tổ chức Áo Đen là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Tên mã của cô gái Shiho Miyano (Ai Haibara) trong Tổ chức Áo Đen là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 58, 'Conan – Thám tử lừng danh', 'Ai Haibara cùng tiến sĩ Agasa và Conan hỗ trợ một nhóm bạn cùng lớp tên là gì?', '["Hội học sinh cấp 1","Biệt đội Teitan","Đội thám tử nhí Lớp 1B (Detective Boys)","Nhóm phá án Tokyo"]'::jsonb, 2, 'Đội thám tử nhí gồm có Conan, Haibara, Ayumi, Mitsuhiko và Genta.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai Haibara cùng tiến sĩ Agasa và Conan hỗ trợ một nhóm bạn cùng lớp tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Ai Haibara cùng tiến sĩ Agasa và Conan hỗ trợ một nhóm bạn cùng lớp tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 59, 'Conan – Thám tử lừng danh', 'Thám tử tư Kogoro Mori có biệt danh nổi tiếng trong giới điều tra là gì nhờ sự trợ giúp của Conan?', '["Mori ''tia chớp''","Mori ''ngủ gật''","Mori ''thần sầu''","Mori ''thiên tài''"]'::jsonb, 1, 'Biệt danh ''Mori ngủ gật'' bắt nguồn từ việc Conan dùng đồng hồ bắn thuốc mê rồi dùng nơ đổi giọng để phá án.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thám tử tư Kogoro Mori có biệt danh nổi tiếng trong giới điều tra là gì nhờ sự trợ giúp của Conan?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Thám tử tư Kogoro Mori có biệt danh nổi tiếng trong giới điều tra là gì nhờ sự trợ giúp của Conan?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  6, 60, 'Conan – Thám tử lừng danh', 'Môn võ sở trường mà cô bạn thanh mai trúc mã Ran Mori sử dụng điêu luyện là môn võ nào?', '["Karate","Taekwondo","Judo","Aikido"]'::jsonb, 0, 'Ran Mori là đội trưởng câu lạc bộ Karate trường Teitan và từng đoạt chức vô địch khu vực Kanto.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Môn võ sở trường mà cô bạn thanh mai trúc mã Ran Mori sử dụng điêu luyện là môn võ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg' WHERE lower(trim(prompt)) = lower('Môn võ sở trường mà cô bạn thanh mai trúc mã Ran Mori sử dụng điêu luyện là môn võ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 61, 'Conan – Thám tử lừng danh', 'Chàng thám tử miền Tây với làn da ngăm đen, bạn thân và kỳ phùng địch thủ của Shinichi là ai?', '["Eisuke Hondo","Saguru Hakuba","Makoto Kyogoku","Heiji Hattori"]'::jsonb, 3, 'Heiji Hattori là thám tử học sinh nổi tiếng ở Osaka, con trai của cảnh sát trưởng Heizo Hattori.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chàng thám tử miền Tây với làn da ngăm đen, bạn thân và kỳ phùng địch thủ của Shinichi là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg' WHERE lower(trim(prompt)) = lower('Chàng thám tử miền Tây với làn da ngăm đen, bạn thân và kỳ phùng địch thủ của Shinichi là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 62, 'Conan – Thám tử lừng danh', 'Tên thật của siêu trộm hào hoa Kaito Kid là gì?', '["Toichi Kuroba","Shinichi Kudo","Kaito Kuroba","Jirokichi Suzuki"]'::jsonb, 2, 'Kaito Kuroba là học sinh cấp ba, kế nghiệp danh hiệu Siêu đạo chích 1412 (Kaito Kid) từ người cha Toichi Kuroba.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên thật của siêu trộm hào hoa Kaito Kid là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Tên thật của siêu trộm hào hoa Kaito Kid là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 63, 'Conan – Thám tử lừng danh', 'Thành viên bí ẩn của Tổ chức Áo Đen mang mật danh Vermouth có nghề nghiệp công khai là gì?', '["Người mẫu thời trang Paris","Đại minh tinh Hollywood (Chris Vineyard)","Nữ phóng viên truyền hình","Bác sĩ pháp y"]'::jsonb, 1, 'Vermouth là nữ diễn viên tài năng Sharon Vineyard (và sau này đội lốt con gái Chris Vineyard) với tài cải trang siêu đẳng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành viên bí ẩn của Tổ chức Áo Đen mang mật danh Vermouth có nghề nghiệp công khai là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Thành viên bí ẩn của Tổ chức Áo Đen mang mật danh Vermouth có nghề nghiệp công khai là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 64, 'Conan – Thám tử lừng danh', 'Câu châm ngôn nổi tiếng của Vermouth khi nói về sự huyền bí là gì?', '["A secret makes a woman woman","Truth is always one","Time waits for no one","Justice will prevail"]'::jsonb, 0, 'Câu nói kinh điển của Vermouth: ''A secret makes a woman woman'' (Bí mật làm nên sự quyến rũ của người phụ nữ).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu châm ngôn nổi tiếng của Vermouth khi nói về sự huyền bí là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Câu châm ngôn nổi tiếng của Vermouth khi nói về sự huyền bí là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 65, 'Conan – Thám tử lừng danh', 'Đặc vụ FBI cừ khôi mang mật danh Rye khi trà trộn vào Áo Đen là ai?', '["James Black","Rei Furuya","Andre Camel","Shuichi Akai"]'::jsonb, 3, 'Shuichi Akai là tay bắn tỉa cự phách của FBI, có mật danh Rye trong thời gian nằm vùng ở Tổ chức Áo Đen.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đặc vụ FBI cừ khôi mang mật danh Rye khi trà trộn vào Áo Đen là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Đặc vụ FBI cừ khôi mang mật danh Rye khi trà trộn vào Áo Đen là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 66, 'Conan – Thám tử lừng danh', 'Thân phận ngầm thật sự của anh chàng phục vụ điển trai Toru Amuro (Bourbon) tại quán cà phê Poirot là gì?', '["Thám tử độc lập","Đặc vụ CIA Mỹ","Sĩ quan Cục An ninh Cảnh sát Quốc gia Nhật Bản (Rei Furuya)","Kẻ cướp ngân hàng"]'::jsonb, 2, 'Toru Amuro có tên thật là Rei Furuya (Zero), đặc vụ ngầm của Cảnh sát An ninh Quốc gia Nhật Bản (NPA).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thân phận ngầm thật sự của anh chàng phục vụ điển trai Toru Amuro (Bourbon) tại quán cà phê Poirot là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Thân phận ngầm thật sự của anh chàng phục vụ điển trai Toru Amuro (Bourbon) tại quán cà phê Poirot là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 67, 'Conan – Thám tử lừng danh', 'Bố và mẹ của Shinichi Kudo lần lượt là ai?', '["Kogoro Mori và Eri Kisaki","Nhà văn trinh thám Yusaku Kudo và cựu minh tinh Yukiko Kudo","Tiến sĩ Agasa và Fusae Campbell","Heizo Hattori và Shizuka Hattori"]'::jsonb, 1, 'Bố Shinichi là đại văn hào trinh thám thế giới Yusaku Kudo, mẹ là đại mỹ nhân diễn viên Yukiko Kudo.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bố và mẹ của Shinichi Kudo lần lượt là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg' WHERE lower(trim(prompt)) = lower('Bố và mẹ của Shinichi Kudo lần lượt là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 68, 'Conan – Thám tử lừng danh', 'Vụ án bi kịch kinh điển nào diễn ra trên đảo Tsukikage có liên quan đến bản sonata piano nổi tiếng?', '["Bản giao hưởng Ánh Trăng (Moonlight Sonata)","Bản giao hưởng Định Mệnh","Khúc ca Khải Hoàn","Hành khúc Thổ Nhĩ Kỳ"]'::jsonb, 0, 'Vụ án Bản giao hưởng Ánh Trăng (Moonlight Sonata) do Seiji Aso thực hiện là vụ án duy nhất Conan không cứu được hung thủ khỏi tự sát.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/11/Beethoven_Piano_Sonata_14_-_title_page_1802.jpg/330px-Beethoven_Piano_Sonata_14_-_title_page_1802.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vụ án bi kịch kinh điển nào diễn ra trên đảo Tsukikage có liên quan đến bản sonata piano nổi tiếng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/11/Beethoven_Piano_Sonata_14_-_title_page_1802.jpg/330px-Beethoven_Piano_Sonata_14_-_title_page_1802.jpg' WHERE lower(trim(prompt)) = lower('Vụ án bi kịch kinh điển nào diễn ra trên đảo Tsukikage có liên quan đến bản sonata piano nổi tiếng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 69, 'Conan – Thám tử lừng danh', 'Ai là nhân vật được mệnh danh là ''Công chúa Judo'' và là một nữ luật sư bất bại tại tòa án?', '["Kazuha Toyama","Yukiko Kudo","Yoko Okino","Eri Kisaki (mẹ của Ran)"]'::jsonb, 3, 'Eri Kisaki là mẹ Ran, nữ luật sư tài ba với tỷ lệ thắng kiện 100% và sở hữu ngón đòn Judo quật ngã mọi đối thủ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là nhân vật được mệnh danh là ''Công chúa Judo'' và là một nữ luật sư bất bại tại tòa án?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg' WHERE lower(trim(prompt)) = lower('Ai là nhân vật được mệnh danh là ''Công chúa Judo'' và là một nữ luật sư bất bại tại tòa án?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  7, 70, 'Conan – Thám tử lừng danh', 'Nữ ca sĩ thần tượng nổi tiếng mà thám tử Mori hâm mộ cuồng nhiệt là ai?', '["Reiko Akiba","Two-Mix","Yoko Okino","Minako"]'::jsonb, 2, 'Yoko Okino là ngôi sao ca nhạc mà ông bác Mori say mê và luôn theo dõi mọi chương trình truyền hình có cô.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ thần tượng nổi tiếng mà thám tử Mori hâm mộ cuồng nhiệt là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ thần tượng nổi tiếng mà thám tử Mori hâm mộ cuồng nhiệt là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 71, 'Conan – Thám tử lừng danh', 'Chàng trai ''đệ nhất cao thủ Karate'' toàn quốc, bạn trai của cô nàng tiểu thư Sonoko Suzuki là ai?', '["Heiji Hattori","Makoto Kyogoku","Shinichi Kudo","Wataru Takagi"]'::jsonb, 1, 'Makoto Kyogoku là võ sĩ Karate vô địch với chuỗi hơn 400 trận bất bại, rất mực yêu thương Sonoko.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chàng trai ''đệ nhất cao thủ Karate'' toàn quốc, bạn trai của cô nàng tiểu thư Sonoko Suzuki là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg' WHERE lower(trim(prompt)) = lower('Chàng trai ''đệ nhất cao thủ Karate'' toàn quốc, bạn trai của cô nàng tiểu thư Sonoko Suzuki là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 72, 'Conan – Thám tử lừng danh', 'Nữ thanh tra xinh đẹp của Sở Cảnh sát Tokyo, người yêu của trung sĩ Takagi là ai?', '["Miwako Sato","Yumi Miyamoto","Naeko Miike","Jodie Starling"]'::jsonb, 0, 'Miwako Sato là hoa khôi của Sở Cảnh sát Tokyo, tài giỏi, dũng cảm và lái xe siêu đẳng.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ thanh tra xinh đẹp của Sở Cảnh sát Tokyo, người yêu của trung sĩ Takagi là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Nữ thanh tra xinh đẹp của Sở Cảnh sát Tokyo, người yêu của trung sĩ Takagi là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 73, 'Conan – Thám tử lừng danh', 'Nhìn vào ảnh và cho biết đây là chiếc xe hơi cổ màu đen biểu tượng của nhân vật nguy hiểm nào trong Áo Đen?', '["Mazda RX-7 của Amuro","Volkswagen Bọ hung của Agasa","Subaru 360 của Okiya","Porsche 356A của Gin"]'::jsonb, 3, 'Chiếc xe Porsche 356A cổ điển màu đen là phương tiện di chuyển bất hủ của kẻ đứng đầu hành động - Gin.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Porsche_356_A_Coup%C3%A9_1958_frontleft_2009-03-29_A.jpg/640px-Porsche_356_A_Coup%C3%A9_1958_frontleft_2009-03-29_A.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là chiếc xe hơi cổ màu đen biểu tượng của nhân vật nguy hiểm nào trong Áo Đen?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Porsche_356_A_Coup%C3%A9_1958_frontleft_2009-03-29_A.jpg/640px-Porsche_356_A_Coup%C3%A9_1958_frontleft_2009-03-29_A.jpg' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là chiếc xe hơi cổ màu đen biểu tượng của nhân vật nguy hiểm nào trong Áo Đen?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 74, 'Conan – Thám tử lừng danh', 'Nữ phát thanh viên kiêm đặc vụ CIA nằm vùng trong Tổ chức Áo Đen với mật danh Kir có tên thật là gì?', '["Shiho Miyano","Jodie Starling","Hidemi Hondo (Rena Mizunashi)","Sharon Vineyard"]'::jsonb, 2, 'Hidemi Hondo là điệp viên CIA với vỏ bọc MC truyền hình Rena Mizunashi và mật danh Kir trong Áo Đen.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ phát thanh viên kiêm đặc vụ CIA nằm vùng trong Tổ chức Áo Đen với mật danh Kir có tên thật là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ phát thanh viên kiêm đặc vụ CIA nằm vùng trong Tổ chức Áo Đen với mật danh Kir có tên thật là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 75, 'Conan – Thám tử lừng danh', 'Kaito Kid thường gửi thứ gì đến cho nạn nhân trước khi thực hiện vụ trộm bảo vật?', '["Một cành hoa hồng đỏ","Một lá thư thông báo thời gian và mật mã (Thư báo trước)","Một quân bài Joker rách","Một cuộc gọi đe dọa"]'::jsonb, 1, 'Kaito Kid luôn gửi thư thông báo trước (Heist notice) đố chữ về thời gian và địa điểm ra tay như một lời thách thức.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kaito Kid thường gửi thứ gì đến cho nạn nhân trước khi thực hiện vụ trộm bảo vật?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Kaito Kid thường gửi thứ gì đến cho nạn nhân trước khi thực hiện vụ trộm bảo vật?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 76, 'Conan – Thám tử lừng danh', 'Giai điệu phím số khi bấm vào số điện thoại của ''Ông Trùm'' Tổ chức Áo Đen tương ứng với bài hát thiếu nhi nào?', '["Bảy chú quạ con (Nanatsu no Ko)","Chú ếch con","Kira Kira Hikaru","Bướm vàng mùa xuân"]'::jsonb, 0, 'Giai điệu âm bàn phím số dẫn đến số điện thoại của Boss chính là bài hát thiếu nhi quen thuộc Nanatsu no Ko (#969#6261).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Giai điệu phím số khi bấm vào số điện thoại của ''Ông Trùm'' Tổ chức Áo Đen tương ứng với bài hát thiếu nhi nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Giai điệu phím số khi bấm vào số điện thoại của ''Ông Trùm'' Tổ chức Áo Đen tương ứng với bài hát thiếu nhi nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 77, 'Conan – Thám tử lừng danh', 'Nhân vật đứng thứ 2 trong Tổ chức Áo Đen, kẻ thân cận nhất của Ông Trùm mang mật danh là gì?', '["Pisco","Gin","Vodka","Rum"]'::jsonb, 3, 'Rum là nhân vật quyền lực số hai của Áo Đen, có đặc điểm nổi bật là bị chấn thương một bên mắt giả.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhân vật đứng thứ 2 trong Tổ chức Áo Đen, kẻ thân cận nhất của Ông Trùm mang mật danh là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Nhân vật đứng thứ 2 trong Tổ chức Áo Đen, kẻ thân cận nhất của Ông Trùm mang mật danh là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 78, 'Conan – Thám tử lừng danh', 'Tên tác giả truyện tranh sáng tác nên bộ truyện Thám tử lừng danh Conan là ai?', '["Masashi Kishimoto","Naoki Urasawa","Gosho Aoyama","Hajime Isayama"]'::jsonb, 2, 'Gosho Aoyama là mangaka thiên tài người Nhật Bản sáng tạo ra bộ truyện Conan từ năm 1994.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e2/Gosho_Aoyama.jpg/330px-Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên tác giả truyện tranh sáng tác nên bộ truyện Thám tử lừng danh Conan là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e2/Gosho_Aoyama.jpg/330px-Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Tên tác giả truyện tranh sáng tác nên bộ truyện Thám tử lừng danh Conan là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 79, 'Conan – Thám tử lừng danh', 'Thân phận ngụy trang của Shuichi Akai sau khi giả chết tại đèo Raiha là nghiên cứu sinh nào sống tại nhà Kudo?', '["Tomaki Araide","Subaru Okiya","Eisuke Hondo","Chikara Katsumata"]'::jsonb, 1, 'Shuichi Akai đeo kính, mặc áo cổ lọ và cải trang thành anh chàng sinh viên cao học Subaru Okiya nấu cà ri rất ngon.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thân phận ngụy trang của Shuichi Akai sau khi giả chết tại đèo Raiha là nghiên cứu sinh nào sống tại nhà Kudo?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Thân phận ngụy trang của Shuichi Akai sau khi giả chết tại đèo Raiha là nghiên cứu sinh nào sống tại nhà Kudo?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  8, 80, 'Conan – Thám tử lừng danh', 'Cậu bạn Mitsuhiko trong Đội thám tử nhí có đặc điểm tính cách nổi bật nào?', '["Lịch sự, thông minh, logic và xưng hô chuẩn mực","Ham ăn cơm lươn, nóng nảy","Ngây thơ, luôn muốn làm cô dâu","Nhút nhát nhất trường"]'::jsonb, 0, 'Mitsuhiko Tsuburaya có tư duy khoa học, am hiểu lịch sử địa lý và luôn dùng kính ngữ lễ phép.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tokyo_Chikuyotei_Unadon01s2100.jpg/330px-Tokyo_Chikuyotei_Unadon01s2100.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cậu bạn Mitsuhiko trong Đội thám tử nhí có đặc điểm tính cách nổi bật nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tokyo_Chikuyotei_Unadon01s2100.jpg/330px-Tokyo_Chikuyotei_Unadon01s2100.jpg' WHERE lower(trim(prompt)) = lower('Cậu bạn Mitsuhiko trong Đội thám tử nhí có đặc điểm tính cách nổi bật nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 81, 'Conan – Thám tử lừng danh', 'Món ăn yêu thích số một của cậu bé béo ú Genta Kojima là món gì?', '["Thịt bò Kobe nướng","Bánh pizza xúc xích","Mì Ramen tôm hùm","Cơm lươn nướng (Unajyu)"]'::jsonb, 3, 'Genta luôn quy đổi giá trị mọi đồ vật và tiền bạc ra thành bao nhiêu bát cơm lươn nướng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tokyo_Chikuyotei_Unadon01s2100.jpg/330px-Tokyo_Chikuyotei_Unadon01s2100.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Món ăn yêu thích số một của cậu bé béo ú Genta Kojima là món gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e7/Tokyo_Chikuyotei_Unadon01s2100.jpg/330px-Tokyo_Chikuyotei_Unadon01s2100.jpg' WHERE lower(trim(prompt)) = lower('Món ăn yêu thích số một của cậu bé béo ú Genta Kojima là món gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 82, 'Conan – Thám tử lừng danh', 'Người cảnh sát trưởng mập mạp, tốt bụng luôn đội mũ phớt màu cam của Sở Cảnh sát Tokyo là ai?', '["Trung sĩ Takagi","Thanh tra Shiratori","Thanh tra Juzo Megure","Thanh tra Chiba"]'::jsonb, 2, 'Thanh tra Megure luôn đội chiếc mũ phớt để che đi vết sẹo kỷ niệm thời trẻ cùng người vợ Midori.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người cảnh sát trưởng mập mạp, tốt bụng luôn đội mũ phớt màu cam của Sở Cảnh sát Tokyo là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Người cảnh sát trưởng mập mạp, tốt bụng luôn đội mũ phớt màu cam của Sở Cảnh sát Tokyo là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 83, 'Conan – Thám tử lừng danh', 'Cô bạn thân từ thuở nhỏ và là người thầm thương trộm nhớ chàng thám tử Heiji Hattori là ai?', '["Momiji Ooka","Kazuha Toyama","Ran Mori","Sonoko Suzuki"]'::jsonb, 1, 'Kazuha Toyama là con gái của Cảnh sát trưởng Toyama, rất giỏi võ Aikido và mang chiếc bùa hộ mệnh bên mình.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cô bạn thân từ thuở nhỏ và là người thầm thương trộm nhớ chàng thám tử Heiji Hattori là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanashiro_Chomo.jpg/330px-Hanashiro_Chomo.jpg' WHERE lower(trim(prompt)) = lower('Cô bạn thân từ thuở nhỏ và là người thầm thương trộm nhớ chàng thám tử Heiji Hattori là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 84, 'Conan – Thám tử lừng danh', 'Nữ cao thủ bài Karuta giàu có ở Kyoto luôn tự nhận mình là hôn thê của Heiji Hattori là ai?', '["Momiji Ooka","Kazuha Toyama","Ayumi Yoshida","Yoko Okino"]'::jsonb, 0, 'Ooka Momiji là tiểu thư danh gia vọng tộc ở vùng Kansai, luôn tìm cơ hội để Heiji cầu hôn mình.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ca/Osaka_Castle_03bs3200.jpg/330px-Osaka_Castle_03bs3200.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ cao thủ bài Karuta giàu có ở Kyoto luôn tự nhận mình là hôn thê của Heiji Hattori là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ca/Osaka_Castle_03bs3200.jpg/330px-Osaka_Castle_03bs3200.jpg' WHERE lower(trim(prompt)) = lower('Nữ cao thủ bài Karuta giàu có ở Kyoto luôn tự nhận mình là hôn thê của Heiji Hattori là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 85, 'Conan – Thám tử lừng danh', 'Chất kịch độc có mùi hạnh nhân đắng thường xuyên xuất hiện làm hung khí đầu độc trong các vụ án Conan là gì?', '["Botulinum","Asen (Thạch tín)","Strychnine","Xyanua (Cyanide / Kali Xyanua)"]'::jsonb, 3, 'Chất độc Kali Xyanua (Potassium Cyanide) làm ngạt tế bào tức thì và để lại mùi hạnh nhân thoang thoảng ở miệng nạn nhân.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chất kịch độc có mùi hạnh nhân đắng thường xuyên xuất hiện làm hung khí đầu độc trong các vụ án Conan là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Chất kịch độc có mùi hạnh nhân đắng thường xuyên xuất hiện làm hung khí đầu độc trong các vụ án Conan là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 86, 'Conan – Thám tử lừng danh', 'Trong tập phim điện ảnh ''Chuyến tàu bí ẩn màu đen'' (Jet-Black Mystery Train), ai đã đóng giả Shiho Miyano trong toa tàu phát nổ?', '["Vermouth","Yukiko Kudo","Kaito Kid","Shuichi Akai"]'::jsonb, 2, 'Kaito Kid vì bị Conan gài bẫy phải giúp đỡ nên đã cải trang thành Shiho và bay thoát hiểm bằng dù lượn khi toa tàu nổ.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tập phim điện ảnh ''Chuyến tàu bí ẩn màu đen'' (Jet-Black Mystery Train), ai đã đóng giả Shiho Miyano trong toa tàu phát nổ?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Trong tập phim điện ảnh ''Chuyến tàu bí ẩn màu đen'' (Jet-Black Mystery Train), ai đã đóng giả Shiho Miyano trong toa tàu phát nổ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 87, 'Conan – Thám tử lừng danh', 'Tên viên cảnh sát dũng cảm đã hy sinh trên vòng đu quay Haido để gửi lại tin nhắn định vị quả bom cuối cùng là ai?', '["Kenji Hagiwara","Jinpei Matsuda","Wataru Date","Hiromitsu Morofushi"]'::jsonb, 1, 'Jinpei Matsuda là chiến sĩ xử lý bom mìn tài ba, người đã hy sinh anh dũng và để lại vết thương lòng sâu sắc cho thiếu úy Sato.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên viên cảnh sát dũng cảm đã hy sinh trên vòng đu quay Haido để gửi lại tin nhắn định vị quả bom cuối cùng là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Tên viên cảnh sát dũng cảm đã hy sinh trên vòng đu quay Haido để gửi lại tin nhắn định vị quả bom cuối cùng là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 88, 'Conan – Thám tử lừng danh', 'Mối tình đầu thuở thiếu thời dưới cây rẻ quạt của Tiến sĩ Agasa tên là gì?', '["Fusae Campbell (nhà thiết kế thương hiệu lá bạch quả)","Yukiko Kudo","Eri Kisaki","Chiyo"]'::jsonb, 0, 'Fusae Campbell là cô bé lai tóc vàng từng tự ti về mái tóc, sau này trở thành bà chủ thương hiệu thời trang hình lá rẻ quạt nổi tiếng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Mối tình đầu thuở thiếu thời dưới cây rẻ quạt của Tiến sĩ Agasa tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/330px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg' WHERE lower(trim(prompt)) = lower('Mối tình đầu thuở thiếu thời dưới cây rẻ quạt của Tiến sĩ Agasa tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 89, 'Conan – Thám tử lừng danh', 'Người thám tử học sinh từ nước Anh trở về, luôn coi Kaito Kid là đối thủ số một của mình là ai?', '["Makoto Kyogoku","Heiji Hattori","Shinichi Kudo","Saguru Hakuba"]'::jsonb, 3, 'Saguru Hakuba là con trai của Tổng thanh tra Cảnh sát Tokyo, từng học ở London và luôn dùng đồng hồ bỏ túi bấm giây.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người thám tử học sinh từ nước Anh trở về, luôn coi Kaito Kid là đối thủ số một của mình là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Người thám tử học sinh từ nước Anh trở về, luôn coi Kaito Kid là đối thủ số một của mình là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  9, 90, 'Conan – Thám tử lừng danh', 'Tổ chức Áo Đen dùng quy tắc nào để đặt mật danh (codenames) cho các thành viên chính thức?', '["Tên các loại độc thảo","Tên các chòm sao trên trời","Tên các loại rượu ngoại quốc","Tên các vị thần thần thoại"]'::jsonb, 2, 'Nam giới được đặt theo rượu mạnh (Gin, Vodka, Bourbon, Rye, Tequila), nữ giới đặt theo rượu vang hoặc rượu mùi (Vermouth, Sherry, Chianti, Kir).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tổ chức Áo Đen dùng quy tắc nào để đặt mật danh (codenames) cho các thành viên chính thức?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Tổ chức Áo Đen dùng quy tắc nào để đặt mật danh (codenames) cho các thành viên chính thức?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 91, 'Conan – Thám tử lừng danh', 'Tên loại rượu thuốc Trung Quốc mà Conan uống thử lần đầu và bất ngờ biến lại thành Shinichi trong chốc lát là gì?', '["Rượu Mao Đài","Rượu Bạch Càn (Paikar)","Rượu Nữ Nhi Hồng","Rượu Thiệu Hưng"]'::jsonb, 1, 'Rượu Bạch Càn (Paikar) chứa chất xúc tác làm vô hiệu hóa tạm thời tác dụng phụ của thuốc APTX 4869.',
  'https://upload.wikimedia.org/wikipedia/en/5/55/Shinichi_Kudo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tên loại rượu thuốc Trung Quốc mà Conan uống thử lần đầu và bất ngờ biến lại thành Shinichi trong chốc lát là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/55/Shinichi_Kudo.png' WHERE lower(trim(prompt)) = lower('Tên loại rượu thuốc Trung Quốc mà Conan uống thử lần đầu và bất ngờ biến lại thành Shinichi trong chốc lát là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 92, 'Conan – Thám tử lừng danh', 'Mối quan hệ thân thích thực sự giữa Kaito Kuroba (Kaito Kid) và Shinichi Kudo theo tiết lộ của tác giả là gì?', '["Anh em họ (Bố của hai người là anh em ruột)","Không có quan hệ gì","Anh em cùng cha khác mẹ","Cậu cháu ruột thịt"]'::jsonb, 0, 'Trong Movie 27, tác giả Aoyama xác nhận Toichi Kuroba và Yusaku Kudo là hai anh em sinh đôi, khiến Shinichi và Kaito là anh em họ.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Mối quan hệ thân thích thực sự giữa Kaito Kuroba (Kaito Kid) và Shinichi Kudo theo tiết lộ của tác giả là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Mối quan hệ thân thích thực sự giữa Kaito Kuroba (Kaito Kid) và Shinichi Kudo theo tiết lộ của tác giả là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 93, 'Conan – Thám tử lừng danh', 'Câu nói mở màn huyền thoại trước mỗi tập anime Conan là gì?', '["Bí mật nằm sau những vết máu","Kẻ thủ ác nhất định sẽ đền tội","Ánh sáng công lý sẽ soi rọi bóng đêm","Sự thật luôn chỉ có một! (Shinjitsu wa itsumo hitotsu)"]'::jsonb, 3, 'Khẩu hiệu kinh điển vang bóng hàng chục năm qua của Conan: ''Shinjitsu wa itsumo hitotsu!'' (Sự thật chỉ có một).',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu nói mở màn huyền thoại trước mỗi tập anime Conan là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Câu nói mở màn huyền thoại trước mỗi tập anime Conan là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 94, 'Conan – Thám tử lừng danh', 'Cặp kính của Conan ngoài việc che mắt còn được tích hợp tính năng công nghệ gì từ Tiến sĩ Agasa?', '["Kính hồng ngoại đo nhiệt độ","Kính nhìn xuyên thấu quần áo","Thiết bị radar định vị phát tín hiệu siêu nhỏ","Kính chụp ảnh 3D"]'::jsonb, 2, 'Cặp kính thông minh gắn radar định vị bắt sóng từ các huy hiệu thám tử nhí hoặc các nút dán theo dõi bí mật.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cặp kính của Conan ngoài việc che mắt còn được tích hợp tính năng công nghệ gì từ Tiến sĩ Agasa?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Cặp kính của Conan ngoài việc che mắt còn được tích hợp tính năng công nghệ gì từ Tiến sĩ Agasa?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 95, 'Conan – Thám tử lừng danh', 'Trong Thám tử lừng danh Conan, mật danh của thành viên bắn tỉa Korn và Chianti thuộc tổ chức nào?', '["Cảnh sát Tokyo","Tổ chức Áo Đen","FBI","CIA"]'::jsonb, 1, 'Chianti và Korn là cặp đôi xạ thủ bắn tỉa chuyên nghiệp của Tổ chức Áo Đen.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Thám tử lừng danh Conan, mật danh của thành viên bắn tỉa Korn và Chianti thuộc tổ chức nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Trong Thám tử lừng danh Conan, mật danh của thành viên bắn tỉa Korn và Chianti thuộc tổ chức nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 96, 'Conan – Thám tử lừng danh', 'Cha của Kaito Kid (Kid đời đầu) có tên thật là gì?', '["Toichi Kuroba","Yusaku Kudo","Ginzo Nakamori","Kogoro Mori"]'::jsonb, 0, 'Toichi Kuroba là ảo thuật gia lừng danh thế giới và là Kaito Kid đời đầu tiên.',
  'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cha của Kaito Kid (Kid đời đầu) có tên thật là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg' WHERE lower(trim(prompt)) = lower('Cha của Kaito Kid (Kid đời đầu) có tên thật là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 97, 'Conan – Thám tử lừng danh', 'Ai là người đã dạy kỹ năng hóa trang đỉnh cao cho cả Vermouth và Yukiko Kudo?', '["Heizo Hattori","Tiến sĩ Agasa","Hiroshi Agasa","Toichi Kuroba"]'::jsonb, 3, 'Cả Sharon Vineyard (Vermouth) và Yukiko Kudo đều từng theo học thuật cải trang từ ảo thuật gia Toichi Kuroba.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là người đã dạy kỹ năng hóa trang đỉnh cao cho cả Vermouth và Yukiko Kudo?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Ai là người đã dạy kỹ năng hóa trang đỉnh cao cho cả Vermouth và Yukiko Kudo?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 98, 'Conan – Thám tử lừng danh', 'Thanh tra cảnh sát tỉnh Nagano bị chột một mắt và chống gậy có tên là gì?', '["Yui Uehara","Taka''aki Morofushi","Kansuke Yamato","Sango Yokomizo"]'::jsonb, 2, 'Kansuke Yamato là thanh tra tài ba của sở cảnh sát tỉnh Nagano.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thanh tra cảnh sát tỉnh Nagano bị chột một mắt và chống gậy có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Thanh tra cảnh sát tỉnh Nagano bị chột một mắt và chống gậy có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 99, 'Conan – Thám tử lừng danh', 'Biệt danh ''Khổng Minh'' là tên gọi của thanh tra nào thuộc sở cảnh sát tỉnh Nagano?', '["Kansuke Yamato","Taka''aki Morofushi","Misao Yamamura","Jugo Yokomizo"]'::jsonb, 1, 'Taka''aki Morofushi (anh trai của Scotch/Hiromitsu Morofushi) có tên chữ trùng với Gia Cát Khổng Minh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Biệt danh ''Khổng Minh'' là tên gọi của thanh tra nào thuộc sở cảnh sát tỉnh Nagano?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg' WHERE lower(trim(prompt)) = lower('Biệt danh ''Khổng Minh'' là tên gọi của thanh tra nào thuộc sở cảnh sát tỉnh Nagano?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  10, 100, 'Conan – Thám tử lừng danh', 'Em trai của Akai Shuichi là một kỳ thủ cờ Shogi chuyên nghiệp tên là gì?', '["Shukichi Haneda","Masumi Sera","Rei Furuya","Wataru Takagi"]'::jsonb, 0, 'Shukichi Haneda là người con thứ hai trong gia đình Akai và là kỳ thủ Shogi sở hữu 7 danh hiệu.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Em trai của Akai Shuichi là một kỳ thủ cờ Shogi chuyên nghiệp tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Em trai của Akai Shuichi là một kỳ thủ cờ Shogi chuyên nghiệp tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 101, 'Conan – Thám tử lừng danh', 'Mẹ của Akai Shuichi và Sera Masumi bị teo nhỏ có biệt danh là gì?', '["Rumi Wakasa","Elena Miyano","Jodie Starling","Mary Sera (Em gái ngoài lãnh địa)"]'::jsonb, 3, 'Bà Mary Sera cũng bị ép uống thuốc độc APTX 4869 và bị teo nhỏ giống Shinichi và Haibara.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Mẹ của Akai Shuichi và Sera Masumi bị teo nhỏ có biệt danh là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Mẹ của Akai Shuichi và Sera Masumi bị teo nhỏ có biệt danh là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 102, 'Conan – Thám tử lừng danh', 'Cha mẹ của Haibara Ai (Miyano Shiho) đều là nhà khoa học có tên là gì?', '["Kogoro và Eri","Yusaku và Yukiko","Atsushi Miyano và Elena Miyano","Ginzo và Aoko"]'::jsonb, 2, 'Atsushi Miyano và Elena Miyano (''Hell Angel'') là người khởi xướng nghiên cứu thuốc Silver Bullet / APTX 4869.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cha mẹ của Haibara Ai (Miyano Shiho) đều là nhà khoa học có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Cha mẹ của Haibara Ai (Miyano Shiho) đều là nhà khoa học có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 103, 'Conan – Thám tử lừng danh', 'Thanh tra gà mờ nhất trong truyện Conan, từng được thăng chức nhờ Conan bắn thuốc mê phá án là ai?', '["Juzo Megure","Misao Yamamura","Ninzaburo Shiratori","Kiyonaga Matsumoto"]'::jsonb, 1, 'Misao Yamamura ở tỉnh Gunma là vị thanh tra hậu đậu duy nhất được phong hàm Thanh tra nhờ Conan ngủ gật phá án.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thanh tra gà mờ nhất trong truyện Conan, từng được thăng chức nhờ Conan bắn thuốc mê phá án là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Thanh tra gà mờ nhất trong truyện Conan, từng được thăng chức nhờ Conan bắn thuốc mê phá án là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 104, 'Conan – Thám tử lừng danh', 'Trong Conan Movie 26 ''Tàu ngầm sắt màu đen'', hệ thống nhận diện khuôn mặt toàn cầu có tên là gì?', '["Pacific Buoy (Phao Thái Bình Dương)","Noah''s Ark","Silver Bullet","Pandora Box"]'::jsonb, 0, 'Cơ sở kỹ thuật hàng hải Pacific Buoy của Interpol là bối cảnh chính trong Conan Movie 26.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Conan Movie 26 ''Tàu ngầm sắt màu đen'', hệ thống nhận diện khuôn mặt toàn cầu có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Trong Conan Movie 26 ''Tàu ngầm sắt màu đen'', hệ thống nhận diện khuôn mặt toàn cầu có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 105, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Hạ Cánh Nơi Anh'' (Crash Landing on You), nữ chính Yoon Se-ri bị lạc sang Triều Tiên vì nguyên nhân gì?', '["Đi lạc khi leo núi","Bị máy bay rơi","Gặp lốc xoáy khi chơi dù lượn","Đi nhầm tàu hỏa xuyên biên giới"]'::jsonb, 2, 'Đại tiểu thư Yoon Se-ri trong lúc thử nghiệm bộ đồ dù lượn của công ty đã bị một cơn lốc xoáy bất ngờ cuốn qua khu phi quân sự DMZ sang Triều Tiên.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Hạ Cánh Nơi Anh'' (Crash Landing on You), nữ chính Yoon Se-ri bị lạc sang Triều Tiên vì nguyên nhân gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Hạ Cánh Nơi Anh'' (Crash Landing on You), nữ chính Yoon Se-ri bị lạc sang Triều Tiên vì nguyên nhân gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 106, 'Phim Hàn Quốc (K-Drama)', 'Cặp đôi diễn viên chính của ''Hạ Cánh Nơi Anh'' sau này đã chính thức kết hôn ngoài đời thực là ai?', '["Song Joong-ki và Song Hye-kyo","Hyun Bin và Son Ye-jin","Lee Min-ho và Park Shin-hye","Kim Soo-hyun và Kim Ji-won"]'::jsonb, 1, 'Hyun Bin (vai Đại úy Ri Jeong-hyeok) và Son Ye-jin (vai Yoon Se-ri) đã nên duyên vợ chồng ngoài đời và được người hâm mộ khắp châu Á chúc phúc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cặp đôi diễn viên chính của ''Hạ Cánh Nơi Anh'' sau này đã chính thức kết hôn ngoài đời thực là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Cặp đôi diễn viên chính của ''Hạ Cánh Nơi Anh'' sau này đã chính thức kết hôn ngoài đời thực là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 107, 'Phim Hàn Quốc (K-Drama)', 'Trong bộ phim ''Hậu Duệ Mặt Trời'' (Descendants of the Sun), nhân vật Yoo Si-jin do Song Joong-ki thủ vai mang biệt danh tác chiến là gì?', '["Big Boss (Đại ca)","Wolf (Sói hoang)","Piccolo","Harry Potter"]'::jsonb, 0, 'Đại úy Yoo Si-jin thuộc lực lượng tác chiến đặc biệt mang biệt danh truyền tin là ''Big Boss''.',
  'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Hậu Duệ Mặt Trời'' (Descendants of the Sun), nhân vật Yoo Si-jin do Song Joong-ki thủ vai mang biệt danh tác chiến là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Hậu Duệ Mặt Trời'' (Descendants of the Sun), nhân vật Yoo Si-jin do Song Joong-ki thủ vai mang biệt danh tác chiến là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 108, 'Phim Hàn Quốc (K-Drama)', 'Nữ bác sĩ xinh đẹp đồng hành cùng Yoo Si-jin tại vùng đất chiến sự Urk trong ''Hậu Duệ Mặt Trời'' do ai đóng?', '["Jun Ji-hyun","Kim Ji-won","IU (Lee Ji-eun)","Song Hye-kyo (vai Kang Mo-yeon)"]'::jsonb, 3, 'Song Hye-kyo thủ vai nữ bác sĩ ngoại khoa bản lĩnh Kang Mo-yeon.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ bác sĩ xinh đẹp đồng hành cùng Yoo Si-jin tại vùng đất chiến sự Urk trong ''Hậu Duệ Mặt Trời'' do ai đóng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg' WHERE lower(trim(prompt)) = lower('Nữ bác sĩ xinh đẹp đồng hành cùng Yoo Si-jin tại vùng đất chiến sự Urk trong ''Hậu Duệ Mặt Trời'' do ai đóng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 109, 'Phim Hàn Quốc (K-Drama)', 'Trong hiện tượng toàn cầu ''Squid Game'' (Trò Chơi Con Mực), trò chơi dân gian đầu tiên mà các thí sinh phải vượt qua là trò gì?', '["Kéo co trên cao","Tách kẹo đường Dalgona","Hoa Mugunghwa đã nở (Đèn đỏ, đèn xanh)","Bắn bi sinh tử"]'::jsonb, 2, 'Trò chơi đầu tiên là ''Đèn đỏ, đèn xanh'' với con búp bê khổng lồ Young-hee quét chuyển động.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/57/Squid_Game_2021_vector_logo_english.svg/330px-Squid_Game_2021_vector_logo_english.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong hiện tượng toàn cầu ''Squid Game'' (Trò Chơi Con Mực), trò chơi dân gian đầu tiên mà các thí sinh phải vượt qua là trò gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/57/Squid_Game_2021_vector_logo_english.svg/330px-Squid_Game_2021_vector_logo_english.svg.png' WHERE lower(trim(prompt)) = lower('Trong hiện tượng toàn cầu ''Squid Game'' (Trò Chơi Con Mực), trò chơi dân gian đầu tiên mà các thí sinh phải vượt qua là trò gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  11, 110, 'Phim Hàn Quốc (K-Drama)', 'Số áo thi đấu của nhân vật chính Seong Gi-hun trong ''Squid Game'' là số bao nhiêu?', '["Số 001","Số 456","Số 218","Số 067"]'::jsonb, 1, 'Seong Gi-hun là người chơi mang số áo cuối cùng 456 và cũng là người chiến thắng giải thưởng 45.6 tỷ won.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/57/Squid_Game_2021_vector_logo_english.svg/330px-Squid_Game_2021_vector_logo_english.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Số áo thi đấu của nhân vật chính Seong Gi-hun trong ''Squid Game'' là số bao nhiêu?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/57/Squid_Game_2021_vector_logo_english.svg/330px-Squid_Game_2021_vector_logo_english.svg.png' WHERE lower(trim(prompt)) = lower('Số áo thi đấu của nhân vật chính Seong Gi-hun trong ''Squid Game'' là số bao nhiêu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 111, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Yêu Tinh'' (Goblin), thanh kiếm vô hình cắm vào ngực Kim Shin chỉ có thể được rút ra bởi ai?', '["Cô dâu của Goblin (Ji Eun-tak)","Thần Chết Wang Yeo","Hậu duệ gia tộc họ Yoo","Thần Sinh Mệnh Samshin"]'::jsonb, 0, 'Chỉ có ''Cô dâu của Yêu tinh'' mang vết bớt định mệnh mới nhìn thấy và rút được thanh gươm giải thoát cho Kim Shin.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e0/Gong_Yoo_in_2021_-_3.png/330px-Gong_Yoo_in_2021_-_3.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Yêu Tinh'' (Goblin), thanh kiếm vô hình cắm vào ngực Kim Shin chỉ có thể được rút ra bởi ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e0/Gong_Yoo_in_2021_-_3.png/330px-Gong_Yoo_in_2021_-_3.png' WHERE lower(trim(prompt)) = lower('Trong ''Yêu Tinh'' (Goblin), thanh kiếm vô hình cắm vào ngực Kim Shin chỉ có thể được rút ra bởi ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 112, 'Phim Hàn Quốc (K-Drama)', 'Hai nam tài tử nào đã tạo nên cặp đôi ''Yêu Tinh - Thần Chết'' huyền thoại trong Goblin?', '["Song Joong-ki và Jin Goo","Lee Min-ho và Kim Woo-bin","Park Seo-joon và Choi Woo-shik","Gong Yoo và Lee Dong-wook"]'::jsonb, 3, 'Gong Yoo (vai Goblin Kim Shin) và Lee Dong-wook (vai Thần Chết Wang Yeo) có những màn tung hứng hài hước kinh điển.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hai nam tài tử nào đã tạo nên cặp đôi ''Yêu Tinh - Thần Chết'' huyền thoại trong Goblin?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg' WHERE lower(trim(prompt)) = lower('Hai nam tài tử nào đã tạo nên cặp đôi ''Yêu Tinh - Thần Chết'' huyền thoại trong Goblin?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 113, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Hồi Ức 1988'' (Reply 1988), ai là người cuối cùng trở thành chồng của nữ chính Sung Duk-sun?', '["Sung Sun-woo","Kim Jung-hwan (H Jung)","Choi Taek (kỳ thủ cờ vây)","Ryu Dong-ryong"]'::jsonb, 2, 'Kỳ thủ cờ vây Choi Taek (do Park Bo-gum thủ vai) chính là chồng của Duk-sun, tạo nên một trong những cuộc tranh luận kết phim sôi nổi nhất màn ảnh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/FloorGoban.JPG/330px-FloorGoban.JPG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Hồi Ức 1988'' (Reply 1988), ai là người cuối cùng trở thành chồng của nữ chính Sung Duk-sun?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/FloorGoban.JPG/330px-FloorGoban.JPG' WHERE lower(trim(prompt)) = lower('Trong ''Hồi Ức 1988'' (Reply 1988), ai là người cuối cùng trở thành chồng của nữ chính Sung Duk-sun?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 114, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim kinh điển ''Bản Tình Ca Mùa Đông'' (Winter Sonata) lấy bối cảnh hòn đảo lãng mạn nổi tiếng nào ở Hàn Quốc?', '["Đảo Jeju","Đảo Nami","Đảo Dokdo","Đảo Geoje"]'::jsonb, 1, 'Đảo Nami với con đường rợp bóng cây ngân hạnh và tuyết trắng trở thành biểu tượng du lịch nhờ bộ phim Bản Tình Ca Mùa Đông.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim kinh điển ''Bản Tình Ca Mùa Đông'' (Winter Sonata) lấy bối cảnh hòn đảo lãng mạn nổi tiếng nào ở Hàn Quốc?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim kinh điển ''Bản Tình Ca Mùa Đông'' (Winter Sonata) lấy bối cảnh hòn đảo lãng mạn nổi tiếng nào ở Hàn Quốc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 115, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Vườn Sao Băng'' (Boys Over Flowers), nhóm bốn chàng trai công tử giàu có trường Shinhwa được gọi là gì?', '["F4 (Flower Four)","A4","Super 4","King 4"]'::jsonb, 0, 'Nhóm F4 do thủ lĩnh Goo Jun-pyo dẫn đầu là nhóm nam sinh giàu có và quyền lực bậc nhất trường học.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Vườn Sao Băng'' (Boys Over Flowers), nhóm bốn chàng trai công tử giàu có trường Shinhwa được gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png' WHERE lower(trim(prompt)) = lower('Trong phim ''Vườn Sao Băng'' (Boys Over Flowers), nhóm bốn chàng trai công tử giàu có trường Shinhwa được gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 116, 'Phim Hàn Quốc (K-Drama)', 'Ai đóng vai thủ lĩnh F4 xoăn tóc Goo Jun-pyo trong phiên bản Hàn Quốc của ''Vườn Sao Băng''?', '["Lee Jong-suk","Kim Hyun-joong","Kim Bum","Lee Min-ho"]'::jsonb, 3, 'Vai diễn Goo Jun-pyo đã đưa tên tuổi Lee Min-ho vụt sáng thành ngôi sao Hallyu hàng đầu châu Á.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai đóng vai thủ lĩnh F4 xoăn tóc Goo Jun-pyo trong phiên bản Hàn Quốc của ''Vườn Sao Băng''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png' WHERE lower(trim(prompt)) = lower('Ai đóng vai thủ lĩnh F4 xoăn tóc Goo Jun-pyo trong phiên bản Hàn Quốc của ''Vườn Sao Băng''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 117, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Vì Sao Đưa Anh Tới'' (My Love from the Star), ''Cụ giáo'' Do Min-joon là người ngoài hành tinh đã sống trên Trái Đất bao nhiêu năm?', '["Hơn 1000 năm","Hơn 100 năm","Hơn 400 năm (từ thời Joseon)","50 năm"]'::jsonb, 2, 'Do Min-joon (Kim Soo-hyun) đáp xuống Trái Đất vào năm 1609 triều đại Joseon và sống hơn 400 năm.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Kim_Soo-hyun_in_August_2024_-_2.png/330px-Kim_Soo-hyun_in_August_2024_-_2.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Vì Sao Đưa Anh Tới'' (My Love from the Star), ''Cụ giáo'' Do Min-joon là người ngoài hành tinh đã sống trên Trái Đất bao nhiêu năm?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Kim_Soo-hyun_in_August_2024_-_2.png/330px-Kim_Soo-hyun_in_August_2024_-_2.png' WHERE lower(trim(prompt)) = lower('Trong ''Vì Sao Đưa Anh Tới'' (My Love from the Star), ''Cụ giáo'' Do Min-joon là người ngoài hành tinh đã sống trên Trái Đất bao nhiêu năm?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 118, 'Phim Hàn Quốc (K-Drama)', 'Nữ minh tinh chảnh chọe nhưng đáng yêu Chun Song-yi trong ''Vì Sao Đưa Anh Tới'' do nữ diễn viên nào thể hiện?', '["Song Hye-kyo","Jun Ji-hyun (Gianna Jun)","Son Ye-jin","Han Ga-in"]'::jsonb, 1, 'Jun Ji-hyun đã có màn hóa thân xuất sắc vào vai ''mợ chảnh'' Chun Song-yi thích ăn gà rán và uống bia.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Son_Ye-jin_in_May_2026.png/330px-Son_Ye-jin_in_May_2026.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ minh tinh chảnh chọe nhưng đáng yêu Chun Song-yi trong ''Vì Sao Đưa Anh Tới'' do nữ diễn viên nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Son_Ye-jin_in_May_2026.png/330px-Son_Ye-jin_in_May_2026.png' WHERE lower(trim(prompt)) = lower('Nữ minh tinh chảnh chọe nhưng đáng yêu Chun Song-yi trong ''Vì Sao Đưa Anh Tới'' do nữ diễn viên nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 119, 'Phim Hàn Quốc (K-Drama)', 'Trong bom tấn trả thù ''The Glory'' (Vinh Quang Trong Thù Hận), nữ chính Moon Dong-eun do Song Hye-kyo đóng sử dụng môn cờ nào để tiếp cận kẻ thù?', '["Cờ vây (Go / Baduk)","Cờ vua","Cờ tướng","Cờ cá ngựa"]'::jsonb, 0, 'Moon Dong-eun học cờ vây từ Ha Do-young và Joo Yeo-jeong để xây dựng chiến lược trả thù từng bước vững chắc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/53/Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg/330px-Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bom tấn trả thù ''The Glory'' (Vinh Quang Trong Thù Hận), nữ chính Moon Dong-eun do Song Hye-kyo đóng sử dụng môn cờ nào để tiếp cận kẻ thù?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/53/Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg/330px-Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg' WHERE lower(trim(prompt)) = lower('Trong bom tấn trả thù ''The Glory'' (Vinh Quang Trong Thù Hận), nữ chính Moon Dong-eun do Song Hye-kyo đóng sử dụng môn cờ nào để tiếp cận kẻ thù?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  12, 120, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Itaewon Class'' (Tầng Lớp Itaewon), quán nhậu đường phố mà Park Sae-royi thành lập có tên là gì?', '["Seoul Night","Jangga","Itaewon Pub","DanBam (Đêm ngọt ngào)"]'::jsonb, 3, 'Quán DanBam (Đêm ngọt ngào) do Park Sae-royi và những người bạn cùng chung chí hướng xây dựng nên tại khu phố Tây Itaewon.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Itaewon Class'' (Tầng Lớp Itaewon), quán nhậu đường phố mà Park Sae-royi thành lập có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png' WHERE lower(trim(prompt)) = lower('Trong ''Itaewon Class'' (Tầng Lớp Itaewon), quán nhậu đường phố mà Park Sae-royi thành lập có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 121, 'Phim Hàn Quốc (K-Drama)', 'Kiểu tóc húi cua cá tính của nhân vật Park Sae-royi trong ''Itaewon Class'' thường được giới trẻ gọi vui là kiểu đầu gì?', '["Đầu nấm","Đầu quả dứa","Đầu hạt dẻ","Đầu bổ luống"]'::jsonb, 2, 'Kiểu tóc cắt ngắn sát đỉnh bo tròn của Park Seo-joon gây sốt mạng xã hội với tên gọi ''tóc hạt dẻ''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kiểu tóc húi cua cá tính của nhân vật Park Sae-royi trong ''Itaewon Class'' thường được giới trẻ gọi vui là kiểu đầu gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png' WHERE lower(trim(prompt)) = lower('Kiểu tóc húi cua cá tính của nhân vật Park Sae-royi trong ''Itaewon Class'' thường được giới trẻ gọi vui là kiểu đầu gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 122, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim gây bão đầu năm 2024 ''Nữ Hoàng Nước Mắt'' (Queen of Tears) do cặp đôi diễn viên nào đóng chính?', '["Song Kang và Kim Yoo-jung","Kim Soo-hyun và Kim Ji-won","Lee Jun-ho và YoonA","Ahn Hyo-seop và Kim Se-jeong"]'::jsonb, 1, 'Kim Soo-hyun (vai Baek Hyun-woo) và Kim Ji-won (vai tài phiệt Hong Hae-in) đã tạo nên cơn sốt tỷ suất người xem kỷ lục đài tvN.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Kim_Soo-hyun_in_August_2024_-_2.png/330px-Kim_Soo-hyun_in_August_2024_-_2.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim gây bão đầu năm 2024 ''Nữ Hoàng Nước Mắt'' (Queen of Tears) do cặp đôi diễn viên nào đóng chính?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Kim_Soo-hyun_in_August_2024_-_2.png/330px-Kim_Soo-hyun_in_August_2024_-_2.png' WHERE lower(trim(prompt)) = lower('Bộ phim gây bão đầu năm 2024 ''Nữ Hoàng Nước Mắt'' (Queen of Tears) do cặp đôi diễn viên nào đóng chính?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 123, 'Phim Hàn Quốc (K-Drama)', 'Trong phim cổ trang ''Mặt Trăng Ôm Mặt Trời'' (Moon Embracing the Sun), vị vua trẻ si tình Lee Hwon do ai thủ vai?', '["Kim Soo-hyun","Jung Il-woo","Song Joong-ki","Yoo Seung-ho"]'::jsonb, 0, 'Kim Soo-hyun ghi dấu ấn rực rỡ với vai diễn Quốc vương Lee Hwon bên cạnh Han Ga-in (vai Heo Yeon-woo).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim cổ trang ''Mặt Trăng Ôm Mặt Trời'' (Moon Embracing the Sun), vị vua trẻ si tình Lee Hwon do ai thủ vai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/330px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg' WHERE lower(trim(prompt)) = lower('Trong phim cổ trang ''Mặt Trăng Ôm Mặt Trời'' (Moon Embracing the Sun), vị vua trẻ si tình Lee Hwon do ai thủ vai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 124, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Điên Thì Có Sao'' (It''s Okay to Not Be Okay), nữ tác giả truyện cổ tích lập dị Ko Mun-yeong do ai thủ vai?', '["Shin Min-a","Park Shin-hye","Bae Suzy","Seo Ye-ji"]'::jsonb, 3, 'Seo Ye-ji đã gây ấn tượng mạnh với phong cách thời trang sang trọng và diễn xuất ma mị, sắc sảo.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Điên Thì Có Sao'' (It''s Okay to Not Be Okay), nữ tác giả truyện cổ tích lập dị Ko Mun-yeong do ai thủ vai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Điên Thì Có Sao'' (It''s Okay to Not Be Okay), nữ tác giả truyện cổ tích lập dị Ko Mun-yeong do ai thủ vai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 125, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Người Thừa Kế'' (The Heirs), câu thoại thả thính kinh điển của Kim Tan (Lee Min-ho) với Cha Eun-sang là gì?', '["Đi ăn cùng anh nhé","Em có đồng ý làm bạn gái anh không?","Chẳng lẽ tôi thích em rồi à?","Đừng rời xa tôi"]'::jsonb, 2, 'Câu thoại ''Chẳng lẽ tôi thích em rồi à?'' (Hokshi na neo joh-ahanya?) trong rạp chiếu phim đã trở thành hot trend của năm 2013.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Người Thừa Kế'' (The Heirs), câu thoại thả thính kinh điển của Kim Tan (Lee Min-ho) với Cha Eun-sang là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/330px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png' WHERE lower(trim(prompt)) = lower('Trong ''Người Thừa Kế'' (The Heirs), câu thoại thả thính kinh điển của Kim Tan (Lee Min-ho) với Cha Eun-sang là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 126, 'Phim Hàn Quốc (K-Drama)', 'Trong bộ phim sinh tồn xác sống học đường ''Ngôi Trường Xác Sống'' (All of Us Are Dead), virus zombie bùng phát từ trường học nào?', '["Trường trung học Cheongsan","Trường trung học Hyosan","Trường Seoul High","Trường Busan Tech"]'::jsonb, 1, 'Ổ dịch bắt đầu từ phòng thí nghiệm khoa học của thầy Lee Byeong-chan tại trường trung học Hyosan.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim sinh tồn xác sống học đường ''Ngôi Trường Xác Sống'' (All of Us Are Dead), virus zombie bùng phát từ trường học nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong bộ phim sinh tồn xác sống học đường ''Ngôi Trường Xác Sống'' (All of Us Are Dead), virus zombie bùng phát từ trường học nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 127, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim y khoa nhẹ nhàng, ấm áp về ban nhạc 5 người bạn bác sĩ có tên là gì?', '["Hospital Playlist (Chuyện Đời Bác Sĩ)","Dr. Romantic (Người Thầy Y Đức)","Doctor Stranger","Good Doctor"]'::jsonb, 0, 'Hospital Playlist kể về cuộc sống, tình yêu và niềm đam mê âm nhạc của nhóm bạn thân bác sĩ tại bệnh viện Yulje.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim y khoa nhẹ nhàng, ấm áp về ban nhạc 5 người bạn bác sĩ có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim y khoa nhẹ nhàng, ấm áp về ban nhạc 5 người bạn bác sĩ có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 128, 'Phim Hàn Quốc (K-Drama)', 'Nữ luật sư tự kỷ thiên tài mê cá voi trong bộ phim truyền hình nổi tiếng năm 2022 có tên là gì?', '["Hong Cha-young","Cha Eun-sang","Kang Mo-yeon","Woo Young-woo"]'::jsonb, 3, 'Bộ phim ''Nữ Luật Sư Kỳ Lạ Woo Young-woo'' do Park Eun-bin thủ vai đã làm tan chảy trái tim người xem khắp thế giới.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ luật sư tự kỷ thiên tài mê cá voi trong bộ phim truyền hình nổi tiếng năm 2022 có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Nữ luật sư tự kỷ thiên tài mê cá voi trong bộ phim truyền hình nổi tiếng năm 2022 có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 129, 'Phim Hàn Quốc (K-Drama)', 'Lời chào đảo chữ độc đáo của Woo Young-woo là: ''Tôi là Woo Young-woo, dù đọc xuôi hay đọc ngược đều là Woo Young-woo...'', theo sau là những từ nào?', '["Seoul, busan, incheon","Dalgona, ramen, kimchi","Kisaek, yeokssam, georeogi, tomato, swiss","Hana, dul, set"]'::jsonb, 2, 'Woo Young-woo luôn tự giới thiệu bằng các từ đối xứng: ''georeogi, tomato, swiss, kisaek, yeokssam'' (ngỗng trời, cà chua, Thụy Sĩ, bắn súng, Yeoksam).',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Lời chào đảo chữ độc đáo của Woo Young-woo là: ''Tôi là Woo Young-woo, dù đọc xuôi hay đọc ngược đều là Woo Young-woo...'', theo sau là những từ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Lời chào đảo chữ độc đáo của Woo Young-woo là: ''Tôi là Woo Young-woo, dù đọc xuôi hay đọc ngược đều là Woo Young-woo...'', theo sau là những từ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  13, 130, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Cô Nàng Mạnh Mẽ Do Bong-soon'' (Strong Woman Do Bong-soon), sức mạnh siêu phàm của nữ chính được truyền theo quy luật nào?', '["Truyền cho con trai trưởng","Chỉ truyền cho phụ nữ trong dòng họ","Bị ngẫu nhiên do sét đánh","Do uống thảo dược bí truyền"]'::jsonb, 1, 'Dòng họ nhà Bong-soon có sức mạnh siêu nhiên truyền đời dành riêng cho phái nữ, nếu dùng cho mục đích xấu sẽ mất sức mạnh.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Cô Nàng Mạnh Mẽ Do Bong-soon'' (Strong Woman Do Bong-soon), sức mạnh siêu phàm của nữ chính được truyền theo quy luật nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong ''Cô Nàng Mạnh Mẽ Do Bong-soon'' (Strong Woman Do Bong-soon), sức mạnh siêu phàm của nữ chính được truyền theo quy luật nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 131, 'Phim Hàn Quốc (K-Drama)', 'Phim cổ trang kinh dị nào của Netflix kể về hoàng thái tử Lee Chang chiến đấu chống dịch bệnh zombie thời Joseon?', '["Kingdom (Vương Triều Xác Sống)","Rampant","Dạ Quỷ","Zombie Detective"]'::jsonb, 0, 'Kingdom của biên kịch Kim Eun-hee kết hợp xuất sắc giữa đấu đá cung đình và đại dịch thây ma bí ẩn.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Phim cổ trang kinh dị nào của Netflix kể về hoàng thái tử Lee Chang chiến đấu chống dịch bệnh zombie thời Joseon?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Phim cổ trang kinh dị nào của Netflix kể về hoàng thái tử Lee Chang chiến đấu chống dịch bệnh zombie thời Joseon?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 132, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Khách Sạn Ma Quái'' (Hotel Del Luna), bà chủ khách sạn ngàn năm xinh đẹp Jang Man-wol do ai thủ vai?', '["Taeyeon","Bae Suzy","Yoona","IU (Lee Ji-eun)"]'::jsonb, 3, 'IU đã thể hiện xuất sắc vai diễn bà chủ khách sạn Jang Man-wol kiêu kỳ, mê tiền và sành điệu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Khách Sạn Ma Quái'' (Hotel Del Luna), bà chủ khách sạn ngàn năm xinh đẹp Jang Man-wol do ai thủ vai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Trong ''Khách Sạn Ma Quái'' (Hotel Del Luna), bà chủ khách sạn ngàn năm xinh đẹp Jang Man-wol do ai thủ vai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 133, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim cổ trang ''Nàng Dae Jang-geum'' (Jewel in the Palace) kể về cuộc đời của người phụ nữ đầu tiên đạt được danh vị gì ở triều đình?', '["Nữ tướng chỉ huy quân đội","Hoàng hậu nhiếp chính","Ngự y nữ phục vụ nhà vua","Thừa tướng"]'::jsonb, 2, 'Dae Jang Geum từ một cung nữ ngự thiện phòng đã nỗ lực trở thành nữ danh y đầu tiên chăm sóc sức khỏe cho hoàng đế.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim cổ trang ''Nàng Dae Jang-geum'' (Jewel in the Palace) kể về cuộc đời của người phụ nữ đầu tiên đạt được danh vị gì ở triều đình?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim cổ trang ''Nàng Dae Jang-geum'' (Jewel in the Palace) kể về cuộc đời của người phụ nữ đầu tiên đạt được danh vị gì ở triều đình?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 134, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Hẹn Hò Chốn Công Sở'' (Business Proposal), nữ chính Shin Ha-ri đã đi xem mắt hộ cho cô bạn thân giàu có tên là gì?', '["Kang Tae-moo","Jin Young-seo","Go Yoo-ra","Min-woo"]'::jsonb, 1, 'Shin Ha-ri (Kim Se-jeong) thay mặt tiểu thư tài phiệt Jin Young-seo (Seol In-ah) đi xem mắt và bất ngờ gặp chính CEO của mình.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Hẹn Hò Chốn Công Sở'' (Business Proposal), nữ chính Shin Ha-ri đã đi xem mắt hộ cho cô bạn thân giàu có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Hẹn Hò Chốn Công Sở'' (Business Proposal), nữ chính Shin Ha-ri đã đi xem mắt hộ cho cô bạn thân giàu có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 135, 'Phim Hàn Quốc (K-Drama)', 'Chim tổ tiên (Archeopteryx) là biệt danh hài hước mà nữ chính Ha-ri đặt cho sếp tổng Kang Tae-moo trong phim nào?', '["Hẹn Hò Chốn Công Sở (Business Proposal)","Thư Ký Kim Sao Thế","Vua Khách Sạn","Cô Nàng Xinh Đẹp"]'::jsonb, 0, 'Ha-ri nhận xét gương mặt nghiêm nghị của giám đốc Kang Tae-moo nhìn giống hệt loài chim thủy tổ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chim tổ tiên (Archeopteryx) là biệt danh hài hước mà nữ chính Ha-ri đặt cho sếp tổng Kang Tae-moo trong phim nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png' WHERE lower(trim(prompt)) = lower('Chim tổ tiên (Archeopteryx) là biệt danh hài hước mà nữ chính Ha-ri đặt cho sếp tổng Kang Tae-moo trong phim nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 136, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Thư Ký Kim Sao Thế?'' (What''s Wrong with Secretary Kim?), vị phó chủ tịch tự luyến mắc bệnh yêu bản thân cuồng nhiệt là ai?', '["Lee Sung-yeon","Kim Mi-so","Park Yoo-shik","Lee Young-joon (Park Seo-joon đóng)"]'::jsonb, 3, 'Phó chủ tịch Lee Young-joon luôn tin rằng bản thân quá đỗi hoàn hảo đến mức không người phụ nữ nào xứng đáng ngoài thư ký Kim.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thư Ký Kim Sao Thế?'' (What''s Wrong with Secretary Kim?), vị phó chủ tịch tự luyến mắc bệnh yêu bản thân cuồng nhiệt là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/330px-Park_Seo-joon_in_March_2026.png' WHERE lower(trim(prompt)) = lower('Trong ''Thư Ký Kim Sao Thế?'' (What''s Wrong with Secretary Kim?), vị phó chủ tịch tự luyến mắc bệnh yêu bản thân cuồng nhiệt là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 137, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Chàng Hậu'' (Mr. Queen), linh hồn của một nam đầu bếp thời hiện đại ở Nhà Xanh đã nhập vào thân xác của ai?', '["Đại vương đại phi","Triều Tiên Triết Tông","Vương hậu Kim So-yong thời Joseon","Thượng cung Choi"]'::jsonb, 2, 'Linh hồn đầu bếp thời thượng Jang Bong-hwan rơi xuống nước và nhập vào cơ thể Trung điện nương nương Kim So-yong (Shin Hye-sun đóng).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Chàng Hậu'' (Mr. Queen), linh hồn của một nam đầu bếp thời hiện đại ở Nhà Xanh đã nhập vào thân xác của ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim ''Chàng Hậu'' (Mr. Queen), linh hồn của một nam đầu bếp thời hiện đại ở Nhà Xanh đã nhập vào thân xác của ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 138, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim chữa lành ''Điệu Cha-Cha-Cha Làng Biển'' (Hometown Cha-Cha-Cha) lấy bối cảnh tại ngôi làng ven biển xinh đẹp có tên là gì?', '["Sokcho","Gongjin","Busan","Gangneung"]'::jsonb, 1, 'Làng chài yên bình Gongjin là nơi nha sĩ Yoon Hye-jin gặp gỡ anh tổ trưởng Hong Du-sik vạn năng.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim chữa lành ''Điệu Cha-Cha-Cha Làng Biển'' (Hometown Cha-Cha-Cha) lấy bối cảnh tại ngôi làng ven biển xinh đẹp có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim chữa lành ''Điệu Cha-Cha-Cha Làng Biển'' (Hometown Cha-Cha-Cha) lấy bối cảnh tại ngôi làng ven biển xinh đẹp có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 139, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Penthouse: Cuộc Chiến Thượng Lưu'', tòa nhà cao 100 tầng xa hoa biểu tượng của giới siêu giàu Seoul có tên là gì?', '["Hera Palace","Lotte World Tower","Sky Castle","Seoul Penthouse"]'::jsonb, 0, 'Cung điện Hera (Hera Palace) là tâm điểm của những âm mưu tranh quyền đoạt lợi nghẹt thở giữa các gia đình tài phiệt.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Penthouse: Cuộc Chiến Thượng Lưu'', tòa nhà cao 100 tầng xa hoa biểu tượng của giới siêu giàu Seoul có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong ''Penthouse: Cuộc Chiến Thượng Lưu'', tòa nhà cao 100 tầng xa hoa biểu tượng của giới siêu giàu Seoul có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  14, 140, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim truyền hình trinh thám vượt thời gian thông qua chiếc bộ đàm bộ đội cũ kỹ giữa quá khứ và hiện tại tên là gì?', '["Stranger","Tunnel","Voice","Signal (Dấu Vết)"]'::jsonb, 3, 'Signal (tvN) là tượng đài phim hình sự phá án khi trung úy Park Hae-young liên lạc với cảnh sát Lee Jae-han ở thập niên 1980.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim truyền hình trinh thám vượt thời gian thông qua chiếc bộ đàm bộ đội cũ kỹ giữa quá khứ và hiện tại tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim truyền hình trinh thám vượt thời gian thông qua chiếc bộ đàm bộ đội cũ kỹ giữa quá khứ và hiện tại tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 141, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Cõng Anh Mà Chạy'' (Lovely Runner) gây sốt năm 2024, nữ chính Im Sol đã du hành ngược thời gian về quá khứ nhờ vật gì?', '["Một bức ảnh chụp chung","Chiếc điện thoại nắp gập","Chiếc đồng hồ đeo tay của Ryu Sun-jae","Một cây bút bi dạ quang"]'::jsonb, 2, 'Chiếc đồng hồ đeo tay đấu giá của thần tượng Ryu Sun-jae đã sáng đèn và đưa Im Sol ngược thời gian về 15 năm trước để cứu anh.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Cõng Anh Mà Chạy'' (Lovely Runner) gây sốt năm 2024, nữ chính Im Sol đã du hành ngược thời gian về quá khứ nhờ vật gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong phim ''Cõng Anh Mà Chạy'' (Lovely Runner) gây sốt năm 2024, nữ chính Im Sol đã du hành ngược thời gian về quá khứ nhờ vật gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 142, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Mơ Lại Mộng Đầu'' hay ''Chuông Báo Tình Yêu'' (Love Alarm), ứng dụng trên điện thoại sẽ đổ chuông khi nào?', '["Khi có người gọi khẩn cấp","Khi có người thầm thích bạn trong bán kính 10 mét","Khi trời sắp mưa","Khi người yêu đang nói dối"]'::jsonb, 1, 'Love Alarm sẽ phát chuông báo khi có ai đó có cảm tình với bạn tiến vào vòng tròn bán kính 10 mét xung quanh.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Mơ Lại Mộng Đầu'' hay ''Chuông Báo Tình Yêu'' (Love Alarm), ứng dụng trên điện thoại sẽ đổ chuông khi nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong ''Mơ Lại Mộng Đầu'' hay ''Chuông Báo Tình Yêu'' (Love Alarm), ứng dụng trên điện thoại sẽ đổ chuông khi nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 143, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim y khoa cổ điển nào kể về bác sĩ lãng mạn Thầy Kim (Teacher Kim) tại bệnh viện Doldam hẻo lánh?', '["Dr. Romantic (Người Thầy Y Đức)","Doctors","Hospital Ship","Medical Top Team"]'::jsonb, 0, 'Han Suk-kyu hóa thân xuất sắc thành viện trưởng sư phụ Kim Sa-bu trong cả ba mùa phim Dr. Romantic.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim y khoa cổ điển nào kể về bác sĩ lãng mạn Thầy Kim (Teacher Kim) tại bệnh viện Doldam hẻo lánh?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim y khoa cổ điển nào kể về bác sĩ lãng mạn Thầy Kim (Teacher Kim) tại bệnh viện Doldam hẻo lánh?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 144, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Hoàng Cung'' (Goong / Princess Hours), cô nữ sinh thường dân Shin Chae-gyung phải kết hôn cùng ai vì lời hứa tiền nhân?', '["Bộ trưởng triều đình","Hoàng tử Lee Yul","Đại quân","Thái tử Lee Shin"]'::jsonb, 3, 'Nữ sinh Chae-gyung bước vào hoàng cung làm Thái tử phi bên cạnh chàng Thái tử lạnh lùng Lee Shin (Joo Ji-hoon đóng).',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Hoàng Cung'' (Goong / Princess Hours), cô nữ sinh thường dân Shin Chae-gyung phải kết hôn cùng ai vì lời hứa tiền nhân?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Hoàng Cung'' (Goong / Princess Hours), cô nữ sinh thường dân Shin Chae-gyung phải kết hôn cùng ai vì lời hứa tiền nhân?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 145, 'Phim Hàn Quốc (K-Drama)', 'Trong ''Chiếc Bật Lửa Và Váy Công Chúa'' hay ''Cố Lên Waikiki'' (Welcome to Waikiki), loại hình kinh doanh mà 3 chàng trai điều hành là gì?', '["Cửa hàng tiện lợi 24h","Quán cà phê thú cưng","Nhà trọ du lịch (Guesthouse)","Công ty sản xuất phim độc lập"]'::jsonb, 2, 'Ba chàng trai ngây ngô cùng nhau mở nhà trọ Waikiki dành cho khách du lịch nước ngoài với vô số tình huống dở khóc dở cười.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Chiếc Bật Lửa Và Váy Công Chúa'' hay ''Cố Lên Waikiki'' (Welcome to Waikiki), loại hình kinh doanh mà 3 chàng trai điều hành là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong ''Chiếc Bật Lửa Và Váy Công Chúa'' hay ''Cố Lên Waikiki'' (Welcome to Waikiki), loại hình kinh doanh mà 3 chàng trai điều hành là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 146, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Gia Đình Là Số 1 Phần 2'' (High Kick 2), kết thúc phim đầy tiếc nuối và tranh cãi gắn liền với địa điểm nào?', '["Dưới chân tháp Namsan","Trong chiếc xe hơi gặp tai nạn trên đường ra sân bay","Tại một quán mì lạnh","Trên chuyến phà đảo Jeju"]'::jsonb, 1, 'Cảnh phim dừng lại với bức ảnh đen trắng khi bác sĩ Ji-hoon và Se-kyung ngồi trong xe hơi hướng về sân bay đã gây chấn động màn ảnh truyền hình.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Gia Đình Là Số 1 Phần 2'' (High Kick 2), kết thúc phim đầy tiếc nuối và tranh cãi gắn liền với địa điểm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong phim ''Gia Đình Là Số 1 Phần 2'' (High Kick 2), kết thúc phim đầy tiếc nuối và tranh cãi gắn liền với địa điểm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 147, 'Phim Hàn Quốc (K-Drama)', 'Trong bộ phim ''Bệnh viện đa khoa (Hospital Playlist)'', nhóm bạn 5 bác sĩ sinh năm bao nhiêu?', '["Hội 99s (nhập học năm 1999)","Hội 88s","Hội 94s","Hội 97s"]'::jsonb, 0, 'Nhóm 5 bác sĩ thân thiết trong Hospital Playlist quen nhau từ năm nhập học đại học Y năm 1999 (Hội 99s).',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Bệnh viện đa khoa (Hospital Playlist)'', nhóm bạn 5 bác sĩ sinh năm bao nhiêu?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Bệnh viện đa khoa (Hospital Playlist)'', nhóm bạn 5 bác sĩ sinh năm bao nhiêu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 148, 'Phim Hàn Quốc (K-Drama)', 'Nữ diễn viên nào thủ vai nữ luật sư tự kỷ thiên tài Woo Young-woo trong ''Nữ luật sư kỳ lạ Woo Young-woo''?', '["Han So-hee","Kim Tae-ri","Kim Go-eun","Park Eun-bin"]'::jsonb, 3, 'Park Eun-bin đã giành giải Daesang Baeksang nhờ vai diễn xuất sắc Woo Young-woo.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào thủ vai nữ luật sư tự kỷ thiên tài Woo Young-woo trong ''Nữ luật sư kỳ lạ Woo Young-woo''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào thủ vai nữ luật sư tự kỷ thiên tài Woo Young-woo trong ''Nữ luật sư kỳ lạ Woo Young-woo''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 149, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Nữ luật sư kỳ lạ Woo Young-woo'', loài động vật nào mà nữ chính yêu thích nhất?', '["Chim cánh cụt","Cá heo","Cá voi","Gấu trúc"]'::jsonb, 2, 'Woo Young-woo có niềm đam mê mãnh liệt với các loài cá voi và luôn liên tưởng đến cá voi khi tìm ra ý tưởng phá án.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Nữ luật sư kỳ lạ Woo Young-woo'', loài động vật nào mà nữ chính yêu thích nhất?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG' WHERE lower(trim(prompt)) = lower('Trong phim ''Nữ luật sư kỳ lạ Woo Young-woo'', loài động vật nào mà nữ chính yêu thích nhất?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  15, 150, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim cổ trang xác sống (zombie) đầu tiên của Hàn Quốc do Netflix sản xuất có tên là gì?', '["All of Us Are Dead","Kingdom (Vương triều xác sống)","Sweet Home","Happiness"]'::jsonb, 1, 'Kingdom (Vương triều xác sống) với sự tham gia của Joo Ji-hoon và Bae Doona là bom tấn cổ trang zombie nổi tiếng.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim cổ trang xác sống (zombie) đầu tiên của Hàn Quốc do Netflix sản xuất có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Bộ phim cổ trang xác sống (zombie) đầu tiên của Hàn Quốc do Netflix sản xuất có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 151, 'Phim Hàn Quốc (K-Drama)', 'Trong bộ phim ''Tuổi 25, Tuổi 21 (Twenty-Five Twenty-One)'', nữ chính Na Hee-do thi đấu môn thể thao nào?', '["Đấu kiếm","Bắn cung","Cầu lông","Cử tạ"]'::jsonb, 0, 'Na Hee-do (do Kim Tae-ri thủ vai) là vận động viên đấu kiếm quốc gia đầy nhiệt huyết.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Tuổi 25, Tuổi 21 (Twenty-Five Twenty-One)'', nữ chính Na Hee-do thi đấu môn thể thao nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Tuổi 25, Tuổi 21 (Twenty-Five Twenty-One)'', nữ chính Na Hee-do thi đấu môn thể thao nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 152, 'Phim Hàn Quốc (K-Drama)', 'Bộ phim ''Cậu út nhà tài phiệt (Reborn Rich)'' có sự tham gia của nam diễn viên chính nào?', '["Lee政-jae","Lee Jong-suk","Hyun Bin","Song Joong-ki"]'::jsonb, 3, 'Song Joong-ki đảm nhận cả hai vai Yoon Hyun-woo và cậu út Jin Do-jun của tập đoàn Soonyang.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim ''Cậu út nhà tài phiệt (Reborn Rich)'' có sự tham gia của nam diễn viên chính nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/330px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim ''Cậu út nhà tài phiệt (Reborn Rich)'' có sự tham gia của nam diễn viên chính nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 153, 'Phim Hàn Quốc (K-Drama)', 'Trong phim ''Cậu út nhà tài phiệt'', tập đoàn gia đình tài phiệt trong phim mang tên gì?', '["Tập đoàn Cheong-ah","Tập đoàn Jangga","Tập đoàn Soonyang","Tập đoàn Queens"]'::jsonb, 2, 'Tập đoàn Soonyang do chủ tịch Jin Yang-chul sáng lập là tâm điểm cuộc chiến thừa kế trong phim.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Cậu út nhà tài phiệt'', tập đoàn gia đình tài phiệt trong phim mang tên gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim ''Cậu út nhà tài phiệt'', tập đoàn gia đình tài phiệt trong phim mang tên gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 154, 'Phim Hàn Quốc (K-Drama)', 'Nữ diễn viên nào đóng vai cô nàng cử tạ Kim Bok-joo trong ''Tiên nữ cử tạ Kim Bok-joo''?', '["Park Bo-young","Lee Sung-kyung","Kim Yoo-jung","Shin Hye-sun"]'::jsonb, 1, 'Lee Sung-kyung và Nam Joo-hyuk tạo nên cặp đôi thanh xuân đáng yêu trong Tiên nữ cử tạ Kim Bok-joo.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào đóng vai cô nàng cử tạ Kim Bok-joo trong ''Tiên nữ cử tạ Kim Bok-joo''?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào đóng vai cô nàng cử tạ Kim Bok-joo trong ''Tiên nữ cử tạ Kim Bok-joo''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 155, 'Phim Hàn Quốc (K-Drama)', 'Trong bộ phim ''Hoàn hồn (Alchemy of Souls)'', vùng đất giả tưởng trong phim có tên là gì?', '["Vương quốc Daeho","Vương quốc Goryeo","Vương quốc Joseon","Vương quốc Silla"]'::jsonb, 0, 'Hoàn hồn lấy bối cảnh tại quốc gia giả tưởng Daeho với các thuật sư điều khiển thủy khí.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Hoàn hồn (Alchemy of Souls)'', vùng đất giả tưởng trong phim có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Hoàn hồn (Alchemy of Souls)'', vùng đất giả tưởng trong phim có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 156, 'Phim Hàn Quốc (K-Drama)', 'Nam diễn viên nào thủ vai chính Jang Uk trong bộ phim cổ trang kỳ ảo ''Hoàn hồn (Alchemy of Souls)''?', '["Rowoon","Hwang Min-hyun","Cha Eun-woo","Lee Jae-wook"]'::jsonb, 3, 'Lee Jae-wook vào vai thiếu gia Jang Uk đầy ấn tượng qua cả 2 phần của bộ phim Hoàn hồn.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam diễn viên nào thủ vai chính Jang Uk trong bộ phim cổ trang kỳ ảo ''Hoàn hồn (Alchemy of Souls)''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/330px-NamsanTower_%28Cropped%29.jpeg' WHERE lower(trim(prompt)) = lower('Nam diễn viên nào thủ vai chính Jang Uk trong bộ phim cổ trang kỳ ảo ''Hoàn hồn (Alchemy of Souls)''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 157, 'Âm nhạc Việt Nam', 'Ca khúc nào của Sơn Tùng M-TP đã đạt 100 triệu lượt xem nhanh kỷ lục trên YouTube và có sự góp mặt của Snoop Dogg?', '["Lạc Trôi","Hãy Trao Cho Anh","Nơi Này Có Anh","Chúng Ta Của Hiện Tại"]'::jsonb, 1, '''Hãy Trao Cho Anh'' ra mắt năm 2019 với sự kết hợp lịch sử cùng huyền thoại nhạc rap Snoop Dogg và siêu mẫu Madison Beer.',
  'https://img.youtube.com/vi/knW7-x7Y7RE/hqdefault.jpg', NULL, NULL, 'knW7-x7Y7RE', 'AUDIO_GUESS', 'easy', 1000, 20, 'Sơn Tùng M-TP ft. Snoop Dogg - Hãy Trao Cho Anh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc nào của Sơn Tùng M-TP đã đạt 100 triệu lượt xem nhanh kỷ lục trên YouTube và có sự góp mặt của Snoop Dogg?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/knW7-x7Y7RE/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc nào của Sơn Tùng M-TP đã đạt 100 triệu lượt xem nhanh kỷ lục trên YouTube và có sự góp mặt của Snoop Dogg?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 158, 'Âm nhạc Việt Nam', 'Ca sĩ nào được mệnh danh là ''Họa mi tóc nâu'' của làng nhạc nhẹ Việt Nam?', '["Mỹ Tâm","Hồ Ngọc Hà","Hồng Nhung","Lệ Quyên"]'::jsonb, 0, 'Mỹ Tâm gắn liền với danh xưng ''Họa mi tóc nâu'' từ ca khúc cùng tên của nhạc sĩ Quốc An phát hành năm 2001.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, 'KspW84g8R4A', 'AUDIO_GUESS', 'easy', 1000, 20, 'Mỹ Tâm - Ước Gì', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào được mệnh danh là ''Họa mi tóc nâu'' của làng nhạc nhẹ Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Ca sĩ nào được mệnh danh là ''Họa mi tóc nâu'' của làng nhạc nhẹ Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 159, 'Âm nhạc Việt Nam', 'Ca khúc ''Đi Về Nhà'' đạt giải thưởng Cống Hiến là sự kết hợp ăn ý giữa rapper Đen Vâu và ca sĩ nào?', '["Phan Mạnh Quỳnh","Vũ.","Hà Anh Tuấn","JustaTee"]'::jsonb, 3, '''Đi Về Nhà'' là bản hit Tết xúc động do Đen Vâu rap và JustaTee cất giọng hát điệp khúc trầm ấm.',
  'https://img.youtube.com/vi/vTJdVE_frI0/hqdefault.jpg', NULL, NULL, 'vTJdVE_frI0', 'AUDIO_GUESS', 'easy', 1000, 20, 'Đen ft. JustaTee - Đi Về Nhà', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Đi Về Nhà'' đạt giải thưởng Cống Hiến là sự kết hợp ăn ý giữa rapper Đen Vâu và ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/vTJdVE_frI0/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Đi Về Nhà'' đạt giải thưởng Cống Hiến là sự kết hợp ăn ý giữa rapper Đen Vâu và ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  16, 160, 'Âm nhạc Việt Nam', 'Ca khúc viral toàn cầu ''See Tình'' với điệu nhảy lắc hông trứ danh do nữ ca sĩ nào thể hiện?', '["Min","Bích Phương","Hoàng Thùy Linh","Tóc Tiên"]'::jsonb, 2, '''See Tình'' nằm trong album ''LINK'' của Hoàng Thùy Linh (nhóm DTAP sản xuất), lan tỏa khắp thế giới từ TikTok đến các giải đấu thể thao quốc tế.',
  'https://img.youtube.com/vi/gJHSDZfJrRY/hqdefault.jpg', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'easy', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc viral toàn cầu ''See Tình'' với điệu nhảy lắc hông trứ danh do nữ ca sĩ nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/gJHSDZfJrRY/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc viral toàn cầu ''See Tình'' với điệu nhảy lắc hông trứ danh do nữ ca sĩ nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 161, 'Âm nhạc Việt Nam', 'Nhạc sĩ thiên tài nào là tác giả của những nhạc phẩm bất hủ như ''Diễm Xưa'', ''Hạ Trắng'', ''Biển Nhớ''?', '["Phạm Duy","Trịnh Công Sơn","Văn Cao","Ngô Thụy Miên"]'::jsonb, 1, 'Nhạc sĩ Trịnh Công Sơn là một trong những cây đại thụ vĩ đại nhất của nền tân nhạc Việt Nam.',
  'https://upload.wikimedia.org/wikipedia/vi/5/5b/Trinhcongson.jpg', NULL, NULL, 'qM0Yy3i_WGE', 'AUDIO_GUESS', 'easy', 1000, 20, 'Khánh Ly - Diễm Xưa (Trịnh Công Sơn)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhạc sĩ thiên tài nào là tác giả của những nhạc phẩm bất hủ như ''Diễm Xưa'', ''Hạ Trắng'', ''Biển Nhớ''?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/vi/5/5b/Trinhcongson.jpg' WHERE lower(trim(prompt)) = lower('Nhạc sĩ thiên tài nào là tác giả của những nhạc phẩm bất hủ như ''Diễm Xưa'', ''Hạ Trắng'', ''Biển Nhớ''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 162, 'Âm nhạc Việt Nam', 'Đoạn điệp khúc ''Mặt trời kia dù ở đâu, dù ngày trôi nhanh hay rất lâu...'' thuộc bản hit nào của Min và JustaTee?', '["Vì Yêu Cứ Đâm Đầu","Có Em Chờ","Đã Lỡ Yêu Em Nhiều","Ghen"]'::jsonb, 0, 'Đây là câu hát trong bài ''Vì Yêu Cứ Đâm Đầu'' - Min x JustaTee x Đen Vâu.',
  'https://img.youtube.com/vi/0rR_ZzRzLqU/hqdefault.jpg', NULL, NULL, 'vTJdVE_frI0', 'AUDIO_GUESS', 'easy', 1000, 20, 'Đen ft. JustaTee - Đi Về Nhà', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đoạn điệp khúc ''Mặt trời kia dù ở đâu, dù ngày trôi nhanh hay rất lâu...'' thuộc bản hit nào của Min và JustaTee?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/0rR_ZzRzLqU/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Đoạn điệp khúc ''Mặt trời kia dù ở đâu, dù ngày trôi nhanh hay rất lâu...'' thuộc bản hit nào của Min và JustaTee?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 163, 'Âm nhạc Việt Nam', 'Ai là tác giả kiêm ca sĩ thể hiện ca khúc xúc động ''Có Chàng Trai Viết Lên Cây'' trong phim Mắt Biếc?', '["Trúc Nhân","Vũ Cát Tường","Bùi Anh Tuấn","Phan Mạnh Quỳnh"]'::jsonb, 3, 'Phan Mạnh Quỳnh sáng tác và thể hiện, ca khúc trở thành linh hồn cho bộ phim điện ảnh ''Mắt Biếc'' của đạo diễn Victor Vũ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png', NULL, NULL, 'AX3Bsiq-13k', 'AUDIO_GUESS', 'easy', 1000, 20, 'Phan Mạnh Quỳnh - Có Chàng Trai Viết Lên Cây', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là tác giả kiêm ca sĩ thể hiện ca khúc xúc động ''Có Chàng Trai Viết Lên Cây'' trong phim Mắt Biếc?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png' WHERE lower(trim(prompt)) = lower('Ai là tác giả kiêm ca sĩ thể hiện ca khúc xúc động ''Có Chàng Trai Viết Lên Cây'' trong phim Mắt Biếc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 164, 'Âm nhạc Việt Nam', 'Ca sĩ nào được khán giả trẻ gọi thân thương là ''Hoàng tử Indie'' của Việt Nam với các bản hit ''Lạ Lùng'', ''Bước Qua Mùa Cô Đơn''?', '["Đạt G","Thịnh Suy","Vũ. (Hoàng Thái Vũ)","Trang"]'::jsonb, 2, 'Vũ. được yêu mến rộng rãi qua chất giọng mộc mạc, trầm ấm đậm chất tự sự.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'F5tSoaJ93ac', 'AUDIO_GUESS', 'easy', 1000, 20, 'Vũ. - Lạ Lùng', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào được khán giả trẻ gọi thân thương là ''Hoàng tử Indie'' của Việt Nam với các bản hit ''Lạ Lùng'', ''Bước Qua Mùa Cô Đơn''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca sĩ nào được khán giả trẻ gọi thân thương là ''Hoàng tử Indie'' của Việt Nam với các bản hit ''Lạ Lùng'', ''Bước Qua Mùa Cô Đơn''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 165, 'Âm nhạc Việt Nam', 'Trong chương trình ''Anh Trai Vượt Ngàn Chông Gai 2024'', nghệ sĩ nào đã xuất sắc trở thành Thủ lĩnh gia tộc và nhận giải Nghệ sĩ truyền cảm hứng?', '["Tiến Luật","Soobin Hoàng Sơn","Bằng Kiều","Tuấn Hưng"]'::jsonb, 1, 'Soobin tỏa sáng toàn diện về hát, rap, nhảy và chơi nhạc cụ dân tộc (đàn bầu), ghi dấu ấn rực rỡ trong lòng khán giả.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg/330px-SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg', NULL, NULL, 'm7W1r-w1e1I', 'AUDIO_GUESS', 'easy', 1000, 20, 'Soobin - Trống Cơm (ATVNCG)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong chương trình ''Anh Trai Vượt Ngàn Chông Gai 2024'', nghệ sĩ nào đã xuất sắc trở thành Thủ lĩnh gia tộc và nhận giải Nghệ sĩ truyền cảm hứng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg/330px-SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg' WHERE lower(trim(prompt)) = lower('Trong chương trình ''Anh Trai Vượt Ngàn Chông Gai 2024'', nghệ sĩ nào đã xuất sắc trở thành Thủ lĩnh gia tộc và nhận giải Nghệ sĩ truyền cảm hứng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 166, 'Âm nhạc Việt Nam', 'Bản hit ballad quốc dân thập niên 2000 ''Vầu Trời Khác Nhau'' hay ''Cầu Vồng Khuyết'' gắn liền với tên tuổi nam ca sĩ nào?', '["Tuấn Hưng","Ưng Hoàng Phúc","Đan Trường","Quang Vinh"]'::jsonb, 0, '''Cầu Vồng Khuyết'' (nhạc sĩ Minh Khang) qua giọng hát nội lực, phong trần của Tuấn Hưng đã làm mưa làm gió các bảng xếp hạng Làn Sóng Xanh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg', NULL, NULL, 'Qc4Qy1eE5rE', 'AUDIO_GUESS', 'easy', 1000, 20, 'Tuấn Hưng - Cầu Vồng Khuyết', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit ballad quốc dân thập niên 2000 ''Vầu Trời Khác Nhau'' hay ''Cầu Vồng Khuyết'' gắn liền với tên tuổi nam ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Bản hit ballad quốc dân thập niên 2000 ''Vầu Trời Khác Nhau'' hay ''Cầu Vồng Khuyết'' gắn liền với tên tuổi nam ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 167, 'Âm nhạc Việt Nam', 'Nam ca sĩ nào từng làm nức lòng bao thế hệ học trò với biệt danh ''Hoàng tử sơn ca''?', '["Ngô Kiến Huy","Đan Trường","Lam Trường","Quang Vinh"]'::jsonb, 3, 'Quang Vinh được gọi là ''Hoàng tử sơn ca'' từ những năm tháng tuổi thơ với ''Tình Yêu Diệu Kỳ'', ''Ngôi Nhà Hoa Hồng''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png/330px-%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png', NULL, NULL, '8h4vKz2D7kU', 'AUDIO_GUESS', 'easy', 1000, 20, 'Quang Vinh - Miền Cát Trắng', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào từng làm nức lòng bao thế hệ học trò với biệt danh ''Hoàng tử sơn ca''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png/330px-%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào từng làm nức lòng bao thế hệ học trò với biệt danh ''Hoàng tử sơn ca''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 168, 'Âm nhạc Việt Nam', 'Ca khúc ''Chiếc Khăn Gió Ấm'' - bản hit phủ sóng toàn bộ quán nét thập niên 2000 do ca sĩ nào trình bày?', '["Bằng Cường","Akira Phan","Khánh Phương","Châu Khải Phong"]'::jsonb, 2, 'Khánh Phương với chất giọng khàn đặc trưng đã biến ''Chiếc Khăn Gió Ấm'' thành hiện tượng âm nhạc thời bấy giờ.',
  'https://img.youtube.com/vi/qJk2eN4oQvI/hqdefault.jpg', NULL, NULL, '2e1QJz5m1R0', 'AUDIO_GUESS', 'easy', 1000, 20, 'Akira Phan - Mùa Đông Không Lạnh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Chiếc Khăn Gió Ấm'' - bản hit phủ sóng toàn bộ quán nét thập niên 2000 do ca sĩ nào trình bày?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/qJk2eN4oQvI/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Chiếc Khăn Gió Ấm'' - bản hit phủ sóng toàn bộ quán nét thập niên 2000 do ca sĩ nào trình bày?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 169, 'Âm nhạc Việt Nam', 'Ca khúc ''Mùa Đông Không Lạnh'' do ai sáng tác và thể hiện tạo nên cơn sốt giới trẻ năm 2008?', '["WanBi Tuấn Anh","Akira Phan","Noo Phước Thịnh","Tim"]'::jsonb, 1, 'Akira Phan ra mắt album vol.1 ''Đứng Dậy Vươn Vai'' với ca khúc chủ đạo ''Mùa Đông Không Lạnh'' cực kỳ ăn khách.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, '2e1QJz5m1R0', 'AUDIO_GUESS', 'easy', 1000, 20, 'Akira Phan - Mùa Đông Không Lạnh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Mùa Đông Không Lạnh'' do ai sáng tác và thể hiện tạo nên cơn sốt giới trẻ năm 2008?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Mùa Đông Không Lạnh'' do ai sáng tác và thể hiện tạo nên cơn sốt giới trẻ năm 2008?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  17, 170, 'Âm nhạc Việt Nam', 'Cố nghệ sĩ trẻ tài hoa với nụ cười tỏa nắng, tác giả của bản hit ''Đôi Mắt'' là ai?', '["WanBi Tuấn Anh","Minh Thuận","Trần Lập","Phi Nhung"]'::jsonb, 0, 'WanBi Tuấn Anh là thần tượng tuổi teen một thời với ca khúc ''Đôi Mắt'', ra đi ở tuổi 26 để lại muôn vàn tiếc thương.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, '1xZ7v0d5h4g', 'AUDIO_GUESS', 'easy', 1000, 20, 'Wanbi Tuấn Anh - Đôi Mắt', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cố nghệ sĩ trẻ tài hoa với nụ cười tỏa nắng, tác giả của bản hit ''Đôi Mắt'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Cố nghệ sĩ trẻ tài hoa với nụ cười tỏa nắng, tác giả của bản hit ''Đôi Mắt'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 171, 'Âm nhạc Việt Nam', 'Ca sĩ nào cùng Ưng Hoàng Phúc và nhóm 1088 là thần tượng thanh xuân thế hệ 8X - 9X?', '["Tuấn Hưng","Đan Trường","Lý Hải","Ưng Hoàng Phúc (cựu thành viên 1088)"]'::jsonb, 3, 'Ưng Hoàng Phúc (Út Phúc) có chuỗi album bán hàng trăm nghìn đĩa như ''Thà Rằng Như Thế'', ''Tôi Đi Tìm Tôi''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg', NULL, NULL, 'Qc4Qy1eE5rE', 'AUDIO_GUESS', 'easy', 1000, 20, 'Tuấn Hưng - Cầu Vồng Khuyết', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào cùng Ưng Hoàng Phúc và nhóm 1088 là thần tượng thanh xuân thế hệ 8X - 9X?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Ca sĩ nào cùng Ưng Hoàng Phúc và nhóm 1088 là thần tượng thanh xuân thế hệ 8X - 9X?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 172, 'Âm nhạc Việt Nam', 'Ai là tác giả của ca khúc Tiến Quân Ca - Quốc ca chính thức của nước Cộng hòa Xã hội Chủ nghĩa Việt Nam?', '["Nhạc sĩ Hoàng Việt","Nhạc sĩ Phạm Tuyên","Nhạc sĩ Văn Cao","Nhạc sĩ Lưu Hữu Phước"]'::jsonb, 2, 'Nhạc sĩ Văn Cao sáng tác ca khúc Tiến Quân Ca vào cuối năm 1944, được Quốc hội chọn làm Quốc ca Việt Nam.',
  'https://upload.wikimedia.org/wikipedia/vi/1/1a/Vancao.jpg', NULL, NULL, '6w4e0r1t2y3', 'AUDIO_GUESS', 'easy', 1000, 20, 'Quốc Ca Việt Nam (Tiến Quân Ca)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là tác giả của ca khúc Tiến Quân Ca - Quốc ca chính thức của nước Cộng hòa Xã hội Chủ nghĩa Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/vi/1/1a/Vancao.jpg' WHERE lower(trim(prompt)) = lower('Ai là tác giả của ca khúc Tiến Quân Ca - Quốc ca chính thức của nước Cộng hòa Xã hội Chủ nghĩa Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 173, 'Âm nhạc Việt Nam', 'Ca khúc ''Em Gái Mưa'' đạt hàng trăm triệu view trên mạng xã hội do nữ ca sĩ nào thể hiện?', '["Bảo Anh","Hương Tràm","Hiền Hồ","Văn Mai Hương"]'::jsonb, 1, 'Hương Tràm cất giọng đầy cảm xúc trong bản hit ballad ''Em Gái Mưa'' do nhạc sĩ Mr. Siro sáng tác.',
  'https://img.youtube.com/vi/mmsXQfXySkg/hqdefault.jpg', NULL, NULL, 'j8k9l0z1x2c', 'AUDIO_GUESS', 'easy', 1000, 20, 'Văn Mai Hương - Mưa Tháng Sáu', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Em Gái Mưa'' đạt hàng trăm triệu view trên mạng xã hội do nữ ca sĩ nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/mmsXQfXySkg/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Em Gái Mưa'' đạt hàng trăm triệu view trên mạng xã hội do nữ ca sĩ nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 174, 'Âm nhạc Việt Nam', 'Bản hit R&B ''Phía Sau Một Cô Gái'' do nhạc sĩ Tiên Cookie sáng tác đã làm nên tên tuổi bùng nổ của nam ca sĩ nào?', '["Soobin Hoàng Sơn","Erik","Đức Phúc","Quân A.P"]'::jsonb, 0, 'Câu hát ''Nên anh lùi bước về sau để thấy em rõ hơn'' của Soobin đã trở thành câu nói cửa miệng của giới trẻ suốt năm 2016.',
  'https://img.youtube.com/vi/vCI6k9PzG80/hqdefault.jpg', NULL, NULL, 'm7W1r-w1e1I', 'AUDIO_GUESS', 'easy', 1000, 20, 'Soobin - Trống Cơm (ATVNCG)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit R&B ''Phía Sau Một Cô Gái'' do nhạc sĩ Tiên Cookie sáng tác đã làm nên tên tuổi bùng nổ của nam ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/vCI6k9PzG80/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit R&B ''Phía Sau Một Cô Gái'' do nhạc sĩ Tiên Cookie sáng tác đã làm nên tên tuổi bùng nổ của nam ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 175, 'Âm nhạc Việt Nam', 'Bộ ba ca sĩ ''Gia đình Hoa Dâm Bụt'' gồm những thành viên nào?', '["Chi Pu, Sun Ht, Quỳnh Anh Shyn","Bích Phương, Tiên Cookie, Hương Giang","Trúc Nhân, Ali Hoàng Dương, Quang Trung","Hòa Minzy, Đức Phúc, Erik"]'::jsonb, 3, 'Hòa Minzy, Đức Phúc và Erik tạo thành bộ ba thân thiết và hài hước bậc nhất showbiz Việt.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, '70iT2j7yX0Q', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hòa Minzy - Thị Mầu', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ ba ca sĩ ''Gia đình Hoa Dâm Bụt'' gồm những thành viên nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Bộ ba ca sĩ ''Gia đình Hoa Dâm Bụt'' gồm những thành viên nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 176, 'Âm nhạc Việt Nam', 'Ca khúc ''Thị Mầu'' với chất liệu chèo truyền thống kết hợp EDM hiện đại do nữ ca sĩ nào thể hiện?', '["Phương Mỹ Chi","Hoàng Thùy Linh","Hòa Minzy","Thu Minh"]'::jsonb, 2, 'Hòa Minzy đã thể hiện xuất sắc nét tinh nghịch, lúng liếng của nhân vật Thị Mầu dân gian.',
  'https://img.youtube.com/vi/70iT2j7yX0Q/hqdefault.jpg', NULL, NULL, 'b7w9e0r1t2y', 'AUDIO_GUESS', 'medium', 1000, 20, 'Phương Mỹ Chi - Vũ Trụ Có Anh', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Thị Mầu'' với chất liệu chèo truyền thống kết hợp EDM hiện đại do nữ ca sĩ nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/70iT2j7yX0Q/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Thị Mầu'' với chất liệu chèo truyền thống kết hợp EDM hiện đại do nữ ca sĩ nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 177, 'Âm nhạc Việt Nam', 'Nam rapper Gen Z nào nổi tiếng với phong thái lịch lãm, visual cuốn hút và bản hit ''Ngủ Một Mình'', ''Cua''?', '["Wren Evans","HIEUTHUHAI","MCK","tlinh"]'::jsonb, 1, 'HIEUTHUHAI (Trần Minh Hiếu) là rapper đình đám nhóm GERDNANG, quán quân ''Anh Trai Say Hi''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5b/HIEUTHUHAI.jpg/330px-HIEUTHUHAI.jpg', NULL, NULL, '0W0hF_h61z8', 'AUDIO_GUESS', 'medium', 1000, 20, 'HIEUTHUHAI - Ngủ Một Mình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam rapper Gen Z nào nổi tiếng với phong thái lịch lãm, visual cuốn hút và bản hit ''Ngủ Một Mình'', ''Cua''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5b/HIEUTHUHAI.jpg/330px-HIEUTHUHAI.jpg' WHERE lower(trim(prompt)) = lower('Nam rapper Gen Z nào nổi tiếng với phong thái lịch lãm, visual cuốn hút và bản hit ''Ngủ Một Mình'', ''Cua''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 178, 'Âm nhạc Việt Nam', 'Album ''Vũ Trụ Cò Bay'' kết hợp văn học Việt Nam và âm nhạc dân tộc đương đại là của nữ ca sĩ trẻ nào?', '["Phương Mỹ Chi","Amee","Pháo","Orange"]'::jsonb, 0, 'Phương Mỹ Chi cùng nhóm sản xuất DTAP đã tạo nên cú lột xác ngoạn mục với 10 ca khúc lấy cảm hứng từ các tác phẩm văn học quen thuộc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'b7w9e0r1t2y', 'AUDIO_GUESS', 'medium', 1000, 20, 'Phương Mỹ Chi - Vũ Trụ Có Anh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Album ''Vũ Trụ Cò Bay'' kết hợp văn học Việt Nam và âm nhạc dân tộc đương đại là của nữ ca sĩ trẻ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Album ''Vũ Trụ Cò Bay'' kết hợp văn học Việt Nam và âm nhạc dân tộc đương đại là của nữ ca sĩ trẻ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 179, 'Âm nhạc Việt Nam', 'Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng phòng trà'' với những bản tình ca nồng nàn da diết?', '["Như Quỳnh","Hồ Ngọc Hà","Minh Tuyết","Lệ Quyên"]'::jsonb, 3, 'Lệ Quyên gắn liền với không gian âm nhạc phòng trà qua các dòng nhạc xưa, bolero và tình khúc tiền chiến.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'KspW84g8R4A', 'AUDIO_GUESS', 'medium', 1000, 20, 'Lệ Quyên - Giấc Mơ Có Thật', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng phòng trà'' với những bản tình ca nồng nàn da diết?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng phòng trà'' với những bản tình ca nồng nàn da diết?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  18, 180, 'Âm nhạc Việt Nam', 'Bản tình ca ''Nơi Tình Yêu Bắt Đầu'' giúp Bùi Anh Tuấn gây bão tại vòng Giấu mặt Giọng Hát Việt 2012 do nhạc sĩ nào sáng tác?', '["Nguyễn Hải Phong","Đức Trí","Tiến Minh","Nguyễn Hồng Thuận"]'::jsonb, 2, 'Nhạc sĩ Tiến Minh sáng tác ca khúc này làm nhạc phim ''Siêu Thị Tình Yêu''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản tình ca ''Nơi Tình Yêu Bắt Đầu'' giúp Bùi Anh Tuấn gây bão tại vòng Giấu mặt Giọng Hát Việt 2012 do nhạc sĩ nào sáng tác?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Bản tình ca ''Nơi Tình Yêu Bắt Đầu'' giúp Bùi Anh Tuấn gây bão tại vòng Giấu mặt Giọng Hát Việt 2012 do nhạc sĩ nào sáng tác?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 181, 'Âm nhạc Việt Nam', 'Bản hit ''Ghen Cô Vy'' của Min, Erik và Khắc Hưng đã trở thành hiện tượng phòng chống dịch được đài truyền hình HBO và quốc tế khen ngợi nhờ vũ điệu gì?', '["Vũ điệu đeo khẩu trang","Vũ điệu rửa tay của vũ công Quang Đăng","Vũ điệu thả tim","Vũ điệu xoay vòng"]'::jsonb, 1, 'Biên đạo múa Quang Đăng đã sáng tạo vũ điệu rửa tay trên nền nhạc Ghen Cô Vy, lan tỏa thông điệp y tế tích cực toàn cầu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit ''Ghen Cô Vy'' của Min, Erik và Khắc Hưng đã trở thành hiện tượng phòng chống dịch được đài truyền hình HBO và quốc tế khen ngợi nhờ vũ điệu gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Bản hit ''Ghen Cô Vy'' của Min, Erik và Khắc Hưng đã trở thành hiện tượng phòng chống dịch được đài truyền hình HBO và quốc tế khen ngợi nhờ vũ điệu gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 182, 'Âm nhạc Việt Nam', 'Ca khúc ''Từng Cho Nhau'' hay bản hit triệu view ''Cắt Đôi Nỗi Sầu'' mang phong cách vinahouse sôi động là của ca sĩ nào?', '["Tăng Duy Tân","Trịnh Đình Quang","Lê Bảo Bình","Hồ Quang Hiếu"]'::jsonb, 0, 'Tăng Duy Tân liên tục tạo hit với ''Bên Trên Tầng Lầu'', ''Cắt Đôi Nỗi Sầu'', ''Dạ Vũ''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'K4TOrB7at0Y', 'AUDIO_GUESS', 'medium', 1000, 20, 'Tăng Duy Tân x Hòa Minzy - Bật Tình Yêu Lên', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Từng Cho Nhau'' hay bản hit triệu view ''Cắt Đôi Nỗi Sầu'' mang phong cách vinahouse sôi động là của ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Từng Cho Nhau'' hay bản hit triệu view ''Cắt Đôi Nỗi Sầu'' mang phong cách vinahouse sôi động là của ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 183, 'Âm nhạc Việt Nam', 'Ban nhạc rock huyền thoại nào của Việt Nam gắn liền với cố thủ lĩnh Trần Lập và các ca khúc ''Tâm Hồn Của Đá'', ''Đường Đến Ngày Vinh Quang''?', '["Quái Vật Tí Hon","Microwave","Ngũ Cung","Bức Tường"]'::jsonb, 3, 'Bức Tường (The Wall) là ban nhạc Rock tiên phong, truyền cảm hứng sống mãnh liệt cho bao thế hệ sinh viên Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại nào của Việt Nam gắn liền với cố thủ lĩnh Trần Lập và các ca khúc ''Tâm Hồn Của Đá'', ''Đường Đến Ngày Vinh Quang''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại nào của Việt Nam gắn liền với cố thủ lĩnh Trần Lập và các ca khúc ''Tâm Hồn Của Đá'', ''Đường Đến Ngày Vinh Quang''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 184, 'Âm nhạc Việt Nam', 'Ca sĩ kiêm nhạc sĩ nào là người sáng tác loạt hit ''Bao Giờ Lấy Chồng'', ''Bùa Yêu'', ''Đi Đu Đưa Đi'' cho Bích Phương?', '["Châu Đăng Khoa","Dương Cầm","Tiên Cookie","Đỗ Hiếu"]'::jsonb, 2, 'Tiên Cookie và nhóm 1989s Production là người đứng sau định hình phong cách âm nhạc độc đáo cho Bích Phương.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ kiêm nhạc sĩ nào là người sáng tác loạt hit ''Bao Giờ Lấy Chồng'', ''Bùa Yêu'', ''Đi Đu Đưa Đi'' cho Bích Phương?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca sĩ kiêm nhạc sĩ nào là người sáng tác loạt hit ''Bao Giờ Lấy Chồng'', ''Bùa Yêu'', ''Đi Đu Đưa Đi'' cho Bích Phương?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 185, 'Âm nhạc Việt Nam', 'Ai là người sáng tác ca khúc thiếu nhi kinh điển ''Cho Con'' (''Ba sẽ là cánh chim, cho con bay thật xa...'')?', '["Nhạc sĩ Phong Nhã","Nhạc sĩ Phạm Trọng Cầu","Nhạc sĩ Hoàng Vân","Nhạc sĩ Phan Huỳnh Điểu"]'::jsonb, 1, 'Nhạc sĩ Phạm Trọng Cầu phổ nhạc từ bài thơ của nhà thơ Tuấn Dũng, tạo nên ca khúc về tình cha con bất hủ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là người sáng tác ca khúc thiếu nhi kinh điển ''Cho Con'' (''Ba sẽ là cánh chim, cho con bay thật xa...'')?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ai là người sáng tác ca khúc thiếu nhi kinh điển ''Cho Con'' (''Ba sẽ là cánh chim, cho con bay thật xa...'')?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 186, 'Âm nhạc Việt Nam', 'Ca sĩ nào nổi tiếng với chuỗi đêm nhạc ''See Sing Share'' mộc mạc và phong cách quý ông hát tình ca?', '["Hà Anh Tuấn","Quang Dũng","Lê Hiếu","Lân Nhã"]'::jsonb, 0, 'Hà Anh Tuấn đã tiên phong tạo nên thương hiệu concert ''See Sing Share'' luôn cháy vé chỉ sau vài phút mở bán.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c4/H%C3%A0_Anh_Tu%E1%BA%A5n.png/330px-H%C3%A0_Anh_Tu%E1%BA%A5n.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào nổi tiếng với chuỗi đêm nhạc ''See Sing Share'' mộc mạc và phong cách quý ông hát tình ca?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c4/H%C3%A0_Anh_Tu%E1%BA%A5n.png/330px-H%C3%A0_Anh_Tu%E1%BA%A5n.png' WHERE lower(trim(prompt)) = lower('Ca sĩ nào nổi tiếng với chuỗi đêm nhạc ''See Sing Share'' mộc mạc và phong cách quý ông hát tình ca?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 187, 'Âm nhạc Việt Nam', 'Ca khúc ''Thật Bất Ngờ'' châm biếm sâu cay những góc khuất thị phi của showbiz Việt do ca sĩ nào thể hiện?', '["Noo Phước Thịnh","Jun Phạm","Thanh Duy","Trúc Nhân"]'::jsonb, 3, 'Trúc Nhân với chất quái chiêu độc nhất vô nhị đã thể hiện trọn vẹn sáng tác của Mew Amazing.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Thật Bất Ngờ'' châm biếm sâu cay những góc khuất thị phi của showbiz Việt do ca sĩ nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Thật Bất Ngờ'' châm biếm sâu cay những góc khuất thị phi của showbiz Việt do ca sĩ nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 188, 'Âm nhạc Việt Nam', 'Bài hát ''Bà Tôi'' mang âm hưởng dân gian đương đại của nhạc sĩ Nguyễn Vĩnh Tiến do ca sĩ nào thể hiện đầu tiên?', '["Trọng Tấn","Ngọc Khuê","Tùng Dương","Đăng Dương"]'::jsonb, 2, 'Divo Tùng Dương đã ghi dấu ấn sâu sắc tại sân chơi Bài Hát Việt với phong cách ma mị, nội lực.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bài hát ''Bà Tôi'' mang âm hưởng dân gian đương đại của nhạc sĩ Nguyễn Vĩnh Tiến do ca sĩ nào thể hiện đầu tiên?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Bài hát ''Bà Tôi'' mang âm hưởng dân gian đương đại của nhạc sĩ Nguyễn Vĩnh Tiến do ca sĩ nào thể hiện đầu tiên?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 189, 'Âm nhạc Việt Nam', 'Nhóm nhạc nữ huyền thoại nào của Việt Nam thập niên 90 gồm 3 thành viên: Cẩm Ly, Minh Tuyết và Hà Phương?', '["Tam ca Áo Trắng","Ba chị em Cẩm Ly - Hà Phương - Minh Tuyết","Mây Trắng","Mắt Ngọc"]'::jsonb, 1, 'Ba chị em ruột nổi tiếng trong dòng nhạc quê hương và nhạc trữ tình Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ huyền thoại nào của Việt Nam thập niên 90 gồm 3 thành viên: Cẩm Ly, Minh Tuyết và Hà Phương?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ huyền thoại nào của Việt Nam thập niên 90 gồm 3 thành viên: Cẩm Ly, Minh Tuyết và Hà Phương?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  19, 190, 'Âm nhạc Việt Nam', 'Nhóm nhạc nữ thanh xuân của thế hệ 8X - 9X gắn liền với bài hát ''Ghét Anh'', ''Ai Ai Ai'' là nhóm nào?', '["Mây Trắng","Mắt Ngọc","H.A.T","Trio 666"]'::jsonb, 0, 'Nhóm Mây Trắng (Yến Trang, Yến Nhi, Thu Ngọc, Ngọc Châu) là nhóm nhạc nữ thành công rực rỡ đầu những năm 2000.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ thanh xuân của thế hệ 8X - 9X gắn liền với bài hát ''Ghét Anh'', ''Ai Ai Ai'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ thanh xuân của thế hệ 8X - 9X gắn liền với bài hát ''Ghét Anh'', ''Ai Ai Ai'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 191, 'Âm nhạc Việt Nam', 'Bản rap tình ca ''Tình Yêu Màu Nắng'' phát hành năm 2013 do BigDaddy kết hợp cùng nữ ca sĩ nào?', '["Hằng BingBoong","Emily","Bảo Trâm","Đoàn Thúy Trang"]'::jsonb, 3, 'Ca khúc mang âm hưởng núi rừng Tây Bắc do nhạc sĩ Phạm Thanh Hà sáng tác, đưa tên tuổi Đoàn Thúy Trang và BigDaddy lên đỉnh cao.',
  'https://img.youtube.com/vi/H2P5h9Zk1lQ/hqdefault.jpg', NULL, NULL, 'H2P5h9Zk1lQ', 'AUDIO_GUESS', 'medium', 1000, 20, 'Đoàn Thúy Trang ft. BigDaddy - Tình Yêu Màu Nắng', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản rap tình ca ''Tình Yêu Màu Nắng'' phát hành năm 2013 do BigDaddy kết hợp cùng nữ ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/H2P5h9Zk1lQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản rap tình ca ''Tình Yêu Màu Nắng'' phát hành năm 2013 do BigDaddy kết hợp cùng nữ ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 192, 'Âm nhạc Việt Nam', 'Ai là người thể hiện bản ballad buồn da diết ''Chắc Ai Đó Sẽ Về'' trong bộ phim ''Chàng Trai Năm Ấy''?', '["Ngô Kiến Huy","Hoài Lâm","Sơn Tùng M-TP","Hứa Vĩ Văn"]'::jsonb, 2, 'Sơn Tùng M-TP đóng vai chính Đình Phong và tự sáng tác ca khúc chủ đề ''Chắc Ai Đó Sẽ Về''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'knW7-x7Y7RE', 'AUDIO_GUESS', 'medium', 1000, 20, 'Sơn Tùng M-TP ft. Snoop Dogg - Hãy Trao Cho Anh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là người thể hiện bản ballad buồn da diết ''Chắc Ai Đó Sẽ Về'' trong bộ phim ''Chàng Trai Năm Ấy''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ai là người thể hiện bản ballad buồn da diết ''Chắc Ai Đó Sẽ Về'' trong bộ phim ''Chàng Trai Năm Ấy''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 193, 'Âm nhạc Việt Nam', 'Bài hát ''Anh Mơ'' và ''Chuyện Như Chưa Bắt Đầu'' là hai ca khúc nổi tiếng của nhạc sĩ nào?', '["Vũ Cát Tường","Hoàng Tôn","Khắc Hưng","Vương Anh Tú"]'::jsonb, 1, 'Hoàng Tôn là ca sĩ - nhạc sĩ tài năng từng gây sốt trong nhóm FB Boiz và Giọng Hát Việt.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bài hát ''Anh Mơ'' và ''Chuyện Như Chưa Bắt Đầu'' là hai ca khúc nổi tiếng của nhạc sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Bài hát ''Anh Mơ'' và ''Chuyện Như Chưa Bắt Đầu'' là hai ca khúc nổi tiếng của nhạc sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 194, 'Âm nhạc Việt Nam', 'Nữ ca sĩ Gen Z nào đã đạt giải Nghệ sĩ mới của năm tại Cống Hiến với loạt hit ''Yêu Thầm'', ''Khi Em Lớn''?', '["Orange","LyLy","Amee","Phùng Khánh Linh"]'::jsonb, 0, 'Orange (Khương Hoàn Mỹ) sở hữu giọng hát nội lực và kỹ thuật điêu luyện.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z nào đã đạt giải Nghệ sĩ mới của năm tại Cống Hiến với loạt hit ''Yêu Thầm'', ''Khi Em Lớn''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z nào đã đạt giải Nghệ sĩ mới của năm tại Cống Hiến với loạt hit ''Yêu Thầm'', ''Khi Em Lớn''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 195, 'Âm nhạc Việt Nam', 'Trong ca khúc ''Nấu Ăn Cho Em'', Đen Vâu và PiaLinh đã dành toàn bộ doanh thu để làm gì?', '["Ủng hộ đồng bào lũ lụt","Tài trợ học bổng đại học","Trồng rừng ngập mặn","Nuôi cơm và xây trường cho trẻ em vùng cao"]'::jsonb, 3, 'Đen Vâu đã dùng toàn bộ doanh thu từ lượt xem và nghe ca khúc ''Nấu Ăn Cho Em'' để tài trợ bữa ăn bán trú cho các em nhỏ vùng sâu vùng xa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/Den_Vau_in_Song_Gallery_2021.jpg/330px-Den_Vau_in_Song_Gallery_2021.jpg', NULL, NULL, 'vTJdVE_frI0', 'AUDIO_GUESS', 'hard', 1200, 20, 'Đen ft. JustaTee - Đi Về Nhà', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ca khúc ''Nấu Ăn Cho Em'', Đen Vâu và PiaLinh đã dành toàn bộ doanh thu để làm gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/Den_Vau_in_Song_Gallery_2021.jpg/330px-Den_Vau_in_Song_Gallery_2021.jpg' WHERE lower(trim(prompt)) = lower('Trong ca khúc ''Nấu Ăn Cho Em'', Đen Vâu và PiaLinh đã dành toàn bộ doanh thu để làm gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 196, 'Âm nhạc Việt Nam', 'Ca khúc ''Thu Cuối'' đình đám năm 2012 là sự kết hợp bùng nổ của bộ ba nghệ sĩ nào?', '["BigDaddy, Binz và Andree","JustaTee, LK và Emily","Mr.T, Yanbi và Hằng BingBoong","Soobin, Touliver và Rhymastic"]'::jsonb, 2, 'Giai điệu da diết và đoạn rap ''Cho bao nhiêu yêu thương nay bay theo gió...'' của Thu Cuối đã in sâu vào ký ức thế hệ học trò 9X.',
  'https://img.youtube.com/vi/77C74gB7rR4/hqdefault.jpg', NULL, NULL, 'm7W1r-w1e1I', 'AUDIO_GUESS', 'hard', 1200, 20, 'Soobin - Trống Cơm (ATVNCG)', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Thu Cuối'' đình đám năm 2012 là sự kết hợp bùng nổ của bộ ba nghệ sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/77C74gB7rR4/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Thu Cuối'' đình đám năm 2012 là sự kết hợp bùng nổ của bộ ba nghệ sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 197, 'Âm nhạc Việt Nam', 'Ai là Quán quân đầu tiên của chương trình Rap Việt mùa 1?', '["GDucky","Dế Choắt","MCK","Ricky Star"]'::jsonb, 1, 'Dế Choắt (đội HLV Wowy) đã xuất sắc giành ngôi vị quán quân Rap Việt mùa 1.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là Quán quân đầu tiên của chương trình Rap Việt mùa 1?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ai là Quán quân đầu tiên của chương trình Rap Việt mùa 1?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 198, 'Âm nhạc Việt Nam', 'Ca khúc ''Tàu Anh Qua Núi'' - tuyệt phẩm ca ngợi đất nước và những người công nhân đường sắt do nhạc sĩ nào sáng tác?', '["Nhạc sĩ Phan Lạc Hoa","Nhạc sĩ An Thuyên","Nhạc sĩ Trần Tiến","Nhạc sĩ Nguyễn Cường"]'::jsonb, 0, 'Nhạc sĩ Phan Lạc Hoa sáng tác bài hát này dành riêng cho giọng hát của Nghệ sĩ Nhân dân Thanh Hoa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Tàu Anh Qua Núi'' - tuyệt phẩm ca ngợi đất nước và những người công nhân đường sắt do nhạc sĩ nào sáng tác?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Tàu Anh Qua Núi'' - tuyệt phẩm ca ngợi đất nước và những người công nhân đường sắt do nhạc sĩ nào sáng tác?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 199, 'Âm nhạc Việt Nam', 'Nhạc sĩ nào là tác giả của ca khúc bất hủ ''Nối vòng tay lớn''?', '["Trần Tiến","Phạm Duy","Văn Cao","Trịnh Công Sơn"]'::jsonb, 3, '''Nối vòng tay lớn'' là một trong những sáng tác nổi tiếng nhất của cố nhạc sĩ Trịnh Công Sơn.',
  'https://upload.wikimedia.org/wikipedia/vi/5/5b/Trinhcongson.jpg', NULL, NULL, 'qM0Yy3i_WGE', 'AUDIO_GUESS', 'hard', 1200, 20, 'Khánh Ly - Diễm Xưa (Trịnh Công Sơn)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhạc sĩ nào là tác giả của ca khúc bất hủ ''Nối vòng tay lớn''?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/vi/5/5b/Trinhcongson.jpg' WHERE lower(trim(prompt)) = lower('Nhạc sĩ nào là tác giả của ca khúc bất hủ ''Nối vòng tay lớn''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  20, 200, 'Âm nhạc Việt Nam', 'Ca khúc ''Bống bống bang bang'' gắn liền với bộ phim điện ảnh Việt Nam nào năm 2016?', '["Trạng Tí","Cô Ba Sài Gòn","Tấm Cám: Chuyện chưa kể","Mắt Biếc"]'::jsonb, 2, '''Bống bống bang bang'' do nhóm 365 thể hiện là nhạc phim chính thức của ''Tấm Cám: Chuyện chưa kể''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png', NULL, NULL, 'AX3Bsiq-13k', 'AUDIO_GUESS', 'hard', 1200, 20, 'Phan Mạnh Quỳnh - Có Chàng Trai Viết Lên Cây', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Bống bống bang bang'' gắn liền với bộ phim điện ảnh Việt Nam nào năm 2016?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Bống bống bang bang'' gắn liền với bộ phim điện ảnh Việt Nam nào năm 2016?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 201, 'Âm nhạc Việt Nam', 'Nhóm nhạc nam 365daband do nữ nghệ sĩ nào thành lập và đào tạo?', '["Mỹ Tâm","Ngô Thanh Vân","Hồ Ngọc Hà","Đông Nhi"]'::jsonb, 1, 'Ngô Thanh Vân và công ty VAA đã đào tạo nhóm 365 gồm Isaac, Jun Phạm, Will, S.T Sơn Thạch và Tronie.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, 'gJHSDZfJrRY', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Thùy Linh - See Tình', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam 365daband do nữ nghệ sĩ nào thành lập và đào tạo?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam 365daband do nữ nghệ sĩ nào thành lập và đào tạo?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 202, 'Âm nhạc Việt Nam', 'Ai là nhạc sĩ sáng tác ca khúc ''Chiếc khăn gió ấm'' từng làm mưa làm gió V-Pop?', '["Nguyễn Văn Chung","Khắc Việt","Mr. Siro","Tiên Cookie"]'::jsonb, 0, 'Nhạc sĩ Nguyễn Văn Chung sáng tác ''Chiếc khăn gió ấm'' và ca khúc được Khánh Phương thể hiện rất thành công.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'h1j2k3l4z5x', 'AUDIO_GUESS', 'hard', 1200, 20, 'Khánh Phương - Chiếc Khăn Gió Ấm', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là nhạc sĩ sáng tác ca khúc ''Chiếc khăn gió ấm'' từng làm mưa làm gió V-Pop?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ai là nhạc sĩ sáng tác ca khúc ''Chiếc khăn gió ấm'' từng làm mưa làm gió V-Pop?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 203, 'Âm nhạc Việt Nam', 'Ca khúc ''Nhật ký của mẹ'' (Hiền Thục thể hiện) là sáng tác của nhạc sĩ nào?', '["Huy Tuấn","Đức Trí","Võ Thiện Thanh","Nguyễn Văn Chung"]'::jsonb, 3, '''Nhật ký của mẹ'' là tác phẩm xúc động bậc nhất sự nghiệp của nhạc sĩ Nguyễn Văn Chung.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'a1s2d3f4g5h', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hiền Thục - Nhật Ký Của Mẹ', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Nhật ký của mẹ'' (Hiền Thục thể hiện) là sáng tác của nhạc sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''Nhật ký của mẹ'' (Hiền Thục thể hiện) là sáng tác của nhạc sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 204, 'Âm nhạc Việt Nam', 'Nam ca sĩ nào được mệnh danh là ''Hoàng tử tình ca'' với chuỗi bản hit ''Nàng thơ'', ''Từ đó''?', '["Thịnh Suy","Vũ.","Hoàng Dũng","Ngọt"]'::jsonb, 2, 'Hoàng Dũng là tác giả kiêm ca sĩ thể hiện bản hit ''Nàng thơ'' lấy cảm hứng từ chuyện tình của Trịnh Công Sơn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'Zzn9-ATB9aU', 'AUDIO_GUESS', 'hard', 1200, 20, 'Hoàng Dũng - Nàng Thơ', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào được mệnh danh là ''Hoàng tử tình ca'' với chuỗi bản hit ''Nàng thơ'', ''Từ đó''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào được mệnh danh là ''Hoàng tử tình ca'' với chuỗi bản hit ''Nàng thơ'', ''Từ đó''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 205, 'Âm nhạc Việt Nam', 'Nhạc sĩ nào được mệnh danh là ''Hoàng tử Indie'' Việt Nam với bản hit ''Lạ lùng'', ''Bước qua mùa cô đơn''?', '["Đen Vâu","Vũ. (Hoàng Thái Vũ)","JustaTee","Rhyder"]'::jsonb, 1, 'Vũ. (Hoàng Thái Vũ) nổi tiếng với các bản tình ca Indie sâu lắng như ''Lạ lùng'', ''Đông kiếm em''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/Den_Vau_in_Song_Gallery_2021.jpg/330px-Den_Vau_in_Song_Gallery_2021.jpg', NULL, NULL, 'F5tSoaJ93ac', 'AUDIO_GUESS', 'hard', 1200, 20, 'Vũ. - Lạ Lùng', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhạc sĩ nào được mệnh danh là ''Hoàng tử Indie'' Việt Nam với bản hit ''Lạ lùng'', ''Bước qua mùa cô đơn''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/Den_Vau_in_Song_Gallery_2021.jpg/330px-Den_Vau_in_Song_Gallery_2021.jpg' WHERE lower(trim(prompt)) = lower('Nhạc sĩ nào được mệnh danh là ''Hoàng tử Indie'' Việt Nam với bản hit ''Lạ lùng'', ''Bước qua mùa cô đơn''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 206, 'Âm nhạc Việt Nam', 'Nữ ca sĩ Văn Mai Hương kết hợp với nhạc sĩ Hứa Kim Tuyền trong album nổi tiếng nào năm 2023?', '["Minh Tinh","Hoàng","Tâm 9","Vũ trụ cò bay"]'::jsonb, 0, 'Album ''Minh Tinh'' với các bản hit ''Mưa tháng sáu'', ''Đại minh tinh'' là sự kết hợp của Văn Mai Hương và Hứa Kim Tuyền.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'b7w9e0r1t2y', 'AUDIO_GUESS', 'hard', 1200, 20, 'Phương Mỹ Chi - Vũ Trụ Có Anh', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Văn Mai Hương kết hợp với nhạc sĩ Hứa Kim Tuyền trong album nổi tiếng nào năm 2023?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Văn Mai Hương kết hợp với nhạc sĩ Hứa Kim Tuyền trong album nổi tiếng nào năm 2023?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 207, 'Âm nhạc Việt Nam', 'Album ''Vũ trụ cò bay'' năm 2023 lấy cảm hứng từ văn học Việt Nam là của nữ ca sĩ nào?', '["Bích Phương","Hòa Minzy","Amee","Phương Mỹ Chi"]'::jsonb, 3, 'Phương Mỹ Chi kết hợp cùng nhóm sản xuất DTAP ra mắt album ''Vũ trụ cò bay'' gây tiếng vang lớn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png', NULL, NULL, 'b7w9e0r1t2y', 'AUDIO_GUESS', 'hard', 1200, 20, 'Phương Mỹ Chi - Vũ Trụ Có Anh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Album ''Vũ trụ cò bay'' năm 2023 lấy cảm hứng từ văn học Việt Nam là của nữ ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Son_Tung_M-TP_1_%282021%29.png/330px-Son_Tung_M-TP_1_%282021%29.png' WHERE lower(trim(prompt)) = lower('Album ''Vũ trụ cò bay'' năm 2023 lấy cảm hứng từ văn học Việt Nam là của nữ ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 208, 'Âm nhạc Việt Nam', 'Nhóm sản xuất âm nhạc gồm 3 thành viên đứng sau thành công của album ''Hoàng'' (Hoàng Thùy Linh) và ''Vũ trụ cò bay'' là ai?', '["Gerdnang","SpaceSpeakers","DTAP","Tổ Quạ"]'::jsonb, 2, 'DTAP là nhóm producer trẻ tài năng chuyên kết hợp chất liệu dân gian Việt Nam với âm nhạc hiện đại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/HOANG_THUY_LINH_DIEU_HANH_A80.jpg/330px-HOANG_THUY_LINH_DIEU_HANH_A80.jpg', NULL, NULL, 'b7w9e0r1t2y', 'AUDIO_GUESS', 'hard', 1200, 20, 'Phương Mỹ Chi - Vũ Trụ Có Anh', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm sản xuất âm nhạc gồm 3 thành viên đứng sau thành công của album ''Hoàng'' (Hoàng Thùy Linh) và ''Vũ trụ cò bay'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/HOANG_THUY_LINH_DIEU_HANH_A80.jpg/330px-HOANG_THUY_LINH_DIEU_HANH_A80.jpg' WHERE lower(trim(prompt)) = lower('Nhóm sản xuất âm nhạc gồm 3 thành viên đứng sau thành công của album ''Hoàng'' (Hoàng Thùy Linh) và ''Vũ trụ cò bay'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 209, 'K-Pop', 'Nhóm nhạc nam toàn cầu BTS (Bangtan Sonyeondan) chính thức ra mắt vào năm nào?', '["2013","2011","2015","2017"]'::jsonb, 0, 'BTS ra mắt vào ngày 13 tháng 6 năm 2013 dưới trướng công ty Big Hit Entertainment với single ''No More Dream''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'rBG5L7GSmVE', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - No More Dream', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam toàn cầu BTS (Bangtan Sonyeondan) chính thức ra mắt vào năm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam toàn cầu BTS (Bangtan Sonyeondan) chính thức ra mắt vào năm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  21, 210, 'K-Pop', 'Ca khúc tiếng Anh đầu tiên của BTS ra mắt năm 2020 đứng đầu bảng xếp hạng Billboard Hot 100 của Mỹ là gì?', '["Boy With Luv","Butter","Permission to Dance","Dynamite"]'::jsonb, 3, '''Dynamite'' là đĩa đơn disco-pop rực rỡ đã đưa BTS trở thành nghệ sĩ Hàn Quốc đầu tiên trong lịch sử đạt No.1 Billboard Hot 100.',
  'https://img.youtube.com/vi/gdZLi9oWNZg/hqdefault.jpg', NULL, NULL, 'rBG5L7GSmVE', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - No More Dream', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc tiếng Anh đầu tiên của BTS ra mắt năm 2020 đứng đầu bảng xếp hạng Billboard Hot 100 của Mỹ là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/gdZLi9oWNZg/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc tiếng Anh đầu tiên của BTS ra mắt năm 2020 đứng đầu bảng xếp hạng Billboard Hot 100 của Mỹ là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 211, 'K-Pop', 'Nhóm nhạc nữ BLACKPINK gồm có 4 thành viên là những ai?', '["Nayeon, Sana, Momo, Jihyo","Irene, Seulgi, Wendy, Joy","Jisoo, Jennie, Rosé, Lisa","Karina, Winter, Giselle, Ningning"]'::jsonb, 2, 'BLACKPINK trực thuộc YG Entertainment ra mắt năm 2016 với 4 cô gái tài năng: Jisoo, Jennie, Rosé và Lisa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'easy', 1000, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ BLACKPINK gồm có 4 thành viên là những ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ BLACKPINK gồm có 4 thành viên là những ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 212, 'K-Pop', 'Ca khúc nào của BLACKPINK sở hữu vũ đạo bắn súng bằng cả hai tay gây sốt toàn thế giới?', '["Kill This Love","DDU-DU DDU-DU","How You Like That","Pink Venom"]'::jsonb, 1, '''DDU-DU DDU-DU'' phát hành năm 2018 với vũ đạo bắn súng ngầu đét đã thu về hơn 2 tỷ lượt xem trên YouTube.',
  'https://img.youtube.com/vi/IHNzOHi8sJQ/hqdefault.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'easy', 1000, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc nào của BLACKPINK sở hữu vũ đạo bắn súng bằng cả hai tay gây sốt toàn thế giới?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/IHNzOHi8sJQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc nào của BLACKPINK sở hữu vũ đạo bắn súng bằng cả hai tay gây sốt toàn thế giới?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 213, 'K-Pop', 'Fandom chính thức của nhóm nhạc quốc dân BTS có tên gọi là gì?', '["ARMY","BLINK","ONCE","EXO-L"]'::jsonb, 0, 'ARMY là viết tắt của ''Adorable Representative M.C. for Youth''.',
  'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Fandom chính thức của nhóm nhạc quốc dân BTS có tên gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png' WHERE lower(trim(prompt)) = lower('Fandom chính thức của nhóm nhạc quốc dân BTS có tên gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 214, 'K-Pop', 'Fandom chính thức của nhóm nhạc nữ BLACKPINK có tên gọi là gì?', '["CARAT","ARMY","MIDZY","BLINK"]'::jsonb, 3, 'BLINK là sự kết hợp khéo léo giữa hai từ BLack và pINK.',
  'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Fandom chính thức của nhóm nhạc nữ BLACKPINK có tên gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png' WHERE lower(trim(prompt)) = lower('Fandom chính thức của nhóm nhạc nữ BLACKPINK có tên gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 215, 'K-Pop', 'Thành viên Lisa (Lalisa Manobal) của BLACKPINK là người gốc quốc gia nào?', '["Việt Nam","Hàn Quốc","Thái Lan","Philippines"]'::jsonb, 2, 'Lisa sinh ra và lớn lên tại tỉnh Buriram, Thái Lan trước khi sang Hàn Quốc làm thực tập sinh YG.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'easy', 1000, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành viên Lisa (Lalisa Manobal) của BLACKPINK là người gốc quốc gia nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg' WHERE lower(trim(prompt)) = lower('Thành viên Lisa (Lalisa Manobal) của BLACKPINK là người gốc quốc gia nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 216, 'K-Pop', 'Ca khúc huyền thoại nào của PSY đã trở thành video đầu tiên trong lịch sử YouTube cán mốc 1 tỷ lượt xem?', '["Gentleman","Gangnam Style","Daddy","That That"]'::jsonb, 1, '''Gangnam Style'' với điệu nhảy ngựa bất hủ phát hành tháng 7/2012 đã làm nổ tung các bảng xếp hạng âm nhạc toàn cầu.',
  'https://img.youtube.com/vi/9bZkp7q19f0/hqdefault.jpg', NULL, NULL, '9bZkp7q19f0', 'AUDIO_GUESS', 'easy', 1000, 20, 'PSY - Gangnam Style', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc huyền thoại nào của PSY đã trở thành video đầu tiên trong lịch sử YouTube cán mốc 1 tỷ lượt xem?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/9bZkp7q19f0/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc huyền thoại nào của PSY đã trở thành video đầu tiên trong lịch sử YouTube cán mốc 1 tỷ lượt xem?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 217, 'K-Pop', 'Nhóm nhạc nữ TWICE gồm có bao nhiêu thành viên?', '["9 thành viên","7 thành viên","8 thành viên","10 thành viên"]'::jsonb, 0, 'TWICE (JYP Entertainment) thành lập qua show sống còn Sixteen gồm 9 thành viên (Nayeon, Jeongyeon, Momo, Sana, Jihyo, Mina, Dahyun, Chaeyoung, Tzuyu).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7a/Twice_260618.jpg/330px-Twice_260618.jpg', NULL, NULL, 'c7rCyll5AeY', 'AUDIO_GUESS', 'easy', 1000, 20, 'TWICE - Cheer Up', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ TWICE gồm có bao nhiêu thành viên?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7a/Twice_260618.jpg/330px-Twice_260618.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ TWICE gồm có bao nhiêu thành viên?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 218, 'K-Pop', 'Điệu nhảy ''Shy Shy Shy'' (Nổi tiếng vì quá ngại ngùng) là của thành viên nào trong bản hit ''Cheer Up'' của TWICE?', '["Tzuyu","Momo","Nayeon","Sana"]'::jsonb, 3, 'Sana với phát âm ''Sha Sha Sha'' dễ thương đã tạo nên trào lưu aegyo phủ sóng toàn xứ sở kim chi.',
  'https://img.youtube.com/vi/c7rCyll5AeY/hqdefault.jpg', NULL, NULL, 'c7rCyll5AeY', 'AUDIO_GUESS', 'easy', 1000, 20, 'TWICE - Cheer Up', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Điệu nhảy ''Shy Shy Shy'' (Nổi tiếng vì quá ngại ngùng) là của thành viên nào trong bản hit ''Cheer Up'' của TWICE?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/c7rCyll5AeY/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Điệu nhảy ''Shy Shy Shy'' (Nổi tiếng vì quá ngại ngùng) là của thành viên nào trong bản hit ''Cheer Up'' của TWICE?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 219, 'K-Pop', 'Nhóm nhạc nữ ''Quốc dân'' Gen 2 của SM Entertainment gắn liền với bản hit ''Gee'' và ''Genie'' là nhóm nào?', '["2NE1","Wonder Girls","Girls'' Generation (SNSD)","Kara"]'::jsonb, 2, 'SNSD (Girls'' Generation) với 9 cô gái chân dài là biểu tượng văn hóa Hallyu đỉnh cao của Gen 2.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/220728_GG_poleposition_266_%2853595169645%29.jpg/330px-220728_GG_poleposition_266_%2853595169645%29.jpg', NULL, NULL, 'U7mPqYC_8Ak', 'AUDIO_GUESS', 'easy', 1000, 20, 'Girls'' Generation - Gee', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ ''Quốc dân'' Gen 2 của SM Entertainment gắn liền với bản hit ''Gee'' và ''Genie'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/220728_GG_poleposition_266_%2853595169645%29.jpg/330px-220728_GG_poleposition_266_%2853595169645%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ ''Quốc dân'' Gen 2 của SM Entertainment gắn liền với bản hit ''Gee'' và ''Genie'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  22, 220, 'K-Pop', 'Thủ lĩnh tài năng của nhóm nhạc BIGBANG, người được coi là ông hoàng thời trang K-Pop là ai?', '["Taeyang","G-Dragon (Kwon Ji-yong)","T.O.P","Daesung"]'::jsonb, 1, 'G-Dragon là biểu tượng âm nhạc, nhà sản xuất đại tài và biểu tượng thời trang toàn cầu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/21/G-Dragon_in_October_2025.jpg/330px-G-Dragon_in_October_2025.jpg', NULL, NULL, 'MzCbEdtNbJ0', 'AUDIO_GUESS', 'easy', 1000, 20, 'BIGBANG - Haru Haru', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ lĩnh tài năng của nhóm nhạc BIGBANG, người được coi là ông hoàng thời trang K-Pop là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/21/G-Dragon_in_October_2025.jpg/330px-G-Dragon_in_October_2025.jpg' WHERE lower(trim(prompt)) = lower('Thủ lĩnh tài năng của nhóm nhạc BIGBANG, người được coi là ông hoàng thời trang K-Pop là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 221, 'K-Pop', 'Ca khúc kinh điển ''Haru Haru'' (Từng ngày qua) ra mắt năm 2008 là của nhóm nhạc nào?', '["BIGBANG","Super Junior","TVXQ","SHINee"]'::jsonb, 0, '''Haru Haru'' là bản hit đưa BIGBANG trở thành nhóm nhạc hàng đầu K-Pop với MV xúc động đẫm nước mắt.',
  'https://img.youtube.com/vi/MzCbEdtNbJ0/hqdefault.jpg', NULL, NULL, 'rBG5L7GSmVE', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - No More Dream', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc kinh điển ''Haru Haru'' (Từng ngày qua) ra mắt năm 2008 là của nhóm nhạc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/MzCbEdtNbJ0/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc kinh điển ''Haru Haru'' (Từng ngày qua) ra mắt năm 2008 là của nhóm nhạc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 222, 'K-Pop', 'Vũ đạo xoa tay xin lỗi trong bài hát ''Sorry, Sorry'' gây sốt toàn cầu thuộc về nhóm nhạc nam nào?', '["Infinite","2PM","BEAST","Super Junior"]'::jsonb, 3, 'Super Junior làm chao đảo châu Á năm 2009 với bản hit ''Sorry, Sorry'' và điệu nhảy chắp tay xin lỗi đặc trưng.',
  'https://img.youtube.com/vi/x6QA3m58K3M/hqdefault.jpg', NULL, NULL, 'x6QA3m58DQw', 'AUDIO_GUESS', 'easy', 1000, 20, 'Super Junior - Sorry, Sorry', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vũ đạo xoa tay xin lỗi trong bài hát ''Sorry, Sorry'' gây sốt toàn cầu thuộc về nhóm nhạc nam nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/x6QA3m58K3M/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Vũ đạo xoa tay xin lỗi trong bài hát ''Sorry, Sorry'' gây sốt toàn cầu thuộc về nhóm nhạc nam nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 223, 'K-Pop', 'Nhóm nhạc nữ Gen 4 NewJeans thuộc công ty ADOR ra mắt năm 2022 với bản hit đầu tay nào?', '["Ditto","Hype Boy","Attention","OMG"]'::jsonb, 2, 'NewJeans bất ngờ tung MV ''Attention'' không hề báo trước, mở màn cho làn sóng Y2K tươi mới càn quét K-Pop.',
  'https://img.youtube.com/vi/js1CtxSY38I/hqdefault.jpg', NULL, NULL, 'rBG5L7GSmVE', 'AUDIO_GUESS', 'easy', 1000, 20, 'BTS - No More Dream', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ Gen 4 NewJeans thuộc công ty ADOR ra mắt năm 2022 với bản hit đầu tay nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/js1CtxSY38I/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ Gen 4 NewJeans thuộc công ty ADOR ra mắt năm 2022 với bản hit đầu tay nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 224, 'K-Pop', 'Điệu nhảy viral với câu nói ''I''m so hype boy'' trên TikTok thuộc ca khúc nào của NewJeans?', '["Cookie","Hype Boy","Super Shy","ETA"]'::jsonb, 1, 'Meme ''Bạn đang nghe bài gì thế? - Hype Boy của NewJeans'' đã trở thành trào lưu hài hước toàn cầu.',
  'https://img.youtube.com/vi/11cta61Wi0g/hqdefault.jpg', NULL, NULL, '11cta61Wi0g', 'AUDIO_GUESS', 'easy', 1000, 20, 'NewJeans - Hype Boy', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Điệu nhảy viral với câu nói ''I''m so hype boy'' trên TikTok thuộc ca khúc nào của NewJeans?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/11cta61Wi0g/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Điệu nhảy viral với câu nói ''I''m so hype boy'' trên TikTok thuộc ca khúc nào của NewJeans?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 225, 'K-Pop', 'Nhóm nhạc nữ aespa của SM Entertainment nổi tiếng với concept độc đáo nào?', '["Thế giới ảo Metaverse và các nhân vật ảo ae","Phong cách búp bê Barbie","Phong cách thần thoại Hy Lạp","Phong cách Rockband"]'::jsonb, 0, 'aespa gắn liền với vũ trụ Kwangya nơi 4 thành viên người thật kết nối với 4 phiên bản ảo tương ứng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Aespa_Love_Your_W_2025_1.jpg/330px-Aespa_Love_Your_W_2025_1.jpg', NULL, NULL, '4TWR90KJl84', 'AUDIO_GUESS', 'easy', 1000, 20, 'aespa - Next Level', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ aespa của SM Entertainment nổi tiếng với concept độc đáo nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Aespa_Love_Your_W_2025_1.jpg/330px-Aespa_Love_Your_W_2025_1.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ aespa của SM Entertainment nổi tiếng với concept độc đáo nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 226, 'K-Pop', 'Ca khúc ''Next Level'' với giai điệu gây nghiện và động tác tay gập chữ L là của nhóm nhạc nào?', '["LE SSERAFIM","ITZY","IVE","aespa"]'::jsonb, 3, '''Next Level'' của aespa đã tạo nên cơn sốt vũ đạo chữ L khắp Hàn Quốc năm 2021.',
  'https://img.youtube.com/vi/4TWR90KJl84/hqdefault.jpg', NULL, NULL, '4TWR90KJl84', 'AUDIO_GUESS', 'easy', 1000, 20, 'aespa - Next Level', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Next Level'' với giai điệu gây nghiện và động tác tay gập chữ L là của nhóm nhạc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/4TWR90KJl84/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Next Level'' với giai điệu gây nghiện và động tác tay gập chữ L là của nhóm nhạc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 227, 'K-Pop', 'Trung tâm thị giác (center) nổi tiếng của nhóm nhạc nữ IVE với chiều cao ấn tượng và visual búp bê là ai?', '["Liz","An Yu-jin","Jang Won-young","Rei"]'::jsonb, 2, 'Jang Won-young là ''it-girl'' hàng đầu thế hệ mới của K-Pop, tạo ra vô số trào lưu trang điểm và thời trang.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'Y8JFxS1HlDo', 'AUDIO_GUESS', 'medium', 1000, 20, 'IVE - LOVE DIVE', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trung tâm thị giác (center) nổi tiếng của nhóm nhạc nữ IVE với chiều cao ấn tượng và visual búp bê là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trung tâm thị giác (center) nổi tiếng của nhóm nhạc nữ IVE với chiều cao ấn tượng và visual búp bê là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 228, 'K-Pop', 'Bản hit ''Love Dive'' đã mang về giải Daesang ''Bài hát của năm'' cho nhóm nhạc nào năm 2022?', '["NewJeans","IVE","LE SSERAFIM","(G)I-DLE"]'::jsonb, 1, 'IVE thắng lớn Daesang Song of the Year tại MAMA 2022 với bản hit ''Love Dive''.',
  'https://img.youtube.com/vi/Y8JFxS1HlDo/hqdefault.jpg', NULL, NULL, '11cta61Wi0g', 'AUDIO_GUESS', 'medium', 1000, 20, 'NewJeans - Hype Boy', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit ''Love Dive'' đã mang về giải Daesang ''Bài hát của năm'' cho nhóm nhạc nào năm 2022?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/Y8JFxS1HlDo/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit ''Love Dive'' đã mang về giải Daesang ''Bài hát của năm'' cho nhóm nhạc nào năm 2022?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 229, 'K-Pop', 'Nhóm nhạc nam SEVENTEEN gồm có bao nhiêu thành viên chính thức?', '["13 thành viên","17 thành viên","11 thành viên","9 thành viên"]'::jsonb, 0, 'Dù tên là SEVENTEEN nhưng nhóm có 13 thành viên + 3 unit phụ + 1 nhóm hợp nhất = 17.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg', NULL, NULL, 'zSQ48zyWZrY', 'AUDIO_GUESS', 'medium', 1000, 20, 'SEVENTEEN - Don''t Wanna Cry', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam SEVENTEEN gồm có bao nhiêu thành viên chính thức?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam SEVENTEEN gồm có bao nhiêu thành viên chính thức?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  23, 230, 'K-Pop', 'Nhóm nhạc nam EXO khi mới ra mắt năm 2012 được chia thành 2 nhóm nhỏ hoạt động tại Hàn Quốc và Trung Quốc là gì?', '["EXO-Alpha và EXO-Beta","EXO-KR và EXO-CN","EXO-East và EXO-West","EXO-K và EXO-M"]'::jsonb, 3, 'EXO-K biểu diễn bằng tiếng Hàn và EXO-M biểu diễn bằng tiếng Quan Thoại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/91/Exo_monster_160618_suwon.png/330px-Exo_monster_160618_suwon.png', NULL, NULL, 'rBG5L7GSmVE', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - No More Dream', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam EXO khi mới ra mắt năm 2012 được chia thành 2 nhóm nhỏ hoạt động tại Hàn Quốc và Trung Quốc là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/91/Exo_monster_160618_suwon.png/330px-Exo_monster_160618_suwon.png' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam EXO khi mới ra mắt năm 2012 được chia thành 2 nhóm nhỏ hoạt động tại Hàn Quốc và Trung Quốc là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 231, 'K-Pop', 'Ca khúc ''Growl'' (Gầm gừ) với MV quay một cú máy liền mạch (one-take) ấn tượng là bước ngoặt của nhóm nào?', '["GOT7","BTS","EXO","VIXX"]'::jsonb, 2, '''Growl'' phát hành năm 2013 đưa EXO trở thành hiện tượng triệu bản đĩa đầu tiên của K-Pop sau 12 năm.',
  'https://img.youtube.com/vi/I3dezFzsNss/hqdefault.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Growl'' (Gầm gừ) với MV quay một cú máy liền mạch (one-take) ấn tượng là bước ngoặt của nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/I3dezFzsNss/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Growl'' (Gầm gừ) với MV quay một cú máy liền mạch (one-take) ấn tượng là bước ngoặt của nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 232, 'K-Pop', 'Nhóm nhạc nữ cá tính 2NE1 dưới trướng YG gồm 4 thành viên nào?', '["Jisoo, Jennie, Rosé, Lisa","CL, Park Bom, Dara, Minzy","Hyuna, Sohyun, Jiyoon, Gayoon","Sunmi, Yeeun, Sohee, Yubin"]'::jsonb, 1, '2NE1 tiên phong phong cách girl-crush mạnh mẽ với thủ lĩnh CL, giọng ca chính Park Bom, visual Dara và cỗ máy nhảy Minzy.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'medium', 1000, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ cá tính 2NE1 dưới trướng YG gồm 4 thành viên nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ cá tính 2NE1 dưới trướng YG gồm 4 thành viên nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 233, 'K-Pop', 'Ca khúc nữ quyền bùng nổ ''I Am The Best'' (Tôi là số một) phát hành năm 2011 do nhóm nào thể hiện?', '["2NE1","4Minute","Sistar","T-ara"]'::jsonb, 0, 'Câu mở đầu ''Naega jeil jal naga'' (I am the best) của CL đã trở thành huyền thoại của K-Pop.',
  'https://img.youtube.com/vi/j7_lSP8Vc3o/hqdefault.jpg', NULL, NULL, 'j7_lSP8Vc3o', 'AUDIO_GUESS', 'medium', 1000, 20, '2NE1 - I Am The Best', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc nữ quyền bùng nổ ''I Am The Best'' (Tôi là số một) phát hành năm 2011 do nhóm nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/j7_lSP8Vc3o/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc nữ quyền bùng nổ ''I Am The Best'' (Tôi là số một) phát hành năm 2011 do nhóm nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 234, 'K-Pop', 'Nhóm nhạc nữ T-ara từng gây sốt khắp châu Á với vũ đạo xòe tay mèo trong ca khúc nào?', '["Day by Day","Roly-Poly","Lovey-Dovey","Bo Peep Bo Peep"]'::jsonb, 3, 'Điệu nhảy mèo đeo găng tay bông trong ''Bo Peep Bo Peep'' đã đưa T-ara lên đỉnh cao danh vọng.',
  'https://img.youtube.com/vi/9403-9CptH8/hqdefault.jpg', NULL, NULL, '9403-9CptH8', 'AUDIO_GUESS', 'medium', 1000, 20, 'T-ara - Bo Peep Bo Peep', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ T-ara từng gây sốt khắp châu Á với vũ đạo xòe tay mèo trong ca khúc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/9403-9CptH8/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ T-ara từng gây sốt khắp châu Á với vũ đạo xòe tay mèo trong ca khúc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 235, 'K-Pop', 'Ba công ty giải trí lớn nhất định hình lịch sử K-Pop thường được gọi chung là gì?', '["Top 3 K-Pop","The Holy Trinity","BIG 3 (SM, JYP, YG)","Hallyu Big 3"]'::jsonb, 2, 'Big 3 bao gồm SM Entertainment, JYP Entertainment và YG Entertainment thống trị nền công nghiệp giải trí Hàn Quốc suốt nhiều thập kỷ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ba công ty giải trí lớn nhất định hình lịch sử K-Pop thường được gọi chung là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Ba công ty giải trí lớn nhất định hình lịch sử K-Pop thường được gọi chung là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 236, 'K-Pop', 'Ca sĩ solo IU có biệt danh thân thương được truyền thông và công chúng Hàn Quốc trao tặng là gì?', '["Mối tình đầu quốc dân","Em gái quốc dân","Nữ hoàng ballad","Nàng tiên K-Pop"]'::jsonb, 1, 'IU (Lee Ji-eun) được phong danh hiệu ''Em gái quốc dân'' nhờ hình tượng trong sáng và giọng hát 3 nốt cao vút trong ''Good Day''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ solo IU có biệt danh thân thương được truyền thông và công chúng Hàn Quốc trao tặng là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Ca sĩ solo IU có biệt danh thân thương được truyền thông và công chúng Hàn Quốc trao tặng là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 237, 'K-Pop', 'Bài hát ''Good Day'' của IU nổi tiếng khắp các sân khấu âm nhạc nhờ điều đặc biệt gì?', '["Đoạn ngân 3 nốt cao liên tiếp ở cuối bài","Màn nhảy hip-hop điêu luyện","Màn rap nhanh như súng liên thanh","Tiếng đàn tranh cổ"]'::jsonb, 0, 'Kỹ thuật thanh nhạc phi thường với 3 nốt cao liên hồi không lấy hơi trong Good Day đã khẳng định đẳng cấp giọng hát của IU.',
  'https://img.youtube.com/vi/jeqdYqsrsA0/hqdefault.jpg', NULL, NULL, 'KhTeiaCezwM', 'AUDIO_GUESS', 'medium', 1000, 20, 'MAMAMOO - HIP', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bài hát ''Good Day'' của IU nổi tiếng khắp các sân khấu âm nhạc nhờ điều đặc biệt gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/jeqdYqsrsA0/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bài hát ''Good Day'' của IU nổi tiếng khắp các sân khấu âm nhạc nhờ điều đặc biệt gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 238, 'K-Pop', 'Thành viên kiêm nhà sản xuất chính sáng tác hầu hết các bản hit của (G)I-DLE như ''Tomboy'', ''Queencard'' là ai?', '["Yuqi","Miyeon","Minnie","Soyeon (Jeon So-yeon)"]'::jsonb, 3, 'Trưởng nhóm Soyeon là thiên tài sáng tác và rapper cực chất đứng sau linh hồn của (G)I-DLE.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành viên kiêm nhà sản xuất chính sáng tác hầu hết các bản hit của (G)I-DLE như ''Tomboy'', ''Queencard'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Thành viên kiêm nhà sản xuất chính sáng tác hầu hết các bản hit của (G)I-DLE như ''Tomboy'', ''Queencard'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 239, 'K-Pop', 'Câu hát viral ''My boob and booty is hot...'' thuộc ca khúc nào của (G)I-DLE năm 2023?', '["Nxde","Tomboy","Queencard","Klaxon"]'::jsonb, 2, '''Queencard'' với thông điệp tự tin vào ngoại hình bản thân đã tạo nên cơn bão vũ đạo toàn cầu.',
  'https://img.youtube.com/vi/7HDeem-JaSY/hqdefault.jpg', NULL, NULL, '7HDeem-JaSY', 'AUDIO_GUESS', 'medium', 1000, 20, '(G)I-DLE - Queencard', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu hát viral ''My boob and booty is hot...'' thuộc ca khúc nào của (G)I-DLE năm 2023?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/7HDeem-JaSY/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Câu hát viral ''My boob and booty is hot...'' thuộc ca khúc nào của (G)I-DLE năm 2023?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  24, 240, 'K-Pop', 'Thành viên nào của BTS đã phát hành album solo ''Golden'' và bản hit ''Seven'' hợp tác với Latto đạt quán quân Billboard Hot 100?', '["Jimin","Jungkook","V (Taehyung)","Suga"]'::jsonb, 1, 'Em út vàng Jungkook đã lập nên vô số kỷ lục thế giới với single mở đường ''Seven''.',
  'https://img.youtube.com/vi/QU9c0053UAU/hqdefault.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành viên nào của BTS đã phát hành album solo ''Golden'' và bản hit ''Seven'' hợp tác với Latto đạt quán quân Billboard Hot 100?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/QU9c0053UAU/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Thành viên nào của BTS đã phát hành album solo ''Golden'' và bản hit ''Seven'' hợp tác với Latto đạt quán quân Billboard Hot 100?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 241, 'K-Pop', 'Bản hit ''Cupid'' (Twin Version) của nhóm nhạc nữ tân binh nào đã làm mưa làm gió trên TikTok toàn cầu năm 2023?', '["FIFTY FIFTY","Kep1er","NMIXX","STAYC"]'::jsonb, 0, 'FIFTY FIFTY tạo nên kỳ tích lịch sử khi lọt sâu vào Billboard Hot 100 chỉ sau vài tháng ra mắt với ''Cupid''.',
  'https://img.youtube.com/vi/Qc7_zRjH808/hqdefault.jpg', NULL, NULL, 'Qc7_zRjH808', 'AUDIO_GUESS', 'medium', 1000, 20, 'FIFTY FIFTY - Cupid', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit ''Cupid'' (Twin Version) của nhóm nhạc nữ tân binh nào đã làm mưa làm gió trên TikTok toàn cầu năm 2023?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/Qc7_zRjH808/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit ''Cupid'' (Twin Version) của nhóm nhạc nữ tân binh nào đã làm mưa làm gió trên TikTok toàn cầu năm 2023?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 242, 'K-Pop', 'Nhóm nhạc nữ LE SSERAFIM gồm có cựu thành viên của nhóm IZ*ONE là ai?', '["Kang Hye-won và Kim Min-ju","Jang Won-young và An Yu-jin","Choi Ye-na và Jo Yu-ri","Miyawaki Sakura và Kim Chae-won"]'::jsonb, 3, 'Sakura và Chaewon cùng nhau tái xuất bùng nổ trong đội hình nhóm nhạc nữ LE SSERAFIM.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'pyf8cbqyfPs', 'AUDIO_GUESS', 'medium', 1000, 20, 'LE SSERAFIM - ANTIFRAGILE', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ LE SSERAFIM gồm có cựu thành viên của nhóm IZ*ONE là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ LE SSERAFIM gồm có cựu thành viên của nhóm IZ*ONE là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 243, 'K-Pop', 'Ca khúc solo ''Flower'' với vũ đạo nở hoa ở lòng bàn tay gây sốt toàn cầu là của thành viên nào thuộc BLACKPINK?', '["Rosé","Jennie","Jisoo","Lisa"]'::jsonb, 2, 'Chị cả Jisoo đã làm khuynh đảo mạng xã hội với điệu nhảy xoay cổ tay hoa nở trong MV ''Flower''.',
  'https://img.youtube.com/vi/YudHcBIxlYw/hqdefault.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'medium', 1000, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc solo ''Flower'' với vũ đạo nở hoa ở lòng bàn tay gây sốt toàn cầu là của thành viên nào thuộc BLACKPINK?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/YudHcBIxlYw/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc solo ''Flower'' với vũ đạo nở hoa ở lòng bàn tay gây sốt toàn cầu là của thành viên nào thuộc BLACKPINK?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 244, 'K-Pop', 'Vật phẩm cầm tay phát sáng đặc trưng mà fan K-Pop mang theo cổ vũ thần tượng trong concert được gọi là gì?', '["Flashlight","Lightstick","Glowstick","Fanstay"]'::jsonb, 1, 'Mỗi nhóm nhạc đều thiết kế riêng một chiếc Lightstick độc quyền với biểu tượng, màu sắc và điều khiển bluetooth đổi màu theo nhạc concert.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'medium', 1000, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vật phẩm cầm tay phát sáng đặc trưng mà fan K-Pop mang theo cổ vũ thần tượng trong concert được gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Vật phẩm cầm tay phát sáng đặc trưng mà fan K-Pop mang theo cổ vũ thần tượng trong concert được gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 245, 'K-Pop', 'Lightstick hình chiếc búa hơi đồ chơi phát ra tiếng kêu ''chíp chíp'' màu đen hồng là của nhóm nhạc nào?', '["BLACKPINK (Bi-ping-bong)","BTS","TWICE","Red Velvet"]'::jsonb, 0, 'Chiếc búa đồ chơi bóp kêu chíp chíp độc nhất vô nhị của BLACKPINK được thiết kế bởi chính 4 cô gái.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'hard', 1200, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Lightstick hình chiếc búa hơi đồ chơi phát ra tiếng kêu ''chíp chíp'' màu đen hồng là của nhóm nhạc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Lightstick hình chiếc búa hơi đồ chơi phát ra tiếng kêu ''chíp chíp'' màu đen hồng là của nhóm nhạc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 246, 'K-Pop', 'Ca khúc ''Mirotic'' (2008) với câu hát huyền thoại ''I got you under my skin'' là của nhóm nhạc huyền thoại nào?', '["2PM","Super Junior","SS501","TVXQ (DBSK)"]'::jsonb, 3, 'Những vị thần phương Đông TVXQ với đội hình 5 người đã tạo nên kiệt tác ''Mirotic'' bất hủ.',
  'https://img.youtube.com/vi/HtJS32n6LNQ/hqdefault.jpg', NULL, NULL, 'x6QA3m58DQw', 'AUDIO_GUESS', 'hard', 1200, 20, 'Super Junior - Sorry, Sorry', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Mirotic'' (2008) với câu hát huyền thoại ''I got you under my skin'' là của nhóm nhạc huyền thoại nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/HtJS32n6LNQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Mirotic'' (2008) với câu hát huyền thoại ''I got you under my skin'' là của nhóm nhạc huyền thoại nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 247, 'K-Pop', 'Thành viên Rosé (Park Chae-young) của BLACKPINK sinh ra ở New Zealand và lớn lên tại thành phố nào của nước Úc?', '["Brisbane","Sydney","Melbourne","Perth"]'::jsonb, 2, 'Rosé lớn lên tại thành phố Melbourne (Australia) trước khi xuất sắc vượt qua buổi tuyển chọn của YG Entertainment.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg/330px-Blackpink_Ros%C3%A9_Rimowa_1.jpg', NULL, NULL, '2S24-y0Ij3Y', 'AUDIO_GUESS', 'hard', 1200, 20, 'BLACKPINK - Kill This Love', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành viên Rosé (Park Chae-young) của BLACKPINK sinh ra ở New Zealand và lớn lên tại thành phố nào của nước Úc?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg/330px-Blackpink_Ros%C3%A9_Rimowa_1.jpg' WHERE lower(trim(prompt)) = lower('Thành viên Rosé (Park Chae-young) của BLACKPINK sinh ra ở New Zealand và lớn lên tại thành phố nào của nước Úc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 248, 'K-Pop', 'Nam ca sĩ Taeyang (BIGBANG) đã kết hợp cùng ai trong bản hit ballad lãng mạn ''VIBE'' năm 2023?', '["Jungkook (BTS)","Jimin (BTS)","G-Dragon","Jay Park"]'::jsonb, 1, 'Màn kết hợp lịch sử giữa hai giọng ca vàng Taeyang và Jimin (BTS) đã tạo nên bản hit ''VIBE''.',
  'https://img.youtube.com/vi/cXCBiF67jLM/hqdefault.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'hard', 1200, 20, 'BTS - Dynamite', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ Taeyang (BIGBANG) đã kết hợp cùng ai trong bản hit ballad lãng mạn ''VIBE'' năm 2023?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/cXCBiF67jLM/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ Taeyang (BIGBANG) đã kết hợp cùng ai trong bản hit ballad lãng mạn ''VIBE'' năm 2023?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 249, 'K-Pop', 'Ca khúc ''Nobody'' (2008) với câu hát ''I want nobody nobody but you'' của Wonder Girls là ca khúc đầu tiên của nhóm nhạc Hàn Quốc lọt vào bảng xếp hạng nào của Mỹ?', '["Billboard Hot 100","UK Official Singles Chart","Rolling Stone Top 100","Grammy Nomination"]'::jsonb, 0, 'Wonder Girls là nhóm nhạc Hàn đầu tiên trong lịch sử ghi danh vào Billboard Hot 100 với vị trí thứ 76 nhờ bản hit Nobody.',
  'https://img.youtube.com/vi/BA7fdSkp8ds/hqdefault.jpg', NULL, NULL, 'BA7fdSkp8ds', 'AUDIO_GUESS', 'hard', 1200, 20, 'Wonder Girls - Nobody', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Nobody'' (2008) với câu hát ''I want nobody nobody but you'' của Wonder Girls là ca khúc đầu tiên của nhóm nhạc Hàn Quốc lọt vào bảng xếp hạng nào của Mỹ?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/BA7fdSkp8ds/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Nobody'' (2008) với câu hát ''I want nobody nobody but you'' của Wonder Girls là ca khúc đầu tiên của nhóm nhạc Hàn Quốc lọt vào bảng xếp hạng nào của Mỹ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  25, 250, 'K-Pop', 'Công ty giải trí nào là công ty mẹ đã tạo nên nhóm nhạc toàn cầu BTS và TXT?', '["YG Entertainment","SM Entertainment","JYP Entertainment","HYBE (tiền thân là Big Hit Entertainment)"]'::jsonb, 3, 'Chủ tịch Bang Si-hyuk đã dẫn dắt Big Hit Entertainment vươn mình thành tập đoàn giải trí khổng lồ HYBE Labels.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'gdZLi9oWNZg', 'AUDIO_GUESS', 'hard', 1200, 20, 'BTS - Dynamite', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Công ty giải trí nào là công ty mẹ đã tạo nên nhóm nhạc toàn cầu BTS và TXT?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Công ty giải trí nào là công ty mẹ đã tạo nên nhóm nhạc toàn cầu BTS và TXT?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 251, 'K-Pop', 'Nhóm nhạc nam K-Pop nào của công ty Pledis (HYBE) được chia thành 3 nhóm nhỏ: Hip-Hop Team, Vocal Team và Performance Team?', '["Stray Kids","NCT","SEVENTEEN","TXT"]'::jsonb, 2, 'SEVENTEEN gồm 13 thành viên + 3 nhóm nhỏ + 1 tập thể = 17.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg', NULL, NULL, 'zSQ48zyWZrY', 'AUDIO_GUESS', 'hard', 1200, 20, 'SEVENTEEN - Don''t Wanna Cry', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam K-Pop nào của công ty Pledis (HYBE) được chia thành 3 nhóm nhỏ: Hip-Hop Team, Vocal Team và Performance Team?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam K-Pop nào của công ty Pledis (HYBE) được chia thành 3 nhóm nhỏ: Hip-Hop Team, Vocal Team và Performance Team?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 252, 'K-Pop', 'Trong nhóm nhạc Stray Kids (JYP Entertainment), bộ ba tự sáng tác và sản xuất âm nhạc của nhóm có tên là gì?', '["BSS (BooSeokSoon)","3RACHA","NCT DoJaeJung","GD&TOP"]'::jsonb, 1, '3RACHA gồm Bang Chan, Changbin và Han là đội ngũ sản xuất âm nhạc chính của Stray Kids.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'TQTlCHxyuu8', 'AUDIO_GUESS', 'hard', 1200, 20, 'Stray Kids - God''s Menu', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong nhóm nhạc Stray Kids (JYP Entertainment), bộ ba tự sáng tác và sản xuất âm nhạc của nhóm có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trong nhóm nhạc Stray Kids (JYP Entertainment), bộ ba tự sáng tác và sản xuất âm nhạc của nhóm có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 253, 'K-Pop', 'Nhóm nhạc nữ thế hệ 4 nào trực thuộc Starship Entertainment có hai thành viên từng hoạt động trong IZ*ONE là Jang Won-young và An Yu-jin?', '["IVE","LE SSERAFIM","NewJeans","NMIXX"]'::jsonb, 0, 'IVE ra mắt năm 2021 với loạt bản hit ''Eleven'', ''Love Dive'', ''After LIKE'', ''I AM''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/NewJeans_2023_MelonMusicAwards_composite.jpg/330px-NewJeans_2023_MelonMusicAwards_composite.jpg', NULL, NULL, '11cta61Wi0g', 'AUDIO_GUESS', 'hard', 1200, 20, 'NewJeans - Hype Boy', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ thế hệ 4 nào trực thuộc Starship Entertainment có hai thành viên từng hoạt động trong IZ*ONE là Jang Won-young và An Yu-jin?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/NewJeans_2023_MelonMusicAwards_composite.jpg/330px-NewJeans_2023_MelonMusicAwards_composite.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ thế hệ 4 nào trực thuộc Starship Entertainment có hai thành viên từng hoạt động trong IZ*ONE là Jang Won-young và An Yu-jin?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 254, 'K-Pop', 'Ca khúc ''Love Dive'' của nhóm nhạc IVE đã giành giải Bài hát của năm (Daesang) vào năm nào?', '["2024","2020","2018","2022"]'::jsonb, 3, '''Love Dive'' thống trị các bảng xếp hạng Hàn Quốc và giành hàng loạt giải Daesang cuối năm 2022.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'Y8JFxS1HlDo', 'AUDIO_GUESS', 'hard', 1200, 20, 'IVE - LOVE DIVE', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Love Dive'' của nhóm nhạc IVE đã giành giải Bài hát của năm (Daesang) vào năm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Love Dive'' của nhóm nhạc IVE đã giành giải Bài hát của năm (Daesang) vào năm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 255, 'K-Pop', 'Nhóm nhạc nữ LE SSERAFIM trực thuộc công ty con nào của tập đoàn HYBE?', '["Belift Lab","ADOR","Source Music","Pledis"]'::jsonb, 2, 'LE SSERAFIM là nhóm nhạc nữ trực thuộc Source Music (HYBE) với các bản hit ''Antifragile'', ''Unforgiven''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg', NULL, NULL, 'pyf8cbqyfPs', 'AUDIO_GUESS', 'hard', 1200, 20, 'LE SSERAFIM - ANTIFRAGILE', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ LE SSERAFIM trực thuộc công ty con nào của tập đoàn HYBE?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/330px-Seventeen_Carat_Land_24.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ LE SSERAFIM trực thuộc công ty con nào của tập đoàn HYBE?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 256, 'K-Pop', 'Nhóm nhạc nam đầu tiên của nhà YG Entertainment gây sốt với bản hit ''Really Really'' năm 2017 là nhóm nào?', '["iKON","WINNER","TREASURE","BIGBANG"]'::jsonb, 1, 'WINNER ra mắt sau chương trình sống còn WIN: Who Is Next và có siêu hit ''Really Really''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/BIGBANG_2011_%28current_members_since_2023%29.jpg/330px-BIGBANG_2011_%28current_members_since_2023%29.jpg', NULL, NULL, 'MzCbEdtNbJ0', 'AUDIO_GUESS', 'hard', 1200, 20, 'BIGBANG - Haru Haru', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam đầu tiên của nhà YG Entertainment gây sốt với bản hit ''Really Really'' năm 2017 là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ce/BIGBANG_2011_%28current_members_since_2023%29.jpg/330px-BIGBANG_2011_%28current_members_since_2023%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam đầu tiên của nhà YG Entertainment gây sốt với bản hit ''Really Really'' năm 2017 là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 257, 'K-Pop', 'Siêu hit ''Love Scenario'' được học sinh tiểu học Hàn Quốc thuộc nằm lòng năm 2018 là của nhóm nhạc nào?', '["iKON","WINNER","BTOB","MONSTA X"]'::jsonb, 0, '''Love Scenario'' của nhóm iKON từng tạo cơn sốt toàn quốc và thắng giải Bài hát của năm tại MMA 2018.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'vecSVX1QYbQ', 'AUDIO_GUESS', 'hard', 1200, 20, 'iKON - LOVE SCENARIO', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Siêu hit ''Love Scenario'' được học sinh tiểu học Hàn Quốc thuộc nằm lòng năm 2018 là của nhóm nhạc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Siêu hit ''Love Scenario'' được học sinh tiểu học Hàn Quốc thuộc nằm lòng năm 2018 là của nhóm nhạc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 258, 'K-Pop', 'Nhóm nhạc nữ Red Velvet của SM Entertainment có 5 thành viên gồm Irene, Seulgi, Wendy, Joy và ai?', '["Ningning","Winter","Karina","Yeri"]'::jsonb, 3, 'Yeri là em út (maknae) gia nhập Red Velvet vào năm 2015 trong đợt quảng bá ''Ice Cream Cake''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, 'WyiIGEHQP8o', 'AUDIO_GUESS', 'hard', 1200, 20, 'Red Velvet - Red Flavor', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ Red Velvet của SM Entertainment có 5 thành viên gồm Irene, Seulgi, Wendy, Joy và ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ Red Velvet của SM Entertainment có 5 thành viên gồm Irene, Seulgi, Wendy, Joy và ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 259, 'K-Pop', 'Bản hit mùa hè ''Red Flavor'' và bản hit ma mị ''Psycho'' là của nhóm nhạc nữ nào?', '["MAMAMOO","TWICE","Red Velvet","GFRIEND"]'::jsonb, 2, 'Red Velvet nổi tiếng với 2 phong cách âm nhạc ''Red'' (tươi sáng) và ''Velvet'' (quyến rũ, ma mị).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b0/PSY_EMTV_logo_27_%288198008711%29.jpg/330px-PSY_EMTV_logo_27_%288198008711%29.jpg', NULL, NULL, '9bZkp7q19f0', 'AUDIO_GUESS', 'hard', 1200, 20, 'PSY - Gangnam Style', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit mùa hè ''Red Flavor'' và bản hit ma mị ''Psycho'' là của nhóm nhạc nữ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b0/PSY_EMTV_logo_27_%288198008711%29.jpg/330px-PSY_EMTV_logo_27_%288198008711%29.jpg' WHERE lower(trim(prompt)) = lower('Bản hit mùa hè ''Red Flavor'' và bản hit ma mị ''Psycho'' là của nhóm nhạc nữ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  26, 260, 'K-Pop', 'Nhóm nhạc nữ tài năng gồm 4 thành viên Solar, Moonbyul, Wheein và Hwasa có tên là gì?', '["SISTAR","MAMAMOO","2NE1","Brown Eyed Girls"]'::jsonb, 1, 'MAMAMOO nổi tiếng với khả năng hát live đỉnh cao và các bản hit ''HIP'', ''Starry Night''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f9/2NE1_2013_kpop_hologram_%28cropped%29.jpg/330px-2NE1_2013_kpop_hologram_%28cropped%29.jpg', NULL, NULL, 'j7_lSP8Vc3o', 'AUDIO_GUESS', 'hard', 1200, 20, '2NE1 - I Am The Best', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ tài năng gồm 4 thành viên Solar, Moonbyul, Wheein và Hwasa có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f9/2NE1_2013_kpop_hologram_%28cropped%29.jpg/330px-2NE1_2013_kpop_hologram_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nữ tài năng gồm 4 thành viên Solar, Moonbyul, Wheein và Hwasa có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 261, 'US-UK', 'Ai được mệnh danh là ''Ông hoàng nhạc Pop'' (King of Pop) với những bước nhảy Moonwalk huyền thoại?', '["Freddie Mercury","Elvis Presley","Prince","Michael Jackson"]'::jsonb, 3, 'Michael Jackson là nghệ sĩ giải trí vĩ đại nhất mọi thời đại với album bán chạy nhất lịch sử ''Thriller''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'easy', 1000, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai được mệnh danh là ''Ông hoàng nhạc Pop'' (King of Pop) với những bước nhảy Moonwalk huyền thoại?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Ai được mệnh danh là ''Ông hoàng nhạc Pop'' (King of Pop) với những bước nhảy Moonwalk huyền thoại?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 262, 'US-UK', 'Album nào của Michael Jackson phát hành năm 1982 là album bán chạy nhất mọi thời đại trong lịch sử âm nhạc?', '["Dangerous","Bad","Thriller","Off the Wall"]'::jsonb, 2, '''Thriller'' đã bán được hơn 70 triệu bản trên toàn thế giới với các siêu hit ''Billie Jean'', ''Beat It''.',
  'https://img.youtube.com/vi/sOnqjkJTMaA/hqdefault.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'easy', 1000, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Album nào của Michael Jackson phát hành năm 1982 là album bán chạy nhất mọi thời đại trong lịch sử âm nhạc?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/sOnqjkJTMaA/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Album nào của Michael Jackson phát hành năm 1982 là album bán chạy nhất mọi thời đại trong lịch sử âm nhạc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 263, 'US-UK', 'Nữ ca sĩ nào là chủ nhân của chuyến lưu diễn kỷ lục lịch sử ''The Eras Tour'' và có fandom mang tên Swifties?', '["Beyoncé","Taylor Swift","Katy Perry","Ariana Grande"]'::jsonb, 1, 'Taylor Swift là một trong những nghệ sĩ có tầm ảnh hưởng văn hóa và kinh tế lớn nhất thế kỷ 21.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, 'nfWlot6h_JM', 'AUDIO_GUESS', 'easy', 1000, 20, 'Taylor Swift - Shake It Off', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào là chủ nhân của chuyến lưu diễn kỷ lục lịch sử ''The Eras Tour'' và có fandom mang tên Swifties?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào là chủ nhân của chuyến lưu diễn kỷ lục lịch sử ''The Eras Tour'' và có fandom mang tên Swifties?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 264, 'US-UK', 'Bản hit bất hủ ''Someone Like You'' và ''Rolling in the Deep'' thuộc về ''Họa mi nước Anh'' nào?', '["Adele","Dua Lipa","Ellie Goulding","Amy Winehouse"]'::jsonb, 0, 'Adele sở hữu chất giọng mezzo-soprano đầy nội lực và là chủ nhân của hàng chục tượng vàng Grammy.',
  'https://img.youtube.com/vi/rYEDA3JcQqw/hqdefault.jpg', NULL, NULL, 'rYEDA3JcQqw', 'AUDIO_GUESS', 'easy', 1000, 20, 'Adele - Rolling in the Deep', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit bất hủ ''Someone Like You'' và ''Rolling in the Deep'' thuộc về ''Họa mi nước Anh'' nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/rYEDA3JcQqw/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit bất hủ ''Someone Like You'' và ''Rolling in the Deep'' thuộc về ''Họa mi nước Anh'' nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 265, 'US-UK', 'Bản tình ca ''Shape of You'' với hơn 6 tỷ lượt xem trên YouTube là của nam ca sĩ người Anh nào?', '["Shawn Mendes","Sam Smith","Harry Styles","Ed Sheeran"]'::jsonb, 3, '''Shape of You'' nằm trong album ''÷'' (Divide) của Ed Sheeran là một trong những ca khúc được nghe nhiều nhất trên Spotify.',
  'https://img.youtube.com/vi/JGwWNGJdvx8/hqdefault.jpg', NULL, NULL, 'JGwWNGJdvx8', 'AUDIO_GUESS', 'easy', 1000, 20, 'Ed Sheeran - Shape of You', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản tình ca ''Shape of You'' với hơn 6 tỷ lượt xem trên YouTube là của nam ca sĩ người Anh nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/JGwWNGJdvx8/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản tình ca ''Shape of You'' với hơn 6 tỷ lượt xem trên YouTube là của nam ca sĩ người Anh nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 266, 'US-UK', 'Ban nhạc rock huyền thoại người Anh với giọng ca chính Freddie Mercury và kiệt tác ''Bohemian Rhapsody'' là nhóm nào?', '["The Rolling Stones","The Beatles","Queen","Pink Floyd"]'::jsonb, 2, 'Ban nhạc Queen nổi tiếng toàn cầu với ''Bohemian Rhapsody'', ''We Will Rock You'' và ''We Are The Champions''.',
  'https://img.youtube.com/vi/fJ9rUzIMcZQ/hqdefault.jpg', NULL, NULL, 'fJ9rUzIMcZQ', 'AUDIO_GUESS', 'easy', 1000, 20, 'Queen - Bohemian Rhapsody', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại người Anh với giọng ca chính Freddie Mercury và kiệt tác ''Bohemian Rhapsody'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/fJ9rUzIMcZQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại người Anh với giọng ca chính Freddie Mercury và kiệt tác ''Bohemian Rhapsody'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 267, 'US-UK', 'Tứ quái thành phố cảng Liverpool (The Fab Four) gồm John Lennon, Paul McCartney, George Harrison và Ringo Starr thuộc ban nhạc nào?', '["Oasis","The Beatles","U2","The Who"]'::jsonb, 1, 'The Beatles là ban nhạc có sức ảnh hưởng sâu sắc nhất đến lịch sử âm nhạc hiện đại nhân loại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/42/The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg/330px-The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg', NULL, NULL, 'A_MjCqQoLLA', 'AUDIO_GUESS', 'easy', 1000, 20, 'The Beatles - Hey Jude', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tứ quái thành phố cảng Liverpool (The Fab Four) gồm John Lennon, Paul McCartney, George Harrison và Ringo Starr thuộc ban nhạc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/42/The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg/330px-The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg' WHERE lower(trim(prompt)) = lower('Tứ quái thành phố cảng Liverpool (The Fab Four) gồm John Lennon, Paul McCartney, George Harrison và Ringo Starr thuộc ban nhạc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 268, 'US-UK', 'Ca khúc nào được coi là bài thánh ca Giáng sinh bất hủ của Mariah Carey cứ đến tháng 12 hàng năm lại leo lên No.1 Billboard?', '["All I Want for Christmas Is You","Last Christmas","Jingle Bell Rock","Santa Tell Me"]'::jsonb, 0, 'Mariah Carey được mệnh danh là ''Nữ hoàng Giáng sinh'' nhờ bản hit All I Want for Christmas Is You ra đời từ năm 1994.',
  'https://img.youtube.com/vi/yXQViqx6GMY/hqdefault.jpg', NULL, NULL, 'yXQViqx6GMY', 'AUDIO_GUESS', 'easy', 1000, 20, 'Mariah Carey - All I Want For Christmas Is You', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc nào được coi là bài thánh ca Giáng sinh bất hủ của Mariah Carey cứ đến tháng 12 hàng năm lại leo lên No.1 Billboard?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/yXQViqx6GMY/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc nào được coi là bài thánh ca Giáng sinh bất hủ của Mariah Carey cứ đến tháng 12 hàng năm lại leo lên No.1 Billboard?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 269, 'US-UK', 'Nam ca sĩ người Canada từng gây sốt toàn thế giới ở tuổi thiếu niên với siêu hit ''Baby'' (2010) là ai?', '["Drake","Shawn Mendes","The Weeknd","Justin Bieber"]'::jsonb, 3, 'Justin Bieber trở thành thần tượng tuổi teen toàn cầu với ca khúc ''Baby'' và cộng đồng Beliebers hùng hậu.',
  'https://img.youtube.com/vi/kffacxfA7G4/hqdefault.jpg', NULL, NULL, 'kffacxfA7G4', 'AUDIO_GUESS', 'easy', 1000, 20, 'Justin Bieber - Baby', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Canada từng gây sốt toàn thế giới ở tuổi thiếu niên với siêu hit ''Baby'' (2010) là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/kffacxfA7G4/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Canada từng gây sốt toàn thế giới ở tuổi thiếu niên với siêu hit ''Baby'' (2010) là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  27, 270, 'US-UK', 'Ca khúc ''See You Again'' tưởng nhớ cố diễn viên Paul Walker trong phim Fast & Furious 7 là của Wiz Khalifa và ai?', '["Justin Bieber","Bruno Mars","Charlie Puth","John Legend"]'::jsonb, 2, 'Charlie Puth thể hiện đoạn điệp khúc piano xúc động đã đưa ''See You Again'' vượt mốc 6 tỷ lượt xem.',
  'https://img.youtube.com/vi/RgKAFK5djSk/hqdefault.jpg', NULL, NULL, 'kffacxfA7G4', 'AUDIO_GUESS', 'easy', 1000, 20, 'Justin Bieber - Baby', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''See You Again'' tưởng nhớ cố diễn viên Paul Walker trong phim Fast & Furious 7 là của Wiz Khalifa và ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/RgKAFK5djSk/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''See You Again'' tưởng nhớ cố diễn viên Paul Walker trong phim Fast & Furious 7 là của Wiz Khalifa và ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 271, 'US-UK', 'Nữ ca sĩ nào được mệnh danh là ''Queen Bey'' và là nghệ sĩ đoạt nhiều giải Grammy nhất trong lịch sử?', '["Rihanna","Beyoncé","Madonna","Lady Gaga"]'::jsonb, 1, 'Beyoncé nắm giữ kỷ lục vô tiền khoáng hậu với hơn 32 chiếc kèn vàng Grammy danh giá.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, 'fJ9rUzIMcZQ', 'AUDIO_GUESS', 'easy', 1000, 20, 'Queen - Bohemian Rhapsody', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Queen Bey'' và là nghệ sĩ đoạt nhiều giải Grammy nhất trong lịch sử?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Queen Bey'' và là nghệ sĩ đoạt nhiều giải Grammy nhất trong lịch sử?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 272, 'US-UK', 'Ca khúc retro funk bùng nổ ''Uptown Funk'' là sản phẩm hợp tác giữa nhà sản xuất Mark Ronson và nam ca sĩ nào?', '["Bruno Mars","The Weeknd","Pharrell Williams","Justin Timberlake"]'::jsonb, 0, 'Bruno Mars thể hiện năng lượng nhảy và giọng hát đỉnh cao trong bản hit ''Uptown Funk'' khuynh đảo năm 2014.',
  'https://img.youtube.com/vi/OPf0YbXqDm0/hqdefault.jpg', NULL, NULL, 'OPf0YbXqDm0', 'AUDIO_GUESS', 'easy', 1000, 20, 'Mark Ronson ft. Bruno Mars - Uptown Funk', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc retro funk bùng nổ ''Uptown Funk'' là sản phẩm hợp tác giữa nhà sản xuất Mark Ronson và nam ca sĩ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/OPf0YbXqDm0/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc retro funk bùng nổ ''Uptown Funk'' là sản phẩm hợp tác giữa nhà sản xuất Mark Ronson và nam ca sĩ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 273, 'US-UK', 'Nữ ca sĩ Gen Z với phong cách tóc hai màu nổi loạn, sở hữu 9 giải Grammy và 2 tượng vàng Oscar cho nhạc phim là ai?', '["Dua Lipa","Olivia Rodrigo","Sabrina Carpenter","Billie Eilish"]'::jsonb, 3, 'Billie Eilish sinh năm 2001 đã viết nên lịch sử khi đoạt cả giải Oscar cho ca khúc ''No Time To Die'' và ''What Was I Made For?''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg/330px-BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg', NULL, NULL, 'DyDfgMOUjCI', 'AUDIO_GUESS', 'easy', 1000, 20, 'Billie Eilish - bad guy', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z với phong cách tóc hai màu nổi loạn, sở hữu 9 giải Grammy và 2 tượng vàng Oscar cho nhạc phim là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg/330px-BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z với phong cách tóc hai màu nổi loạn, sở hữu 9 giải Grammy và 2 tượng vàng Oscar cho nhạc phim là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 274, 'US-UK', 'Ca khúc ''Bad Guy'' với tiếng thì thầm ''I''m the bad guy... duh'' là bản hit đưa tên tuổi ai lên đỉnh cao năm 2019?', '["Halsey","Lorde","Billie Eilish","Melanie Martinez"]'::jsonb, 2, '''Bad Guy'' đã càn quét cả 4 hạng mục chính (Big Four) của Grammy 2020 cho Billie Eilish và anh trai Finneas.',
  'https://img.youtube.com/vi/DyDfgMOUjCI/hqdefault.jpg', NULL, NULL, 'DyDfgMOUjCI', 'AUDIO_GUESS', 'easy', 1000, 20, 'Billie Eilish - bad guy', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Bad Guy'' với tiếng thì thầm ''I''m the bad guy... duh'' là bản hit đưa tên tuổi ai lên đỉnh cao năm 2019?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/DyDfgMOUjCI/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Bad Guy'' với tiếng thì thầm ''I''m the bad guy... duh'' là bản hit đưa tên tuổi ai lên đỉnh cao năm 2019?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 275, 'US-UK', 'Rapper da trắng nào được công nhận là một trong những rapper vĩ đại nhất lịch sử với biệt danh ''Rap God''?', '["Machine Gun Kelly","Eminem (Slim Shady)","Post Malone","Macklemore"]'::jsonb, 1, 'Eminem (Marshall Mathers) nổi tiếng với tốc độ bắn chữ thần tốc và kỹ thuật gieo vần đỉnh cao trong ''Lose Yourself'', ''Rap God''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg', NULL, NULL, '_Yhyp-_hX2s', 'AUDIO_GUESS', 'easy', 1000, 20, 'Eminem - Lose Yourself', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Rapper da trắng nào được công nhận là một trong những rapper vĩ đại nhất lịch sử với biệt danh ''Rap God''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg' WHERE lower(trim(prompt)) = lower('Rapper da trắng nào được công nhận là một trong những rapper vĩ đại nhất lịch sử với biệt danh ''Rap God''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 276, 'US-UK', 'Ca khúc ''Lose Yourself'' trong bộ phim ''8 Mile'' đã mang về cho Eminem giải thưởng điện ảnh danh giá nào?', '["Giải Oscar cho Ca khúc nhạc phim xuất sắc nhất","Giải Cành cọ vàng","Giải BAFTA","Giải Sư tử vàng"]'::jsonb, 0, 'Eminem là nghệ sĩ hip-hop đầu tiên trong lịch sử thắng giải Oscar cho hạng mục Ca khúc nhạc phim xuất sắc nhất.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg', NULL, NULL, '_Yhyp-_hX2s', 'AUDIO_GUESS', 'easy', 1000, 20, 'Eminem - Lose Yourself', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Lose Yourself'' trong bộ phim ''8 Mile'' đã mang về cho Eminem giải thưởng điện ảnh danh giá nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Lose Yourself'' trong bộ phim ''8 Mile'' đã mang về cho Eminem giải thưởng điện ảnh danh giá nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 277, 'US-UK', 'Ca khúc ''Blinding Lights'' của nghệ sĩ The Weeknd đã lập kỷ lục là bài hát trụ hạng lâu nhất trong lịch sử bảng xếp hạng nào?', '["Apple Music Top 100","UK Singles Chart","Spotify Global 50","Billboard Hot 100 (90 tuần)"]'::jsonb, 3, 'Bản synth-pop ''Blinding Lights'' đã được tạp chí Billboard vinh danh là ca khúc số 1 mọi thời đại trên Billboard Hot 100.',
  'https://img.youtube.com/vi/4NRXx6U8ABQ/hqdefault.jpg', NULL, NULL, '4NRXx6U8ABQ', 'AUDIO_GUESS', 'easy', 1000, 20, 'The Weeknd - Blinding Lights', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Blinding Lights'' của nghệ sĩ The Weeknd đã lập kỷ lục là bài hát trụ hạng lâu nhất trong lịch sử bảng xếp hạng nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/4NRXx6U8ABQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Blinding Lights'' của nghệ sĩ The Weeknd đã lập kỷ lục là bài hát trụ hạng lâu nhất trong lịch sử bảng xếp hạng nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 278, 'US-UK', 'Nữ ca sĩ nào từng biểu diễn tại Super Bowl với hình tượng diện váy thịt bò nổi tiếng và bản hit ''Bad Romance''?', '["Nicki Minaj","Katy Perry","Lady Gaga","Miley Cyrus"]'::jsonb, 2, 'Lady Gaga là biểu tượng âm nhạc quái chiêu với giọng hát opera nội lực và các bản hit ''Poker Face'', ''Born This Way'', ''Shallow''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/330px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg', NULL, NULL, 'qrO4YZeyl0I', 'AUDIO_GUESS', 'easy', 1000, 20, 'Lady Gaga - Bad Romance', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng biểu diễn tại Super Bowl với hình tượng diện váy thịt bò nổi tiếng và bản hit ''Bad Romance''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/330px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng biểu diễn tại Super Bowl với hình tượng diện váy thịt bò nổi tiếng và bản hit ''Bad Romance''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 279, 'US-UK', 'Ai là nữ ca sĩ tỉ phú đến từ đảo quốc Barbados sở hữu đế chế mỹ phẩm Fenty Beauty và bản hit ''Umbrella''?', '["Beyoncé","Rihanna","Nicki Minaj","Cardi B"]'::jsonb, 1, 'Rihanna sở hữu 14 đĩa đơn No.1 Billboard Hot 100 và là một trong những nữ doanh nhân âm nhạc giàu nhất thế giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg/330px-Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg', NULL, NULL, 'kZhuwYyJmTE', 'AUDIO_GUESS', 'medium', 1000, 20, 'Rihanna - Diamonds', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là nữ ca sĩ tỉ phú đến từ đảo quốc Barbados sở hữu đế chế mỹ phẩm Fenty Beauty và bản hit ''Umbrella''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg/330px-Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg' WHERE lower(trim(prompt)) = lower('Ai là nữ ca sĩ tỉ phú đến từ đảo quốc Barbados sở hữu đế chế mỹ phẩm Fenty Beauty và bản hit ''Umbrella''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  28, 280, 'US-UK', 'Ca khúc ''Roar'' và ''Dark Horse'' với hàng tỷ lượt xem là của nữ ca sĩ nhạc pop người Mỹ nào?', '["Katy Perry","Taylor Swift","Selena Gomez","Demi Lovato"]'::jsonb, 0, 'Katy Perry từng làm nên lịch sử khi có 5 đĩa đơn quán quân trong cùng một album ''Teenage Dream'' (ngang bằng kỷ lục của Michael Jackson).',
  'https://img.youtube.com/vi/CevxZvSJLk8/hqdefault.jpg', NULL, NULL, 'nfWlot6h_JM', 'AUDIO_GUESS', 'medium', 1000, 20, 'Taylor Swift - Shake It Off', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Roar'' và ''Dark Horse'' với hàng tỷ lượt xem là của nữ ca sĩ nhạc pop người Mỹ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/CevxZvSJLk8/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Roar'' và ''Dark Horse'' với hàng tỷ lượt xem là của nữ ca sĩ nhạc pop người Mỹ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 281, 'US-UK', 'Ban nhạc pop-rock nổi tiếng nước Mỹ do thủ lĩnh Adam Levine dẫn dắt với các hit ''Sugar'', ''Payphone'', ''Moves Like Jagger'' là nhóm nào?', '["Coldplay","Imagine Dragons","OneRepublic","Maroon 5"]'::jsonb, 3, 'Maroon 5 với giọng hát falsetto đặc trưng của Adam Levine đã càn quét các bảng xếp hạng toàn cầu suốt 2 thập kỷ.',
  'https://img.youtube.com/vi/09R8_2nJtjg/hqdefault.jpg', NULL, NULL, '09R8_2nJtjg', 'AUDIO_GUESS', 'medium', 1000, 20, 'Maroon 5 - Sugar', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc pop-rock nổi tiếng nước Mỹ do thủ lĩnh Adam Levine dẫn dắt với các hit ''Sugar'', ''Payphone'', ''Moves Like Jagger'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/09R8_2nJtjg/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ban nhạc pop-rock nổi tiếng nước Mỹ do thủ lĩnh Adam Levine dẫn dắt với các hit ''Sugar'', ''Payphone'', ''Moves Like Jagger'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 282, 'US-UK', 'Ban nhạc rock nước Anh nổi tiếng với phong cách concert ngập tràn ánh sáng laser, vòng tay phát quang và ca khúc ''Viva La Vida'' là nhóm nào?', '["Muse","Radiohead","Coldplay","Arctic Monkeys"]'::jsonb, 2, 'Coldplay do Chris Martin làm trưởng nhóm là một trong những ban nhạc có tour diễn concert thu hút lượng khán giả lớn nhất lịch sử.',
  'https://img.youtube.com/vi/dvgZkm1xWPE/hqdefault.jpg', NULL, NULL, 'dvgZkm1xWPE', 'AUDIO_GUESS', 'medium', 1000, 20, 'Coldplay - Viva La Vida', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc rock nước Anh nổi tiếng với phong cách concert ngập tràn ánh sáng laser, vòng tay phát quang và ca khúc ''Viva La Vida'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/dvgZkm1xWPE/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ban nhạc rock nước Anh nổi tiếng với phong cách concert ngập tràn ánh sáng laser, vòng tay phát quang và ca khúc ''Viva La Vida'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 283, 'US-UK', 'Ca khúc ''Believer'' và ''Demons'' tràn đầy năng lượng mạnh mẽ thuộc về ban nhạc rock nào?', '["OneRepublic","Imagine Dragons","Fall Out Boy","Linkin Park"]'::jsonb, 1, 'Imagine Dragons nổi tiếng với tiếng trống dồn dập và giọng hát đầy nhiệt huyết của Dan Reynolds.',
  'https://img.youtube.com/vi/7wtfhZwyrcc/hqdefault.jpg', NULL, NULL, 'eVTXPUF4Oz4', 'AUDIO_GUESS', 'medium', 1000, 20, 'Linkin Park - In The End', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Believer'' và ''Demons'' tràn đầy năng lượng mạnh mẽ thuộc về ban nhạc rock nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/7wtfhZwyrcc/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Believer'' và ''Demons'' tràn đầy năng lượng mạnh mẽ thuộc về ban nhạc rock nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 284, 'US-UK', 'Ban nhạc nu-metal huyền thoại với cố thủ lĩnh Chester Bennington và kiệt tác ''In The End'', ''Numb'' là nhóm nào?', '["Linkin Park","Limp Bizkit","Evanescence","Green Day"]'::jsonb, 0, 'Linkin Park đã định hình tuổi thơ của hàng triệu khán giả đầu thập niên 2000 qua album ''Hybrid Theory'' và ''Meteora''.',
  'https://img.youtube.com/vi/eVTXPUF4Oz4/hqdefault.jpg', NULL, NULL, 'eVTXPUF4Oz4', 'AUDIO_GUESS', 'medium', 1000, 20, 'Linkin Park - In The End', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc nu-metal huyền thoại với cố thủ lĩnh Chester Bennington và kiệt tác ''In The End'', ''Numb'' là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/eVTXPUF4Oz4/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ban nhạc nu-metal huyền thoại với cố thủ lĩnh Chester Bennington và kiệt tác ''In The End'', ''Numb'' là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 285, 'US-UK', 'Nữ ca sĩ nào có biệt danh ''Tiểu diva'' với chất giọng 4 quãng tám và bản hit ''7 Rings'', ''Thank U, Next''?', '["Bebe Rexha","Camila Cabello","Dua Lipa","Ariana Grande"]'::jsonb, 3, 'Ariana Grande sở hữu kỹ thuật whistle register (giọng sáo) siêu đẳng kế thừa phong cách của Mariah Carey.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Ariana_Grande_promoting_Wicked_%282024%29.jpg/330px-Ariana_Grande_promoting_Wicked_%282024%29.jpg', NULL, NULL, 'QYh6mYIJG2Y', 'AUDIO_GUESS', 'medium', 1000, 20, 'Ariana Grande - 7 rings', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào có biệt danh ''Tiểu diva'' với chất giọng 4 quãng tám và bản hit ''7 Rings'', ''Thank U, Next''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Ariana_Grande_promoting_Wicked_%282024%29.jpg/330px-Ariana_Grande_promoting_Wicked_%282024%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào có biệt danh ''Tiểu diva'' với chất giọng 4 quãng tám và bản hit ''7 Rings'', ''Thank U, Next''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 286, 'US-UK', 'Ca khúc nhạc phim hoạt hình Disney ''Frozen'' mang tên ''Let It Go'' do nữ ca sĩ/diễn viên Broadway nào thể hiện bản gốc trong phim?', '["Kristen Bell","Demi Lovato","Idina Menzel","Lea Michele"]'::jsonb, 2, 'Idina Menzel (lồng tiếng cho Nữ hoàng Elsa) đã cất giọng hát vang dội đoạt tượng vàng Oscar cho ''Let It Go''.',
  'https://img.youtube.com/vi/moSFlvxnbgk/hqdefault.jpg', NULL, NULL, 'moSFlvxnbgk', 'AUDIO_GUESS', 'medium', 1000, 20, 'Idina Menzel - Let It Go (from Frozen)', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc nhạc phim hoạt hình Disney ''Frozen'' mang tên ''Let It Go'' do nữ ca sĩ/diễn viên Broadway nào thể hiện bản gốc trong phim?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/moSFlvxnbgk/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc nhạc phim hoạt hình Disney ''Frozen'' mang tên ''Let It Go'' do nữ ca sĩ/diễn viên Broadway nào thể hiện bản gốc trong phim?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 287, 'US-UK', 'Ca khúc Latin pop ''Despacito'' (2017) của Luis Fonsi và Daddy Yankee từng giữ kỷ lục video nhiều lượt xem nhất YouTube đại diện cho dòng nhạc của vùng nào?', '["Mexico","Puerto Rico (Nhạc Latin)","Tây Ban Nha","Colombia"]'::jsonb, 1, '''Despacito'' ra đời tại Puerto Rico đã mở ra kỷ nguyên bùng nổ của âm nhạc tiếng Tây Ban Nha trên toàn thế giới.',
  'https://img.youtube.com/vi/kJQP7kiw5Fk/hqdefault.jpg', NULL, NULL, 'kJQP7kiw5Fk', 'AUDIO_GUESS', 'medium', 1000, 20, 'Luis Fonsi - Despacito ft. Daddy Yankee', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc Latin pop ''Despacito'' (2017) của Luis Fonsi và Daddy Yankee từng giữ kỷ lục video nhiều lượt xem nhất YouTube đại diện cho dòng nhạc của vùng nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/kJQP7kiw5Fk/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc Latin pop ''Despacito'' (2017) của Luis Fonsi và Daddy Yankee từng giữ kỷ lục video nhiều lượt xem nhất YouTube đại diện cho dòng nhạc của vùng nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 288, 'US-UK', 'Nữ ca sĩ nhạc pop người Anh gốc Albania sở hữu loạt hit disco ''Levitating'', ''Don''t Start Now'' là ai?', '["Dua Lipa","Rita Ora","Ava Max","Anne-Marie"]'::jsonb, 0, 'Dua Lipa đã hồi sinh dòng nhạc Disco hiện đại rực rỡ qua album ''Future Nostalgia''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'TUVcZfQe-Kw', 'AUDIO_GUESS', 'medium', 1000, 20, 'Dua Lipa - Levitating', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nhạc pop người Anh gốc Albania sở hữu loạt hit disco ''Levitating'', ''Don''t Start Now'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nhạc pop người Anh gốc Albania sở hữu loạt hit disco ''Levitating'', ''Don''t Start Now'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 289, 'US-UK', 'Nhóm nhạc nam nước Anh từng gây sốt toàn cầu bước ra từ cuộc thi The X Factor 2010 gồm 5 chàng trai là nhóm nào?', '["Jonas Brothers","The Wanted","5 Seconds of Summer","One Direction"]'::jsonb, 3, 'One Direction (Harry Styles, Zayn Malik, Liam Payne, Louis Tomlinson, Niall Horan) là boyband đình đám nhất thập niên 2010.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'medium', 1000, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam nước Anh từng gây sốt toàn cầu bước ra từ cuộc thi The X Factor 2010 gồm 5 chàng trai là nhóm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc nam nước Anh từng gây sốt toàn cầu bước ra từ cuộc thi The X Factor 2010 gồm 5 chàng trai là nhóm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  29, 290, 'US-UK', 'Bản tình ca acoustic ''Thinking Out Loud'' đã giúp Ed Sheeran lần đầu tiên giành giải Grammy ''Bài hát của năm'' vào năm nào?', '["2018","2013","2016","2020"]'::jsonb, 2, '''Thinking Out Loud'' là một trong những bản nhạc đám cưới lãng mạn được yêu thích nhất mọi thời đại.',
  'https://img.youtube.com/vi/lp-EO5I60KA/hqdefault.jpg', NULL, NULL, 'JGwWNGJdvx8', 'AUDIO_GUESS', 'medium', 1000, 20, 'Ed Sheeran - Shape of You', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản tình ca acoustic ''Thinking Out Loud'' đã giúp Ed Sheeran lần đầu tiên giành giải Grammy ''Bài hát của năm'' vào năm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/lp-EO5I60KA/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản tình ca acoustic ''Thinking Out Loud'' đã giúp Ed Sheeran lần đầu tiên giành giải Grammy ''Bài hát của năm'' vào năm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 291, 'US-UK', 'Ca khúc bất hủ ''My Heart Will Go On'' trong bộ phim kinh điển Titanic do diva huyền thoại nào thể hiện?', '["Whitney Houston","Céline Dion","Mariah Carey","Barbra Streisand"]'::jsonb, 1, 'Céline Dion với chất giọng cao vút, dạt dào cảm xúc đã biến ca khúc của James Horner thành bản tình ca vĩ đại.',
  'https://img.youtube.com/vi/WNIPqafd4As/hqdefault.jpg', NULL, NULL, 'yXQViqx6GMY', 'AUDIO_GUESS', 'medium', 1000, 20, 'Mariah Carey - All I Want For Christmas Is You', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc bất hủ ''My Heart Will Go On'' trong bộ phim kinh điển Titanic do diva huyền thoại nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/WNIPqafd4As/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc bất hủ ''My Heart Will Go On'' trong bộ phim kinh điển Titanic do diva huyền thoại nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 292, 'US-UK', 'Nữ diva sở hữu giọng hát ''The Voice'' huyền thoại với bản tình ca ''I Will Always Love You'' trong phim The Bodyguard là ai?', '["Whitney Houston","Aretha Franklin","Tina Turner","Diana Ross"]'::jsonb, 0, 'Whitney Houston với nốt ngân lịch sử trong ''I Will Always Love You'' là tiêu chuẩn vàng của mọi ca sĩ thanh nhạc thế giới.',
  'https://img.youtube.com/vi/3JWTaaS7LdU/hqdefault.jpg', NULL, NULL, '3JWTaaS7LdU', 'AUDIO_GUESS', 'medium', 1000, 20, 'Whitney Houston - I Will Always Love You', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ diva sở hữu giọng hát ''The Voice'' huyền thoại với bản tình ca ''I Will Always Love You'' trong phim The Bodyguard là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/3JWTaaS7LdU/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nữ diva sở hữu giọng hát ''The Voice'' huyền thoại với bản tình ca ''I Will Always Love You'' trong phim The Bodyguard là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 293, 'US-UK', 'Ca khúc ''Espresso'' và ''Please Please Please'' gây sốt toàn cầu mùa hè năm 2024 do nữ ca sĩ trẻ nào thể hiện?', '["Gracie Abrams","Chappell Roan","Olivia Rodrigo","Sabrina Carpenter"]'::jsonb, 3, 'Sabrina Carpenter với ca từ hóm hỉnh ''That''s that me espresso'' đã chiếm lĩnh các bảng xếp hạng thế giới suốt năm 2024.',
  'https://img.youtube.com/vi/eVli-tstM5E/hqdefault.jpg', NULL, NULL, 'ZmDBbnmKpqQ', 'AUDIO_GUESS', 'medium', 1000, 20, 'Olivia Rodrigo - drivers license', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Espresso'' và ''Please Please Please'' gây sốt toàn cầu mùa hè năm 2024 do nữ ca sĩ trẻ nào thể hiện?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/eVli-tstM5E/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Espresso'' và ''Please Please Please'' gây sốt toàn cầu mùa hè năm 2024 do nữ ca sĩ trẻ nào thể hiện?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 294, 'US-UK', 'Bản hit tuổi teen ''Drivers License'' đã đưa nữ ca sĩ sinh năm 2003 nào vụt sáng thành hiện tượng toàn cầu năm 2021?', '["Tate McRae","Billie Eilish","Olivia Rodrigo","Conan Gray"]'::jsonb, 2, 'Olivia Rodrigo lập kỷ lục lượt stream Spotify chỉ sau tuần đầu phát hành album ''SOUR''.',
  'https://img.youtube.com/vi/ZmDBbnmKpqQ/hqdefault.jpg', NULL, NULL, 'DyDfgMOUjCI', 'AUDIO_GUESS', 'medium', 1000, 20, 'Billie Eilish - bad guy', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit tuổi teen ''Drivers License'' đã đưa nữ ca sĩ sinh năm 2003 nào vụt sáng thành hiện tượng toàn cầu năm 2021?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/ZmDBbnmKpqQ/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit tuổi teen ''Drivers License'' đã đưa nữ ca sĩ sinh năm 2003 nào vụt sáng thành hiện tượng toàn cầu năm 2021?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 295, 'US-UK', 'Nữ ca sĩ nào từng đóng vai chính trong phim nhạc kịch ''A Star Is Born'' và cùng Bradley Cooper hát bài ''Shallow'' đoạt giải Oscar?', '["Beyoncé","Lady Gaga","Taylor Swift","Jennifer Lopez"]'::jsonb, 1, 'Màn song ca trực tiếp tại lễ trao giải Oscar giữa Lady Gaga và Bradley Cooper cho ca khúc ''Shallow'' đã đi vào lịch sử.',
  'https://img.youtube.com/vi/bo_efYhVmWk/hqdefault.jpg', NULL, NULL, 'nfWlot6h_JM', 'AUDIO_GUESS', 'medium', 1000, 20, 'Taylor Swift - Shake It Off', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng đóng vai chính trong phim nhạc kịch ''A Star Is Born'' và cùng Bradley Cooper hát bài ''Shallow'' đoạt giải Oscar?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/bo_efYhVmWk/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng đóng vai chính trong phim nhạc kịch ''A Star Is Born'' và cùng Bradley Cooper hát bài ''Shallow'' đoạt giải Oscar?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 296, 'US-UK', 'Nhóm nhạc electronic người Pháp Daft Punk nổi tiếng với bộ trang phục biểu diễn độc đáo nào?', '["Mũ bảo hiểm robot kim loại che kín mặt","Mặt nạ hóa trang Guy Fawkes","Trang phục phi hành gia NASA","Mặt nạ chú hề"]'::jsonb, 0, 'Daft Punk (Thomas Bangalter và Guy-Manuel de Homem-Christo) luôn xuất hiện trong hình tượng robot đội nón mạ chrome và vàng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'medium', 1000, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc electronic người Pháp Daft Punk nổi tiếng với bộ trang phục biểu diễn độc đáo nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc electronic người Pháp Daft Punk nổi tiếng với bộ trang phục biểu diễn độc đáo nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 297, 'US-UK', 'Bản hit ''Counting Stars'' đạt hàng tỷ view là của ban nhạc pop-rock người Mỹ nào do Ryan Tedder làm thủ lĩnh?', '["Snow Patrol","The Fray","Coldplay","OneRepublic"]'::jsonb, 3, 'Ryan Tedder - nhạc sĩ mát tay cho hàng loạt ngôi sao lớn - đã dẫn dắt OneRepublic tạo nên siêu hit ''Counting Stars''.',
  'https://img.youtube.com/vi/hT_nvWreIhg/hqdefault.jpg', NULL, NULL, 'dvgZkm1xWPE', 'AUDIO_GUESS', 'hard', 1200, 20, 'Coldplay - Viva La Vida', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bản hit ''Counting Stars'' đạt hàng tỷ view là của ban nhạc pop-rock người Mỹ nào do Ryan Tedder làm thủ lĩnh?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/hT_nvWreIhg/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Bản hit ''Counting Stars'' đạt hàng tỷ view là của ban nhạc pop-rock người Mỹ nào do Ryan Tedder làm thủ lĩnh?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 298, 'US-UK', 'Ca sĩ/nhạc sĩ mù người Mỹ sở hữu 25 giải Grammy và các bản tình ca ''I Just Called to Say I Love You'', ''Isn''t She Lovely'' là ai?', '["Andrea Bocelli","Ray Charles","Stevie Wonder","Lionel Richie"]'::jsonb, 2, 'Stevie Wonder là thiên tài âm nhạc chơi thành thạo piano, harmonica và trống từ thuở nhỏ.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/6/62/Grammy_Awards_logo.svg/330px-Grammy_Awards_logo.svg.png', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'hard', 1200, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ/nhạc sĩ mù người Mỹ sở hữu 25 giải Grammy và các bản tình ca ''I Just Called to Say I Love You'', ''Isn''t She Lovely'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/6/62/Grammy_Awards_logo.svg/330px-Grammy_Awards_logo.svg.png' WHERE lower(trim(prompt)) = lower('Ca sĩ/nhạc sĩ mù người Mỹ sở hữu 25 giải Grammy và các bản tình ca ''I Just Called to Say I Love You'', ''Isn''t She Lovely'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 299, 'US-UK', 'Album ''21'' của Adele lấy cảm hứng từ sự việc nào trong đời sống riêng của cô?', '["Lễ mừng sinh nhật tròn 21 tuổi","Cuộc chia tay đau đớn với mối tình ở tuổi 21","Kỷ niệm 21 năm ca hát","21 thành phố cô từng lưu diễn"]'::jsonb, 1, 'Adele đặt tên các album theo số tuổi quan trọng của mình (19, 21, 25, 30), trong đó album 21 viết về nỗi đau thất tình tan vỡ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Adele_2016.jpg/330px-Adele_2016.jpg', NULL, NULL, 'rYEDA3JcQqw', 'AUDIO_GUESS', 'hard', 1200, 20, 'Adele - Rolling in the Deep', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Album ''21'' của Adele lấy cảm hứng từ sự việc nào trong đời sống riêng của cô?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Adele_2016.jpg/330px-Adele_2016.jpg' WHERE lower(trim(prompt)) = lower('Album ''21'' của Adele lấy cảm hứng từ sự việc nào trong đời sống riêng của cô?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  30, 300, 'US-UK', 'Ca khúc ''Hotel California'' (1976) với đoạn solo guitar kết thúc kinh điển là của ban nhạc rock nào?', '["Eagles","Aerosmith","Guns N'' Roses","Fleetwood Mac"]'::jsonb, 0, 'Ban nhạc Eagles đã tạo ra tuyệt phẩm ''Hotel California'' - một trong những bài hát rock bất hủ nhất thế kỷ 20.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, '09839DpTctU', 'AUDIO_GUESS', 'hard', 1200, 20, 'Eagles - Hotel California', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Hotel California'' (1976) với đoạn solo guitar kết thúc kinh điển là của ban nhạc rock nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Hotel California'' (1976) với đoạn solo guitar kết thúc kinh điển là của ban nhạc rock nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 301, 'US-UK', 'Ca khúc ''Havana'' mang âm hưởng quê hương Cuba của nữ ca sĩ nào đã đứng đầu bảng xếp hạng Billboard năm 2017?', '["Becky G","Selena Gomez","Rosalía","Camila Cabello"]'::jsonb, 3, 'Camila Cabello (cựu thành viên nhóm Fifth Harmony) đã có bước đột phá solo xuất sắc với ''Havana ooh na-na''.',
  'https://img.youtube.com/vi/BQ0mxQXmMsk/hqdefault.jpg', NULL, NULL, 'BQ0mxQXmMsk', 'AUDIO_GUESS', 'hard', 1200, 20, 'Camila Cabello - Havana ft. Young Thug', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''Havana'' mang âm hưởng quê hương Cuba của nữ ca sĩ nào đã đứng đầu bảng xếp hạng Billboard năm 2017?')
);
UPDATE public.quiz_questions SET image_url = 'https://img.youtube.com/vi/BQ0mxQXmMsk/hqdefault.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc ''Havana'' mang âm hưởng quê hương Cuba của nữ ca sĩ nào đã đứng đầu bảng xếp hạng Billboard năm 2017?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 302, 'US-UK', 'Lễ trao giải âm nhạc danh giá và lâu đời nhất thế giới được tổ chức thường niên bởi Viện hàn lâm Thu âm Hoa Kỳ là giải gì?', '["American Music Awards (AMA)","Billboard Music Awards","Giải Grammy (Grammy Awards)","BRIT Awards"]'::jsonb, 2, 'Giải thưởng Grammy với chiếc cúp hình máy hát đĩa mạ vàng là đỉnh cao danh vọng cao quý nhất của mọi nghệ sĩ âm nhạc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'hard', 1200, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Lễ trao giải âm nhạc danh giá và lâu đời nhất thế giới được tổ chức thường niên bởi Viện hàn lâm Thu âm Hoa Kỳ là giải gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png' WHERE lower(trim(prompt)) = lower('Lễ trao giải âm nhạc danh giá và lâu đời nhất thế giới được tổ chức thường niên bởi Viện hàn lâm Thu âm Hoa Kỳ là giải gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 303, 'US-UK', 'Ban nhạc rock huyền thoại nào của Anh là chủ nhân của album ''The Dark Side of the Moon'' với bìa hình lăng kính tán sắc ánh sáng?', '["Led Zeppelin","Pink Floyd","The Rolling Stones","Deep Purple"]'::jsonb, 1, '''The Dark Side of the Moon'' (1973) của Pink Floyd là một trong những album bán chạy và vĩ đại nhất lịch sử.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'hard', 1200, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại nào của Anh là chủ nhân của album ''The Dark Side of the Moon'' với bìa hình lăng kính tán sắc ánh sáng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Ban nhạc rock huyền thoại nào của Anh là chủ nhân của album ''The Dark Side of the Moon'' với bìa hình lăng kính tán sắc ánh sáng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 304, 'US-UK', 'Ca khúc bất hủ ''Hotel California'' (1976) là tác phẩm để đời của ban nhạc rock Mỹ nào?', '["Eagles","Aerosmith","Bon Jovi","Guns N'' Roses"]'::jsonb, 0, 'Ban nhạc Eagles đã tạo nên kiệt tác ''Hotel California'' với đoạn solo guitar huyền thoại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, '09839DpTctU', 'AUDIO_GUESS', 'hard', 1200, 20, 'Eagles - Hotel California', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc bất hủ ''Hotel California'' (1976) là tác phẩm để đời của ban nhạc rock Mỹ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Ca khúc bất hủ ''Hotel California'' (1976) là tác phẩm để đời của ban nhạc rock Mỹ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 305, 'US-UK', 'Ai là giọng ca chính của ban nhạc rock альтернатив Nirvana với ca khúc ''Smells Like Teen Spirit''?', '["Dave Grohl","Chester Bennington","Axl Rose","Kurt Cobain"]'::jsonb, 3, 'Kurt Cobain là thủ lĩnh biểu tượng của dòng nhạc Grunge và ban nhạc Nirvana thập niên 1990.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'hTWKbfoikeg', 'AUDIO_GUESS', 'hard', 1200, 20, 'Nirvana - Smells Like Teen Spirit', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là giọng ca chính của ban nhạc rock альтернатив Nirvana với ca khúc ''Smells Like Teen Spirit''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Ai là giọng ca chính của ban nhạc rock альтернатив Nirvana với ca khúc ''Smells Like Teen Spirit''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 306, 'US-UK', 'Cố ca sĩ Chester Bennington là giọng ca chính huyền thoại của ban nhạc rock Mỹ nào?', '["My Chemical Romance","Green Day","Linkin Park","Imagine Dragons"]'::jsonb, 2, 'Chester Bennington cùng Mike Shinoda đã đưa Linkin Park trở thành tượng đài Nu-metal với ''In the End'', ''Numb''.',
  'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png', NULL, NULL, 'eVTXPUF4Oz4', 'AUDIO_GUESS', 'hard', 1200, 20, 'Linkin Park - In The End', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cố ca sĩ Chester Bennington là giọng ca chính huyền thoại của ban nhạc rock Mỹ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/9d/Link_%28Hyrule_Historia%29.png' WHERE lower(trim(prompt)) = lower('Cố ca sĩ Chester Bennington là giọng ca chính huyền thoại của ban nhạc rock Mỹ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 307, 'US-UK', 'Bộ đôi nhạc điện tử người Pháp từng đội mũ bảo hiểm robot nổi tiếng với bản hit ''Get Lucky'' là ai?', '["The Chainsmokers","Daft Punk","Disclosure","Swedish House Mafia"]'::jsonb, 1, 'Daft Punk (Thomas Bangalter và Guy-Manuel) là bộ đôi nhạc điện tử huyền thoại của Pháp.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'sOnqjkJTMaA', 'AUDIO_GUESS', 'hard', 1200, 20, 'Michael Jackson - Thriller', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ đôi nhạc điện tử người Pháp từng đội mũ bảo hiểm robot nổi tiếng với bản hit ''Get Lucky'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Bộ đôi nhạc điện tử người Pháp từng đội mũ bảo hiểm robot nổi tiếng với bản hit ''Get Lucky'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 308, 'US-UK', 'Nữ ca sĩ người Anh Dua Lipa phát hành album phòng thu thứ hai mang đậm phong cách Disco-pop năm 2020 có tên là gì?', '["Future Nostalgia","Radical Optimism","Renaissance","Midnights"]'::jsonb, 0, 'Album ''Future Nostalgia'' với bản hit ''Levitating'', ''Don''t Start Now'' đã mang về giải Grammy cho Dua Lipa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'TUVcZfQe-Kw', 'AUDIO_GUESS', 'hard', 1200, 20, 'Dua Lipa - Levitating', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ người Anh Dua Lipa phát hành album phòng thu thứ hai mang đậm phong cách Disco-pop năm 2020 có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ người Anh Dua Lipa phát hành album phòng thu thứ hai mang đậm phong cách Disco-pop năm 2020 có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 309, 'US-UK', 'Nam ca sĩ Harry Styles từng là thành viên của nhóm nhạc nam đình đám nào trước khi hoạt động solo?', '["Jonas Brothers","Backstreet Boys","Westlife","One Direction"]'::jsonb, 3, 'Harry Styles bước ra từ nhóm nhạc One Direction và gặt hái thành công vang dội với ''As It Was'', ''Watermelon Sugar''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'H5v3kku4y6Q', 'AUDIO_GUESS', 'hard', 1200, 20, 'Harry Styles - As It Was', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ Harry Styles từng là thành viên của nhóm nhạc nam đình đám nào trước khi hoạt động solo?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ Harry Styles từng là thành viên của nhóm nhạc nam đình đám nào trước khi hoạt động solo?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  31, 310, 'US-UK', 'Ca khúc ''As It Was'' thống trị bảng xếp hạng Billboard Hot 100 suốt 15 tuần năm 2022 nằm trong album nào của Harry Styles?', '["Four","Fine Line","Harry''s House","Midnight Memories"]'::jsonb, 2, 'Album ''Harry''s House'' đã giành giải Album của năm tại lễ trao giải Grammy lần thứ 65.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, 'H5v3kku4y6Q', 'AUDIO_GUESS', 'hard', 1200, 20, 'Harry Styles - As It Was', true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca khúc ''As It Was'' thống trị bảng xếp hạng Billboard Hot 100 suốt 15 tuần năm 2022 nằm trong album nào của Harry Styles?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Ca khúc ''As It Was'' thống trị bảng xếp hạng Billboard Hot 100 suốt 15 tuần năm 2022 nằm trong album nào của Harry Styles?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 311, 'US-UK', 'Nữ ca sĩ trẻ Olivia Rodrigo bùng nổ toàn cầu năm 2021 với đĩa đơn đầu tay nào?', '["good 4 u","drivers license","vampire","deja vu"]'::jsonb, 1, '''drivers license'' nằm trong album đầu tay ''SOUR'' đã đưa Olivia Rodrigo thành ngôi sao nhạc Pop thế hệ mới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg', NULL, NULL, 'ZmDBbnmKpqQ', 'AUDIO_GUESS', 'hard', 1200, 20, 'Olivia Rodrigo - drivers license', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ trẻ Olivia Rodrigo bùng nổ toàn cầu năm 2021 với đĩa đơn đầu tay nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/330px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ trẻ Olivia Rodrigo bùng nổ toàn cầu năm 2021 với đĩa đơn đầu tay nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 312, 'US-UK', 'Nhóm nhạc pop-rock Imagine Dragons nổi tiếng toàn cầu với các bản hit ''Believer'', ''Thunder'' và ca khúc nào sau đây?', '["Radioactive","Counting Stars","Viva La Vida","Wake Me Up"]'::jsonb, 0, '''Radioactive'' là một trong những đĩa đơn kim cương nổi tiếng nhất của Imagine Dragons.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cc/ColdplayWembley120925_%28cropped%29.jpg/330px-ColdplayWembley120925_%28cropped%29.jpg', NULL, NULL, 'dvgZkm1xWPE', 'AUDIO_GUESS', 'hard', 1200, 20, 'Coldplay - Viva La Vida', false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm nhạc pop-rock Imagine Dragons nổi tiếng toàn cầu với các bản hit ''Believer'', ''Thunder'' và ca khúc nào sau đây?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cc/ColdplayWembley120925_%28cropped%29.jpg/330px-ColdplayWembley120925_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nhóm nhạc pop-rock Imagine Dragons nổi tiếng toàn cầu với các bản hit ''Believer'', ''Thunder'' và ca khúc nào sau đây?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 313, 'Địa lý cơ bản', 'Thủ đô chính thức của nước Úc (Australia) là thành phố nào?', '["Melbourne","Sydney","Canberra","Brisbane"]'::jsonb, 2, 'Canberra được chọn làm thủ đô của nước Úc vào năm 1908 như một sự dung hòa giữa hai thành phố lớn đối địch Sydney và Melbourne.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg/330px-Blackpink_Ros%C3%A9_Rimowa_1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô chính thức của nước Úc (Australia) là thành phố nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg/330px-Blackpink_Ros%C3%A9_Rimowa_1.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô chính thức của nước Úc (Australia) là thành phố nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 314, 'Địa lý cơ bản', 'Thủ đô của đất nước Canada là thành phố nào?', '["Toronto","Ottawa","Vancouver","Montreal"]'::jsonb, 1, 'Ottawa là thủ đô liên bang của Canada, nằm ở tỉnh Ontario giáp ranh Quebec.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Canada là thành phố nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Canada là thành phố nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 315, 'Địa lý cơ bản', 'Đỉnh núi nào được mệnh danh là ''Nóc nhà Đông Dương'' với độ cao 3.143 mét?', '["Fansipan","Pusilung","Bạch Mộc Lương Tử","Tây Côn Lĩnh"]'::jsonb, 0, 'Đỉnh Fansipan thuộc dãy Hoàng Liên Sơn, nằm giữa hai tỉnh Lào Cai và Lai Châu của Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/04/Fansipan_Summit.jpg/330px-Fansipan_Summit.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đỉnh núi nào được mệnh danh là ''Nóc nhà Đông Dương'' với độ cao 3.143 mét?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/04/Fansipan_Summit.jpg/330px-Fansipan_Summit.jpg' WHERE lower(trim(prompt)) = lower('Đỉnh núi nào được mệnh danh là ''Nóc nhà Đông Dương'' với độ cao 3.143 mét?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 316, 'Địa lý cơ bản', 'Hang động tự nhiên lớn nhất thế giới nằm ở tỉnh Quảng Bình của Việt Nam có tên là gì?', '["Én","Phong Nha","Thiên Đường","Sơn Đoòng"]'::jsonb, 3, 'Hang Sơn Đoòng trong Vườn quốc gia Phong Nha - Kẻ Bàng có thể chứa được một tòa nhà chọc trời 40 tầng hoặc cả khu phố Manhattan.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Hang_Son_Doong_cave.jpg/640px-Hang_Son_Doong_cave.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hang động tự nhiên lớn nhất thế giới nằm ở tỉnh Quảng Bình của Việt Nam có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Hang_Son_Doong_cave.jpg/640px-Hang_Son_Doong_cave.jpg' WHERE lower(trim(prompt)) = lower('Hang động tự nhiên lớn nhất thế giới nằm ở tỉnh Quảng Bình của Việt Nam có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 317, 'Địa lý cơ bản', 'Con sông dài nhất thế giới chảy qua khu vực Đông Bắc châu Phi đổ ra Địa Trung Hải là dòng sông nào?', '["Sông Trường Giang (Dương Tử)","Sông Amazon","Sông Nile (Nin)","Sông Mississippi"]'::jsonb, 2, 'Sông Nile với chiều dài khoảng 6.650 km là cái nôi nuôi dưỡng nền văn minh Ai Cập cổ đại rực rỡ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Beautiful_nature_along_Nile_River_01.jpg/330px-Beautiful_nature_along_Nile_River_01.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Con sông dài nhất thế giới chảy qua khu vực Đông Bắc châu Phi đổ ra Địa Trung Hải là dòng sông nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Beautiful_nature_along_Nile_River_01.jpg/330px-Beautiful_nature_along_Nile_River_01.jpg' WHERE lower(trim(prompt)) = lower('Con sông dài nhất thế giới chảy qua khu vực Đông Bắc châu Phi đổ ra Địa Trung Hải là dòng sông nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 318, 'Địa lý cơ bản', 'Con sông có lưu lượng nước lớn nhất thế giới và sở hữu lưu vực rừng mưa nhiệt đới khổng lồ là sông nào?', '["Sông Nile","Sông Amazon","Sông Congo","Sông Mekong"]'::jsonb, 1, 'Sông Amazon ở Nam Mỹ chiếm khoảng 20% tổng lượng nước ngọt từ sông đổ ra đại dương toàn cầu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Beautiful_nature_along_Nile_River_01.jpg/330px-Beautiful_nature_along_Nile_River_01.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Con sông có lưu lượng nước lớn nhất thế giới và sở hữu lưu vực rừng mưa nhiệt đới khổng lồ là sông nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Beautiful_nature_along_Nile_River_01.jpg/330px-Beautiful_nature_along_Nile_River_01.jpg' WHERE lower(trim(prompt)) = lower('Con sông có lưu lượng nước lớn nhất thế giới và sở hữu lưu vực rừng mưa nhiệt đới khổng lồ là sông nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 319, 'Địa lý cơ bản', 'Đại dương nào có diện tích và độ sâu lớn nhất trên bề mặt Trái Đất?', '["Thái Bình Dương","Đại Tây Dương","Ấn Độ Dương","Bắc Băng Dương"]'::jsonb, 0, 'Thái Bình Dương chiếm hơn 30% diện tích bề mặt Trái Đất và chứa rãnh Mariana sâu nhất hành tinh (~11.000m).',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đại dương nào có diện tích và độ sâu lớn nhất trên bề mặt Trái Đất?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png' WHERE lower(trim(prompt)) = lower('Đại dương nào có diện tích và độ sâu lớn nhất trên bề mặt Trái Đất?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  32, 320, 'Địa lý cơ bản', 'Nhìn vào ảnh và cho biết đây là kỳ quan cổ đại duy nhất còn tồn tại nguyên vẹn thuộc quốc gia nào?', '["Chichen Itza - Mexico","Đấu trường La Mã - Ý","Taj Mahal - Ấn Độ","Đại kim tự tháp Giza - Ai Cập"]'::jsonb, 3, 'Đại kim tự tháp Giza của Pharaon Khufu ở Ai Cập là kỳ quan cổ đại duy nhất trong 7 kỳ quan thế giới cổ đại còn đứng vững.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/640px-Kheops-Pyramid.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là kỳ quan cổ đại duy nhất còn tồn tại nguyên vẹn thuộc quốc gia nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/640px-Kheops-Pyramid.jpg' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là kỳ quan cổ đại duy nhất còn tồn tại nguyên vẹn thuộc quốc gia nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 321, 'Địa lý cơ bản', 'Quốc gia nào trên thế giới có diện tích lãnh thổ lớn nhất hành tinh (trải dài trên cả 2 châu lục Á - Âu)?', '["Trung Quốc","Canada","Nga (Liên bang Nga)","Hoa Kỳ"]'::jsonb, 2, 'Liên bang Nga có diện tích hơn 17 triệu km2, chiếm hơn 1/8 diện tích lục địa Trái Đất và có 11 múi giờ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quốc gia nào trên thế giới có diện tích lãnh thổ lớn nhất hành tinh (trải dài trên cả 2 châu lục Á - Âu)?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg' WHERE lower(trim(prompt)) = lower('Quốc gia nào trên thế giới có diện tích lãnh thổ lớn nhất hành tinh (trải dài trên cả 2 châu lục Á - Âu)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 322, 'Địa lý cơ bản', 'Quốc gia nào nhỏ nhất thế giới cả về diện tích và dân số, nằm trọn trong lòng thủ đô Rome của nước Ý?', '["Monaco","Vatican (Thành Vatican)","San Marino","Liechtenstein"]'::jsonb, 1, 'Thành quốc Vatican chỉ rộng khoảng 0.49 km2, là trung tâm tôn giáo của Giáo hội Công giáo Rôma.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Flag_of_Vatican_City_%282023%E2%80%93present%29.svg/330px-Flag_of_Vatican_City_%282023%E2%80%93present%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quốc gia nào nhỏ nhất thế giới cả về diện tích và dân số, nằm trọn trong lòng thủ đô Rome của nước Ý?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Flag_of_Vatican_City_%282023%E2%80%93present%29.svg/330px-Flag_of_Vatican_City_%282023%E2%80%93present%29.svg.png' WHERE lower(trim(prompt)) = lower('Quốc gia nào nhỏ nhất thế giới cả về diện tích và dân số, nằm trọn trong lòng thủ đô Rome của nước Ý?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 323, 'Địa lý cơ bản', 'Nhìn vào ảnh và cho biết đây là ngọn núi lửa thiêng liêng hình chóp nón tuyết phủ biểu tượng của nước nào?', '["Núi Phú Sĩ (Fuji) - Nhật Bản","Núi Rainier - Mỹ","Núi Kilimanjaro - Tanzania","Núi Etna - Ý"]'::jsonb, 0, 'Núi Phú Sĩ (cao 3.776 mét) là ngọn núi cao nhất và là biểu tượng văn hóa bất hủ của đất nước Nhật Bản.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/640px-080103_hakkai_fuji.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là ngọn núi lửa thiêng liêng hình chóp nón tuyết phủ biểu tượng của nước nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/640px-080103_hakkai_fuji.jpg' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là ngọn núi lửa thiêng liêng hình chóp nón tuyết phủ biểu tượng của nước nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 324, 'Địa lý cơ bản', 'Đất nước nào được mệnh danh là ''Xứ sở cối xay gió'' và hoa tulip rực rỡ?', '["Thụy Sĩ","Bỉ","Đan Mạch","Hà Lan"]'::jsonb, 3, 'Hà Lan nổi tiếng với các công trình cối xay gió trị thủy, đê chắn sóng và những cánh đồng hoa tulip Keukenhof bạt ngàn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/330px-Flag_of_the_Netherlands.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đất nước nào được mệnh danh là ''Xứ sở cối xay gió'' và hoa tulip rực rỡ?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/330px-Flag_of_the_Netherlands.svg.png' WHERE lower(trim(prompt)) = lower('Đất nước nào được mệnh danh là ''Xứ sở cối xay gió'' và hoa tulip rực rỡ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 325, 'Địa lý cơ bản', 'Quốc kỳ của quốc gia nào trên thế giới là lá cờ duy nhất không phải hình chữ nhật hay hình vuông?', '["Vatican","Thụy Sĩ","Nepal","Bhutan"]'::jsonb, 2, 'Quốc kỳ Nepal có hình dạng độc đáo gồm 2 hình tam giác xếp chồng lên nhau, tượng trưng cho dãy núi Himalaya.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/640px-Flag_of_Nepal.svg.png', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quốc kỳ của quốc gia nào trên thế giới là lá cờ duy nhất không phải hình chữ nhật hay hình vuông?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/640px-Flag_of_Nepal.svg.png' WHERE lower(trim(prompt)) = lower('Quốc kỳ của quốc gia nào trên thế giới là lá cờ duy nhất không phải hình chữ nhật hay hình vuông?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 326, 'Địa lý cơ bản', 'Vịnh biển nào của Việt Nam hai lần được UNESCO công nhận là Di sản Thiên nhiên Thế giới nhờ hàng nghìn đảo đá vôi kỳ vĩ?', '["Vịnh Nha Trang","Vịnh Hạ Long (Quảng Ninh)","Vịnh Lăng Cô","Vịnh Cam Ranh"]'::jsonb, 1, 'Vịnh Hạ Long với gần 2.000 hòn đảo lớn nhỏ và các hang động lộng lẫy là kỳ quan thiên nhiên nổi tiếng bậc nhất thế giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/79/Ha_Long_Bay_in_2019.jpg/330px-Ha_Long_Bay_in_2019.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vịnh biển nào của Việt Nam hai lần được UNESCO công nhận là Di sản Thiên nhiên Thế giới nhờ hàng nghìn đảo đá vôi kỳ vĩ?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/79/Ha_Long_Bay_in_2019.jpg/330px-Ha_Long_Bay_in_2019.jpg' WHERE lower(trim(prompt)) = lower('Vịnh biển nào của Việt Nam hai lần được UNESCO công nhận là Di sản Thiên nhiên Thế giới nhờ hàng nghìn đảo đá vôi kỳ vĩ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 327, 'Địa lý cơ bản', 'Quần thể đền đài tôn giáo cổ kính Angkor Wat là biểu tượng trên quốc kỳ của quốc gia láng giềng nào của Việt Nam?', '["Campuchia","Lào","Thái Lan","Myanmar"]'::jsonb, 0, 'Angkor Wat là kiệt tác kiến trúc Khmer vĩ đại và là niềm tự hào quốc gia xuất hiện trên quốc kỳ Campuchia.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ankor_Wat_temple.jpg/640px-Ankor_Wat_temple.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quần thể đền đài tôn giáo cổ kính Angkor Wat là biểu tượng trên quốc kỳ của quốc gia láng giềng nào của Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ankor_Wat_temple.jpg/640px-Ankor_Wat_temple.jpg' WHERE lower(trim(prompt)) = lower('Quần thể đền đài tôn giáo cổ kính Angkor Wat là biểu tượng trên quốc kỳ của quốc gia láng giềng nào của Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 328, 'Địa lý cơ bản', 'Thủ đô của nước Mỹ (Hoa Kỳ) là thành phố nào?', '["Chicago","New York","Los Angeles","Washington, D.C."]'::jsonb, 3, 'Washington, D.C. là đặc khu thủ đô của Hoa Kỳ, nơi đặt Nhà Trắng và Tòa nhà Quốc hội Capitol.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/12-07-13-washington-by-RalfR-08.jpg/330px-12-07-13-washington-by-RalfR-08.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô của nước Mỹ (Hoa Kỳ) là thành phố nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/12-07-13-washington-by-RalfR-08.jpg/330px-12-07-13-washington-by-RalfR-08.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô của nước Mỹ (Hoa Kỳ) là thành phố nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 329, 'Địa lý cơ bản', 'Kỳ quan thế giới Taj Mahal làm hoàn toàn bằng đá cẩm thạch trắng do hoàng đế Shah Jahan xây dựng nằm ở nước nào?', '["Iran","Thổ Nhĩ Kỳ","Ấn Độ","Ả Rập Xê Út"]'::jsonb, 2, 'Taj Mahal ở thành phố Agra, Ấn Độ là lăng mộ tình yêu tuyệt mỹ được xây dựng để tưởng nhớ hoàng hậu Mumtaz Mahal.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Taj_Mahal%2C_Agra%2C_India_edit3.jpg/640px-Taj_Mahal%2C_Agra%2C_India_edit3.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kỳ quan thế giới Taj Mahal làm hoàn toàn bằng đá cẩm thạch trắng do hoàng đế Shah Jahan xây dựng nằm ở nước nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Taj_Mahal%2C_Agra%2C_India_edit3.jpg/640px-Taj_Mahal%2C_Agra%2C_India_edit3.jpg' WHERE lower(trim(prompt)) = lower('Kỳ quan thế giới Taj Mahal làm hoàn toàn bằng đá cẩm thạch trắng do hoàng đế Shah Jahan xây dựng nằm ở nước nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  33, 330, 'Địa lý cơ bản', 'Châu lục nào trên Trái Đất có diện tích lớn nhất và đông dân cư nhất?', '["Châu Phi","Châu Á","Châu Âu","Châu Mỹ"]'::jsonb, 1, 'Châu Á chiếm khoảng 30% diện tích đất liền và là nơi sinh sống của khoảng 60% dân số thế giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Châu lục nào trên Trái Đất có diện tích lớn nhất và đông dân cư nhất?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Châu lục nào trên Trái Đất có diện tích lớn nhất và đông dân cư nhất?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 331, 'Địa lý cơ bản', 'Châu lục nào lạnh nhất, khô nhất và nhiều gió nhất trên Trái Đất, không có cư dân bản địa sinh sống thường trú?', '["Châu Nam Cực","Châu Bắc Cực","Châu Đại Dương","Bắc Mỹ"]'::jsonb, 0, 'Châu Nam Cực được bao phủ bởi lớp băng dày trung bình gần 2 km và chỉ có các nhà khoa học làm việc tại trạm nghiên cứu.',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Châu lục nào lạnh nhất, khô nhất và nhiều gió nhất trên Trái Đất, không có cư dân bản địa sinh sống thường trú?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png' WHERE lower(trim(prompt)) = lower('Châu lục nào lạnh nhất, khô nhất và nhiều gió nhất trên Trái Đất, không có cư dân bản địa sinh sống thường trú?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 332, 'Địa lý cơ bản', 'Đồng bằng sông Cửu Long của Việt Nam được bồi đắp bởi hệ thống sông nào?', '["Sông Đà","Sông Hồng","Sông Đồng Nai","Sông Mê Kông (Mekong)"]'::jsonb, 3, 'Sông Mekong bắt nguồn từ cao nguyên Tây Tạng chảy qua 6 quốc gia trước khi đổ ra biển Đông qua 9 cửa sông Cửu Long.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Mekong_river_basin.png/330px-Mekong_river_basin.png', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đồng bằng sông Cửu Long của Việt Nam được bồi đắp bởi hệ thống sông nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Mekong_river_basin.png/330px-Mekong_river_basin.png' WHERE lower(trim(prompt)) = lower('Đồng bằng sông Cửu Long của Việt Nam được bồi đắp bởi hệ thống sông nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 333, 'Địa lý cơ bản', 'Tỉnh thành nào của Việt Nam có diện tích tự nhiên rộng lớn nhất cả nước?', '["Sơn La","Gia Lai","Nghệ An","Đắk Lắk"]'::jsonb, 2, 'Tỉnh Nghệ An có diện tích hơn 16.490 km2, là tỉnh có diện tích lớn nhất trong số 63 tỉnh thành của Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tỉnh thành nào của Việt Nam có diện tích tự nhiên rộng lớn nhất cả nước?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Tỉnh thành nào của Việt Nam có diện tích tự nhiên rộng lớn nhất cả nước?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 334, 'Địa lý cơ bản', 'Tỉnh thành nào có diện tích tự nhiên nhỏ nhất trong số 63 tỉnh thành của Việt Nam?', '["Hà Nam","Bắc Ninh","Hưng Yên","Vĩnh Phúc"]'::jsonb, 1, 'Tỉnh Bắc Ninh có diện tích tự nhiên chỉ khoảng 822.7 km2, là tỉnh nhỏ nhất Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tỉnh thành nào có diện tích tự nhiên nhỏ nhất trong số 63 tỉnh thành của Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Tỉnh thành nào có diện tích tự nhiên nhỏ nhất trong số 63 tỉnh thành của Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 335, 'Địa lý cơ bản', 'Sa mạc cát lớn nhất và nóng nhất thế giới nằm ở khu vực Bắc Phi có tên là gì?', '["Sa mạc Sahara","Sa mạc Gobi","Sa mạc Atacama","Sa mạc Kalahari"]'::jsonb, 0, 'Sa mạc Sahara rộng hơn 9 triệu km2, xấp xỉ diện tích của toàn bộ nước Mỹ hoặc Trung Quốc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Sahara_real_color.jpg/330px-Sahara_real_color.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Sa mạc cát lớn nhất và nóng nhất thế giới nằm ở khu vực Bắc Phi có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Sahara_real_color.jpg/330px-Sahara_real_color.jpg' WHERE lower(trim(prompt)) = lower('Sa mạc cát lớn nhất và nóng nhất thế giới nằm ở khu vực Bắc Phi có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 336, 'Địa lý cơ bản', 'Nơi nào trên Trái Đất được mệnh danh là ''Nơi khô hạn nhất hành tinh'' với những khu vực chưa từng có mưa suốt hàng trăm năm?', '["Sa mạc Sinai","Sa mạc Sahara","Thung lũng Chết (Mỹ)","Sa mạc Atacama (Chile)"]'::jsonb, 3, 'Sa mạc Atacama ở Chile nằm giữa hai dãy núi cao chặn đứng mọi hơi ẩm, có khí hậu tương đồng với bề mặt Sao Hỏa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Sahara_real_color.jpg/330px-Sahara_real_color.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nơi nào trên Trái Đất được mệnh danh là ''Nơi khô hạn nhất hành tinh'' với những khu vực chưa từng có mưa suốt hàng trăm năm?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Sahara_real_color.jpg/330px-Sahara_real_color.jpg' WHERE lower(trim(prompt)) = lower('Nơi nào trên Trái Đất được mệnh danh là ''Nơi khô hạn nhất hành tinh'' với những khu vực chưa từng có mưa suốt hàng trăm năm?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 337, 'Địa lý cơ bản', 'Hồ nước ngọt sâu nhất và cổ xưa nhất trên Trái Đất nằm ở vùng Siberia của nước Nga là hồ nào?', '["Hồ Victoria","Hồ Superior (Hồ Thượng)","Hồ Baikal","Hồ Tanganyika"]'::jsonb, 2, 'Hồ Baikal sâu tới 1.642 mét và chứa hơn 20% tổng lượng nước ngọt bề mặt không đóng băng của thế giới.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/330px-Flag_of_Russia.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hồ nước ngọt sâu nhất và cổ xưa nhất trên Trái Đất nằm ở vùng Siberia của nước Nga là hồ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/330px-Flag_of_Russia.svg.png' WHERE lower(trim(prompt)) = lower('Hồ nước ngọt sâu nhất và cổ xưa nhất trên Trái Đất nằm ở vùng Siberia của nước Nga là hồ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 338, 'Địa lý cơ bản', 'Kênh đào nhân tạo nổi tiếng nối liền Biển Đỏ và Địa Trung Hải, mở đường tắt hàng hải Á - Âu là kênh đào nào?', '["Kênh đào Panama","Kênh đào Suez","Kênh đào Kiel","Kênh đào Corinth"]'::jsonb, 1, 'Kênh đào Suez ở Ai Cập khánh thành năm 1869 giúp tàu thuyền không phải đi vòng qua Mũi Hảo Vọng ở cực nam châu Phi.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c9/Iss016e019375.jpg/330px-Iss016e019375.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kênh đào nhân tạo nổi tiếng nối liền Biển Đỏ và Địa Trung Hải, mở đường tắt hàng hải Á - Âu là kênh đào nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c9/Iss016e019375.jpg/330px-Iss016e019375.jpg' WHERE lower(trim(prompt)) = lower('Kênh đào nhân tạo nổi tiếng nối liền Biển Đỏ và Địa Trung Hải, mở đường tắt hàng hải Á - Âu là kênh đào nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 339, 'Địa lý cơ bản', 'Kênh đào nối liền Đại Tây Dương và Thái Bình Dương cắt ngang eo đất Trung Mỹ là kênh đào nào?', '["Kênh đào Panama","Kênh đào Suez","Kênh đào Nicaragua","Kênh đào Erie"]'::jsonb, 0, 'Kênh đào Panama là kỳ tích kỹ thuật vĩ đại sử dụng hệ thống âu thuyền nâng hạ tàu qua hồ Gatun.',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kênh đào nối liền Đại Tây Dương và Thái Bình Dương cắt ngang eo đất Trung Mỹ là kênh đào nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png' WHERE lower(trim(prompt)) = lower('Kênh đào nối liền Đại Tây Dương và Thái Bình Dương cắt ngang eo đất Trung Mỹ là kênh đào nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  34, 340, 'Địa lý cơ bản', 'Thác nước tự nhiên hùng vĩ nào nằm ở biên giới giữa hai quốc gia Mỹ và Canada?', '["Thác Angel","Thác Victoria","Thác Iguazu","Thác Niagara"]'::jsonb, 3, 'Thác Niagara gồm cụm thác Horseshoe, thác Mỹ và thác Bridal Veil là điểm du lịch nổi tiếng thế giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thác nước tự nhiên hùng vĩ nào nằm ở biên giới giữa hai quốc gia Mỹ và Canada?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/330px-Parliament-Ottawa.jpg' WHERE lower(trim(prompt)) = lower('Thác nước tự nhiên hùng vĩ nào nằm ở biên giới giữa hai quốc gia Mỹ và Canada?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 341, 'Địa lý cơ bản', 'Thác nước đơn dòng đổ liên tục cao nhất thế giới (cao 979 mét) nằm ở đất nước Venezuela có tên là gì?', '["Thác Victoria","Thác Iguazu","Thác Angel (Salto Ángel)","Thác Bản Giốc"]'::jsonb, 2, 'Thác Angel đổ từ đỉnh núi phẳng Auyán-tepui trong vườn quốc gia Canaima, Venezuela.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/SaltoAngel1.jpg/330px-SaltoAngel1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thác nước đơn dòng đổ liên tục cao nhất thế giới (cao 979 mét) nằm ở đất nước Venezuela có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/SaltoAngel1.jpg/330px-SaltoAngel1.jpg' WHERE lower(trim(prompt)) = lower('Thác nước đơn dòng đổ liên tục cao nhất thế giới (cao 979 mét) nằm ở đất nước Venezuela có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 342, 'Địa lý cơ bản', 'Thành phố cổ Venice (Ý) nổi tiếng thế giới với hệ thống giao thông độc đáo gì?', '["Xe ngựa kéo","Hệ thống kênh đào chằng chịt và thuyền Gondola","Tàu điện ngầm xuyên núi","Cáp treo trên không"]'::jsonb, 1, 'Venice được xây dựng trên hơn 100 hòn đảo nhỏ trong đầm phá Venetian và không hề có ô tô di chuyển bên trong.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Venezia_aerial_view.jpg/330px-Venezia_aerial_view.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành phố cổ Venice (Ý) nổi tiếng thế giới với hệ thống giao thông độc đáo gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Venezia_aerial_view.jpg/330px-Venezia_aerial_view.jpg' WHERE lower(trim(prompt)) = lower('Thành phố cổ Venice (Ý) nổi tiếng thế giới với hệ thống giao thông độc đáo gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 343, 'Địa lý cơ bản', 'Thủ đô của đất nước Thái Lan có tên gọi quốc tế quen thuộc là Bangkok, nhưng tên chính thức bằng tiếng Thái rất dài thường gọi tắt là gì?', '["Krung Thep Maha Nakhon (Krung Thep)","Chiang Mai","Pattaya","Ayutthaya"]'::jsonb, 0, 'Tên đầy đủ của Bangkok là tên địa danh dài nhất thế giới trong sách kỷ lục Guinness, người Thái gọi ngắn gọn là Krung Thep (Thành phố của các thiên thần).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Thái Lan có tên gọi quốc tế quen thuộc là Bangkok, nhưng tên chính thức bằng tiếng Thái rất dài thường gọi tắt là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/330px-20240314_Lisa_Manoban_07.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Thái Lan có tên gọi quốc tế quen thuộc là Bangkok, nhưng tên chính thức bằng tiếng Thái rất dài thường gọi tắt là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 344, 'Địa lý cơ bản', 'Đất nước nào ở châu Âu có hình dáng bản đồ thon dài giống như một ''chiếc ủng'' vươn ra Địa Trung Hải?', '["Bồ Đào Nha","Tây Ban Nha","Hy Lạp","Nước Ý (Italy)"]'::jsonb, 3, 'Bán đảo Italia với đảo Sicily ở mũi ủng tạo nên hình thù chiếc bốt cao bồi trứ danh trên bản đồ thế giới.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Italy_satellite.jpg/640px-Italy_satellite.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đất nước nào ở châu Âu có hình dáng bản đồ thon dài giống như một ''chiếc ủng'' vươn ra Địa Trung Hải?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Italy_satellite.jpg/640px-Italy_satellite.jpg' WHERE lower(trim(prompt)) = lower('Đất nước nào ở châu Âu có hình dáng bản đồ thon dài giống như một ''chiếc ủng'' vươn ra Địa Trung Hải?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 345, 'Địa lý cơ bản', 'Đất nước nào được mệnh danh là ''Đất nước mặt trời mọc''?', '["Trung Quốc","Hàn Quốc","Nhật Bản","Triều Tiên"]'::jsonb, 2, 'Chữ Hán của Nhật Bản (Nippon/Nihon - 日本) có nghĩa là ''gốc của mặt trời'' hay nơi mặt trời mọc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đất nước nào được mệnh danh là ''Đất nước mặt trời mọc''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg' WHERE lower(trim(prompt)) = lower('Đất nước nào được mệnh danh là ''Đất nước mặt trời mọc''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 346, 'Địa lý cơ bản', 'Tòa tháp nghiêng bằng đá cẩm thạch trắng nổi tiếng thế giới nằm ở thành phố Pisa thuộc quốc gia nào?', '["Nước Pháp","Nước Ý (Italy)","Tây Ban Nha","Hy Lạp"]'::jsonb, 1, 'Tháp nghiêng Pisa (Torre di Pisa) bị nghiêng do nền đất yếu trong quá trình xây dựng từ thế kỷ 12.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Leaning_Tower_of_Pisa.jpg/640px-Leaning_Tower_of_Pisa.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tòa tháp nghiêng bằng đá cẩm thạch trắng nổi tiếng thế giới nằm ở thành phố Pisa thuộc quốc gia nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Leaning_Tower_of_Pisa.jpg/640px-Leaning_Tower_of_Pisa.jpg' WHERE lower(trim(prompt)) = lower('Tòa tháp nghiêng bằng đá cẩm thạch trắng nổi tiếng thế giới nằm ở thành phố Pisa thuộc quốc gia nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 347, 'Địa lý cơ bản', 'Đảo quốc Madagascar - hòn đảo lớn thứ tư thế giới nằm ở ngoài khơi bờ biển phía đông của châu lục nào?', '["Châu Phi","Châu Á","Châu Đại Dương","Châu Nam Cực"]'::jsonb, 0, 'Madagascar nằm ở Ấn Độ Dương ngoài khơi Mozambique thuộc bờ đông châu Phi, nổi tiếng với loài vượn cáo độc nhất vô nhị.',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đảo quốc Madagascar - hòn đảo lớn thứ tư thế giới nằm ở ngoài khơi bờ biển phía đông của châu lục nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Pacific_Ocean_-_en.png' WHERE lower(trim(prompt)) = lower('Đảo quốc Madagascar - hòn đảo lớn thứ tư thế giới nằm ở ngoài khơi bờ biển phía đông của châu lục nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 348, 'Địa lý cơ bản', 'Thành phố nào được mệnh danh là ''Thành phố Ánh sáng'' (La Ville Lumière) và có tháp Eiffel biểu tượng?', '["Berlin (Đức)","London (Anh)","Rome (Ý)","Paris (Pháp)"]'::jsonb, 3, 'Paris được gọi là Thành phố Ánh sáng vì là một trong những đô thị đầu tiên của châu Âu lắp đặt hệ thống đèn chiếu sáng đường phố thời kỳ Khai sáng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/330px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thành phố nào được mệnh danh là ''Thành phố Ánh sáng'' (La Ville Lumière) và có tháp Eiffel biểu tượng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/330px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg' WHERE lower(trim(prompt)) = lower('Thành phố nào được mệnh danh là ''Thành phố Ánh sáng'' (La Ville Lumière) và có tháp Eiffel biểu tượng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 349, 'Địa lý cơ bản', 'Hồ nước có độ mặn cực cao nằm giữa Israel và Jordan khiến con người có thể nổi bồng bềnh mà không cần bơi là hồ nào?', '["Biển Đỏ","Hồ Caspi","Biển Chết (Dead Sea)","Hồ Titicaca"]'::jsonb, 2, 'Biển Chết có độ mặn gần 34% (gấp gần 10 lần nước biển thông thường), khiến tỷ trọng nước lớn hơn cơ thể người.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c9/Iss016e019375.jpg/330px-Iss016e019375.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hồ nước có độ mặn cực cao nằm giữa Israel và Jordan khiến con người có thể nổi bồng bềnh mà không cần bơi là hồ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c9/Iss016e019375.jpg/330px-Iss016e019375.jpg' WHERE lower(trim(prompt)) = lower('Hồ nước có độ mặn cực cao nằm giữa Israel và Jordan khiến con người có thể nổi bồng bềnh mà không cần bơi là hồ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  35, 350, 'Địa lý cơ bản', 'Dãy núi trẻ dài và cao nhất thế giới nằm ở Nam Mỹ, chạy dọc theo bờ biển phía tây là dãy núi nào?', '["Dãy Rocky","Dãy Andes","Dãy Alps","Dãy Himalaya"]'::jsonb, 1, 'Dãy Andes dài hơn 7.000 km trải dài qua 7 quốc gia Nam Mỹ từ Venezuela đến Argentina.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/SaltoAngel1.jpg/330px-SaltoAngel1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Dãy núi trẻ dài và cao nhất thế giới nằm ở Nam Mỹ, chạy dọc theo bờ biển phía tây là dãy núi nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/SaltoAngel1.jpg/330px-SaltoAngel1.jpg' WHERE lower(trim(prompt)) = lower('Dãy núi trẻ dài và cao nhất thế giới nằm ở Nam Mỹ, chạy dọc theo bờ biển phía tây là dãy núi nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 351, 'Địa lý cơ bản', 'Dãy núi nào sở hữu đỉnh Everest (8.848m) - đỉnh núi cao nhất hành tinh trên mực nước biển?', '["Dãy Himalaya","Dãy Karakoram","Dãy Côn Lôn","Dãy Thiên Sơn"]'::jsonb, 0, 'Dãy Himalaya là dãy núi đồ sộ hình thành do sự va chạm giữa mảng kiến tạo Ấn Độ và mảng Á-Âu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg/330px-Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Dãy núi nào sở hữu đỉnh Everest (8.848m) - đỉnh núi cao nhất hành tinh trên mực nước biển?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg/330px-Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg' WHERE lower(trim(prompt)) = lower('Dãy núi nào sở hữu đỉnh Everest (8.848m) - đỉnh núi cao nhất hành tinh trên mực nước biển?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 352, 'Địa lý cơ bản', 'Quốc gia duy nhất trên thế giới đồng thời là một lục địa hoàn chỉnh được bao bọc bởi đại dương là nước nào?', '["Greenland","New Zealand","Madagascar","Nước Úc (Australia)"]'::jsonb, 3, 'Lục địa Úc là lục địa nhỏ nhất và là quốc gia độc lập duy nhất chiếm trọn cả một đại lục.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cc/Canberra_panorama_from_Mount_Ainslie.jpg/330px-Canberra_panorama_from_Mount_Ainslie.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quốc gia duy nhất trên thế giới đồng thời là một lục địa hoàn chỉnh được bao bọc bởi đại dương là nước nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cc/Canberra_panorama_from_Mount_Ainslie.jpg/330px-Canberra_panorama_from_Mount_Ainslie.jpg' WHERE lower(trim(prompt)) = lower('Quốc gia duy nhất trên thế giới đồng thời là một lục địa hoàn chỉnh được bao bọc bởi đại dương là nước nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 353, 'Địa lý cơ bản', 'Hòn đảo tự nhiên lớn nhất thế giới thuộc chủ quyền của Đan Mạch nhưng về địa lý thuộc Bắc Mỹ là đảo nào?', '["Borneo","New Guinea","Greenland (Đảo Xanh)","Madagascar"]'::jsonb, 2, 'Greenland rộng hơn 2.1 triệu km2 và được bao phủ hơn 80% bởi tảng băng vĩnh cửu khổng lồ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hòn đảo tự nhiên lớn nhất thế giới thuộc chủ quyền của Đan Mạch nhưng về địa lý thuộc Bắc Mỹ là đảo nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Hòn đảo tự nhiên lớn nhất thế giới thuộc chủ quyền của Đan Mạch nhưng về địa lý thuộc Bắc Mỹ là đảo nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 354, 'Địa lý cơ bản', 'Cực Đông trên đất liền của Việt Nam - nơi đón ánh bình minh đầu tiên nằm ở mũi nào thuộc tỉnh Khánh Hòa?', '["Mũi Đại Lãnh (Phú Yên)","Mũi Đôi (bán đảo Hòn Gốm)","Mũi Điện","Mũi Sa Vĩ"]'::jsonb, 1, 'Mũi Đôi tại xã Vạn Thạnh, huyện Vạn Ninh, tỉnh Khánh Hòa là điểm cực Đông đất liền đón ánh bình minh sớm nhất của Tổ quốc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cực Đông trên đất liền của Việt Nam - nơi đón ánh bình minh đầu tiên nằm ở mũi nào thuộc tỉnh Khánh Hòa?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Cực Đông trên đất liền của Việt Nam - nơi đón ánh bình minh đầu tiên nằm ở mũi nào thuộc tỉnh Khánh Hòa?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 355, 'Địa lý cơ bản', 'Eo biển nào ngăn cách châu Á và châu Mỹ (giữa vùng Viễn Đông Nga và bang Alaska của Mỹ)?', '["Eo biển Bering","Eo biển Gibraltar","Eo biển Malacca","Eo biển Magellan"]'::jsonb, 0, 'Eo biển Bering nối Thái Bình Dương với Bắc Băng Dương và ngăn cách Nga với bang Alaska (Mỹ).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Eo biển nào ngăn cách châu Á và châu Mỹ (giữa vùng Viễn Đông Nga và bang Alaska của Mỹ)?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Eo biển nào ngăn cách châu Á và châu Mỹ (giữa vùng Viễn Đông Nga và bang Alaska của Mỹ)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 356, 'Địa lý cơ bản', 'Eo biển Gibraltar ngăn cách châu Âu (Tây Ban Nha) với châu Phi (Ma-rốc) và nối Đại Tây Dương với biển nào?', '["Biển Bắc","Biển Đen","Biển Đỏ","Địa Trung Hải"]'::jsonb, 3, 'Eo biển Gibraltar là cửa ngõ hàng hải chiến lược nối Đại Tây Dương vào Địa Trung Hải.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Eo biển Gibraltar ngăn cách châu Âu (Tây Ban Nha) với châu Phi (Ma-rốc) và nối Đại Tây Dương với biển nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Eo biển Gibraltar ngăn cách châu Âu (Tây Ban Nha) với châu Phi (Ma-rốc) và nối Đại Tây Dương với biển nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 357, 'Địa lý cơ bản', 'Quốc gia nào ở châu Phi được bao bọc hoàn toàn (nằm trọn bên trong) lãnh thổ của nước Cộng hòa Nam Phi?', '["Kenya","Madagascar","Lesotho","Ai Cập"]'::jsonb, 2, 'Vương quốc Lesotho là quốc gia nội lục nằm hoàn toàn bên trong lãnh thổ Cộng hòa Nam Phi.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/96/Pyramids_of_the_Giza_Necropolis.jpg/330px-Pyramids_of_the_Giza_Necropolis.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quốc gia nào ở châu Phi được bao bọc hoàn toàn (nằm trọn bên trong) lãnh thổ của nước Cộng hòa Nam Phi?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/96/Pyramids_of_the_Giza_Necropolis.jpg/330px-Pyramids_of_the_Giza_Necropolis.jpg' WHERE lower(trim(prompt)) = lower('Quốc gia nào ở châu Phi được bao bọc hoàn toàn (nằm trọn bên trong) lãnh thổ của nước Cộng hòa Nam Phi?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 358, 'Địa lý cơ bản', 'Thủ đô của đất nước Thổ Nhĩ Kỳ là thành phố nào (nhiều người thường nhầm với Istanbul)?', '["Istanbul","Ankara","Izmir","Antalya"]'::jsonb, 1, 'Ankara mới là thủ đô chính thức của Thổ Nhĩ Kỳ từ năm 1923, còn Istanbul là thành phố lớn nhất.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Thổ Nhĩ Kỳ là thành phố nào (nhiều người thường nhầm với Istanbul)?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô của đất nước Thổ Nhĩ Kỳ là thành phố nào (nhiều người thường nhầm với Istanbul)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 359, 'Địa lý cơ bản', 'Thủ đô của quốc gia Nam Mỹ Brazil là thành phố nào (được quy hoạch hình chiếc máy bay)?', '["Brasília","Rio de Janeiro","São Paulo","Salvador"]'::jsonb, 0, 'Brasília trở thành thủ đô của Brazil từ năm 1960 thay cho Rio de Janeiro.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thủ đô của quốc gia Nam Mỹ Brazil là thành phố nào (được quy hoạch hình chiếc máy bay)?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Thủ đô của quốc gia Nam Mỹ Brazil là thành phố nào (được quy hoạch hình chiếc máy bay)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  36, 360, 'Địa lý cơ bản', 'Dòng sông nào chảy qua nhiều quốc gia nhất ở châu Âu (đi qua 10 quốc gia)?', '["Sông Seine","Sông Volga","Sông Rhine","Sông Danube"]'::jsonb, 3, 'Sông Danube bắt nguồn từ Đức và chảy qua 10 quốc gia châu Âu trước khi đổ ra Biển Đen.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Dòng sông nào chảy qua nhiều quốc gia nhất ở châu Âu (đi qua 10 quốc gia)?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Dòng sông nào chảy qua nhiều quốc gia nhất ở châu Âu (đi qua 10 quốc gia)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 361, 'Địa lý cơ bản', 'Dòng sông dài nhất châu Âu nằm hoàn toàn trên lãnh thổ nước Nga là sông nào?', '["Sông Thames","Sông Danube","Sông Volga","Sông Dnieper"]'::jsonb, 2, 'Sông Volga dài khoảng 3.531 km là con sông dài nhất châu Âu.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/330px-Flag_of_Russia.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Dòng sông dài nhất châu Âu nằm hoàn toàn trên lãnh thổ nước Nga là sông nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/330px-Flag_of_Russia.svg.png' WHERE lower(trim(prompt)) = lower('Dòng sông dài nhất châu Âu nằm hoàn toàn trên lãnh thổ nước Nga là sông nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 362, 'Địa lý cơ bản', 'Tại Việt Nam, tỉnh nào là nơi con sông Hồng bắt đầu chảy vào đất Việt (''Nơi con sông Hồng chảy vào đất Việt'')?', '["Hà Giang","Lào Cai","Yên Bái","Lai Châu"]'::jsonb, 1, 'Sông Hồng chảy vào lãnh thổ Việt Nam tại khu vực Lũng Pô, huyện Bát Xát, tỉnh Lào Cai.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tại Việt Nam, tỉnh nào là nơi con sông Hồng bắt đầu chảy vào đất Việt (''Nơi con sông Hồng chảy vào đất Việt'')?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Tại Việt Nam, tỉnh nào là nơi con sông Hồng bắt đầu chảy vào đất Việt (''Nơi con sông Hồng chảy vào đất Việt'')?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 363, 'Địa lý cơ bản', 'Quần đảo Hoàng Sa trực thuộc thành phố/tỉnh nào của Việt Nam?', '["Thành phố Đà Nẵng","Tỉnh Khánh Hòa","Tỉnh Quảng Ngãi","Tỉnh Bà Rịa - Vũng Tàu"]'::jsonb, 0, 'Huyện đảo Hoàng Sa trực thuộc thành phố Đà Nẵng, còn huyện đảo Trường Sa trực thuộc tỉnh Khánh Hòa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quần đảo Hoàng Sa trực thuộc thành phố/tỉnh nào của Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Quần đảo Hoàng Sa trực thuộc thành phố/tỉnh nào của Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 364, 'Địa lý cơ bản', 'Quần đảo Trường Sa trực thuộc tỉnh/thành phố nào của Việt Nam?', '["Tỉnh Kiên Giang","Thành phố Đà Nẵng","Tỉnh Bình Thuận","Tỉnh Khánh Hòa"]'::jsonb, 3, 'Huyện đảo Trường Sa là một đơn vị hành chính trực thuộc tỉnh Khánh Hòa của Việt Nam.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quần đảo Trường Sa trực thuộc tỉnh/thành phố nào của Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/330px-Meteosat-12-fci-march-equinox-2025-noon.jpg' WHERE lower(trim(prompt)) = lower('Quần đảo Trường Sa trực thuộc tỉnh/thành phố nào của Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 365, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong thế giới Pokémon, chú Pokémon hệ điện màu vàng có đôi má đỏ và chiếc đuôi hình tia sét là ai?', '["Raichu","Pikachu","Pichu","Charmander"]'::jsonb, 1, 'Pikachu là bạn đồng hành trung thành nhất của huấn luyện viên Satoshi (Ash Ketchum) và là linh vật toàn cầu của Pokémon.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong thế giới Pokémon, chú Pokémon hệ điện màu vàng có đôi má đỏ và chiếc đuôi hình tia sét là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong thế giới Pokémon, chú Pokémon hệ điện màu vàng có đôi má đỏ và chiếc đuôi hình tia sét là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 366, 'Hoạt hình tuổi thơ Nhật Bản', 'Câu khẩu hiệu quen thuộc của nhóm phản diện Đội Hỏa Tiễn (Team Rocket) gồm Jessie, James và Meowth là gì?', '["Để bảo vệ thế giới khỏi sự tàn phá! Để thống nhất mọi người trong cùng một dân tộc!","Chúng ta là những kẻ bất bại!","Bắt trọn tất cả Pokémon!","Hãy đầu hàng hoặc chuẩn bị chiến đấu!"]'::jsonb, 0, 'Đoạn thơ chào sân dài dòng hài hước của Đội Hỏa Tiễn đã trở thành ký ức không thể nào quên của khán giả tuổi thơ.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu khẩu hiệu quen thuộc của nhóm phản diện Đội Hỏa Tiễn (Team Rocket) gồm Jessie, James và Meowth là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Câu khẩu hiệu quen thuộc của nhóm phản diện Đội Hỏa Tiễn (Team Rocket) gồm Jessie, James và Meowth là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 367, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong One Piece, ước mơ cháy bỏng của thuyền trưởng Monkey D. Luffy là trở thành ai?', '["Nhà khảo cổ học vĩ đại","Đô đốc Hải quân","Thợ rèn kiếm đệ nhất","Vua Hải Tặc (Pirate King)"]'::jsonb, 3, 'Luffy luôn dõng dạc tuyên bố: ''Tôi là Monkey D. Luffy, người sẽ trở thành Vua Hải Tặc!''.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong One Piece, ước mơ cháy bỏng của thuyền trưởng Monkey D. Luffy là trở thành ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Trong One Piece, ước mơ cháy bỏng của thuyền trưởng Monkey D. Luffy là trở thành ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 368, 'Hoạt hình tuổi thơ Nhật Bản', 'Trái ác quỷ ban đầu mà Luffy đã ăn nhầm biến cơ thể cậu có đặc tính co giãn như cao su là gì?', '["Ope Ope no Mi","Mera Mera no Mi","Gomu Gomu no Mi (Hito Hito no Mi: Model Nika)","Gura Gura no Mi"]'::jsonb, 2, 'Trái Gomu Gomu no Mi (thực chất là trái thần thoại Hito Hito no Mi, Model: Nika - Thần Mặt Trời) mang lại sức mạnh co giãn cao su tự do.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trái ác quỷ ban đầu mà Luffy đã ăn nhầm biến cơ thể cậu có đặc tính co giãn như cao su là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Trái ác quỷ ban đầu mà Luffy đã ăn nhầm biến cơ thể cậu có đặc tính co giãn như cao su là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 369, 'Hoạt hình tuổi thơ Nhật Bản', 'Kiếm sĩ phái Tam Kiếm trong băng Mũ Rơm, mắc chứng mù đường kinh niên tên là gì?', '["Sanji","Roronoa Zoro","Usopp","Trafalgar Law"]'::jsonb, 1, 'Zoro có ước mơ trở thành kiếm sĩ đệ nhất thế giới nhưng có tật xấu ngộ nghĩnh là đi thẳng cũng lạc đường.',
  'https://upload.wikimedia.org/wikipedia/en/a/a4/Roronoa_Zoro.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kiếm sĩ phái Tam Kiếm trong băng Mũ Rơm, mắc chứng mù đường kinh niên tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a4/Roronoa_Zoro.jpg' WHERE lower(trim(prompt)) = lower('Kiếm sĩ phái Tam Kiếm trong băng Mũ Rơm, mắc chứng mù đường kinh niên tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  37, 370, 'Hoạt hình tuổi thơ Nhật Bản', 'Đầu bếp hào hoa mê gái của băng Mũ Rơm, chỉ dùng chân để chiến đấu nhằm bảo vệ đôi tay nấu nướng là ai?', '["Vinsmoke Sanji (Chân Đen)","Brook","Franky","Jinbe"]'::jsonb, 0, 'Sanji là đầu bếp cừ khôi với ước mơ tìm thấy vùng biển All Blue, luôn coi trọng đồ ăn và tôn trọng phụ nữ.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đầu bếp hào hoa mê gái của băng Mũ Rơm, chỉ dùng chân để chiến đấu nhằm bảo vệ đôi tay nấu nướng là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Đầu bếp hào hoa mê gái của băng Mũ Rơm, chỉ dùng chân để chiến đấu nhằm bảo vệ đôi tay nấu nướng là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 371, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Naruto, vĩ thú phong ấn bên trong cơ thể của cậu bé mồ côi Naruto Uzumaki là con gì?', '["Thập Vĩ","Nhất Vĩ Shukaku","Bát Vĩ Gyuki","Cửu Vĩ Hồ Ly (Kurama - Cáo 9 đuôi)"]'::jsonb, 3, 'Cửu Vĩ Kurama được Hokage Đệ Tứ Minato phong ấn vào cơ thể Naruto ngay từ khi cậu vừa lọt lòng.',
  'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Naruto, vĩ thú phong ấn bên trong cơ thể của cậu bé mồ côi Naruto Uzumaki là con gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg' WHERE lower(trim(prompt)) = lower('Trong Naruto, vĩ thú phong ấn bên trong cơ thể của cậu bé mồ côi Naruto Uzumaki là con gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 372, 'Hoạt hình tuổi thơ Nhật Bản', 'Tuyệt kỹ nhẫn thuật đầu tiên gắn liền với thương hiệu của Naruto là gì?', '["Amaterasu","Chidori (Lôi Thiết)","Kage Bunshin no Jutsu (Đa Trọng Ảnh Phân Thân)","Shinra Tensei"]'::jsonb, 2, 'Naruto đã học lén cấm thuật Đa Trọng Ảnh Phân Thân Chi Thuật từ cuộn phong ấn của Làng Lá để bảo vệ thầy Iruka.',
  'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tuyệt kỹ nhẫn thuật đầu tiên gắn liền với thương hiệu của Naruto là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg' WHERE lower(trim(prompt)) = lower('Tuyệt kỹ nhẫn thuật đầu tiên gắn liền với thương hiệu của Naruto là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 373, 'Hoạt hình tuổi thơ Nhật Bản', 'Món ăn khoái khẩu nhất mà Naruto có thể ăn cả ngày lẫn đêm tại quán quen là món gì?', '["Cơm nắm Onigiri","Mì Ramen Ichiraku","Bánh Dango","Thịt nướng Yakiniku"]'::jsonb, 1, 'Quán mì Ramen Ichiraku của bác Teuchi là nơi ấm áp nhất đón nhận Naruto từ những ngày bị cả làng hắt hủi.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c3/Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg/330px-Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Món ăn khoái khẩu nhất mà Naruto có thể ăn cả ngày lẫn đêm tại quán quen là món gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c3/Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg/330px-Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg' WHERE lower(trim(prompt)) = lower('Món ăn khoái khẩu nhất mà Naruto có thể ăn cả ngày lẫn đêm tại quán quen là món gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 374, 'Hoạt hình tuổi thơ Nhật Bản', 'Huy hiệu Sharingan (Tả Luân Nhãn) là huyết kế giới hạn của gia tộc ninja danh tiếng nào trong Naruto?', '["Gia tộc Uchiha","Gia tộc Hyuga","Gia tộc Senju","Gia tộc Uzumaki"]'::jsonb, 0, 'Gia tộc Uchiha với nhãn thuật Sharingan đỏ rực đặc trưng (Sasuke, Itachi, Madara, Obito) sở hữu ảo thuật và nhãn lực vô song.',
  'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Huy hiệu Sharingan (Tả Luân Nhãn) là huyết kế giới hạn của gia tộc ninja danh tiếng nào trong Naruto?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg' WHERE lower(trim(prompt)) = lower('Huy hiệu Sharingan (Tả Luân Nhãn) là huyết kế giới hạn của gia tộc ninja danh tiếng nào trong Naruto?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 375, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong 7 Viên Ngọc Rồng (Dragon Ball), tên khai sinh người Saiyan của Son Goku là gì?', '["Bardock","Vegeta","Raditz","Kakarot"]'::jsonb, 3, 'Goku là người Saiyan được gửi xuống Trái Đất lánh nạn diệt chủng với tên gọi Kakarot.',
  'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong 7 Viên Ngọc Rồng (Dragon Ball), tên khai sinh người Saiyan của Son Goku là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg' WHERE lower(trim(prompt)) = lower('Trong 7 Viên Ngọc Rồng (Dragon Ball), tên khai sinh người Saiyan của Son Goku là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 376, 'Hoạt hình tuổi thơ Nhật Bản', 'Chiêu thức bắn chưởng năng lượng màu xanh lam kinh điển mà Goku học được từ Quy Lão Tiên Sinh là gì?', '["Galick Gun","Genki Dama (Quả cầu khinh khi)","Kamehameha","Makankosappo"]'::jsonb, 2, 'Đòn Kamehameha (Kame-zô-kô) do Sư phụ Roshi sáng tạo sau 50 năm khổ luyện, nhưng Goku chỉ nhìn qua một lần là thi triển được.',
  'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiêu thức bắn chưởng năng lượng màu xanh lam kinh điển mà Goku học được từ Quy Lão Tiên Sinh là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png' WHERE lower(trim(prompt)) = lower('Chiêu thức bắn chưởng năng lượng màu xanh lam kinh điển mà Goku học được từ Quy Lão Tiên Sinh là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 377, 'Hoạt hình tuổi thơ Nhật Bản', 'Khi thu thập đủ 7 viên ngọc rồng, người sở hữu sẽ triệu hồi được ai để ban điều ước?', '["Thần Rùa Roshi","Rồng thần Shenron","Thượng Đế Kami","Thần Hủy Diệt Beerus"]'::jsonb, 1, 'Rồng thần Shenron da xanh mắt đỏ sẽ xuất hiện từ bầu trời mây đen sấm chớp để ban một điều ước bất kỳ.',
  'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Khi thu thập đủ 7 viên ngọc rồng, người sở hữu sẽ triệu hồi được ai để ban điều ước?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png' WHERE lower(trim(prompt)) = lower('Khi thu thập đủ 7 viên ngọc rồng, người sở hữu sẽ triệu hồi được ai để ban điều ước?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 378, 'Hoạt hình tuổi thơ Nhật Bản', 'Hoàng tử kiêu hãnh của tộc người Saiyan, kỳ phùng địch thủ luôn muốn vượt qua Goku là ai?', '["Vegeta (Ca-đíc)","Broly","Trunks","Nappa"]'::jsonb, 0, 'Vegeta ban đầu đến Trái Đất xâm lược nhưng sau này thành đồng đội chí cốt và là chồng của Bulma.',
  'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hoàng tử kiêu hãnh của tộc người Saiyan, kỳ phùng địch thủ luôn muốn vượt qua Goku là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg' WHERE lower(trim(prompt)) = lower('Hoàng tử kiêu hãnh của tộc người Saiyan, kỳ phùng địch thủ luôn muốn vượt qua Goku là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 379, 'Hoạt hình tuổi thơ Nhật Bản', 'Cậu bé 5 tuổi nghịch ngợm, mê nhảy điệu lắc mông và hay trêu chọc các chị gái xinh đẹp là ai?', '["Maruko","Nobita","Conan","Shinnosuke Nohara (Shin - Cậu bé bút chì)"]'::jsonb, 3, 'Shin (Crayon Shin-chan) sống cùng bố Hiroshi, mẹ Misae, em gái Himawari và chú cún Bạch Tuyết (Shiro).',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cậu bé 5 tuổi nghịch ngợm, mê nhảy điệu lắc mông và hay trêu chọc các chị gái xinh đẹp là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png' WHERE lower(trim(prompt)) = lower('Cậu bé 5 tuổi nghịch ngợm, mê nhảy điệu lắc mông và hay trêu chọc các chị gái xinh đẹp là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  38, 380, 'Hoạt hình tuổi thơ Nhật Bản', 'Chú chó cưng màu trắng tròn vo như cục kẹo bông của nhà Shin-chan tên là gì?', '["Pochi","Kuro","Bạch Tuyết (Shiro)","Maru"]'::jsonb, 2, 'Bạch Tuyết (Shiro) là chú cún cực kỳ thông minh, thường biết tự đi dạo và tự mua đồ khi chủ nhà đãng trí.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú chó cưng màu trắng tròn vo như cục kẹo bông của nhà Shin-chan tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Chú chó cưng màu trắng tròn vo như cục kẹo bông của nhà Shin-chan tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 381, 'Hoạt hình tuổi thơ Nhật Bản', 'Câu thần chú biến hình kinh điển: ''Nhân danh Mặt Trăng, ta sẽ trừng trị ngươi!'' là của nữ chiến binh nào?', '["Thủy thủ Sao Hỏa","Thủy thủ Mặt Trăng (Sailor Moon - Usagi Tsukino)","Thủy thủ Sao Thủy","Thủy thủ Sao Kim"]'::jsonb, 1, 'Sailor Moon (Usagi) với mái tóc búi hai búi vàng dài thắt nơ đỏ là biểu tượng thiếu nữ phép thuật tuổi thơ thập niên 90.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png/330px-Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu thần chú biến hình kinh điển: ''Nhân danh Mặt Trăng, ta sẽ trừng trị ngươi!'' là của nữ chiến binh nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png/330px-Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png' WHERE lower(trim(prompt)) = lower('Câu thần chú biến hình kinh điển: ''Nhân danh Mặt Trăng, ta sẽ trừng trị ngươi!'' là của nữ chiến binh nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 382, 'Hoạt hình tuổi thơ Nhật Bản', 'Chú mèo đen biết nói có biểu tượng trăng lưỡi liềm trên trán luôn đồng hành chỉ đường cho Usagi là ai?', '["Luna","Artemis","Diana","Meowth"]'::jsonb, 0, 'Mèo Luna đánh thức sức mạnh chiến binh hộ vệ Mặt Trăng của cô bé Usagi Tsukino vụng về.',
  'https://upload.wikimedia.org/wikipedia/en/e/e5/SMVolume1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú mèo đen biết nói có biểu tượng trăng lưỡi liềm trên trán luôn đồng hành chỉ đường cho Usagi là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/e/e5/SMVolume1.jpg' WHERE lower(trim(prompt)) = lower('Chú mèo đen biết nói có biểu tượng trăng lưỡi liềm trên trán luôn đồng hành chỉ đường cho Usagi là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 383, 'Hoạt hình tuổi thơ Nhật Bản', 'Chàng trai bí ẩn luôn ném một cành hoa hồng đỏ để giải cứu Thủy thủ Mặt Trăng trong lúc nguy cấp là ai?', '["Jadeite","Seiya Kou","Motoki","Tuxedo Mặt Nạ (Mamoru Chiba)"]'::jsonb, 3, 'Tuxedo Mặt Nạ (Hoàng tử Endymion) luôn xuất hiện lịch lãm với áo choàng đen, mũ chóp cao và mặt nạ trắng.',
  'https://upload.wikimedia.org/wikipedia/en/e/e5/SMVolume1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chàng trai bí ẩn luôn ném một cành hoa hồng đỏ để giải cứu Thủy thủ Mặt Trăng trong lúc nguy cấp là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/e/e5/SMVolume1.jpg' WHERE lower(trim(prompt)) = lower('Chàng trai bí ẩn luôn ném một cành hoa hồng đỏ để giải cứu Thủy thủ Mặt Trăng trong lúc nguy cấp là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 384, 'Hoạt hình tuổi thơ Nhật Bản', 'Bộ phim hoạt hình huyền thoại của Studio Ghibli kể về hai chị em Satsuki và Mei gặp gỡ sinh vật khổng lồ thần rừng tên là gì?', '["Lâu Đài Bay Của Pháp Sư Howl","Vùng Đất Linh Hồn","Hàng Xóm Của Tôi Là Totoro (My Neighbor Totoro)","Công Chúa Mononoke"]'::jsonb, 2, 'Totoro là linh vật biểu tượng của xưởng phim hoạt hình Ghibli do đạo diễn đại tài Hayao Miyazaki sáng lập.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Totoro_at_Ghibli_Museum.jpg/640px-Totoro_at_Ghibli_Museum.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình huyền thoại của Studio Ghibli kể về hai chị em Satsuki và Mei gặp gỡ sinh vật khổng lồ thần rừng tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Totoro_at_Ghibli_Museum.jpg/640px-Totoro_at_Ghibli_Museum.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình huyền thoại của Studio Ghibli kể về hai chị em Satsuki và Mei gặp gỡ sinh vật khổng lồ thần rừng tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 385, 'Hoạt hình tuổi thơ Nhật Bản', 'Bộ phim hoạt hình Nhật Bản duy nhất trong lịch sử từng đoạt giải Oscar cho ''Phim hoạt hình xuất sắc nhất'' năm 2003 là tác phẩm nào?', '["Mộ Đom Đóm","Vùng Đất Linh Hồn (Spirited Away)","Your Name (Tên Cậu Là Gì?)","Cô Bé Người Cá Ponyo"]'::jsonb, 1, 'Spirited Away của Hayao Miyazaki kể về hành trình cứu bố mẹ bị biến thành heo của cô bé Chihiro trong nhà tắm công cộng của Yubaba.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình Nhật Bản duy nhất trong lịch sử từng đoạt giải Oscar cho ''Phim hoạt hình xuất sắc nhất'' năm 2003 là tác phẩm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình Nhật Bản duy nhất trong lịch sử từng đoạt giải Oscar cho ''Phim hoạt hình xuất sắc nhất'' năm 2003 là tác phẩm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 386, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong anime âm nhạc/thể thao học đường ''Vua Bóng Rổ'' (Slam Dunk), chàng tóc đỏ ngổ ngáo tự xưng là ''thiên tài'' là ai?', '["Hanamichi Sakuragi","Kaede Rukawa","Takenori Akagi","Hisashi Mitsui"]'::jsonb, 0, 'Sakuragi vì muốn cưa cẩm cô bạn Haruko nên đã gia nhập đội bóng rổ trường trung học Shohoku.',
  'https://upload.wikimedia.org/wikipedia/en/f/f7/Slam_Dunk_%28manga%29_1.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong anime âm nhạc/thể thao học đường ''Vua Bóng Rổ'' (Slam Dunk), chàng tóc đỏ ngổ ngáo tự xưng là ''thiên tài'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/f/f7/Slam_Dunk_%28manga%29_1.png' WHERE lower(trim(prompt)) = lower('Trong anime âm nhạc/thể thao học đường ''Vua Bóng Rổ'' (Slam Dunk), chàng tóc đỏ ngổ ngáo tự xưng là ''thiên tài'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 387, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''Nhóc Maruko'' (Chibi Maruko-chan), Maruko có mái tóc răng cưa đặc trưng và người ông nội hết mực yêu chiều tên là gì?', '["Ông Hanawa","Ông Hiroshi","Ông Nagasawa","Ông Tomozo"]'::jsonb, 3, 'Ông nội Tomozo Sakura rất thương Maruko và thường làm những bài thơ haiku hài hước đầy suy ngẫm.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Nhóc Maruko'' (Chibi Maruko-chan), Maruko có mái tóc răng cưa đặc trưng và người ông nội hết mực yêu chiều tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Trong ''Nhóc Maruko'' (Chibi Maruko-chan), Maruko có mái tóc răng cưa đặc trưng và người ông nội hết mực yêu chiều tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 388, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Yu-Gi-Oh! (Vua Trò Chơi), ba lá bài ''Tam Ảo Thần'' quyền năng tối thượng của Ai Cập cổ đại gồm những vị thần nào?', '["Exodia, Chaos Soldier, Kuriboh","Blue-Eyes White Dragon, Red-Eyes Black Dragon, Dark Magician","Slifer the Sky Dragon, Obelisk the Tormentor, The Winged Dragon of Ra","Thần Zeus, Poseidon, Hades"]'::jsonb, 2, 'Thần Bầu Trời Slifer (Osiris), Thần Khổng Lồ Obelisk và Thần Mặt Trời Ra là bộ ba lá bài thần thánh huyền thoại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Yu-Gi-Oh! (Vua Trò Chơi), ba lá bài ''Tam Ảo Thần'' quyền năng tối thượng của Ai Cập cổ đại gồm những vị thần nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Trong Yu-Gi-Oh! (Vua Trò Chơi), ba lá bài ''Tam Ảo Thần'' quyền năng tối thượng của Ai Cập cổ đại gồm những vị thần nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 389, 'Hoạt hình tuổi thơ Nhật Bản', 'Lá bài quái thú biểu tượng mạnh mẽ nhất của chàng thiếu gia kiêu ngạo Seto Kaiba là gì?', '["Phù Thủy Áo Đen","Rồng Trắng Mắt Xanh (Blue-Eyes White Dragon)","Rồng Đen Mắt Đỏ","Quái Thú Ba Đầu"]'::jsonb, 1, 'Kaiba sở hữu 3 lá bài Rồng Trắng Mắt Xanh có sức tấn công 3000 điểm và có thể dung hợp thành Rồng Ba Đầu Tối Thượng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Lá bài quái thú biểu tượng mạnh mẽ nhất của chàng thiếu gia kiêu ngạo Seto Kaiba là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Lá bài quái thú biểu tượng mạnh mẽ nhất của chàng thiếu gia kiêu ngạo Seto Kaiba là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  39, 390, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''Dấu Ấn Rồng Thiêng'' (Dragon Quest), dấu ấn rồng của dũng sĩ Dai xuất hiện ở vị trí nào trên cơ thể khi phát huy sức mạnh?', '["Trên mu bàn tay","Trên trán","Sau gáy","Trên ngực áo"]'::jsonb, 0, 'Dấu ấn rồng thiêng hình đầu rồng màu xanh sáng rực trên mu bàn tay phải là minh chứng dòng máu Hiệp Sĩ Rồng của Dai.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Dấu Ấn Rồng Thiêng'' (Dragon Quest), dấu ấn rồng của dũng sĩ Dai xuất hiện ở vị trí nào trên cơ thể khi phát huy sức mạnh?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong ''Dấu Ấn Rồng Thiêng'' (Dragon Quest), dấu ấn rồng của dũng sĩ Dai xuất hiện ở vị trí nào trên cơ thể khi phát huy sức mạnh?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 391, 'Hoạt hình tuổi thơ Nhật Bản', 'Bộ truyện ''Inuyasha'' (Khuyển Dạ Xoa) xoay quanh cuộc tìm kiếm những mảnh vỡ của viên ngọc thần nào?', '["Ngọc Linh Hồn","Ngọc Bảy Màu","Ngọc Rồng Thần","Ngọc Tứ Hồn (Shikon no Tama)"]'::jsonb, 3, 'Kagome vô tình bắn vỡ viên Ngọc Tứ Hồn thành muôn ngàn mảnh vụn rơi khắp thời Chiến Quốc, mở ra hành trình cùng bán yêu Inuyasha.',
  'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ truyện ''Inuyasha'' (Khuyển Dạ Xoa) xoay quanh cuộc tìm kiếm những mảnh vỡ của viên ngọc thần nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png' WHERE lower(trim(prompt)) = lower('Bộ truyện ''Inuyasha'' (Khuyển Dạ Xoa) xoay quanh cuộc tìm kiếm những mảnh vỡ của viên ngọc thần nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 392, 'Hoạt hình tuổi thơ Nhật Bản', 'Thanh kiếm được rèn từ răng nanh của cha mà Inuyasha sử dụng để thi triển Phong Thương có tên là gì?', '["Bạo Toái Nha (Bakusaiga)","Thiên Sinh Nha (Tenseiga)","Thiết Toái Nha (Tessaiga)","Đấu Quỷ Thần"]'::jsonb, 2, 'Thiết Toái Nha là thanh kiếm chém trăm yêu quái dành cho Inuyasha, còn người anh trai Sesshomaru nhận thanh Thiên Sinh Nha cứu người.',
  'https://upload.wikimedia.org/wikipedia/en/6/67/Inuyasha_1.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thanh kiếm được rèn từ răng nanh của cha mà Inuyasha sử dụng để thi triển Phong Thương có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/6/67/Inuyasha_1.png' WHERE lower(trim(prompt)) = lower('Thanh kiếm được rèn từ răng nanh của cha mà Inuyasha sử dụng để thi triển Phong Thương có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 393, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Bleach (Sứ Giả Thần Chết), vũ khí chính dạng thanh kiếm linh hồn của các Tử Thần được gọi là gì?', '["Kunai","Zanpakuto (Trảm Hồn Đao)","Katana","Shuriken"]'::jsonb, 1, 'Mỗi Tử Thần (Shinigami) sở hữu một thanh Trảm Hồn Đao với tên gọi riêng và hai cấp độ giải phóng là Shikai và Bankai.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Bleach (Sứ Giả Thần Chết), vũ khí chính dạng thanh kiếm linh hồn của các Tử Thần được gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong Bleach (Sứ Giả Thần Chết), vũ khí chính dạng thanh kiếm linh hồn của các Tử Thần được gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 394, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Attack on Titan (Đại Chiến Titan), Eren Jaeger sở hữu Titan đầu tiên có tên là gì?', '["Titan Tiến Công (Attack Titan)","Titan Thiết Giáp","Titan Khổng Lồ","Titan Hình Nữ"]'::jsonb, 0, 'Eren kế thừa Titan Tiến Công - thực thể luôn hướng về phía trước chiến đấu vì tự do xuyên suốt mọi thời đại.',
  'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Attack on Titan (Đại Chiến Titan), Eren Jaeger sở hữu Titan đầu tiên có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg' WHERE lower(trim(prompt)) = lower('Trong Attack on Titan (Đại Chiến Titan), Eren Jaeger sở hữu Titan đầu tiên có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 395, 'Hoạt hình tuổi thơ Nhật Bản', 'Vị đội trưởng lạnh lùng, thấp bé nhưng sở hữu kỹ năng diệt Titan đỉnh cao được mệnh danh là ''Chiến binh mạnh nhất nhân loại'' là ai?', '["Jean Kirstein","Erwin Smith","Armin Arlert","Levi Ackerman"]'::jsonb, 3, 'Đại úy Levi Ackerman với tốc độ xoay kiếm chớp nhoáng và tính cách cuồng dọn dẹp vệ sinh là nhân vật được yêu thích nhất bộ phim.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị đội trưởng lạnh lùng, thấp bé nhưng sở hữu kỹ năng diệt Titan đỉnh cao được mệnh danh là ''Chiến binh mạnh nhất nhân loại'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Vị đội trưởng lạnh lùng, thấp bé nhưng sở hữu kỹ năng diệt Titan đỉnh cao được mệnh danh là ''Chiến binh mạnh nhất nhân loại'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 396, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Kimetsu no Yaiba (Thanh Gươm Diệt Quỷ), cô em gái bị biến thành quỷ phải ngậm ống tre của Tanjiro tên là gì?', '["Shinobu Kocho","Kanao Tsuyuri","Nezuko Kamado","Mitsuri Kanroji"]'::jsonb, 2, 'Nezuko dù mang dòng máu quỷ nhưng quyết không ăn thịt người và luôn bảo vệ loài người.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Kimetsu no Yaiba (Thanh Gươm Diệt Quỷ), cô em gái bị biến thành quỷ phải ngậm ống tre của Tanjiro tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong Kimetsu no Yaiba (Thanh Gươm Diệt Quỷ), cô em gái bị biến thành quỷ phải ngậm ống tre của Tanjiro tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 397, 'Hoạt hình tuổi thơ Nhật Bản', 'Hơi thở kiếm thuật ban đầu mà Tanjiro Kamado được cựu Thủy Trụ Urokodaki truyền dạy là gì?', '["Hơi thở của Lửa","Hơi thở của Nước (Water Breathing)","Hơi thở của Sấm Sét","Hơi thở của Gió"]'::jsonb, 1, 'Tanjiro tập luyện chém tảng đá lớn tại núi Sagiri và thuần thục 10 thức của Hơi thở của Nước.',
  'https://upload.wikimedia.org/wikipedia/en/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Hơi thở kiếm thuật ban đầu mà Tanjiro Kamado được cựu Thủy Trụ Urokodaki truyền dạy là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg' WHERE lower(trim(prompt)) = lower('Hơi thở kiếm thuật ban đầu mà Tanjiro Kamado được cựu Thủy Trụ Urokodaki truyền dạy là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 398, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Hunter x Hunter, hệ thống năng lượng sức mạnh điều khiển khí sinh mệnh trong cơ thể được gọi là gì?', '["Nen (Niệm)","Chakra","Haki","Reiatsu"]'::jsonb, 0, 'Niệm (Nen) chia làm 6 hệ chính: Cường hóa, Biến hóa, Phóng xạ, Thao tác, Cụ thể hóa và Đặc chất.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Hunter x Hunter, hệ thống năng lượng sức mạnh điều khiển khí sinh mệnh trong cơ thể được gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong Hunter x Hunter, hệ thống năng lượng sức mạnh điều khiển khí sinh mệnh trong cơ thể được gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 399, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Astro Boy (Tay Súng Robot / Cậu Bé Robot), tác giả vĩ đại được tôn vinh là ''Thần truyện tranh'' (God of Manga) của Nhật Bản là ai?', '["Shotaro Ishinomori","Fujiko F. Fujio","Go Nagai","Osamu Tezuka"]'::jsonb, 3, 'Bác sĩ kiêm họa sĩ Osamu Tezuka đã đặt nền móng khai sinh ra toàn bộ nền công nghiệp anime và manga hiện đại Nhật Bản.',
  'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Astro Boy (Tay Súng Robot / Cậu Bé Robot), tác giả vĩ đại được tôn vinh là ''Thần truyện tranh'' (God of Manga) của Nhật Bản là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg' WHERE lower(trim(prompt)) = lower('Trong Astro Boy (Tay Súng Robot / Cậu Bé Robot), tác giả vĩ đại được tôn vinh là ''Thần truyện tranh'' (God of Manga) của Nhật Bản là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  40, 400, 'Hoạt hình tuổi thơ Nhật Bản', 'Tàu Sunny ngàn dặm (Thousand Sunny) của băng Mũ Rơm trong One Piece có chiếc đầu tàu được chạm khắc hình gì?', '["Đầu rồng phun lửa","Đầu dê mỉm cười","Đầu sư tử với bờm như cánh hoa hướng dương","Đầu cá voi khổng lồ"]'::jsonb, 2, 'Thợ đóng tàu Franky thiết kế đầu tàu hình sư tử dũng mãnh lấy năng lượng từ thùng nước ngọt cola.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tàu Sunny ngàn dặm (Thousand Sunny) của băng Mũ Rơm trong One Piece có chiếc đầu tàu được chạm khắc hình gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Tàu Sunny ngàn dặm (Thousand Sunny) của băng Mũ Rơm trong One Piece có chiếc đầu tàu được chạm khắc hình gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 401, 'Hoạt hình tuổi thơ Nhật Bản', 'Chú mèo hình tròn màu xanh lam bay trong không trung với đôi cánh thiên thần trong Fairy Tail tên là gì?', '["Carla","Happy","Panther Lily","Frosch"]'::jsonb, 1, 'Happy là chú mèo Exceed luôn bay lượn và nói câu cửa miệng ''Aye Sir!'' bên cạnh Natsu Dragneel.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú mèo hình tròn màu xanh lam bay trong không trung với đôi cánh thiên thần trong Fairy Tail tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Chú mèo hình tròn màu xanh lam bay trong không trung với đôi cánh thiên thần trong Fairy Tail tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 402, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Death Note (Cuốn Sổ Thiên Mệnh), thần chết (Shinigami) mê ăn táo đỏ tên là gì?', '["Ryuk","Rem","Sidoh","Gelus"]'::jsonb, 0, 'Tử thần Ryuk đánh rơi cuốn sổ Death Note xuống thế giới loài người vì buồn chán và bị nghiện ăn táo đỏ của Trái Đất.',
  'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Death Note (Cuốn Sổ Thiên Mệnh), thần chết (Shinigami) mê ăn táo đỏ tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong Death Note (Cuốn Sổ Thiên Mệnh), thần chết (Shinigami) mê ăn táo đỏ tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 403, 'Hoạt hình tuổi thơ Nhật Bản', 'Thiên tài thám tử có tư thế ngồi xổm kỳ lạ và sở thích ăn đồ ngọt ngấu nghiến trong Death Note là ai?', '["Watari","Near","Mello","L (L Lawliet)"]'::jsonb, 3, 'L là bộ óc phá án số một thế giới đối đầu trực diện với Kira (Light Yagami).',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thiên tài thám tử có tư thế ngồi xổm kỳ lạ và sở thích ăn đồ ngọt ngấu nghiến trong Death Note là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Thiên tài thám tử có tư thế ngồi xổm kỳ lạ và sở thích ăn đồ ngọt ngấu nghiến trong Death Note là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 404, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Digimon Adventure (Thế Giới Quái Thú), Digimon đồng hành đầu tiên của đội trưởng Yagami Taichi là ai?', '["Patamon","Gabumon","Agumon","Tentomon"]'::jsonb, 2, 'Agumon là chú khủng long da cam nhỏ nhắn phun ra quả cầu lửa Baby Flame, tiến hóa thành Greymon.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Digimon Adventure (Thế Giới Quái Thú), Digimon đồng hành đầu tiên của đội trưởng Yagami Taichi là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong Digimon Adventure (Thế Giới Quái Thú), Digimon đồng hành đầu tiên của đội trưởng Yagami Taichi là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 405, 'Hoạt hình tuổi thơ Nhật Bản', 'Bảo bối chiếc xe đạp nước có thể chạy trên mặt hồ của cậu bé đầu nấm trong phim hoạt hình nào?', '["Ninja Hattori","Cậu bé Kiteretsu (Kiteretsu Daihyakka)","Doraemon","Siêu nhân Mami"]'::jsonb, 1, 'Kiteretsu là cậu bé thiên tài chế tạo máy móc dựa trên cuốn sách cổ bí truyền của tổ tiên.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bảo bối chiếc xe đạp nước có thể chạy trên mặt hồ của cậu bé đầu nấm trong phim hoạt hình nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Bảo bối chiếc xe đạp nước có thể chạy trên mặt hồ của cậu bé đầu nấm trong phim hoạt hình nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 406, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong Tokyo Ghoul (Ngạ Quỷ Tokyo), nhân vật chính Ken Kaneki bắt đầu đeo chiếc mặt nạ da màu đen có khóa kéo ở đâu?', '["Khóa kéo ở phần miệng","Khóa kéo ở mắt trái","Khóa kéo ở tai","Khóa kéo ở sau gáy"]'::jsonb, 0, 'Chiếc mặt nạ độc đáo của thợ Uta làm cho Kaneki có khóa kéo ở miệng để lộ hàm răng giả dữ tợn và che đi mắt bình thường.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Tokyo Ghoul (Ngạ Quỷ Tokyo), nhân vật chính Ken Kaneki bắt đầu đeo chiếc mặt nạ da màu đen có khóa kéo ở đâu?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong Tokyo Ghoul (Ngạ Quỷ Tokyo), nhân vật chính Ken Kaneki bắt đầu đeo chiếc mặt nạ da màu đen có khóa kéo ở đâu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 407, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong bộ anime ''Fullmetal Alchemist (Giả kim thuật sư)'', hai anh em nhân vật chính có tên là gì?', '["Gon và Killua","Eren và Armin","Tanjiro và Zenitsu","Edward Elric và Alphonse Elric"]'::jsonb, 3, 'Hai anh em Edward và Alphonse Elric lên đường tìm kiếm Hòn đá Triết gia để khôi phục cơ thể.',
  'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ anime ''Fullmetal Alchemist (Giả kim thuật sư)'', hai anh em nhân vật chính có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg' WHERE lower(trim(prompt)) = lower('Trong bộ anime ''Fullmetal Alchemist (Giả kim thuật sư)'', hai anh em nhân vật chính có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 408, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong bộ truyện ''Hunter x Hunter (Thợ săn tí hon)'', cha của nhân vật chính Gon Freecss tên là gì?', '["Isaac Netero","Silva Zoldyck","Ging Freecss","Chrollo Lucilfer"]'::jsonb, 2, 'Gon tham gia kỳ thi Hunter để tìm người cha huyền thoại Ging Freecss.',
  'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ truyện ''Hunter x Hunter (Thợ săn tí hon)'', cha của nhân vật chính Gon Freecss tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png' WHERE lower(trim(prompt)) = lower('Trong bộ truyện ''Hunter x Hunter (Thợ săn tí hon)'', cha của nhân vật chính Gon Freecss tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 409, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''Thanh gươm diệt quỷ (Demon Slayer)'', Viêm Trụ đã chiến đấu anh dũng trên Chuyến tàu vô tận tên là gì?', '["Tengen Uzui","Kyojuro Rengoku","Giyu Tomioka","Muichiro Tokito"]'::jsonb, 1, 'Viêm Trụ Kyojuro Rengoku là nhân vật để lại ấn tượng sâu sắc nhất trong phần Chuyến tàu vô tận (Mugen Train).',
  'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thanh gươm diệt quỷ (Demon Slayer)'', Viêm Trụ đã chiến đấu anh dũng trên Chuyến tàu vô tận tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png' WHERE lower(trim(prompt)) = lower('Trong ''Thanh gươm diệt quỷ (Demon Slayer)'', Viêm Trụ đã chiến đấu anh dũng trên Chuyến tàu vô tận tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  41, 410, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''One Piece'', bác sĩ của băng hải tặc Mũ Rơm là một chú tuần lộc mũi xanh đã ăn trái ác quỷ Hito Hito no Mi tên là gì?', '["Tony Tony Chopper","Brook","Franky","Jinbe"]'::jsonb, 0, 'Tony Tony Chopper là bác sĩ đáng yêu của băng Mũ Rơm, rất thích ăn kẹo bông gòn.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''One Piece'', bác sĩ của băng hải tặc Mũ Rơm là một chú tuần lộc mũi xanh đã ăn trái ác quỷ Hito Hito no Mi tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Trong ''One Piece'', bác sĩ của băng hải tặc Mũ Rơm là một chú tuần lộc mũi xanh đã ăn trái ác quỷ Hito Hito no Mi tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 411, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''One Piece'', hoa tiêu của băng Mũ Rơm có tài dự báo thời tiết và vẽ bản đồ thế giới là ai?', '["Nefertari Vivi","Nico Robin","Boa Hancock","Nami"]'::jsonb, 3, 'Nami (''Miêu tặc'') là hoa tiêu xuất sắc của băng Mũ Rơm với ước mơ vẽ bản đồ toàn thế giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''One Piece'', hoa tiêu của băng Mũ Rơm có tài dự báo thời tiết và vẽ bản đồ thế giới là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png' WHERE lower(trim(prompt)) = lower('Trong ''One Piece'', hoa tiêu của băng Mũ Rơm có tài dự báo thời tiết và vẽ bản đồ thế giới là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 412, 'Hoạt hình tuổi thơ Nhật Bản', 'Nhà khảo cổ học duy nhất của băng Mũ Rơm trong ''One Piece'' có thể đọc được phiến đá cổ Poneglyph là ai?', '["Yamato","Nami","Nico Robin","Carrot"]'::jsonb, 2, 'Nico Robin quê ở đảo Ohara là người đọc được chữ cổ trên các phiến đá Poneglyph.',
  'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhà khảo cổ học duy nhất của băng Mũ Rơm trong ''One Piece'' có thể đọc được phiến đá cổ Poneglyph là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png' WHERE lower(trim(prompt)) = lower('Nhà khảo cổ học duy nhất của băng Mũ Rơm trong ''One Piece'' có thể đọc được phiến đá cổ Poneglyph là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 413, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong bộ truyện ''Naruto'', thầy giáo của Đội 7 (Naruto, Sasuke, Sakura) được mệnh danh là ''Ninja sao chép'' tên là gì?', '["Jiraiya","Hatake Kakashi","Might Guy","Umino Iruka"]'::jsonb, 1, 'Hatake Kakashi nổi tiếng với con mắt Sharingan và biệt danh Ninja sao chép hơn 1000 nhẫn thuật.',
  'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ truyện ''Naruto'', thầy giáo của Đội 7 (Naruto, Sasuke, Sakura) được mệnh danh là ''Ninja sao chép'' tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg' WHERE lower(trim(prompt)) = lower('Trong bộ truyện ''Naruto'', thầy giáo của Đội 7 (Naruto, Sasuke, Sakura) được mệnh danh là ''Ninja sao chép'' tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 414, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''Naruto'', ai là Hokage Đệ Tứ (Tia chớp vàng làng Lá) và cũng là cha ruột của Uzumaki Naruto?', '["Namikaze Minato","Senju Hashirama","Senju Tobirama","Sarutobi Hiruzen"]'::jsonb, 0, 'Hokage Đệ Tứ Namikaze Minato (''Tia chớp vàng'') và Uzumaki Kushina là cha mẹ của Naruto.',
  'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Naruto'', ai là Hokage Đệ Tứ (Tia chớp vàng làng Lá) và cũng là cha ruột của Uzumaki Naruto?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Naruto'', ai là Hokage Đệ Tứ (Tia chớp vàng làng Lá) và cũng là cha ruột của Uzumaki Naruto?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 415, 'Hoạt hình tuổi thơ Nhật Bản', 'Trong ''Dragon Ball (7 Viên Ngọc Rồng)'', hợp thể giữa Goku và Vegeta bằng bông tai Potara của thần Kaioshin tạo ra chiến binh nào?', '["Broly","Gogeta","Gotenks","Vegito"]'::jsonb, 3, 'Hợp thể bằng bông tai Potara tạo ra Vegito, còn hợp thể bằng điệu nhảy Fusion Dance tạo ra Gogeta.',
  'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Dragon Ball (7 Viên Ngọc Rồng)'', hợp thể giữa Goku và Vegeta bằng bông tai Potara của thần Kaioshin tạo ra chiến binh nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Dragon Ball (7 Viên Ngọc Rồng)'', hợp thể giữa Goku và Vegeta bằng bông tai Potara của thần Kaioshin tạo ra chiến binh nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 416, 'Hoạt hình tuổi thơ Nhật Bản', 'Đạo diễn huyền thoại người Nhật Bản nào đã đồng sáng lập xưởng phim hoạt hình Studio Ghibli?', '["Mamoru Hosoda","Makoto Shinkai","Hayao Miyazaki","Hideaki Anno"]'::jsonb, 2, 'Hayao Miyazaki là bậc thầy hoạt hình đứng sau Spirited Away, My Neighbor Totoro, Howl''s Moving Castle.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đạo diễn huyền thoại người Nhật Bản nào đã đồng sáng lập xưởng phim hoạt hình Studio Ghibli?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg/330px-View_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg' WHERE lower(trim(prompt)) = lower('Đạo diễn huyền thoại người Nhật Bản nào đã đồng sáng lập xưởng phim hoạt hình Studio Ghibli?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 417, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong bộ phim truyền hình kinh điển ''Tây Du Ký 1986'', nghệ sĩ gạo cội nào đã đóng vai Tôn Ngộ Không xuất thần nhất lịch sử?', '["Lục Tiểu Linh Đồng (Chương Kim Lai)","Mã Đức Hoa","Uông Việt","Trì Trọng Thụy"]'::jsonb, 0, 'Gia tộc họ Chương 4 đời đóng khỉ, nghệ sĩ Lục Tiểu Linh Đồng đã tạo nên tượng đài Mỹ Hầu Vương Tề Thiên Đại Thánh không thể xô đổ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim truyền hình kinh điển ''Tây Du Ký 1986'', nghệ sĩ gạo cội nào đã đóng vai Tôn Ngộ Không xuất thần nhất lịch sử?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Trong bộ phim truyền hình kinh điển ''Tây Du Ký 1986'', nghệ sĩ gạo cội nào đã đóng vai Tôn Ngộ Không xuất thần nhất lịch sử?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 418, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Vũ khí của Tôn Ngộ Không vốn là khối sắt thần trấn hải của Đông Hải Long Vương có tên đầy đủ là gì?', '["Bảo Kiếm Thất Tinh","Cửu Xỉ Đinh Ba","Hàng Yêu Bảo Trượng","Như Ý Kim Cô Bổng (Gậy Như Ý)"]'::jsonb, 3, 'Định Hải Thần Châm nặng một vạn ba ngàn năm trăm cân (13.500 cân) có thể thu nhỏ như cây kim cất trong lỗ tai.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vũ khí của Tôn Ngộ Không vốn là khối sắt thần trấn hải của Đông Hải Long Vương có tên đầy đủ là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Vũ khí của Tôn Ngộ Không vốn là khối sắt thần trấn hải của Đông Hải Long Vương có tên đầy đủ là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 419, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trư Bát Giới trước khi bị đày xuống trần gian làm yêu quái lợn từng giữ chức quan võ chỉ huy thủy quân nào trên Thiên Đình?', '["Thác Tháp Lý Thiên Vương","Quyển Liêm Đại Tướng","Thiên Bồng Nguyên Soái","Nhị Lang Thần"]'::jsonb, 2, 'Thiên Bồng Nguyên Soái chỉ huy 8 vạn thủy binh ở dải Ngân Hà, do trêu ghẹo Hằng Nga lúc say rượu nên bị Ngọc Hoàng trừng phạt.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trư Bát Giới trước khi bị đày xuống trần gian làm yêu quái lợn từng giữ chức quan võ chỉ huy thủy quân nào trên Thiên Đình?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Trư Bát Giới trước khi bị đày xuống trần gian làm yêu quái lợn từng giữ chức quan võ chỉ huy thủy quân nào trên Thiên Đình?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  42, 420, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Sa Tăng (Sa Ngộ Tĩnh) trước khi phò tá Đường Tăng từng làm tướng quân gì tại Thiên Đình và bị phạt giáng xuống sông Lưu Sa?', '["Thiên Bồng Nguyên Soái","Quyển Liêm Đại Tướng","Cự Linh Thần","Cơ Đốc Quân"]'::jsonb, 1, 'Quyển Liêm Đại Tướng coi sóc rèm ngọc điện Linh Tiêu, vì lỡ tay làm vỡ chén lưu ly trong hội Bàn Đào nên bị đày xuống sông Lưu Sa.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Sa Tăng (Sa Ngộ Tĩnh) trước khi phò tá Đường Tăng từng làm tướng quân gì tại Thiên Đình và bị phạt giáng xuống sông Lưu Sa?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Sa Tăng (Sa Ngộ Tĩnh) trước khi phò tá Đường Tăng từng làm tướng quân gì tại Thiên Đình và bị phạt giáng xuống sông Lưu Sa?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 421, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Con ngựa Bạch Long Mã đưa Đường Tăng đi Tây Trúc thỉnh kinh thực chất là hoàng tử của Long Vương nào?', '["Tam thái tử của Tây Hải Long Vương","Thái tử Đông Hải Long Vương","Bắc Hải Long Vương","Nam Hải Long Vương"]'::jsonb, 0, 'Bạch Long Mã là Ngao Liệt (con trai thứ ba của Tây Hải Long Vương Ngao Nhuận) ăn thịt ngựa của Đường Tăng rồi hóa thân làm ngựa đền tội.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Con ngựa Bạch Long Mã đưa Đường Tăng đi Tây Trúc thỉnh kinh thực chất là hoàng tử của Long Vương nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Con ngựa Bạch Long Mã đưa Đường Tăng đi Tây Trúc thỉnh kinh thực chất là hoàng tử của Long Vương nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 422, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Tôn Ngộ Không bị Phật Tổ Như Lai đè dưới ngọn núi nào suốt 500 năm trước khi được Đường Tăng giải cứu?', '["Vạn Thọ Sơn","Hoa Quả Sơn","Hỏa Diệm Sơn","Ngũ Hành Sơn (Ngũ Chỉ Sơn)"]'::jsonb, 3, 'Bàn tay 5 ngón của Phật Như Lai biến thành dãy núi Ngũ Hành Sơn phong ấn Đại Thánh cùng lá bùa lục tự chân ngôn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tôn Ngộ Không bị Phật Tổ Như Lai đè dưới ngọn núi nào suốt 500 năm trước khi được Đường Tăng giải cứu?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Tôn Ngộ Không bị Phật Tổ Như Lai đè dưới ngọn núi nào suốt 500 năm trước khi được Đường Tăng giải cứu?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 423, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Để vượt qua Hỏa Diệm Sơn nghìn dặm rực lửa, Tôn Ngộ Không phải ba lần đi mượn bảo bối gì của Thiết Phiến Công Chúa?', '["Dây thừng hoàng kim","Hồ lô tử kim","Quạt Ba Tiêu","Bình dương liễu"]'::jsonb, 2, 'Quạt Ba Tiêu làm từ lá cây thần tiên thời kỳ Hỗn Độn quạt một cái tắt lửa, quạt hai cái sinh gió mát, quạt ba cái có mưa rào.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Để vượt qua Hỏa Diệm Sơn nghìn dặm rực lửa, Tôn Ngộ Không phải ba lần đi mượn bảo bối gì của Thiết Phiến Công Chúa?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Để vượt qua Hỏa Diệm Sơn nghìn dặm rực lửa, Tôn Ngộ Không phải ba lần đi mượn bảo bối gì của Thiết Phiến Công Chúa?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 424, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Hoàn Châu Cách Cách'', nhân vật Tiểu Yến Tử với tính cách hoạt bát, nghịch ngợm do nữ diễn viên nào thủ vai?', '["Lâm Tâm Như","Triệu Vy (Vicky Zhao)","Phạm Băng Băng","Vương Diễm"]'::jsonb, 1, 'Vai diễn ''Én nhỏ'' Tiểu Yến Tử đã đưa Triệu Vy trở thành hiện tượng văn hóa giải trí chấn động toàn châu Á năm 1998.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Hoàn Châu Cách Cách'', nhân vật Tiểu Yến Tử với tính cách hoạt bát, nghịch ngợm do nữ diễn viên nào thủ vai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Hoàn Châu Cách Cách'', nhân vật Tiểu Yến Tử với tính cách hoạt bát, nghịch ngợm do nữ diễn viên nào thủ vai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 425, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Nàng tài nữ dịu dàng, con gái ruột thất lạc của Hoàng đế Càn Long bên bờ hồ Đại Minh trong Hoàn Châu Cách Cách là ai?', '["Hạ Tử Vy","Tiểu Yến Tử","Tình Nhi","Kim Tỏa"]'::jsonb, 0, 'Hạ Tử Vy do Lâm Tâm Như thủ vai là cô gái cầm kỳ thi họa vẹn toàn, đem theo cây quạt và bức tranh đi tìm hoàng a mã.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nàng tài nữ dịu dàng, con gái ruột thất lạc của Hoàng đế Càn Long bên bờ hồ Đại Minh trong Hoàn Châu Cách Cách là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg' WHERE lower(trim(prompt)) = lower('Nàng tài nữ dịu dàng, con gái ruột thất lạc của Hoàng đế Càn Long bên bờ hồ Đại Minh trong Hoàn Châu Cách Cách là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 426, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Nàng a hoàn Kim Tỏa trung thành của Hạ Tử Vy trong Hoàn Châu Cách Cách do ngôi sao nào đóng thời trẻ?', '["Chương Tử Di","Châu Tấn","Lý Băng Băng","Phạm Băng Băng"]'::jsonb, 3, 'Phạm Băng Băng bắt đầu sự nghiệp diễn xuất vang dội từ vai nàng nha hoàn Kim Tỏa xinh đẹp trước khi trở thành ''Phạm Gia''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nàng a hoàn Kim Tỏa trung thành của Hạ Tử Vy trong Hoàn Châu Cách Cách do ngôi sao nào đóng thời trẻ?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg' WHERE lower(trim(prompt)) = lower('Nàng a hoàn Kim Tỏa trung thành của Hạ Tử Vy trong Hoàn Châu Cách Cách do ngôi sao nào đóng thời trẻ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 427, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Vị thái y kiêm thiếu gia văn võ song toàn, người yêu sâu sắc của Hạ Tử Vy trong Hoàn Châu Cách Cách là ai?', '["Tiêu Kiếm","Vĩnh Kỳ (Ngũ A Ca)","Phúc Nhĩ Khang","Mông Đan"]'::jsonb, 2, 'Phúc Nhĩ Khang (do Châu Kiệt đóng) là thị vệ thân tín của Càn Long và có mối tình thề non hẹn biển cùng Tử Vy.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị thái y kiêm thiếu gia văn võ song toàn, người yêu sâu sắc của Hạ Tử Vy trong Hoàn Châu Cách Cách là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg' WHERE lower(trim(prompt)) = lower('Vị thái y kiêm thiếu gia văn võ song toàn, người yêu sâu sắc của Hạ Tử Vy trong Hoàn Châu Cách Cách là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 428, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Bà hoàng hậu độc ác và người vú nuôi cầm kim châm tra tấn dã man Tử Vy trong Hoàn Châu Cách Cách là ai?', '["Lý Ma Ma","Dung Ma Ma","Quế Ma Ma","Triệu Ma Ma"]'::jsonb, 1, 'Cảnh Dung Ma Ma nghiến răng châm kim vào ngón tay Hạ Tử Vy là cảnh phim phản diện kinh dị ám ảnh tuổi thơ bao thế hệ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bà hoàng hậu độc ác và người vú nuôi cầm kim châm tra tấn dã man Tử Vy trong Hoàn Châu Cách Cách là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/330px-Zhao_Wei.jpg' WHERE lower(trim(prompt)) = lower('Bà hoàng hậu độc ác và người vú nuôi cầm kim châm tra tấn dã man Tử Vy trong Hoàn Châu Cách Cách là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 429, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong tiểu thuyết kiếm hiệp Kim Dung, ai là đệ nhất bang chủ Cái Bang sở hữu tuyệt kỹ Hàng Long Thập Bát Chưởng trong ''Thiên Long Bát Bộ''?', '["Tiêu Phong (Kiều Phong)","Đoàn Dự","Hư Trúc","Mộ Dung Phục"]'::jsonb, 0, 'Tiêu Phong là đại anh hùng trượng nghĩa đất trời, có số phận bi tráng nhất trong các tác phẩm kiếm hiệp võ hiệp phương Đông.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tiểu thuyết kiếm hiệp Kim Dung, ai là đệ nhất bang chủ Cái Bang sở hữu tuyệt kỹ Hàng Long Thập Bát Chưởng trong ''Thiên Long Bát Bộ''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong tiểu thuyết kiếm hiệp Kim Dung, ai là đệ nhất bang chủ Cái Bang sở hữu tuyệt kỹ Hàng Long Thập Bát Chưởng trong ''Thiên Long Bát Bộ''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  43, 430, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Vương tử nước Đại Lý si tình Vương Ngữ Yên, sở hữu Lục Mạch Thần Kiếm và Lăng Ba Vi Bộ trong Thiên Long Bát Bộ là ai?', '["Cưu Ma Trí","Hư Trúc","Tiêu Phong","Đoàn Dự"]'::jsonb, 3, 'Đoàn Dự ghét bạo lực nhưng nhờ cơ duyên may mắn nuốt phải Mãng Cổ Chu Cáp và luyện thành hai tuyệt kỹ vô song.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vương tử nước Đại Lý si tình Vương Ngữ Yên, sở hữu Lục Mạch Thần Kiếm và Lăng Ba Vi Bộ trong Thiên Long Bát Bộ là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Vương tử nước Đại Lý si tình Vương Ngữ Yên, sở hữu Lục Mạch Thần Kiếm và Lăng Ba Vi Bộ trong Thiên Long Bát Bộ là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 431, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Thần Điêu Đại Hiệp'', Tiểu Long Nữ sống tại Cổ Mộ phái đã truyền dạy võ công và kết duyên cùng đệ tử nào?', '["Doãn Chí Bình","Quách Tĩnh","Dương Quá (Thần Điêu Đại Hiệp)","Trương Vô Kỵ"]'::jsonb, 2, 'Dương Quá cụt một tay cùng thanh Huyền Thiết Trọng Kiếm và thần điêu đã viết nên thiên tình sử cảm động 16 năm chờ đợi Tiểu Long Nữ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thần Điêu Đại Hiệp'', Tiểu Long Nữ sống tại Cổ Mộ phái đã truyền dạy võ công và kết duyên cùng đệ tử nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Thần Điêu Đại Hiệp'', Tiểu Long Nữ sống tại Cổ Mộ phái đã truyền dạy võ công và kết duyên cùng đệ tử nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 432, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Nữ diễn viên nào được mệnh danh là ''Thần tiên tỷ tỷ'' với vẻ đẹp thoát tục khi đóng Tiểu Long Nữ và Vương Ngữ Yên?', '["Lý Nhược Đồng","Lưu Diệc Phi","Dương Mịch","Lưu Thi Thi"]'::jsonb, 1, 'Lưu Diệc Phi với nhan sắc thanh thuần sương khói trong Thần Điêu Hiệp Lữ 2006 được cố nhà văn Kim Dung đích thân khen ngợi.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào được mệnh danh là ''Thần tiên tỷ tỷ'' với vẻ đẹp thoát tục khi đóng Tiểu Long Nữ và Vương Ngữ Yên?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg' WHERE lower(trim(prompt)) = lower('Nữ diễn viên nào được mệnh danh là ''Thần tiên tỷ tỷ'' với vẻ đẹp thoát tục khi đóng Tiểu Long Nữ và Vương Ngữ Yên?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 433, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Anh Hùng Xạ Điêu'', chàng trai khù khờ nhưng đôn hậu, kiên trì luyện thành Hàng Long Thập Bát Chưởng là ai?', '["Quách Tĩnh","Dương Khang","Âu Dương Khắc","Hoàng Dược Sư"]'::jsonb, 0, 'Quách Tĩnh nhờ tính tình cương trực, trung hậu đã được Bắc Cái Hồng Thất Công truyền trao trọn bộ 18 chưởng Hàng Long.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Anh Hùng Xạ Điêu'', chàng trai khù khờ nhưng đôn hậu, kiên trì luyện thành Hàng Long Thập Bát Chưởng là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Anh Hùng Xạ Điêu'', chàng trai khù khờ nhưng đôn hậu, kiên trì luyện thành Hàng Long Thập Bát Chưởng là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 434, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Cô gái thông minh tuyệt đỉnh, con gái của Đảo chủ Đảo Đào Hoa Hoàng Dược Sư là ai?', '["Tiểu Long Nữ","Mục Niệm Từ","Hoa Tranh","Hoàng Dung"]'::jsonb, 3, 'Hoàng Dung túc trí đa mưu, nấu ăn tuyệt đỉnh đã dùng tài nghệ ẩm thực quyến rũ Hồng Thất Công dạy võ cho Quách Tĩnh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cô gái thông minh tuyệt đỉnh, con gái của Đảo chủ Đảo Đào Hoa Hoàng Dược Sư là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg' WHERE lower(trim(prompt)) = lower('Cô gái thông minh tuyệt đỉnh, con gái của Đảo chủ Đảo Đào Hoa Hoàng Dược Sư là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 435, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Ỷ Thiên Đồ Long Ký'', hai thần binh vũ khí chém sắt như chém bùn ẩn giấu bí kíp võ công tối thượng là gì?', '["Huyền Thiết Kiếm và Quân Tử Kiếm","Gậy Như Ý và Đinh Ba","Ỷ Thiên Kiếm và Đồ Long Đao","Kim Xà Kiếm và Độc Long Tiên"]'::jsonb, 2, 'Lời đồn giang hồ: ''Võ lâm chí tôn, bảo đao Đồ Long, hiệu lệnh thiên hạ, mạc cảm bất tòng. Kỷ vị Ỷ Thiên, thùy dữ tranh phong?''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Ỷ Thiên Đồ Long Ký'', hai thần binh vũ khí chém sắt như chém bùn ẩn giấu bí kíp võ công tối thượng là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Trong ''Ỷ Thiên Đồ Long Ký'', hai thần binh vũ khí chém sắt như chém bùn ẩn giấu bí kíp võ công tối thượng là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 436, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Giáo chủ đời thứ 34 của Minh Giáo, nắm giữ Cửu Dương Thần Công và Càn Khôn Đại Na Di là ai?', '["Dương Tiêu","Trương Vô Kỵ","Tạ Tốn (Kim Mao Sư Vương)","Ân Thiên Chính"]'::jsonb, 1, 'Trương Vô Kỵ (con trai Trương Thúy Sơn và Ân Tố Tố) hóa giải ân oán giữa lục đại môn phái và Minh Giáo trên đỉnh Quang Minh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Giáo chủ đời thứ 34 của Minh Giáo, nắm giữ Cửu Dương Thần Công và Càn Khôn Đại Na Di là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Giáo chủ đời thứ 34 của Minh Giáo, nắm giữ Cửu Dương Thần Công và Càn Khôn Đại Na Di là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 437, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Quận chúa Mông Cổ sắc sảo, thông minh, sẵn sàng từ bỏ gia tộc để đi theo tình yêu với Trương Vô Kỵ là ai?', '["Triệu Mẫn (Min Min Temür)","Chu Chỉ Nhược","Tiểu Chiêu","Ân Ly (Thù Nhi)"]'::jsonb, 0, 'Triệu Mẫn xinh đẹp, cơ mưu khiến Trương Vô Kỵ phải hứa thực hiện 3 điều kiện, cuối cùng sống hạnh phúc bên chàng vẽ lông mày.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Quận chúa Mông Cổ sắc sảo, thông minh, sẵn sàng từ bỏ gia tộc để đi theo tình yêu với Trương Vô Kỵ là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Quận chúa Mông Cổ sắc sảo, thông minh, sẵn sàng từ bỏ gia tộc để đi theo tình yêu với Trương Vô Kỵ là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 438, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tiếu Ngạo Giang Hồ'', chàng đệ tử phái Hoa Sơn yêu rượu, phóng khoáng học được Độc Cô Cửu Kiếm là ai?', '["Điền Bá Quang","Lâm Bình Chi","Nhạc Bất Quần","Lệnh Hồ Xung"]'::jsonb, 3, 'Lệnh Hồ Xung bị phạt trên đỉnh Tư Quá Nhai đã được tiền bối Phong Thanh Dương truyền thụ Độc Cô Cửu Kiếm vô chiêu thắng hữu chiêu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tiếu Ngạo Giang Hồ'', chàng đệ tử phái Hoa Sơn yêu rượu, phóng khoáng học được Độc Cô Cửu Kiếm là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tiếu Ngạo Giang Hồ'', chàng đệ tử phái Hoa Sơn yêu rượu, phóng khoáng học được Độc Cô Cửu Kiếm là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 439, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Thánh cô Nhật Nguyệt Thần Giáo, người cùng Lệnh Hồ Xung hòa tấu khúc nhạc tuyệt đỉnh ''Tiếu Ngạo Giang Hồ'' là ai?', '["Nghi Lâm","Nhạc Linh San","Nhậm Doanh Doanh","Lam Phượng Hoàng"]'::jsonb, 2, 'Bà hoàng tiếng đàn cầm Nhậm Doanh Doanh (con gái giáo chủ Nhậm Ngã Hành) đã cùng chàng tiêu Lệnh Hồ Xung ẩn tích giang hồ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thánh cô Nhật Nguyệt Thần Giáo, người cùng Lệnh Hồ Xung hòa tấu khúc nhạc tuyệt đỉnh ''Tiếu Ngạo Giang Hồ'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Thánh cô Nhật Nguyệt Thần Giáo, người cùng Lệnh Hồ Xung hòa tấu khúc nhạc tuyệt đỉnh ''Tiếu Ngạo Giang Hồ'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  44, 440, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Giáo chủ Nhật Nguyệt Thần Giáo luyện ''Quỳ Hoa Bảo Điển'' dùng kim thêu làm vũ khí xưng bá võ lâm là ai?', '["Tả Lãnh Thiền","Đông Phương Bất Bại","Nhậm Ngã Hành","Hồng An Thông"]'::jsonb, 1, 'Đông Phương Bất Bại ngụ tại Hắc Mộc Nhai là nhân vật nửa chính nửa tà có võ công cao đệ nhất trong Tiếu Ngạo Giang Hồ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Giáo chủ Nhật Nguyệt Thần Giáo luyện ''Quỳ Hoa Bảo Điển'' dùng kim thêu làm vũ khí xưng bá võ lâm là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Giáo chủ Nhật Nguyệt Thần Giáo luyện ''Quỳ Hoa Bảo Điển'' dùng kim thêu làm vũ khí xưng bá võ lâm là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 441, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong phim truyền hình kinh điển ''Bao Thanh Thiên 1993'', phủ Khai Phong có ba chiếc máy chém (khẩu đao) uy nghiêm là gì?', '["Long Đầu Trảm, Hổ Đầu Trảm, Cẩu Đầu Trảm","Kim Trảm, Ngân Trảm, Thiết Trảm","Thiên Trảm, Địa Trảm, Nhân Trảm","Hoàng Trảm, Vương Trảm, Dân Trảm"]'::jsonb, 0, 'Long Đầu Trảm chém hoàng thân quốc thích, Hổ Đầu Trảm chém quan lại tham nhũng, Cẩu Đầu Trảm chém thường dân ác bá.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim truyền hình kinh điển ''Bao Thanh Thiên 1993'', phủ Khai Phong có ba chiếc máy chém (khẩu đao) uy nghiêm là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg' WHERE lower(trim(prompt)) = lower('Trong phim truyền hình kinh điển ''Bao Thanh Thiên 1993'', phủ Khai Phong có ba chiếc máy chém (khẩu đao) uy nghiêm là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 442, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Người thị vệ ''Ngự tiền tứ phẩm đới đao thị vệ'' võ công cao cường, mang biệt danh ''Ngự Miêu'' phò tá Bao Chửng là ai?', '["Mã Hán","Công Tôn Sách","Vương Triều","Triển Chiêu"]'::jsonb, 3, 'Triển Chiêu (do Tiêu Ân Tuấn hoặc Hà Gia Kính thủ vai) với thanh Cổ Đĩnh Kiếm và áo choàng đỏ là hình tượng kiếm khách hoàn mỹ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người thị vệ ''Ngự tiền tứ phẩm đới đao thị vệ'' võ công cao cường, mang biệt danh ''Ngự Miêu'' phò tá Bao Chửng là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg' WHERE lower(trim(prompt)) = lower('Người thị vệ ''Ngự tiền tứ phẩm đới đao thị vệ'' võ công cao cường, mang biệt danh ''Ngự Miêu'' phò tá Bao Chửng là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 443, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Đặc điểm nhận dạng nổi bật nhất trên gương mặt của vị quan thanh liêm Bao Chửng (Bao Công) là gì?', '["Có vết sẹo dài ở cằm","Đeo mặt nạ sắt","Mặt đen như than và có vết bớt hình trăng lưỡi liềm trên trán","Có đôi mắt hai màu"]'::jsonb, 2, 'Gương mặt đen thiết diện vô tư và vầng trăng khuyết trên trán giúp Bao Công soi tỏ oan khuất dương gian lẫn cõi âm.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Đặc điểm nhận dạng nổi bật nhất trên gương mặt của vị quan thanh liêm Bao Chửng (Bao Công) là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/330px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg' WHERE lower(trim(prompt)) = lower('Đặc điểm nhận dạng nổi bật nhất trên gương mặt của vị quan thanh liêm Bao Chửng (Bao Công) là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 444, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong thần thoại ''Phong Thần Diễn Nghĩa'', cậu bé Na Tra sinh ra từ một bọc thịt tròn có hai bảo bối trấn phái dưới chân và quanh mình là gì?', '["Càn Khôn Xích và Đao Hỏa Long","Phong Hỏa Luân và Hỗn Thiên Lăng","Gậy Như Ý và Kim Cô","Kính Bát Quái và Kiếm Đào Gỗ"]'::jsonb, 1, 'Na Tra giẫm trên hai bánh xe lửa Phong Hỏa Luân bay lượn và quấn dải lụa đỏ Hỗn Thiên Lăng cùng vòng Càn Khôn.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong thần thoại ''Phong Thần Diễn Nghĩa'', cậu bé Na Tra sinh ra từ một bọc thịt tròn có hai bảo bối trấn phái dưới chân và quanh mình là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Trong thần thoại ''Phong Thần Diễn Nghĩa'', cậu bé Na Tra sinh ra từ một bọc thịt tròn có hai bảo bối trấn phái dưới chân và quanh mình là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 445, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Bộ phim hoạt hình 3D phá kỷ lục doanh thu lịch sử điện ảnh Trung Quốc năm 2019 với câu thoại ''Mệnh ta do ta định, không do trời định'' kể về ai?', '["Na Tra: Ma Đồng Giáng Thế (Ne Zha)","Khương Tử Nha","Đại Thánh Trở Lại","Bạch Xà: Duyên Khởi"]'::jsonb, 0, 'Na Tra 2019 của đạo diễn Sủi Cảo đã trở thành hiện tượng toàn cầu với hình tượng Na Tra quậy phá nhưng quả cảm chống lại số phận ma hoàn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg/330px-Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình 3D phá kỷ lục doanh thu lịch sử điện ảnh Trung Quốc năm 2019 với câu thoại ''Mệnh ta do ta định, không do trời định'' kể về ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg/330px-Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình 3D phá kỷ lục doanh thu lịch sử điện ảnh Trung Quốc năm 2019 với câu thoại ''Mệnh ta do ta định, không do trời định'' kể về ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 446, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tam Quốc Diễn Nghĩa'', ba vị anh hùng Lưu Bị, Quan Vũ và Trương Phi đã kết nghĩa huynh đệ tại địa điểm nào?', '["Thành Tương Dương","Bến Xích Bích","Đỉnh Hoa Sơn","Vườn đào (Kết nghĩa vườn đào)"]'::jsonb, 3, 'Lời thề kết nghĩa vườn đào: ''Tuy không sinh cùng ngày cùng tháng cùng năm, nhưng nguyện chết cùng năm cùng tháng cùng ngày''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', ba vị anh hùng Lưu Bị, Quan Vũ và Trương Phi đã kết nghĩa huynh đệ tại địa điểm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', ba vị anh hùng Lưu Bị, Quan Vũ và Trương Phi đã kết nghĩa huynh đệ tại địa điểm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 447, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Chiến thần dũng mãnh đệ nhất Tam Quốc cưỡi ngựa Xích Thố, sử dụng Phương Thiên Họa Kích là ai?', '["Triệu Vân","Quan Vũ","Lữ Bố (Lã Bố)","Trương Phi"]'::jsonb, 2, '''Nhân trung Lữ Bố, mã trung Xích Thố'' (Người có Lữ Bố, ngựa có Xích Thố) ca ngợi dũng lực vô địch của vị tướng này.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiến thần dũng mãnh đệ nhất Tam Quốc cưỡi ngựa Xích Thố, sử dụng Phương Thiên Họa Kích là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Chiến thần dũng mãnh đệ nhất Tam Quốc cưỡi ngựa Xích Thố, sử dụng Phương Thiên Họa Kích là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 448, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Vị quân sư đại tài ngọa long của Thục Hán mượn gió đông trong trận đại chiến Xích Bích là ai?', '["Bàng Thống","Gia Cát Lượng (Khổng Minh)","Chu Du","Tư Mã Ý"]'::jsonb, 1, 'Gia Cát Khổng Minh ngồi lập đàn thất tinh cầu gió đông nam, thiêu rụi toàn bộ chiến thuyền liên hoàn của Tào Tháo.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị quân sư đại tài ngọa long của Thục Hán mượn gió đông trong trận đại chiến Xích Bích là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg' WHERE lower(trim(prompt)) = lower('Vị quân sư đại tài ngọa long của Thục Hán mượn gió đông trong trận đại chiến Xích Bích là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 449, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Thủy Hử'', 108 vị anh hùng hảo hán đã tụ nghĩa tại căn cứ sơn trại nào?', '["Lương Sơn Bạc","Thiếu Lâm Tự","Đào Hoa Đảo","Quang Minh Đỉnh"]'::jsonb, 0, 'Lương Sơn Bạc (tỉnh Sơn Đông) được đầm nước bao quanh hiểm trở là nơi tụ họp của 108 vị anh hùng thời Bắc Tống.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', 108 vị anh hùng hảo hán đã tụ nghĩa tại căn cứ sơn trại nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', 108 vị anh hùng hảo hán đã tụ nghĩa tại căn cứ sơn trại nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  45, 450, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Vị anh hùng Lương Sơn Bạc sau khi uống 18 bát rượu đã tay không đánh chết hổ dữ tại đồi Cảnh Dương là ai?', '["Lý Quỳ (Hắc Toàn Phong)","Lỗ Trí Thâm","Lâm Xung","Võ Tòng (Võ Nhị Lang)"]'::jsonb, 3, 'Điển tích ''Võ Tòng đả hổ'' trên đồi Cảnh Dương là một trong những hồi truyện ly kỳ và nổi tiếng nhất của Thủy Hử.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị anh hùng Lương Sơn Bạc sau khi uống 18 bát rượu đã tay không đánh chết hổ dữ tại đồi Cảnh Dương là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Vị anh hùng Lương Sơn Bạc sau khi uống 18 bát rượu đã tay không đánh chết hổ dữ tại đồi Cảnh Dương là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 451, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong phim kiếm hiệp ''Lộc Đỉnh Ký'', nhân vật giảo hoạt, không biết võ công nhưng có 7 bà vợ xinh đẹp là ai?', '["Khang Hy","Trần Cận Nam","Vi Tiểu Bảo","Ngô Tam Quế"]'::jsonb, 2, 'Vi Tiểu Bảo xuất thân từ chốn kỹ viện Dương Châu, lanh lợi mưu mẹo, trở thành bạn thân của Hoàng đế Khang Hy.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim kiếm hiệp ''Lộc Đỉnh Ký'', nhân vật giảo hoạt, không biết võ công nhưng có 7 bà vợ xinh đẹp là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong phim kiếm hiệp ''Lộc Đỉnh Ký'', nhân vật giảo hoạt, không biết võ công nhưng có 7 bà vợ xinh đẹp là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 452, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Bộ phim hoạt hình cổ phong ''Hồng Hài Nhi'' hay ''Bảo Liên Đăng'' kể về cậu bé Trầm Hương xẻ núi cứu ai?', '["Cứu phụ vương","Xẻ núi cứu mẹ (Tam Thánh Mẫu)","Cứu sư phụ","Cứu Tôn Ngộ Không"]'::jsonb, 1, 'Trầm Hương khổ luyện võ nghệ, vượt qua sự ngăn cản của cậu ruột Nhị Lang Thần để chẻ núi Hoa Sơn giải thoát cho mẹ hiền.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình cổ phong ''Hồng Hài Nhi'' hay ''Bảo Liên Đăng'' kể về cậu bé Trầm Hương xẻ núi cứu ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình cổ phong ''Hồng Hài Nhi'' hay ''Bảo Liên Đăng'' kể về cậu bé Trầm Hương xẻ núi cứu ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 453, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Nhân vật thần thoại ba mắt, dắt theo chó Hao Thiên Khuyển và sử dụng Tam Tiêm Lưỡng Nhẫn Đao là ai?', '["Nhị Lang Thần (Dương Tiễn)","Na Tra","Lôi Chấn Tử","Thái Ất Chân Nhân"]'::jsonb, 0, 'Dương Tiễn có con mắt thứ ba giữa trán nhìn thấu biến hóa yêu ma, là chiến thần mạnh nhất của thiên giới.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg/330px-Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhân vật thần thoại ba mắt, dắt theo chó Hao Thiên Khuyển và sử dụng Tam Tiêm Lưỡng Nhẫn Đao là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg/330px-Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg' WHERE lower(trim(prompt)) = lower('Nhân vật thần thoại ba mắt, dắt theo chó Hao Thiên Khuyển và sử dụng Tam Tiêm Lưỡng Nhẫn Đao là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 454, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong Tây Du Ký, ba người đệ tử cùng bảo vệ Đường Tăng lần lượt nhận pháp danh do Quan Âm Bồ Tát hoặc Bồ Đề Tổ Sư đặt là gì?', '["Nhất Giới, Nhị Giới, Tam Giới","Đại Thánh, Bát Giới, Sa Tăng","Hành Giả, Trư Yêu, Thủy Quái","Ngộ Không, Ngộ Năng, Ngộ Tĩnh"]'::jsonb, 3, 'Tôn Ngộ Không (hiểu về chữ Không), Trư Ngộ Năng (hiểu về Tài năng) và Sa Ngộ Tĩnh (hiểu về sự Thanh tịnh).',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Tây Du Ký, ba người đệ tử cùng bảo vệ Đường Tăng lần lượt nhận pháp danh do Quan Âm Bồ Tát hoặc Bồ Đề Tổ Sư đặt là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Trong Tây Du Ký, ba người đệ tử cùng bảo vệ Đường Tăng lần lượt nhận pháp danh do Quan Âm Bồ Tát hoặc Bồ Đề Tổ Sư đặt là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 455, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong Tây Du Ký, ai là người duy nhất 3 lần biến hóa thành thôn nữ, bà lão và ông cụ để lừa Đường Tăng?', '["Chuột Tinh","Nhện Tinh","Bạch Cốt Tinh","Bạch Diện Hồ Ly"]'::jsonb, 2, 'Điển tích ''Tôn Ngộ Không ba lần đánh Bạch Cốt Tinh'' khiến Đường Tăng hiểu lầm và niệm chú siết kim cô đuổi đồ đệ về Hoa Quả Sơn.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Tây Du Ký, ai là người duy nhất 3 lần biến hóa thành thôn nữ, bà lão và ông cụ để lừa Đường Tăng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Trong Tây Du Ký, ai là người duy nhất 3 lần biến hóa thành thôn nữ, bà lão và ông cụ để lừa Đường Tăng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 456, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Tập phim ''Đại Náo Thiên Cung'' của Tôn Ngộ Không bắt nguồn từ việc chú khỉ không được mời tham dự bữa tiệc nào?', '["Lễ mừng thọ Ngọc Hoàng","Hội Bàn Đào của Tây Vương Mẫu","Hội Vu Lan Bồn","Tiệc rượu Thượng Nguyên"]'::jsonb, 1, 'Tôn Ngộ Không nổi giận vì thấy chức Bật Mã Ô và Tề Thiên Đại Thánh bị coi khinh nên ăn trộm đào tiên, uống trộm ngự tửu và linh đơn của Thái Thượng Lão Quân.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tập phim ''Đại Náo Thiên Cung'' của Tôn Ngộ Không bắt nguồn từ việc chú khỉ không được mời tham dự bữa tiệc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Tập phim ''Đại Náo Thiên Cung'' của Tôn Ngộ Không bắt nguồn từ việc chú khỉ không được mời tham dự bữa tiệc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 457, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Nữ vương si tình muốn giữ Đường Tam Tạng ở lại làm vua trị vì vương quốc toàn phụ nữ là vương quốc nào?', '["Tây Lương Nữ Quốc","Ô Kê Quốc","Xa Trì Quốc","Tỳ Sa Môn Quốc"]'::jsonb, 0, 'Tập phim ''Thỉnh kinh Nữ Nhi Quốc'' với bài hát xúc động ''Tình Nhi Nữ'' là ải tình nạn lớn nhất thử thách lòng kiên định của Đường Tăng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ vương si tình muốn giữ Đường Tam Tạng ở lại làm vua trị vì vương quốc toàn phụ nữ là vương quốc nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/330px-Xiyou.PNG' WHERE lower(trim(prompt)) = lower('Nữ vương si tình muốn giữ Đường Tam Tạng ở lại làm vua trị vì vương quốc toàn phụ nữ là vương quốc nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 458, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Ai là tác giả của tiểu thuyết trường thiên Tây Du Ký - một trong ''Tứ đại danh tác'' của văn học cổ điển Trung Hoa?', '["Tào Tuyết Cần","La Quán Trung","Thi Nại Am","Ngô Thừa Ân"]'::jsonb, 3, 'Ngô Thừa Ân sống vào triều nhà Minh đã sáng tác nên tuyệt tác Tây Du Ký sống mãi cùng thời gian.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là tác giả của tiểu thuyết trường thiên Tây Du Ký - một trong ''Tứ đại danh tác'' của văn học cổ điển Trung Hoa?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Ai là tác giả của tiểu thuyết trường thiên Tây Du Ký - một trong ''Tứ đại danh tác'' của văn học cổ điển Trung Hoa?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 459, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tây Du Ký 1986'', kiếp nạn thứ 81 của thầy trò Đường Tăng xảy ra khi đang vượt qua con sông nào?', '["Sông Tử Mẫu Hà","Sông Lưu Sa Hà","Sông Thông Thiên Hà (do Lão Rùa trắng chở)","Hỏa Diệm Sơn"]'::jsonb, 2, 'Vì quên hỏi Phật Tổ giúp Lão Rùa trắng trên sông Thông Thiên Hà nên bốn thầy trò bị hất xuống nước, đủ 81 kiếp nạn.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tây Du Ký 1986'', kiếp nạn thứ 81 của thầy trò Đường Tăng xảy ra khi đang vượt qua con sông nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tây Du Ký 1986'', kiếp nạn thứ 81 của thầy trò Đường Tăng xảy ra khi đang vượt qua con sông nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  46, 460, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tây Du Ký'', yêu quái Hồng Hài Nhi là con trai của Ngưu Ma Vương và Thiết Phiến Công Chúa sử dụng thứ lửa lợi hại nào?', '["Lửa lò bát quái","Tam Muội Chân Hỏa","Lửa Địa Ngục","Lửa Phượng Hoàng"]'::jsonb, 1, 'Tam Muội Chân Hỏa của Hồng Hài Nhi không thể dập tắt bằng nước mưa thông thường, khiến cả Tôn Ngộ Không cũng suýt nguy khốn.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tây Du Ký'', yêu quái Hồng Hài Nhi là con trai của Ngưu Ma Vương và Thiết Phiến Công Chúa sử dụng thứ lửa lợi hại nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tây Du Ký'', yêu quái Hồng Hài Nhi là con trai của Ngưu Ma Vương và Thiết Phiến Công Chúa sử dụng thứ lửa lợi hại nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 461, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Ai là vị Bồ Tát đã thu phục Hồng Hài Nhi làm Thiện Tài Đồng Tử trong ''Tây Du Ký''?', '["Quan Thế Âm Bồ Tát","Văn Thù Bồ Tát","Phổ Hiền Bồ Tát","Thái Thượng Lão Quân"]'::jsonb, 0, 'Quan Thế Âm Bồ Tát đã dùng vòng kim cô và đài sen hóa giải sự hung hăng của Hồng Hài Nhi, thu nhận làm Thiện Tài Đồng Tử.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là vị Bồ Tát đã thu phục Hồng Hài Nhi làm Thiện Tài Đồng Tử trong ''Tây Du Ký''?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg' WHERE lower(trim(prompt)) = lower('Ai là vị Bồ Tát đã thu phục Hồng Hài Nhi làm Thiện Tài Đồng Tử trong ''Tây Du Ký''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 462, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tam Quốc Diễn Nghĩa'', trận đại chiến thủy quân nổi tiếng năm 208 mà liên quân Tôn - Lưu dùng hỏa công đánh bại Tào Tháo là trận nào?', '["Trận Hợp Phì","Trận Quan Độ","Trận Di Lăng","Trận Xích Bích"]'::jsonb, 3, 'Trận Xích Bích (Red Cliffs) là trận đánh kinh điển định hình thế chân vạc Tam Quốc (Ngụy - Thục - Ngô).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', trận đại chiến thủy quân nổi tiếng năm 208 mà liên quân Tôn - Lưu dùng hỏa công đánh bại Tào Tháo là trận nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', trận đại chiến thủy quân nổi tiếng năm 208 mà liên quân Tôn - Lưu dùng hỏa công đánh bại Tào Tháo là trận nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 463, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Tam Quốc Diễn Nghĩa'', Lưu Bị đã phải mấy lần đích thân đến lều cỏ (''Tam cố thảo lư'') để mời Gia Cát Lượng xuống núi?', '["5 lần","2 lần","3 lần","7 lần"]'::jsonb, 2, 'Điển tích ''Tam cố thảo lư'' nói về việc Lưu Bị 3 lần thành tâm đến lều tranh ở Long Trung mời Gia Cát Khổng Minh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', Lưu Bị đã phải mấy lần đích thân đến lều cỏ (''Tam cố thảo lư'') để mời Gia Cát Lượng xuống núi?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/330px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Tam Quốc Diễn Nghĩa'', Lưu Bị đã phải mấy lần đích thân đến lều cỏ (''Tam cố thảo lư'') để mời Gia Cát Lượng xuống núi?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 464, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Thủy Hử'', nhân vật Lâm Xung có biệt hiệu trên Lương Sơn Bạc là gì?', '["Hành Giả","Báo Tử Đầu (Đầu Báo)","Hoa Hòa Thượng","Cửu Văn Long"]'::jsonb, 1, 'Giáo đầu 80 vạn cấm quân Lâm Xung có ngoại hiệu là Báo Tử Đầu (Đầu Báo).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', nhân vật Lâm Xung có biệt hiệu trên Lương Sơn Bạc là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', nhân vật Lâm Xung có biệt hiệu trên Lương Sơn Bạc là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 465, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Thủy Hử'', vị hảo hán nào tay không nhổ bật gốc cây dương liễu và sử dụng禅 trượng nặng 62 cân?', '["Hoa Hòa Thượng Lỗ Trí Thâm","Võ Tòng","Tống Giang","Lý Quỳ"]'::jsonb, 0, 'Lỗ Trí Thâm (Hoa Hòa Thượng) nổi tiếng với sức mạnh phi thường, tay không nhổ gốc cây dương liễu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', vị hảo hán nào tay không nhổ bật gốc cây dương liễu và sử dụng禅 trượng nặng 62 cân?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/330px-Guanyu-1.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Thủy Hử'', vị hảo hán nào tay không nhổ bật gốc cây dương liễu và sử dụng禅 trượng nặng 62 cân?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 466, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong tiểu thuyết ''Anh hùng xạ điêu'' của Kim Dung, năm cao thủ võ lâm đứng đầu (''Thiên hạ ngũ tuyệt'') tranh tài tại ngọn núi nào?', '["Núi Thiếu Thất","Núi Võ Đang","Núi Nga Mi","Núi Hoa Sơn (Hoa Sơn Luận Kiếm)"]'::jsonb, 3, 'Hoa Sơn Luận Kiếm là cuộc tỷ thí huyền thoại giữa Đông Tà, Tây Độc, Nam Đế, Bắc Cái và Trung Thần Thông.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong tiểu thuyết ''Anh hùng xạ điêu'' của Kim Dung, năm cao thủ võ lâm đứng đầu (''Thiên hạ ngũ tuyệt'') tranh tài tại ngọn núi nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong tiểu thuyết ''Anh hùng xạ điêu'' của Kim Dung, năm cao thủ võ lâm đứng đầu (''Thiên hạ ngũ tuyệt'') tranh tài tại ngọn núi nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 467, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Trong ''Anh hùng xạ điêu'', biệt danh ''Đông Tà'' là của đảo chủ đảo Đào Hoa nào?', '["Hồng Thất Công","Âu Dương Phong","Hoàng Dược Sư (cha của Hoàng Dung)","Vương Trùng Dương"]'::jsonb, 2, 'Đông Tà Hoàng Dược Sư là chủ nhân đảo Đào Hoa và là cha của nữ chính Hoàng Dung.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Anh hùng xạ điêu'', biệt danh ''Đông Tà'' là của đảo chủ đảo Đào Hoa nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Anh hùng xạ điêu'', biệt danh ''Đông Tà'' là của đảo chủ đảo Đào Hoa nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 468, 'Phim & hoạt hình tuổi thơ Trung Quốc', 'Bang chủ Cái Bang nổi tiếng với tuyệt kỹ ''Giáng Long Thập Bát Chưởng'' và biệt hiệu ''Bắc Cái'' trong ''Anh hùng xạ điêu'' là ai?', '["Chu Bá Thông","Hồng Thất Công","Quách Tĩnh","Dương Quá"]'::jsonb, 1, 'Bắc Cái Hồng Thất Công là bang chủ Cái Bang, người đã truyền dạy Giáng Long Thập Bát Chưởng cho Quách Tĩnh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bang chủ Cái Bang nổi tiếng với tuyệt kỹ ''Giáng Long Thập Bát Chưởng'' và biệt hiệu ''Bắc Cái'' trong ''Anh hùng xạ điêu'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/330px-Jin_Yong%2C_July_2007.jpg' WHERE lower(trim(prompt)) = lower('Bang chủ Cái Bang nổi tiếng với tuyệt kỹ ''Giáng Long Thập Bát Chưởng'' và biệt hiệu ''Bắc Cái'' trong ''Anh hùng xạ điêu'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 469, 'Hoạt hình tuổi thơ Mỹ', 'Trong loạt phim hoạt hình kinh điển ''Tom and Jerry'', Tom là mèo và Jerry là con vật gì?', '["Một chú thỏ con","Một chú hamster","Một chú sóc chuột","Một chú chuột nhắt nâu thông minh"]'::jsonb, 3, 'Tom và Jerry của William Hanna và Joseph Barbera đã đoạt tới 7 giải Oscar cho Phim hoạt hình ngắn xuất sắc nhất.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong loạt phim hoạt hình kinh điển ''Tom and Jerry'', Tom là mèo và Jerry là con vật gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong loạt phim hoạt hình kinh điển ''Tom and Jerry'', Tom là mèo và Jerry là con vật gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  47, 470, 'Hoạt hình tuổi thơ Mỹ', 'Chú chó Bull cơ bắp màu xám hay bênh vực Jerry và cho Tom no đòn tên là gì?', '["Butch","Tyke","Spike","Droopy"]'::jsonb, 2, 'Chó Spike (và cậu con trai nhỏ Tyke) luôn khiến Tom phải khiếp sợ mỗi khi làm phiền giấc ngủ của hai bố con.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú chó Bull cơ bắp màu xám hay bênh vực Jerry và cho Tom no đòn tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Chú chó Bull cơ bắp màu xám hay bênh vực Jerry và cho Tom no đòn tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 471, 'Hoạt hình tuổi thơ Mỹ', 'Nhân vật hoạt hình mang tính biểu tượng toàn cầu của hãng Walt Disney, ra mắt năm 1928 trong phim ''Tàu hơi nước Willie'' là ai?', '["Vịt Donald","Mickey Mouse (Chuột Mickey)","Chó Goofy","Chó Pluto"]'::jsonb, 1, 'Chuột Mickey với đôi găng tay trắng, quần đỏ hai nút vàng là biểu tượng khai sinh ra toàn bộ đế chế giải trí Disney.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhân vật hoạt hình mang tính biểu tượng toàn cầu của hãng Walt Disney, ra mắt năm 1928 trong phim ''Tàu hơi nước Willie'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Nhân vật hoạt hình mang tính biểu tượng toàn cầu của hãng Walt Disney, ra mắt năm 1928 trong phim ''Tàu hơi nước Willie'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 472, 'Hoạt hình tuổi thơ Mỹ', 'Chú vịt mặc áo thủy thủ màu xanh, tính tình nóng nảy và giọng nói ngọng nghịu đặc trưng của Disney là ai?', '["Donald Duck (Vịt Donald)","Scrooge McDuck (Bác Đô-nan)","Daffy Duck","Huey Duck"]'::jsonb, 0, 'Donald Duck nổi tiếng với những cơn tam bành hài hước và tình yêu say đắm với cô vịt Daisy Duck.',
  'https://upload.wikimedia.org/wikipedia/en/a/a5/Donald_Duck_angry_transparent_background.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú vịt mặc áo thủy thủ màu xanh, tính tình nóng nảy và giọng nói ngọng nghịu đặc trưng của Disney là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/a/a5/Donald_Duck_angry_transparent_background.png' WHERE lower(trim(prompt)) = lower('Chú vịt mặc áo thủy thủ màu xanh, tính tình nóng nảy và giọng nói ngọng nghịu đặc trưng của Disney là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 473, 'Hoạt hình tuổi thơ Mỹ', 'Chú bọt biển màu vàng lạc quan sống trong quả dứa dưới đáy biển Bikini Bottom tên là gì?', '["Mr. Krabs","Patrick Star","Squidward Tentacles","SpongeBob SquarePants"]'::jsonb, 3, 'SpongeBob SquarePants làm đầu bếp nướng bánh burger Krabby Patty tại nhà hàng Krusty Krab.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú bọt biển màu vàng lạc quan sống trong quả dứa dưới đáy biển Bikini Bottom tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png' WHERE lower(trim(prompt)) = lower('Chú bọt biển màu vàng lạc quan sống trong quả dứa dưới đáy biển Bikini Bottom tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 474, 'Hoạt hình tuổi thơ Mỹ', 'Bạn thân nhất của SpongeBob là chú sao biển màu hồng ngây thơ và có phần ngốc nghếch tên là gì?', '["Sandy Cheeks","Plankton","Patrick Star","Gary"]'::jsonb, 2, 'Patrick Star sống dưới một tảng đá tròn lớn, luôn cùng SpongeBob đi bắt sứa ở đồng cỏ sứa.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bạn thân nhất của SpongeBob là chú sao biển màu hồng ngây thơ và có phần ngốc nghếch tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png' WHERE lower(trim(prompt)) = lower('Bạn thân nhất của SpongeBob là chú sao biển màu hồng ngây thơ và có phần ngốc nghếch tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 475, 'Hoạt hình tuổi thơ Mỹ', 'Con ốc sên cưng của SpongeBob phát ra tiếng kêu ''Meo meo'' như loài mèo có tên là gì?', '["Larry","Gary","Jerry","Perry"]'::jsonb, 1, 'Gary the Snail là thú cưng thông minh biết kêu meo meo của SpongeBob.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Con ốc sên cưng của SpongeBob phát ra tiếng kêu ''Meo meo'' như loài mèo có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/330px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png' WHERE lower(trim(prompt)) = lower('Con ốc sên cưng của SpongeBob phát ra tiếng kêu ''Meo meo'' như loài mèo có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 476, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Ben 10'', thiết bị thần bí giống đồng hồ đeo tay giúp Ben Tennyson biến hình thành 10 người ngoài hành tinh khác nhau có tên là gì?', '["Omnitrix","Ultimatrix","Nemetrix","Biomnitrix"]'::jsonb, 0, 'Đồng hồ Omnitrix do Azmuth chế tạo rơi từ vũ trụ xuống Trái Đất và bám chặt vào cổ tay của cậu bé 10 tuổi Ben Tennyson.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Ben 10'', thiết bị thần bí giống đồng hồ đeo tay giúp Ben Tennyson biến hình thành 10 người ngoài hành tinh khác nhau có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png' WHERE lower(trim(prompt)) = lower('Trong ''Ben 10'', thiết bị thần bí giống đồng hồ đeo tay giúp Ben Tennyson biến hình thành 10 người ngoài hành tinh khác nhau có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 477, 'Hoạt hình tuổi thơ Mỹ', 'Chiến binh ngoài hành tinh 4 tay màu đỏ với sức mạnh cơ bắp phi thường trong Ben 10 tên là gì?', '["XLR8","Heatblast","Diamondhead","Four Arms (Bốn Tay)"]'::jsonb, 3, 'Four Arms (chủng tộc Tetramand từ hành tinh Khoros) là hình dạng cơ bắp được Ben sử dụng nhiều nhất.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiến binh ngoài hành tinh 4 tay màu đỏ với sức mạnh cơ bắp phi thường trong Ben 10 tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png' WHERE lower(trim(prompt)) = lower('Chiến binh ngoài hành tinh 4 tay màu đỏ với sức mạnh cơ bắp phi thường trong Ben 10 tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 478, 'Hoạt hình tuổi thơ Mỹ', 'Người ngoài hành tinh có hình dáng ngọn đuốc dung nham rực lửa biết phun lửa của Ben 10 là ai?', '["Ghostfreak","Wildmutt","Heatblast","Ripjaws"]'::jsonb, 2, 'Heatblast (chủng tộc Pyronite) là người ngoài hành tinh đầu tiên mà Ben biến thành khi nhặt được Omnitrix.',
  'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người ngoài hành tinh có hình dáng ngọn đuốc dung nham rực lửa biết phun lửa của Ben 10 là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png' WHERE lower(trim(prompt)) = lower('Người ngoài hành tinh có hình dáng ngọn đuốc dung nham rực lửa biết phun lửa của Ben 10 là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 479, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Phineas and Ferb'', hai anh em thiên tài đã dành trọn 104 ngày nghỉ hè để làm gì?', '["Đi thám hiểm rừng rậm Amazon","Chế tạo những phát minh vĩ đại điên rồ ở sân sau","Học thêm để thi đại học","Chơi trò chơi điện tử"]'::jsonb, 1, 'Phineas Flynn và Ferb Fletcher luôn bắt đầu ngày mới với câu: ''Ferb, anh biết hôm nay chúng ta sẽ làm gì rồi!''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/Amazon_River_ESA387332.jpg/330px-Amazon_River_ESA387332.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Phineas and Ferb'', hai anh em thiên tài đã dành trọn 104 ngày nghỉ hè để làm gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/Amazon_River_ESA387332.jpg/330px-Amazon_River_ESA387332.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Phineas and Ferb'', hai anh em thiên tài đã dành trọn 104 ngày nghỉ hè để làm gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  48, 480, 'Hoạt hình tuổi thơ Mỹ', 'Thú cưng thú mỏ vịt ngô nghê của Phineas và Ferb có thân phận bí mật là điệp viên ngầm nào?', '["Thú mỏ vịt Perry (Đặc vụ P - Agent P)","Đặc vụ X","Đặc vụ Zero","Thám tử lông vũ"]'::jsonb, 0, 'Perry the Platypus đội chiếc mũ phớt nâu, làm việc cho tổ chức O.W.C.A dưới sự chỉ huy của Thiếu tướng Monogram.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thú cưng thú mỏ vịt ngô nghê của Phineas và Ferb có thân phận bí mật là điệp viên ngầm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Thú cưng thú mỏ vịt ngô nghê của Phineas và Ferb có thân phận bí mật là điệp viên ngầm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 481, 'Hoạt hình tuổi thơ Mỹ', 'Nhà bác học phản diện dở hơi nhưng giàu tình cảm luôn bị Đặc vụ P ngăn chặn phát minh là ai?', '["Giáo sư Frink","Tiến sĩ Drakken","Bác sĩ X","Tiến sĩ Heinz Doofenshmirtz"]'::jsonb, 3, 'Tiến sĩ Doofenshmirtz thuộc công ty Doofenshmirtz Evil Incorporated luôn gắn đuôi ''-inator'' vào các cỗ máy của mình.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/6/6e/Phineas_and_Ferb_logo.svg/330px-Phineas_and_Ferb_logo.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhà bác học phản diện dở hơi nhưng giàu tình cảm luôn bị Đặc vụ P ngăn chặn phát minh là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/6/6e/Phineas_and_Ferb_logo.svg/330px-Phineas_and_Ferb_logo.svg.png' WHERE lower(trim(prompt)) = lower('Nhà bác học phản diện dở hơi nhưng giàu tình cảm luôn bị Đặc vụ P ngăn chặn phát minh là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 482, 'Hoạt hình tuổi thơ Mỹ', 'Cô chị gái của Phineas và Ferb luôn cố gắng ''bắt quả tang'' hai đứa em trước mặt mẹ là ai?', '["Isabella Garcia-Shapiro","Vanessa Doofenshmirtz","Candace Flynn","Stacy Hirano"]'::jsonb, 2, 'Candace luôn gào thét: ''Mẹ ơi! Xem Phineas và Ferb đang làm gì kìa!'', nhưng các phát minh luôn biến mất kỳ lạ ngay khi mẹ quay lại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cô chị gái của Phineas và Ferb luôn cố gắng ''bắt quả tang'' hai đứa em trước mặt mẹ là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Cô chị gái của Phineas và Ferb luôn cố gắng ''bắt quả tang'' hai đứa em trước mặt mẹ là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 483, 'Hoạt hình tuổi thơ Mỹ', 'Ba cô gái siêu nhân nhỏ ''The Powerpuff Girls'' được Giáo sư Utonium tạo ra từ đường, gia vị, mọi thứ tốt đẹp và chất hóa học bí ẩn nào?', '["Hóa chất Z","Hóa chất X (Chemical X)","Huyết thanh siêu chiến binh","Nước thánh"]'::jsonb, 1, 'Hóa chất X do giáo sư vô tình làm đổ vào nồi thí nghiệm đã tạo ra ba nữ siêu anh hùng bảo vệ thành phố Townsville.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ba cô gái siêu nhân nhỏ ''The Powerpuff Girls'' được Giáo sư Utonium tạo ra từ đường, gia vị, mọi thứ tốt đẹp và chất hóa học bí ẩn nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Ba cô gái siêu nhân nhỏ ''The Powerpuff Girls'' được Giáo sư Utonium tạo ra từ đường, gia vị, mọi thứ tốt đẹp và chất hóa học bí ẩn nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 484, 'Hoạt hình tuổi thơ Mỹ', 'Ba cô bé Powerpuff Girls gồm những ai?', '["Blossom (Hồng), Bubbles (Xanh dương), Buttercup (Xanh lá)","Ruby, Sapphire, Emerald","Flora, Stella, Bloom","Clover, Sam, Alex"]'::jsonb, 0, 'Blossom thông minh đội nơ đỏ, Bubbles tóc vàng ngây thơ biết nói tiếng động vật, Buttercup tomboy mạnh mẽ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ba cô bé Powerpuff Girls gồm những ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Ba cô bé Powerpuff Girls gồm những ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 485, 'Hoạt hình tuổi thơ Mỹ', 'Kẻ thù không đội trời chung với bộ não khổng lồ đội mũ sọc tím của Powerpuff Girls là con khỉ nào?', '["Sedusa","Fuzzy Lumpkins","HIM","Mojo Jojo"]'::jsonb, 3, 'Mojo Jojo vốn là chú tinh tinh phụ tá của Giáo sư Utonium trước khi bị phơi nhiễm Hóa chất X và trở thành kẻ ác.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Kẻ thù không đội trời chung với bộ não khổng lồ đội mũ sọc tím của Powerpuff Girls là con khỉ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Kẻ thù không đội trời chung với bộ não khổng lồ đội mũ sọc tím của Powerpuff Girls là con khỉ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 486, 'Hoạt hình tuổi thơ Mỹ', 'Chú chó ngố khổng lồ màu nâu thuộc giống Great Dane mê ăn bánh quy Scooby Snacks chuyên đi phá án ma quái là ai?', '["Pluto","Scrappy-Doo","Scooby-Doo","Courage"]'::jsonb, 2, 'Scooby-Doo cùng nhóm thám tử ''Mystery Inc.'' đi trên chiếc xe tải The Mystery Machine vạch trần các vụ giả ma giả quỷ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/Scooby_doo_logo.png/330px-Scooby_doo_logo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú chó ngố khổng lồ màu nâu thuộc giống Great Dane mê ăn bánh quy Scooby Snacks chuyên đi phá án ma quái là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/Scooby_doo_logo.png/330px-Scooby_doo_logo.png' WHERE lower(trim(prompt)) = lower('Chú chó ngố khổng lồ màu nâu thuộc giống Great Dane mê ăn bánh quy Scooby Snacks chuyên đi phá án ma quái là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 487, 'Hoạt hình tuổi thơ Mỹ', 'Người bạn thân gầy gò, sợ ma và ham ăn số một luôn đồng hành cùng Scooby-Doo là ai?', '["Fred Jones","Shaggy Rogers","Daphne Blake","Velma Dinkley"]'::jsonb, 1, 'Shaggy mặc áo thun xanh lá, luôn đói bụng và thường cùng Scooby làm mồi nhử bất đắc dĩ cho quái vật.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/Scooby_doo_logo.png/330px-Scooby_doo_logo.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người bạn thân gầy gò, sợ ma và ham ăn số một luôn đồng hành cùng Scooby-Doo là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/Scooby_doo_logo.png/330px-Scooby_doo_logo.png' WHERE lower(trim(prompt)) = lower('Người bạn thân gầy gò, sợ ma và ham ăn số một luôn đồng hành cùng Scooby-Doo là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 488, 'Hoạt hình tuổi thơ Mỹ', 'Chú chó màu hồng nhút nhát sống ở thị trấn Hư Không (Nowhere) luôn phải liều mình cứu đôi vợ chồng già Muriel và Eustace là ai?', '["Courage the Cowardly Dog (Chú chó nhút nhát Courage)","Odie","Snoopy","Droopy"]'::jsonb, 0, 'Courage dù sợ hãi tột cùng trước người ngoài hành tinh và ma quỷ nhưng luôn dũng cảm bảo vệ bà chủ Muriel phúc hậu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú chó màu hồng nhút nhát sống ở thị trấn Hư Không (Nowhere) luôn phải liều mình cứu đôi vợ chồng già Muriel và Eustace là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Chú chó màu hồng nhút nhát sống ở thị trấn Hư Không (Nowhere) luôn phải liều mình cứu đôi vợ chồng già Muriel và Eustace là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 489, 'Hoạt hình tuổi thơ Mỹ', 'Cậu bé thiên tài sở hữu phòng thí nghiệm bí mật khổng lồ sau tủ quần áo nhưng luôn bị cô chị gái Dee Dee quậy phá là ai?', '["Timmy Turner","Jimmy Neutron","Phineas","Dexter (Dexter''s Laboratory)"]'::jsonb, 3, 'Dexter với áo choàng trắng, kính cận to và giọng nói lạ lùng luôn bực bội vì cô chị gái Dee Dee phá hỏng thí nghiệm.',
  'https://thumb.wikimedia.org/wikipedia/en/thumb/6/6e/Phineas_and_Ferb_logo.svg/330px-Phineas_and_Ferb_logo.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cậu bé thiên tài sở hữu phòng thí nghiệm bí mật khổng lồ sau tủ quần áo nhưng luôn bị cô chị gái Dee Dee quậy phá là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/en/thumb/6/6e/Phineas_and_Ferb_logo.svg/330px-Phineas_and_Ferb_logo.svg.png' WHERE lower(trim(prompt)) = lower('Cậu bé thiên tài sở hữu phòng thí nghiệm bí mật khổng lồ sau tủ quần áo nhưng luôn bị cô chị gái Dee Dee quậy phá là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  49, 490, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Nàng Tiên Cá'' (The Little Mermaid 1989), nàng công chúa người cá tóc đỏ mê thế giới con người tên là gì?', '["Jasmine","Belle","Ariel","Aurora"]'::jsonb, 2, 'Nàng tiên cá Ariel đã đổi giọng hát tuyệt trần cho phù thủy biển Ursula để đổi lấy đôi chân con người đến với hoàng tử Eric.',
  'https://upload.wikimedia.org/wikipedia/en/c/c0/The_Little_Mermaid_%28Official_1989_Film_Poster%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Nàng Tiên Cá'' (The Little Mermaid 1989), nàng công chúa người cá tóc đỏ mê thế giới con người tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c0/The_Little_Mermaid_%28Official_1989_Film_Poster%29.png' WHERE lower(trim(prompt)) = lower('Trong ''Nàng Tiên Cá'' (The Little Mermaid 1989), nàng công chúa người cá tóc đỏ mê thế giới con người tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 491, 'Hoạt hình tuổi thơ Mỹ', 'Vị vua sư tử tương lai trong kiệt tác hoạt hình ''Vua Sư Tử'' (The Lion King) của Disney tên là gì?', '["Mufasa","Simba","Scar","Kovu"]'::jsonb, 1, 'Simba vượt qua nỗi đau mất cha Mufasa và âm mưu tàn độc của chú Scar để giành lại Ngai đá Kiêu Hãnh (Pride Rock).',
  'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị vua sư tử tương lai trong kiệt tác hoạt hình ''Vua Sư Tử'' (The Lion King) của Disney tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg' WHERE lower(trim(prompt)) = lower('Vị vua sư tử tương lai trong kiệt tác hoạt hình ''Vua Sư Tử'' (The Lion King) của Disney tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 492, 'Hoạt hình tuổi thơ Mỹ', 'Cặp đôi chồn meerkat và lợn rừng hài hước dạy Simba triết lý sống vô tư ''Hakuna Matata'' là ai?', '["Timon và Pumbaa","Zazu và Rafiki","Banzai và Shenzi","Baloo và Bagheera"]'::jsonb, 0, '''Hakuna Matata'' trong tiếng Swahili có nghĩa là ''không có gì phải lo lắng cho những ngày tháng còn lại''.',
  'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cặp đôi chồn meerkat và lợn rừng hài hước dạy Simba triết lý sống vô tư ''Hakuna Matata'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg' WHERE lower(trim(prompt)) = lower('Cặp đôi chồn meerkat và lợn rừng hài hước dạy Simba triết lý sống vô tư ''Hakuna Matata'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 493, 'Hoạt hình tuổi thơ Mỹ', 'Thần Đèn màu xanh quyền năng biết biến hình vô số trò hề trong ''Aladdin'' do danh hài huyền thoại nào lồng tiếng bản gốc?', '["Tom Hanks","Jim Carrey","Eddie Murphy","Robin Williams"]'::jsonb, 3, 'Robin Williams đã có màn lồng tiếng ngẫu hứng lịch sử đưa Thần Đèn trở thành một trong những nhân vật được yêu thích nhất mọi thời đại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Robin_Williams_1996_%28cropped%29_2.jpg/330px-Robin_Williams_1996_%28cropped%29_2.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Thần Đèn màu xanh quyền năng biết biến hình vô số trò hề trong ''Aladdin'' do danh hài huyền thoại nào lồng tiếng bản gốc?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Robin_Williams_1996_%28cropped%29_2.jpg/330px-Robin_Williams_1996_%28cropped%29_2.jpg' WHERE lower(trim(prompt)) = lower('Thần Đèn màu xanh quyền năng biết biến hình vô số trò hề trong ''Aladdin'' do danh hài huyền thoại nào lồng tiếng bản gốc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 494, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Câu Chuyện Đồ Chơi'' (Toy Story 1995), hai món đồ chơi chủ chốt ban đầu là kỳ phùng địch thủ của nhau là ai?', '["Heo đất Hamm và Ông khoai tây","Khủng long Rex và Chó Slinky","Chàng cao bồi Woody và Cảnh sát vũ trụ Buzz Lightyear","Gấu Lotso và Búp bê Ken"]'::jsonb, 2, 'Toy Story là bộ phim hoạt hình dài đầu tiên trong lịch sử làm hoàn toàn bằng máy tính (CGI) của xưởng Pixar.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Câu Chuyện Đồ Chơi'' (Toy Story 1995), hai món đồ chơi chủ chốt ban đầu là kỳ phùng địch thủ của nhau là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Câu Chuyện Đồ Chơi'' (Toy Story 1995), hai món đồ chơi chủ chốt ban đầu là kỳ phùng địch thủ của nhau là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 495, 'Hoạt hình tuổi thơ Mỹ', 'Câu khẩu hiệu bay lượn nổi tiếng của Cảnh sát vũ trụ Buzz Lightyear là gì?', '["To the galaxy!","To infinity and beyond! (Vô cực và xa hơn nữa!)","I believe I can fly!","Never give up!"]'::jsonb, 1, 'Câu nói ''To infinity and beyond!'' của Buzz Lightyear đã trở thành một trong những câu thoại hoạt hình kinh điển nhất lịch sử.',
  'https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu khẩu hiệu bay lượn nổi tiếng của Cảnh sát vũ trụ Buzz Lightyear là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg' WHERE lower(trim(prompt)) = lower('Câu khẩu hiệu bay lượn nổi tiếng của Cảnh sát vũ trụ Buzz Lightyear là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 496, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Đi Tìm Nemo'' (Finding Nemo), cô cá xanh đãng trí mắc chứng mất trí nhớ ngắn hạn tên là gì?', '["Dory","Nemo","Marlin","Gill"]'::jsonb, 0, 'Cá Dory vui tính luôn nói câu động viên: ''Just keep swimming'' (Cứ tiếp tục bơi đi).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Đi Tìm Nemo'' (Finding Nemo), cô cá xanh đãng trí mắc chứng mất trí nhớ ngắn hạn tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong ''Đi Tìm Nemo'' (Finding Nemo), cô cá xanh đãng trí mắc chứng mất trí nhớ ngắn hạn tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 497, 'Hoạt hình tuổi thơ Mỹ', 'Chàng quái vật chằn tinh da xanh sống trong đầm lầy kết hôn cùng Công chúa Fiona trong loạt phim của DreamWorks là ai?', '["Farquaad","Charming","Donkey","Shrek"]'::jsonb, 3, 'Shrek là bộ phim hoạt hình đầu tiên trong lịch sử đoạt giải Oscar cho Phim hoạt hình xuất sắc nhất năm 2002.',
  'https://upload.wikimedia.org/wikipedia/en/7/7b/Shrek_%282001_animated_feature_film%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chàng quái vật chằn tinh da xanh sống trong đầm lầy kết hôn cùng Công chúa Fiona trong loạt phim của DreamWorks là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/7/7b/Shrek_%282001_animated_feature_film%29.jpg' WHERE lower(trim(prompt)) = lower('Chàng quái vật chằn tinh da xanh sống trong đầm lầy kết hôn cùng Công chúa Fiona trong loạt phim của DreamWorks là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 498, 'Hoạt hình tuổi thơ Mỹ', 'Chú gấu trúc mũm mĩm mê ăn bánh bao trở thành ''Thần Long Đại Hiệp'' trong Kung Fu Panda tên là gì?', '["Oogway","Shifu","Po","Tigress"]'::jsonb, 2, 'Gấu trúc Po từ một phụ bếp quán mì của ngỗng cha Mr. Ping đã giác ngộ bí kíp Rồng Thần không chữ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú gấu trúc mũm mĩm mê ăn bánh bao trở thành ''Thần Long Đại Hiệp'' trong Kung Fu Panda tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG' WHERE lower(trim(prompt)) = lower('Chú gấu trúc mũm mĩm mê ăn bánh bao trở thành ''Thần Long Đại Hiệp'' trong Kung Fu Panda tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 499, 'Hoạt hình tuổi thơ Mỹ', 'Chú rồng đen huyền bí thuộc chủng tộc Night Fury (Tia Chớp Đêm) trong ''Bí Kíp Luyện Rồng'' tên là gì?', '["Stormfly","Toothless (Răng Sún)","Hookfang","Meatlug"]'::jsonb, 1, 'Răng Sún kết bạn cùng cậu bé người Viking Hiccup, thay đổi hoàn toàn quan niệm săn rồng của đảo Berk.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chú rồng đen huyền bí thuộc chủng tộc Night Fury (Tia Chớp Đêm) trong ''Bí Kíp Luyện Rồng'' tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Chú rồng đen huyền bí thuộc chủng tộc Night Fury (Tia Chớp Đêm) trong ''Bí Kíp Luyện Rồng'' tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  50, 500, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Kẻ Trộm Mặt Trăng'' (Despicable Me), những sinh vật nhỏ màu vàng da chuối, đeo kính bảo hộ và mê chuối được gọi là gì?', '["Minions","Smurfs","Oompa Loompas","Gremlins"]'::jsonb, 0, 'Đội quân Minion (Kevin, Stuart, Bob...) nói thứ ngôn ngữ líu lo kỳ lạ đã trở thành biểu tượng siêu lợi nhuận của Illumination.',
  'https://upload.wikimedia.org/wikipedia/en/1/19/Minions_%282015_film%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Kẻ Trộm Mặt Trăng'' (Despicable Me), những sinh vật nhỏ màu vàng da chuối, đeo kính bảo hộ và mê chuối được gọi là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/19/Minions_%282015_film%29.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Kẻ Trộm Mặt Trăng'' (Despicable Me), những sinh vật nhỏ màu vàng da chuối, đeo kính bảo hộ và mê chuối được gọi là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 501, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Adventure Time'', hai nhân vật chính sống ở Xứ sở Ooo huyền diệu là cậu bé con người và chú chó biết co giãn tên là gì?', '["Steven và Connie","Mordecai và Rigby","Gumball và Darwin","Finn và Jake"]'::jsonb, 3, 'Cậu bé Finn đội mũ gấu trắng và chú chó phép thuật màu vàng Jake là cặp bài trùng phiêu lưu bất hủ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Adventure Time'', hai nhân vật chính sống ở Xứ sở Ooo huyền diệu là cậu bé con người và chú chó biết co giãn tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong ''Adventure Time'', hai nhân vật chính sống ở Xứ sở Ooo huyền diệu là cậu bé con người và chú chó biết co giãn tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 502, 'Hoạt hình tuổi thơ Mỹ', 'Cậu bé Timmy Turner trong ''Những Cha Mẹ Thần Đỡ Đầu'' (The Fairly OddParents) có hai vị thần đỡ đầu biến hóa phép thuật tên là gì?', '["Jorgen và Tooth Fairy","Poof và Foop","Cosmo và Wanda","Vicky và Chester"]'::jsonb, 2, 'Cosmo tóc xanh lá ngốc nghếch và Wanda tóc hồng thông minh cải trang thành hai chú cá vàng trong bể nước.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Cậu bé Timmy Turner trong ''Những Cha Mẹ Thần Đỡ Đầu'' (The Fairly OddParents) có hai vị thần đỡ đầu biến hóa phép thuật tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Cậu bé Timmy Turner trong ''Những Cha Mẹ Thần Đỡ Đầu'' (The Fairly OddParents) có hai vị thần đỡ đầu biến hóa phép thuật tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 503, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Thế Giới Kỳ Diệu Của Gumball'' (The Amazing World of Gumball), chú cá vàng mọc chân được gia đình Watterson nhận nuôi tên là gì?', '["Gumball","Darwin Watterson","Anais","Richard"]'::jsonb, 1, 'Darwin ban đầu là cá cảnh nhưng nhờ tình yêu thương vô bờ bến đã mọc chân và biết nói tiếng người.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Thế Giới Kỳ Diệu Của Gumball'' (The Amazing World of Gumball), chú cá vàng mọc chân được gia đình Watterson nhận nuôi tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong ''Thế Giới Kỳ Diệu Của Gumball'' (The Amazing World of Gumball), chú cá vàng mọc chân được gia đình Watterson nhận nuôi tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 504, 'Hoạt hình tuổi thơ Mỹ', 'Nhóm thanh thiếu niên siêu anh hùng ''Teen Titans'' của DC gồm Robin, Starfire, Cyborg, Beast Boy và phù thủy nào?', '["Raven","Terra","Jinx","Blackfire"]'::jsonb, 0, 'Raven (con gái của chúa quỷ Trigon) sở hữu ma thuật bóng tối và câu niệm ''Azarath Metrion Zinthos''.',
  'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhóm thanh thiếu niên siêu anh hùng ''Teen Titans'' của DC gồm Robin, Starfire, Cyborg, Beast Boy và phù thủy nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg' WHERE lower(trim(prompt)) = lower('Nhóm thanh thiếu niên siêu anh hùng ''Teen Titans'' của DC gồm Robin, Starfire, Cyborg, Beast Boy và phù thủy nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 505, 'Hoạt hình tuổi thơ Mỹ', 'Ba nữ điệp viên trung học xinh đẹp trong loạt phim ''Ba Nữ Thám Tử'' (Totally Spies!) của hãng Marathon gồm những ai?', '["Kim, Shego, Monique","Bloom, Stella, Musa","Blossom, Bubbles, Buttercup","Sam, Clover, Alex"]'::jsonb, 3, 'Sam thông minh áo xanh lá, Clover điệu đà áo đỏ, Alex năng động áo vàng làm việc cho tổ chức WOOHP của sếp Jerry.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ba nữ điệp viên trung học xinh đẹp trong loạt phim ''Ba Nữ Thám Tử'' (Totally Spies!) của hãng Marathon gồm những ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Ba nữ điệp viên trung học xinh đẹp trong loạt phim ''Ba Nữ Thám Tử'' (Totally Spies!) của hãng Marathon gồm những ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 506, 'Hoạt hình tuổi thơ Mỹ', 'Nữ anh hùng tuổi teen cổ vũ bóng đá kiêm đặc vụ cứu thế giới với câu thoại ''Gọi cho tôi, nhắn cho tôi nếu muốn gặp'' là ai?', '["Gwen Tennyson","Shego","Kim Possible","Penny Proud"]'::jsonb, 2, 'Kim Possible cùng người bạn ngố Ron Stoppable và chú chuột chũi không lông Rufus chuyên đối đầu với Dr. Drakken.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ anh hùng tuổi teen cổ vũ bóng đá kiêm đặc vụ cứu thế giới với câu thoại ''Gọi cho tôi, nhắn cho tôi nếu muốn gặp'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Nữ anh hùng tuổi teen cổ vũ bóng đá kiêm đặc vụ cứu thế giới với câu thoại ''Gọi cho tôi, nhắn cho tôi nếu muốn gặp'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 507, 'Hoạt hình tuổi thơ Mỹ', 'Trong phim ''Vút Bay'' (Up 2009) của Pixar, ông lão Carl Fredricksen đã làm cách nào để nâng cả ngôi nhà bay lên bầu trời?', '["Lắp động cơ phản lực","Gắn hàng ngàn quả bóng bay bơm khí heli","Dùng bột tiên bay","Nhờ bão lốc cuốn"]'::jsonb, 1, 'Ông lão Carl buộc hàng vạn quả bóng bay rực rỡ để đưa ngôi nhà kỷ niệm với người vợ quá cố Ellie tới Thác Nước Thiên Đường.',
  'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim ''Vút Bay'' (Up 2009) của Pixar, ông lão Carl Fredricksen đã làm cách nào để nâng cả ngôi nhà bay lên bầu trời?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim ''Vút Bay'' (Up 2009) của Pixar, ông lão Carl Fredricksen đã làm cách nào để nâng cả ngôi nhà bay lên bầu trời?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 508, 'Hoạt hình tuổi thơ Mỹ', 'Bộ phim hoạt hình ''Nữ Hoàng Băng Giá'' (Frozen) lấy cảm hứng từ câu chuyện cổ tích nào của nhà văn Hans Christian Andersen?', '["Bà Chúa Tuyết (The Snow Queen)","Nàng Tiên Cá","Cô Bé Bán Diêm","Chú Vịt Con Xấu Xí"]'::jsonb, 0, 'Disney đã cải biên chuyện cổ tích The Snow Queen thành câu chuyện tình cảm chị em cảm động giữa Elsa và Anna.',
  'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Nữ Hoàng Băng Giá'' (Frozen) lấy cảm hứng từ câu chuyện cổ tích nào của nhà văn Hans Christian Andersen?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Nữ Hoàng Băng Giá'' (Frozen) lấy cảm hứng từ câu chuyện cổ tích nào của nhà văn Hans Christian Andersen?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 509, 'Hoạt hình tuổi thơ Mỹ', 'Người tuyết vui tính thích mùa hè và thích những cái ôm ấm áp trong Frozen tên là gì?', '["Marshmallow","Sven","Kristoff","Olaf"]'::jsonb, 3, 'Olaf do Elsa tạo ra bằng phép thuật băng tuyết, có chiếc mũi bằng củ cà rốt.',
  'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Người tuyết vui tính thích mùa hè và thích những cái ôm ấm áp trong Frozen tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png' WHERE lower(trim(prompt)) = lower('Người tuyết vui tính thích mùa hè và thích những cái ôm ấm áp trong Frozen tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  51, 510, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Chú Chuột Đầu Bếp'' (Ratatouille), chú chuột thiên tài ẩm thực điều khiển chàng phụ bếp Linguini bằng cách nào?', '["Dùng máy điện thoại bí mật","Nói vào tai Linguini","Giật các lọn tóc của Linguini dưới chiếc mũ đầu bếp","Cào ngón chân"]'::jsonb, 2, 'Chú chuột Remy ẩn mình trong chiếc mũ cao chót vót và điều khiển từng cử động tay chân của Linguini như một người múa rối.',
  'https://upload.wikimedia.org/wikipedia/en/5/50/RatatouillePoster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Chú Chuột Đầu Bếp'' (Ratatouille), chú chuột thiên tài ẩm thực điều khiển chàng phụ bếp Linguini bằng cách nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/50/RatatouillePoster.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Chú Chuột Đầu Bếp'' (Ratatouille), chú chuột thiên tài ẩm thực điều khiển chàng phụ bếp Linguini bằng cách nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 511, 'Hoạt hình tuổi thơ Mỹ', 'Trong bộ phim hoạt hình ''Kung Fu Panda'', sư phụ dạy võ trực tiếp cho Po và nhóm Ngũ Đại Hào Kiệt có tên là gì?', '["Đại sư Oogway","Sư phụ Shifu","Tai Lung","Lord Shen"]'::jsonb, 1, 'Sư phụ Shifu (loài gấu trúc đỏ) là người trực tiếp huấn luyện Po trở thành Thần Long Đại Hiệp.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Kung Fu Panda'', sư phụ dạy võ trực tiếp cho Po và nhóm Ngũ Đại Hào Kiệt có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG' WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Kung Fu Panda'', sư phụ dạy võ trực tiếp cho Po và nhóm Ngũ Đại Hào Kiệt có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 512, 'Hoạt hình tuổi thơ Mỹ', 'Vị đại sư rùa già thông thái sáng lập môn võ Kung Fu trong ''Kung Fu Panda'' có tên là gì?', '["Đại sư Oogway","Sư phụ Shifu","Mr. Ping","Kai"]'::jsonb, 0, 'Đại sư rùa Oogway là người đã chọn Po làm Thần Long Đại Hiệp và để lại nhiều câu nói triết lý sâu sắc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vị đại sư rùa già thông thái sáng lập môn võ Kung Fu trong ''Kung Fu Panda'' có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/330px-Grosser_Panda.JPG' WHERE lower(trim(prompt)) = lower('Vị đại sư rùa già thông thái sáng lập môn võ Kung Fu trong ''Kung Fu Panda'' có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 513, 'Hoạt hình tuổi thơ Mỹ', 'Trong bộ phim hoạt hình ''Bí kíp luyện rồng (How to Train Your Dragon)'', chú rồng Sất Nha (Toothless) thuộc loài rồng quý hiếm nào?', '["Monstrous Nightmare","Light Fury","Deadly Nadder","Night Fury (Quỷ Bóng Đêm)"]'::jsonb, 3, 'Toothless (Sất Nha) là cá thể rồng Night Fury cực kỳ thông minh và nhanh nhẹn, bạn đồng hành của Hiccup.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Bí kíp luyện rồng (How to Train Your Dragon)'', chú rồng Sất Nha (Toothless) thuộc loài rồng quý hiếm nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Bí kíp luyện rồng (How to Train Your Dragon)'', chú rồng Sất Nha (Toothless) thuộc loài rồng quý hiếm nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 514, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Đi tìm Nemo (Finding Nemo)'', cô cá xanh hay bị mất trí nhớ ngắn hạn đồng hành cùng cá bố Marlin tên là gì?', '["crush","Coral","Dory","Bruce"]'::jsonb, 2, 'Cô cá Dory vui tính hay quên (do Ellen DeGeneres lồng tiếng) đã giúp Marlin vượt đại dương đến Sydney tìm Nemo.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Đi tìm Nemo (Finding Nemo)'', cô cá xanh hay bị mất trí nhớ ngắn hạn đồng hành cùng cá bố Marlin tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong ''Đi tìm Nemo (Finding Nemo)'', cô cá xanh hay bị mất trí nhớ ngắn hạn đồng hành cùng cá bố Marlin tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 515, 'Hoạt hình tuổi thơ Mỹ', 'Trong ''Finding Nemo'', địa chỉ phòng khám nha khoa ở Sydney mà Dory cố nhớ trên chiếc kính lặn là gì?', '["Số 10 đường Downing, London","P. Sherman, 42 đường Wallaby, Sydney","Số 221B phố Baker","Số 742 Evergreen Terrace"]'::jsonb, 1, '''P. Sherman, 42 Wallaby Way, Sydney'' là một trong những câu thoại kinh điển nhất lịch sử phim Pixar.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Finding Nemo'', địa chỉ phòng khám nha khoa ở Sydney mà Dory cố nhớ trên chiếc kính lặn là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong ''Finding Nemo'', địa chỉ phòng khám nha khoa ở Sydney mà Dory cố nhớ trên chiếc kính lặn là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 516, 'Hoạt hình tuổi thơ Mỹ', 'Trong phim hoạt hình ''Monsters, Inc. (Công ty Quái vật)'', cô bé loài người lạc vào thế giới quái vật được Sully đặt tên là gì?', '["Boo","Riley","Vanellope","Agnes"]'::jsonb, 0, 'Chú quái vật lông xanh Sully đặt biệt danh cho cô bé là ''Boo''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim hoạt hình ''Monsters, Inc. (Công ty Quái vật)'', cô bé loài người lạc vào thế giới quái vật được Sully đặt tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong phim hoạt hình ''Monsters, Inc. (Công ty Quái vật)'', cô bé loài người lạc vào thế giới quái vật được Sully đặt tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 517, 'Hoạt hình tuổi thơ Mỹ', 'Trong bộ phim ''Inside Out (Những mảnh ghép cảm xúc)'' của Pixar, 5 cảm xúc gốc trong tâm trí cô bé Riley gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và ai?', '["Ghen Tị (Envy)","Lo Âu (Anxiety)","Xấu Hổ (Embarrassment)","Chán Ghét (Disgust)"]'::jsonb, 3, 'Trong phần 1, 5 cảm xúc cơ bản là Joy (Vui), Sadness (Buồn), Anger (Giận), Fear (Sợ) và Disgust (Chán ghét).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Inside Out (Những mảnh ghép cảm xúc)'' của Pixar, 5 cảm xúc gốc trong tâm trí cô bé Riley gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Inside Out (Những mảnh ghép cảm xúc)'' của Pixar, 5 cảm xúc gốc trong tâm trí cô bé Riley gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 518, 'Hoạt hình tuổi thơ Mỹ', 'Trong phim hoạt hình ''WALL-E (Robot biết yêu)'' của Pixar, cô robot thăm dò hiện đại màu trắng mà WALL-E đem lòng yêu tên là gì?', '["M-O","AUTO","EVE","HAL"]'::jsonb, 2, 'EVE (Extraterrestrial Vegetation Evaluator) được gửi xuống Trái Đất để tìm kiếm mầm sống thực vật.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim hoạt hình ''WALL-E (Robot biết yêu)'' của Pixar, cô robot thăm dò hiện đại màu trắng mà WALL-E đem lòng yêu tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong phim hoạt hình ''WALL-E (Robot biết yêu)'' của Pixar, cô robot thăm dò hiện đại màu trắng mà WALL-E đem lòng yêu tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 519, 'Hoạt hình tuổi thơ Mỹ', 'Trong bộ phim hoạt hình ''Coco'' (2017) lấy bối cảnh lễ hội Người Chết ở Mexico, bài hát chủ đề đoạt giải Oscar có tên là gì?', '["Un Poco Loco","Remember Me","La Llorona","Dos Oruguitas"]'::jsonb, 1, '''Remember Me'' là bài hát cảm động kết nối cậu bé Miguel với người cụ cố Coco.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Coco'' (2017) lấy bối cảnh lễ hội Người Chết ở Mexico, bài hát chủ đề đoạt giải Oscar có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Coco'' (2017) lấy bối cảnh lễ hội Người Chết ở Mexico, bài hát chủ đề đoạt giải Oscar có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  52, 520, 'Hoạt hình tuổi thơ Mỹ', 'Trong bộ phim hoạt hình ''Zootopia (Phi vụ động trời)'', cô thỏ cảnh sát đầu tiên của thành phố tên là gì?', '["Judy Hopps","Nick Wilde","Gazelle","Bellwether"]'::jsonb, 0, 'Cô thỏ cảnh sát Judy Hopps cùng chú cáo Nick Wilde đã phá vỡ âm mưu lớn tại thành phố Zootopia.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Zootopia (Phi vụ động trời)'', cô thỏ cảnh sát đầu tiên của thành phố tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/330px-Mickey_Mouse_%28poster_version%29.svg.png' WHERE lower(trim(prompt)) = lower('Trong bộ phim hoạt hình ''Zootopia (Phi vụ động trời)'', cô thỏ cảnh sát đầu tiên của thành phố tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 521, 'Đoán tên ca sĩ nổi tiếng', 'Nhìn vào ảnh chân dung và cho biết đây là nam ca sĩ kiêm chủ tịch công ty M-TP Entertainment quê Thái Bình là ai?', '["Monstar Grey D","Soobin Hoàng Sơn","Sơn Tùng M-TP","MONO"]'::jsonb, 2, 'Sơn Tùng M-TP (Nguyễn Thanh Tùng) là ngôi sao giải trí hàng đầu Việt Nam với cộng đồng Sky đông đảo.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Son_Tung_M-TP_1_2017.jpg/640px-Son_Tung_M-TP_1_2017.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh chân dung và cho biết đây là nam ca sĩ kiêm chủ tịch công ty M-TP Entertainment quê Thái Bình là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Son_Tung_M-TP_1_2017.jpg/640px-Son_Tung_M-TP_1_2017.jpg' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh chân dung và cho biết đây là nam ca sĩ kiêm chủ tịch công ty M-TP Entertainment quê Thái Bình là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 522, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ nào được công chúng yêu mến gọi là ''Họa mi tóc nâu'' quê gốc Đà Nẵng, chủ nhân liveshow Tri Âm lịch sử?', '["Thu Minh","Mỹ Tâm","Hồng Nhung","Hồ Quỳnh Hương"]'::jsonb, 1, 'Mỹ Tâm với hơn 20 năm cống hiến nghệ thuật chân chính đã lấp đầy hàng vạn khán giả tại sân vận động Mỹ Đình.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg/640px-Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được công chúng yêu mến gọi là ''Họa mi tóc nâu'' quê gốc Đà Nẵng, chủ nhân liveshow Tri Âm lịch sử?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg/640px-Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được công chúng yêu mến gọi là ''Họa mi tóc nâu'' quê gốc Đà Nẵng, chủ nhân liveshow Tri Âm lịch sử?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 523, 'Đoán tên ca sĩ nổi tiếng', 'Rapper mộc mạc quê Quảng Ninh với chiếc mũ lưỡi trai và những câu rap triết lý sống như ''Bài này chill phết'', ''Hai triệu năm'' là ai?', '["Đen Vâu (Nguyễn Đức Cường)","Binz","Karik","Suboi"]'::jsonb, 0, 'Đen Vâu từ một nhân viên dọn rác bãi biển đã vươn lên thành biểu tượng sống tử tế của làng rap Việt.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Den_Vau_2019.jpg/640px-Den_Vau_2019.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Rapper mộc mạc quê Quảng Ninh với chiếc mũ lưỡi trai và những câu rap triết lý sống như ''Bài này chill phết'', ''Hai triệu năm'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Den_Vau_2019.jpg/640px-Den_Vau_2019.jpg' WHERE lower(trim(prompt)) = lower('Rapper mộc mạc quê Quảng Ninh với chiếc mũ lưỡi trai và những câu rap triết lý sống như ''Bài này chill phết'', ''Hai triệu năm'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 524, 'Đoán tên ca sĩ nổi tiếng', 'Ca sĩ nào sở hữu nghệ danh là ''Anh Hai'' gắn liền với kiểu tóc bổ luống thư sinh thập niên 90 và ca khúc ''Tình Thôi Xót Xa''?', '["Tuấn Hưng","Đan Trường","Quang Dũng","Lam Trường"]'::jsonb, 3, 'Lam Trường là người mở đầu cho làn sóng nhạc trẻ Việt Nam tại bảng xếp hạng Làn Sóng Xanh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào sở hữu nghệ danh là ''Anh Hai'' gắn liền với kiểu tóc bổ luống thư sinh thập niên 90 và ca khúc ''Tình Thôi Xót Xa''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/330px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Ca sĩ nào sở hữu nghệ danh là ''Anh Hai'' gắn liền với kiểu tóc bổ luống thư sinh thập niên 90 và ca khúc ''Tình Thôi Xót Xa''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 525, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ ''Bo'' nổi tiếng với mái tóc quyển vở huyền thoại, hát các bài ''Kiếp Ve Sầu'', ''Mưa Trên Cuộc Tình'' là ai?', '["Ưng Hoàng Phúc","Lam Trường","Đan Trường","Cẩm Ly"]'::jsonb, 2, 'Đan Trường (Anh Bo) là nam thần tượng thanh xuân với vẻ đẹp không tuổi của làng nhạc Việt.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png/330px-%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ ''Bo'' nổi tiếng với mái tóc quyển vở huyền thoại, hát các bài ''Kiếp Ve Sầu'', ''Mưa Trên Cuộc Tình'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png/330px-%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ ''Bo'' nổi tiếng với mái tóc quyển vở huyền thoại, hát các bài ''Kiếp Ve Sầu'', ''Mưa Trên Cuộc Tình'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 526, 'Đoán tên ca sĩ nổi tiếng', 'Nhìn vào ảnh và cho biết đây là nữ ca sĩ nhạc đồng quê và pop người Mỹ vừa trở thành tỉ phú tự thân qua âm nhạc là ai?', '["Katy Perry","Taylor Swift","Selena Gomez","Ariana Grande"]'::jsonb, 1, 'Taylor Swift sinh năm 1989 là một trong những nghệ sĩ bán đĩa chạy nhất mọi thời đại.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_3.png/640px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_3.png', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là nữ ca sĩ nhạc đồng quê và pop người Mỹ vừa trở thành tỉ phú tự thân qua âm nhạc là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_3.png/640px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_3.png' WHERE lower(trim(prompt)) = lower('Nhìn vào ảnh và cho biết đây là nữ ca sĩ nhạc đồng quê và pop người Mỹ vừa trở thành tỉ phú tự thân qua âm nhạc là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 527, 'Đoán tên ca sĩ nổi tiếng', 'Diva âm nhạc thế giới sở hữu giọng hát cao vút và bản tình ca bất hủ ''My Heart Will Go On'' đến từ Canada là ai?', '["Céline Dion","Mariah Carey","Shania Twain","Avril Lavigne"]'::jsonb, 0, 'Céline Dion là niềm tự hào của nền âm nhạc Canada và Pháp với kỹ thuật thanh nhạc bậc thầy.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Celine_Dion_Concert_Singing_2012.jpg/640px-Celine_Dion_Concert_Singing_2012.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Diva âm nhạc thế giới sở hữu giọng hát cao vút và bản tình ca bất hủ ''My Heart Will Go On'' đến từ Canada là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Celine_Dion_Concert_Singing_2012.jpg/640px-Celine_Dion_Concert_Singing_2012.jpg' WHERE lower(trim(prompt)) = lower('Diva âm nhạc thế giới sở hữu giọng hát cao vút và bản tình ca bất hủ ''My Heart Will Go On'' đến từ Canada là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 528, 'Đoán tên ca sĩ nổi tiếng', 'Ai được mệnh danh là ''Nữ hoàng nhạc Pop'' (Queen of Pop) với những bước đột phá về phong cách suốt 4 thập kỷ qua?', '["Janet Jackson","Cyndi Lauper","Cher","Madonna"]'::jsonb, 3, 'Madonna với các bản hit ''Like a Virgin'', ''Vogue'' là nữ nghệ sĩ thu âm thành công nhất lịch sử theo Guinness.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai được mệnh danh là ''Nữ hoàng nhạc Pop'' (Queen of Pop) với những bước đột phá về phong cách suốt 4 thập kỷ qua?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Ai được mệnh danh là ''Nữ hoàng nhạc Pop'' (Queen of Pop) với những bước đột phá về phong cách suốt 4 thập kỷ qua?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 529, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Anh với cây đàn guitar mộc mạc, hình xăm kín tay và bản hit ''Perfect'', ''Photograph'' là ai?', '["Lewis Capaldi","Harry Styles","Ed Sheeran","George Ezra"]'::jsonb, 2, 'Ed Sheeran sinh năm 1991 nổi tiếng với khả năng sáng tác thần tốc và kỹ thuật dùng pedal loop trên sân khấu concert.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/640px-Ed_Sheeran-6886_%28cropped%29.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh với cây đàn guitar mộc mạc, hình xăm kín tay và bản hit ''Perfect'', ''Photograph'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/640px-Ed_Sheeran-6886_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh với cây đàn guitar mộc mạc, hình xăm kín tay và bản hit ''Perfect'', ''Photograph'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  53, 530, 'Đoán tên ca sĩ nổi tiếng', 'Ai là ''Vua nhạc Rock and Roll'' (The King of Rock and Roll) với điệu lắc hông nổi tiếng của nước Mỹ thế kỷ 20?', '["Chuck Berry","Elvis Presley","Buddy Holly","Jerry Lee Lewis"]'::jsonb, 1, 'Elvis Presley với dinh thự Graceland và các ca khúc ''Can''t Help Falling in Love'', ''Jailhouse Rock'' là tượng đài bất tử.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/99/Elvis_Presley_promoting_Jailhouse_Rock.jpg/330px-Elvis_Presley_promoting_Jailhouse_Rock.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là ''Vua nhạc Rock and Roll'' (The King of Rock and Roll) với điệu lắc hông nổi tiếng của nước Mỹ thế kỷ 20?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/99/Elvis_Presley_promoting_Jailhouse_Rock.jpg/330px-Elvis_Presley_promoting_Jailhouse_Rock.jpg' WHERE lower(trim(prompt)) = lower('Ai là ''Vua nhạc Rock and Roll'' (The King of Rock and Roll) với điệu lắc hông nổi tiếng của nước Mỹ thế kỷ 20?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 531, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ kiêm diễn viên từng đạt danh xưng ''Công chúa nhạc Pop'' (Princess of Pop) đầu những năm 2000 với bài ''...Baby One More Time'' là ai?', '["Britney Spears","Christina Aguilera","Jessica Simpson","Mandy Moore"]'::jsonb, 0, 'Britney Spears là biểu tượng tuổi teen của thế hệ Y với vũ đạo nóng bỏng và các hit ''Oops!... I Did It Again'', ''Toxic''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/da/Britney_Spears_2013_%28Straighten_Crop%29.jpg/330px-Britney_Spears_2013_%28Straighten_Crop%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ kiêm diễn viên từng đạt danh xưng ''Công chúa nhạc Pop'' (Princess of Pop) đầu những năm 2000 với bài ''...Baby One More Time'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/da/Britney_Spears_2013_%28Straighten_Crop%29.jpg/330px-Britney_Spears_2013_%28Straighten_Crop%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ kiêm diễn viên từng đạt danh xưng ''Công chúa nhạc Pop'' (Princess of Pop) đầu những năm 2000 với bài ''...Baby One More Time'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 532, 'Đoán tên ca sĩ nổi tiếng', 'Trưởng nhóm kiêm rapper chính của BTS, người từng phát biểu trước Đại hội đồng Liên Hợp Quốc là ai?', '["Jin (Kim Seok-jin)","Suga (Min Yoon-gi)","J-Hope (Jung Ho-seok)","RM (Kim Nam-joon)"]'::jsonb, 3, 'RM sở hữu chỉ số IQ 148 và tài năng lãnh đạo kiệt xuất đã dẫn dắt BTS trở thành ban nhạc toàn cầu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trưởng nhóm kiêm rapper chính của BTS, người từng phát biểu trước Đại hội đồng Liên Hợp Quốc là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/330px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trưởng nhóm kiêm rapper chính của BTS, người từng phát biểu trước Đại hội đồng Liên Hợp Quốc là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 533, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ solo Hàn Quốc nào được gọi là ''Nữ hoàng quyến rũ'' (Sexy Queen) từ nhóm Fin.K.L với bản hit ''10 Minutes''?', '["Uhm Jung-hwa","BoA","Lee Hyori","Hyuna"]'::jsonb, 2, 'Lee Hyori đã tạo nên ''Hội chứng Hyori'' càn quét toàn bộ làng giải trí Hàn Quốc năm 2003.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ solo Hàn Quốc nào được gọi là ''Nữ hoàng quyến rũ'' (Sexy Queen) từ nhóm Fin.K.L với bản hit ''10 Minutes''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ solo Hàn Quốc nào được gọi là ''Nữ hoàng quyến rũ'' (Sexy Queen) từ nhóm Fin.K.L với bản hit ''10 Minutes''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 534, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng K-Pop'' (Queen of K-Pop), nghệ sĩ tiên phong của SM mở đường thành công rực rỡ tại thị trường Nhật Bản?', '["Taeyeon","BoA (Kwon Bo-ah)","Lee Hyori","IU"]'::jsonb, 1, 'BoA ra mắt từ năm 13 tuổi và là nghệ sĩ Hàn Quốc đầu tiên có album đạt vị trí quán quân trên bảng xếp hạng Oricon của Nhật Bản.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng K-Pop'' (Queen of K-Pop), nghệ sĩ tiên phong của SM mở đường thành công rực rỡ tại thị trường Nhật Bản?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào được mệnh danh là ''Nữ hoàng K-Pop'' (Queen of K-Pop), nghệ sĩ tiên phong của SM mở đường thành công rực rỡ tại thị trường Nhật Bản?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 535, 'Đoán tên ca sĩ nổi tiếng', 'Trưởng nhóm tài năng của Girls'' Generation (SNSD) sở hữu chất giọng ballad ngọt ngào và các bản hit solo ''I'', ''Four Seasons'' là ai?', '["Taeyeon (Kim Tae-yeon)","Yoona","Jessica Jung","Tiffany Young"]'::jsonb, 0, 'Taeyeon là một trong những giọng ca vàng xuất sắc nhất lịch sử K-Pop.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/80/250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg/330px-250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trưởng nhóm tài năng của Girls'' Generation (SNSD) sở hữu chất giọng ballad ngọt ngào và các bản hit solo ''I'', ''Four Seasons'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/80/250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg/330px-250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trưởng nhóm tài năng của Girls'' Generation (SNSD) sở hữu chất giọng ballad ngọt ngào và các bản hit solo ''I'', ''Four Seasons'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 536, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Mỹ gốc Hawaii đa tài, từng lập nhóm Silk Sonic cùng Anderson .Paak với hit ''Leave the Door Open'' là ai?', '["Jason Derulo","The Weeknd","Pharrell Williams","Bruno Mars"]'::jsonb, 3, 'Bruno Mars (Peter Gene Hernandez) sở hữu giọng hát và khả năng trình diễn sân khấu xuất chúng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b0/BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg/330px-BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ gốc Hawaii đa tài, từng lập nhóm Silk Sonic cùng Anderson .Paak với hit ''Leave the Door Open'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b0/BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg/330px-BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ gốc Hawaii đa tài, từng lập nhóm Silk Sonic cùng Anderson .Paak với hit ''Leave the Door Open'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 537, 'Đoán tên ca sĩ nổi tiếng', 'Ai là nữ ca sĩ nhạc Pop người Colombia nổi tiếng với điệu nhảy múa bụng điêu luyện và ca khúc cổ động World Cup 2010 ''Waka Waka''?', '["Gloria Estefan","Jennifer Lopez","Shakira","Rosalía"]'::jsonb, 2, 'Shakira được mệnh danh là ''Nữ hoàng nhạc Latin'' với câu nói ''Hips don''t lie'' (Những chiếc hông không biết nói dối).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là nữ ca sĩ nhạc Pop người Colombia nổi tiếng với điệu nhảy múa bụng điêu luyện và ca khúc cổ động World Cup 2010 ''Waka Waka''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Ai là nữ ca sĩ nhạc Pop người Colombia nổi tiếng với điệu nhảy múa bụng điêu luyện và ca khúc cổ động World Cup 2010 ''Waka Waka''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 538, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Canada sở hữu nghệ danh lấy cảm hứng từ ngày cuối tuần, chủ nhân bản hit ''Starboy'' và ''Save Your Tears'' là ai?', '["Drake","The Weeknd (Abel Tesfaye)","Justin Bieber","Post Malone"]'::jsonb, 1, 'The Weeknd là nghệ sĩ solo đầu tiên đạt 100 triệu lượt nghe hàng tháng trên Spotify.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6c/P20260719DT-1213_President_Donald_J._Trump_and_First_Lady_Melania_Trump_attend_the_FIFA_World_Cup_Final_%28cropped_2%29.jpg/330px-P20260719DT-1213_President_Donald_J._Trump_and_First_Lady_Melania_Trump_attend_the_FIFA_World_Cup_Final_%28cropped_2%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Canada sở hữu nghệ danh lấy cảm hứng từ ngày cuối tuần, chủ nhân bản hit ''Starboy'' và ''Save Your Tears'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6c/P20260719DT-1213_President_Donald_J._Trump_and_First_Lady_Melania_Trump_attend_the_FIFA_World_Cup_Final_%28cropped_2%29.jpg/330px-P20260719DT-1213_President_Donald_J._Trump_and_First_Lady_Melania_Trump_attend_the_FIFA_World_Cup_Final_%28cropped_2%29.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Canada sở hữu nghệ danh lấy cảm hứng từ ngày cuối tuần, chủ nhân bản hit ''Starboy'' và ''Save Your Tears'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 539, 'Đoán tên ca sĩ nổi tiếng', 'Nam rapper tỉ phú người Canada, cựu diễn viên tuổi teen và là ông hoàng bảng xếp hạng với hit ''God''s Plan'', ''Hotline Bling'' là ai?', '["Drake","Kanye West","Travis Scott","Kendrick Lamar"]'::jsonb, 0, 'Drake (Aubrey Drake Graham) nắm giữ vô số kỷ lục về số lượng bài hát lọt vào bảng xếp hạng Billboard.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg/330px-Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam rapper tỉ phú người Canada, cựu diễn viên tuổi teen và là ông hoàng bảng xếp hạng với hit ''God''s Plan'', ''Hotline Bling'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/15/Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg/330px-Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nam rapper tỉ phú người Canada, cựu diễn viên tuổi teen và là ông hoàng bảng xếp hạng với hit ''God''s Plan'', ''Hotline Bling'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  54, 540, 'Đoán tên ca sĩ nổi tiếng', 'Rapper tài hoa người Mỹ đoạt giải thưởng báo chí danh giá Pulitzer năm 2018 cho album ''DAMN.'' là ai?', '["Jay-Z","J. Cole","Eminem","Kendrick Lamar"]'::jsonb, 3, 'Kendrick Lamar là nghệ sĩ hip-hop đầu tiên trong lịch sử nhận được giải thưởng Pulitzer danh giá cho âm nhạc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Rapper tài hoa người Mỹ đoạt giải thưởng báo chí danh giá Pulitzer năm 2018 cho album ''DAMN.'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/330px-Eminem_2021_Color_Corrected.jpg' WHERE lower(trim(prompt)) = lower('Rapper tài hoa người Mỹ đoạt giải thưởng báo chí danh giá Pulitzer năm 2018 cho album ''DAMN.'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 541, 'Đoán tên ca sĩ nổi tiếng', 'Ca sĩ kiêm nhạc sĩ có biệt danh ''Thiên nga đen'' của làng nhạc indie Mỹ, nổi tiếng với chất giọng u sầu trong ''Summertime Sadness'', ''Video Games'' là ai?', '["FKA Twigs","Lorde","Lana Del Rey","Florence Welch"]'::jsonb, 2, 'Lana Del Rey (Elizabeth Grant) là nữ hoàng của dòng nhạc sadcore hoài niệm đậm chất điện ảnh Hollywood xưa.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ kiêm nhạc sĩ có biệt danh ''Thiên nga đen'' của làng nhạc indie Mỹ, nổi tiếng với chất giọng u sầu trong ''Summertime Sadness'', ''Video Games'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Ca sĩ kiêm nhạc sĩ có biệt danh ''Thiên nga đen'' của làng nhạc indie Mỹ, nổi tiếng với chất giọng u sầu trong ''Summertime Sadness'', ''Video Games'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 542, 'Đoán tên ca sĩ nổi tiếng', 'Ca sĩ nào là Quán quân đầu tiên của chương trình truyền hình âm nhạc American Idol mùa 1 (2002) với bản hit ''Because of You''?', '["Carrie Underwood","Kelly Clarkson","Jennifer Hudson","Adam Lambert"]'::jsonb, 1, 'Kelly Clarkson sở hữu chất giọng nội lực hiếm có và hiện là người dẫn chương trình The Kelly Clarkson Show.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào là Quán quân đầu tiên của chương trình truyền hình âm nhạc American Idol mùa 1 (2002) với bản hit ''Because of You''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Ca sĩ nào là Quán quân đầu tiên của chương trình truyền hình âm nhạc American Idol mùa 1 (2002) với bản hit ''Because of You''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 543, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Ý bị khiếm thị từ năm 12 tuổi, sở hữu giọng hát tenor cổ điển lay động hàng triệu trái tim với bài ''Time to Say Goodbye'' là ai?', '["Andrea Bocelli","Luciano Pavarotti","Plácido Domingo","Josh Groban"]'::jsonb, 0, 'Andrea Bocelli là nghệ sĩ thính phòng cổ điển thành công nhất thời đại với hơn 90 triệu đĩa bán ra.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Ý bị khiếm thị từ năm 12 tuổi, sở hữu giọng hát tenor cổ điển lay động hàng triệu trái tim với bài ''Time to Say Goodbye'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/330px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Ý bị khiếm thị từ năm 12 tuổi, sở hữu giọng hát tenor cổ điển lay động hàng triệu trái tim với bài ''Time to Say Goodbye'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 544, 'Đoán tên ca sĩ nổi tiếng', 'Ca sĩ nào được vinh danh là một trong Tứ đại diva nhạc nhẹ của Việt Nam cùng với Thanh Lam, Hồng Nhung và Mỹ Linh?', '["Hồ Quỳnh Hương","Mỹ Tâm","Thu Minh","Hà Trần (Trần Thu Hà)"]'::jsonb, 3, 'Bộ tứ Diva nhạc nhẹ Việt Nam gồm có Thanh Lam, Hồng Nhung, Mỹ Linh và Trần Thu Hà.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ca sĩ nào được vinh danh là một trong Tứ đại diva nhạc nhẹ của Việt Nam cùng với Thanh Lam, Hồng Nhung và Mỹ Linh?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Ca sĩ nào được vinh danh là một trong Tứ đại diva nhạc nhẹ của Việt Nam cùng với Thanh Lam, Hồng Nhung và Mỹ Linh?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 545, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ Việt Nam được mệnh danh là ''Nữ hoàng nhạc dance'' với các bản hit ''Đường Cong'', ''Bay'', ''Chuông Gió'' là ai?', '["Tóc Tiên","Hồ Ngọc Hà","Thu Minh","Đông Nhi"]'::jsonb, 2, 'Thu Minh sở hữu chất giọng soprano kịch tính cao vút và khả năng khuấy động sân khấu đỉnh cao.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Việt Nam được mệnh danh là ''Nữ hoàng nhạc dance'' với các bản hit ''Đường Cong'', ''Bay'', ''Chuông Gió'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Việt Nam được mệnh danh là ''Nữ hoàng nhạc dance'' với các bản hit ''Đường Cong'', ''Bay'', ''Chuông Gió'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 546, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ nào từng đại diện Việt Nam tham gia chương trình Đạp Gió (Tỷ Tỷ Đạp Gió Rẽ Sóng) tại Trung Quốc năm 2023 và tỏa sáng rực rỡ?', '["Hoàng Thùy Linh","Chi Pu (Nguyễn Thùy Chi)","Suni Hạ Linh","Min"]'::jsonb, 1, 'Chi Pu đã có màn thể hiện xuất sắc về trình diễn sân khấu và giành suất ra mắt trong đội hình chung cuộc Đạp Gió 2023.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/HOANG_THUY_LINH_DIEU_HANH_A80.jpg/330px-HOANG_THUY_LINH_DIEU_HANH_A80.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng đại diện Việt Nam tham gia chương trình Đạp Gió (Tỷ Tỷ Đạp Gió Rẽ Sóng) tại Trung Quốc năm 2023 và tỏa sáng rực rỡ?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0f/HOANG_THUY_LINH_DIEU_HANH_A80.jpg/330px-HOANG_THUY_LINH_DIEU_HANH_A80.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng đại diện Việt Nam tham gia chương trình Đạp Gió (Tỷ Tỷ Đạp Gió Rẽ Sóng) tại Trung Quốc năm 2023 và tỏa sáng rực rỡ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 547, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ underground nào sở hữu giọng rap quyến rũ được mệnh danh là ''Bigcityboi'' quê gốc Gia Lai?', '["Binz (Lê Nguyễn Trung Đan)","Rhymastic","Touliver","JustaTee"]'::jsonb, 0, 'Binz thuộc tổ đội SpaceSpeakers nổi tiếng với phong cách rap lãng tử, slow flow và trang phục màu hồng thời thượng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ underground nào sở hữu giọng rap quyến rũ được mệnh danh là ''Bigcityboi'' quê gốc Gia Lai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ underground nào sở hữu giọng rap quyến rũ được mệnh danh là ''Bigcityboi'' quê gốc Gia Lai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 548, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Hàn Quốc sở hữu bản hit quốc dân ''Any Song'' với thử thách vũ đạo TikTok mở màn cho trào lưu Dance Challenge là ai?', '["DEAN","Jay Park","Crush","Zico (Block B)"]'::jsonb, 3, 'Zico là người tiên phong đưa hình thức thử thách nhảy cùng nghệ sĩ trên TikTok thành chiến lược quảng bá âm nhạc chủ lực toàn cầu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Hàn Quốc sở hữu bản hit quốc dân ''Any Song'' với thử thách vũ đạo TikTok mở màn cho trào lưu Dance Challenge là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Hàn Quốc sở hữu bản hit quốc dân ''Any Song'' với thử thách vũ đạo TikTok mở màn cho trào lưu Dance Challenge là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 549, 'Đoán tên ca sĩ nổi tiếng', 'Ai là thành viên ngoại quốc đầu tiên giành chiến thắng vị trí Center trong chương trình sống còn Produce 48 và hiện là trưởng nhóm LE SSERAFIM?', '["Kazuha","Miyawaki Sakura","Kim Chae-won","Huh Yun-jin"]'::jsonb, 2, 'Kim Chae-won (cựu thành viên IZ*ONE) đã có màn lột xác phong cách thành công rực rỡ trong LE SSERAFIM.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ca/Osaka_Castle_03bs3200.jpg/330px-Osaka_Castle_03bs3200.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là thành viên ngoại quốc đầu tiên giành chiến thắng vị trí Center trong chương trình sống còn Produce 48 và hiện là trưởng nhóm LE SSERAFIM?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/ca/Osaka_Castle_03bs3200.jpg/330px-Osaka_Castle_03bs3200.jpg' WHERE lower(trim(prompt)) = lower('Ai là thành viên ngoại quốc đầu tiên giành chiến thắng vị trí Center trong chương trình sống còn Produce 48 và hiện là trưởng nhóm LE SSERAFIM?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  55, 550, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Anh là cựu thành viên nhóm One Direction, thành công vang dội với các bản hit solo ''Watermelon Sugar'', ''As It Was'' là ai?', '["Zayn Malik","Harry Styles","Niall Horan","Liam Payne"]'::jsonb, 1, 'Harry Styles đã đoạt giải Album của năm tại Grammy 2023 cho album ''Harry''s House''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Maroon_5_Current_Lineup_Collage.jpg/330px-Maroon_5_Current_Lineup_Collage.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh là cựu thành viên nhóm One Direction, thành công vang dội với các bản hit solo ''Watermelon Sugar'', ''As It Was'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/Maroon_5_Current_Lineup_Collage.jpg/330px-Maroon_5_Current_Lineup_Collage.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh là cựu thành viên nhóm One Direction, thành công vang dội với các bản hit solo ''Watermelon Sugar'', ''As It Was'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 551, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ nào từng giành tượng vàng Grammy và Oscar với ca khúc chủ đề cho phim điệp viên 007 mang tên ''Skyfall''?', '["Adele","Billie Eilish","Sam Smith","Shirley Bassey"]'::jsonb, 0, '''Skyfall'' do Adele sáng tác và thể hiện năm 2012 là một trong những bài hát nhạc phim James Bond thành công nhất lịch sử.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Adele_2016.jpg/330px-Adele_2016.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng giành tượng vàng Grammy và Oscar với ca khúc chủ đề cho phim điệp viên 007 mang tên ''Skyfall''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7c/Adele_2016.jpg/330px-Adele_2016.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào từng giành tượng vàng Grammy và Oscar với ca khúc chủ đề cho phim điệp viên 007 mang tên ''Skyfall''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 552, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ nào được mệnh danh là ''Thánh lụi'' của nhạc ballad Việt Nam với các bài hát ''Chạm Đáy Nỗi Đau'', ''Em Không Sai Chúng Ta Sai''?', '["Trịnh Thăng Bình","Đức Phúc","Mr. Siro","Erik"]'::jsonb, 3, 'Erik (Lê Trung Thành) sở hữu chất giọng mũi đặc trưng và chuyên trị những bản ballad tình yêu da diết.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào được mệnh danh là ''Thánh lụi'' của nhạc ballad Việt Nam với các bài hát ''Chạm Đáy Nỗi Đau'', ''Em Không Sai Chúng Ta Sai''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào được mệnh danh là ''Thánh lụi'' của nhạc ballad Việt Nam với các bài hát ''Chạm Đáy Nỗi Đau'', ''Em Không Sai Chúng Ta Sai''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 553, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ nào đã xuất sắc trở thành Quán quân Giọng Hát Việt 2015 dưới sự dẫn dắt của huấn luyện viên Mỹ Tâm với hit ''Ánh Nắng Của Anh''?', '["Hoàng Dũng","Ali Hoàng Dương","Đức Phúc","Bùi Anh Tuấn"]'::jsonb, 2, 'Đức Phúc là tấm gương truyền cảm hứng vượt qua tự ti ngoại hình để chạm tới đỉnh cao âm nhạc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào đã xuất sắc trở thành Quán quân Giọng Hát Việt 2015 dưới sự dẫn dắt của huấn luyện viên Mỹ Tâm với hit ''Ánh Nắng Của Anh''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ nào đã xuất sắc trở thành Quán quân Giọng Hát Việt 2015 dưới sự dẫn dắt của huấn luyện viên Mỹ Tâm với hit ''Ánh Nắng Của Anh''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 554, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Anh mang phong cách phi giới tính, sở hữu giọng ca thiên thần trong ''Stay With Me'' và bản hit ''Unholy'' là ai?', '["Calum Scott","Sam Smith","Troye Sivan","James Arthur"]'::jsonb, 1, 'Sam Smith đã giành được cả 4 giải Grammy lớn ngay trong mùa đề cử đầu tiên năm 2015.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh mang phong cách phi giới tính, sở hữu giọng ca thiên thần trong ''Stay With Me'' và bản hit ''Unholy'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Anh mang phong cách phi giới tính, sở hữu giọng ca thiên thần trong ''Stay With Me'' và bản hit ''Unholy'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 555, 'Đoán tên ca sĩ nổi tiếng', 'Ai là ca sĩ kiêm diễn viên từng đóng vai Hannah Montana huyền thoại của Disney Channel trước khi bùng nổ với bản hit ''Wrecking Ball'', ''Flowers''?', '["Miley Cyrus","Selena Gomez","Demi Lovato","Hilary Duff"]'::jsonb, 0, 'Miley Cyrus đã đoạt 2 giải Grammy đầu tiên trong sự nghiệp vào năm 2024 nhờ bản hit tự chữa lành ''Flowers''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là ca sĩ kiêm diễn viên từng đóng vai Hannah Montana huyền thoại của Disney Channel trước khi bùng nổ với bản hit ''Wrecking Ball'', ''Flowers''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png' WHERE lower(trim(prompt)) = lower('Ai là ca sĩ kiêm diễn viên từng đóng vai Hannah Montana huyền thoại của Disney Channel trước khi bùng nổ với bản hit ''Wrecking Ball'', ''Flowers''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 556, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ nào là cựu ngôi sao Disney của phim ''Wizards of Waverly Place'', người sáng lập thương hiệu mỹ phẩm Rare Beauty và có bản hit ''Lose You to Love Me''?', '["Ashley Tisdale","Miley Cyrus","Vanessa Hudgens","Selena Gomez"]'::jsonb, 3, 'Selena Gomez là một trong những phụ nữ được theo dõi nhiều nhất hành tinh trên mạng xã hội Instagram.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/52/Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg/330px-Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào là cựu ngôi sao Disney của phim ''Wizards of Waverly Place'', người sáng lập thương hiệu mỹ phẩm Rare Beauty và có bản hit ''Lose You to Love Me''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/52/Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg/330px-Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ nào là cựu ngôi sao Disney của phim ''Wizards of Waverly Place'', người sáng lập thương hiệu mỹ phẩm Rare Beauty và có bản hit ''Lose You to Love Me''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 557, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ Việt Nam nào từng tốt nghiệp Nhạc viện TP.HCM, nổi danh với chất giọng mượt mà trong các bản tình ca ''Nàng Thơ'', ''Tình Nào Không Như Tình Đầu''?', '["Lê Hiếu","Quân A.P","Hoàng Dũng","Thịnh Suy"]'::jsonb, 2, 'Hoàng Dũng (Á quân Giọng Hát Việt 2015) đã tạo nên cơn sốt ''Nàng Thơ'' chạm tới triệu con tim người yêu nhạc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ Việt Nam nào từng tốt nghiệp Nhạc viện TP.HCM, nổi danh với chất giọng mượt mà trong các bản tình ca ''Nàng Thơ'', ''Tình Nào Không Như Tình Đầu''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ Việt Nam nào từng tốt nghiệp Nhạc viện TP.HCM, nổi danh với chất giọng mượt mà trong các bản tình ca ''Nàng Thơ'', ''Tình Nào Không Như Tình Đầu''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 558, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ Gen Z được mệnh danh là ''Công chúa kẹo ngọt'' của V-Pop với các bản hit ''Anh Nhà Ở Đâu Thế'', ''Đen Đá Không Đường'' là ai?', '["Suni Hạ Linh","Amee (Trần Huyền My)","LyLy","Orange"]'::jsonb, 1, 'Amee trực thuộc ST.319 Entertainment ghi dấu ấn với giọng hát nũng nịu ngọt ngào và vũ đạo dễ thương.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z được mệnh danh là ''Công chúa kẹo ngọt'' của V-Pop với các bản hit ''Anh Nhà Ở Đâu Thế'', ''Đen Đá Không Đường'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Gen Z được mệnh danh là ''Công chúa kẹo ngọt'' của V-Pop với các bản hit ''Anh Nhà Ở Đâu Thế'', ''Đen Đá Không Đường'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 559, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Mỹ từng lập kỷ lục 19 tuần liên tiếp đứng đầu bảng xếp hạng Billboard Hot 100 với bản nhạc đồng quê trap ''Old Town Road'' là ai?', '["Lil Nas X","Post Malone","Roddy Ricch","DaBaby"]'::jsonb, 0, '''Old Town Road'' của Lil Nas X kết hợp cùng Billy Ray Cyrus là ca khúc trụ hạng No.1 lâu nhất lịch sử Billboard.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ từng lập kỷ lục 19 tuần liên tiếp đứng đầu bảng xếp hạng Billboard Hot 100 với bản nhạc đồng quê trap ''Old Town Road'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/330px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ từng lập kỷ lục 19 tuần liên tiếp đứng đầu bảng xếp hạng Billboard Hot 100 với bản nhạc đồng quê trap ''Old Town Road'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  56, 560, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ kiêm rapper người Trinidad và Tobago được mệnh danh là ''Nữ hoàng nhạc Rap'' (Queen of Rap) với các bài ''Super Bass'', ''Anaconda'' là ai?', '["Doja Cat","Cardi B","Megan Thee Stallion","Nicki Minaj"]'::jsonb, 3, 'Nicki Minaj (Onika Tanya Maraj) cùng cộng đồng người hâm mộ Barbz là một trong những nghệ sĩ hip-hop có ảnh hưởng nhất thế kỷ.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ kiêm rapper người Trinidad và Tobago được mệnh danh là ''Nữ hoàng nhạc Rap'' (Queen of Rap) với các bài ''Super Bass'', ''Anaconda'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ kiêm rapper người Trinidad và Tobago được mệnh danh là ''Nữ hoàng nhạc Rap'' (Queen of Rap) với các bài ''Super Bass'', ''Anaconda'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 561, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ từng tạo nên bản song ca kinh điển ''Endless Love'' cùng Diana Ross và là tác giả của bản tình ca ''Hello'' là ai?', '["Barry White","Stevie Wonder","Lionel Richie","Marvin Gaye"]'::jsonb, 2, 'Lionel Richie là huyền thoại âm nhạc Mỹ và giám khảo lâu năm của chương trình American Idol.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ từng tạo nên bản song ca kinh điển ''Endless Love'' cùng Diana Ross và là tác giả của bản tình ca ''Hello'' là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ từng tạo nên bản song ca kinh điển ''Endless Love'' cùng Diana Ross và là tác giả của bản tình ca ''Hello'' là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 562, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ người Mỹ sở hữu chất giọng trầm ấm, tác giả bản tình ca piano nổi tiếng ''All of Me'' dành tặng người vợ Chrissy Teigen là ai?', '["John Mayer","John Legend","James Blunt","Jason Mraz"]'::jsonb, 1, 'John Legend là một trong số ít những nghệ sĩ ưu tú đạt danh hiệu EGOT (thắng đủ 4 giải Emmy, Grammy, Oscar và Tony).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/55/JohnLegend-byPhilipRomano.jpg/330px-JohnLegend-byPhilipRomano.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ sở hữu chất giọng trầm ấm, tác giả bản tình ca piano nổi tiếng ''All of Me'' dành tặng người vợ Chrissy Teigen là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/55/JohnLegend-byPhilipRomano.jpg/330px-JohnLegend-byPhilipRomano.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ người Mỹ sở hữu chất giọng trầm ấm, tác giả bản tình ca piano nổi tiếng ''All of Me'' dành tặng người vợ Chrissy Teigen là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 563, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ kiêm nhạc sĩ người Anh nào nổi tiếng với cặp kính sặc sỡ và các bản tình ca trên đàn dương cầm như ''Rocket Man'', ''Your Song''?', '["Elton John","Billy Joel","Sting","Phil Collins"]'::jsonb, 0, 'Sir Elton John là huyền thoại âm nhạc nước Anh và là tác giả nhạc phim Vua Sư Tử (''Can You Feel the Love Tonight'').',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ kiêm nhạc sĩ người Anh nào nổi tiếng với cặp kính sặc sỡ và các bản tình ca trên đàn dương cầm như ''Rocket Man'', ''Your Song''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ kiêm nhạc sĩ người Anh nào nổi tiếng với cặp kính sặc sỡ và các bản tình ca trên đàn dương cầm như ''Rocket Man'', ''Your Song''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 564, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ người Mỹ nào được mệnh danh là ''Nữ hoàng nhạc Pop (Queen of Pop)'' với các bản hit thập niên 80 như ''Like a Prayer'', ''Material Girl''?', '["Janet Jackson","Cyndi Lauper","Cher","Madonna"]'::jsonb, 3, 'Madonna được sách Kỷ lục Guinness công nhận là Nữ nghệ sĩ âm nhạc bán đĩa chạy nhất mọi thời đại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ người Mỹ nào được mệnh danh là ''Nữ hoàng nhạc Pop (Queen of Pop)'' với các bản hit thập niên 80 như ''Like a Prayer'', ''Material Girl''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/330px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ người Mỹ nào được mệnh danh là ''Nữ hoàng nhạc Pop (Queen of Pop)'' với các bản hit thập niên 80 như ''Like a Prayer'', ''Material Girl''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 565, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ nhạc đồng quê kiêm pop người Mỹ nào kết hợp với Lil Nas X trong siêu hit phá kỷ lục ''Old Town Road''?', '["Keith Urban","Blake Shelton","Billy Ray Cyrus (cha của Miley Cyrus)","Luke Combs"]'::jsonb, 2, 'Bản remix ''Old Town Road'' của Lil Nas X và Billy Ray Cyrus giữ vị trí #1 Billboard Hot 100 suốt 19 tuần liên tiếp.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/52/Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg/330px-Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ nhạc đồng quê kiêm pop người Mỹ nào kết hợp với Lil Nas X trong siêu hit phá kỷ lục ''Old Town Road''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/52/Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg/330px-Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Nam ca sĩ nhạc đồng quê kiêm pop người Mỹ nào kết hợp với Lil Nas X trong siêu hit phá kỷ lục ''Old Town Road''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 566, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ SZA kết hợp cùng Kendrick Lamar trong ca khúc nhạc phim ''Black Panther'' nổi tiếng nào?', '["Sunflower","All the Stars","Kill Bill","Snooze"]'::jsonb, 1, '''All the Stars'' của Kendrick Lamar và SZA được đề cử giải Oscar cho Ca khúc nhạc phim xuất sắc nhất.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ SZA kết hợp cùng Kendrick Lamar trong ca khúc nhạc phim ''Black Panther'' nổi tiếng nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ SZA kết hợp cùng Kendrick Lamar trong ca khúc nhạc phim ''Black Panther'' nổi tiếng nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 567, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ Post Malone kết hợp với Swae Lee trong ca khúc nhạc phim hoạt hình ''Spider-Man: Into the Spider-Verse'' nào?', '["Sunflower","Circles","Rockstar","Congratulations"]'::jsonb, 0, '''Sunflower'' là đĩa đơn đầu tiên trong lịch sử RIAA đạt chứng nhận Kim cương kép (20x Platinum).',
  'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ Post Malone kết hợp với Swae Lee trong ca khúc nhạc phim hoạt hình ''Spider-Man: Into the Spider-Verse'' nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ Post Malone kết hợp với Swae Lee trong ca khúc nhạc phim hoạt hình ''Spider-Man: Into the Spider-Verse'' nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 568, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ Lana Del Rey nổi tiếng với phong cách âm nhạc hoài cổ (cinematic pop) và bản hit năm 2012 nào?', '["Video Games","Born to Die","Young and Beautiful","Summertime Sadness"]'::jsonb, 3, '''Summertime Sadness'' và album ''Born to Die'' đã định hình phong cách âm nhạc đặc trưng của Lana Del Rey.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Lana Del Rey nổi tiếng với phong cách âm nhạc hoài cổ (cinematic pop) và bản hit năm 2012 nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Lana Del Rey nổi tiếng với phong cách âm nhạc hoài cổ (cinematic pop) và bản hit năm 2012 nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 569, 'Đoán tên ca sĩ nổi tiếng', 'Tại Việt Nam, bốn nữ ca sĩ Thanh Lam, Hồng Nhung, Mỹ Linh và Trần Thu Hà được giới chuyên môn tôn vinh là gì?', '["Tứ đại mỹ nhân","Bộ tứ hoàn hảo","Bốn Diva nhạc Việt","Nữ hoàng nhạc nhẹ"]'::jsonb, 2, 'Thanh Lam, Hồng Nhung, Mỹ Linh và Hà Trần là 4 Diva tiêu biểu của nền nhạc nhẹ Việt Nam đương đại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Tại Việt Nam, bốn nữ ca sĩ Thanh Lam, Hồng Nhung, Mỹ Linh và Trần Thu Hà được giới chuyên môn tôn vinh là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Tại Việt Nam, bốn nữ ca sĩ Thanh Lam, Hồng Nhung, Mỹ Linh và Trần Thu Hà được giới chuyên môn tôn vinh là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  57, 570, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ Hồng Nhung có tên gọi thân mật gắn liền với tuổi thơ ở Hà Nội là gì?', '["Họa mi tóc nâu","Cô Bống","Tóc ngắn","Chim sơn ca"]'::jsonb, 1, 'Diva Hồng Nhung có biệt danh thân mật là ''Bống'' và được nhạc sĩ Trịnh Công Sơn viết tặng bài ''Bống bồng ơi''.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Hồng Nhung có tên gọi thân mật gắn liền với tuổi thơ ở Hà Nội là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Hồng Nhung có tên gọi thân mật gắn liền với tuổi thơ ở Hà Nội là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 571, 'Đoán tên ca sĩ nổi tiếng', 'Nữ ca sĩ Mỹ Linh gắn liền với hình ảnh và bản hit thương hiệu nào do nhạc sĩ Anh Quân - Huy Tuấn sáng tác?', '["Tóc ngắn","Giọt sương trên mí mắt","Ước gì","Hương ngọc lan"]'::jsonb, 0, 'Album và ca khúc ''Tóc ngắn'' đã tạo nên cuộc cách mạng nhạc R&B/Soul tại Việt Nam cuối thập niên 90.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Mỹ Linh gắn liền với hình ảnh và bản hit thương hiệu nào do nhạc sĩ Anh Quân - Huy Tuấn sáng tác?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nữ ca sĩ Mỹ Linh gắn liền với hình ảnh và bản hit thương hiệu nào do nhạc sĩ Anh Quân - Huy Tuấn sáng tác?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 572, 'Đoán tên ca sĩ nổi tiếng', 'Nam ca sĩ Tùng Dương nổi tiếng với phong cách âm nhạc dân gian đương đại và bản hit viral năm 2024 nào do Đông Thiên Đức sáng tác?', '["Ngày chưa giông bão","Chiếc khăn Piêu","Con cò","Tái sinh"]'::jsonb, 3, 'Ca khúc ''Tái sinh'' và ''Một vòng Việt Nam'' qua giọng hát Tùng Dương đã tạo nên cơn sốt lớn năm 2024.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam ca sĩ Tùng Dương nổi tiếng với phong cách âm nhạc dân gian đương đại và bản hit viral năm 2024 nào do Đông Thiên Đức sáng tác?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/330px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png' WHERE lower(trim(prompt)) = lower('Nam ca sĩ Tùng Dương nổi tiếng với phong cách âm nhạc dân gian đương đại và bản hit viral năm 2024 nào do Đông Thiên Đức sáng tác?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 573, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh có doanh thu phòng vé cao nhất lịch sử điện ảnh thế giới (gần 3 tỷ USD) của đạo diễn James Cameron là gì?', '["Avengers: Endgame","Avatar (2009)","Titanic (1997)","Star Wars: The Force Awakens"]'::jsonb, 1, 'Avatar lấy bối cảnh mặt trăng Pandora xinh đẹp của tộc người Na''vi đã cách mạng hóa công nghệ chiếu phim 3D toàn cầu.',
  'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh có doanh thu phòng vé cao nhất lịch sử điện ảnh thế giới (gần 3 tỷ USD) của đạo diễn James Cameron là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh có doanh thu phòng vé cao nhất lịch sử điện ảnh thế giới (gần 3 tỷ USD) của đạo diễn James Cameron là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 574, 'Phim Mỹ & Phim Việt Nam', 'Trong Vũ trụ Điện ảnh Marvel (MCU), siêu anh hùng tỷ phú thiên tài mặc bộ giáp đỏ vàng mở màn cho kỷ nguyên MCU năm 2008 là ai?', '["Iron Man (Tony Stark do Robert Downey Jr. đóng)","Captain America (Steve Rogers)","Thor Odinson","Hulk (Bruce Banner)"]'::jsonb, 0, 'Câu nói kết màn lịch sử ''I am Iron Man'' (Tôi là Người Sắt) đã khai sinh ra đế chế siêu anh hùng vĩ đại nhất lịch sử điện ảnh.',
  'https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong Vũ trụ Điện ảnh Marvel (MCU), siêu anh hùng tỷ phú thiên tài mặc bộ giáp đỏ vàng mở màn cho kỷ nguyên MCU năm 2008 là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png' WHERE lower(trim(prompt)) = lower('Trong Vũ trụ Điện ảnh Marvel (MCU), siêu anh hùng tỷ phú thiên tài mặc bộ giáp đỏ vàng mở màn cho kỷ nguyên MCU năm 2008 là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 575, 'Phim Mỹ & Phim Việt Nam', 'Chiếc găng tay Vô cực (Infinity Gauntlet) trong ''Avengers: Infinity War'' cần gắn đủ bao nhiêu viên đá Vô cực để thực hiện cú búng tay quét sạch nửa vũ trụ?', '["4 viên đá Vô cực","5 viên đá Vô cực","7 viên đá Vô cực","6 viên đá Vô cực"]'::jsonb, 3, 'Sáu viên đá vô cực gồm: Không gian, Tâm trí, Thực tại, Sức mạnh, Thời gian và Linh hồn.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Chiếc găng tay Vô cực (Infinity Gauntlet) trong ''Avengers: Infinity War'' cần gắn đủ bao nhiêu viên đá Vô cực để thực hiện cú búng tay quét sạch nửa vũ trụ?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Chiếc găng tay Vô cực (Infinity Gauntlet) trong ''Avengers: Infinity War'' cần gắn đủ bao nhiêu viên đá Vô cực để thực hiện cú búng tay quét sạch nửa vũ trụ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 576, 'Phim Mỹ & Phim Việt Nam', 'Trong bộ phim kinh điển Titanic (1997), sợi dây chuyền kim cương màu xanh quý giá mà nàng Rose đeo trên ngực có tên là gì?', '["Đá mặt trời","Viên ngọc Poseidon","Trái Tim Đại Dương (The Heart of the Ocean)","Kim cương xanh Hy Vọng"]'::jsonb, 2, 'Sợi dây chuyền Trái Tim Đại Dương từng thuộc sở hữu của Vua Louis XVI là chứng nhân cho tình yêu bất tử giữa Jack và Rose.',
  'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim kinh điển Titanic (1997), sợi dây chuyền kim cương màu xanh quý giá mà nàng Rose đeo trên ngực có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png' WHERE lower(trim(prompt)) = lower('Trong bộ phim kinh điển Titanic (1997), sợi dây chuyền kim cương màu xanh quý giá mà nàng Rose đeo trên ngực có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 577, 'Phim Mỹ & Phim Việt Nam', 'Ai là đạo diễn tài hoa đứng sau hai siêu phẩm vượt mốc 2 tỷ USD doanh thu là Titanic (1997) và Avatar (2009)?', '["Steven Spielberg","James Cameron","Christopher Nolan","Martin Scorsese"]'::jsonb, 1, 'James Cameron được mệnh danh là ''Vua phòng vé'' và nhà thám hiểm đáy đại dương kiệt xuất.',
  'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là đạo diễn tài hoa đứng sau hai siêu phẩm vượt mốc 2 tỷ USD doanh thu là Titanic (1997) và Avatar (2009)?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png' WHERE lower(trim(prompt)) = lower('Ai là đạo diễn tài hoa đứng sau hai siêu phẩm vượt mốc 2 tỷ USD doanh thu là Titanic (1997) và Avatar (2009)?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 578, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh Việt Nam đầu tiên trong lịch sử cán mốc doanh thu hơn 500 tỷ đồng tại rạp chiếu nước nhà do Trấn Thành đạo diễn vào dịp Tết 2024 là phim gì?', '["Mai","Bố Già","Nhà Bà Nữ","Lật Mặt 7"]'::jsonb, 0, 'Phim ''Mai'' với sự tham gia của Phương Anh Đào và Tuấn Trần đã tạo nên cơn sốt phòng vé kỷ lục với 520 tỷ đồng doanh thu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam đầu tiên trong lịch sử cán mốc doanh thu hơn 500 tỷ đồng tại rạp chiếu nước nhà do Trấn Thành đạo diễn vào dịp Tết 2024 là phim gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam đầu tiên trong lịch sử cán mốc doanh thu hơn 500 tỷ đồng tại rạp chiếu nước nhà do Trấn Thành đạo diễn vào dịp Tết 2024 là phim gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 579, 'Phim Mỹ & Phim Việt Nam', 'Loạt phim hành động giải trí ăn khách nhất Việt Nam mang thương hiệu ''Lật Mặt'' do đạo diễn nào sáng lập và sản xuất?', '["Nguyễn Quang Dũng","Victor Vũ","Charlie Nguyễn","Lý Hải (Lý Hải Production)"]'::jsonb, 3, 'Lý Hải cùng người vợ Minh Hà đã gây dựng thương hiệu ''Lật Mặt'' từ phần 1 đến phần 7 thu về hàng nghìn tỷ đồng doanh thu.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Loạt phim hành động giải trí ăn khách nhất Việt Nam mang thương hiệu ''Lật Mặt'' do đạo diễn nào sáng lập và sản xuất?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Loạt phim hành động giải trí ăn khách nhất Việt Nam mang thương hiệu ''Lật Mặt'' do đạo diễn nào sáng lập và sản xuất?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  58, 580, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim chuyển thể từ tác phẩm văn học cùng tên của nhà văn Nguyễn Nhật Ánh lấy bối cảnh làng Đo Đo mộng mơ là phim gì?', '["Cô Gái Đến Từ Hôm Qua","Tôi Thấy Hoa Vàng Trên Cỏ Xanh","Mắt Biếc","Kính Vạn Hoa"]'::jsonb, 2, 'Mắt Biếc do đạo diễn Victor Vũ dàn dựng kể về mối tình si đơn phương cả một đời của thầy giáo Ngạn dành cho cô bạn Hà Lan có đôi mắt biếc.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim chuyển thể từ tác phẩm văn học cùng tên của nhà văn Nguyễn Nhật Ánh lấy bối cảnh làng Đo Đo mộng mơ là phim gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/330px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png' WHERE lower(trim(prompt)) = lower('Bộ phim chuyển thể từ tác phẩm văn học cùng tên của nhà văn Nguyễn Nhật Ánh lấy bối cảnh làng Đo Đo mộng mơ là phim gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 581, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hành động võ thuật nào của Ngô Thanh Vân (đóng vai Hai Phượng) từng được chiếu tại các rạp phim Mỹ và đạt doanh thu 200 tỷ đồng?', '["Dòng Máu Anh Hùng","Hai Phượng (Furie)","Bẫy Rồng","Thanh Sói"]'::jsonb, 1, 'Ngô Thanh Vân vào vai người mẹ miền Tây kiên cường đơn thương độc mã truy đuổi đường dây bắt cóc trẻ em xuyên quốc gia.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2f/Ng%C3%B4_Thanh_V%C3%A2n.png/330px-Ng%C3%B4_Thanh_V%C3%A2n.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hành động võ thuật nào của Ngô Thanh Vân (đóng vai Hai Phượng) từng được chiếu tại các rạp phim Mỹ và đạt doanh thu 200 tỷ đồng?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2f/Ng%C3%B4_Thanh_V%C3%A2n.png/330px-Ng%C3%B4_Thanh_V%C3%A2n.png' WHERE lower(trim(prompt)) = lower('Bộ phim hành động võ thuật nào của Ngô Thanh Vân (đóng vai Hai Phượng) từng được chiếu tại các rạp phim Mỹ và đạt doanh thu 200 tỷ đồng?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 582, 'Phim Mỹ & Phim Việt Nam', 'Trong loạt phim Harry Potter, cậu bé Harry theo học tại trường Pháp thuật và Ma thuật nào?', '["Hogwarts","Beauxbatons","Durmstrang","Ilvermorny"]'::jsonb, 0, 'Trường Hogwarts với bốn nhà Gryffindor, Hufflepuff, Ravenclaw và Slytherin là thánh địa phù thủy tuổi thơ.',
  'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong loạt phim Harry Potter, cậu bé Harry theo học tại trường Pháp thuật và Ma thuật nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong loạt phim Harry Potter, cậu bé Harry theo học tại trường Pháp thuật và Ma thuật nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 583, 'Phim Mỹ & Phim Việt Nam', 'Môn thể thao cưỡi chổi bay thịnh hành nhất trong thế giới phù thủy Harry Potter có tên là gì?', '["Skyball","Bóng chổi","Phi kiếm","Quidditch"]'::jsonb, 3, 'Môn Quidditch với 7 cầu thủ mỗi đội, trong đó tầm thủ có nhiệm vụ săn tìm và bắt được trái bóng Snitch Vàng (Golden Snitch).',
  'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Môn thể thao cưỡi chổi bay thịnh hành nhất trong thế giới phù thủy Harry Potter có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg' WHERE lower(trim(prompt)) = lower('Môn thể thao cưỡi chổi bay thịnh hành nhất trong thế giới phù thủy Harry Potter có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 584, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim khoa học viễn tưởng ''Hố Đen Tử Thần'' (Interstellar 2014) của đạo diễn Christopher Nolan khám phá hiện tượng vũ trụ nào?', '["Du hành về thời khủng long","Người ngoài hành tinh xâm lăng Trái Đất","Lỗ giun (Wormhole) và sự giãn nở thời gian do lực hấp dẫn","Va chạm thiên thạch"]'::jsonb, 2, 'Interstellar dựa trên các nghiên cứu vật lý lý thuyết của nhà khoa học đoạt giải Nobel Kip Thorne về lỗ đen Gargantua.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim khoa học viễn tưởng ''Hố Đen Tử Thần'' (Interstellar 2014) của đạo diễn Christopher Nolan khám phá hiện tượng vũ trụ nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim khoa học viễn tưởng ''Hố Đen Tử Thần'' (Interstellar 2014) của đạo diễn Christopher Nolan khám phá hiện tượng vũ trụ nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 585, 'Phim Mỹ & Phim Việt Nam', 'Vật định vị (totem) giúp nhân vật Dom Cobb kiểm tra xem mình đang ở trong thế giới thực hay trong giấc mơ của phim ''Inception'' là gì?', '["Một đồng xu bạc","Một con quay kim loại nhỏ","Một con xúc xắc","Một quân cờ vua"]'::jsonb, 1, 'Nếu con quay tiếp tục quay mãi không bao giờ dừng lại thì Cobb biết mình vẫn đang mắc kẹt trong tầng giấc mơ.',
  'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Vật định vị (totem) giúp nhân vật Dom Cobb kiểm tra xem mình đang ở trong thế giới thực hay trong giấc mơ của phim ''Inception'' là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg' WHERE lower(trim(prompt)) = lower('Vật định vị (totem) giúp nhân vật Dom Cobb kiểm tra xem mình đang ở trong thế giới thực hay trong giấc mơ của phim ''Inception'' là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 586, 'Phim Mỹ & Phim Việt Nam', 'Trong ''Kỵ Sĩ Bóng Đêm'' (The Dark Knight 2008), cố diễn viên Heath Ledger đã đoạt giải Oscar cho vai diễn phản diện huyền thoại nào?', '["Joker","Bane","Two-Face","Scarecrow"]'::jsonb, 0, 'Vai diễn Joker với nụ cười sẹo và câu hỏi ''Why so serious?'' của Heath Ledger đã trở thành tượng đài phản diện vĩ đại nhất lịch sử điện ảnh.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Heath_Ledger_as_the_Joker.jpg/640px-Heath_Ledger_as_the_Joker.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Kỵ Sĩ Bóng Đêm'' (The Dark Knight 2008), cố diễn viên Heath Ledger đã đoạt giải Oscar cho vai diễn phản diện huyền thoại nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Heath_Ledger_as_the_Joker.jpg/640px-Heath_Ledger_as_the_Joker.jpg' WHERE lower(trim(prompt)) = lower('Trong ''Kỵ Sĩ Bóng Đêm'' (The Dark Knight 2008), cố diễn viên Heath Ledger đã đoạt giải Oscar cho vai diễn phản diện huyền thoại nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 587, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hài lãng mạn Việt Nam nào năm 2017 do Kaity Nguyễn và Kiều Minh Tuấn đóng chính đã tạo nên cơn sốt phòng vé bất ngờ?', '["Cua Lại Vợ Bầu","Tiệc Trăng Máu","Gái Già Lắm Chiêu","Em Chưa 18"]'::jsonb, 3, '''Em Chưa 18'' của đạo diễn Lê Thanh Sơn lập kỷ lục doanh thu phim Việt ăn khách nhất thời điểm bấy giờ (171 tỷ đồng).',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hài lãng mạn Việt Nam nào năm 2017 do Kaity Nguyễn và Kiều Minh Tuấn đóng chính đã tạo nên cơn sốt phòng vé bất ngờ?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hài lãng mạn Việt Nam nào năm 2017 do Kaity Nguyễn và Kiều Minh Tuấn đóng chính đã tạo nên cơn sốt phòng vé bất ngờ?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 588, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim ''Tiệc Trăng Máu'' (2020) xoay quanh trò chơi nguy hiểm nào giữa nhóm bạn thân trên bàn tiệc?', '["Kể lại bí mật đen tối nhất thời đi học","Chơi cờ vua đặt cược tiền","Công khai tất cả tin nhắn, cuộc gọi và email nhận được trong bữa tiệc","Đoán tên người yêu cũ"]'::jsonb, 2, 'Chiếc điện thoại thông minh trở thành ''hộp đen'' phơi bày mọi dối trá ẩn giấu đằng sau vỏ bọc gia đình hạnh phúc.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim ''Tiệc Trăng Máu'' (2020) xoay quanh trò chơi nguy hiểm nào giữa nhóm bạn thân trên bàn tiệc?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim ''Tiệc Trăng Máu'' (2020) xoay quanh trò chơi nguy hiểm nào giữa nhóm bạn thân trên bàn tiệc?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 589, 'Phim Mỹ & Phim Việt Nam', 'Trong phim điện ảnh kinh dị ''Lật Mặt 7: Một Điều Ước'' của Lý Hải, câu chuyện cảm động xoay quanh người mẹ già tên gì sống tại vùng cao Lạc Dương?', '["Bà Ba","Bà Hai (73 tuổi)","Bà Tư","Bà Sáu"]'::jsonb, 1, 'Bà Hai một mình nuôi 5 người con khôn lớn, khi bà gặp tai nạn gãy chân thì câu hỏi ''Ai sẽ nuôi mẹ?'' đã lấy đi bao nước mắt khán giả.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim điện ảnh kinh dị ''Lật Mặt 7: Một Điều Ước'' của Lý Hải, câu chuyện cảm động xoay quanh người mẹ già tên gì sống tại vùng cao Lạc Dương?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim điện ảnh kinh dị ''Lật Mặt 7: Một Điều Ước'' của Lý Hải, câu chuyện cảm động xoay quanh người mẹ già tên gì sống tại vùng cao Lạc Dương?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  59, 590, 'Phim Mỹ & Phim Việt Nam', 'Ai là siêu anh hùng người nhện thân thiện của khu phố New York có tên thật là Peter Parker trong truyện tranh Marvel?', '["Spider-Man (Người Nhện)","Ant-Man","Iron Man","Deadpool"]'::jsonb, 0, 'Câu châm ngôn bất hủ của Bác Ben dạy Peter: ''With great power comes great responsibility'' (Sức mạnh càng lớn, trách nhiệm càng cao).',
  'https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'easy', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ai là siêu anh hùng người nhện thân thiện của khu phố New York có tên thật là Peter Parker trong truyện tranh Marvel?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png' WHERE lower(trim(prompt)) = lower('Ai là siêu anh hùng người nhện thân thiện của khu phố New York có tên thật là Peter Parker trong truyện tranh Marvel?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 591, 'Phim Mỹ & Phim Việt Nam', 'Diễn viên nào đã thủ vai sát thủ huyền thoại John Wick - kẻ báo thù vì chú chó cưng và chiếc xe cổ Mustang bị cướp?', '["Brad Pitt","Tom Cruise","Liam Neeson","Keanu Reeves"]'::jsonb, 3, 'Keanu Reeves với những pha hành động ''Gun-fu'' chân thực đã tạo nên thương hiệu hành động ăn khách bậc nhất Hollywood.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/330px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Diễn viên nào đã thủ vai sát thủ huyền thoại John Wick - kẻ báo thù vì chú chó cưng và chiếc xe cổ Mustang bị cướp?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/330px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Diễn viên nào đã thủ vai sát thủ huyền thoại John Wick - kẻ báo thù vì chú chó cưng và chiếc xe cổ Mustang bị cướp?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 592, 'Phim Mỹ & Phim Việt Nam', 'Ngôi sao hành động nào tự mình thực hiện hầu hết các cảnh mạo hiểm điên rồ như nhảy dù từ máy bay hay leo tháp Burj Khalifa trong loạt phim ''Mission: Impossible''?', '["Dwayne Johnson","Vin Diesel","Tom Cruise (vai Ethan Hunt)","Jason Statham"]'::jsonb, 2, 'Tom Cruise nổi tiếng khắp thế giới với tinh thần cống hiến không cần diễn viên đóng thế dù đã ngoài 60 tuổi.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/23/Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg/330px-Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Ngôi sao hành động nào tự mình thực hiện hầu hết các cảnh mạo hiểm điên rồ như nhảy dù từ máy bay hay leo tháp Burj Khalifa trong loạt phim ''Mission: Impossible''?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/23/Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg/330px-Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg' WHERE lower(trim(prompt)) = lower('Ngôi sao hành động nào tự mình thực hiện hầu hết các cảnh mạo hiểm điên rồ như nhảy dù từ máy bay hay leo tháp Burj Khalifa trong loạt phim ''Mission: Impossible''?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 593, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh ''Đất Rừng Phương Nam'' (2023) của đạo diễn Nguyễn Quang Dũng kể về hành trình đi tìm cha của cậu bé nào?', '["Thằng Cò","Bé An","Út Lục Lâm","Thằng Tí"]'::jsonb, 1, 'Bé An trong bối cảnh Nam Bộ thời kỳ chống Pháp đã gặp gỡ những con người hào sảng, trượng nghĩa vùng sông nước.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh ''Đất Rừng Phương Nam'' (2023) của đạo diễn Nguyễn Quang Dũng kể về hành trình đi tìm cha của cậu bé nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh ''Đất Rừng Phương Nam'' (2023) của đạo diễn Nguyễn Quang Dũng kể về hành trình đi tìm cha của cậu bé nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 594, 'Phim Mỹ & Phim Việt Nam', 'Trong loạt phim phiêu lưu cướp biển ''Pirates of the Caribbean'', vị thuyền trưởng lập dị mê rượu rum và chiếc la bàn chỉ điều mình mong muốn nhất là ai?', '["Captain Jack Sparrow (Johnny Depp đóng)","Hector Barbossa","Davy Jones","Will Turner"]'::jsonb, 0, 'Thuyền trưởng Jack Sparrow của con tàu Ngọc Trai Đen (Black Pearl) là vai diễn để đời làm nên tên tuổi của Johnny Depp.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Jack_sparrow_wax.jpg/640px-Jack_sparrow_wax.jpg', NULL, NULL, NULL, 'IMAGE_GUESS', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong loạt phim phiêu lưu cướp biển ''Pirates of the Caribbean'', vị thuyền trưởng lập dị mê rượu rum và chiếc la bàn chỉ điều mình mong muốn nhất là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Jack_sparrow_wax.jpg/640px-Jack_sparrow_wax.jpg' WHERE lower(trim(prompt)) = lower('Trong loạt phim phiêu lưu cướp biển ''Pirates of the Caribbean'', vị thuyền trưởng lập dị mê rượu rum và chiếc la bàn chỉ điều mình mong muốn nhất là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 595, 'Phim Mỹ & Phim Việt Nam', 'Phim điện ảnh kinh điển ''Bố Già'' (The Godfather 1972) của đạo diễn Francis Ford Coppola chuyển thể từ tiểu thuyết của nhà văn nào?', '["Arthur Conan Doyle","Stephen King","Ernest Hemingway","Mario Puzo"]'::jsonb, 3, 'Tiểu thuyết Bố Già của Mario Puzo viết về gia tộc mafia gốc Ý Corleone được xem là kiệt tác văn học và điện ảnh bất hủ.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Phim điện ảnh kinh điển ''Bố Già'' (The Godfather 1972) của đạo diễn Francis Ford Coppola chuyển thể từ tiểu thuyết của nhà văn nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Phim điện ảnh kinh điển ''Bố Già'' (The Godfather 1972) của đạo diễn Francis Ford Coppola chuyển thể từ tiểu thuyết của nhà văn nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 596, 'Phim Mỹ & Phim Việt Nam', 'Câu thoại kinh điển của Don Vito Corleone trong ''Bố Già'' khi muốn đối tác không thể từ chối là gì?', '["Gia đình là tất cả","Tiền bạc không mua được lòng trung thành","Tôi sẽ đưa ra cho hắn một lời đề nghị mà hắn không thể chối từ","Kẻ thù nguy hiểm nhất là kẻ thân cận"]'::jsonb, 2, '''I''m gonna make him an offer he can''t refuse'' được Viện phim Mỹ xếp hạng thứ 2 trong danh sách 100 câu thoại phim hay nhất mọi thời đại.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Câu thoại kinh điển của Don Vito Corleone trong ''Bố Già'' khi muốn đối tác không thể từ chối là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png' WHERE lower(trim(prompt)) = lower('Câu thoại kinh điển của Don Vito Corleone trong ''Bố Già'' khi muốn đối tác không thể từ chối là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 597, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim ''Cô Ba Sài Gòn'' (2017) của nhà sản xuất Ngô Thanh Vân tôn vinh trang phục truyền thống nào của phụ nữ Việt Nam?', '["Áo bà ba","Áo dài truyền thống","Áo tứ thân","Nón lá"]'::jsonb, 1, 'Bộ phim đưa hình ảnh tà áo dài tân thời Sài Gòn thập niên 60 và kỹ thuật may đo gia truyền nhà may Thanh Nữ lên màn ảnh rộng.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2f/Ng%C3%B4_Thanh_V%C3%A2n.png/330px-Ng%C3%B4_Thanh_V%C3%A2n.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim ''Cô Ba Sài Gòn'' (2017) của nhà sản xuất Ngô Thanh Vân tôn vinh trang phục truyền thống nào của phụ nữ Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2f/Ng%C3%B4_Thanh_V%C3%A2n.png/330px-Ng%C3%B4_Thanh_V%C3%A2n.png' WHERE lower(trim(prompt)) = lower('Bộ phim ''Cô Ba Sài Gòn'' (2017) của nhà sản xuất Ngô Thanh Vân tôn vinh trang phục truyền thống nào của phụ nữ Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 598, 'Phim Mỹ & Phim Việt Nam', 'Trong loạt phim kinh dị ''The Conjuring'' (Ám Ảnh Kinh Hoàng), con búp bê ma ám bị quỷ ám nguy hiểm nhất tên là gì?', '["Annabelle","Chucky","M3GAN","Tiffany"]'::jsonb, 0, 'Búp bê Annabelle có thật được vợ chồng nhà ngoại cảm Ed và Lorraine Warren niêm phong trong tủ kính tại bảo tàng Occult.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong loạt phim kinh dị ''The Conjuring'' (Ám Ảnh Kinh Hoàng), con búp bê ma ám bị quỷ ám nguy hiểm nhất tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong loạt phim kinh dị ''The Conjuring'' (Ám Ảnh Kinh Hoàng), con búp bê ma ám bị quỷ ám nguy hiểm nhất tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 599, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim bom tấn ''Công Viên Kỷ Jura'' (Jurassic Park 1993) của đạo diễn Steven Spielberg đã hồi sinh loài động vật tiền sử nào nhờ hổ phách muỗi cổ đại?', '["Loài dodo","Loài voi ma mút","Loài hổ răng kiếm","Loài khủng long"]'::jsonb, 3, 'Nhà khoa học trích xuất ADN khủng long từ máu trong bụng muỗi hóa thạch hổ phách để nhân bản khủng long bạo chúa T-Rex.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim bom tấn ''Công Viên Kỷ Jura'' (Jurassic Park 1993) của đạo diễn Steven Spielberg đã hồi sinh loài động vật tiền sử nào nhờ hổ phách muỗi cổ đại?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/330px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim bom tấn ''Công Viên Kỷ Jura'' (Jurassic Park 1993) của đạo diễn Steven Spielberg đã hồi sinh loài động vật tiền sử nào nhờ hổ phách muỗi cổ đại?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  60, 600, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh ''Chị Chị Em Em'' (2019) thuộc thể loại giật gân tâm lý có sự tham gia đóng chính của hai nữ diễn viên nào?', '["Kaity Nguyễn và Phương Anh Đào","Ngô Thanh Vân và Ninh Dương Lan Ngọc","Thanh Hằng và Chi Pu","Mỹ Tâm và Mai Tài Phến"]'::jsonb, 2, 'Thanh Hằng (vai Thiên Kim) và Chi Pu (vai Bảo Nhi) đã tạo nên màn đấu trí nghẹt thở cùng nam diễn viên Lãnh Thanh.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh ''Chị Chị Em Em'' (2019) thuộc thể loại giật gân tâm lý có sự tham gia đóng chính của hai nữ diễn viên nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/87/MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg/330px-MY_TAM_-_LIGHT_%26_SHADOW_LIVE_-_INAX_VIETNAM.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh ''Chị Chị Em Em'' (2019) thuộc thể loại giật gân tâm lý có sự tham gia đóng chính của hai nữ diễn viên nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 601, 'Phim Mỹ & Phim Việt Nam', 'Trong ''Chúa Tể Của Những Chiếc Nhẫn'' (The Lord of the Rings), chàng người Hobbit Frodo Baggins có nhiệm vụ đem chiếc Nhẫn Chúa tới đâu để tiêu hủy?', '["Rừng Rivendell","Ngọn núi Doom (Núi Diệt Vong tại Mordor)","Hầm mỏ Moria","Thành phố Gondor"]'::jsonb, 1, 'Chiếc Nhẫn Chúa chỉ có thể bị nung chảy và phá hủy hoàn toàn trong lòng nham thạch của Ngọn núi Diệt Vong nơi chúa tể bóng tối Sauron đã đúc ra nó.',
  'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong ''Chúa Tể Của Những Chiếc Nhẫn'' (The Lord of the Rings), chàng người Hobbit Frodo Baggins có nhiệm vụ đem chiếc Nhẫn Chúa tới đâu để tiêu hủy?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png' WHERE lower(trim(prompt)) = lower('Trong ''Chúa Tể Của Những Chiếc Nhẫn'' (The Lord of the Rings), chàng người Hobbit Frodo Baggins có nhiệm vụ đem chiếc Nhẫn Chúa tới đâu để tiêu hủy?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 602, 'Phim Mỹ & Phim Việt Nam', 'Sinh vật kỳ dị luôn lẩm bẩm câu nói ''My precious'' (Bảo bối của ta) vì bị chiếc Nhẫn Chúa làm tha hóa tâm can là ai?', '["Gollum (Sméagol)","Bilbo Baggins","Saruman","Gimli"]'::jsonb, 0, 'Gollum do diễn viên tài ba Andy Serkis đóng bằng công nghệ ghi hình chuyển động (motion capture) xuất sắc.',
  'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Sinh vật kỳ dị luôn lẩm bẩm câu nói ''My precious'' (Bảo bối của ta) vì bị chiếc Nhẫn Chúa làm tha hóa tâm can là ai?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg' WHERE lower(trim(prompt)) = lower('Sinh vật kỳ dị luôn lẩm bẩm câu nói ''My precious'' (Bảo bối của ta) vì bị chiếc Nhẫn Chúa làm tha hóa tâm can là ai?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 603, 'Phim Mỹ & Phim Việt Nam', 'Trong phim khoa học viễn tưởng ''Ma Trận'' (The Matrix 1999), nhân vật chính Neo (Keanu Reeves) đã lựa chọn uống viên thuốc màu gì để biết sự thật về thế giới?', '["Viên thuốc màu trắng","Viên thuốc màu xanh dương","Viên thuốc màu vàng","Viên thuốc màu đỏ"]'::jsonb, 3, 'Morpheus đưa ra lựa chọn: Uống viên thuốc màu xanh sẽ thức dậy trên giường và tin vào điều muốn tin; uống viên thuốc màu đỏ sẽ nhìn thấy sự thật của thế giới giả lập Ma Trận.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/330px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim khoa học viễn tưởng ''Ma Trận'' (The Matrix 1999), nhân vật chính Neo (Keanu Reeves) đã lựa chọn uống viên thuốc màu gì để biết sự thật về thế giới?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/330px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim khoa học viễn tưởng ''Ma Trận'' (The Matrix 1999), nhân vật chính Neo (Keanu Reeves) đã lựa chọn uống viên thuốc màu gì để biết sự thật về thế giới?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 604, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hoạt hình ''Nhà Chuột'' nào của Disney đoạt giải Oscar dựa trên văn hóa gia đình và phép thuật rực rỡ của đất nước Colombia?', '["Moana","Coco","Encanto (Vùng Đất Thần Kỳ)","Raya và Rồng Thần Cuối Cùng"]'::jsonb, 2, 'Encanto với ca khúc gây sốt toàn cầu ''We Don''t Talk About Bruno'' kể về gia đình Madrigal phi thường.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Nhà Chuột'' nào của Disney đoạt giải Oscar dựa trên văn hóa gia đình và phép thuật rực rỡ của đất nước Colombia?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Nhà Chuột'' nào của Disney đoạt giải Oscar dựa trên văn hóa gia đình và phép thuật rực rỡ của đất nước Colombia?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 605, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hoạt hình ''Coco'' (2017) của Pixar lấy cảm hứng từ lễ hội truyền thống nào của đất nước Mexico?', '["Lễ hội Bò tót","Lễ hội Người Chết (Día de los Muertos)","Lễ hội Mặt trời","Lễ hội Hóa trang Carnival"]'::jsonb, 1, 'Cậu bé Miguel du hành tới Vùng Đất Người Chết vào đêm Día de los Muertos và hát khúc ca xúc động ''Remember Me''.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Coco'' (2017) của Pixar lấy cảm hứng từ lễ hội truyền thống nào của đất nước Mexico?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình ''Coco'' (2017) của Pixar lấy cảm hứng từ lễ hội truyền thống nào của đất nước Mexico?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 606, 'Phim Mỹ & Phim Việt Nam', 'Trong bom tấn ''Fast & Furious'', nhân vật Dominic Toretto (Vin Diesel đóng) luôn coi điều quan trọng nhất trên đời là gì?', '["Gia đình (Family)","Tiền tài danh vọng","Tốc độ xe đua","Chiến thắng đối thủ"]'::jsonb, 0, '''Tôi không có bạn bè, tôi chỉ có gia đình'' là câu nói triết lý làm nên thương hiệu Dom Toretto suốt 10 phần phim.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bom tấn ''Fast & Furious'', nhân vật Dominic Toretto (Vin Diesel đóng) luôn coi điều quan trọng nhất trên đời là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong bom tấn ''Fast & Furious'', nhân vật Dominic Toretto (Vin Diesel đóng) luôn coi điều quan trọng nhất trên đời là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 607, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh Việt Nam ''Tro Tàn Rực Rỡ'' (2022) của đạo diễn Bùi Thạc Chuyên được chuyển thể từ truyện ngắn của nhà văn nào?', '["Nam Cao","Nguyễn Nhật Ánh","Nguyễn Huy Thiệp","Nguyễn Ngọc Tư"]'::jsonb, 3, 'Tro Tàn Rực Rỡ dựa trên hai truyện ngắn ''Tro tàn rực rỡ'' và ''Củi mục trôi về'' của nhà văn miền Tây Nguyễn Ngọc Tư, đoạt giải Khinh khí cầu Vàng tại LHP Ba Lục Địa (Pháp).',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam ''Tro Tàn Rực Rỡ'' (2022) của đạo diễn Bùi Thạc Chuyên được chuyển thể từ truyện ngắn của nhà văn nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam ''Tro Tàn Rực Rỡ'' (2022) của đạo diễn Bùi Thạc Chuyên được chuyển thể từ truyện ngắn của nhà văn nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 608, 'Phim Mỹ & Phim Việt Nam', 'Nam diễn viên gạo cội nào đã thủ vai Bố Già (ông Ba Sang) bị bệnh thận nặng trong bộ phim gia đình đạt 427 tỷ đồng doanh thu năm 2021?', '["La Thành","NSND Việt Anh","Trấn Thành","Tuấn Trần"]'::jsonb, 2, 'Trấn Thành hóa trang già nua vào vai người cha lam lũ hy sinh cả cuộc đời vì con trai Quắn (Tuấn Trần thủ vai).',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'medium', 1000, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Nam diễn viên gạo cội nào đã thủ vai Bố Già (ông Ba Sang) bị bệnh thận nặng trong bộ phim gia đình đạt 427 tỷ đồng doanh thu năm 2021?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/330px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png' WHERE lower(trim(prompt)) = lower('Nam diễn viên gạo cội nào đã thủ vai Bố Già (ông Ba Sang) bị bệnh thận nặng trong bộ phim gia đình đạt 427 tỷ đồng doanh thu năm 2021?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 609, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh đoạt giải Phim hay nhất tại Oscar 2024 về ''cha đẻ của bom nguyên tử'' do Christopher Nolan đạo diễn là phim gì?', '["Barbie","Oppenheimer","Killers of the Flower Moon","Poor Things"]'::jsonb, 1, 'Cillian Murphy đã xuất sắc đoạt giải Oscar Nam chính xuất sắc nhất cho vai diễn nhà vật lý lý thuyết J. Robert Oppenheimer.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh đoạt giải Phim hay nhất tại Oscar 2024 về ''cha đẻ của bom nguyên tử'' do Christopher Nolan đạo diễn là phim gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/330px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh đoạt giải Phim hay nhất tại Oscar 2024 về ''cha đẻ của bom nguyên tử'' do Christopher Nolan đạo diễn là phim gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  61, 610, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hài hước ''Ở Nhà Một Mình'' (Home Alone 1990) kể về cậu bé 8 tuổi thông minh dũng cảm bảo vệ ngôi nhà trước hai tên trộm tên là gì?', '["Kevin McCallister (Macaulay Culkin đóng)","Harry","Marv","Buzz"]'::jsonb, 0, 'Kevin bị gia đình vô tình bỏ quên ở nhà trong chuyến du lịch Giáng sinh tới Paris và đã giăng bẫy tơi bời hai tên trộm ngốc.',
  'https://upload.wikimedia.org/wikipedia/en/7/76/Home_alone_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hài hước ''Ở Nhà Một Mình'' (Home Alone 1990) kể về cậu bé 8 tuổi thông minh dũng cảm bảo vệ ngôi nhà trước hai tên trộm tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/7/76/Home_alone_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hài hước ''Ở Nhà Một Mình'' (Home Alone 1990) kể về cậu bé 8 tuổi thông minh dũng cảm bảo vệ ngôi nhà trước hai tên trộm tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 611, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim kinh điển ''Forrest Gump'' (1994) do nam tài tử Tom Hanks đóng chính có câu nói triết lý nổi tiếng về hộp socola là gì?', '["Hạnh phúc ở trong tim","Hãy chạy không ngừng nghỉ","Thời gian là vàng bạc","Cuộc đời giống như một hộp kẹo sôcôla, bạn không bao giờ biết mình sẽ nhận được vị gì"]'::jsonb, 3, '''Life was like a box of chocolates. You never know what you''re gonna get'' là câu nói bất hủ của mẹ Forrest Gump.',
  'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim kinh điển ''Forrest Gump'' (1994) do nam tài tử Tom Hanks đóng chính có câu nói triết lý nổi tiếng về hộp socola là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim kinh điển ''Forrest Gump'' (1994) do nam tài tử Tom Hanks đóng chính có câu nói triết lý nổi tiếng về hộp socola là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 612, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim kinh dị tâm lý ''Sự Im Lặng Của Bầy Cừu'' (The Silence of the Lambs 1991) nổi tiếng với bác sĩ tâm thần ăn thịt người tên là gì?', '["Jack Torrance","Norman Bates","Bác sĩ Hannibal Lecter (Anthony Hopkins đóng)","Freddy Krueger"]'::jsonb, 2, 'Anthony Hopkins chỉ xuất hiện vỏn vẹn 16 phút trên màn ảnh nhưng đã giành giải Oscar Nam chính xuất sắc nhất.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim kinh dị tâm lý ''Sự Im Lặng Của Bầy Cừu'' (The Silence of the Lambs 1991) nổi tiếng với bác sĩ tâm thần ăn thịt người tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim kinh dị tâm lý ''Sự Im Lặng Của Bầy Cừu'' (The Silence of the Lambs 1991) nổi tiếng với bác sĩ tâm thần ăn thịt người tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 613, 'Phim Mỹ & Phim Việt Nam', 'Trong phim điện ảnh hoạt hình ''Bên Trong Vỏ Não'' (Inside Out), 5 cảm xúc cốt lõi ban đầu trong đầu cô bé Riley là gì?', '["Love, Hate, Hope, Peace, War","Joy (Vui Vẻ), Sadness (Buồn Bã), Anger (Giận Dữ), Fear (Sợ Hãi), Disgust (Chảnh Chọe)","Happy, Cry, Sleepy, Grumpy, Dopey","Sun, Rain, Cloud, Wind, Storm"]'::jsonb, 1, 'Inside Out của Pixar đã giải thích tâm lý học cảm xúc con người một cách vô cùng sinh động, nhân văn và xúc động.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim điện ảnh hoạt hình ''Bên Trong Vỏ Não'' (Inside Out), 5 cảm xúc cốt lõi ban đầu trong đầu cô bé Riley là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/330px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg' WHERE lower(trim(prompt)) = lower('Trong phim điện ảnh hoạt hình ''Bên Trong Vỏ Não'' (Inside Out), 5 cảm xúc cốt lõi ban đầu trong đầu cô bé Riley là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 614, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh độc lập Việt Nam ''Bên Trong Vỏ Kén Vàng'' (Inside the Yellow Cocoon Shell) của đạo diễn Phạm Thiên Ân đã thắng giải thưởng danh giá nào tại LHP Cannes 2023?', '["Giải Camera Vàng (Caméra d''Or) cho phim đầu tay xuất sắc nhất","Giải Cành cọ vàng","Giải Ban giám khảo","Giải Đạo diễn xuất sắc nhất"]'::jsonb, 0, 'Đây là lần đầu tiên sau 30 năm kể từ ''Mùi Đu Đủ Xanh'' của Trần Anh Hùng (1993), điện ảnh Việt Nam lại được xướng tên giải thưởng Caméra d''Or tại Cannes.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh độc lập Việt Nam ''Bên Trong Vỏ Kén Vàng'' (Inside the Yellow Cocoon Shell) của đạo diễn Phạm Thiên Ân đã thắng giải thưởng danh giá nào tại LHP Cannes 2023?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh độc lập Việt Nam ''Bên Trong Vỏ Kén Vàng'' (Inside the Yellow Cocoon Shell) của đạo diễn Phạm Thiên Ân đã thắng giải thưởng danh giá nào tại LHP Cannes 2023?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 615, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim Hàn Quốc đầu tiên trong lịch sử giành giải Oscar ''Phim hay nhất (Best Picture)'' năm 2020 là bộ phim nào?', '["Train to Busan","Minari","Oldboy","Parasite (Ký sinh trùng)"]'::jsonb, 3, '''Parasite'' của đạo diễn Bong Joon-ho đã làm nên lịch sử với 4 tượng vàng Oscar danh giá.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim Hàn Quốc đầu tiên trong lịch sử giành giải Oscar ''Phim hay nhất (Best Picture)'' năm 2020 là bộ phim nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim Hàn Quốc đầu tiên trong lịch sử giành giải Oscar ''Phim hay nhất (Best Picture)'' năm 2020 là bộ phim nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 616, 'Phim Mỹ & Phim Việt Nam', 'Trong bộ phim ''Everything Everywhere All at Once (Cuộc chiến đa vũ trụ)'', nữ diễn viên gốc Á nào đã giành giải Oscar Nữ chính xuất sắc nhất?', '["Củng Lợi","Lưu Diệc Phi","Dương Tử Quỳnh (Michelle Yeoh)","Chương Tử Di"]'::jsonb, 2, 'Dương Tử Quỳnh trở thành nữ diễn viên gốc Á đầu tiên giành giải Oscar Nữ diễn viên chính xuất sắc nhất.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Everything Everywhere All at Once (Cuộc chiến đa vũ trụ)'', nữ diễn viên gốc Á nào đã giành giải Oscar Nữ chính xuất sắc nhất?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/330px-Liu_Yifei_attended_the_brand_event.jpg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Everything Everywhere All at Once (Cuộc chiến đa vũ trụ)'', nữ diễn viên gốc Á nào đã giành giải Oscar Nữ chính xuất sắc nhất?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 617, 'Phim Mỹ & Phim Việt Nam', 'Trong bộ phim ''Lật mặt 7: Một điều ước'' (2024) của đạo diễn Lý Hải, nhân vật chính bà Hai có bao nhiêu người con?', '["3 người con","5 người con","4 người con","7 người con"]'::jsonb, 1, 'Bà Hai (nghệ sĩ Thanh Hiền đóng) có 5 người con sinh sống ở các vùng miền khác nhau.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Lật mặt 7: Một điều ước'' (2024) của đạo diễn Lý Hải, nhân vật chính bà Hai có bao nhiêu người con?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/330px-Ly_hai_1_%28cropped%29.jpg' WHERE lower(trim(prompt)) = lower('Trong bộ phim ''Lật mặt 7: Một điều ước'' (2024) của đạo diễn Lý Hải, nhân vật chính bà Hai có bao nhiêu người con?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 618, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim điện ảnh Việt Nam ''Đất rừng phương Nam'' (2023) được đạo diễn Nguyễn Quang Dũng lấy cảm hứng từ tiểu thuyết của nhà văn nào?', '["Đoàn Giỏi","Sơn Nam","Tô Hoài","Nguyễn Nhật Ánh"]'::jsonb, 0, 'Tiểu thuyết ''Đất rừng phương Nam'' (1957) của nhà văn Đoàn Giỏi kể về hành trình tìm cha của cậu bé An.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam ''Đất rừng phương Nam'' (2023) được đạo diễn Nguyễn Quang Dũng lấy cảm hứng từ tiểu thuyết của nhà văn nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim điện ảnh Việt Nam ''Đất rừng phương Nam'' (2023) được đạo diễn Nguyễn Quang Dũng lấy cảm hứng từ tiểu thuyết của nhà văn nào?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 619, 'Phim Mỹ & Phim Việt Nam', 'Trong phim truyền hình và điện ảnh ''Đất rừng phương Nam'', cậu bé nhân vật chính đi tìm cha có tên là gì?', '["Đạt","Cò","Xinh","Bé An"]'::jsonb, 3, 'Hành trình của bé An và người bạn thân tên Cò giữa vùng sông nước miền Tây đã đi vào ký ức nhiều thế hệ.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong phim truyền hình và điện ảnh ''Đất rừng phương Nam'', cậu bé nhân vật chính đi tìm cha có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong phim truyền hình và điện ảnh ''Đất rừng phương Nam'', cậu bé nhân vật chính đi tìm cha có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  62, 620, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim ''Tôi thấy hoa vàng trên cỏ xanh'' (2015) của đạo diễn Victor Vũ được quay chủ yếu tại tỉnh nào của Việt Nam?', '["Lâm Đồng","Quảng Nam","Phú Yên","Ninh Bình"]'::jsonb, 2, 'Sau khi bộ phim ra mắt, tỉnh Phú Yên được mệnh danh là ''Xứ sở hoa vàng cỏ xanh''.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim ''Tôi thấy hoa vàng trên cỏ xanh'' (2015) của đạo diễn Victor Vũ được quay chủ yếu tại tỉnh nào của Việt Nam?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim ''Tôi thấy hoa vàng trên cỏ xanh'' (2015) của đạo diễn Victor Vũ được quay chủ yếu tại tỉnh nào của Việt Nam?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  63, 621, 'Phim Mỹ & Phim Việt Nam', 'Trong vũ trụ điện ảnh Marvel (MCU), kim loại quý hiếm nhất dùng để chế tạo chiếc khiên của Captain America và xây dựng đất nước Wakanda tên là gì?', '["Adamantium","Vibranium","Uru","Kryptonite"]'::jsonb, 1, 'Vibranium là kim loại hấp thụ chấn động có nguồn gốc từ thiên thạch rơi xuống Wakanda.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong vũ trụ điện ảnh Marvel (MCU), kim loại quý hiếm nhất dùng để chế tạo chiếc khiên của Captain America và xây dựng đất nước Wakanda tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Trong vũ trụ điện ảnh Marvel (MCU), kim loại quý hiếm nhất dùng để chế tạo chiếc khiên của Captain America và xây dựng đất nước Wakanda tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  63, 622, 'Phim Mỹ & Phim Việt Nam', 'Trong truyện tranh và phim DC, điểm yếu chí mạng của Siêu Nhân (Superman) là đá phóng xạ màu xanh lá cây có tên là gì?', '["Kryptonite","Vibranium","Tesseract","Beskar"]'::jsonb, 0, 'Đá Kryptonite là mảnh vỡ từ hành tinh quê hương Krypton của Superman, làm anh mất đi siêu năng lực.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, true, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong truyện tranh và phim DC, điểm yếu chí mạng của Siêu Nhân (Superman) là đá phóng xạ màu xanh lá cây có tên là gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/330px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png' WHERE lower(trim(prompt)) = lower('Trong truyện tranh và phim DC, điểm yếu chí mạng của Siêu Nhân (Superman) là đá phóng xạ màu xanh lá cây có tên là gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  63, 623, 'Phim Mỹ & Phim Việt Nam', 'Trong loạt phim ''Fast & Furious (Quá nhanh quá nguy hiểm)'', câu nói cửa miệng nổi tiếng nhất của nhân vật Dominic Toretto (Vin Diesel) là về điều gì?', '["Vận may (Luck)","Tiền bạc (Money)","Danh vọng (Fame)","Gia đình (Family)"]'::jsonb, 3, '''Nothing is stronger than family'' (Không gì quan trọng hơn gia đình) là biểu tượng của nhân vật Dom Toretto.',
  'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Trong loạt phim ''Fast & Furious (Quá nhanh quá nguy hiểm)'', câu nói cửa miệng nổi tiếng nhất của nhân vật Dominic Toretto (Vin Diesel) là về điều gì?')
);
UPDATE public.quiz_questions SET image_url = 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg' WHERE lower(trim(prompt)) = lower('Trong loạt phim ''Fast & Furious (Quá nhanh quá nguy hiểm)'', câu nói cửa miệng nổi tiếng nhất của nhân vật Dominic Toretto (Vin Diesel) là về điều gì?') AND (image_url IS NULL OR image_url = '');
INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  63, 624, 'Phim Mỹ & Phim Việt Nam', 'Bộ phim hoạt hình/nhạc kịch ''La La Land (Những kẻ khờ mộng mơ)'' có sự tham gia của cặp đôi diễn viên chính nào?', '["Bradley Cooper và Lady Gaga","Leonardo DiCaprio và Kate Winslet","Ryan Gosling và Emma Stone","Timothée Chalamet và Zendaya"]'::jsonb, 2, 'Ryan Gosling và Emma Stone đã mang đến màn trình diễn tuyệt vời trong ''La La Land'' của đạo diễn Damien Chazelle.',
  'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/330px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg', NULL, NULL, NULL, 'MULTIPLE_CHOICE', 'hard', 1200, 20, NULL, false, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình/nhạc kịch ''La La Land (Những kẻ khờ mộng mơ)'' có sự tham gia của cặp đôi diễn viên chính nào?')
);
UPDATE public.quiz_questions SET image_url = 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/330px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg' WHERE lower(trim(prompt)) = lower('Bộ phim hoạt hình/nhạc kịch ''La La Land (Những kẻ khờ mộng mơ)'' có sự tham gia của cặp đôi diễn viên chính nào?') AND (image_url IS NULL OR image_url = '');

DO $$
DECLARE
  v_total int;
BEGIN
  SELECT count(*) INTO v_total FROM public.quiz_questions WHERE active = true;
  RAISE NOTICE 'Đã nạp xong ngân hàng câu hỏi. Tổng số câu hỏi hiện có: %', v_total;
END $$;
