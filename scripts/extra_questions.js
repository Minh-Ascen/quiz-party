// 120 câu hỏi bổ sung (10 câu x 12 chủ đề) để nâng mỗi chủ đề lên 52 câu (Tổng 624 câu hỏi)
// Đảm bảo dù chỉ chọn 1 chủ đề duy nhất và chọn gói 50 câu/ván vẫn đủ 100% câu hỏi thuộc đúng chủ đề đó.

module.exports = {
  "Doraemon": [
    {
      prompt: "Trong Doraemon, bảo bối nào giúp người dùng nói và hiểu được ngôn ngữ của mọi loài động vật?",
      options: ["Bánh quy biến hình", "Kẹo dẻo phiên dịch", "Bánh mì chuyển ngữ", "Ống nghe tâm tình"],
      correct_index: 2,
      explanation: "Bánh mì chuyển ngữ không chỉ dịch tiếng nước ngoài mà còn giúp hiểu được ngôn ngữ giao tiếp trong nhiều tập truyện.",
      difficulty: "medium"
    },
    {
      prompt: "Tên chú chó cưng của cô bạn Shizuka trong bộ truyện Doraemon là gì?",
      options: ["Peko", "Pero", "Pochi", "Muku"],
      correct_index: 1,
      explanation: "Pero là chú chó gắn bó với Shizuka từ nhỏ và từng được Doraemon cứu sống.",
      difficulty: "hard"
    },
    {
      prompt: "Chú mèo hoang hay bắt nạt chó mèo trong khu phố nhà Nobita tên là gì?",
      options: ["Muku", "Kuro", "Bư (Bell)", "Chibi"],
      correct_index: 0,
      explanation: "Muku là chú chó của Jaian, còn chú mèo hoang dữ tợn trong khu phố thường đối đầu với Doraemon.",
      difficulty: "hard"
    },
    {
      prompt: "Bảo bối nào giúp Nobita có thể bơi lội ngay trong lòng đất như bơi dưới nước?",
      options: ["Kem bơi trong đất", "Phao bơi lòng đất", "Thuốc viên lặn đất", "Quần bơi xuyên thấu"],
      correct_index: 1,
      explanation: "Phao bơi lòng đất và bột bơi lội giúp bơi dưới mặt đất dễ dàng như trong bể bơi.",
      difficulty: "hard"
    },
    {
      prompt: "Trong tập truyện dài 'Nobita và mê cung thiếc', khách sạn trên đảo hoang có tên là gì?",
      options: ["Khách sạn Không Người", "Khách sạn Brikin (Thiếc)", "Khách sạn Hoàng Gia", "Khách sạn Tương Lai"],
      correct_index: 1,
      explanation: "Khách sạn Brikin (Brikin Hotel) được điều hành hoàn toàn bởi các robot bằng thiếc.",
      difficulty: "hard"
    },
    {
      prompt: "Bảo bối 'Khăn trùm thời gian' có hai mặt màu gì để điều khiển thời gian tiến hoặc lùi?",
      options: ["Đỏ và Xanh", "Trắng và Đen", "Vàng và Tím", "Hồng và Lục"],
      correct_index: 0,
      explanation: "Khăn trùm thời gian có một mặt màu đỏ và một mặt màu xanh (hoặc đen) với họa tiết đồng hồ.",
      difficulty: "medium"
    },
    {
      prompt: "Mẹ của Suneo thường bắt cậu đi học thêm những môn năng khiếu nào?",
      options: ["Võ thuật và Bơi lội", "Tiếng Pháp và Violon", "Cờ vây và Thư pháp", "Bóng chày và Đấu kiếm"],
      correct_index: 1,
      explanation: "Mẹ Suneo rất chuộng phong cách quý tộc nên thường bắt cậu học thêm tiếng Pháp, hội họa và âm nhạc.",
      difficulty: "hard"
    },
    {
      prompt: "Ai là tác giả của bộ truyện tranh nổi tiếng 'Con ma Q-Taro' cùng cha đẻ với Doraemon?",
      options: ["Fujiko F. Fujio", "Osamu Tezuka", "Akira Toriyama", "Eiichiro Oda"],
      correct_index: 0,
      explanation: "Bộ đôi họa sĩ Fujiko Fujio là tác giả của cả Doraemon và Con ma Q-Taro.",
      difficulty: "medium"
    },
    {
      prompt: "Khi Doraemon bị chuột gặm mất đôi tai ở thế kỷ 22, lớp sơn màu vàng bị tróc ra khiến cậu chuyển sang màu gì?",
      options: ["Màu xanh lam", "Màu trắng", "Màu hồng", "Màu tím"],
      correct_index: 0,
      explanation: "Vì khóc suốt 3 ngày 3 đêm nên lớp sơn vàng tróc hết, lộ ra màu xanh lam đặc trưng của Doraemon.",
      difficulty: "easy"
    },
    {
      prompt: "Bảo bối nào của Doraemon phát ra sóng âm khiến mọi người xung quanh phải nhảy múa theo nhạc?",
      options: ["Giày khiêu vũ tự động", "Micro hát hay", "Loa thôi miên", "Kèn điều khiển"],
      correct_index: 0,
      explanation: "Đôi giày khiêu vũ hoặc các bảo bối âm nhạc của Doraemon thường tạo ra tình huống dở khóc dở cười.",
      difficulty: "medium"
    }
  ],
  "Conan – Thám tử lừng danh": [
    {
      prompt: "Trong Thám tử lừng danh Conan, mật danh của thành viên bắn tỉa Korn và Chianti thuộc tổ chức nào?",
      options: ["Cảnh sát Tokyo", "Tổ chức Áo Đen", "FBI", "CIA"],
      correct_index: 1,
      explanation: "Chianti và Korn là cặp đôi xạ thủ bắn tỉa chuyên nghiệp của Tổ chức Áo Đen.",
      difficulty: "medium"
    },
    {
      prompt: "Cha của Kaito Kid (Kid đời đầu) có tên thật là gì?",
      options: ["Toichi Kuroba", "Yusaku Kudo", "Ginzo Nakamori", "Kogoro Mori"],
      correct_index: 0,
      explanation: "Toichi Kuroba là ảo thuật gia lừng danh thế giới và là Kaito Kid đời đầu tiên.",
      difficulty: "hard"
    },
    {
      prompt: "Ai là người đã dạy kỹ năng hóa trang đỉnh cao cho cả Vermouth và Yukiko Kudo?",
      options: ["Toichi Kuroba", "Tiến sĩ Agasa", "Hiroshi Agasa", "Heizo Hattori"],
      correct_index: 0,
      explanation: "Cả Sharon Vineyard (Vermouth) và Yukiko Kudo đều từng theo học thuật cải trang từ ảo thuật gia Toichi Kuroba.",
      difficulty: "hard"
    },
    {
      prompt: "Thanh tra cảnh sát tỉnh Nagano bị chột một mắt và chống gậy có tên là gì?",
      options: ["Kansuke Yamato", "Taka'aki Morofushi", "Yui Uehara", "Sango Yokomizo"],
      correct_index: 0,
      explanation: "Kansuke Yamato là thanh tra tài ba của sở cảnh sát tỉnh Nagano.",
      difficulty: "hard"
    },
    {
      prompt: "Biệt danh 'Khổng Minh' là tên gọi của thanh tra nào thuộc sở cảnh sát tỉnh Nagano?",
      options: ["Taka'aki Morofushi", "Kansuke Yamato", "Misao Yamamura", "Jugo Yokomizo"],
      correct_index: 0,
      explanation: "Taka'aki Morofushi (anh trai của Scotch/Hiromitsu Morofushi) có tên chữ trùng với Gia Cát Khổng Minh.",
      difficulty: "hard"
    },
    {
      prompt: "Em trai của Akai Shuichi là một kỳ thủ cờ Shogi chuyên nghiệp tên là gì?",
      options: ["Shukichi Haneda", "Masumi Sera", "Rei Furuya", "Wataru Takagi"],
      correct_index: 0,
      explanation: "Shukichi Haneda là người con thứ hai trong gia đình Akai và là kỳ thủ Shogi sở hữu 7 danh hiệu.",
      difficulty: "hard"
    },
    {
      prompt: "Mẹ của Akai Shuichi và Sera Masumi bị teo nhỏ có biệt danh là gì?",
      options: ["Mary Sera (Em gái ngoài lãnh địa)", "Elena Miyano", "Jodie Starling", "Rumi Wakasa"],
      correct_index: 0,
      explanation: "Bà Mary Sera cũng bị ép uống thuốc độc APTX 4869 và bị teo nhỏ giống Shinichi và Haibara.",
      difficulty: "hard"
    },
    {
      prompt: "Cha mẹ của Haibara Ai (Miyano Shiho) đều là nhà khoa học có tên là gì?",
      options: ["Atsushi Miyano và Elena Miyano", "Yusaku và Yukiko", "Kogoro và Eri", "Ginzo và Aoko"],
      correct_index: 0,
      explanation: "Atsushi Miyano và Elena Miyano ('Hell Angel') là người khởi xướng nghiên cứu thuốc Silver Bullet / APTX 4869.",
      difficulty: "hard"
    },
    {
      prompt: "Thanh tra gà mờ nhất trong truyện Conan, từng được thăng chức nhờ Conan bắn thuốc mê phá án là ai?",
      options: ["Misao Yamamura", "Juzo Megure", "Ninzaburo Shiratori", "Kiyonaga Matsumoto"],
      correct_index: 0,
      explanation: "Misao Yamamura ở tỉnh Gunma là vị thanh tra hậu đậu duy nhất được phong hàm Thanh tra nhờ Conan ngủ gật phá án.",
      difficulty: "medium"
    },
    {
      prompt: "Trong Conan Movie 26 'Tàu ngầm sắt màu đen', hệ thống nhận diện khuôn mặt toàn cầu có tên là gì?",
      options: ["Pacific Buoy (Phao Thái Bình Dương)", "Noah's Ark", "Silver Bullet", "Pandora Box"],
      correct_index: 0,
      explanation: "Cơ sở kỹ thuật hàng hải Pacific Buoy của Interpol là bối cảnh chính trong Conan Movie 26.",
      difficulty: "hard"
    }
  ],
  "Phim Hàn Quốc (K-Drama)": [
    {
      prompt: "Trong bộ phim 'Bệnh viện đa khoa (Hospital Playlist)', nhóm bạn 5 bác sĩ sinh năm bao nhiêu?",
      options: ["Hội 99s (nhập học năm 1999)", "Hội 88s", "Hội 94s", "Hội 97s"],
      correct_index: 0,
      explanation: "Nhóm 5 bác sĩ thân thiết trong Hospital Playlist quen nhau từ năm nhập học đại học Y năm 1999 (Hội 99s).",
      difficulty: "hard"
    },
    {
      prompt: "Nữ diễn viên nào thủ vai nữ luật sư tự kỷ thiên tài Woo Young-woo trong 'Nữ luật sư kỳ lạ Woo Young-woo'?",
      options: ["Park Eun-bin", "Kim Tae-ri", "Kim Go-eun", "Han So-hee"],
      correct_index: 0,
      explanation: "Park Eun-bin đã giành giải Daesang Baeksang nhờ vai diễn xuất sắc Woo Young-woo.",
      difficulty: "medium"
    },
    {
      prompt: "Trong phim 'Nữ luật sư kỳ lạ Woo Young-woo', loài động vật nào mà nữ chính yêu thích nhất?",
      options: ["Cá voi", "Cá heo", "Chim cánh cụt", "Gấu trúc"],
      correct_index: 0,
      explanation: "Woo Young-woo có niềm đam mê mãnh liệt với các loài cá voi và luôn liên tưởng đến cá voi khi tìm ra ý tưởng phá án.",
      difficulty: "easy"
    },
    {
      prompt: "Bộ phim cổ trang xác sống (zombie) đầu tiên của Hàn Quốc do Netflix sản xuất có tên là gì?",
      options: ["Kingdom (Vương triều xác sống)", "All of Us Are Dead", "Sweet Home", "Happiness"],
      correct_index: 0,
      explanation: "Kingdom (Vương triều xác sống) với sự tham gia của Joo Ji-hoon và Bae Doona là bom tấn cổ trang zombie nổi tiếng.",
      difficulty: "medium"
    },
    {
      prompt: "Trong bộ phim 'Tuổi 25, Tuổi 21 (Twenty-Five Twenty-One)', nữ chính Na Hee-do thi đấu môn thể thao nào?",
      options: ["Đấu kiếm", "Bắn cung", "Cầu lông", "Cử tạ"],
      correct_index: 0,
      explanation: "Na Hee-do (do Kim Tae-ri thủ vai) là vận động viên đấu kiếm quốc gia đầy nhiệt huyết.",
      difficulty: "medium"
    },
    {
      prompt: "Bộ phim 'Cậu út nhà tài phiệt (Reborn Rich)' có sự tham gia của nam diễn viên chính nào?",
      options: ["Song Joong-ki", "Lee Jong-suk", "Hyun Bin", "Lee政-jae"],
      correct_index: 0,
      explanation: "Song Joong-ki đảm nhận cả hai vai Yoon Hyun-woo và cậu út Jin Do-jun của tập đoàn Soonyang.",
      difficulty: "medium"
    },
    {
      prompt: "Trong phim 'Cậu út nhà tài phiệt', tập đoàn gia đình tài phiệt trong phim mang tên gì?",
      options: ["Tập đoàn Soonyang", "Tập đoàn Jangga", "Tập đoàn Cheong-ah", "Tập đoàn Queens"],
      correct_index: 0,
      explanation: "Tập đoàn Soonyang do chủ tịch Jin Yang-chul sáng lập là tâm điểm cuộc chiến thừa kế trong phim.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ diễn viên nào đóng vai cô nàng cử tạ Kim Bok-joo trong 'Tiên nữ cử tạ Kim Bok-joo'?",
      options: ["Lee Sung-kyung", "Park Bo-young", "Kim Yoo-jung", "Shin Hye-sun"],
      correct_index: 0,
      explanation: "Lee Sung-kyung và Nam Joo-hyuk tạo nên cặp đôi thanh xuân đáng yêu trong Tiên nữ cử tạ Kim Bok-joo.",
      difficulty: "medium"
    },
    {
      prompt: "Trong bộ phim 'Hoàn hồn (Alchemy of Souls)', vùng đất giả tưởng trong phim có tên là gì?",
      options: ["Vương quốc Daeho", "Vương quốc Goryeo", "Vương quốc Joseon", "Vương quốc Silla"],
      correct_index: 0,
      explanation: "Hoàn hồn lấy bối cảnh tại quốc gia giả tưởng Daeho với các thuật sư điều khiển thủy khí.",
      difficulty: "hard"
    },
    {
      prompt: "Nam diễn viên nào thủ vai chính Jang Uk trong bộ phim cổ trang kỳ ảo 'Hoàn hồn (Alchemy of Souls)'?",
      options: ["Lee Jae-wook", "Hwang Min-hyun", "Cha Eun-woo", "Rowoon"],
      correct_index: 0,
      explanation: "Lee Jae-wook vào vai thiếu gia Jang Uk đầy ấn tượng qua cả 2 phần của bộ phim Hoàn hồn.",
      difficulty: "hard"
    }
  ],
  "Âm nhạc Việt Nam": [
    {
      prompt: "Nhạc sĩ nào là tác giả của ca khúc bất hủ 'Nối vòng tay lớn'?",
      options: ["Trịnh Công Sơn", "Phạm Duy", "Văn Cao", "Trần Tiến"],
      correct_index: 0,
      explanation: "'Nối vòng tay lớn' là một trong những sáng tác nổi tiếng nhất của cố nhạc sĩ Trịnh Công Sơn.",
      difficulty: "easy"
    },
    {
      prompt: "Ca khúc 'Bống bống bang bang' gắn liền với bộ phim điện ảnh Việt Nam nào năm 2016?",
      options: ["Tấm Cám: Chuyện chưa kể", "Cô Ba Sài Gòn", "Trạng Tí", "Mắt Biếc"],
      correct_index: 0,
      explanation: "'Bống bống bang bang' do nhóm 365 thể hiện là nhạc phim chính thức của 'Tấm Cám: Chuyện chưa kể'.",
      difficulty: "medium"
    },
    {
      prompt: "Nhóm nhạc nam 365daband do nữ nghệ sĩ nào thành lập và đào tạo?",
      options: ["Ngô Thanh Vân", "Mỹ Tâm", "Hồ Ngọc Hà", "Đông Nhi"],
      correct_index: 0,
      explanation: "Ngô Thanh Vân và công ty VAA đã đào tạo nhóm 365 gồm Isaac, Jun Phạm, Will, S.T Sơn Thạch và Tronie.",
      difficulty: "medium"
    },
    {
      prompt: "Ai là nhạc sĩ sáng tác ca khúc 'Chiếc khăn gió ấm' từng làm mưa làm gió V-Pop?",
      options: ["Nguyễn Văn Chung", "Khắc Việt", "Mr. Siro", "Tiên Cookie"],
      correct_index: 0,
      explanation: "Nhạc sĩ Nguyễn Văn Chung sáng tác 'Chiếc khăn gió ấm' và ca khúc được Khánh Phương thể hiện rất thành công.",
      difficulty: "hard"
    },
    {
      prompt: "Ca khúc 'Nhật ký của mẹ' (Hiền Thục thể hiện) là sáng tác của nhạc sĩ nào?",
      options: ["Nguyễn Văn Chung", "Đức Trí", "Võ Thiện Thanh", "Huy Tuấn"],
      correct_index: 0,
      explanation: "'Nhật ký của mẹ' là tác phẩm xúc động bậc nhất sự nghiệp của nhạc sĩ Nguyễn Văn Chung.",
      difficulty: "medium"
    },
    {
      prompt: "Nam ca sĩ nào được mệnh danh là 'Hoàng tử tình ca' với chuỗi bản hit 'Nàng thơ', 'Từ đó'?",
      options: ["Hoàng Dũng", "Vũ.", "Thịnh Suy", "Ngọt"],
      correct_index: 0,
      explanation: "Hoàng Dũng là tác giả kiêm ca sĩ thể hiện bản hit 'Nàng thơ' lấy cảm hứng từ chuyện tình của Trịnh Công Sơn.",
      difficulty: "hard"
    },
    {
      prompt: "Nhạc sĩ nào được mệnh danh là 'Hoàng tử Indie' Việt Nam với bản hit 'Lạ lùng', 'Bước qua mùa cô đơn'?",
      options: ["Vũ. (Hoàng Thái Vũ)", "Đen Vâu", "JustaTee", "Rhyder"],
      correct_index: 0,
      explanation: "Vũ. (Hoàng Thái Vũ) nổi tiếng với các bản tình ca Indie sâu lắng như 'Lạ lùng', 'Đông kiếm em'.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ Văn Mai Hương kết hợp với nhạc sĩ Hứa Kim Tuyền trong album nổi tiếng nào năm 2023?",
      options: ["Minh Tinh", "Hoàng", "Tâm 9", "Vũ trụ cò bay"],
      correct_index: 0,
      explanation: "Album 'Minh Tinh' với các bản hit 'Mưa tháng sáu', 'Đại minh tinh' là sự kết hợp của Văn Mai Hương và Hứa Kim Tuyền.",
      difficulty: "hard"
    },
    {
      prompt: "Album 'Vũ trụ cò bay' năm 2023 lấy cảm hứng từ văn học Việt Nam là của nữ ca sĩ nào?",
      options: ["Phương Mỹ Chi", "Hòa Minzy", "Amee", "Bích Phương"],
      correct_index: 0,
      explanation: "Phương Mỹ Chi kết hợp cùng nhóm sản xuất DTAP ra mắt album 'Vũ trụ cò bay' gây tiếng vang lớn.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm sản xuất âm nhạc gồm 3 thành viên đứng sau thành công của album 'Hoàng' (Hoàng Thùy Linh) và 'Vũ trụ cò bay' là ai?",
      options: ["DTAP", "SpaceSpeakers", "Gerdnang", "Tổ Quạ"],
      correct_index: 0,
      explanation: "DTAP là nhóm producer trẻ tài năng chuyên kết hợp chất liệu dân gian Việt Nam với âm nhạc hiện đại.",
      difficulty: "hard"
    }
  ],
  "K-Pop": [
    {
      prompt: "Nhóm nhạc nam K-Pop nào của công ty Pledis (HYBE) được chia thành 3 nhóm nhỏ: Hip-Hop Team, Vocal Team và Performance Team?",
      options: ["SEVENTEEN", "NCT", "Stray Kids", "TXT"],
      correct_index: 0,
      explanation: "SEVENTEEN gồm 13 thành viên + 3 nhóm nhỏ + 1 tập thể = 17.",
      difficulty: "hard"
    },
    {
      prompt: "Trong nhóm nhạc Stray Kids (JYP Entertainment), bộ ba tự sáng tác và sản xuất âm nhạc của nhóm có tên là gì?",
      options: ["3RACHA", "BSS (BooSeokSoon)", "NCT DoJaeJung", "GD&TOP"],
      correct_index: 0,
      explanation: "3RACHA gồm Bang Chan, Changbin và Han là đội ngũ sản xuất âm nhạc chính của Stray Kids.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm nhạc nữ thế hệ 4 nào trực thuộc Starship Entertainment có hai thành viên từng hoạt động trong IZ*ONE là Jang Won-young và An Yu-jin?",
      options: ["IVE", "LE SSERAFIM", "NewJeans", "NMIXX"],
      correct_index: 0,
      explanation: "IVE ra mắt năm 2021 với loạt bản hit 'Eleven', 'Love Dive', 'After LIKE', 'I AM'.",
      difficulty: "hard"
    },
    {
      prompt: "Ca khúc 'Love Dive' của nhóm nhạc IVE đã giành giải Bài hát của năm (Daesang) vào năm nào?",
      options: ["2022", "2020", "2018", "2024"],
      correct_index: 0,
      explanation: "'Love Dive' thống trị các bảng xếp hạng Hàn Quốc và giành hàng loạt giải Daesang cuối năm 2022.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm nhạc nữ LE SSERAFIM trực thuộc công ty con nào của tập đoàn HYBE?",
      options: ["Source Music", "ADOR", "Belift Lab", "Pledis"],
      correct_index: 0,
      explanation: "LE SSERAFIM là nhóm nhạc nữ trực thuộc Source Music (HYBE) với các bản hit 'Antifragile', 'Unforgiven'.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm nhạc nam đầu tiên của nhà YG Entertainment gây sốt với bản hit 'Really Really' năm 2017 là nhóm nào?",
      options: ["WINNER", "iKON", "TREASURE", "BIGBANG"],
      correct_index: 0,
      explanation: "WINNER ra mắt sau chương trình sống còn WIN: Who Is Next và có siêu hit 'Really Really'.",
      difficulty: "hard"
    },
    {
      prompt: "Siêu hit 'Love Scenario' được học sinh tiểu học Hàn Quốc thuộc nằm lòng năm 2018 là của nhóm nhạc nào?",
      options: ["iKON", "WINNER", "BTOB", "MONSTA X"],
      correct_index: 0,
      explanation: "'Love Scenario' của nhóm iKON từng tạo cơn sốt toàn quốc và thắng giải Bài hát của năm tại MMA 2018.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm nhạc nữ Red Velvet của SM Entertainment có 5 thành viên gồm Irene, Seulgi, Wendy, Joy và ai?",
      options: ["Yeri", "Winter", "Karina", "Ningning"],
      correct_index: 0,
      explanation: "Yeri là em út (maknae) gia nhập Red Velvet vào năm 2015 trong đợt quảng bá 'Ice Cream Cake'.",
      difficulty: "hard"
    },
    {
      prompt: "Bản hit mùa hè 'Red Flavor' và bản hit ma mị 'Psycho' là của nhóm nhạc nữ nào?",
      options: ["Red Velvet", "TWICE", "MAMAMOO", "GFRIEND"],
      correct_index: 0,
      explanation: "Red Velvet nổi tiếng với 2 phong cách âm nhạc 'Red' (tươi sáng) và 'Velvet' (quyến rũ, ma mị).",
      difficulty: "medium"
    },
    {
      prompt: "Nhóm nhạc nữ tài năng gồm 4 thành viên Solar, Moonbyul, Wheein và Hwasa có tên là gì?",
      options: ["MAMAMOO", "SISTAR", "2NE1", "Brown Eyed Girls"],
      correct_index: 0,
      explanation: "MAMAMOO nổi tiếng với khả năng hát live đỉnh cao và các bản hit 'HIP', 'Starry Night'.",
      difficulty: "hard"
    }
  ],
  "US-UK": [
    {
      prompt: "Ban nhạc rock huyền thoại nào của Anh là chủ nhân của album 'The Dark Side of the Moon' với bìa hình lăng kính tán sắc ánh sáng?",
      options: ["Pink Floyd", "Led Zeppelin", "The Rolling Stones", "Deep Purple"],
      correct_index: 0,
      explanation: "'The Dark Side of the Moon' (1973) của Pink Floyd là một trong những album bán chạy và vĩ đại nhất lịch sử.",
      difficulty: "hard"
    },
    {
      prompt: "Ca khúc bất hủ 'Hotel California' (1976) là tác phẩm để đời của ban nhạc rock Mỹ nào?",
      options: ["Eagles", "Aerosmith", "Bon Jovi", "Guns N' Roses"],
      correct_index: 0,
      explanation: "Ban nhạc Eagles đã tạo nên kiệt tác 'Hotel California' với đoạn solo guitar huyền thoại.",
      difficulty: "hard"
    },
    {
      prompt: "Ai là giọng ca chính của ban nhạc rock альтернатив Nirvana với ca khúc 'Smells Like Teen Spirit'?",
      options: ["Kurt Cobain", "Chester Bennington", "Axl Rose", "Dave Grohl"],
      correct_index: 0,
      explanation: "Kurt Cobain là thủ lĩnh biểu tượng của dòng nhạc Grunge và ban nhạc Nirvana thập niên 1990.",
      difficulty: "hard"
    },
    {
      prompt: "Cố ca sĩ Chester Bennington là giọng ca chính huyền thoại của ban nhạc rock Mỹ nào?",
      options: ["Linkin Park", "Green Day", "My Chemical Romance", "Imagine Dragons"],
      correct_index: 0,
      explanation: "Chester Bennington cùng Mike Shinoda đã đưa Linkin Park trở thành tượng đài Nu-metal với 'In the End', 'Numb'.",
      difficulty: "hard"
    },
    {
      prompt: "Bộ đôi nhạc điện tử người Pháp từng đội mũ bảo hiểm robot nổi tiếng với bản hit 'Get Lucky' là ai?",
      options: ["Daft Punk", "The Chainsmokers", "Disclosure", "Swedish House Mafia"],
      correct_index: 0,
      explanation: "Daft Punk (Thomas Bangalter và Guy-Manuel) là bộ đôi nhạc điện tử huyền thoại của Pháp.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ người Anh Dua Lipa phát hành album phòng thu thứ hai mang đậm phong cách Disco-pop năm 2020 có tên là gì?",
      options: ["Future Nostalgia", "Radical Optimism", "Renaissance", "Midnights"],
      correct_index: 0,
      explanation: "Album 'Future Nostalgia' với bản hit 'Levitating', 'Don't Start Now' đã mang về giải Grammy cho Dua Lipa.",
      difficulty: "hard"
    },
    {
      prompt: "Nam ca sĩ Harry Styles từng là thành viên của nhóm nhạc nam đình đám nào trước khi hoạt động solo?",
      options: ["One Direction", "Backstreet Boys", "Westlife", "Jonas Brothers"],
      correct_index: 0,
      explanation: "Harry Styles bước ra từ nhóm nhạc One Direction và gặt hái thành công vang dội với 'As It Was', 'Watermelon Sugar'.",
      difficulty: "medium"
    },
    {
      prompt: "Ca khúc 'As It Was' thống trị bảng xếp hạng Billboard Hot 100 suốt 15 tuần năm 2022 nằm trong album nào của Harry Styles?",
      options: ["Harry's House", "Fine Line", "Four", "Midnight Memories"],
      correct_index: 0,
      explanation: "Album 'Harry's House' đã giành giải Album của năm tại lễ trao giải Grammy lần thứ 65.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ trẻ Olivia Rodrigo bùng nổ toàn cầu năm 2021 với đĩa đơn đầu tay nào?",
      options: ["drivers license", "good 4 u", "vampire", "deja vu"],
      correct_index: 0,
      explanation: "'drivers license' nằm trong album đầu tay 'SOUR' đã đưa Olivia Rodrigo thành ngôi sao nhạc Pop thế hệ mới.",
      difficulty: "hard"
    },
    {
      prompt: "Nhóm nhạc pop-rock Imagine Dragons nổi tiếng toàn cầu với các bản hit 'Believer', 'Thunder' và ca khúc nào sau đây?",
      options: ["Radioactive", "Counting Stars", "Viva La Vida", "Wake Me Up"],
      correct_index: 0,
      explanation: "'Radioactive' là một trong những đĩa đơn kim cương nổi tiếng nhất của Imagine Dragons.",
      difficulty: "medium"
    }
  ],
  "Địa lý cơ bản": [
    {
      prompt: "Eo biển nào ngăn cách châu Á và châu Mỹ (giữa vùng Viễn Đông Nga và bang Alaska của Mỹ)?",
      options: ["Eo biển Bering", "Eo biển Gibraltar", "Eo biển Malacca", "Eo biển Magellan"],
      correct_index: 0,
      explanation: "Eo biển Bering nối Thái Bình Dương với Bắc Băng Dương và ngăn cách Nga với bang Alaska (Mỹ).",
      difficulty: "hard"
    },
    {
      prompt: "Eo biển Gibraltar ngăn cách châu Âu (Tây Ban Nha) với châu Phi (Ma-rốc) và nối Đại Tây Dương với biển nào?",
      options: ["Địa Trung Hải", "Biển Đen", "Biển Đỏ", "Biển Bắc"],
      correct_index: 0,
      explanation: "Eo biển Gibraltar là cửa ngõ hàng hải chiến lược nối Đại Tây Dương vào Địa Trung Hải.",
      difficulty: "hard"
    },
    {
      prompt: "Quốc gia nào ở châu Phi được bao bọc hoàn toàn (nằm trọn bên trong) lãnh thổ của nước Cộng hòa Nam Phi?",
      options: ["Lesotho", "Madagascar", "Kenya", "Ai Cập"],
      correct_index: 0,
      explanation: "Vương quốc Lesotho là quốc gia nội lục nằm hoàn toàn bên trong lãnh thổ Cộng hòa Nam Phi.",
      difficulty: "hard"
    },
    {
      prompt: "Thủ đô của đất nước Thổ Nhĩ Kỳ là thành phố nào (nhiều người thường nhầm với Istanbul)?",
      options: ["Ankara", "Istanbul", "Izmir", "Antalya"],
      correct_index: 0,
      explanation: "Ankara mới là thủ đô chính thức của Thổ Nhĩ Kỳ từ năm 1923, còn Istanbul là thành phố lớn nhất.",
      difficulty: "hard"
    },
    {
      prompt: "Thủ đô của quốc gia Nam Mỹ Brazil là thành phố nào (được quy hoạch hình chiếc máy bay)?",
      options: ["Brasília", "Rio de Janeiro", "São Paulo", "Salvador"],
      correct_index: 0,
      explanation: "Brasília trở thành thủ đô của Brazil từ năm 1960 thay cho Rio de Janeiro.",
      difficulty: "hard"
    },
    {
      prompt: "Dòng sông nào chảy qua nhiều quốc gia nhất ở châu Âu (đi qua 10 quốc gia)?",
      options: ["Sông Danube", "Sông Volga", "Sông Rhine", "Sông Seine"],
      correct_index: 0,
      explanation: "Sông Danube bắt nguồn từ Đức và chảy qua 10 quốc gia châu Âu trước khi đổ ra Biển Đen.",
      difficulty: "hard"
    },
    {
      prompt: "Dòng sông dài nhất châu Âu nằm hoàn toàn trên lãnh thổ nước Nga là sông nào?",
      options: ["Sông Volga", "Sông Danube", "Sông Thames", "Sông Dnieper"],
      correct_index: 0,
      explanation: "Sông Volga dài khoảng 3.531 km là con sông dài nhất châu Âu.",
      difficulty: "hard"
    },
    {
      prompt: "Tại Việt Nam, tỉnh nào là nơi con sông Hồng bắt đầu chảy vào đất Việt ('Nơi con sông Hồng chảy vào đất Việt')?",
      options: ["Lào Cai", "Hà Giang", "Yên Bái", "Lai Châu"],
      correct_index: 0,
      explanation: "Sông Hồng chảy vào lãnh thổ Việt Nam tại khu vực Lũng Pô, huyện Bát Xát, tỉnh Lào Cai.",
      difficulty: "hard"
    },
    {
      prompt: "Quần đảo Hoàng Sa trực thuộc thành phố/tỉnh nào của Việt Nam?",
      options: ["Thành phố Đà Nẵng", "Tỉnh Khánh Hòa", "Tỉnh Quảng Ngãi", "Tỉnh Bà Rịa - Vũng Tàu"],
      correct_index: 0,
      explanation: "Huyện đảo Hoàng Sa trực thuộc thành phố Đà Nẵng, còn huyện đảo Trường Sa trực thuộc tỉnh Khánh Hòa.",
      difficulty: "medium"
    },
    {
      prompt: "Quần đảo Trường Sa trực thuộc tỉnh/thành phố nào của Việt Nam?",
      options: ["Tỉnh Khánh Hòa", "Thành phố Đà Nẵng", "Tỉnh Bình Thuận", "Tỉnh Kiên Giang"],
      correct_index: 0,
      explanation: "Huyện đảo Trường Sa là một đơn vị hành chính trực thuộc tỉnh Khánh Hòa của Việt Nam.",
      difficulty: "medium"
    }
  ],
  "Hoạt hình tuổi thơ Nhật Bản": [
    {
      prompt: "Trong bộ anime 'Fullmetal Alchemist (Giả kim thuật sư)', hai anh em nhân vật chính có tên là gì?",
      options: ["Edward Elric và Alphonse Elric", "Eren và Armin", "Tanjiro và Zenitsu", "Gon và Killua"],
      correct_index: 0,
      explanation: "Hai anh em Edward và Alphonse Elric lên đường tìm kiếm Hòn đá Triết gia để khôi phục cơ thể.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ truyện 'Hunter x Hunter (Thợ săn tí hon)', cha của nhân vật chính Gon Freecss tên là gì?",
      options: ["Ging Freecss", "Silva Zoldyck", "Isaac Netero", "Chrollo Lucilfer"],
      correct_index: 0,
      explanation: "Gon tham gia kỳ thi Hunter để tìm người cha huyền thoại Ging Freecss.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Thanh gươm diệt quỷ (Demon Slayer)', Viêm Trụ đã chiến đấu anh dũng trên Chuyến tàu vô tận tên là gì?",
      options: ["Kyojuro Rengoku", "Tengen Uzui", "Giyu Tomioka", "Muichiro Tokito"],
      correct_index: 0,
      explanation: "Viêm Trụ Kyojuro Rengoku là nhân vật để lại ấn tượng sâu sắc nhất trong phần Chuyến tàu vô tận (Mugen Train).",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'One Piece', bác sĩ của băng hải tặc Mũ Rơm là một chú tuần lộc mũi xanh đã ăn trái ác quỷ Hito Hito no Mi tên là gì?",
      options: ["Tony Tony Chopper", "Brook", "Franky", "Jinbe"],
      correct_index: 0,
      explanation: "Tony Tony Chopper là bác sĩ đáng yêu của băng Mũ Rơm, rất thích ăn kẹo bông gòn.",
      difficulty: "medium"
    },
    {
      prompt: "Trong 'One Piece', hoa tiêu của băng Mũ Rơm có tài dự báo thời tiết và vẽ bản đồ thế giới là ai?",
      options: ["Nami", "Nico Robin", "Boa Hancock", "Nefertari Vivi"],
      correct_index: 0,
      explanation: "Nami ('Miêu tặc') là hoa tiêu xuất sắc của băng Mũ Rơm với ước mơ vẽ bản đồ toàn thế giới.",
      difficulty: "easy"
    },
    {
      prompt: "Nhà khảo cổ học duy nhất của băng Mũ Rơm trong 'One Piece' có thể đọc được phiến đá cổ Poneglyph là ai?",
      options: ["Nico Robin", "Nami", "Yamato", "Carrot"],
      correct_index: 0,
      explanation: "Nico Robin quê ở đảo Ohara là người đọc được chữ cổ trên các phiến đá Poneglyph.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ truyện 'Naruto', thầy giáo của Đội 7 (Naruto, Sasuke, Sakura) được mệnh danh là 'Ninja sao chép' tên là gì?",
      options: ["Hatake Kakashi", "Jiraiya", "Might Guy", "Umino Iruka"],
      correct_index: 0,
      explanation: "Hatake Kakashi nổi tiếng với con mắt Sharingan và biệt danh Ninja sao chép hơn 1000 nhẫn thuật.",
      difficulty: "medium"
    },
    {
      prompt: "Trong 'Naruto', ai là Hokage Đệ Tứ (Tia chớp vàng làng Lá) và cũng là cha ruột của Uzumaki Naruto?",
      options: ["Namikaze Minato", "Senju Hashirama", "Senju Tobirama", "Sarutobi Hiruzen"],
      correct_index: 0,
      explanation: "Hokage Đệ Tứ Namikaze Minato ('Tia chớp vàng') và Uzumaki Kushina là cha mẹ của Naruto.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Dragon Ball (7 Viên Ngọc Rồng)', hợp thể giữa Goku và Vegeta bằng bông tai Potara của thần Kaioshin tạo ra chiến binh nào?",
      options: ["Vegito", "Gogeta", "Gotenks", "Broly"],
      correct_index: 0,
      explanation: "Hợp thể bằng bông tai Potara tạo ra Vegito, còn hợp thể bằng điệu nhảy Fusion Dance tạo ra Gogeta.",
      difficulty: "hard"
    },
    {
      prompt: "Đạo diễn huyền thoại người Nhật Bản nào đã đồng sáng lập xưởng phim hoạt hình Studio Ghibli?",
      options: ["Hayao Miyazaki", "Makoto Shinkai", "Mamoru Hosoda", "Hideaki Anno"],
      correct_index: 0,
      explanation: "Hayao Miyazaki là bậc thầy hoạt hình đứng sau Spirited Away, My Neighbor Totoro, Howl's Moving Castle.",
      difficulty: "hard"
    }
  ],
  "Phim & hoạt hình tuổi thơ Trung Quốc": [
    {
      prompt: "Trong 'Tây Du Ký 1986', kiếp nạn thứ 81 của thầy trò Đường Tăng xảy ra khi đang vượt qua con sông nào?",
      options: ["Sông Thông Thiên Hà (do Lão Rùa trắng chở)", "Sông Lưu Sa Hà", "Sông Tử Mẫu Hà", "Hỏa Diệm Sơn"],
      correct_index: 0,
      explanation: "Vì quên hỏi Phật Tổ giúp Lão Rùa trắng trên sông Thông Thiên Hà nên bốn thầy trò bị hất xuống nước, đủ 81 kiếp nạn.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Tây Du Ký', yêu quái Hồng Hài Nhi là con trai của Ngưu Ma Vương và Thiết Phiến Công Chúa sử dụng thứ lửa lợi hại nào?",
      options: ["Tam Muội Chân Hỏa", "Lửa lò bát quái", "Lửa Địa Ngục", "Lửa Phượng Hoàng"],
      correct_index: 0,
      explanation: "Tam Muội Chân Hỏa của Hồng Hài Nhi không thể dập tắt bằng nước mưa thông thường, khiến cả Tôn Ngộ Không cũng suýt nguy khốn.",
      difficulty: "hard"
    },
    {
      prompt: "Ai là vị Bồ Tát đã thu phục Hồng Hài Nhi làm Thiện Tài Đồng Tử trong 'Tây Du Ký'?",
      options: ["Quan Thế Âm Bồ Tát", "Văn Thù Bồ Tát", "Phổ Hiền Bồ Tát", "Thái Thượng Lão Quân"],
      correct_index: 0,
      explanation: "Quan Thế Âm Bồ Tát đã dùng vòng kim cô và đài sen hóa giải sự hung hăng của Hồng Hài Nhi, thu nhận làm Thiện Tài Đồng Tử.",
      difficulty: "medium"
    },
    {
      prompt: "Trong 'Tam Quốc Diễn Nghĩa', trận đại chiến thủy quân nổi tiếng năm 208 mà liên quân Tôn - Lưu dùng hỏa công đánh bại Tào Tháo là trận nào?",
      options: ["Trận Xích Bích", "Trận Quan Độ", "Trận Di Lăng", "Trận Hợp Phì"],
      correct_index: 0,
      explanation: "Trận Xích Bích (Red Cliffs) là trận đánh kinh điển định hình thế chân vạc Tam Quốc (Ngụy - Thục - Ngô).",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Tam Quốc Diễn Nghĩa', Lưu Bị đã phải mấy lần đích thân đến lều cỏ ('Tam cố thảo lư') để mời Gia Cát Lượng xuống núi?",
      options: ["3 lần", "2 lần", "5 lần", "7 lần"],
      correct_index: 0,
      explanation: "Điển tích 'Tam cố thảo lư' nói về việc Lưu Bị 3 lần thành tâm đến lều tranh ở Long Trung mời Gia Cát Khổng Minh.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Thủy Hử', nhân vật Lâm Xung có biệt hiệu trên Lương Sơn Bạc là gì?",
      options: ["Báo Tử Đầu (Đầu Báo)", "Hành Giả", "Hoa Hòa Thượng", "Cửu Văn Long"],
      correct_index: 0,
      explanation: "Giáo đầu 80 vạn cấm quân Lâm Xung có ngoại hiệu là Báo Tử Đầu (Đầu Báo).",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Thủy Hử', vị hảo hán nào tay không nhổ bật gốc cây dương liễu và sử dụng禅 trượng nặng 62 cân?",
      options: ["Hoa Hòa Thượng Lỗ Trí Thâm", "Võ Tòng", "Tống Giang", "Lý Quỳ"],
      correct_index: 0,
      explanation: "Lỗ Trí Thâm (Hoa Hòa Thượng) nổi tiếng với sức mạnh phi thường, tay không nhổ gốc cây dương liễu.",
      difficulty: "hard"
    },
    {
      prompt: "Trong tiểu thuyết 'Anh hùng xạ điêu' của Kim Dung, năm cao thủ võ lâm đứng đầu ('Thiên hạ ngũ tuyệt') tranh tài tại ngọn núi nào?",
      options: ["Núi Hoa Sơn (Hoa Sơn Luận Kiếm)", "Núi Võ Đang", "Núi Nga Mi", "Núi Thiếu Thất"],
      correct_index: 0,
      explanation: "Hoa Sơn Luận Kiếm là cuộc tỷ thí huyền thoại giữa Đông Tà, Tây Độc, Nam Đế, Bắc Cái và Trung Thần Thông.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Anh hùng xạ điêu', biệt danh 'Đông Tà' là của đảo chủ đảo Đào Hoa nào?",
      options: ["Hoàng Dược Sư (cha của Hoàng Dung)", "Âu Dương Phong", "Hồng Thất Công", "Vương Trùng Dương"],
      correct_index: 0,
      explanation: "Đông Tà Hoàng Dược Sư là chủ nhân đảo Đào Hoa và là cha của nữ chính Hoàng Dung.",
      difficulty: "hard"
    },
    {
      prompt: "Bang chủ Cái Bang nổi tiếng với tuyệt kỹ 'Giáng Long Thập Bát Chưởng' và biệt hiệu 'Bắc Cái' trong 'Anh hùng xạ điêu' là ai?",
      options: ["Hồng Thất Công", "Chu Bá Thông", "Quách Tĩnh", "Dương Quá"],
      correct_index: 0,
      explanation: "Bắc Cái Hồng Thất Công là bang chủ Cái Bang, người đã truyền dạy Giáng Long Thập Bát Chưởng cho Quách Tĩnh.",
      difficulty: "hard"
    }
  ],
  "Hoạt hình tuổi thơ Mỹ": [
    {
      prompt: "Trong bộ phim hoạt hình 'Kung Fu Panda', sư phụ dạy võ trực tiếp cho Po và nhóm Ngũ Đại Hào Kiệt có tên là gì?",
      options: ["Sư phụ Shifu", "Đại sư Oogway", "Tai Lung", "Lord Shen"],
      correct_index: 0,
      explanation: "Sư phụ Shifu (loài gấu trúc đỏ) là người trực tiếp huấn luyện Po trở thành Thần Long Đại Hiệp.",
      difficulty: "medium"
    },
    {
      prompt: "Vị đại sư rùa già thông thái sáng lập môn võ Kung Fu trong 'Kung Fu Panda' có tên là gì?",
      options: ["Đại sư Oogway", "Sư phụ Shifu", "Mr. Ping", "Kai"],
      correct_index: 0,
      explanation: "Đại sư rùa Oogway là người đã chọn Po làm Thần Long Đại Hiệp và để lại nhiều câu nói triết lý sâu sắc.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ phim hoạt hình 'Bí kíp luyện rồng (How to Train Your Dragon)', chú rồng Sất Nha (Toothless) thuộc loài rồng quý hiếm nào?",
      options: ["Night Fury (Quỷ Bóng Đêm)", "Light Fury", "Deadly Nadder", "Monstrous Nightmare"],
      correct_index: 0,
      explanation: "Toothless (Sất Nha) là cá thể rồng Night Fury cực kỳ thông minh và nhanh nhẹn, bạn đồng hành của Hiccup.",
      difficulty: "hard"
    },
    {
      prompt: "Trong 'Đi tìm Nemo (Finding Nemo)', cô cá xanh hay bị mất trí nhớ ngắn hạn đồng hành cùng cá bố Marlin tên là gì?",
      options: ["Dory", "Coral", "crush", "Bruce"],
      correct_index: 0,
      explanation: "Cô cá Dory vui tính hay quên (do Ellen DeGeneres lồng tiếng) đã giúp Marlin vượt đại dương đến Sydney tìm Nemo.",
      difficulty: "medium"
    },
    {
      prompt: "Trong 'Finding Nemo', địa chỉ phòng khám nha khoa ở Sydney mà Dory cố nhớ trên chiếc kính lặn là gì?",
      options: ["P. Sherman, 42 đường Wallaby, Sydney", "Số 10 đường Downing, London", "Số 221B phố Baker", "Số 742 Evergreen Terrace"],
      correct_index: 0,
      explanation: "'P. Sherman, 42 Wallaby Way, Sydney' là một trong những câu thoại kinh điển nhất lịch sử phim Pixar.",
      difficulty: "hard"
    },
    {
      prompt: "Trong phim hoạt hình 'Monsters, Inc. (Công ty Quái vật)', cô bé loài người lạc vào thế giới quái vật được Sully đặt tên là gì?",
      options: ["Boo", "Riley", "Vanellope", "Agnes"],
      correct_index: 0,
      explanation: "Chú quái vật lông xanh Sully đặt biệt danh cho cô bé là 'Boo'.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ phim 'Inside Out (Những mảnh ghép cảm xúc)' của Pixar, 5 cảm xúc gốc trong tâm trí cô bé Riley gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và ai?",
      options: ["Chán Ghét (Disgust)", "Lo Âu (Anxiety)", "Xấu Hổ (Embarrassment)", "Ghen Tị (Envy)"],
      correct_index: 0,
      explanation: "Trong phần 1, 5 cảm xúc cơ bản là Joy (Vui), Sadness (Buồn), Anger (Giận), Fear (Sợ) và Disgust (Chán ghét).",
      difficulty: "hard"
    },
    {
      prompt: "Trong phim hoạt hình 'WALL-E (Robot biết yêu)' của Pixar, cô robot thăm dò hiện đại màu trắng mà WALL-E đem lòng yêu tên là gì?",
      options: ["EVE", "AUTO", "M-O", "HAL"],
      correct_index: 0,
      explanation: "EVE (Extraterrestrial Vegetation Evaluator) được gửi xuống Trái Đất để tìm kiếm mầm sống thực vật.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ phim hoạt hình 'Coco' (2017) lấy bối cảnh lễ hội Người Chết ở Mexico, bài hát chủ đề đoạt giải Oscar có tên là gì?",
      options: ["Remember Me", "Un Poco Loco", "La Llorona", "Dos Oruguitas"],
      correct_index: 0,
      explanation: "'Remember Me' là bài hát cảm động kết nối cậu bé Miguel với người cụ cố Coco.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ phim hoạt hình 'Zootopia (Phi vụ động trời)', cô thỏ cảnh sát đầu tiên của thành phố tên là gì?",
      options: ["Judy Hopps", "Nick Wilde", "Gazelle", "Bellwether"],
      correct_index: 0,
      explanation: "Cô thỏ cảnh sát Judy Hopps cùng chú cáo Nick Wilde đã phá vỡ âm mưu lớn tại thành phố Zootopia.",
      difficulty: "hard"
    }
  ],
  "Đoán tên ca sĩ nổi tiếng": [
    {
      prompt: "Nam ca sĩ kiêm nhạc sĩ người Anh nào nổi tiếng với cặp kính sặc sỡ và các bản tình ca trên đàn dương cầm như 'Rocket Man', 'Your Song'?",
      options: ["Elton John", "Billy Joel", "Sting", "Phil Collins"],
      correct_index: 0,
      explanation: "Sir Elton John là huyền thoại âm nhạc nước Anh và là tác giả nhạc phim Vua Sư Tử ('Can You Feel the Love Tonight').",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ người Mỹ nào được mệnh danh là 'Nữ hoàng nhạc Pop (Queen of Pop)' với các bản hit thập niên 80 như 'Like a Prayer', 'Material Girl'?",
      options: ["Madonna", "Cyndi Lauper", "Cher", "Janet Jackson"],
      correct_index: 0,
      explanation: "Madonna được sách Kỷ lục Guinness công nhận là Nữ nghệ sĩ âm nhạc bán đĩa chạy nhất mọi thời đại.",
      difficulty: "hard"
    },
    {
      prompt: "Nam ca sĩ nhạc đồng quê kiêm pop người Mỹ nào kết hợp với Lil Nas X trong siêu hit phá kỷ lục 'Old Town Road'?",
      options: ["Billy Ray Cyrus (cha của Miley Cyrus)", "Blake Shelton", "Keith Urban", "Luke Combs"],
      correct_index: 0,
      explanation: "Bản remix 'Old Town Road' của Lil Nas X và Billy Ray Cyrus giữ vị trí #1 Billboard Hot 100 suốt 19 tuần liên tiếp.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ SZA kết hợp cùng Kendrick Lamar trong ca khúc nhạc phim 'Black Panther' nổi tiếng nào?",
      options: ["All the Stars", "Sunflower", "Kill Bill", "Snooze"],
      correct_index: 0,
      explanation: "'All the Stars' của Kendrick Lamar và SZA được đề cử giải Oscar cho Ca khúc nhạc phim xuất sắc nhất.",
      difficulty: "hard"
    },
    {
      prompt: "Nam ca sĩ Post Malone kết hợp với Swae Lee trong ca khúc nhạc phim hoạt hình 'Spider-Man: Into the Spider-Verse' nào?",
      options: ["Sunflower", "Circles", "Rockstar", "Congratulations"],
      correct_index: 0,
      explanation: "'Sunflower' là đĩa đơn đầu tiên trong lịch sử RIAA đạt chứng nhận Kim cương kép (20x Platinum).",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ Lana Del Rey nổi tiếng với phong cách âm nhạc hoài cổ (cinematic pop) và bản hit năm 2012 nào?",
      options: ["Summertime Sadness", "Born to Die", "Young and Beautiful", "Video Games"],
      correct_index: 0,
      explanation: "'Summertime Sadness' và album 'Born to Die' đã định hình phong cách âm nhạc đặc trưng của Lana Del Rey.",
      difficulty: "hard"
    },
    {
      prompt: "Tại Việt Nam, bốn nữ ca sĩ Thanh Lam, Hồng Nhung, Mỹ Linh và Trần Thu Hà được giới chuyên môn tôn vinh là gì?",
      options: ["Bốn Diva nhạc Việt", "Bộ tứ hoàn hảo", "Tứ đại mỹ nhân", "Nữ hoàng nhạc nhẹ"],
      correct_index: 0,
      explanation: "Thanh Lam, Hồng Nhung, Mỹ Linh và Hà Trần là 4 Diva tiêu biểu của nền nhạc nhẹ Việt Nam đương đại.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ Hồng Nhung có tên gọi thân mật gắn liền với tuổi thơ ở Hà Nội là gì?",
      options: ["Cô Bống", "Họa mi tóc nâu", "Tóc ngắn", "Chim sơn ca"],
      correct_index: 0,
      explanation: "Diva Hồng Nhung có biệt danh thân mật là 'Bống' và được nhạc sĩ Trịnh Công Sơn viết tặng bài 'Bống bồng ơi'.",
      difficulty: "hard"
    },
    {
      prompt: "Nữ ca sĩ Mỹ Linh gắn liền với hình ảnh và bản hit thương hiệu nào do nhạc sĩ Anh Quân - Huy Tuấn sáng tác?",
      options: ["Tóc ngắn", "Giọt sương trên mí mắt", "Ước gì", "Hương ngọc lan"],
      correct_index: 0,
      explanation: "Album và ca khúc 'Tóc ngắn' đã tạo nên cuộc cách mạng nhạc R&B/Soul tại Việt Nam cuối thập niên 90.",
      difficulty: "hard"
    },
    {
      prompt: "Nam ca sĩ Tùng Dương nổi tiếng với phong cách âm nhạc dân gian đương đại và bản hit viral năm 2024 nào do Đông Thiên Đức sáng tác?",
      options: ["Tái sinh", "Chiếc khăn Piêu", "Con cò", "Ngày chưa giông bão"],
      correct_index: 0,
      explanation: "Ca khúc 'Tái sinh' và 'Một vòng Việt Nam' qua giọng hát Tùng Dương đã tạo nên cơn sốt lớn năm 2024.",
      difficulty: "medium"
    }
  ],
  "Phim Mỹ & Phim Việt Nam": [
    {
      prompt: "Bộ phim Hàn Quốc đầu tiên trong lịch sử giành giải Oscar 'Phim hay nhất (Best Picture)' năm 2020 là bộ phim nào?",
      options: ["Parasite (Ký sinh trùng)", "Minari", "Oldboy", "Train to Busan"],
      correct_index: 0,
      explanation: "'Parasite' của đạo diễn Bong Joon-ho đã làm nên lịch sử với 4 tượng vàng Oscar danh giá.",
      difficulty: "medium"
    },
    {
      prompt: "Trong bộ phim 'Everything Everywhere All at Once (Cuộc chiến đa vũ trụ)', nữ diễn viên gốc Á nào đã giành giải Oscar Nữ chính xuất sắc nhất?",
      options: ["Dương Tử Quỳnh (Michelle Yeoh)", "Lưu Diệc Phi", "Củng Lợi", "Chương Tử Di"],
      correct_index: 0,
      explanation: "Dương Tử Quỳnh trở thành nữ diễn viên gốc Á đầu tiên giành giải Oscar Nữ diễn viên chính xuất sắc nhất.",
      difficulty: "hard"
    },
    {
      prompt: "Trong bộ phim 'Lật mặt 7: Một điều ước' (2024) của đạo diễn Lý Hải, nhân vật chính bà Hai có bao nhiêu người con?",
      options: ["5 người con", "3 người con", "4 người con", "7 người con"],
      correct_index: 0,
      explanation: "Bà Hai (nghệ sĩ Thanh Hiền đóng) có 5 người con sinh sống ở các vùng miền khác nhau.",
      difficulty: "hard"
    },
    {
      prompt: "Bộ phim điện ảnh Việt Nam 'Đất rừng phương Nam' (2023) được đạo diễn Nguyễn Quang Dũng lấy cảm hứng từ tiểu thuyết của nhà văn nào?",
      options: ["Đoàn Giỏi", "Sơn Nam", "Tô Hoài", "Nguyễn Nhật Ánh"],
      correct_index: 0,
      explanation: "Tiểu thuyết 'Đất rừng phương Nam' (1957) của nhà văn Đoàn Giỏi kể về hành trình tìm cha của cậu bé An.",
      difficulty: "hard"
    },
    {
      prompt: "Trong phim truyền hình và điện ảnh 'Đất rừng phương Nam', cậu bé nhân vật chính đi tìm cha có tên là gì?",
      options: ["Bé An", "Cò", "Xinh", "Đạt"],
      correct_index: 0,
      explanation: "Hành trình của bé An và người bạn thân tên Cò giữa vùng sông nước miền Tây đã đi vào ký ức nhiều thế hệ.",
      difficulty: "medium"
    },
    {
      prompt: "Bộ phim 'Tôi thấy hoa vàng trên cỏ xanh' (2015) của đạo diễn Victor Vũ được quay chủ yếu tại tỉnh nào của Việt Nam?",
      options: ["Phú Yên", "Quảng Nam", "Lâm Đồng", "Ninh Bình"],
      correct_index: 0,
      explanation: "Sau khi bộ phim ra mắt, tỉnh Phú Yên được mệnh danh là 'Xứ sở hoa vàng cỏ xanh'.",
      difficulty: "hard"
    },
    {
      prompt: "Trong vũ trụ điện ảnh Marvel (MCU), kim loại quý hiếm nhất dùng để chế tạo chiếc khiên của Captain America và xây dựng đất nước Wakanda tên là gì?",
      options: ["Vibranium", "Adamantium", "Uru", "Kryptonite"],
      correct_index: 0,
      explanation: "Vibranium là kim loại hấp thụ chấn động có nguồn gốc từ thiên thạch rơi xuống Wakanda.",
      difficulty: "medium"
    },
    {
      prompt: "Trong truyện tranh và phim DC, điểm yếu chí mạng của Siêu Nhân (Superman) là đá phóng xạ màu xanh lá cây có tên là gì?",
      options: ["Kryptonite", "Vibranium", "Tesseract", "Beskar"],
      correct_index: 0,
      explanation: "Đá Kryptonite là mảnh vỡ từ hành tinh quê hương Krypton của Superman, làm anh mất đi siêu năng lực.",
      difficulty: "hard"
    },
    {
      prompt: "Trong loạt phim 'Fast & Furious (Quá nhanh quá nguy hiểm)', câu nói cửa miệng nổi tiếng nhất của nhân vật Dominic Toretto (Vin Diesel) là về điều gì?",
      options: ["Gia đình (Family)", "Tiền bạc (Money)", "Danh vọng (Fame)", "Vận may (Luck)"],
      correct_index: 0,
      explanation: "'Nothing is stronger than family' (Không gì quan trọng hơn gia đình) là biểu tượng của nhân vật Dom Toretto.",
      difficulty: "easy"
    },
    {
      prompt: "Bộ phim hoạt hình/nhạc kịch 'La La Land (Những kẻ khờ mộng mơ)' có sự tham gia của cặp đôi diễn viên chính nào?",
      options: ["Ryan Gosling và Emma Stone", "Leonardo DiCaprio và Kate Winslet", "Bradley Cooper và Lady Gaga", "Timothée Chalamet và Zendaya"],
      correct_index: 0,
      explanation: "Ryan Gosling và Emma Stone đã mang đến màn trình diễn tuyệt vời trong 'La La Land' của đạo diễn Damien Chazelle.",
      difficulty: "hard"
    }
  ]
};

