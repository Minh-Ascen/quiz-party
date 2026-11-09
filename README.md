# Quiz Party — Multiplayer Gameshow Platform 🎮🎉

**Quiz Party** là nền tảng Gameshow trắc nghiệm giải trí trực tuyến nhiều người chơi (Multiplayer Online Quiz) thời gian thực, phong cách Kahoot & Quizizz, hỗ trợ tối đa 50 người chơi cùng lúc trên cả điện thoại di động và máy tính laptop.

---

## 🌟 TÍNH NĂNG NỔI BẬT ĐÃ NÂNG CẤP

### 1. Ngân Hàng 504 Câu Hỏi Đa Chủ Đề
- Sở hữu **504 câu hỏi chất lượng cao** được biên soạn công phu, không trùng lặp, chia đều cho **12 nhóm chủ đề bắt buộc**:
  1. **Doraemon**: Bảo bối kỳ diệu, nhân vật, tác giả, cốt truyện, ảnh nhận diện.
  2. **Conan – Thám tử lừng danh**: Tổ chức Áo Đen, FBI, cảnh sát Tokyo/Osaka, vụ án kinh điển.
  3. **Phim Hàn Quốc (K-Drama)**: Hạ Cánh Nơi Anh, Squid Game, Hậu Duệ Mặt Trời, Goblin, Reply 1988, The Glory, Queen of Tears...
  4. **Âm nhạc Việt Nam**: Sơn Tùng M-TP, Mỹ Tâm, Đen Vâu, Hoàng Thùy Linh, Soobin, nhạc Trịnh, nhạc trẻ 2000s–2020s.
  5. **K-Pop**: BTS, BLACKPINK, TWICE, NewJeans, EXO, BIGBANG, SNSD, IVE, aespa...
  6. **US-UK**: Michael Jackson, Taylor Swift, Adele, Ed Sheeran, Queen, The Beatles, Billie Eilish, Eminem...
  7. **Địa lý cơ bản**: Quốc kỳ, thủ đô, kỳ quan thế giới (Kim tự tháp, Taj Mahal...), địa danh và hang động Việt Nam.
  8. **Hoạt hình tuổi thơ Nhật Bản**: Pokémon, One Piece, Naruto, 7 Viên Ngọc Rồng, Shin, Thủy thủ Mặt Trăng, Ghibli...
  9. **Phim & hoạt hình tuổi thơ Trung Quốc**: Tây Du Ký 1986, Hoàn Châu Cách Cách, Kiếm hiệp Kim Dung, Na Tra, Bao Thanh Thiên...
  10. **Hoạt hình tuổi thơ Mỹ**: Tom & Jerry, Chuột Mickey, Vịt Donald, SpongeBob, Ben 10, Phineas & Ferb, Powerpuff Girls, Disney, Pixar...
  11. **Đoán tên ca sĩ nổi tiếng**: Nhận diện ca sĩ Việt Nam, Hàn Quốc, US-UK qua ảnh chân dung, biệt danh và bản hit.
  12. **Phim Mỹ & Phim Việt Nam**: Vũ trụ Marvel, Harry Potter, Titanic, Avatar, Mắt Biếc, Mai, Lật Mặt, Hai Phượng...

### 2. Tùy Chọn Ván Đấu & Cơ Chế 50 Câu/Ván
- Host có thể tùy chọn số lượng câu hỏi: **10, 20, 30 hoặc 50 câu hỏi**.
- Tùy chọn chủ đề: Chọn 1 hoặc nhiều chủ đề, hoặc **Trộn ngẫu nhiên tất cả chủ đề**.
- **Cơ chế chống thiếu hụt**: Nếu chủ đề được chọn không đủ số câu yêu cầu (ví dụ: yêu cầu 50 câu từ chủ đề có 42 câu), hệ thống tự động bổ sung câu hỏi từ các chủ đề khác mà **tuyệt đối không bị trùng lặp**.
- Tùy chọn mức độ khó: **Tất cả, Dễ, Trung bình, Khó**.
- Tùy chọn thời gian trả lời: **15 giây, 20 giây hoặc 30 giây**.

