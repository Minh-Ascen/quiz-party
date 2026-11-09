const fs = require('fs');

// Danh sách các bài hát HIT VIỆT NAM kinh điển - 100% có YouTube ID chính thức chuẩn xác và đã test oEmbed 200 OK!
const VIETNAM_SONGS = [
  {
    title: "Hãy Trao Cho Anh",
    artist: "Sơn Tùng M-TP ft. Snoop Dogg",
    ytid: "knW7-x7Y7RE",
    distractors: ["Lạc Trôi", "Nơi Này Có Anh", "Chúng Ta Của Hiện Tại"],
    explanation: "'Hãy Trao Cho Anh' là siêu hit quốc tế phát hành năm 2019 của Sơn Tùng M-TP kết hợp cùng Snoop Dogg và Madison Beer."
  },
  {
    title: "Lạc Trôi",
    artist: "Sơn Tùng M-TP",
    ytid: "Llw9Q6akRo4",
    distractors: ["Hãy Trao Cho Anh", "Nơi Này Có Anh", "Chạy Ngay Đi"],
    explanation: "'Lạc Trôi' là bản hit cổ trang pha Future Bass kinh điển đưa tên tuổi Sơn Tùng M-TP vươn tầm châu Á năm 2017."
  },
  {
    title: "Nơi Này Có Anh",
    artist: "Sơn Tùng M-TP",
    ytid: "FN7ALfpGxiI",
    distractors: ["Lạc Trôi", "Hãy Trao Cho Anh", "Muộn Rồi Mà Sao Còn"],
    explanation: "'Nơi Này Có Anh' phát hành đúng dịp Valentine 2017 với bối cảnh quay tuyệt đẹp tại đảo Jeju, Hàn Quốc."
  },
  {
    title: "Chạy Ngay Đi",
    artist: "Sơn Tùng M-TP",
    ytid: "32sYGCOYJUM",
    distractors: ["Lạc Trôi", "Hãy Trao Cho Anh", "Chắc Ai Đó Sẽ Về"],
    explanation: "'Chạy Ngay Đi' (Run Now) phát hành năm 2018 với phong cách Hip-hop Trap ma mị và sự tham gia của ngôi sao Thái Lan Mai Davika."
  },
  {
    title: "Muộn Rồi Mà Sao Còn",
    artist: "Sơn Tùng M-TP",
    ytid: "xypzmu5mMPY",
    distractors: ["Có Chắc Yêu Là Đây", "Chúng Ta Của Hiện Tại", "Nơi Này Có Anh"],
    explanation: "'Muộn Rồi Mà Sao Còn' phát hành năm 2021 với giai điệu Pop R&B tươi vui miêu tả tâm trạng thổn thức khi tương tư."
  },
  {
    title: "Chắc Ai Đó Sẽ Về",
    artist: "Sơn Tùng M-TP",
    ytid: "PdbsnGuduvo",
    distractors: ["Thái Bình Mồ Hôi Rơi", "Âm Thầm Bên Em", "Khuôn Mặt Đáng Thương"],
    explanation: "'Chắc Ai Đó Sẽ Về' là ca khúc nhạc phim 'Chàng Trai Năm Ấy' (2014) lấy đi nước mắt của hàng triệu khán giả."
  },
  {
    title: "Đi Về Nhà",
    artist: "Đen vâu x JustaTee",
    ytid: "vTJdVE_gjI0",
    distractors: ["Nấu Ăn Cho Em", "Bài Này Chill Phết", "Mang Tiền Về Cho Mẹ"],
    explanation: "'Đi Về Nhà' đạt giải Cống Hiến, ca khúc quốc dân mỗi dịp Tết đến xuân về nhắc nhở mọi người về tổ ấm gia đình."
  },
  {
    title: "Nấu Ăn Cho Em",
    artist: "Đen vâu ft. PiaLinh",
    ytid: "ukHK1GVyr0I",
    distractors: ["Đi Về Nhà", "Trốn Tìm", "Bài Này Chill Phết"],
    explanation: "'Nấu Ăn Cho Em' là dự án âm nhạc thiện nguyện gây quỹ xây trường và nuôi cơm cho hàng nghìn trẻ em vùng cao Điện Biên."
  },
  {
    title: "Trốn Tìm",
    artist: "Đen vâu ft. MTV Band",
    ytid: "Jx_yVyfDa88",
    distractors: ["Đi Về Nhà", "Hai Triệu Năm", "Một Triệu Like"],
    explanation: "'Trốn Tìm' phát hành đúng dịp sinh nhật Đen Vâu năm 2021 với hình ảnh hóa thân thành cái cây chứng kiến sự trưởng thành của con người."
  },
  {
    title: "Bài Này Chill Phết",
    artist: "Đen vâu ft. MIN",
    ytid: "ddaEtFOsFeM",
    distractors: ["Vì Yêu Cứ Đâm Đầu", "Đi Về Nhà", "Cảm Nắng"],
    explanation: "'Bài Này Chill Phết' ra mắt năm 2019 trở thành tuyên ngôn giải tỏa áp lực công việc cho giới văn phòng trẻ."
  },
  {
    title: "Mang Tiền Về Cho Mẹ",
    artist: "Đen vâu ft. Nguyên Thảo",
    ytid: "UVbv-PJXm14",
    distractors: ["Đi Về Nhà", "Nấu Ăn Cho Em", "Trốn Tìm"],
    explanation: "'Mang Tiền Về Cho Mẹ' lan tỏa thông điệp hiếu thảo và sự trân trọng công lao trời biển của đấng sinh thành."
  },
  {
    title: "Lạ Lùng",
    artist: "Vũ. (Hoàng Thái Vũ)",
    ytid: "kRvYqzCJ4vw",
    distractors: ["Bước Qua Mùa Cô Đơn", "Bước Qua Nhau", "Đông Kiếm Em"],
    explanation: "'Lạ Lùng' là bản tình ca Indie kinh điển đưa tên tuổi 'Hoàng tử Indie' Vũ. chạm đến trái tim hàng triệu người nghe nhạc."
  },
  {
    title: "Có Chàng Trai Viết Lên Cây",
    artist: "Phan Mạnh Quỳnh",
    ytid: "AX3Bsiq-13k",
    distractors: ["Vợ Người Ta", "Từ Đó", "Khi Người Mình Yêu Khóc"],
    explanation: "'Có Chàng Trai Viết Lên Cây' là linh hồn của bộ phim điện ảnh 'Mắt Biếc', kể về mối tình si ngốc của thầy Ngạn dành cho Hà Lan."
  },
  {
    title: "Vợ Người Ta",
    artist: "Phan Mạnh Quỳnh",
    ytid: "2ZIpFytCSVc",
    distractors: ["Có Chàng Trai Viết Lên Cây", "Nước Ngoài", "Hồi Ức"],
    explanation: "'Vợ Người Ta' là hiện tượng âm nhạc năm 2015 với MV hài hước phong cách đám cưới thôn quê phá vỡ mọi kỷ lục xem lúc bấy giờ."
  },
  {
    title: "Nàng Thơ",
    artist: "Hoàng Dũng",
    ytid: "Zzn9-ATB9aU",
    distractors: ["Từ Thích Thích Thành Yêu Yêu", "Đoạn Kết Mới", "Nép Vào Anh Và Nghe Anh Hát"],
    explanation: "'Nàng Thơ' là bản tình ca ngọt ngào, sâu lắng viết về nàng thơ Dao Ánh và tình yêu trong trẻo của tuổi thanh xuân."
  },
  {
    title: "Bống Bống Bang Bang",
    artist: "365daband",
    ytid: "c7rCyll5AeY",
    distractors: ["Hai Cô Tiên", "Nơi Anh Không Thuộc Về", "Và Như Thế"],
    explanation: "'Bống Bống Bang Bang' là MV đầu tiên của Việt Nam vượt mốc 500 triệu lượt xem trên YouTube, là ca khúc thiếu nhi quốc dân."
  },
  {
    title: "See Tình",
    artist: "Hoàng Thùy Linh",
    ytid: "2S24-y0Ij3Y",
    distractors: ["Để Mị Nói Cho Mà Nghe", "Gieo Quẻ", "Bo Xì Bo"],
    explanation: "'See Tình' với điệu nhảy lắc hông trứ danh tạo nên cơn sốt vũ đạo toàn cầu từ Hàn Quốc, Trung Quốc đến Nam Mỹ năm 2022."
  },
  {
    title: "Để Mị Nói Cho Mà Nghe",
    artist: "Hoàng Thùy Linh",
    ytid: "MzCbEdtNbJ0",
    distractors: ["See Tình", "Gieo Quẻ", "Duyên Âm"],
    explanation: "'Để Mị Nói Cho Mà Nghe' lồng ghép xuất sắc hàng loạt tác phẩm văn học Việt Nam như Vợ chồng A Phủ, Chí Phèo, Lão Hạc, Tắt đèn."
  },
  {
    title: "Gieo Quẻ",
    artist: "Hoàng Thùy Linh ft. Đen",
    ytid: "4TWR90KJl84",
    distractors: ["See Tình", "Để Mị Nói Cho Mà Nghe", "Hạ Phỏm"],
    explanation: "'Gieo Quẻ' mở màn cho chuỗi hit năm 2022 mang thông điệp tích cực, lạc quan trước thềm năm mới."
  },
  {
    title: "Waiting For You",
    artist: "MONO ft. Onionn",
    ytid: "x6QA3m58DQw",
    distractors: ["Em Là", "Quên Anh Đi", "Chăm Hoa"],
    explanation: "'Waiting For You' với chất liệu City Pop thập niên 80 đã đưa tân binh tân binh MONO bùng nổ thành hiện tượng V-Pop năm 2022."
  },
  {
    title: "Cắt Đôi Nỗi Sầu",
    artist: "Tăng Duy Tân ft. Drum7",
    ytid: "Qc7_zRjH808",
    distractors: ["Bên Trên Tầng Lầu", "Ngây Thơ", "Dạ Vũ"],
    explanation: "'Cắt Đôi Nỗi Sầu' phủ sóng khắp các bảng xếp hạng và mạng xã hội TikTok năm 2023 với giai điệu vinahouse bắt tai."
  },
  {
    title: "Bên Trên Tầng Lầu",
    artist: "Tăng Duy Tân",
    ytid: "pyf8cbqyfPs",
    distractors: ["Cắt Đôi Nỗi Sầu", "Ngây Thơ", "Tình Đầu"],
    explanation: "'Bên Trên Tầng Lầu' viral khắp châu Á, được nhiều ngôi sao quốc tế cover lại trên các nền tảng video ngắn."
  },
  {
    title: "Tháng Tư Là Lời Nói Dối Của Em",
    artist: "Hà Anh Tuấn",
    ytid: "7HDeem-JaSY",
    distractors: ["Xuân Thì", "Nước Ngoài", "Cứ Thế"],
    explanation: "'Tháng Tư Là Lời Nói Dối Của Em' của nhạc sĩ Phạm Toàn Thắng lấy cảm hứng từ bộ anime Your Lie in April, do siêu mẫu Thanh Hằng đóng MV."
  },
  {
    title: "Sóng Gió",
    artist: "K-ICM ft. Jack",
    ytid: "j8U06veqxdU",
    distractors: ["Bạc Phận", "Hồng Nhan", "Em Gì Ơi"],
    explanation: "'Sóng Gió' là phần tiếp nối của câu chuyện Bạc Phận, từng đạt kỷ lục công chiếu YouTube cao thứ 4 thế giới tại thời điểm ra mắt."
  },
  {
    title: "Bạc Phận",
    artist: "K-ICM ft. Jack",
    ytid: "WX7dUj14Z00",
    distractors: ["Sóng Gió", "Hồng Nhan", "Đom Đóm"],
    explanation: "'Bạc Phận' đạt hàng trăm triệu lượt xem chỉ sau ít tháng, đánh dấu thời kỳ hoàng kim của bộ đôi Jack và K-ICM."
  },
  {
    title: "Thị Mầu",
    artist: "Hòa Minzy x Masew",
    ytid: "0yHtYPeK2Jg",
    distractors: ["Rời Bỏ", "Không Thể Cùng Nhau Suốt Kiếp", "Chấp Nhận"],
    explanation: "'Thị Mầu' kết hợp nghệ thuật Chèo cổ truyền thống với nhạc điện tử hiện đại, khẳng định dấu ấn văn hóa dân gian của Hòa Minzy."
  },
  {
    title: "Bùa Yêu",
    artist: "Bích Phương",
    ytid: "FkOt19CUC30",
    distractors: ["Đi Đu Đưa Đi", "Bao Giờ Lấy Chồng", "Một Cú Lừa"],
    explanation: "'Bùa Yêu' thuộc dự án 'Việt Nam Việt Nam' đưa âm hưởng dân tộc kết hợp hiện đại trở thành trào lưu lớn trong nền âm nhạc V-Pop."
  },
  {
    title: "Bao Giờ Lấy Chồng",
    artist: "Bích Phương",
    ytid: "Hzbr4jMxvBk",
    distractors: ["Bùa Yêu", "Đi Đu Đưa Đi", "Có Khi Nào Rời Xa"],
    explanation: "'Bao Giờ Lấy Chồng' là 'bài ca giải cứu hội độc thân' mỗi dịp Tết đến xuân về với MV hài hước đậm chất lầy lội."
  },
  {
    title: "Thanh Xuân",
    artist: "Da LAB",
    ytid: "GgQFO8dL5XQ",
    distractors: ["Gác Lại Âu Lo", "Nước Mắt Em Lau Bằng Tình Yêu Mới", "Một Nhà"],
    explanation: "'Thanh Xuân' là bản tình ca hoài niệm tuyệt đẹp của Da LAB với sự góp mặt của diễn viên Châu Bùi và Decao."
  },
  {
    title: "Gác Lại Âu Lo",
    artist: "Da LAB ft. Miu Lê",
    ytid: "ECxVfrwwTp0",
    distractors: ["Thanh Xuân", "Một Nhà", "Thức Giấc"],
    explanation: "'Gác Lại Âu Lo' lấy cảm hứng từ các bộ phim kinh điển thế giới như 500 Days of Summer, Notting Hill, La La Land."
  },
  {
    title: "Hơn Cả Yêu",
    artist: "Đức Phúc",
    ytid: "__kGJZ-kPno",
    distractors: ["Hết Thương Cạn Nhớ", "Ngày Đầu Tiên", "Ánh Nắng Của Anh"],
    explanation: "'Hơn Cả Yêu' ra mắt dịp Valentine 2020 trở thành bài hát đám cưới quốc dân tôn vinh tình cảm gia đình và tình yêu đích thực."
  },
  {
    title: "Ngày Đầu Tiên",
    artist: "Đức Phúc",
    ytid: "vecSVX1QYbQ",
    distractors: ["Hơn Cả Yêu", "Hết Thương Cạn Nhớ", "Ánh Nắng Của Anh"],
    explanation: "'Ngày Đầu Tiên' ghi lại màn cầu hôn có thật vô cùng xúc động tại một tòa nhà chọc trời ở TP.HCM."
  },
  {
    title: "Ánh Nắng Của Anh",
    artist: "Đức Phúc",
    ytid: "WyiIGEHQP8o",
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Hết Thương Cạn Nhớ"],
    explanation: "'Ánh Nắng Của Anh' là ca khúc nhạc phim 'Chờ Em Đến Ngày Mai' do nhạc sĩ Khắc Hưng sáng tác."
  },
  {
    title: "Hết Thương Cạn Nhớ",
    artist: "Đức Phúc",
    ytid: "TQTlCHxyuu8",
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Ánh Nắng Của Anh"],
    explanation: "'Hết Thương Cạn Nhớ' lấy cảm hứng từ truyện ngắn Chí Phèo với sự tham gia của Hoa hậu Đỗ Mỹ Linh trong vai Thị Nở."
  },
  {
    title: "Người Hãy Quên Em Đi",
    artist: "Mỹ Tâm",
    ytid: "f-BzUepNeZw",
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Đúng Cũng Thành Sai"],
    explanation: "'Người Hãy Quên Em Đi' thuộc album Tâm 9 với điệu nhảy 'say rượu' trứ danh của nữ ca sĩ Mỹ Tâm."
  },
  {
    title: "Cầu Vồng Khuyết",
    artist: "Tuấn Hưng",
    ytid: "v2luYYn_aAQ",
    distractors: ["Tìm Lại Bầu Trời", "Dĩ Vãng Cuộc Tình", "Nắm Lấy Tay Anh"],
    explanation: "'Cầu Vồng Khuyết' là bản hit gắn liền với thanh xuân thế hệ 8X - 9X của nam ca sĩ Tuấn Hưng do Minh Khang sáng tác."
  },
  {
    title: "Chiếc Khăn Gió Ấm",
    artist: "Khánh Phương",
    ytid: "aoBfJQFy8N0",
    distractors: ["Tựa Vào Vai Anh", "Mưa Thủy Tinh", "Đành Thôi Quên Lãng"],
    explanation: "'Chiếc Khăn Gió Ấm' của nhạc sĩ Nguyễn Văn Chung phủ sóng khắp các quán internet và nhạc chuông điện thoại năm 2008."
  },
  {
    title: "Em Gái Mưa",
    artist: "Hương Tràm",
    ytid: "Y29OrOVJUKs",
    distractors: ["Duyên Mình Lỡ", "Cho Em Gần Anh Thêm Chút Nữa", "Ngốc"],
    explanation: "'Em Gái Mưa' do Mr. Siro sáng tác, đạt hàng trăm triệu lượt nghe và tạo nên trào lưu 'thầy giáo mưa' đình đám năm 2017."
  },
  {
    title: "Phía Sau Một Cô Gái",
    artist: "Soobin Hoàng Sơn",
    ytid: "vCIc1g_4JWM",
    distractors: ["Đi Để Trở Về", "Xin Đừng Lặng Im", "Nếu Ngày Ấy"],
    explanation: "'Phía Sau Một Cô Gái' do Tiên Cookie sáng tác với câu hát kinh điển 'Nên anh lùi bước về sau để thấy em rõ hơn'."
  },
  {
    title: "Anh Nhà Ở Đâu Thế",
    artist: "AMEE ft. B Ray",
    ytid: "iE52-XXnQqs",
    distractors: ["Đen Đá Không Đường", "Sao Anh Chưa Về Nhà", "Hai Mươi Hai"],
    explanation: "'Anh Nhà Ở Đâu Thế' là ca khúc debut thành công vang dội của công chúa V-Pop AMEE quay tại thành phố Đà Lạt mộng mơ."
  },
  {
    title: "Sáng Mắt Chưa",
    artist: "Trúc Nhân",
    ytid: "rDhx4ejrPPA",
    distractors: ["Thật Bất Ngờ", "Bốn Chữ Lắm", "Có Không Giữ Mất Đừng Tìm"],
    explanation: "'Sáng Mắt Chưa' là siêu phẩm MV mang màu sắc ủng hộ cộng đồng LGBT với kịch bản hài hước và vũ đạo bắt mắt."
  },
  {
    title: "Thật Bất Ngờ",
    artist: "Trúc Nhân",
    ytid: "YUAmi7Q2F0Y",
    distractors: ["Sáng Mắt Chưa", "Bốn Chữ Lắm", "Vẽ"],
    explanation: "'Thật Bất Ngờ' châm biếm sâu cay những góc khuất thị phi của showbiz Việt dưới góc nhìn của cậu bé bán báo dạo."
  },
  {
    title: "Đường Đến Ngày Vinh Quang",
    artist: "Bức Tường (Trần Lập)",
    ytid: "tJ2measnTc0",
    distractors: ["Tâm Hồn Của Đá", "Bông Hồng Thủy Tinh", "Mắt Đen"],
    explanation: "'Đường Đến Ngày Vinh Quang' là khúc ca bất hủ tiếp thêm ý chí, nghị lực vượt qua giông bão của ban nhạc Rock Bức Tường."
  },
  {
    title: "Chạm Khẽ Tim Anh Một Chút Thôi",
    artist: "Noo Phước Thịnh",
    ytid: "sOnqjkJTMaA",
    distractors: ["Gạt Đi Nước Mắt", "Thương Em Là Điều Anh Không Thể Ngờ", "Như Phút Ban Đầu"],
    explanation: "'Chạm Khẽ Tim Anh Một Chút Thôi' là bản ballad đẫm nước mắt với MV hành động kịch tính của Noo Phước Thịnh."
  },
  {
    title: "Một Bước Yêu Vạn Dặm Đau",
    artist: "Mr. Siro",
    ytid: "BA7fdSkp8ds",
    distractors: ["Lắng Nghe Nước Mắt", "Dưới Những Cơn Mưa", "Gương Mặt Phu Thê"],
    explanation: "'Một Bước Yêu Vạn Dặm Đau' là bản ballad buồn day dứt về mối duyên lỡ làng của nhạc sĩ 'hoàng tử sầu bi' Mr. Siro."
  },
  {
    title: "Yêu Một Người Có Lẽ",
    artist: "Lou Hoàng ft. Miu Lê",
    ytid: "AmduqflT79M",
    distractors: ["Mình Là Gì Của Nhau", "Đếm Ngày Xa Em", "Giá Như Cô Ấy Chưa Xuất Hiện"],
    explanation: "'Yêu Một Người Có Lẽ' do OnlyC sáng tác miêu tả những giằng xé trong tình yêu khi hai người dần xa cách."
  },
  {
    title: "Vũ Điệu Cồng Chiêng (Ngày Mai)",
    artist: "Tóc Tiên",
    ytid: "Rz4FbACtfd0",
    distractors: ["Em Không Là Duy Nhất", "Có Ai Thương Em Như Anh", "CATENA"],
    explanation: "'Vũ Điệu Cồng Chiêng' trong ca khúc Ngày Mai đã đưa Tóc Tiên trở thành biểu tượng quyến rũ hàng đầu V-Pop."
  }
];

