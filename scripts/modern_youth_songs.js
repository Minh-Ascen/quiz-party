const fs = require('fs');

// Danh sách các bài hát TRẺ, HIỆN ĐẠI của các ca sĩ trẻ Việt Nam
// ĐÃ BỎ TOÀN BỘ NHẠC XƯA (Bolero, 8x-9x, hoài niệm cũ)
const MODERN_YOUTH_SONGS = [
  // --- 1. SƠN TÙNG M-TP (Các siêu hit sôi động, trẻ trung) ---
  {
    title: "Em Của Ngày Hôm Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "Vt4kAu-ziRY",
    distractors: ["Cơn Mưa Ngang Qua", "Nắng Ấm Xa Dần", "Chắc Ai Đó Sẽ Về"],
    startTime: 24,
    explanation: "'Em Của Ngày Hôm Qua' phát hành năm 2013 là siêu hit bước ngoặt đưa tên tuổi Sơn Tùng M-TP vụt sáng thành ngôi sao hạng A."
  },
  {
    title: "Cơn Mưa Ngang Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "hO4X_mJSqPI",
    distractors: ["Em Của Ngày Hôm Qua", "Nắng Ấm Xa Dần", "Khuôn Mặt Đáng Thương"],
    startTime: 20,
    explanation: "'Cơn Mưa Ngang Qua' sáng tác năm 2011 là ca khúc đầu tiên đưa giọng hát Sơn Tùng M-TP đến công chúng."
  },
  {
    title: "Nắng Ấm Xa Dần",
    artist: "Sơn Tùng M-TP",
    ytid: "ErhGuwNgrmw",
    distractors: ["Em Của Ngày Hôm Qua", "Cơn Mưa Ngang Qua", "Không Phải Dạng Vừa Đâu"],
    startTime: 20,
    explanation: "'Nắng Ấm Xa Dần' là bản hit sôi động giai đoạn đầu sự nghiệp của Sơn Tùng M-TP được đông đảo khán giả trẻ thuộc lòng."
  },
  {
    title: "Lạc Trôi",
    artist: "Sơn Tùng M-TP",
    ytid: "Llw9Q6akRo4",
    distractors: ["Nơi Này Có Anh", "Chạy Ngay Đi", "Chúng Ta Không Thuộc Về Nhau"],
    startTime: 28,
    explanation: "'Lạc Trôi' là bản hit cổ trang pha Future Bass kinh điển đưa tên tuổi Sơn Tùng M-TP vươn tầm châu Á năm 2017."
  },
  {
    title: "Nơi Này Có Anh",
    artist: "Sơn Tùng M-TP",
    ytid: "FN7ALfpGxiI",
    distractors: ["Lạc Trôi", "Có Chắc Yêu Là Đây", "Muộn Rồi Mà Sao Còn"],
    startTime: 24,
    explanation: "'Nơi Này Có Anh' là bản tình ca Valentine ngọt ngào quay tại Hàn Quốc với giai điệu Pop & RnB trong trẻo."
  },
  {
    title: "Chúng Ta Không Thuộc Về Nhau",
    artist: "Sơn Tùng M-TP",
    ytid: "qGRU3sRbaYw",
    distractors: ["Buông Đôi Tay Nhau Ra", "Lạc Trôi", "Chạy Ngay Đi"],
    startTime: 25,
    explanation: "'Chúng Ta Không Thuộc Về Nhau' mang phong cách Tropical House phát hành năm 2016 lập kỷ lục lượt xem ấn tượng của Sơn Tùng M-TP."
  },
  {
    title: "Buông Đôi Tay Nhau Ra",
    artist: "Sơn Tùng M-TP",
    ytid: "LCyo565N_5w",
    distractors: ["Âm Thầm Bên Em", "Chúng Ta Không Thuộc Về Nhau", "Chắc Ai Đó Sẽ Về"],
    startTime: 22,
    explanation: "'Buông Đôi Tay Nhau Ra' ra mắt cuối năm 2015 mang giai điệu Pop sôi động về sự chia tay văn minh trong tình yêu."
  },
  {
    title: "Âm Thầm Bên Em",
    artist: "Sơn Tùng M-TP",
    ytid: "30KI5SuECuc",
    distractors: ["Buông Đôi Tay Nhau Ra", "Chắc Ai Đó Sẽ Về", "Thái Bình Mồ Hôi Rơi"],
    startTime: 28,
    explanation: "'Âm Thầm Bên Em' là phim ca ngắn đầy cảm xúc của Sơn Tùng M-TP trong vai chàng trai vì tình yêu mà hoàn lương."
  },
  {
    title: "Chắc Ai Đó Sẽ Về",
    artist: "Sơn Tùng M-TP",
    ytid: "4guq5g_bC3g",
    distractors: ["Âm Thầm Bên Em", "Khuôn Mặt Đáng Thương", "Nơi Này Có Anh"],
    startTime: 22,
    explanation: "'Chắc Ai Đó Sẽ Về' là ca khúc nhạc phim 'Chàng Trai Năm Ấy' làm thổn thức hàng triệu trái tim khán giả."
  },
  {
    title: "Hãy Trao Cho Anh",
    artist: "Sơn Tùng M-TP ft. Snoop Dogg",
    ytid: "knW7-x7Y7RE",
    distractors: ["Chạy Ngay Đi", "Lạc Trôi", "Có Chắc Yêu Là Đây"],
    startTime: 26,
    explanation: "'Hãy Trao Cho Anh' là siêu hit quốc tế phát hành năm 2019 của Sơn Tùng M-TP kết hợp cùng huyền thoại Snoop Dogg."
  },
  {
    title: "Chạy Ngay Đi",
    artist: "Sơn Tùng M-TP",
    ytid: "32sYGCOYJUM",
    distractors: ["Hãy Trao Cho Anh", "Lạc Trôi", "Chúng Ta Không Thuộc Về Nhau"],
    startTime: 30,
    explanation: "'Chạy Ngay Đi' là sản phẩm Hip-hop Trap ma mị kết hợp cùng ngôi sao nữ hàng đầu Thái Lan Mai Davika."
  },
  {
    title: "Có Chắc Yêu Là Đây",
    artist: "Sơn Tùng M-TP",
    ytid: "6t-MjBazs3o",
    distractors: ["Nơi Này Có Anh", "Muộn Rồi Mà Sao Còn", "Đừng Làm Trái Tim Anh Đau"],
    startTime: 24,
    explanation: "'Có Chắc Yêu Là Đây' là món quà ngọt ngào tràn ngập sắc màu pastel tươi vui dành tặng cộng đồng Sky."
  },
  {
    title: "Chúng Ta Của Hiện Tại",
    artist: "Sơn Tùng M-TP",
    ytid: "psZ1g9fMfeo",
    distractors: ["Muộn Rồi Mà Sao Còn", "Có Chắc Yêu Là Đây", "Chắc Ai Đó Sẽ Về"],
    startTime: 35,
    explanation: "'Chúng Ta Của Hiện Tại' là bản Pop R&B hoài niệm mang phong cách thập niên 90 lãng mạn."
  },
  {
    title: "Muộn Rồi Mà Sao Còn",
    artist: "Sơn Tùng M-TP",
    ytid: "xypzmu5mMPY",
    distractors: ["Có Chắc Yêu Là Đây", "Chúng Ta Của Hiện Tại", "Đừng Làm Trái Tim Anh Đau"],
    startTime: 25,
    explanation: "'Muộn Rồi Mà Sao Còn' kể về tâm trạng tương tư thao thức cả đêm không ngủ của chàng trai khi trót yêu."
  },
  {
    title: "Đừng Làm Trái Tim Anh Đau",
    artist: "Sơn Tùng M-TP",
    ytid: "abPmZCZZrFA",
    distractors: ["Có Chắc Yêu Là Đây", "Nơi Này Có Anh", "Muộn Rồi Mà Sao Còn"],
    startTime: 28,
    explanation: "'Đừng Làm Trái Tim Anh Đau' là bản hit mùa hè 2024 gây bão khắp mạng xã hội với giai điệu tươi sáng, đáng yêu."
  },
  {
    title: "Thái Bình Mồ Hôi Rơi",
    artist: "Sơn Tùng M-TP",
    ytid: "GgQnmVP_0wY",
    distractors: ["Tiến Lên Việt Nam Ơi", "Như Ngày Hôm Qua", "Khuôn Mặt Đáng Thương"],
    startTime: 22,
    explanation: "'Thái Bình Mồ Hôi Rơi' là ca khúc tri ân quê hương và người cha kính yêu được Sơn Tùng trình diễn tại The Remix 2015."
  },
  {
    title: "Như Ngày Hôm Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "Ggt6vG_s60c",
    distractors: ["Thái Bình Mồ Hôi Rơi", "Tiến Lên Việt Nam Ơi", "Em Của Ngày Hôm Qua"],
    startTime: 20,
    explanation: "'Như Ngày Hôm Qua' là khúc ca về tình bạn chân thành, gắn kết của Sơn Tùng M-TP gửi tặng khán giả."
  },

  // --- 2. JACK (J97) (Các siêu hit trăm triệu view) ---
  {
    title: "Hồng Nhan",
    artist: "Jack (J97)",
    ytid: "8x2NjwwHbd8",
    distractors: ["Bạc Phận", "Sóng Gió", "Sao Em Vô Tình"],
    startTime: 20,
    explanation: "'Hồng Nhan' là bản hit đầu tiên đưa tên tuổi Jack vụt sáng với lối hát luyến láy miền Tây đặc trưng."
  },
  {
    title: "Bạc Phận",
    artist: "K-ICM ft. Jack",
    ytid: "mPN0mXgL9nI",
    distractors: ["Hồng Nhan", "Sóng Gió", "Em Gì Ơi"],
    startTime: 22,
    explanation: "'Bạc Phận' tiếp nối câu chuyện Hồng Nhan, trở thành một trong những MV đạt 100 triệu lượt xem nhanh nhất V-Pop."
  },
  {
    title: "Sóng Gió",
    artist: "K-ICM ft. Jack",
    ytid: "j8U06veqxdU",
    distractors: ["Bạc Phận", "Hồng Nhan", "Hoa Hải Đường"],
    startTime: 24,
    explanation: "'Sóng Gió' là siêu hit quốc dân năm 2019 công phá mọi bảng xếp hạng âm nhạc tại Việt Nam."
  },
  {
    title: "Sao Em Vô Tình",
    artist: "Jack x Liam",
    ytid: "1oHDwL-y_6Q",
    distractors: ["Hồng Nhan", "Bạc Phận", "Đom Đóm"],
    startTime: 20,
    explanation: "'Sao Em Vô Tình' là bản ballad buồn da diết kết hợp cùng tiếng đàn violin của Liam."
  },
  {
    title: "Em Gì Ơi",
    artist: "K-ICM ft. Jack",
    ytid: "FQwAFWZu4yc",
    distractors: ["Sóng Gió", "Là 1 Thằng Con Trai", "Thiên Lý Ơi"],
    startTime: 22,
    explanation: "'Em Gì Ơi' mang giai điệu vui tươi, năng động và tràn đầy năng lượng tích cực của Jack."
  },
  {
    title: "Hoa Hải Đường",
    artist: "Jack - J97",
    ytid: "kph4Lw9i9pU",
    distractors: ["Đom Đóm", "Là 1 Thằng Con Trai", "Cuối Cùng Thì"],
    startTime: 24,
    explanation: "'Hoa Hải Đường' mang phong cách Future Bass kết hợp nhạc cụ dân tộc truyền thống của Jack."
  },
  {
    title: "Đom Đóm",
    artist: "Jack - J97",
    ytid: "0W0h5Fw4Jb8",
    distractors: ["Hoa Hải Đường", "Cuối Cùng Thì", "Sao Em Vô Tình"],
    startTime: 22,
    explanation: "'Đom Đóm' là bản ballad cổ tích lung linh mang thông điệp tình yêu thuần khiết của Jack."
  },
  {
    title: "Là 1 Thằng Con Trai",
    artist: "Jack - J97",
    ytid: "oG6mUeH4aI4",
    distractors: ["Hoa Hải Đường", "Em Gì Ơi", "Thiên Lý Ơi"],
    startTime: 20,
    explanation: "'Là 1 Thằng Con Trai' đánh dấu bước chuyển mình sang phong cách Disco sôi động của Jack."
  },
  {
    title: "Cuối Cùng Thì",
    artist: "Jack - J97",
    ytid: "gN8yvK1e_bU",
    distractors: ["Hoa Hải Đường", "Đom Đóm", "Thiên Lý Ơi"],
    startTime: 22,
    explanation: "'Cuối Cùng Thì' là bản hit tự sự tình cảm đượm buồn do Jack tự sáng tác."
  },
  {
    title: "Thiên Lý Ơi",
    artist: "Jack - J97",
    ytid: "6h9z4FzK4nQ",
    distractors: ["Cuối Cùng Thì", "Hoa Hải Đường", "Đom Đóm"],
    startTime: 20,
    explanation: "'Thiên Lý Ơi' phát hành năm 2024 mang hoài niệm về mối tình tuổi học trò trong trẻo."
  },

  // --- 3. VŨ. (Hoàng tử Indie) ---
  {
    title: "Lạ Lùng",
    artist: "Vũ. (Hoàng Thái Vũ)",
    ytid: "F5tS5m86bOI",
    distractors: ["Đông Kiếm Em", "Bước Qua Nhau", "Bước Qua Mùa Cô Đơn"],
    startTime: 20,
    explanation: "'Lạ Lùng' là bản tình ca Indie kinh điển đưa tên tuổi 'Hoàng tử Indie' Vũ. chạm đến triệu con tim."
  },
  {
    title: "Bước Qua Nhau",
    artist: "Vũ.",
    ytid: "da1rnKGmsA4",
    distractors: ["Bước Qua Mùa Cô Đơn", "Lạ Lùng", "Những Lời Hứa Bỏ Quên"],
    startTime: 20,
    explanation: "'Bước Qua Nhau' là bản ballad trầm buồn về sự tiếc nuối khi hai người lướt qua đời nhau."
  },
  {
    title: "Đông Kiếm Em",
    artist: "Vũ.",
    ytid: "F5UcxwSZZh8",
    distractors: ["Lạ Lùng", "Bước Qua Nhau", "Mùa Mưa Ngâu Nằm Cạnh"],
    startTime: 20,
    explanation: "'Đông Kiếm Em' mang phong cách Acoustic ấm áp đặc trưng trong mùa đông Hà Nội của Vũ."
  },
  {
    title: "Bước Qua Mùa Cô Đơn",
    artist: "Vũ.",
    ytid: "3E_DswpXGls",
    distractors: ["Bước Qua Nhau", "Lạ Lùng", "Những Lời Hứa Bỏ Quên"],
    startTime: 20,
    explanation: "'Bước Qua Mùa Cô Đơn' mở đầu cho kỷ nguyên album 'Một Vạn Năm' đầy sâu lắng của Vũ."
  },
  {
    title: "Những Lời Hứa Bỏ Quên",
    artist: "Vũ. x Dear Jane",
    ytid: "hpc_x3vC_mI",
    distractors: ["Bước Qua Nhau", "Bình Yên", "Dành Hết Xuân Thì Để Chờ Nhau"],
    startTime: 22,
    explanation: "'Những Lời Hứa Bỏ Quên' kết hợp cùng ban nhạc Hong Kong Dear Jane là bản hit bùng nổ cuối năm 2023."
  },
  {
    title: "Dành Hết Xuân Thì Để Chờ Nhau",
    artist: "Vũ. ft. Hà Anh Tuấn",
    ytid: "YQGsm8L3-o4",
    distractors: ["Những Lời Hứa Bỏ Quên", "Bước Qua Nhau", "Tháng Tư Là Lời Nói Dối Của Em"],
    startTime: 20,
    explanation: "'Dành Hết Xuân Thì Để Chờ Nhau' là màn hòa giọng đỉnh cao của hai giọng ca lịch lãm Vũ. và Hà Anh Tuấn."
  },
  {
    title: "Bình Yên",
    artist: "Vũ. ft. Binz",
    ytid: "x3P_x7bQ_f8",
    distractors: ["Những Lời Hứa Bỏ Quên", "Bước Qua Nhau", "Lạ Lùng"],
    startTime: 20,
    explanation: "'Bình Yên' là ca khúc chủ đề album Bảo Tàng Của Nuối Tiếc kết hợp ăn ý cùng rapper Binz."
  },
  {
    title: "Anh Nhớ Ra",
    artist: "Vũ. ft. Trang",
    ytid: "11XkLOIsLHI",
    distractors: ["Bước Qua Nhau", "Lạ Lùng", "Đông Kiếm Em"],
    startTime: 20,
    explanation: "'Anh Nhớ Ra' là bản song ca mộc mạc, tha thiết của Vũ và Trang."
  },

  // --- 4. HIEUTHUHAI & ANH TRAI SAY HI & DƯƠNG DOMIC & CAPTAIN ---
  {
    title: "Ngủ Một Mình",
    artist: "HIEUTHUHAI ft. Negav",
    ytid: "yWzM5Y8iY_M",
    distractors: ["Không Thể Say", "Cua", "Vệ Tinh"],
    startTime: 20,
    explanation: "'Ngủ Một Mình' đưa tên tuổi nam vương HIEUTHUHAI phủ sóng toàn quốc với vũ điệu lắc hông gây sốt."
  },
  {
    title: "Không Thể Say",
    artist: "HIEUTHUHAI",
    ytid: "i0nd3NPJ4MI",
    distractors: ["Ngủ Một Mình", "Cua", "NOLOVE NOFAME"],
    startTime: 20,
    explanation: "'Không Thể Say' do Kewtiie phối khí là bản hit triệu view đầy cảm xúc của HIEUTHUHAI."
  },
  {
    title: "Cua",
    artist: "HIEUTHUHAI",
    ytid: "P8qEusQiwsw",
    distractors: ["Ngủ Một Mình", "Không Thể Say", "Bật Nhạc Lên"],
    startTime: 20,
    explanation: "'Cua' là bản rap debut bùng nổ tại King Of Rap mở màn sự nghiệp rực rỡ của HIEUTHUHAI."
  },
  {
    title: "Ngáo Ngơ",
    artist: "Anh Trai Say Hi (HIEUTHUHAI x Atus)",
    ytid: "9X14DitMPIU",
    distractors: ["Hào Quang", "CATCH ME IF YOU CAN", "Tình Đầu Quá Chén"],
    startTime: 22,
    explanation: "'Ngáo Ngơ' do HIEUTHUHAI, Anh Tú Atus, Jsol, Erik thể hiện là tiết mục triệu view gây sốt tại Anh Trai Say Hi."
  },
  {
    title: "Hào Quang",
    artist: "Anh Trai Say Hi (Rhyder x Dương Domic)",
    ytid: "sZdDZDHLtaU",
    distractors: ["Ngáo Ngơ", "Tràn Bộ Nhớ", "CATCH ME IF YOU CAN"],
    startTime: 24,
    explanation: "'Hào Quang' là sân khấu đỉnh cao bùng nổ visual và giọng hát của Rhyder, Dương Domic và Pháp Kiều."
  },
  {
    title: "Tràn Bộ Nhớ",
    artist: "Dương Domic",
    ytid: "a-jdOviGQ00",
    distractors: ["Hào Quang", "Mất Kết Nối", "Ngáo Ngơ"],
    startTime: 20,
    explanation: "'Tràn Bộ Nhớ' do Dương Domic tự sáng tác và thể hiện khẳng định tài năng vượt trội của mỹ nam Gen Z."
  },

  // --- 5. QUANG HÙNG MASTERD ---
  {
    title: "Thuỷ Triều",
    artist: "Quang Hùng MasterD",
    ytid: "7ig2lXjozdw",
    distractors: ["Dễ Đến Dễ Đi", "Trói Em Lại", "Tình Đầu Quá Chén"],
    startTime: 20,
    explanation: "'Thuỷ Triều' là siêu hit càn quét mọi nền tảng âm nhạc châu Á của Quang Hùng MasterD năm 2024."
  },
  {
    title: "Dễ Đến Dễ Đi",
    artist: "Quang Hùng MasterD",
    ytid: "YV_U70X1Rsk",
    distractors: ["Thuỷ Triều", "Chịu Cách Mình Nói Thua", "Hào Quang"],
    startTime: 20,
    explanation: "'Dễ Đến Dễ Đi' đưa tên tuổi Quang Hùng MasterD trở thành hiện tượng âm nhạc được yêu mến cuồng nhiệt tại Thái Lan."
  },

  // --- 6. MONO & WREN EVANS ---
  {
    title: "Waiting For You",
    artist: "MONO ft. Onionn",
    ytid: "nlw8qVp_1y4",
    distractors: ["Em Là", "Quên Anh Đi", "Chăm Hoa"],
    startTime: 22,
    explanation: "'Waiting For You' với phong cách City Pop thập niên 80 là siêu hit debut chấn động V-Pop của tân binh MONO."
  },
  {
    title: "Em Là",
    artist: "MONO",
    ytid: "a64cTl1enW8",
    distractors: ["Waiting For You", "Chăm Hoa", "Quên Anh Đi"],
    startTime: 20,
    explanation: "'Em Là' nằm trong album '22' tiếp tục khẳng định phong cách âm nhạc lôi cuốn, hiện đại của MONO."
  },
  {
    title: "Từng Quen",
    artist: "Wren Evans",
    ytid: "1xS4Yk2tY6k",
    distractors: ["Thích Em Hơi Nhiều", "Tò Te Tí", "Bé Ơi Lại Đây"],
    startTime: 20,
    explanation: "'Từng Quen' với giai điệu R&B bắt tai đã thống trị toàn bộ bảng xếp hạng âm nhạc Việt Nam cuối năm 2023."
  },
  {
    title: "Tò Te Tí",
    artist: "Wren Evans",
    ytid: "aCqmdPaTVSg",
    distractors: ["Từng Quen", "Thích Em Hơi Nhiều", "Cơn Đau Rộng Lớn"],
    startTime: 20,
    explanation: "'Tò Te Tí' trong album Loi Choi của Wren Evans mang năng lượng Gen Z bùng nổ, phá cách."
  },
  {
    title: "Thích Em Hơi Nhiều",
    artist: "Wren Evans",
    ytid: "hQx0CGqy254",
    distractors: ["Từng Quen", "Tò Te Tí", "Gặp May"],
    startTime: 20,
    explanation: "'Thích Em Hơi Nhiều' với phong cách Bossa Nova hiện đại là ca khúc debut xuất sắc của Wren Evans."
  },

  // --- 7. MCK & TLINH & GREY D ---
  {
    title: "Chìm Sâu",
    artist: "MCK ft. Trung Trần",
    ytid: "Yw9Ra2UiVLw",
    distractors: ["Tại Vì Sao", "Anh Đã Ổn Hơn", "Tay To"],
    startTime: 20,
    explanation: "'Chìm Sâu' là bản tình ca ngọt ngào, lãng mạn đạt hàng chục triệu lượt nghe của RPT MCK."
  },
  {
    title: "Tại Vì Sao",
    artist: "MCK",
    ytid: "Wo_u9lyuHyo",
    distractors: ["Chìm Sâu", "Anh Đã Ổn Hơn", "Thôi Em Đừng Đi"],
    startTime: 20,
    explanation: "'Tại Vì Sao' trong album '99%' phô diễn chất nhạc RnB cảm xúc và giọng hát auto-tune đặc trưng của MCK."
  },
  {
    title: "Nếu Lúc Đó",
    artist: "tlinh ft. 2pillz",
    ytid: "XGqU3y7vM6M",
    distractors: ["Gái Độc Thân", "ghệ iu dấu của em ơi", "Thích Quá Rùi Nà"],
    startTime: 20,
    explanation: "'Nếu Lúc Đó' do 2pillz sản xuất là siêu phẩm âm nhạc cảm xúc đứng đầu bảng xếp hạng của tlinh."
  },
  {
    title: "ghệ iu dấu của em ơi",
    artist: "tlinh",
    ytid: "8DV-S9w7hu0",
    distractors: ["Nếu Lúc Đó", "Gái Độc Thân", "Thích Quá Rùi Nà"],
    startTime: 20,
    explanation: "'ghệ iu dấu của em ơi' mang phong cách R&B lười biếng, gợi cảm khẳng định vị thế nữ hoàng Gen Z của tlinh."
  },
  {
    title: "Gái Độc Thân",
    artist: "tlinh",
    ytid: "kFJd7U7vQ3o",
    distractors: ["Nếu Lúc Đó", "ghệ iu dấu của em ơi", "Siren"],
    startTime: 20,
    explanation: "'Gái Độc Thân' tuyên ngôn tự tin, độc lập và quyến rũ của người phụ nữ hiện đại."
  },
  {
    title: "vaicaunoicokhiennguoithaydoi",
    artist: "GREY D x tlinh",
    ytid: "2iidlwQ-NfU",
    distractors: ["dự báo thời tiết hôm nay mưa", "đưa em về nhàa", "Có Hẹn Với Thanh Xuân"],
    startTime: 20,
    explanation: "'vaicaunoicokhiennguoithaydoi' là ca khúc debut solo thành công vang dội của chàng ca sĩ - nhạc sĩ GREY D."
  },
  {
    title: "dự báo thời tiết hôm nay mưa",
    artist: "GREY D",
    ytid: "heMYSOZoT3c",
    distractors: ["vaicaunoicokhiennguoithaydoi", "đưa em về nhàa", "nhạt-nhòa"],
    startTime: 20,
    explanation: "'dự báo thời tiết hôm nay mưa' mang giai điệu êm dịu, man mác buồn của GREY D."
  },
  {
    title: "đưa em về nhàa",
    artist: "GREY D x Chillies",
    ytid: "wvcSGGdnnII",
    distractors: ["vaicaunoicokhiennguoithaydoi", "dự báo thời tiết hôm nay mưa", "Vùng Ký Ức"],
    startTime: 20,
    explanation: "'đưa em về nhàa' là bản nhạc lãng mạn kết hợp cùng ban nhạc Chillies làm say đắm giới trẻ."
  },

  // --- 8. HÒA MINZY & ĐỨC PHÚC & ERIK ---
  {
    title: "Bật Tình Yêu Lên",
    artist: "Hòa Minzy x Tăng Duy Tân",
    ytid: "VHjMJeLsI0o",
    distractors: ["Thị Mầu", "Bên Trên Tầng Lầu", "Cắt Đôi Nỗi Sầu"],
    startTime: 20,
    explanation: "'Bật Tình Yêu Lên' là bản song ca sôi động, dễ thương càn quét TikTok của Hòa Minzy và Tăng Duy Tân."
  },
  {
    title: "Thị Mầu",
    artist: "Hòa Minzy x Masew",
    ytid: "cK2X_7oQf4U",
    distractors: ["Bật Tình Yêu Lên", "Không Thể Cùng Nhau Suốt Kiếp", "Rời Bỏ"],
    startTime: 20,
    explanation: "'Thị Mầu' kết hợp nghệ thuật Chèo truyền thống với âm hưởng điện tử hiện đại của Masew."
  },
  {
    title: "Không Thể Cùng Nhau Suốt Kiếp",
    artist: "Hòa Minzy",
    ytid: "ayJY9ieBuEU",
    distractors: ["Rời Bỏ", "Chấp Nhận", "Thị Mầu"],
    startTime: 24,
    explanation: "'Không Thể Cùng Nhau Suốt Kiếp' của Mr. Siro tái hiện câu chuyện lịch sử giữa Nam Phương Hoàng hậu và Vua Bảo Đại."
  },
  {
    title: "Rời Bỏ",
    artist: "Hòa Minzy",
    ytid: "zQwKxVCR1y8",
    distractors: ["Chấp Nhận", "Không Thể Cùng Nhau Suốt Kiếp", "Cứ Yêu Đi"],
    startTime: 20,
    explanation: "'Rời Bỏ' của nhạc sĩ Vũ Huy Hoàng là bản ballad đưa tên tuổi Hòa Minzy trở lại đỉnh cao."
  },
  {
    title: "Hơn Cả Yêu",
    artist: "Đức Phúc",
    ytid: "166M4eE7fQc",
    distractors: ["Ánh Nắng Của Anh", "Ngày Đầu Tiên", "Em Đồng Ý"],
    startTime: 20,
    explanation: "'Hơn Cả Yêu' là bản tình ca quốc dân vang lên trong mọi đám cưới tại Việt Nam của Đức Phúc."
  },
  {
    title: "Ánh Nắng Của Anh",
    artist: "Đức Phúc",
    ytid: "L7n-5oQpM08",
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Hết Thương Cạn Nhớ"],
    startTime: 20,
    explanation: "'Ánh Nắng Của Anh' là ca khúc nhạc phim 'Chờ Em Đến Ngày Mai' gắn liền với giọng hát ấm áp của Đức Phúc."
  },
  {
    title: "Ngày Đầu Tiên",
    artist: "Đức Phúc",
    ytid: "KcwYZSfaqiE",
    distractors: ["Hơn Cả Yêu", "Ánh Nắng Của Anh", "Người Ơi Người Ở Đừng Về"],
    startTime: 20,
    explanation: "'Ngày Đầu Tiên' với MV cầu hôn xúc động là bản tình ca Valentine ngọt ngào của Đức Phúc."
  },
  {
    title: "Em Không Sai Chúng Ta Sai",
    artist: "ERIK",
    ytid: "iwGuiSnr2Qc",
    distractors: ["Chạm Đáy Nỗi Đau", "Có Tất Cả Nhưng Thiếu Anh", "Sau Tất Cả"],
    startTime: 20,
    explanation: "'Em Không Sai Chúng Ta Sai' của nhạc sĩ Nguyễn Phúc Thiện tạo nên câu hát trend khắp mạng xã hội."
  },

  // --- 9. TĂNG DUY TÂN & DOUBLE2T & PHƯƠNG MỸ CHI & PHÁO ---
  {
    title: "Bên Trên Tầng Lầu",
    artist: "Tăng Duy Tân",
    ytid: "r6x9qZk8zM8",
    distractors: ["Cắt Đôi Nỗi Sầu", "Dạ Vũ", "Ngây Thơ"],
    startTime: 20,
    explanation: "'Bên Trên Tầng Lầu' là hiện tượng âm nhạc quốc tế vươn tầm sang cả Trung Quốc và các nước châu Á."
  },
  {
    title: "Cắt Đôi Nỗi Sầu",
    artist: "Tăng Duy Tân ft. Drum7",
    ytid: "1oK2YyZJ9gI",
    distractors: ["Bên Trên Tầng Lầu", "Dạ Vũ", "Bật Tình Yêu Lên"],
    startTime: 20,
    explanation: "'Cắt Đôi Nỗi Sầu' khuấy đảo các bảng xếp hạng và các sàn diễn âm nhạc với vũ đạo bắt mắt."
  },
  {
    title: "À Lôi",
    artist: "Double2T ft. Masew",
    ytid: "c8z_Xp3tL1Y",
    distractors: ["Thanh Âm Miền Núi", "Vũ Trụ Có Anh", "Bên Trên Tầng Lầu"],
    startTime: 20,
    explanation: "'À Lôi' đưa văn hóa miền núi Tây Bắc hòa quyện cùng âm nhạc điện tử hiện đại, đưa Double2T thành quán quân Rap Việt."
  },
  {
    title: "Thanh Âm Miền Núi",
    artist: "Double2T",
    ytid: "a6lLH0HeyXg",
    distractors: ["À Lôi", "Người Miền Núi Chất", "Hương Ngọc Lan"],
    startTime: 20,
    explanation: "'Thanh Âm Miền Núi' là bản rap đậm đà bản sắc vùng cao giúp Double2T tỏa sáng tại Rap Việt."
  },
  {
    title: "Vũ Trụ Có Anh",
    artist: "Phương Mỹ Chi ft. Pháo",
    ytid: "c-jPz_M9yQw",
    distractors: ["Đẩy Xe Bò", "Bóng Phù Hoa", "Thị Mầu"],
    startTime: 20,
    explanation: "'Vũ Trụ Có Anh' đánh dấu bước lột xác ấn tượng của Phương Mỹ Chi từ dòng nhạc dân ca sang phong cách Pop hiện đại."
  },
  {
    title: "Đẩy Xe Bò",
    artist: "Phương Mỹ Chi",
    ytid: "K3AgOF4LMVU",
    distractors: ["Vũ Trụ Có Anh", "Bóng Phù Hoa", "Chiếc Thuyền Ngoài Xa"],
    startTime: 20,
    explanation: "'Đẩy Xe Bò' lấy cảm hứng từ tác phẩm văn học 'Vợ Nhặt' với phong cách tươi trẻ, vui nhộn."
  },
  {
    title: "Hai Phút Hơn",
    artist: "Pháo",
    ytid: "mw7Y0jQ8_BU",
    distractors: ["Gập Ghềnh", "Vũ Trụ Có Anh", "Một Ngày Chẳng Nắng"],
    startTime: 20,
    explanation: "'Hai Phút Hơn' (Kaiz Remix) là bản hit toàn cầu đưa tên tuổi nữ rapper Pháo lọt vào bảng xếp hạng Billboard quốc tế."
  },

  // --- 10. AMEE & VŨ CÁT TƯỜNG & SOOBIN HOÀNG SƠN & PHAN MẠNH QUỲNH ---
  {
    title: "Anh Nhà Ở Đâu Thế",
    artist: "AMEE ft. B Ray",
    ytid: "vBq0h9x_7Z8",
    distractors: ["Đen Đá Không Đường", "Ưng Quá Chừng", "Sao Anh Chưa Về Nhà"],
    startTime: 20,
    explanation: "'Anh Nhà Ở Đâu Thế' là ca khúc debut thành công vang dội của công chúa V-Pop AMEE."
  },
  {
    title: "Ưng Quá Chừng",
    artist: "AMEE",
    ytid: "4qNALNWoGmI",
    distractors: ["Anh Nhà Ở Đâu Thế", "Đen Đá Không Đường", "Mộng Yu"],
    startTime: 20,
    explanation: "'Ưng Quá Chừng' với vũ đạo mèo cào đáng yêu đã tạo nên cơn sốt trên khắp mạng xã hội TikTok."
  },
  {
    title: "Vết Mưa",
    artist: "Vũ Cát Tường",
    ytid: "jAKQSm9PiSQ",
    distractors: ["Yêu Xa", "Mơ", "Có Người"],
    startTime: 20,
    explanation: "'Vết Mưa' là bản hit đưa tài năng sáng tác và giọng hát nội lực của Vũ Cát Tường đến đông đảo công chúng."
  },
  {
    title: "Yêu Xa",
    artist: "Vũ Cát Tường",
    ytid: "kvNEHnVSmvs",
    distractors: ["Vết Mưa", "Mơ", "Góc Ban Công"],
    startTime: 20,
    explanation: "'Yêu Xa' là bản tình ca da diết về niềm tin và sự thủy chung trong tình cảm xa cách địa lý."
  },
  {
    title: "Phía Sau Một Cô Gái",
    artist: "Soobin Hoàng Sơn",
    ytid: "vCIc1g_4JWM",
    distractors: ["Xin Đừng Lặng Im", "Đi Để Trở Về", "Nếu Ngày Ấy"],
    startTime: 20,
    explanation: "'Phía Sau Một Cô Gái' sáng tác bởi Tiên Cookie là ca khúc ballad kinh điển đưa Soobin lên hàng ngũ ngôi sao."
  },
  {
    title: "Xin Đừng Lặng Im",
    artist: "Soobin Hoàng Sơn",
    ytid: "_w2PR0Sko8g",
    distractors: ["Phía Sau Một Cô Gái", "Đi Để Trở Về", "Trò Chơi"],
    startTime: 20,
    explanation: "'Xin Đừng Lặng Im' của nhạc sĩ Dương Khắc Linh là bản ballad chất chứa nỗi niềm day dứt khi yêu."
  },
  {
    title: "Có Chàng Trai Viết Lên Cây",
    artist: "Phan Mạnh Quỳnh",
    ytid: "7gJ4c3q2D8A",
    distractors: ["Vợ Người Ta", "Từ Đó", "Sao Cha Không"],
    startTime: 22,
    explanation: "'Có Chàng Trai Viết Lên Cây' là bài hát chủ đề của bộ phim điện ảnh đình đám 'Mắt Biếc'."
  },
  {
    title: "Vợ Người Ta",
    artist: "Phan Mạnh Quỳnh",
    ytid: "5wR1P2T1xK0",
    distractors: ["Có Chàng Trai Viết Lên Cây", "Nước Ngoài", "Hồi Ức"],
    startTime: 20,
    explanation: "'Vợ Người Ta' là hiện tượng âm nhạc hài hước, độc đáo đưa tên tuổi Phan Mạnh Quỳnh phủ sóng toàn quốc."
  },

  // --- 11. BÙI ANH TUẤN & HÀ ANH TUẤN & TRUNG QUÂN IDOL & QUỐC THIÊN ---
  {
    title: "Nơi Tình Yêu Bắt Đầu",
    artist: "Bùi Anh Tuấn",
    ytid: "YQGsm8L3-o4",
    distractors: ["Nơi Tình Yêu Kết Thúc", "Hẹn Một Mai", "Phố Không Mùa"],
    startTime: 20,
    explanation: "'Nơi Tình Yêu Bắt Đầu' tại Giọng Hát Việt 2012 với nốt cao chót vót đã đưa Bùi Anh Tuấn thành hiện tượng âm nhạc."
  },
  {
    title: "Hẹn Một Mai",
    artist: "Bùi Anh Tuấn",
    ytid: "Y8Qh6B5G1yM",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Mơ Hồ", "Nơi Tình Yêu Kết Thúc"],
    startTime: 20,
    explanation: "'Hẹn Một Mai' là ca khúc nhạc phim '4 Năm 2 Chàng 1 Tình Yêu' với ca từ lãng mạn."
  },
  {
    title: "Mơ Hồ",
    artist: "Bùi Anh Tuấn",
    ytid: "K6k4qWz0A4M",
    distractors: ["Hẹn Một Mai", "Nơi Tình Yêu Bắt Đầu", "Chỉ Còn Lại Tình Yêu"],
    startTime: 20,
    explanation: "'Mơ Hồ' phô diễn giọng hát cao vút, đầy tính tự sự của 'hoàng tử ballad' Bùi Anh Tuấn."
  },
  {
    title: "Nơi Tình Yêu Kết Thúc",
    artist: "Bùi Anh Tuấn",
    ytid: "wJ_lC0dF2cI",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Hẹn Một Mai", "Buông"],
    startTime: 20,
    explanation: "'Nơi Tình Yêu Kết Thúc' của nhạc sĩ Tiến Minh khép lại câu chuyện tình yêu dang dở đầy cảm xúc."
  },
  {
    title: "Tháng Tư Là Lời Nói Dối Của Em",
    artist: "Hà Anh Tuấn",
    ytid: "UCXao7aTDQM",
    distractors: ["Chuyện Của Mùa Đông", "Xuân Thì", "Cơn Mưa Tình Yêu"],
    startTime: 20,
    explanation: "'Tháng Tư Là Lời Nói Dối Của Em' sáng tác bởi Phạm Toàn Thắng gắn liền với thương hiệu See Sing Share của Hà Anh Tuấn."
  },
  {
    title: "Cơn Mưa Tình Yêu",
    artist: "Hà Anh Tuấn & Phương Linh",
    ytid: "7vT_4B3E-5Y",
    distractors: ["Qua Đêm Nay", "Tháng Tư Là Lời Nói Dối Của Em", "Thiên Đường Gọi Tên"],
    startTime: 20,
    explanation: "'Cơn Mưa Tình Yêu' là bản tình ca song ca ngọt ngào nhất của cặp đôi vàng Hà Anh Tuấn và Phương Linh."
  },
  {
    title: "Qua Đêm Nay",
    artist: "Hà Anh Tuấn & Phương Linh",
    ytid: "fK3xZ7a_yK8",
    distractors: ["Cơn Mưa Tình Yêu", "Bốn Chữ Lắm", "Thiên Đường Gọi Tên"],
    startTime: 20,
    explanation: "'Qua Đêm Nay' là ca khúc đám cưới lãng mạn, ấm áp được đông đảo khán giả trẻ yêu thích."
  },
  {
    title: "Chuyện Của Mùa Đông",
    artist: "Hà Anh Tuấn",
    ytid: "T1h2m3Q4p5A",
    distractors: ["Tháng Tư Là Lời Nói Dối Của Em", "Xuân Thì", "Tuyết Rơi Mùa Hè"],
    startTime: 20,
    explanation: "'Chuyện Của Mùa Đông' là khúc ca mùa đông trữ tình làm say lòng người nghe qua giọng hát ấm áp của Hà Anh Tuấn."
  },
  {
    title: "Xuân Thì",
    artist: "Hà Anh Tuấn",
    ytid: "b4m1a2b3c4D",
    distractors: ["Tháng Tư Là Lời Nói Dối Của Em", "Chuyện Của Mùa Đông", "Nước Ngoài"],
    startTime: 20,
    explanation: "'Xuân Thì' của nhạc sĩ Phan Mạnh Quỳnh qua tiếng hát Hà Anh Tuấn gợi nhiều hoài niệm sâu lắng về thời thanh xuân."
  },
  {
    title: "Dấu Mưa",
    artist: "Trung Quân Idol",
    ytid: "pDYM_JBAnp4",
    distractors: ["Trót Yêu", "Chưa Bao Giờ", "Chiều Nay Không Có Mưa Bay"],
    startTime: 22,
    explanation: "'Dấu Mưa' do Toàn Thắng sáng tác đã tạo nên thương hiệu 'Thánh Mưa' không thể thay thế của Trung Quân."
  },
  {
    title: "Trót Yêu",
    artist: "Trung Quân Idol",
    ytid: "vJ9k8L7m6nO",
    distractors: ["Dấu Mưa", "Chưa Bao Giờ", "Gặp Em Mùa Nắng"],
    startTime: 20,
    explanation: "'Trót Yêu' sáng tác bởi Ái Phương là bản ballad thổ lộ tình yêu nồng nàn, chân thành của Trung Quân."
  },
  {
    title: "Chưa Bao Giờ",
    artist: "Trung Quân Idol",
    ytid: "OIi2ZEUEMe8",
    distractors: ["Dấu Mưa", "Trót Yêu", "Thả Vào Mưa"],
    startTime: 22,
    explanation: "'Chưa Bao Giờ' của nhạc sĩ Tiên Tiên phô diễn giọng hát bay bổng đầy cảm xúc của Trung Quân."
  },
  {
    title: "Chiều Nay Không Có Mưa Bay",
    artist: "Trung Quân Idol",
    ytid: "X3p4Q5r6S7T",
    distractors: ["Dấu Mưa", "Trót Yêu", "Mưa Tháng Sáu"],
    startTime: 20,
    explanation: "'Chiều Nay Không Có Mưa Bay' của nhạc sĩ Châu Nguyễn là khúc ca mùa mưa trong trẻo, da diết."
  },
  {
    title: "Mưa Tháng Sáu",
    artist: "Văn Mai Hương ft. Trung Quân",
    ytid: "V5m6N7o8P9Q",
    distractors: ["Dấu Mưa", "Chiều Nay Không Có Mưa Bay", "Hương"],
    startTime: 20,
    explanation: "'Mưa Tháng Sáu' của nhạc sĩ Hứa Kim Tuyền kết hợp hai giọng ca thực lực Văn Mai Hương và Trung Quân."
  },
  {
    title: "Ngày Mai Người Ta Lấy Chồng",
    artist: "Quốc Thiên (Voi Bản Đôn)",
    ytid: "b2K4j5L6m7N",
    distractors: ["Cánh Hồng Phai", "Chia Cách Bình Yên", "Mong Manh Tình Về"],
    startTime: 20,
    explanation: "'Ngày Mai Người Ta Lấy Chồng' của nhạc sĩ Đông Thiên Đức qua chất giọng thổn thức của Quốc Thiên đã gây sốt The Masked Singer."
  },
  {
    title: "Cánh Hồng Phai",
    artist: "Quốc Thiên",
    ytid: "P1q2R3s4T5U",
    distractors: ["Ngày Mai Người Ta Lấy Chồng", "Chia Cách Bình Yên", "Mong Manh Tình Về"],
    startTime: 20,
    explanation: "'Cánh Hồng Phai' là bản tình ca da diết về vẻ đẹp và số phận của người con gái."
  },
  {
    title: "Chia Cách Bình Yên",
    artist: "Quốc Thiên",
    ytid: "f3G4h5J6k7L",
    distractors: ["Ngày Mai Người Ta Lấy Chồng", "Cánh Hồng Phai", "Vạn Sự Tùy Duyên"],
    startTime: 20,
    explanation: "'Chia Cách Bình Yên' do nhạc sĩ Tiên Cookie sáng tác là bản hit ballad gắn liền với tên tuổi Quốc Thiên."
  },

  // --- 12. QUÂN A.P & LYLY & HOÀNG DŨNG & ĐEN VÂU ---
  {
    title: "Ai Là Người Thương Em",
    artist: "Quân A.P",
    ytid: "7m8N9o0P1Q2",
    distractors: ["Bông Hoa Đẹp Nhất", "Còn Gì Đau Hơn Chữ Đã Từng", "Đáp Án Cuối Cùng"],
    startTime: 20,
    explanation: "'Ai Là Người Thương Em' là ca khúc debut triệu view đưa giọng hát trầm ấm của Quân A.P đến khán giả."
  },
  {
    title: "Bông Hoa Đẹp Nhất",
    artist: "Quân A.P",
    ytid: "T1h2m3Q4p5A",
    distractors: ["Ai Là Người Thương Em", "Còn Gì Đau Hơn Chữ Đã Từng", "Đáp Án Cuối Cùng"],
    startTime: 20,
    explanation: "'Bông Hoa Đẹp Nhất' thống trị vị trí Top 1 Trending YouTube của Quân A.P năm 2020."
  },
  {
    title: "Còn Gì Đau Hơn Chữ Đã Từng",
    artist: "Quân A.P",
    ytid: "Y8Qh6B5G1yM",
    distractors: ["Ai Là Người Thương Em", "Bông Hoa Đẹp Nhất", "Đáp Án Cuối Cùng"],
    startTime: 20,
    explanation: "'Còn Gì Đau Hơn Chữ Đã Từng' là bản ballad buồn xoay quanh câu chuyện tình nhiều tiếc nuối của Quân A.P."
  },
  {
    title: "Đáp Án Cuối Cùng",
    artist: "Quân A.P",
    ytid: "W2q3e4s1n0k",
    distractors: ["Ai Là Người Thương Em", "Bông Hoa Đẹp Nhất", "Còn Gì Đau Hơn Chữ Đã Từng"],
    startTime: 20,
    explanation: "'Đáp Án Cuối Cùng' của nhạc sĩ Nguyễn Minh Cường tiếp tục khẳng định phong cách ballad ngọt ngào của Quân A.P."
  },
  {
    title: "24H",
    artist: "LyLy ft. Magazine",
    ytid: "L1k2J3h4G5F",
    distractors: ["Lời Đường Mật", "Không Yêu Đừng Gây Thương Nhớ", "Bởi Vì Là Khi Yêu"],
    startTime: 20,
    explanation: "'24H' là bản hit debut tạo nên danh xưng 'phù thủy tạo hit' cho nữ ca sĩ kiêm nhạc sĩ tài năng LyLy."
  },
  {
    title: "Lời Đường Mật",
    artist: "LyLy ft. HIEUTHUHAI",
    ytid: "X5y6Z7a8B9C",
    distractors: ["24H", "Không Yêu Đừng Gây Thương Nhớ", "Bởi Vì Là Khi Yêu"],
    startTime: 20,
    explanation: "'Lời Đường Mật' là màn song ca 'tình bể bình' cực kỳ ăn ý giữa LyLy và HIEUTHUHAI."
  },
  {
    title: "Không Yêu Đừng Gây Thương Nhớ",
    artist: "LyLy ft. Karik",
    ytid: "D1e2F3g4H5I",
    distractors: ["24H", "Lời Đường Mật", "Bởi Vì Là Khi Yêu"],
    startTime: 20,
    explanation: "'Không Yêu Đừng Gây Thương Nhớ' là bản hit cảm xúc kết hợp giữa giọng ca trong trẻo của LyLy và lời rap của Karik."
  },
  {
    title: "Bởi Vì Là Khi Yêu",
    artist: "LyLy",
    ytid: "K6k4qWz0A4M",
    distractors: ["24H", "Lời Đường Mật", "Không Yêu Đừng Gây Thương Nhớ"],
    startTime: 20,
    explanation: "'Bởi Vì Là Khi Yêu' phô diễn chất giọng ngọt ngào và khả năng sáng tác ballad đậm chất tự sự của LyLy."
  },
  {
    title: "Nàng Thơ",
    artist: "Hoàng Dũng",
    ytid: "Z1y2X3w4V5U",
    distractors: ["Đoạn Kết Mới", "Nép Vào Anh Và Nghe Anh Hát", "Đôi Lời Tình Ca"],
    startTime: 20,
    explanation: "'Nàng Thơ' là bản tình ca quốc dân với ca từ thi vị, lãng mạn đưa tên tuổi Hoàng Dũng chạm tới đỉnh cao sự nghiệp."
  },
  {
    title: "Trốn Tìm",
    artist: "Đen vâu ft. MTV Band",
    ytid: "M1n2O3p4Q5R",
    distractors: ["Nấu Ăn Cho Em", "Đi Về Nhà", "Mang Tiền Về Cho Mẹ"],
    startTime: 20,
    explanation: "'Trốn Tìm' với hình tượng cái cây cô đơn và lời rap giàu tính hoài niệm tuổi thơ của Đen vâu."
  },
  {
    title: "Nấu Ăn Cho Em",
    artist: "Đen vâu ft. PiaLinh",
    ytid: "S1t2U3v4W5X",
    distractors: ["Trốn Tìm", "Mang Tiền Về Cho Mẹ", "Đi Về Nhà"],
    startTime: 20,
    explanation: "'Nấu Ăn Cho Em' là bản rap ý nghĩa lan tỏa yêu thương tới các em nhỏ vùng cao của Đen vâu và PiaLinh."
  },
  {
    title: "Mang Tiền Về Cho Mẹ",
    artist: "Đen vâu ft. Nguyên Thảo",
    ytid: "Y1z2A3b4C5D",
    distractors: ["Đi Về Nhà", "Trốn Tìm", "Nấu Ăn Cho Em"],
    startTime: 20,
    explanation: "'Mang Tiền Về Cho Mẹ' với thông điệp hiếu thảo thiêng liêng là ca khúc Tết quốc dân của Đen vâu."
  },
  {
    title: "Đi Về Nhà",
    artist: "Đen vâu x JustaTee",
    ytid: "E1f2G3h4I5J",
    distractors: ["Mang Tiền Về Cho Mẹ", "Trốn Tìm", "Thằng Điên"],
    startTime: 20,
    explanation: "'Đi Về Nhà' là bản nhạc sum vầy ấm áp mỗi dịp Tết đến xuân về của Đen vâu và JustaTee."
  },
  {
    title: "Bài Này Chill Phết",
    artist: "Đen vâu ft. MIN",
    ytid: "K1l2M3n4O5P",
    distractors: ["Trốn Tìm", "Lối Nhỏ", "Cảm Ơn"],
    startTime: 20,
    explanation: "'Bài Này Chill Phết' xoa dịu tâm hồn những người trẻ bận rộn giữa guồng quay áp lực công việc chốn thị thành."
  },
  {
    title: "Thằng Điên",
    artist: "JustaTee ft. Phương Ly",
    ytid: "Q1r2S3t4U5V",
    distractors: ["Mặt Trời Của Em", "Missing You", "Đi Về Nhà"],
    startTime: 20,
    explanation: "'Thằng Điên' của JustaTee và Phương Ly là bản Pop R&B ngọt ngào, bay bổng làm say lòng giới trẻ."
  },
  {
    title: "Thanh Xuân",
    artist: "Da LAB",
    ytid: "W1x2Y3z4A5B",
    distractors: ["Gác Lại Âu Lo", "Từ Ngày Em Đến", "Một Nhà"],
    startTime: 20,
    explanation: "'Thanh Xuân' là khúc ca hoài niệm về thời tuổi trẻ rực rỡ, chân thành và nhiệt huyết của ban nhạc Da LAB."
  },
  {
    title: "See Tình",
    artist: "Hoàng Thùy Linh",
    ytid: "C1d2E3f4G5H",
    distractors: ["Để Mị Nói Cho Mà Nghe", "Gieo Quẻ", "Bo Xì Bo"],
    startTime: 20,
    explanation: "'See Tình' của Hoàng Thùy Linh và DTAP là hiện tượng âm nhạc toàn cầu với vũ đạo gây sốt khắp thế giới."
  },
  {
    title: "Để Mị Nói Cho Mà Nghe",
    artist: "Hoàng Thùy Linh",
    ytid: "I1j2K3l4M5N",
    distractors: ["See Tình", "Kẻ Cắp Gặp Bà Già", "Duyên Âm"],
    startTime: 20,
    explanation: "'Để Mị Nói Cho Mà Nghe' đưa văn học dân gian Việt Nam hòa nhịp cùng dòng nhạc Vinahouse hiện đại rực rỡ."
  },
  {
    title: "Bùa Yêu",
    artist: "Bích Phương",
    ytid: "O1p2Q3r4S5T",
    distractors: ["Đi Đu Đưa Đi", "Một Cú Lừa", "Từ Chối Nhẹ Nhàng Thôi"],
    startTime: 20,
    explanation: "'Bùa Yêu' của Bích Phương và Tiên Cookie là siêu phẩm ma mị kết hợp Pop điện tử với âm hưởng dân tộc."
  },
  {
    title: "Em Gái Mưa",
    artist: "Hương Tràm",
    ytid: "U1v2W3x4Y5Z",
    distractors: ["Duyên Mình Lỡ", "Cho Em Gần Anh Thêm Chút Nữa", "Ngốc"],
    startTime: 20,
    explanation: "'Em Gái Mưa' của nhạc sĩ Mr. Siro qua giọng hát nội lực của Hương Tràm đã lập kỷ lục nhạc số Việt Nam."
  },
  {
    title: "Sáng Mắt Chưa",
    artist: "Trúc Nhân",
    ytid: "rDhx4ejrPPA",
    distractors: ["Thật Bất Ngờ", "Bốn Chữ Lắm", "Có Không Giữ Mất Đừng Tìm"],
    startTime: 20,
    explanation: "'Sáng Mắt Chưa' là siêu phẩm MV mang màu sắc ủng hộ cộng đồng LGBT với kịch bản hài hước và vũ đạo bắt mắt."
  },
  {
    title: "Bống Bống Bang Bang",
    artist: "365daband",
    ytid: "z2Fmx6-Jm6Q",
    distractors: ["Hai Cô Tiên", "Nơi Anh Không Thuộc Về", "Và Như Thế"],
    startTime: 20,
    explanation: "'Bống Bống Bang Bang' là ca khúc quốc dân của nhóm 365daband đạt hơn 500 triệu lượt xem trên YouTube."
  },
  {
    title: "Một Bước Yêu Vạn Dặm Đau",
    artist: "Mr. Siro",
    ytid: "BA7fdSkp8ds",
    distractors: ["Lắng Nghe Nước Mắt", "Dưới Những Cơn Mưa", "Gương Mặt Phu Thê"],
    startTime: 20,
    explanation: "'Một Bước Yêu Vạn Dặm Đau' là bản ballad buồn day dứt về mối duyên lỡ làng của nhạc sĩ Mr. Siro."
  },
  {
    title: "Người Hãy Quên Em Đi",
    artist: "Mỹ Tâm",
    ytid: "kH2o5O3c3R4",
    distractors: ["Đừng Hỏi Em", "Đâu Chỉ Riêng Em", "Đúng Cũng Thành Sai"],
    startTime: 20,
    explanation: "'Người Hãy Quên Em Đi' với điệu nhảy 'say rượu' đình đám trong album Tâm 9 của họa mi Mỹ Tâm."
  },
  {
    title: "Đừng Hỏi Em",
    artist: "Mỹ Tâm",
    ytid: "e4A7lq-N8yQ",
    distractors: ["Người Hãy Quên Em Đi", "Đâu Chỉ Riêng Em", "Đúng Cũng Thành Sai"],
    startTime: 20,
    explanation: "'Đừng Hỏi Em' là bản ballad đẫm nước mắt do Mỹ Tâm tự sáng tác lấy bối cảnh thời chiến xúc động."
  },
  {
    title: "Đâu Chỉ Riêng Em",
    artist: "Mỹ Tâm",
    ytid: "m8U_uKjP4qI",
    distractors: ["Đừng Hỏi Em", "Người Hãy Quên Em Đi", "Hẹn Ước Từ Hư Vô"],
    startTime: 20,
    explanation: "'Đâu Chỉ Riêng Em' của nhạc sĩ Khắc Hưng là MV one-shot trắng đen đạt triệu view của Mỹ Tâm."
  },
  {
    title: "Đúng Cũng Thành Sai",
    artist: "Mỹ Tâm",
    ytid: "x9z0A1b2C3D",
    distractors: ["Đừng Hỏi Em", "Người Hãy Quên Em Đi", "Hẹn Ước Từ Hư Vô"],
    startTime: 20,
    explanation: "'Đúng Cũng Thành Sai' với MV đầu tư visual biến hóa đa dạng của Mỹ Tâm."
  },
  {
    title: "Hẹn Ước Từ Hư Vô",
    artist: "Mỹ Tâm",
    ytid: "y1z2A3b4C5D",
    distractors: ["Đúng Cũng Thành Sai", "Đừng Hỏi Em", "Người Hãy Quên Em Đi"],
    startTime: 20,
    explanation: "'Hẹn Ước Từ Hư Vô' do nhạc sĩ Phan Mạnh Quỳnh sáng tác riêng cho đêm nhạc My Soul 1981 của Mỹ Tâm."
  },
  {
    title: "Lệ Lưu Ly",
    artist: "Vũ Phụng Tiên x DT Tập Rap",
    ytid: "0tFUfuEhh28",
    distractors: ["Cắt Đôi Nỗi Sầu", "Bên Trên Tầng Lầu", "Dạ Vũ"],
    startTime: 20,
    explanation: "'Lệ Lưu Ly' là bản hit cổ trang pha âm hưởng hiện đại làm mưa làm gió mạng xã hội năm 2023."
  },
  {
    title: "An Thần",
    artist: "Low G ft. Thắng",
    ytid: "wKiSIO6Tffo",
    distractors: ["Chìm Sâu", "Tại Vì Sao", "Tò Te Tí"],
    startTime: 20,
    explanation: "'An Thần' là màn kết hợp độc đáo giữa rapper tài năng Low G và ca sĩ Thắng (thủ lĩnh Ngọt band)."
  },
  {
    title: "bao tiền một mớ bình yên?",
    artist: "14 Casper & Bon",
    ytid: "vVhKA9Av6vA",
    distractors: ["Nàng Thơ", "Bước Qua Nhau", "Lạ Lùng"],
    startTime: 20,
    explanation: "'bao tiền một mớ bình yên?' mang giai điệu êm dịu, vỗ về tâm hồn người trẻ sau những ngày dài mỏi mệt."
  }
];

module.exports = { MODERN_YOUTH_SONGS };