### 3. Hệ Thống Media Đa Dạng
- **Câu hỏi Hình ảnh (Image Guess)**: Nhìn ảnh đoán nhân vật, poster, quốc kỳ, kỳ quan với URL xác thực từ Wikimedia Commons và cơ chế tự động tải ảnh dự phòng (graceful fallback) nếu mạng gặp sự cố.
- **Đoán tên bài hát (Guess The Song)**: Hỗ trợ nhúng video âm nhạc YouTube Embed tỉ lệ 16:9 chuẩn responsive, kèm Audio Player HTML5 (nghe lại, phát/tạm dừng) giúp người chơi vừa nghe vừa đoán tên bài hát và nghệ sĩ.

### 4. Giao Diện Gameshow Trẻ Trung & Âm Thanh Trực Quan
- Thiết kế 4 ô đáp án rực rỡ phong cách Kahoot: Đỏ (▲), Xanh dương (◆), Vàng nghệ (●), Xanh lá (■).
- Hiệu ứng âm thanh chân thực được tổng hợp trực tiếp bằng **HTML5 Web Audio API Synthesizer** (tiếng tick đếm ngược khi thời gian < 5s, âm thanh chọn đáp án, tiếng chuông khi đúng, tiếng buzz khi sai, nhạc hiệu trao giải fanfare) — không cần tải file ngoài, hoạt động mượt mà offline lẫn online.
- Có nút bật/tắt âm thanh (Mute/Unmute) tiện lợi.

### 5. Tính Điểm An Toàn Phía Server & Bục Trao Giải Podium
- **Tính điểm an toàn**: Tính toán hoàn toàn trên cơ sở dữ liệu Supabase PostgreSQL qua hàm `submit_answer`.
- **Thưởng tốc độ (Speed Bonus)**: Người trả lời đúng càng nhanh được cộng điểm càng cao (từ 60% đến 100% điểm cơ bản).
- Nhân đôi điểm (x2) cho câu hỏi đặc biệt.
- Trả lời sai hoặc hết giờ: 0 điểm. Không thể gửi câu trả lời hai lần.
- Màn hình kết thúc ván đấu với **Bục vinh quang Top 3 (Podium Ceremony)**: Cúp vàng Quán quân, Cúp bạc Hạng nhì, Cúp đồng Hạng ba kèm thống kê chi tiết số câu đúng và tốc độ phản hồi trung bình.

### 6. Quản Trị Ngân Hàng Câu Hỏi (Admin CMS)
- Khu vực quản lý câu hỏi tích hợp sẵn:
  1. Thêm câu hỏi mới.
  2. Chỉnh sửa câu hỏi.
  3. Xóa câu hỏi.
  4. Tìm kiếm câu hỏi tức thì.
  5. Lọc theo chủ đề và độ khó.
  6. Xem trước câu hỏi (Preview Modal kèm media hình ảnh/video).
  7. Import câu hỏi từ file **JSON** hoặc **CSV**.
  8. Export ngân hàng câu hỏi ra file **JSON** hoặc **CSV (Excel UTF-8)**.
  9. Công cụ kiểm tra câu hỏi bị trùng lặp hoặc thiếu trường dữ liệu.

---

## 🚀 CẤU TRÚC THƯ MỤC