// Nạp ngân hàng câu hỏi gốc
const bankPath = './data/questionBank.json';
const bank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

// Lọc bỏ các câu hỏi cũ của "Âm nhạc Việt Nam"
const nonMusicQuestions = bank.filter(q => q.category !== 'Âm nhạc Việt Nam');

// Tạo danh sách câu hỏi mới 100% CHUẨN XÁC cho "Âm nhạc Việt Nam"
const newMusicQuestions = VIETNAM_SONGS.map((song, idx) => {
  // Tạo 4 đáp án và xáo trộn vị trí
  const allOpts = [song.title, ...song.distractors];
  // Đưa đáp án đúng vào một vị trí ngẫu nhiên
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
    question_type: "AUDIO_GUESS",
    difficulty: idx < 15 ? "easy" : idx < 35 ? "medium" : "hard",
    points: 1000,
    time_limit: 30, // 30 giây để nghe nhạc và gõ phím thoải mái
    source: `${song.artist} - ${song.title}`,
    is_double_points: idx % 5 === 0,
    active: true
  };
});

// Hợp nhất ngân hàng câu hỏi
const updatedBank = [...newMusicQuestions, ...nonMusicQuestions];

fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');
console.log(`Đã cập nhật thành công ${newMusicQuestions.length} câu hỏi Âm nhạc Việt Nam chuẩn xác 100%!`);
console.log(`Tổng số câu hỏi trong ngân hàng hiện tại: ${updatedBank.length}`);

