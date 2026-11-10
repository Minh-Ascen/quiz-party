const fs = require('fs');

const FULL_SONG_COLLECTION = [
  // ==========================================
  // --- 1. SƠN TÙNG M-TP ---
  // ==========================================
  {
    title: "Em Của Ngày Hôm Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "wyw_Wjwphxg",
    distractors: ["Cơn Mưa Ngang Qua", "Nắng Ấm Xa Dần", "Chắc Ai Đó Sẽ Về"],
    startTime: 16,
    explanation: "'Em Của Ngày Hôm Qua' phát hành cuối năm 2013 là siêu hit bước ngoặt đưa tên tuổi Sơn Tùng M-TP vụt sáng thành ngôi sao hạng A."
  },
  {
    title: "Cơn Mưa Ngang Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "hO4X_mJSqPI",
    distractors: ["Em Của Ngày Hôm Qua", "Nắng Ấm Xa Dần", "Buông Đôi Tay Nhau Ra"],
    startTime: 15,
    explanation: "'Cơn Mưa Ngang Qua' sáng tác năm 2011 khi còn hoạt động trong giới Underground là ca khúc đầu tiên đưa giọng hát Sơn Tùng M-TP đến công chúng."
  },
  {
    title: "Nắng Ấm Xa Dần",
    artist: "Sơn Tùng M-TP",
    ytid: "ErhGuwNgrmw",
    distractors: ["Cơn Mưa Ngang Qua", "Em Của Ngày Hôm Qua", "Khuôn Mặt Đáng Thương"],
    startTime: 15,
    explanation: "'Nắng Ấm Xa Dần' là bản hit sôi động giai đoạn đầu sự nghiệp của Sơn Tùng M-TP được đông đảo khán giả trẻ thuộc lòng."
  },
  {
    title: "Lạc Trôi",
    artist: "Sơn Tùng M-TP",
    ytid: "Llw9Q6akRo4",
    distractors: ["Hãy Trao Cho Anh", "Nơi Này Có Anh", "Chạy Ngay Đi"],
    startTime: 16,
    explanation: "'Lạc Trôi' là bản hit cổ trang pha Future Bass kinh điển đưa tên tuổi Sơn Tùng M-TP vươn tầm châu Á năm 2017."
  },
  {
    title: "Nơi Này Có Anh",
    artist: "Sơn Tùng M-TP",
    ytid: "FN7ALfpGxiI",
    distractors: ["Lạc Trôi", "Hãy Trao Cho Anh", "Muộn Rồi Mà Sao Còn"],
    startTime: 18,
    explanation: "'Nơi Này Có Anh' phát hành đúng dịp Valentine 2017 với bối cảnh quay tuyệt đẹp tại đảo Jeju, Hàn Quốc."
  },
  {
    title: "Chúng Ta Không Thuộc Về Nhau",
    artist: "Sơn Tùng M-TP",
    ytid: "qGRU3sRbaYw",
    distractors: ["Lạc Trôi", "Chạy Ngay Đi", "Nơi Này Có Anh"],
    startTime: 16,
    explanation: "'Chúng Ta Không Thuộc Về Nhau' mang phong cách Tropical House phát hành năm 2016 lập kỷ lục lượt xem ấn tượng của Sơn Tùng M-TP."
  },
  {
    title: "Buông Đôi Tay Nhau Ra",
    artist: "Sơn Tùng M-TP",
    ytid: "LCyo565N_5w",
    distractors: ["Âm Thầm Bên Em", "Chắc Ai Đó Sẽ Về", "Nơi Này Có Anh"],
    startTime: 16,
    explanation: "'Buông Đôi Tay Nhau Ra' ra mắt năm 2015 kể về tâm trạng day dứt nhưng dứt khoát của cặp đôi sau khi chia tay, với sự tham gia của Chi Pu."
  },
  {
    title: "Âm Thầm Bên Em",
    artist: "Sơn Tùng M-TP",
    ytid: "30KI5SuECuc",
    distractors: ["Buông Đôi Tay Nhau Ra", "Chắc Ai Đó Sẽ Về", "Thái Bình Mồ Hôi Rơi"],
    startTime: 18,
    explanation: "'Âm Thầm Bên Em' là phim ca ngắn đầy cảm xúc của Sơn Tùng M-TP trong vai chàng trai giang hồ vì tình yêu mà hoàn lương."
  },
  {
    title: "Chắc Ai Đó Sẽ Về",
    artist: "Sơn Tùng M-TP",
    ytid: "PdbsnGuduvo",
    distractors: ["Thái Bình Mồ Hôi Rơi", "Âm Thầm Bên Em", "Khuôn Mặt Đáng Thương"],
    startTime: 16,
    explanation: "'Chắc Ai Đó Sẽ Về' là ca khúc nhạc phim 'Chàng Trai Năm Ấy' (2014) lấy đi nước mắt của hàng triệu khán giả."
  },
  {
    title: "Chạy Ngay Đi",
    artist: "Sơn Tùng M-TP",
    ytid: "32sYGCOYJUM",
    distractors: ["Lạc Trôi", "Hãy Trao Cho Anh", "Chắc Ai Đó Sẽ Về"],
    startTime: 18,
    explanation: "'Chạy Ngay Đi' (Run Now) phát hành năm 2018 với phong cách Hip-hop Trap ma mị và sự tham gia của ngôi sao Thái Lan Mai Davika."
  },
  {
    title: "Hãy Trao Cho Anh",
    artist: "Sơn Tùng M-TP ft. Snoop Dogg",
    ytid: "knW7-x7Y7RE",
    distractors: ["Lạc Trôi", "Nơi Này Có Anh", "Chúng Ta Của Hiện Tại"],
    startTime: 16,
    explanation: "'Hãy Trao Cho Anh' là siêu hit quốc tế phát hành năm 2019 của Sơn Tùng M-TP kết hợp cùng huyền thoại Snoop Dogg."
  },
  {
    title: "Có Chắc Yêu Là Đây",
    artist: "Sơn Tùng M-TP",
    ytid: "y7-xnyWxgAU",
    distractors: ["Muộn Rồi Mà Sao Còn", "Chúng Ta Của Hiện Tại", "Nơi Này Có Anh"],
    startTime: 16,
    explanation: "'Có Chắc Yêu Là Đây' phát hành đúng dịp sinh nhật tuổi 26 của Sơn Tùng M-TP năm 2020 như lời cảm ơn ngọt ngào gửi tặng người hâm mộ."
  },
  {
    title: "Chúng Ta Của Hiện Tại",
    artist: "Sơn Tùng M-TP",
    ytid: "ydc9DvbAThk",
    distractors: ["Có Chắc Yêu Là Đây", "Muộn Rồi Mà Sao Còn", "Chạy Ngay Đi"],
    startTime: 18,
    explanation: "'Chúng Ta Của Hiện Tại' là bản tình ca Pop R&B hoài niệm thập niên 90 với MV đậm chất điện ảnh retro của Sơn Tùng M-TP."
  },
  {
    title: "Muộn Rồi Mà Sao Còn",
    artist: "Sơn Tùng M-TP",
    ytid: "xypzmu5mMPY",
    distractors: ["Có Chắc Yêu Là Đây", "Chúng Ta Của Hiện Tại", "Nơi Này Có Anh"],
    startTime: 16,
    explanation: "'Muộn Rồi Mà Sao Còn' phát hành năm 2021 với giai điệu Pop R&B tươi vui miêu tả tâm trạng thổn thức khi tương tư."
  },
  {
    title: "Đừng Làm Trái Tim Anh Đau",
    artist: "Sơn Tùng M-TP",
    ytid: "abPmZCZZrFA",
    distractors: ["Chúng Ta Của Tương Lai", "Có Chắc Yêu Là Đây", "Nơi Này Có Anh"],
    startTime: 16,
    explanation: "'Đừng Làm Trái Tim Anh Đau' ra mắt mùa hè 2024 tạo nên cơn sốt bùng nổ khắp châu Á với giai điệu tươi vui, ngọt ngào cùng sự tham gia của diễn viên Thái Lan Pimtha."
  },
  {
    title: "Thái Bình Mồ Hôi Rơi",
    artist: "Sơn Tùng M-TP",
    ytid: "yL1FIv5UzgI",
    distractors: ["Khuôn Mặt Đáng Thương", "Cơn Mưa Ngang Qua", "Nắng Ấm Xa Dần"],
    startTime: 15,
    explanation: "'Thái Bình Mồ Hôi Rơi' do Sơn Tùng M-TP sáng tác dành tặng quê hương Thái Bình và người cha thân yêu trong chương trình The Remix 2015."
  },
  {
    title: "Như Ngày Hôm Qua",
    artist: "Sơn Tùng M-TP",
    ytid: "YtkgtlfKaxM",
    distractors: ["Âm Thầm Bên Em", "Tiến Lên Việt Nam Ơi", "Chắc Ai Đó Sẽ Về"],
    startTime: 15,
    explanation: "'Như Ngày Hôm Qua' là bài ca về tình bạn tri kỷ, gắn kết cộng đồng SKY và luôn vang lên ở phần kết các concert của Sơn Tùng M-TP."
  },

  // ==========================================
  // --- 2. JACK (J97) ---
  // ==========================================
  {
    title: "Hồng Nhan",
    artist: "Jack (J97)",
    ytid: "8x2NjwwHUbQ",
    distractors: ["Bạc Phận", "Sóng Gió", "Sao Em Vô Tình"],
    startTime: 15,
    explanation: "'Hồng Nhan' phát hành đầu năm 2019 với giai điệu kết hợp âm hưởng miền Tây và Rap đã tạo nên bước ngoặt đưa Jack trở thành hiện tượng lớn."
  },
  {
    title: "Bạc Phận",
    artist: "K-ICM ft. Jack",
    ytid: "WX7dUj14Z00",
    distractors: ["Sóng Gió", "Hồng Nhan", "Đom Đóm"],
    startTime: 18,
    explanation: "'Bạc Phận' đạt hàng trăm triệu lượt xem chỉ sau ít tháng, đánh dấu thời kỳ hoàng kim của bộ đôi Jack và K-ICM."
  },
  {
    title: "Sóng Gió",
    artist: "K-ICM ft. Jack",
    ytid: "j8U06veqxdU",
    distractors: ["Bạc Phận", "Hồng Nhan", "Em Gì Ơi"],
    startTime: 18,
    explanation: "'Sóng Gió' là phần tiếp nối của câu chuyện Bạc Phận, từng đạt kỷ lục công chiếu YouTube cao thứ 4 thế giới."
  },
  {
    title: "Sao Em Vô Tình",
    artist: "Jack x Liam",
    ytid: "bI7xde9-3BI",
    distractors: ["Hồng Nhan", "Bạc Phận", "Sóng Gió"],
    startTime: 16,
    explanation: "'Sao Em Vô Tình' là bản ballad buồn da diết về tình yêu tuổi học trò trong sáng của Jack kết hợp cùng Liam."
  },
  {
    title: "Em Gì Ơi",
    artist: "K-ICM ft. Jack",
    ytid: "kYJ5mC7V33w",
    distractors: ["Sóng Gió", "Bạc Phận", "Hoa Hải Đường"],
    startTime: 16,
    explanation: "'Em Gì Ơi' mang giai điệu tươi sáng, dí dỏm tiếp nối chuỗi siêu hit trăm triệu view của bộ đôi Jack và K-ICM năm 2019."
  },
  {
    title: "Hoa Hải Đường",
    artist: "Jack - J97",
    ytid: "Bhg-Gw953b0",
    distractors: ["Đom Đóm", "Là 1 Thằng Con Trai", "LayLaLay"],
    startTime: 18,
    explanation: "'Hoa Hải Đường' mang phong cách Future Bass pha âm hưởng dân tộc cổ phong, đoạt giải Ca khúc pop/ballad được yêu thích tại Zing Music Awards 2020."
  },
  {
    title: "Đom Đóm",
    artist: "Jack - J97",
    ytid: "4CCGI83vOVo",
    distractors: ["Hoa Hải Đường", "Là 1 Thằng Con Trai", "Cuối Cùng Thì"],
    startTime: 18,
    explanation: "'Đom Đóm' là bản ballad ngọt ngào gửi gắm tình cảm của Jack đến cộng đồng người hâm mộ Đom Đóm, với hình tượng thần rừng bảo vệ thiên nhiên."
  },
  {
    title: "Là 1 Thằng Con Trai",
    artist: "Jack - J97",
    ytid: "vjZsxtlJ-_M",
    distractors: ["Hoa Hải Đường", "Đom Đóm", "LayLaLay"],
    startTime: 16,
    explanation: "'Là 1 Thằng Con Trai' đánh dấu sự trở lại solo chính thức của Jack sau biến cố năm 2020 với phong cách Disco Pop mới lạ."
  },
  {
    title: "Thiên Lý Ơi",
    artist: "Jack - J97",
    ytid: "OrDB4jpA1g8",
    distractors: ["Xóa Tên Anh Đi", "Ngôi Sao Cô Đơn", "Cuối Cùng Thì"],
    startTime: 16,
    explanation: "'Thiên Lý Ơi' phát hành đầu năm 2024 tái hiện câu chuyện tình học trò thơ ngây trên vùng đất cao nguyên thanh bình."
  },
  {
    title: "Cuối Cùng Thì",
    artist: "Jack - J97",
    ytid: "CBlt7nwGybQ",
    distractors: ["Ngôi Sao Cô Đơn", "Xóa Tên Anh Đi", "Đom Đóm"],
    startTime: 16,
    explanation: "'Cuối Cùng Thì' mang âm hưởng miền Tây mộc mạc kết hợp điệu chachacha nhẹ nhàng, dễ đi vào lòng người."
  },

  // ==========================================
  // --- 3. VŨ. (HOÀNG THÁI VŨ) ---
  // ==========================================
  {
    title: "Lạ Lùng",
    artist: "Vũ. (Hoàng Thái Vũ)",
    ytid: "F5tS5m86bOI",
    distractors: ["Bước Qua Mùa Cô Đơn", "Bước Qua Nhau", "Đông Kiếm Em"],
    startTime: 15,
    explanation: "'Lạ Lùng' là bản tình ca Indie kinh điển đưa tên tuổi 'Hoàng tử Indie' Vũ. chạm đến trái tim hàng triệu người nghe nhạc."
  },
  {
    title: "Bước Qua Nhau",
    artist: "Vũ.",
    ytid: "ixdSsW5n2rI",
    distractors: ["Lạ Lùng", "Bước Qua Mùa Cô Đơn", "Đông Kiếm Em"],
    startTime: 16,
    explanation: "'Bước Qua Nhau' là bản ballad tự sự đầy cảm xúc về những kỷ niệm tình yêu dở dang và sự buông bỏ bình thản."
  },
  {
    title: "Đông Kiếm Em",
    artist: "Vũ.",
    ytid: "NLBTbCfR-Fg",
    distractors: ["Lạ Lùng", "Bước Qua Nhau", "Bước Qua Mùa Cô Đơn"],
    startTime: 15,
    explanation: "'Đông Kiếm Em' với tiếng guitar mộc mạc và giọng ca trầm ấm của Vũ. là giai điệu quen thuộc sưởi ấm tâm hồn người nghe mỗi mùa đông tới."
  },
  {
    title: "Bước Qua Mùa Cô Đơn",
    artist: "Vũ.",
    ytid: "n6Pnzi6r9NU",
    distractors: ["Bước Qua Nhau", "Lạ Lùng", "Đông Kiếm Em"],
    startTime: 16,
    explanation: "'Bước Qua Mùa Cô Đơn' là khúc tự sự sâu lắng của Vũ. về nỗi cô đơn chất chứa và những hồi ức khó quên của một thời yêu say đắm."
  },
  {
    title: "Những Lời Hứa Bỏ Quên",
    artist: "Vũ. x Dear Jane",
    ytid: "h6RONxjPBf4",
    distractors: ["Bước Qua Nhau", "Dành Hết Xuân Thì Để Chờ Nhau", "Bình Yên"],
    startTime: 16,
    explanation: "'Những Lời Hứa Bỏ Quên' là cú bắt tay bất ngờ giữa 'Hoàng tử Indie' Vũ. và ban nhạc rock Dear Jane của Hong Kong gây sốt cuối năm 2023."
  },
  {
    title: "Dành Hết Xuân Thì Để Chờ Nhau",
    artist: "Vũ. ft. Hà Anh Tuấn",
    ytid: "ngbqjNPSMQk",
    distractors: ["Những Lời Hứa Bỏ Quên", "Bước Qua Nhau", "Tháng Tư Là Lời Nói Dối Của Em"],
    startTime: 18,
    explanation: "'Dành Hết Xuân Thì Để Chờ Nhau' là bản song ca nghẹn ngào giữa Vũ. và thần tượng Hà Anh Tuấn trong album 'Bảo Tàng Của Nuối Tiếc' (2024)."
  },
  {
    title: "Bình Yên",
    artist: "Vũ. ft. Binz",
    ytid: "f9P7_qWrf38",
    distractors: ["Những Lời Hứa Bỏ Quên", "Lạ Lùng", "Đông Kiếm Em"],
    startTime: 16,
    explanation: "'Bình Yên' kết hợp giữa giọng hát tình cảm của Vũ. và những câu rap trầm ấm của Binz mang lại cảm giác an yên, nhẹ nhàng cho người nghe."
  },

  // ==========================================
  // --- 4. BÙI ANH TUẤN ---
  // ==========================================
  {
    title: "Nơi Tình Yêu Bắt Đầu",
    artist: "Bùi Anh Tuấn",
    ytid: "0l8vKaiPFAY",
    distractors: ["Nơi Tình Yêu Kết Thúc", "Phố Không Mùa", "Hẹn Một Mai"],
    startTime: 16,
    explanation: "'Nơi Tình Yêu Bắt Đầu' của nhạc sĩ Tiến Minh tại vòng Giấu mặt The Voice 2012 đã đưa Bùi Anh Tuấn trở thành hiện tượng âm nhạc chấn động."
  },
  {
    title: "Nơi Tình Yêu Kết Thúc",
    artist: "Bùi Anh Tuấn",
    ytid: "N1ADg9fMyQo",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Mơ Hồ", "Hẹn Một Mai"],
    startTime: 16,
    explanation: "'Nơi Tình Yêu Kết Thúc' tiếp nối thành công vang dội của Nơi Tình Yêu Bắt Đầu khẳng định giọng hát nam cao vút hiếm có của Bùi Anh Tuấn."
  },
  {
    title: "Hẹn Một Mai",
    artist: "Bùi Anh Tuấn",
    ytid: "pX6nutvtDnI",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Mơ Hồ", "Phố Không Mùa"],
    startTime: 16,
    explanation: "'Hẹn Một Mai' là ca khúc nhạc phim '4 Năm 2 Chàng 1 Tình Yêu' do Bùi Anh Tuấn thể hiện làm rung động trái tim giới trẻ."
  },
  {
    title: "Phố Không Mùa",
    artist: "Bùi Anh Tuấn ft. Dương Trường Giang",
    ytid: "O85pY6cBX38",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Hẹn Một Mai", "Mơ Hồ"],
    startTime: 16,
    explanation: "'Phố Không Mùa' của Dương Trường Giang khắc họa không gian Hà Nội bảng lảng sương khói và nỗi niềm cô đơn da diết."
  },
  {
    title: "Mơ Hồ",
    artist: "Bùi Anh Tuấn",
    ytid: "_PcSBR2vBlI",
    distractors: ["Nơi Tình Yêu Bắt Đầu", "Hẹn Một Mai", "Thu Cạn"],
    startTime: 16,
    explanation: "'Mơ Hồ' là bản ballad sâu lắng do chính Bùi Anh Tuấn thể hiện những nốt cao nghẹn ngào về cảm giác chới với trong tình yêu."
  },

  // ==========================================
  // --- 5. HÀ ANH TUẤN ---
  // ==========================================
  {
    title: "Tháng Tư Là Lời Nói Dối Của Em",
    artist: "Hà Anh Tuấn",
    ytid: "7HDeem-JaSY",
    distractors: ["Xuân Thì", "Nước Ngoài", "Cứ Thế"],
    startTime: 18,
    explanation: "'Tháng Tư Là Lời Nói Dối Của Em' của nhạc sĩ Phạm Toàn Thắng lấy cảm hứng từ anime Your Lie in April."
  },
  {
    title: "Cơn Mưa Tình Yêu",
    artist: "Hà Anh Tuấn & Phương Linh",
    ytid: "eyEkdYaEs2M",
    distractors: ["Qua Đêm Nay", "Tháng Tư Là Lời Nói Dối Của Em", "Thiên Đường Gọi Tên"],
    startTime: 16,
    explanation: "'Cơn Mưa Tình Yêu' của Mạnh Quân là bản song ca tình yêu bất hủ đưa cặp đôi Hà Anh Tuấn - Phương Linh trở thành biểu tượng của thế hệ 8X - 9X."
  },
  {
    title: "Qua Đêm Nay",
    artist: "Hà Anh Tuấn & Phương Linh",
    ytid: "xoonu8k_Y-o",
    distractors: ["Cơn Mưa Tình Yêu", "Thiên Đường Gọi Tên", "Xuân Thì"],
    startTime: 16,
    explanation: "'Qua Đêm Nay' là khúc ca ngọt ngào về đêm tân hôn lãng mạn, luôn được các cặp đôi lựa chọn trong ngày cưới."
  },
  {
    title: "Chuyện Của Mùa Đông",
    artist: "Hà Anh Tuấn",
    ytid: "qX3PAIhxM3o",
    distractors: ["Tháng Tư Là Lời Nói Dối Của Em", "Xuân Thì", "Người Tình Mùa Đông"],
    startTime: 16,
    explanation: "'Chuyện Của Mùa Đông' do Phạm Toàn Thắng sáng tác mở màn cho chuỗi bài hát bốn mùa làm nên thương hiệu See Sing Share của Hà Anh Tuấn."
  },
  {
    title: "Xuân Thì",
    artist: "Hà Anh Tuấn",
    ytid: "yoQXAyxLj0Q",
    distractors: ["Tháng Tư Là Lời Nói Dối Của Em", "Chuyện Của Mùa Đông", "Nước Ngoài"],
    startTime: 16,
    explanation: "'Xuân Thì' của nhạc sĩ Phan Mạnh Quỳnh qua chất giọng tự sự đầy trải nghiệm của Hà Anh Tuấn là khúc ca hoài niệm về thời thanh xuân tươi đẹp."
  },
  {
    title: "Người Tình Mùa Đông",
    artist: "Hà Anh Tuấn",
    ytid: "dns2WLu8Su8",
    distractors: ["Chuyện Của Mùa Đông", "Xuân Thì", "Cơn Mưa Tình Yêu"],
    startTime: 16,
    explanation: "'Người Tình Mùa Đông' được Hà Anh Tuấn làm mới lại theo phong cách Acoustic nhẹ nhàng, mộc mạc trong See Sing Share mùa 1."
  },

  // ==========================================
  // --- 6. MỸ TÂM ---
  // ==========================================
  {
    title: "Ước Gì",
    artist: "Mỹ Tâm",
    ytid: "On81-1xvt8o",
    distractors: ["Họa Mi Tóc Nâu", "Cây Đàn Sinh Viên", "Dường Như Ta Đã"],
    startTime: 15,
    explanation: "'Ước Gì' của nhạc sĩ Võ Thiện Thanh phát hành năm 2003 là siêu hit thế kỷ đưa Mỹ Tâm trở thành 'Nữ hoàng V-Pop' số 1 Việt Nam."
  },
  {
    title: "Họa Mi Tóc Nâu",
    artist: "Mỹ Tâm",
    ytid: "AFKi9rfYToE",
    distractors: ["Ước Gì", "Cây Đàn Sinh Viên", "Hát Với Dòng Sông"],
    startTime: 15,
    explanation: "'Họa Mi Tóc Nâu' do nhạc sĩ Trần Huân sáng tác đã tạo nên biệt danh gắn liền với suốt sự nghiệp rực rỡ của Mỹ Tâm."
  },
  {
    title: "Cây Đàn Sinh Viên",
    artist: "Mỹ Tâm",
    ytid: "7tIvl1Pvk9E",
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Niềm Tin Chiến Thắng"],
    startTime: 15,
    explanation: "'Cây Đàn Sinh Viên' của nhạc sĩ Quốc An là bài ca gắn liền với ký ức ký túc xá và tuổi thanh xuân của hàng triệu sinh viên Việt Nam."
  },
  {
    title: "Dường Như Ta Đã",
    artist: "Mỹ Tâm",
    ytid: "vJTbCoO5E6E",
    distractors: ["Ước Gì", "Đừng Hỏi Em", "Đâu Chỉ Riêng Em"],
    startTime: 16,
    explanation: "'Dường Như Ta Đã' do chính Mỹ Tâm sáng tác là bản ballad buồn day dứt về sự chia ly sau nhiều năm gắn bó."
  },
  {
    title: "Đâu Chỉ Riêng Em",
    artist: "Mỹ Tâm",
    ytid: "ttd3hNNxfZw",
    distractors: ["Đừng Hỏi Em", "Người Hãy Quên Em Đi", "Đúng Cũng Thành Sai"],
    startTime: 16,
    explanation: "'Đâu Chỉ Riêng Em' (Tâm 9) quay theo phong cách One-shot cận cảnh gương mặt Mỹ Tâm nghẹn ngào rơi nước mắt khi phát hiện người yêu phản bội."
  },
  {
    title: "Đừng Hỏi Em",
    artist: "Mỹ Tâm",
    ytid: "3V-wL4V0Uj8",
    distractors: ["Đâu Chỉ Riêng Em", "Người Hãy Quên Em Đi", "Đúng Cũng Thành Sai"],
    startTime: 18,
    explanation: "'Đừng Hỏi Em' là MV cổ trang thời chiến tranh xúc động với hình ảnh 'chị trợ lý xào rau muống' viral khắp mạng xã hội."
  },
  {
    title: "Đúng Cũng Thành Sai",
    artist: "Mỹ Tâm",
    ytid: "5_ozB0ImkYA",
    distractors: ["Đâu Chỉ Riêng Em", "Đừng Hỏi Em", "Người Hãy Quên Em Đi"],
    startTime: 16,
    explanation: "'Đúng Cũng Thành Sai' phát hành năm 2020 của Mỹ Tâm gây sốt với thông điệp: 'Khi người ta đã hết yêu, thì đúng cũng thành sai'."
  },
  {
    title: "Hẹn Ước Từ Hư Vô",
    artist: "Mỹ Tâm",
    ytid: "W4P8gl4dnrg",
    distractors: ["Người Hãy Quên Em Đi", "Đúng Cũng Thành Sai", "Ước Gì"],
    startTime: 16,
    explanation: "'Hẹn Ước Từ Hư Vô' sáng tác bởi Phan Mạnh Quỳnh gây sốt vang dội trong chuỗi đêm nhạc My Soul 1981 tại Đà Lạt của Mỹ Tâm."
  },
  {
    title: "Người Hãy Quên Em Đi",
    artist: "Mỹ Tâm",
    ytid: "f-BzUepNeZw",
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Đúng Cũng Thành Sai"],
    startTime: 18,
    explanation: "'Người Hãy Quên Em Đi' thuộc album Tâm 9 với điệu nhảy say rượu trứ danh của 'Họa mi tóc nâu' Mỹ Tâm."
  },

  // ==========================================
  // --- 7. LYLY ---
  // ==========================================
  {
    title: "24H",
    artist: "LyLy ft. Magazine",
    ytid: "IpniN1Wq68Y",
    distractors: ["Lời Đường Mật", "Bởi Vì Là Khi Yêu", "Không Yêu Đừng Gây Thương Nhớ"],
    startTime: 15,
    explanation: "'24H' là ca khúc debut của LyLy kết hợp cùng rapper Magazine, nhanh chóng đạt trăm triệu view nhờ giai điệu R&B nhẹ nhàng và bắt tai."
  },
  {
    title: "Lời Đường Mật",
    artist: "LyLy ft. HIEUTHUHAI",
    ytid: "ql0e9SdngD8",
    distractors: ["24H", "Bởi Vì Là Khi Yêu", "Thất Tình Thường Thôi"],
    startTime: 16,
    explanation: "'Lời Đường Mật' đánh dấu màn kết hợp cực kỳ ăn ý giữa LyLy và HIEUTHUHAI tại chương trình King of Rap 2020."
  },
  {
    title: "Không Yêu Đừng Gây Thương Nhớ",
    artist: "LyLy ft. Karik",
    ytid: "XTVWGjWJAdI",
    distractors: ["24H", "Lời Đường Mật", "Bởi Vì Là Khi Yêu"],
    startTime: 16,
    explanation: "'Không Yêu Đừng Gây Thương Nhớ' là bản Pop ngọt ngào nhưng đượm buồn về sự dùng dằng trong tình cảm giữa LyLy và Karik."
  },
  {
    title: "Bởi Vì Là Khi Yêu",
    artist: "LyLy",
    ytid: "CRVmkMRCGfY",
    distractors: ["24H", "Lời Đường Mật", "Rụng Động"],
    startTime: 16,
    explanation: "'Bởi Vì Là Khi Yêu' mang phong cách ma mị cổ tích với tạo hình ma cà rồng quyến rũ của nữ ca sĩ nhạc sĩ tài năng LyLy."
  },

  // ==========================================
  // --- 8. QUÂN A.P ---
  // ==========================================
  {
    title: "Ai Là Người Thương Em",
    artist: "Quân A.P",
    ytid: "INJuqE_34eQ",
    distractors: ["Bông Hoa Đẹp Nhất", "Còn Gì Đau Hơn Chữ Đã Từng", "Đáp Án Cuối Cùng"],
    startTime: 16,
    explanation: "'Ai Là Người Thương Em' của nhạc sĩ Thanh Hưng là ca khúc debut thành công vang dội đưa giọng ca trầm ấm Quân A.P đến khán giả."
  },
  {
    title: "Bông Hoa Đẹp Nhất",
    artist: "Quân A.P",
    ytid: "fTXd-DpN3AI",
    distractors: ["Ai Là Người Thương Em", "Còn Gì Đau Hơn Chữ Đã Từng", "Bạn Tình Tôi"],
    startTime: 16,
    explanation: "'Bông Hoa Đẹp Nhất' lọt top 1 Trending YouTube sau ít ngày ra mắt, là bản hit ballad thành công nhất sự nghiệp của Quân A.P."
  },
  {
    title: "Còn Gì Đau Hơn Chữ Đã Từng",
    artist: "Quân A.P",
    ytid: "FZevI40E6T4",
    distractors: ["Ai Là Người Thương Em", "Bông Hoa Đẹp Nhất", "Đáp Án Cuối Cùng"],
    startTime: 18,
    explanation: "'Còn Gì Đau Hơn Chữ Đã Từng' với MV hành động kịch tính và giai điệu buồn xé lòng củng cố vị trí 'hoàng tử ballad' của Quân A.P."
  },
  {
    title: "Đáp Án Cuối Cùng",
    artist: "Quân A.P",
    ytid: "SSxK9LnFoKM",
    distractors: ["Ai Là Người Thương Em", "Bông Hoa Đẹp Nhất", "Ước Mơ Của Mẹ"],
    startTime: 16,
    explanation: "'Đáp Án Cuối Cùng' của nhạc sĩ Nguyễn Phúc Thiện đưa Quân A.P chạm mốc top thịnh hành với ca từ da diết về sự chia tay."
  },

  // ==========================================
  // --- 9. TRUNG QUÂN IDOL ---
  // ==========================================
  {
    title: "Dấu Mưa",
    artist: "Trung Quân Idol",
    ytid: "q9p69K_9wK0",
    distractors: ["Trót Yêu", "Chưa Bao Giờ", "Chiều Nay Không Có Mưa Bay"],
    startTime: 16,
    explanation: "'Dấu Mưa' do Toàn Thắng sáng tác đã làm nên danh xưng 'Thánh Mưa' của Trung Quân Idol với giọng hát nam cao bay bổng."
  },
  {
    title: "Trót Yêu",
    artist: "Trung Quân Idol",
    ytid: "r7dVph9L2mU",
    distractors: ["Dấu Mưa", "Chưa Bao Giờ", "Thả Vào Mưa"],
    startTime: 16,
    explanation: "'Trót Yêu' của nhạc sĩ Ái Phương qua tiếng hát của Trung Quân là lời tỏ tình ngọt ngào, tha thiết của những trái tim đang yêu."
  },
  {
    title: "Chưa Bao Giờ",
    artist: "Trung Quân Idol",
    ytid: "Zi8wH37hXus",
    distractors: ["Dấu Mưa", "Trót Yêu", "Chiều Nay Không Có Mưa Bay"],
    startTime: 16,
    explanation: "'Chưa Bao Giờ' do Tiên Tiên sáng tác là bản ballad buồn trĩu nặng về nỗi đau chưa bao giờ nguôi ngoai sau tan vỡ."
  },
  {
    title: "Chiều Nay Không Có Mưa Bay",
    artist: "Trung Quân Idol",
    ytid: "0yGNjxPI3lE",
    distractors: ["Dấu Mưa", "Trót Yêu", "Thả Vào Mưa"],
    startTime: 16,
    explanation: "'Chiều Nay Không Có Mưa Bay' của nhạc sĩ Châu Nguyễn là khúc tình ca mùa đông hoài niệm về mối tình đầu trong veo."
  },
  {
    title: "Mưa Tháng Sáu",
    artist: "Văn Mai Hương ft. Trung Quân",
    ytid: "_8vekzCF04Q",
    distractors: ["Dấu Mưa", "Trót Yêu", "Đại Minh Tinh"],
    startTime: 16,
    explanation: "'Mưa Tháng Sáu' do Hứa Kim Tuyền sáng tác với giọng hát hòa quyện đỉnh cao của Văn Mai Hương và Trung Quân Idol."
  },

  // ==========================================
  // --- 10. QUỐC THIÊN ---
  // ==========================================
  {
    title: "Mong Manh Tình Về",
    artist: "Quốc Thiên",
    ytid: "FE_9giI4eyU",
    distractors: ["Chia Cách Bình Yên", "Cánh Hồng Phai", "Lạc Trong Nỗi Đau"],
    startTime: 16,
    explanation: "'Mong Manh Tình Về' của nhạc sĩ Đức Trí là ca khúc gắn liền sâu sắc với chất giọng kỹ thuật, truyền cảm của Quán quân Vietnam Idol Quốc Thiên."
  },
  {
    title: "Chia Cách Bình Yên",
    artist: "Quốc Thiên",
    ytid: "4iXdpA2eTlw",
    distractors: ["Mong Manh Tình Về", "Cánh Hồng Phai", "Vạn Sự Tùy Duyên"],
    startTime: 16,
    explanation: "'Chia Cách Bình Yên' do Tiên Cookie chắp bút là bản tình ca day dứt về sự buông tay để người mình yêu tìm thấy hạnh phúc."
  },
  {
    title: "Cánh Hồng Phai",
    artist: "Quốc Thiên",
    ytid: "nbKobG1hRSU",
    distractors: ["Mong Manh Tình Về", "Chia Cách Bình Yên", "Hơn Cả Yêu"],
    startTime: 16,
    explanation: "'Cánh Hồng Phai' của Dương Khắc Linh được Quốc Thiên thể hiện da diết, thương cảm cho số phận người con gái hồng nhan bạc phận."
  },
  {
    title: "Ngày Mai Người Ta Lấy Chồng",
    artist: "Quốc Thiên (Voi Bản Đôn)",
    ytid: "UEebGmtB1DA",
    distractors: ["Mong Manh Tình Về", "Chia Cách Bình Yên", "Khóa Ly Biệt"],
    startTime: 16,
    explanation: "'Ngày Mai Người Ta Lấy Chồng' của Đông Thiên Đức được Quốc Thiên thể hiện đầy nội lực, xé lòng trong các đêm nhạc phòng trà."
  },

  // ==========================================
  // --- 11. NHẠC 8X - 9X THANH XUÂN BẤT HỦ ---
  // ==========================================
  {
    title: "Thà Rằng Như Thế",
    artist: "Ưng Hoàng Phúc",
    ytid: "IsJ2DXMmOlc",
    distractors: ["Người Ta Nói", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Kỷ Niệm Bỏ Quên"],
    startTime: 18,
    explanation: "'Thà Rằng Như Thế' phát hành năm 2002 trong album đầu tay đưa Ưng Hoàng Phúc trở thành thần tượng tuổi teen bùng nổ nhất."
  },
  {
    title: "Người Ta Nói",
    artist: "Ưng Hoàng Phúc",
    ytid: "AZNAv3rpa4U",
    distractors: ["Thà Rằng Như Thế", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Kỷ Niệm Bỏ Quên"],
    startTime: 15,
    explanation: "'Người Ta Nói' của Nguyễn Hoài Anh với câu hát kinh điển 'Người ta cứ nói đừng quá yêu...' là thanh xuân của thế hệ 8X - 9X."
  },
  {
    title: "Hứa Thật Nhiều Thất Hứa Thật Nhiều",
    artist: "Ưng Hoàng Phúc",
    ytid: "cT31P9bma1E",
    distractors: ["Thà Rằng Như Thế", "Người Ta Nói", "Tôi Đi Tìm Tôi"],
    startTime: 16,
    explanation: "'Hứa Thật Nhiều Thất Hứa Thật Nhiều' tạo nên cơn sốt băng đĩa đầu những năm 2000 đưa Ưng Hoàng Phúc lập kỷ lục doanh số bán đĩa tại Việt Nam."
  },
  {
    title: "Kiếp Đỏ Đen",
    artist: "Duy Mạnh",
    ytid: "SpMKhv3RyW8",
    distractors: ["Hãy Về Đây Bên Anh", "Ta Đâu Có Say", "Dĩ Vãng Cuộc Tình"],
    startTime: 16,
    explanation: "'Kiếp Đỏ Đen' sáng tác và thể hiện bởi Duy Mạnh năm 2004 với thông điệp cảnh tỉnh tệ nạn xã hội đã tạo nên cơn sốt chấn động V-Pop."
  },
  {
    title: "Hãy Về Đây Bên Anh",
    artist: "Duy Mạnh",
    ytid: "jAhCtBI8pzM",
    distractors: ["Kiếp Đỏ Đen", "Giây Phút Chia Xa", "Ta Đâu Có Say"],
    startTime: 16,
    explanation: "'Hãy Về Đây Bên Anh' là bản tình ca lãng mạn đình đám năm 2004 của nhạc sĩ kiêm ca sĩ Duy Mạnh."
  },
  {
    title: "Kiếp Ve Sầu",
    artist: "Đan Trường",
    ytid: "ccCig7MGs_g",
    distractors: ["Tình Khúc Vàng", "Đi Về Nơi Xa", "Mưa Trên Cuộc Tình"],
    startTime: 18,
    explanation: "'Kiếp Ve Sầu' là bản hit nhạc Hoa lời Việt mở màn cho thời kỳ hoàng kim rực rỡ của 'anh Bo' Đan Trường cuối thập niên 90."
  },
  {
    title: "Tình Khúc Vàng",
    artist: "Đan Trường",
    ytid: "UvSfvalvx40",
    distractors: ["Kiếp Ve Sầu", "Dòng Máu Lạc Hồng", "Mãi Mãi Một Tình Yêu"],
    startTime: 20,
    explanation: "'Tình Khúc Vàng' của nhạc sĩ Hoài An đoạt giải Làn Sóng Xanh 2003, là giai điệu thanh xuân của thế hệ 8X - 9X."
  },
  {
    title: "Đi Về Nơi Xa",
    artist: "Đan Trường",
    ytid: "yFIsJkltdH8",
    distractors: ["Kiếp Ve Sầu", "Tình Khúc Vàng", "Mưa Phi Trường"],
    startTime: 16,
    explanation: "'Đi Về Nơi Xa' sáng tác bởi Lê Quang đưa tên tuổi Đan Trường trở thành hiện tượng âm nhạc số một tại Việt Nam năm 1999."
  },
  {
    title: "Chim Trắng Mồ Côi",
    artist: "Đan Trường & Cẩm Ly",
    ytid: "fJYaHNrUMAc",
    distractors: ["Vọng Cổ Buồn", "Áo Mới Cà Mau", "Tình Khúc Vàng"],
    startTime: 20,
    explanation: "'Chim Trắng Mồ Côi' trong phim ca nhạc 'Mưa Buồn' là bản song ca quê hương ăn khách nhất của cặp đôi vàng Đan Trường - Cẩm Ly."
  },
  {
    title: "Tình Thôi Xót Xa",
    artist: "Lam Trường",
    ytid: "f5nRLKySaLQ",
    distractors: ["Katy Katy", "Mưa Phi Trường", "Gót Hồng"],
    startTime: 15,
    explanation: "'Tình Thôi Xót Xa' của nhạc sĩ Bảo Chấn đưa 'anh Hai' Lam Trường mở màn cho làn sóng nhạc trẻ Làn Sóng Xanh năm 1997."
  },
  {
    title: "Nếu Là Anh",
    artist: "The Men",
    ytid: "QxJmITgSYJs",
    distractors: ["Em Luôn Ở Trong Tâm Trí Anh", "Gọi Tên Em Trong Đêm", "Chờ Em Trong Đêm"],
    startTime: 16,
    explanation: "'Nếu Là Anh' của nhóm The Men (Lê Hoàng & Tiến Dũng) là bản tình ca quốc dân được phát khắp nơi những năm 2011 - 2012."
  },
  {
    title: "Em Luôn Ở Trong Tâm Trí Anh",
    artist: "The Men",
    ytid: "TtrnPt1gBw0",
    distractors: ["Nếu Là Anh", "Gọi Tên Em Trong Đêm", "Chính Là Anh"],
    startTime: 16,
    explanation: "'Em Luôn Ở Trong Tâm Trí Anh' là bản ballad ngọt ngào khẳng định vị trí nhóm nhạc nam được yêu thích hàng đầu của The Men."
  },
  {
    title: "Gọi Tên Em Trong Đêm",
    artist: "The Men",
    ytid: "sIFJxUoHv-4",
    distractors: ["Nếu Là Anh", "Em Luôn Ở Trong Tâm Trí Anh", "Ngàn Lần Khắc Tên Em"],
    startTime: 16,
    explanation: "'Gọi Tên Em Trong Đêm' làm say đắm người nghe bởi giai điệu trầm buồn và sự bè phối nhịp nhàng của hai thành viên nhóm The Men."
  },
  {
    title: "Thêm Một Lần Đau",
    artist: "HKT",
    ytid: "FD_wyUDRyjk",
    distractors: ["Nàng Kiều Lỡ Bước", "Giá Như Chưa Từng Quen", "Lời Yêu Đó"],
    startTime: 15,
    explanation: "'Thêm Một Lần Đau' của HKT với vũ đạo xoay tóc ấn tượng từng là hiện tượng gây tranh cãi và viral bậc nhất đầu thập niên 2010."
  },
  {
    title: "Nàng Kiều Lỡ Bước",
    artist: "HKT",
    ytid: "iGC0DgaMYiE",
    distractors: ["Thêm Một Lần Đau", "Giá Như Chưa Từng Quen", "Trú Mưa"],
    startTime: 15,
    explanation: "'Nàng Kiều Lỡ Bước' là ca khúc nhạc Hoa lời Việt cực kỳ phổ biến gắn liền với thời kỳ đỉnh cao của ba chàng trai nhóm HKT."
  },
  {
    title: "Công Chúa Bong Bóng",
    artist: "Bảo Thy",
    ytid: "h1Xl65PcPH4",
    distractors: ["Ngôi Nhà Hoa Hồng", "Kẹo Bông Gòn", "Ngày Buồn Nhất"],
    startTime: 15,
    explanation: "'Công Chúa Bong Bóng' của nhạc sĩ Nguyễn Hoàng Linh đưa Bảo Thy trở thành thần tượng tuổi teen số một qua trò chơi Audition."
  },
  {
    title: "Ngôi Nhà Hoa Hồng",
    artist: "Quang Vinh & Bảo Thy",
    ytid: "xI2NzMPJYmM",
    distractors: ["Công Chúa Bong Bóng", "Vẫn Tin Mình Có Nhau", "Ngọn Đồi Chong Chóng"],
    startTime: 16,
    explanation: "'Ngôi Nhà Hoa Hồng' là bản song ca ngọt ngào của 'Hoàng tử sơn ca' Quang Vinh và 'Công chúa bong bóng' Bảo Thy năm 2008."
  },
  {
    title: "Khóc",
    artist: "Đông Nhi",
    ytid: "LJ7CzmQ05bs",
    distractors: ["Bối Rối", "Ngọt Ngào", "Lời Thú Tội Ngọt Ngào"],
    startTime: 15,
    explanation: "'Khóc' do chính Đông Nhi sáng tác là bản hit đầu tay mở ra sự nghiệp âm nhạc rực rỡ kéo dài gần hai thập kỷ của cô."
  },
  {
    title: "Bối Rối",
    artist: "Đông Nhi",
    ytid: "8NRP2pmqdik",
    distractors: ["Khóc", "Ngọt Ngào", "Chàng Baby Milo"],
    startTime: 15,
    explanation: "'Bối Rối' tiếp nối thành công của Khóc giúp Đông Nhi khẳng định khả năng tự sáng tác và phong cách Pop ngọt ngào, đáng yêu."
  },
  {
    title: "Yêu Lại Từ Đầu",
    artist: "Khắc Việt",
    ytid: "42Uvxt7i5dw",
    distractors: ["Quên", "Như Vậy Nhé", "Suy Nghĩ Trong Anh"],
    startTime: 15,
    explanation: "'Yêu Lại Từ Đầu' năm 2010 của Khắc Việt tạo nên cơn sốt khủng khiếp khắp cả nước với ca từ gần gũi, chân thành về cơ hội thứ hai trong tình yêu."
  },
  {
    title: "Như Vậy Nhé",
    artist: "Khắc Việt",
    ytid: "HvZOB7BpjgM",
    distractors: ["Yêu Lại Từ Đầu", "Quên", "Ngỡ"],
    startTime: 15,
    explanation: "'Như Vậy Nhé' là một trong những bản hit ballad đầu tiên định hình phong cách âm nhạc mộc mạc, xúc cảm của nhạc sĩ Khắc Việt."
  },
  {
    title: "Con Bướm Xuân",
    artist: "Hồ Quang Hiếu",
    ytid: "-41E5B85rTI",
    distractors: ["Không Cảm Xúc", "Nơi Ấy Con Tìm Về", "Túp Lều Lý Tưởng"],
    startTime: 15,
    explanation: "'Con Bướm Xuân' phiên bản remix của Hồ Quang Hiếu là hiện tượng âm nhạc dịp Tết 2014 vang lên rộn rã khắp mọi nẻo đường Việt Nam."
  },
  {
    title: "Không Cảm Xúc",
    artist: "Hồ Quang Hiếu",
    ytid: "YZIjQDZl6Ko",
    distractors: ["Con Bướm Xuân", "Nơi Ấy Con Tìm Về", "Chỉ Cần Em Hạnh Phúc"],
    startTime: 16,
    explanation: "'Không Cảm Xúc' do Nguyễn Đình Vũ sáng tác đã đưa tên tuổi Hồ Quang Hiếu trở thành nam ca sĩ đắt show bậc nhất V-Pop."
  },
  {
    title: "Vì Một Người",
    artist: "Ưng Đại Vệ",
    ytid: "Yb9YFEIi-3w",
    distractors: ["Yêu Một Người Phải Chăng Lầm Lỗi", "Anh Nhớ Em Nhiều", "Lời Hứa"],
    startTime: 15,
    explanation: "'Vì Một Người' là bản hit solo đình đám của cựu thành viên nhóm GMC Ưng Đại Vệ, in đậm trong ký ức thế hệ 8X - 9X."
  },
  {
    title: "Vì Sao",
    artist: "Khởi My",
    ytid: "bZRfNH8N3QY",
    distractors: ["Gửi Cho Anh", "Người Yêu Cũ", "Góc Nhỏ Trong Tim"],
    startTime: 16,
    explanation: "'Vì Sao' do Khởi My và Hoàng Rapper đồng sáng tác đã đoạt giải Zing Music Awards 2011, là bản hit thanh xuân của Khởi My."
  },
  {
    title: "Gửi Cho Anh",
    artist: "Khởi My",
    ytid: "4aXai4qA3aw",
    distractors: ["Vì Sao", "Người Yêu Cũ", "Là Con Gái Thật Tuyệt"],
    startTime: 16,
    explanation: "'Gửi Cho Anh' là phim ca nhạc học đường dài 30 phút từng lập kỷ lục lượt xem nhanh nhất trên YouTube Việt Nam năm 2013."
  },
  {
    title: "Cầu Vồng Khuyết",
    artist: "Tuấn Hưng",
    ytid: "v2luYYn_aAQ",
    distractors: ["Tìm Lại Bầu Trời", "Dĩ Vãng Cuộc Tình", "Nắm Lấy Tay Anh"],
    startTime: 16,
    explanation: "'Cầu Vồng Khuyết' của nhạc sĩ Minh Khang là bản hit quốc dân gắn liền với tên tuổi nam ca sĩ Tuấn Hưng."
  },
  {
    title: "Tìm Lại Bầu Trời",
    artist: "Tuấn Hưng",
    ytid: "Q8kohtX2PC4",
    distractors: ["Cầu Vồng Khuyết", "Nắm Lấy Tay Anh", "Độc Thoại"],
    startTime: 18,
    explanation: "'Tìm Lại Bầu Trời' do nhạc sĩ Khắc Việt sáng tác trở thành một trong những ca khúc được yêu thích nhất của Tuấn Hưng."
  },
  {
    title: "Nắm Lấy Tay Anh",
    artist: "Tuấn Hưng",
    ytid: "p8A3ULXgV3E",
    distractors: ["Tìm Lại Bầu Trời", "Cầu Vồng Khuyết", "Dĩ Vãng Cuộc Tình"],
    startTime: 18,
    explanation: "'Nắm Lấy Tay Anh' do nhạc sĩ Tú Dưa sáng tác, là món quà cưới ngọt ngào mà Tuấn Hưng dành tặng cho người vợ của mình."
  },
  {
    title: "Đôi Mắt",
    artist: "WanBi Tuấn Anh",
    ytid: "CWXMj6A7u-Q",
    distractors: ["Vụt Mất", "Dấu Vết", "Bắt Sóng Cảm Xúc"],
    startTime: 15,
    explanation: "'Đôi Mắt' của cố ca sĩ WanBi Tuấn Anh là bản hit R&B thanh xuân bất hủ in sâu trong tâm trí khán giả thế hệ 8X - 9X."
  },
  {
    title: "Mùa Đông Không Lạnh",
    artist: "Akira Phan",
    ytid: "kNdm8AJuxlQ",
    distractors: ["Lời Nguyền", "Đứng Dậy Vươn Vai", "Điều Ước Giản Đơn"],
    startTime: 15,
    explanation: "'Mùa Đông Không Lạnh' do Nguyễn Văn Chung sáng tác giúp Akira Phan tạo nên cơn sốt bùng nổ khắp các quán nét năm 2008."
  },
  {
    title: "Chiếc Khăn Gió Ấm",
    artist: "Khánh Phương",
    ytid: "aoBfJQFy8N0",
    distractors: ["Tựa Vào Vai Anh", "Mưa Thủy Tinh", "Đành Thôi Quên Lãng"],
    startTime: 16,
    explanation: "'Chiếc Khăn Gió Ấm' phủ sóng toàn bộ các bảng xếp hạng và nhạc chuông điện thoại năm 2008 của nam ca sĩ Khánh Phương."
  },
  {
    title: "Cô Gái Trung Hoa",
    artist: "Lương Bích Hữu",
    ytid: "UEBIeVhplDQ",
    distractors: ["Dằm Trong Tim", "Học Cách Đi Một Mình", "Gọi Tên Tôi Bạn Thân Hỡi"],
    startTime: 15,
    explanation: "'Cô Gái Trung Hoa' là ca khúc debut solo thành công vang dội của cựu thành viên nhóm H.A.T Lương Bích Hữu."
  },
  {
    title: "Dằm Trong Tim",
    artist: "Lương Bích Hữu",
    ytid: "MYKjn9hKW80",
    distractors: ["Cô Gái Trung Hoa", "Quên Cách Yêu", "Nước Mắt Hóa Đá"],
    startTime: 16,
    explanation: "'Dằm Trong Tim' là bản ballad buồn da diết đưa tên tuổi Lương Bích Hữu ghi dấu ấn sâu đậm trong lòng người yêu nhạc."
  },
  {
    title: "Miền Cát Trắng",
    artist: "Quang Vinh",
    ytid: "6EKHvHdyZHA",
    distractors: ["Ngôi Nhà Hoa Hồng", "Dịu Dàng Đến Từng Phút Giây", "Tình Yêu Diệu Kỳ"],
    startTime: 16,
    explanation: "'Miền Cát Trắng' của nhạc sĩ Lê Quang đã làm nên biệt danh 'Hoàng tử sơn ca' của nam ca sĩ Quang Vinh."
  },

  // ==========================================
  // --- 12. BOLERO & DÂN CA TRỮ TÌNH ---
  // ==========================================
  {
    title: "Sầu Tím Thiệp Hồng",
    artist: "Quang Lê & Lệ Quyên",
    ytid: "RVP5N4QXHeQ",
    distractors: ["Duyên Phận", "Con Đường Xưa Em Đi", "Vùng Lá Me Bay"],
    startTime: 20,
    explanation: "'Sầu Tím Thiệp Hồng' do Quang Lê và Lệ Quyên song ca là tuyệt phẩm Bolero bất hủ của nhạc sĩ Hoài Linh & Minh Kỳ."
  },
  {
    title: "Duyên Phận",
    artist: "Như Quỳnh",
    ytid: "ycGfvA1vkR8",
    distractors: ["Sầu Tím Thiệp Hồng", "Đoạn Tuyệt", "Nỗi Buồn Hoa Phượng"],
    startTime: 22,
    explanation: "'Duyên Phận' của nhạc sĩ Thái Thịnh gắn liền với giọng hát ngọt ngào, đượm buồn của danh ca Như Quỳnh."
  },
  {
    title: "Vùng Lá Me Bay",
    artist: "Như Quỳnh",
    ytid: "z8DLkLnemFY",
    distractors: ["Con Đường Xưa Em Đi", "Duyên Phận", "Hoa Nở Về Đêm"],
    startTime: 18,
    explanation: "'Vùng Lá Me Bay' sáng tác bởi nhạc sĩ Anh Việt Thanh là một trong những bản Bolero được yêu thích nhất mọi thời đại."
  },
  {
    title: "Con Đường Xưa Em Đi",
    artist: "Như Quỳnh",
    ytid: "at43TutUGAg",
    distractors: ["Vùng Lá Me Bay", "Sầu Tím Thiệp Hồng", "Chuyến Tàu Hoàng Hôn"],
    startTime: 18,
    explanation: "'Con Đường Xưa Em Đi' của Châu Kỳ và Hồ Đình Phương là nhạc phẩm trữ tình kinh điển về mối tình hoài niệm."
  },
  {
    title: "Áo Mới Cà Mau",
    artist: "Phi Nhung",
    ytid: "ZeuyOyCdsGI",
    distractors: ["Đêm Gành Hào Nghe Điệu Hoài Lang", "Phải Lòng Con Gái Bến Tre", "Bông Điên Điển"],
    startTime: 16,
    explanation: "'Áo Mới Cà Mau' sáng tác bởi nhạc sĩ Thanh Sơn qua tiếng hát cố nghệ sĩ Phi Nhung đã trở thành khúc ca quê hương quốc dân."
  },
  {
    title: "Biển Tình",
    artist: "Đàm Vĩnh Hưng",
    ytid: "ksrPPGuut0c",
    distractors: ["Say Tình", "Lâu Đài Tình Ái", "Xin Lỗi Tình Yêu"],
    startTime: 18,
    explanation: "'Biển Tình' của nhạc sĩ Lam Phương qua chất giọng khàn đặc trưng của Đàm Vĩnh Hưng mang phong cách nồng nàn, đắm say."
  },
  {
    title: "Vọng Cổ Buồn",
    artist: "Cẩm Ly",
    ytid: "VUk6OinfhVg",
    distractors: ["Áo Mới Cà Mau", "Chim Trắng Mồ Côi", "Nỗi Buồn Mẹ Tôi"],
    startTime: 20,
    explanation: "'Vọng Cổ Buồn' của nhạc sĩ Minh Vy là bản dân ca da diết gắn liền với tên tuổi 'chị Tư' Cẩm Ly."
  },
  {
    title: "Nỗi Buồn Hoa Phượng",
    artist: "Phi Nhung",
    ytid: "5ejXL9dXx84",
    distractors: ["Lưu Bút Ngày Xanh", "Ba Tháng Tạ Từ", "Hạ Buồn"],
    startTime: 18,
    explanation: "'Nỗi Buồn Hoa Phượng' của nhạc sĩ Thanh Sơn là bài ca bất hủ về mùa hè, tuổi học trò và nỗi niềm chia tay mái trường."
  },
  {
    title: "Hoa Nở Về Đêm",
    artist: "Lệ Quyên",
    ytid: "ms_T626fr1g",
    distractors: ["Đoạn Tuyệt", "Sầu Lẻ Bóng", "Mưa Nửa Đêm"],
    startTime: 16,
    explanation: "'Hoa Nở Về Đêm' của nhạc sĩ Mạnh Phát qua chất giọng trầm ấm, nức nở của Lệ Quyên chinh phục đông đảo người yêu nhạc vàng."
  },

  // ==========================================
  // --- 13. CÁC SIÊU HIT V-POP VIRAL KHÁC ---
  // ==========================================
  {
    title: "Đi Về Nhà",
    artist: "Đen vâu x JustaTee",
    ytid: "vTJdVE_gjI0",
    distractors: ["Nấu Ăn Cho Em", "Bài Này Chill Phết", "Mang Tiền Về Cho Mẹ"],
    startTime: 18,
    explanation: "'Đi Về Nhà' đạt giải Cống Hiến, ca khúc quốc dân mỗi dịp Tết đến xuân về nhắc nhở mọi người về tổ ấm gia đình."
  },
  {
    title: "Nấu Ăn Cho Em",
    artist: "Đen vâu ft. PiaLinh",
    ytid: "ukHK1GVyr0I",
    distractors: ["Đi Về Nhà", "Trốn Tìm", "Bài Này Chill Phết"],
    startTime: 16,
    explanation: "'Nấu Ăn Cho Em' là dự án âm nhạc thiện nguyện gây quỹ xây trường và nuôi cơm cho hàng nghìn trẻ em vùng cao Điện Biên."
  },
  {
    title: "Trốn Tìm",
    artist: "Đen vâu ft. MTV Band",
    ytid: "Jx_yVyfDa88",
    distractors: ["Đi Về Nhà", "Hai Triệu Năm", "Một Triệu Like"],
    startTime: 18,
    explanation: "'Trốn Tìm' phát hành đúng dịp sinh nhật Đen Vâu năm 2021 với hình ảnh hóa thân thành cái cây chứng kiến sự trưởng thành của con người."
  },
  {
    title: "Bài Này Chill Phết",
    artist: "Đen vâu ft. MIN",
    ytid: "ddaEtFOsFeM",
    distractors: ["Vì Yêu Cứ Đâm Đầu", "Đi Về Nhà", "Cảm Nắng"],
    startTime: 16,
    explanation: "'Bài Này Chill Phết' ra mắt năm 2019 trở thành tuyên ngôn giải tỏa áp lực công việc cho giới văn phòng trẻ."
  },
  {
    title: "Mang Tiền Về Cho Mẹ",
    artist: "Đen vâu ft. Nguyên Thảo",
    ytid: "UVbv-PJXm14",
    distractors: ["Đi Về Nhà", "Nấu Ăn Cho Em", "Trốn Tìm"],
    startTime: 18,
    explanation: "'Mang Tiền Về Cho Mẹ' lan tỏa thông điệp hiếu thảo và sự trân trọng công lao trời biển của đấng sinh thành."
  },
  {
    title: "Có Chàng Trai Viết Lên Cây",
    artist: "Phan Mạnh Quỳnh",
    ytid: "AX3Bsiq-13k",
    distractors: ["Vợ Người Ta", "Từ Đó", "Khi Người Mình Yêu Khóc"],
    startTime: 18,
    explanation: "'Có Chàng Trai Viết Lên Cây' là linh hồn của bộ phim điện ảnh 'Mắt Biếc', kể về mối tình si ngốc của thầy Ngạn dành cho Hà Lan."
  },
  {
    title: "Vợ Người Ta",
    artist: "Phan Mạnh Quỳnh",
    ytid: "2ZIpFytCSVc",
    distractors: ["Có Chàng Trai Viết Lên Cây", "Nước Ngoài", "Hồi Ức"],
    startTime: 16,
    explanation: "'Vợ Người Ta' là hiện tượng âm nhạc năm 2015 với MV hài hước phong cách đám cưới thôn quê phá vỡ mọi kỷ lục xem lúc bấy giờ."
  },
  {
    title: "Nàng Thơ",
    artist: "Hoàng Dũng",
    ytid: "Zzn9-ATB9aU",
    distractors: ["Từ Thích Thích Thành Yêu Yêu", "Đoạn Kết Mới", "Nép Vào Anh Và Nghe Anh Hát"],
    startTime: 16,
    explanation: "'Nàng Thơ' là bản tình ca ngọt ngào, sâu lắng viết về nàng thơ Dao Ánh và tình yêu trong trẻo của tuổi thanh xuân."
  },
  {
    title: "See Tình",
    artist: "Hoàng Thùy Linh",
    ytid: "2S24-y0Ij3Y",
    distractors: ["Để Mị Nói Cho Mà Nghe", "Gieo Quẻ", "Bo Xì Bo"],
    startTime: 16,
    explanation: "'See Tình' với điệu nhảy lắc hông trứ danh tạo nên cơn sốt vũ đạo toàn cầu từ Hàn Quốc, Trung Quốc đến Nam Mỹ năm 2022."
  },
  {
    title: "Để Mị Nói Cho Mà Nghe",
    artist: "Hoàng Thùy Linh",
    ytid: "MzCbEdtNbJ0",
    distractors: ["See Tình", "Gieo Quẻ", "Duyên Âm"],
    startTime: 16,
    explanation: "'Để Mị Nói Cho Mà Nghe' lồng ghép xuất sắc hàng loạt tác phẩm văn học Việt Nam như Vợ chồng A Phủ, Chí Phèo, Lão Hạc."
  },
  {
    title: "Waiting For You",
    artist: "MONO ft. Onionn",
    ytid: "x6QA3m58DQw",
    distractors: ["Em Là", "Quên Anh Đi", "Chăm Hoa"],
    startTime: 16,
    explanation: "'Waiting For You' với chất liệu City Pop thập niên 80 đã đưa tân binh MONO bùng nổ thành hiện tượng V-Pop năm 2022."
  },
  {
    title: "Cắt Đôi Nỗi Sầu",
    artist: "Tăng Duy Tân ft. Drum7",
    ytid: "Qc7_zRjH808",
    distractors: ["Bên Trên Tầng Lầu", "Ngây Thơ", "Dạ Vũ"],
    startTime: 16,
    explanation: "'Cắt Đôi Nỗi Sầu' phủ sóng khắp các bảng xếp hạng và mạng xã hội TikTok năm 2023 với giai điệu vinahouse bắt tai."
  },
  {
    title: "Bên Trên Tầng Lầu",
    artist: "Tăng Duy Tân",
    ytid: "pyf8cbqyfPs",
    distractors: ["Cắt Đôi Nỗi Sầu", "Ngây Thơ", "Tình Đầu"],
    startTime: 15,
    explanation: "'Bên Trên Tầng Lầu' viral khắp châu Á, được nhiều ngôi sao quốc tế cover lại trên các nền tảng video ngắn."
  },
  {
    title: "Thị Mầu",
    artist: "Hòa Minzy x Masew",
    ytid: "0yHtYPeK2Jg",
    distractors: ["Rời Bỏ", "Không Thể Cùng Nhau Suốt Kiếp", "Chấp Nhận"],
    startTime: 16,
    explanation: "'Thị Mầu' kết hợp nghệ thuật Chèo cổ truyền thống với nhạc điện tử hiện đại, khẳng định dấu ấn văn hóa dân gian của Hòa Minzy."
  },
  {
    title: "Bùa Yêu",
    artist: "Bích Phương",
    ytid: "FkOt19CUC30",
    distractors: ["Đi Đu Đưa Đi", "Bao Giờ Lấy Chồng", "Một Cú Lừa"],
    startTime: 16,
    explanation: "'Bùa Yêu' thuộc dự án 'Việt Nam Việt Nam' đưa âm hưởng dân tộc kết hợp hiện đại trở thành trào lưu lớn trong nền âm nhạc V-Pop."
  },
  {
    title: "Thanh Xuân",
    artist: "Da LAB",
    ytid: "GgQFO8dL5XQ",
    distractors: ["Gác Lại Âu Lo", "Nước Mắt Em Lau Bằng Tình Yêu Mới", "Một Nhà"],
    startTime: 16,
    explanation: "'Thanh Xuân' là bản tình ca hoài niệm tuyệt đẹp của Da LAB với sự góp mặt của diễn viên Châu Bùi và Decao."
  },
  {
    title: "Hơn Cả Yêu",
    artist: "Đức Phúc",
    ytid: "__kGJZ-kPno",
    distractors: ["Hết Thương Cạn Nhớ", "Ngày Đầu Tiên", "Ánh Nắng Của Anh"],
    startTime: 16,
    explanation: "'Hơn Cả Yêu' ra mắt dịp Valentine 2020 trở thành bài hát đám cưới quốc dân tôn vinh tình cảm gia đình và tình yêu đích thực."
  },
  {
    title: "Ánh Nắng Của Anh",
    artist: "Đức Phúc",
    ytid: "WyiIGEHQP8o",
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Hết Thương Cạn Nhớ"],
    startTime: 16,
    explanation: "'Ánh Nắng Của Anh' là ca khúc nhạc phim 'Chờ Em Đến Ngày Mai' do nhạc sĩ Khắc Hưng sáng tác."
  },
  {
    title: "Em Gái Mưa",
    artist: "Hương Tràm",
    ytid: "Y29OrOVJUKs",
    distractors: ["Duyên Mình Lỡ", "Cho Em Gần Anh Thêm Chút Nữa", "Ngốc"],
    startTime: 16,
    explanation: "'Em Gái Mưa' do Mr. Siro sáng tác, đạt hàng trăm triệu lượt nghe và tạo nên trào lưu 'thầy giáo mưa' đình đám năm 2017."
  },
  {
    title: "Phía Sau Một Cô Gái",
    artist: "Soobin Hoàng Sơn",
    ytid: "vCIc1g_4JWM",
    distractors: ["Đi Để Trở Về", "Xin Đừng Lặng Im", "Nếu Ngày Ấy"],
    startTime: 16,
    explanation: "'Phía Sau Một Cô Gái' do Tiên Cookie sáng tác với câu hát kinh điển 'Nên anh lùi bước về sau để thấy em rõ hơn'."
  },
  {
    title: "Anh Nhà Ở Đâu Thế",
    artist: "AMEE ft. B Ray",
    ytid: "iE52-XXnQqs",
    distractors: ["Đen Đá Không Đường", "Sao Anh Chưa Về Nhà", "Hai Mươi Hai"],
    startTime: 16,
    explanation: "'Anh Nhà Ở Đâu Thế' là ca khúc debut thành công vang dội của công chúa V-Pop AMEE quay tại thành phố Đà Lạt mộng mơ."
  },
  {
    title: "Sáng Mắt Chưa",
    artist: "Trúc Nhân",
    ytid: "rDhx4ejrPPA",
    distractors: ["Thật Bất Ngờ", "Bốn Chữ Lắm", "Có Không Giữ Mất Đừng Tìm"],
    startTime: 16,
    explanation: "'Sáng Mắt Chưa' là siêu phẩm MV mang màu sắc ủng hộ cộng đồng LGBT với kịch bản hài hước và vũ đạo bắt mắt."
  },
  {
    title: "Một Bước Yêu Vạn Dặm Đau",
    artist: "Mr. Siro",
    ytid: "BA7fdSkp8ds",
    distractors: ["Lắng Nghe Nước Mắt", "Dưới Những Cơn Mưa", "Gương Mặt Phu Thê"],
    startTime: 18,
    explanation: "'Một Bước Yêu Vạn Dặm Đau' là bản ballad buồn day dứt về mối duyên lỡ làng của nhạc sĩ 'hoàng tử sầu bi' Mr. Siro."
  },
  {
    title: "Ngủ Một Mình",
    artist: "HIEUTHUHAI ft. Negav",
    ytid: "STjzkjnLlZ4",
    distractors: ["Cua", "Vệ Tinh", "NOLOVE NOLIFE"],
    startTime: 18,
    explanation: "'Ngủ Một Mình' của HIEUTHUHAI kết hợp Negav tạo nên cơn sốt với giai điệu catchy và vũ đạo lắc hông quyến rũ."
  },
  {
    title: "Nếu Lúc Đó",
    artist: "tlinh ft. 2pillz",
    ytid: "fyMgBQioTLo",
    distractors: ["Gái Độc Thân", "Thích Quá Rùi Nà", "Ghê Sợ"],
    startTime: 16,
    explanation: "'Nếu Lúc Đó' đưa tlinh lên đỉnh cao âm nhạc năm 2023 với bản phối đỉnh cao của producer 2pillz."
  },
  {
    title: "Từng Quen",
    artist: "Wren Evans",
    ytid: "zepHPnUDROE",
    distractors: ["Thích Em Hơi Nhiều", "Cơn Đau Tốt Với Tôi", "Bé Ơi Từ Từ"],
    startTime: 15,
    explanation: "'Từng Quen' nằm trong album 'Loi Choi' làm mưa làm gió khắp mạng xã hội nhờ giai điệu R&B độc đáo của Wren Evans."
  },
  {
    title: "À Lôi",
    artist: "Double2T ft. Masew",
    ytid: "ZbR6dYkqorI",
    distractors: ["Người Miền Núi Chất", "Theo Anh Về Bản", "Chài Điếp Noọng"],
    startTime: 16,
    explanation: "'À Lôi' là cụm từ cảm thán của người Tày đưa 'Người miền núi chất' Double2T trở thành hiện tượng văn hóa lớn năm 2023."
  },
  {
    title: "Thằng Điên",
    artist: "JustaTee ft. Phương Ly",
    ytid: "HXkh7EOqcQ4",
    distractors: ["Mặt Trời Của Em", "Forever Alone", "Đã Lỡ Yêu Em Nhiều"],
    startTime: 16,
    explanation: "'Thằng Điên' do streamer ViruSs đồng sáng tác với JustaTee là câu chuyện tình yêu trong trẻo, cảm động lấy nước mắt người xem."
  },
  {
    title: "Vũ Trụ Có Anh",
    artist: "Phương Mỹ Chi ft. Pháo",
    ytid: "V1ah6tmNUz8",
    distractors: ["Bóng Phù Hoa", "Đẩy Xe Bò", "Chiếc Lược Ngà"],
    startTime: 18,
    explanation: "'Vũ Trụ Có Anh' lấy cảm hứng từ truyện cổ tích Tấm Cám và Cô bé lọ lem, đánh dấu cú lột xác ngoạn mục của Phương Mỹ Chi."
  },
  {
    title: "Bống Bống Bang Bang",
    artist: "365daband",
    ytid: "c7rCyll5AeY",
    distractors: ["Hai Cô Tiên", "Nơi Anh Không Thuộc Về", "Và Như Thế"],
    startTime: 15,
    explanation: "'Bống Bống Bang Bang' là MV đầu tiên của Việt Nam vượt mốc 500 triệu lượt xem trên YouTube, là ca khúc thiếu nhi quốc dân."
  },
  {
    title: "Đường Đến Ngày Vinh Quang",
    artist: "Bức Tường (Trần Lập)",
    ytid: "tJ2measnTc0",
    distractors: ["Tâm Hồn Của Đá", "Bông Hồng Thủy Tinh", "Mắt Đen"],
    startTime: 18,
    explanation: "'Đường Đến Ngày Vinh Quang' là bản hùng ca bất hủ thắp sáng ý chí và niềm tin chiến thắng của ban nhạc Rock Bức Tường."
  }
];

const bankPath = './data/questionBank.json';
const bank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

// Lọc bỏ danh sách cũ của Âm nhạc Việt Nam
const nonMusic = bank.filter(q => q.category !== 'Âm nhạc Việt Nam');

// Tạo danh sách câu hỏi mới
const newMusicQuestions = FULL_SONG_COLLECTION.map((song, idx) => {
  const allOpts = [song.title, ...song.distractors];
  const correctTitle = song.title;
  // Fisher-Yates shuffle
  for (let i = allOpts.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [allOpts[i], allOpts[j]] = [allOpts[j], allOpts[i]];
  }
  const correctIdx = allOpts.indexOf(correctTitle);

  return {
    id: `q-music-${idx + 1}`,
    round_no: Math.floor(idx / 10) + 1,
    question_no: idx + 1,
    category: "Âm nhạc Việt Nam",
    prompt: "Đây là bài hát nào?",
    options: allOpts,
    correct_index: correctIdx,
    explanation: song.explanation,
    image_url: `https://img.youtube.com/vi/${song.ytid}/hqdefault.jpg`,
    audio_url: null,
    video_url: null,
    youtube_video_id: song.ytid,
    start_time: song.startTime || 16, // Bỏ qua intro, phát ngay giai điệu bài hát!
    question_type: "AUDIO_GUESS",
    difficulty: idx < 30 ? "easy" : idx < 75 ? "medium" : "hard",
    points: 1000,
    time_limit: 30,
    source: `${song.artist} - ${song.title}`,
    is_double_points: idx % 5 === 0,
    active: true
  };
});

const updatedBank = [...newMusicQuestions, ...nonMusic];
fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');

console.log(`Đã nạp THÀNH CÔNG ${newMusicQuestions.length} bài hát Việt Nam đa thể loại với toàn bộ Sơn Tùng, Jack97, Vũ, Bùi Anh Tuấn, Hà Anh Tuấn, Mỹ Tâm, LyLy, Quân AP, Trung Quân Idol, Quốc Thiên và nhạc 9x bất hủ!`);