```
quiz-party/
├── app/
│   ├── globals.css           # Tailwind base styles
│   ├── layout.tsx            # HTML root layout
│   └── page.tsx              # Giao diện chính Gameshow + Lobby + In-game
├── components/
│   ├── AdminQuestionManager.tsx # Giao diện Quản trị viên CMS ngân hàng câu hỏi
│   ├── MediaViewer.tsx          # Component hiển thị ảnh, audio và YouTube embed
│   ├── PodiumCeremony.tsx       # Bục vinh quang trao giải Top 3
│   └── RoomCreationModal.tsx    # Modal thiết lập phòng (50 câu, chủ đề, thời gian)
├── data/
│   └── questionBank.json     # 504 câu hỏi chuẩn JSON chia đều 12 chủ đề
├── lib/
│   ├── questionBank.ts       # Tiện ích quản lý, xáo trộn, import/export CSV/JSON
│   ├── soundEffects.ts       # Web Audio API Synthesizer (FX âm thanh Gameshow)
│   ├── supabase.ts           # Khởi tạo Supabase client
│   └── types.ts              # Khai báo TypeScript types
├── scripts/
│   ├── build_question_bank.js # Script xây dựng ngân hàng câu hỏi
│   ├── test_quiz_system.js    # Bộ kiểm thử tự động toàn diện
│   └── questions/             # 12 file nội dung từng chủ đề (42 câu/file)
├── supabase/
│   ├── schema.sql            # Schema hoàn chỉnh cho dự án mới
│   ├── migrations/
│   │   └── 001_upgrade_quiz_system.sql # Migration an toàn cho DB đã có dữ liệu
│   └── seed_500_questions.sql # Script SQL nạp 504 câu hỏi vào Supabase
└── README.md
```

---

## 🛠️ HƯỚNG DẪN CÀI ĐẶT & CHẠY LOCAL

### 1. Cài đặt Dependencies
```bash
npm install
```

### 2. Cấu hình Biến Môi Trường (`.env.local`)
Tạo hoặc cập nhật file `.env.local` ở thư mục gốc:
```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 3. Chạy Migration trên Supabase
1. Mở trang quản trị dự án Supabase của bạn tại [supabase.com](https://supabase.com).
2. Vào mục **SQL Editor**.
3. Mở file `supabase/migrations/001_upgrade_quiz_system.sql`, dán toàn bộ nội dung vào SQL Editor và nhấn **RUN**.
*(Nếu là dự án hoàn toàn mới, bạn có thể chạy file `supabase/schema.sql`)*.

### 4. Nạp (Seed) Ngân Hàng 504 Câu Hỏi
- Mở file `supabase/seed_500_questions.sql` trong Supabase SQL Editor và nhấn **RUN**. Toàn bộ 504 câu hỏi sẽ được nạp tự động, tự động bỏ qua nếu câu hỏi đã tồn tại.
- Hoặc bạn có thể nhấn nút **"Ngân Hàng Câu Hỏi"** ngay trên giao diện web -> chọn **Import File** -> chọn file `data/questionBank.json`.

### 5. Chạy Ứng Dụng Local
```bash
npm run dev
```
Truy cập [http://localhost:3000](http://localhost:3000) trên trình duyệt máy tính hoặc điện thoại.

### 6. Chạy Kiểm Thử Toàn Diện
```bash
node scripts/test_quiz_system.js
```

---

## 🎮 HƯỚNG DẪN CHƠI GAMESHOW

1. **Host tạo phòng**:
   - Nhấn **"Thiết Lập & Tạo Phòng"**.
   - Nhập tên của bạn, chọn avatar đại diện.
   - Chọn số lượng câu hỏi (**10, 20, 30 hoặc 50 câu**).
   - Chọn các chủ đề muốn tranh tài (hoặc chọn tất cả 12 chủ đề).
   - Nhấn **"Tạo Phòng & Mở Lobby"**.
2. **Người chơi tham gia**:
   - Nhập tên, chọn avatar đại diện.
   - Nhập **Mã phòng** gồm 6 ký tự do Host gửi.
   - Nhấn **"Tham Gia Ngay"**.
3. **Bắt đầu Gameshow**:
   - Host kiểm tra danh sách người chơi trong phòng chờ và nhấn **"Bắt Đầu Gameshow Ngay"**.
   - Tất cả người chơi đồng loạt nhận cùng một câu hỏi và cùng một đồng hồ đếm ngược.
   - Trả lời đúng và nhanh nhất để tích lũy điểm thưởng tốc độ!
4. **Vinh danh trao giải**:
   - Sau khi kết thúc câu hỏi cuối cùng, màn hình bục vinh quang sẽ xướng tên Quán quân Cúp vàng và bảng xếp hạng tổng kết.
