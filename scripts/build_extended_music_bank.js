const fs = require('fs');

const FULL_SONG_COLLECTION = [
  // --- A. BOLERO & TRỮ TÌNH KINH ĐIỂN ---
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

  // --- B. NHẠC 8X - 9X THANH XUÂN BẤT HỦ ---
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
    title: "Thà Rằng Như Thế",
    artist: "Ưng Hoàng Phúc",
    ytid: "IsJ2DXMmOlc",
    distractors: ["Người Ta Nói", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Kỷ Niệm Bỏ Quên"],
    startTime: 18,
    explanation: "'Thà Rằng Như Thế' phát hành năm 2002 trong album đầu tay đưa Ưng Hoàng Phúc trở thành thần tượng tuổi teen bùng nổ nhất."
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
  {
    title: "Người Hãy Quên Em Đi",
    artist: "Mỹ Tâm",
    ytid: "f-BzUepNeZw",
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Đúng Cũng Thành Sai"],
    startTime: 18,
    explanation: "'Người Hãy Quên Em Đi' thuộc album Tâm 9 với điệu nhảy say rượu trứ danh của 'Họa mi tóc nâu' Mỹ Tâm."
  },
  {
    title: "Đường Đến Ngày Vinh Quang",
    artist: "Bức Tường (Trần Lập)",
    ytid: "tJ2measnTc0",
    distractors: ["Tâm Hồn Của Đá", "Bông Hồng Thủy Tinh", "Mắt Đen"],
    startTime: 18,
    explanation: "'Đường Đến Ngày Vinh Quang' là bản hùng ca bất hủ thắp sáng ý chí và niềm tin chiến thắng của ban nhạc Rock Bức Tường."
  },
  {
    title: "Gạt Đi Nước Mắt",
    artist: "Noo Phước Thịnh ft. Tonny Việt",
    ytid: "bD3B1I3Zgog",
    distractors: ["Chạm Khẽ Tim Anh Một Chút Thôi", "Thương Em Là Điều Anh Không Thể Ngờ", "Gạt Đi Nước Mắt"],
    startTime: 18,
    explanation: "'Gạt Đi Nước Mắt' của Noo Phước Thịnh kết hợp chất nhạc Dance Pop hiện đại và vũ đạo chuyên nghiệp đỉnh cao."
  },
  {
    title: "Chạm Khẽ Tim Anh Một Chút Thôi",
    artist: "Noo Phước Thịnh",
    ytid: "sOnqjkJTMaA",
    distractors: ["Gạt Đi Nước Mắt", "Thương Em Là Điều Anh Không Thể Ngờ", "Như Phút Ban Đầu"],
    startTime: 18,
    explanation: "'Chạm Khẽ Tim Anh Một Chút Thôi' là bản ballad đẫm nước mắt với MV hành động kịch tính của Noo Phước Thịnh."
  },
  {
    title: "Bống Bống Bang Bang",
    artist: "365daband",
    ytid: "c7rCyll5AeY",
    distractors: ["Hai Cô Tiên", "Nơi Anh Không Thuộc Về", "Và Như Thế"],
    startTime: 15,
    explanation: "'Bống Bống Bang Bang' là MV đầu tiên của Việt Nam vượt mốc 500 triệu lượt xem trên YouTube, là ca khúc thiếu nhi quốc dân."
  },

  // --- C. SIÊU HIT V-POP HIỆN ĐẠI & VIRAL ---
  {
    title: "Hãy Trao Cho Anh",
    artist: "Sơn Tùng M-TP ft. Snoop Dogg",
    ytid: "knW7-x7Y7RE",
    distractors: ["Lạc Trôi", "Nơi Này Có Anh", "Chúng Ta Của Hiện Tại"],
    startTime: 16,
    explanation: "'Hãy Trao Cho Anh' là siêu hit quốc tế phát hành năm 2019 của Sơn Tùng M-TP kết hợp cùng huyền thoại Snoop Dogg."
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
    title: "Chạy Ngay Đi",
    artist: "Sơn Tùng M-TP",
    ytid: "32sYGCOYJUM",
    distractors: ["Lạc Trôi", "Hãy Trao Cho Anh", "Chắc Ai Đó Sẽ Về"],
    startTime: 18,
    explanation: "'Chạy Ngay Đi' (Run Now) phát hành năm 2018 với phong cách Hip-hop Trap ma mị và sự tham gia của ngôi sao Thái Lan Mai Davika."
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
    title: "Chắc Ai Đó Sẽ Về",
    artist: "Sơn Tùng M-TP",
    ytid: "PdbsnGuduvo",
    distractors: ["Thái Bình Mồ Hôi Rơi", "Âm Thầm Bên Em", "Khuôn Mặt Đáng Thương"],
    startTime: 16,
    explanation: "'Chắc Ai Đó Sẽ Về' là ca khúc nhạc phim 'Chàng Trai Năm Ấy' (2014) lấy đi nước mắt của hàng triệu khán giả."
  },
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
    title: "Gieo Quẻ",
    artist: "Hoàng Thùy Linh ft. Đen",
    ytid: "4TWR90KJl84",
    distractors: ["See Tình", "Để Mị Nói Cho Mà Nghe", "Hạ Phỏm"],
    startTime: 16,
    explanation: "'Gieo Quẻ' mở màn cho chuỗi hit năm 2022 mang thông điệp tích cực, lạc quan trước thềm năm mới."
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
    title: "Tháng Tư Là Lời Nói Dối Của Em",
    artist: "Hà Anh Tuấn",
    ytid: "7HDeem-JaSY",
    distractors: ["Xuân Thì", "Nước Ngoài", "Cứ Thế"],
    startTime: 18,
    explanation: "'Tháng Tư Là Lời Nói Dối Của Em' của nhạc sĩ Phạm Toàn Thắng lấy cảm hứng từ anime Your Lie in April."
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
    title: "Bạc Phận",
    artist: "K-ICM ft. Jack",
    ytid: "WX7dUj14Z00",
    distractors: ["Sóng Gió", "Hồng Nhan", "Đom Đóm"],
    startTime: 18,
    explanation: "'Bạc Phận' đạt hàng trăm triệu lượt xem chỉ sau ít tháng, đánh dấu thời kỳ hoàng kim của bộ đôi Jack và K-ICM."
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
    title: "Bao Giờ Lấy Chồng",
    artist: "Bích Phương",
    ytid: "Hzbr4jMxvBk",
    distractors: ["Bùa Yêu", "Đi Đu Đưa Đi", "Có Khi Nào Rời Xa"],
    startTime: 16,
    explanation: "'Bao Giờ Lấy Chồng' là 'bài ca giải cứu hội độc thân' mỗi dịp Tết đến xuân về với MV hài hước đậm chất lầy lội."
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
    title: "Gác Lại Âu Lo",
    artist: "Da LAB ft. Miu Lê",
    ytid: "ECxVfrwwTp0",
    distractors: ["Thanh Xuân", "Một Nhà", "Thức Giấc"],
    startTime: 16,
    explanation: "'Gác Lại Âu Lo' lấy cảm hứng từ các bộ phim kinh điển thế giới như 500 Days of Summer, Notting Hill, La La Land."
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
    title: "Ngày Đầu Tiên",
    artist: "Đức Phúc",
    ytid: "vecSVX1QYbQ",
    distractors: ["Hơn Cả Yêu", "Hết Thương Cạn Nhớ", "Ánh Nắng Của Anh"],
    startTime: 18,
    explanation: "'Ngày Đầu Tiên' ghi lại màn cầu hôn có thật vô cùng xúc động tại một tòa nhà chọc trời ở TP.HCM."
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
    title: "Hết Thương Cạn Nhớ",
    artist: "Đức Phúc",
    ytid: "TQTlCHxyuu8",
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Ánh Nắng Của Anh"],
    startTime: 18,
    explanation: "'Hết Thương Cạn Nhớ' lấy cảm hứng từ truyện ngắn Chí Phèo với sự tham gia của Hoa hậu Đỗ Mỹ Linh trong vai Thị Nở."
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
    title: "Thật Bất Ngờ",
    artist: "Trúc Nhân",
    ytid: "YUAmi7Q2F0Y",
    distractors: ["Sáng Mắt Chưa", "Bốn Chữ Lắm", "Vẽ"],
    startTime: 16,
    explanation: "'Thật Bất Ngờ' châm biếm sâu cay những góc khuất thị phi của showbiz Việt dưới góc nhìn của cậu bé bán báo dạo."
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
    title: "Yêu Một Người Có Lẽ",
    artist: "Lou Hoàng ft. Miu Lê",
    ytid: "AmduqflT79M",
    distractors: ["Mình Là Gì Của Nhau", "Đếm Ngày Xa Em", "Giá Như Cô Ấy Chưa Xuất Hiện"],
    startTime: 16,
    explanation: "'Yêu Một Người Có Lẽ' do OnlyC sáng tác miêu tả những giằng xé trong tình yêu khi hai người dần xa cách."
  },
  {
    title: "Vũ Điệu Cồng Chiêng (Ngày Mai)",
    artist: "Tóc Tiên",
    ytid: "Rz4FbACtfd0",
    distractors: ["Em Không Là Duy Nhất", "Có Ai Thương Em Như Anh", "CATENA"],
    startTime: 16,
    explanation: "'Vũ Điệu Cồng Chiêng' trong ca khúc Ngày Mai đã đưa Tóc Tiên trở thành biểu tượng quyến rũ hàng đầu V-Pop."
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
    difficulty: idx < 20 ? "easy" : idx < 45 ? "medium" : "hard",
    points: 1000,
    time_limit: 30,
    source: `${song.artist} - ${song.title}`,
    is_double_points: idx % 5 === 0,
    active: true
  };
});

const updatedBank = [...newMusicQuestions, ...nonMusic];
fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');

console.log(`Đã nạp ${newMusicQuestions.length} bài hát Việt Nam đa thể loại (Bolero, Trữ tình, 8x-9x, Hiện đại) với start_time bỏ qua intro!`);

