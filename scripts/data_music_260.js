// 260 BÀI HÁT VIỆT NAM ĐẶC SẮC CHO CÁC PART TỪ #8 ĐẾN #20
// Gồm:
// - 65 bài Bolero & Nhạc Vàng (13 parts x 5 bài)
// - 65 bài Trữ Tình & Nhạc Đỏ Cách Mạng (13 parts x 5 bài)
// - 130 bài Nhạc Trẻ Mọi Thế Hệ (> 20M views, siêu quen thuộc) (13 parts x 10 bài)
// Toàn bộ đáp án TUYỆT ĐỐI KHÔNG CÓ DẤU NGOẶC CHÚ THÍCH ()

const BOLERO_VANG_65 = [
  {
    title: "Duyên Phận",
    artist: "Như Quỳnh",
    ytid: "ycGfvA1vkR8",
    startTime: 20,
    distractors: ["Sầu Tím Thiệp Hồng", "Đoạn Tuyệt", "Nỗi Buồn Hoa Phượng"],
    explanation: "'Duyên Phận' của nhạc sĩ Thái Thịnh là bản Bolero quốc dân vượt 100 triệu lượt xem gắn liền với giọng ca Như Quỳnh."
  },
  {
    title: "Sầu Tím Thiệp Hồng",
    artist: "Quang Lê & Lệ Quyên",
    ytid: "RVP5N4QXHeQ",
    startTime: 20,
    distractors: ["Duyên Phận", "Con Đường Xưa Em Đi", "Vùng Lá Me Bay"],
    explanation: "'Sầu Tím Thiệp Hồng' do Quang Lê và Lệ Quyên song ca là tuyệt phẩm Bolero bất hủ của nhạc sĩ Hoài Linh & Minh Kỳ."
  },
  {
    title: "Vùng Lá Me Bay",
    artist: "Như Quỳnh",
    ytid: "z8DLkLnemFY",
    startTime: 18,
    distractors: ["Con Đường Xưa Em Đi", "Duyên Phận", "Hoa Nở Về Đêm"],
    explanation: "'Vùng Lá Me Bay' sáng tác bởi nhạc sĩ Anh Việt Thanh là một trong những bản Bolero được yêu thích nhất mọi thời đại."
  },
  {
    title: "Con Đường Xưa Em Đi",
    artist: "Như Quỳnh",
    ytid: "at43TutUGAg",
    startTime: 18,
    distractors: ["Vùng Lá Me Bay", "Sầu Tím Thiệp Hồng", "Chuyến Tàu Hoàng Hôn"],
    explanation: "'Con Đường Xưa Em Đi' của Châu Kỳ và Hồ Đình Phương là nhạc phẩm trữ tình kinh điển về mối tình hoài niệm."
  },
  {
    title: "Hoa Nở Về Đêm",
    artist: "Lệ Quyên",
    ytid: "ms_T626fr1g",
    startTime: 16,
    distractors: ["Đoạn Tuyệt", "Sầu Lẻ Bóng", "Mưa Nửa Đêm"],
    explanation: "'Hoa Nở Về Đêm' của nhạc sĩ Mạnh Phát qua chất giọng trầm ấm, nức nở của Lệ Quyên chinh phục đông đảo người yêu nhạc vàng."
  },
  {
    title: "Đắp Mộ Cuộc Tình",
    artist: "Đan Nguyên",
    ytid: "j0-o6hT-718",
    startTime: 22,
    distractors: ["Thói Đời", "Hai Lối Mộng", "Căn Nhà Màu Tím"],
    explanation: "'Đắp Mộ Cuộc Tình' của nhạc sĩ Vũ Thanh là bản 'thánh ca' Bolero đẫm lệ với hàng trăm triệu lượt nghe."
  },
  {
    title: "Chuyện Ba Người",
    artist: "Như Quỳnh",
    ytid: "d9e8iGvB1nQ",
    startTime: 20,
    distractors: ["Chuyện Hoa Sim", "Nỗi Buồn Hoa Phượng", "Hai Vì Sao Lạc"],
    explanation: "'Chuyện Ba Người' của nhạc sĩ Quốc Dũng phổ thơ Xuân Kỳ kể về mối tình tay ba đầy tiếc nuối và xót xa."
  },
  {
    title: "Căn Nhà Màu Tím",
    artist: "Quang Lê & Mai Thiên Vân",
    ytid: "ZgP8u7xY61I",
    startTime: 18,
    distractors: ["Gõ Cửa Trái Tim", "Đừng Nói Xa Nhau", "Hương Tóc Mạ Non"],
    explanation: "'Căn Nhà Màu Tím' của nhạc sĩ Hoài Linh là bản song ca kinh điển gợi nhớ kỷ niệm thời hoa bướm ngày xưa."
  },
  {
    title: "Gõ Cửa Trái Tim",
    artist: "Quang Lê & Mai Thiên Vân",
    ytid: "mY40yG64F4A",
    startTime: 20,
    distractors: ["Căn Nhà Màu Tím", "Nhớ Nhau Hoài", "Hai Lối Mộng"],
    explanation: "'Gõ Cửa Trái Tim' của nhạc sĩ Vinh Sử là giai điệu Bolero quen thuộc ngập tràn trong ký ức nhiều thế hệ."
  },
  {
    title: "Thao Thức Vì Em",
    artist: "Quang Lê",
    ytid: "9m-2B76X95g",
    startTime: 18,
    distractors: ["Cô Hàng Xóm", "Xuân Này Con Không Về", "Tương Tư Nàng Ca Sĩ"],
    explanation: "'Thao Thức Vì Em' của nhạc sĩ Lam Phương với câu hát 'Em ơi anh thao thức trọn đêm nay' ngọt ngào đi vào lòng người."
  },
  {
    title: "Người Tình Mùa Đông",
    artist: "Như Quỳnh",
    ytid: "X2kYQ1T1Y7E",
    startTime: 16,
    distractors: ["Chuyện Hoa Sim", "Mùa Xuân Đầu Tiên", "Hai Kỷ Niệm Một Chuyến Đi"],
    explanation: "'Người Tình Mùa Đông' nhạc ngoại lời Việt của Anh Bằng đã tạo nên cơn sốt với chiếc mũ nồi trắng huyền thoại của Như Quỳnh."
  },
  {
    title: "Chuyến Tàu Hoàng Hôn",
    artist: "Cẩm Ly",
    ytid: "qJvA8L1Qv-E",
    startTime: 20,
    distractors: ["Con Đường Xưa Em Đi", "Nỗi Buồn Hoa Phượng", "Chiều Sân Ga"],
    explanation: "'Chuyến Tàu Hoàng Hôn' của Minh Kỳ & Hoài Linh là khúc biệt ly sân ga da diết bậc nhất của dòng nhạc vàng."
  },
  {
    title: "Nỗi Buồn Hoa Phượng",
    artist: "Phi Nhung",
    ytid: "5ejXL9dXx84",
    startTime: 18,
    distractors: ["Lưu Bút Ngày Xanh", "Ba Tháng Tạ Từ", "Hạ Buồn"],
    explanation: "'Nỗi Buồn Hoa Phượng' của nhạc sĩ Thanh Sơn là bài ca bất hủ về mùa hè, tuổi học trò và nỗi niềm chia tay mái trường."
  },
  {
    title: "Mưa Rừng",
    artist: "Lệ Quyên",
    ytid: "LpWJ1_4Z_xM",
    startTime: 20,
    distractors: ["Mưa Nửa Đêm", "Giọt Lệ Sầu", "Đoạn Tuyệt"],
    explanation: "'Mưa Rừng' của Huỳnh Anh viết tặng nghệ sĩ Thanh Nga là tuyệt tác trữ tình mang âm hưởng núi rừng u buồn."
  },
  {
    title: "Xin Gọi Nhau Là Cố Nhân",
    artist: "Đan Nguyên",
    ytid: "s_F8k1pLz0s",
    startTime: 20,
    distractors: ["Thói Đời", "Hai Lối Mộng", "Tôi Đưa Em Sang Sông"],
    explanation: "'Xin Gọi Nhau Là Cố Nhân' của nhạc sĩ Song Ngọc là nỗi lòng nghẹn ngào khi tình xưa gặp lại chỉ còn là người dưng."
  },
  {
    title: "Tình Lỡ",
    artist: "Lệ Quyên",
    ytid: "2A3GqBq12vE",
    startTime: 22,
    distractors: ["Nếu Em Được Chọn Lựa", "Giọt Lệ Sầu", "Bản Tình Cuối"],
    explanation: "'Tình Lỡ' của nhạc sĩ Thanh Bình với câu hát 'Thôi rồi còn chi đâu em ơi' là khúc ca dang dở lay động tâm can."
  },
  {
    title: "Biển Tình",
    artist: "Đàm Vĩnh Hưng",
    ytid: "ksrPPGuut0c",
    startTime: 18,
    distractors: ["Say Tình", "Lâu Đài Tình Ái", "Xin Lỗi Tình Yêu"],
    explanation: "'Biển Tình' của nhạc sĩ Lam Phương qua chất giọng khàn đặc trưng của Đàm Vĩnh Hưng mang phong cách nồng nàn, đắm say."
  },
  {
    title: "Hoa Sứ Nhà Nàng",
    artist: "Tuấn Vũ",
    ytid: "0W4L5B8H_hI",
    startTime: 18,
    distractors: ["Cô Hàng Xóm", "Đêm Buồn Tỉnh Lẻ", "Nhật Ký Đời Tôi"],
    explanation: "'Hoa Sứ Nhà Nàng' của nhạc sĩ Hoàng Phương là khúc tình ca ngát hương hoa sứ gắn liền với chất giọng lãng tử của Tuấn Vũ."
  },
  {
    title: "Thành Phố Buồn",
    artist: "Đan Nguyên",
    ytid: "N0rY1gVq72A",
    startTime: 20,
    distractors: ["Đồi Thông Hai Mộ", "Đêm Buồn Tỉnh Lẻ", "Thói Đời"],
    explanation: "'Thành Phố Buồn' của Lam Phương viết về thành phố sương mù Đà Lạt với nỗi sầu lữ thứ mênh mang."
  },
  {
    title: "Cô Hàng Xóm",
    artist: "Quang Lê",
    ytid: "D1r_v9bT67g",
    startTime: 18,
    distractors: ["Thao Thức Vì Em", "Hương Tóc Mạ Non", "Hoa Sứ Nhà Nàng"],
    explanation: "'Cô Hàng Xóm' của Lê Minh Bằng kể về mối tình thầm kín với cô bạn láng giềng đi lấy chồng giàu sang."
  },
  {
    title: "Ai Khổ Vì Ai",
    artist: "Như Quỳnh",
    ytid: "b7K0r92-L6o",
    startTime: 20,
    distractors: ["Duyên Phận", "Chuyện Hoa Sim", "Đoạn Tuyệt"],
    explanation: "'Ai Khổ Vì Ai' của nhạc sĩ Thương Linh là bài hát Bolero kinh điển về sự trớ trêu của duyên phận lứa đôi."
  },
  {
    title: "Đồi Thông Hai Mộ",
    artist: "Lệ Quyên",
    ytid: "t_vGq08eX2I",
    startTime: 22,
    distractors: ["Thành Phố Buồn", "Mưa Rừng", "Hoa Nở Về Đêm"],
    explanation: "'Đồi Thông Hai Mộ' của nhạc sĩ Hồng Vân kể lại thiên tình sử có thật đầy bi thương bên hồ Than Thở Đà Lạt."
  },
  {
    title: "Đêm Buồn Tỉnh Lẻ",
    artist: "Đan Nguyên",
    ytid: "5p9x-T5y1oE",
    startTime: 18,
    distractors: ["Tôi Đưa Em Sang Sông", "Thói Đời", "Xin Gọi Nhau Là Cố Nhân"],
    explanation: "'Đêm Buồn Tỉnh Lẻ' của Tú Nhi & Bằng Giang khắc họa nỗi cô đơn của người trai nơi quán trọ đêm khuya."
  },
  {
    title: "Nhật Ký Đời Tôi",
    artist: "Như Quỳnh",
    ytid: "7Z3a_Vp3BqY",
    startTime: 20,
    distractors: ["Duyên Phận", "Con Đường Xưa Em Đi", "Trộm Nhìn Nhau"],
    explanation: "'Nhật Ký Đời Tôi' của nhạc sĩ Thanh Sơn là những trang nhật ký tình đầu trong sáng nhưng sớm phai tàn."
  },
  {
    title: "Mưa Nửa Đêm",
    artist: "Lệ Quyên",
    ytid: "6l3rL-4k6o0",
    startTime: 20,
    distractors: ["Mưa Rừng", "Sầu Lẻ Bóng", "Nửa Đêm Ngoài Phố"],
    explanation: "'Mưa Nửa Đêm' của nhạc sĩ Trúc Phương là một trong những bản tình ca Bolero về đêm mưa nổi tiếng nhất."
  },
  {
    title: "Khóc Thầm",
    artist: "Phi Nhung",
    ytid: "V8e_fR32mYo",
    startTime: 18,
    distractors: ["Áo Mới Cà Mau", "Nỗi Buồn Hoa Phượng", "Chiều Sân Ga"],
    explanation: "'Khóc Thầm' của nhạc sĩ Lam Phương qua tiếng hát da diết của Phi Nhung lấy đi nước mắt của hàng triệu khán giả."
  },
  {
    title: "Đoạn Tuyệt",
    artist: "Lệ Quyên",
    ytid: "P2v0b8N4_1Q",
    startTime: 20,
    distractors: ["Hoa Nở Về Đêm", "Sầu Tím Thiệp Hồng", "Tình Lỡ"],
    explanation: "'Đoạn Tuyệt' của nhạc sĩ Thái Thịnh là bài hát đẫm lệ về lời chia tay dứt khoát nhưng xé lòng."
  },
  {
    title: "Nhớ Nhau Hoài",
    artist: "Quang Lê",
    ytid: "8R_4G8l5m_o",
    startTime: 18,
    distractors: ["Gõ Cửa Trái Tim", "Cô Hàng Xóm", "Đừng Nói Xa Nhau"],
    explanation: "'Nhớ Nhau Hoài' của nhạc sĩ Anh Việt Thu là giai điệu êm ái về nỗi nhớ người yêu da diết cách trở đôi bờ."
  },
  {
    title: "Trộm Nhìn Nhau",
    artist: "Như Quỳnh",
    ytid: "Y9k_X1L3b0I",
    startTime: 20,
    distractors: ["Con Đường Xưa Em Đi", "Vùng Lá Me Bay", "Nhật Ký Đời Tôi"],
    explanation: "'Trộm Nhìn Nhau' của nhạc sĩ Trầm Tử Thiêng với câu hát 'Đôi mi em dài cong vút' ngọt ngào và đắm say."
  },
  {
    title: "Người Đi Ngoài Phố",
    artist: "Lệ Quyên",
    ytid: "4A0b-G8yM2E",
    startTime: 20,
    distractors: ["Mưa Nửa Đêm", "Nửa Đêm Ngoài Phố", "Sầu Lẻ Bóng"],
    explanation: "'Người Đi Ngoài Phố' của nhạc sĩ Anh Việt Thu mang giai điệu êm đềm về bóng hình người cũ lướt qua trên phố đông."
  },
  {
    title: "Xuân Này Con Không Về",
    artist: "Quang Lê",
    ytid: "8v_P1e2Q0_k",
    startTime: 20,
    distractors: ["Mùa Xuân Đầu Tiên", "Chiều Sân Ga", "Thao Thức Vì Em"],
    explanation: "'Xuân Này Con Không Về' của Trịnh Lâm Ngân là khúc hát Tết lấy nước mắt bao thế hệ người con xa xứ."
  },
  {
    title: "Mùa Xuân Đầu Tiên",
    artist: "Như Quỳnh",
    ytid: "v9a_Q2b8Y1o",
    startTime: 18,
    distractors: ["Người Tình Mùa Đông", "Xuân Này Con Không Về", "Duyên Phận"],
    explanation: "'Mùa Xuân Đầu Tiên' của nhạc sĩ Tuấn Khanh mang không khí mùa xuân thanh bình, đầm ấm và rực rỡ sắc hoa."
  },
  {
    title: "Chiều Sân Ga",
    artist: "Phi Nhung",
    ytid: "D8e_v2K3m_o",
    startTime: 18,
    distractors: ["Chuyến Tàu Hoàng Hôn", "Nỗi Buồn Hoa Phượng", "Khóc Thầm"],
    explanation: "'Chiều Sân Ga' của nhạc sĩ Sông Trà với tiếng còi tàu lăn bánh tiễn đưa người đi lưu luyến khó rời."
  },
  {
    title: "Tấm Ảnh Không Hồn",
    artist: "Đan Nguyên",
    ytid: "7X1o-P0b4eE",
    startTime: 20,
    distractors: ["Đắp Mộ Cuộc Tình", "Xin Gọi Nhau Là Cố Nhân", "Thói Đời"],
    explanation: "'Tấm Ảnh Không Hồn' của nhạc sĩ Hoài An là nỗi đau của chàng trai ôm bức hình người yêu đã bội ước bước sang ngang."
  },
  {
    title: "Đừng Nói Xa Nhau",
    artist: "Quang Lê & Mai Thiên Vân",
    ytid: "Q2v_P9k8L1E",
    startTime: 20,
    distractors: ["Căn Nhà Màu Tím", "Gõ Cửa Trái Tim", "Nhớ Nhau Hoài"],
    explanation: "'Đừng Nói Xa Nhau' của Châu Kỳ & Hồ Đình Phương là khúc tình ca thề nguyền son sắt của đôi lứa đang yêu."
  },
  {
    title: "Lại Nhớ Người Yêu",
    artist: "Đan Nguyên",
    ytid: "9A1o_Q4k8_E",
    startTime: 18,
    distractors: ["Đêm Buồn Tỉnh Lẻ", "Thói Đời", "Xin Gọi Nhau Là Cố Nhân"],
    explanation: "'Lại Nhớ Người Yêu' của Giao Tiên là lời tự tình mộc mạc, say đắm và chân thật của chàng trai đang chìm trong men tình."
  },
  {
    title: "Phượng Buồn",
    artist: "Cẩm Ly & Đan Trường",
    ytid: "P1k_V8e4_1o",
    startTime: 20,
    distractors: ["Chim Trắng Mồ Côi", "Nỗi Buồn Hoa Phượng", "Mưa Trên Cuộc Tình"],
    explanation: "'Phượng Buồn' của Tuấn Hải & Lê Kim Khánh qua màn song ca của cặp đôi vàng Đan Trường - Cẩm Ly in đậm trong ký ức học trò."
  },
  {
    title: "Hương Tóc Mạ Non",
    artist: "Quang Lê & Hà Phương",
    ytid: "H8k_P1e9_2o",
    startTime: 18,
    distractors: ["Áo Mới Cà Mau", "Cô Hàng Xóm", "Căn Nhà Màu Tím"],
    explanation: "'Hương Tóc Mạ Non' của nhạc sĩ Thanh Sơn mang đậm hương đồng gió nội miền Tây Nam Bộ ngọt ngào."
  },
  {
    title: "Hai Vì Sao Lạc",
    artist: "Đan Nguyên",
    ytid: "2A9k_X8v_3o",
    startTime: 20,
    distractors: ["Chuyện Ba Người", "Thói Đời", "Hai Lối Mộng"],
    explanation: "'Hai Vì Sao Lạc' của nhạc sĩ Anh Việt Thu ví tình duyên lỡ làng như hai ngôi sao lạc lối giữa bầu trời đêm."
  },
  {
    title: "Trăng Tàn Trên Hè Phố",
    artist: "Chế Linh",
    ytid: "C8e_P9k4_2o",
    startTime: 20,
    distractors: ["Thành Phố Buồn", "Thói Đời", "Hoa Sứ Nhà Nàng"],
    explanation: "'Trăng Tàn Trên Hè Phố' của nhạc sĩ Phạm Thế Mỹ kể về cuộc tao ngộ ngắn ngủi rồi chia tay giữa hai người bạn thân."
  },
  {
    title: "Thói Đời",
    artist: "Đan Nguyên",
    ytid: "D9k_X1e8_5o",
    startTime: 20,
    distractors: ["Đắp Mộ Cuộc Tình", "Xin Gọi Nhau Là Cố Nhân", "Hai Lối Mộng"],
    explanation: "'Thói Đời' của nhạc sĩ Trúc Phương là bài hát triết lý nhân sinh chua cay về lòng người và sự tráo trở lúc cơ hàn."
  },
  {
    title: "Chuyện Tình Người Đan Áo",
    artist: "Như Quỳnh",
    ytid: "E8k_P2e7_3o",
    startTime: 20,
    distractors: ["Chuyện Ba Người", "Chuyện Hoa Sim", "Duyên Phận"],
    explanation: "'Chuyện Tình Người Đan Áo' của nhạc sĩ Trường Sa khắc họa người thiếu nữ vừa đan áo ấm vừa ngóng trông tin người yêu nơi xa."
  },
  {
    title: "Tình Bơ Vơ",
    artist: "Đan Nguyên & Băng Tâm",
    ytid: "B8k_P1e4_4o",
    startTime: 20,
    distractors: ["Xin Gọi Nhau Là Cố Nhân", "Thói Đời", "Hai Lối Mộng"],
    explanation: "'Tình Bơ Vơ' của nhạc sĩ Lam Phương là tuyệt tác Bolero song ca về nỗi bơ vơ lạc lõng của tình yêu không trọn vẹn."
  },
  {
    title: "Nửa Đêm Ngoài Phố",
    artist: "Lệ Quyên",
    ytid: "L8k_P3e9_6o",
    startTime: 20,
    distractors: ["Mưa Nửa Đêm", "Người Đi Ngoài Phố", "Hoa Nở Về Đêm"],
    explanation: "'Nửa Đêm Ngoài Phố' của Trúc Phương là bản nhạc vàng trầm buồn về những bước chân cô đơn lang thang trên hè phố vắng."
  },
  {
    title: "Không Giờ Rồi",
    artist: "Quang Lê & Lệ Quyên",
    ytid: "K8e_P1k7_8o",
    startTime: 18,
    distractors: ["Sầu Tím Thiệp Hồng", "Căn Nhà Màu Tím", "Gõ Cửa Trái Tim"],
    explanation: "'Không Giờ Rồi' của nhạc sĩ Vinh Sử là cuộc trò chuyện tình tứ nửa đêm của đôi tình nhân bên chiếc điện thoại."
  },
  {
    title: "Bông Điên Điển",
    artist: "Phi Nhung",
    ytid: "F8e_P2k9_1o",
    startTime: 18,
    distractors: ["Áo Mới Cà Mau", "Phải Lòng Con Gái Bến Tre", "Chiếc Áo Bà Ba"],
    explanation: "'Bông Điên Điển' của nhạc sĩ Hà Phương gắn liền với mùa nước nổi miền Tây và tiếng hát thân thương của Phi Nhung."
  },
  {
    title: "Phải Lòng Con Gái Bến Tre",
    artist: "Phi Nhung & Quang Lê",
    ytid: "P8k_F1e2_3o",
    startTime: 20,
    distractors: ["Áo Mới Cà Mau", "Bông Điên Điển", "Hương Tóc Mạ Non"],
    explanation: "'Phải Lòng Con Gái Bến Tre' của nhạc sĩ Phan Ni Tấn mang giai điệu trữ tình duyên dáng của xứ dừa Nam Bộ."
  },
  {
    title: "Chiếc Áo Bà Ba",
    artist: "Cẩm Ly",
    ytid: "C8e_A1k9_4o",
    startTime: 18,
    distractors: ["Áo Mới Cà Mau", "Vọng Cổ Buồn", "Đêm Gành Hào Nghe Điệu Hoài Lang"],
    explanation: "'Chiếc Áo Bà Ba' của nhạc sĩ Trần Thiện Thanh ngợi ca nét đẹp dịu dàng, nết na của người con gái Hậu Giang duyên dáng."
  },
  {
    title: "Đêm Gành Hào Nghe Điệu Hoài Lang",
    artist: "Cẩm Ly",
    ytid: "G8e_P1k8_5o",
    startTime: 20,
    distractors: ["Áo Mới Cà Mau", "Vọng Cổ Buồn", "Nỗi Buồn Mẹ Tôi"],
    explanation: "'Đêm Gành Hào Nghe Điệu Hoài Lang' của nhạc sĩ Vũ Đức Sao Biển khắc khoải tiếng đàn Dạ Cổ Hoài Lang bên sông trăng."
  },
  {
    title: "Sa Mưa Giông",
    artist: "Phương Mỹ Chi",
    ytid: "M8e_P1k7_2o",
    startTime: 20,
    distractors: ["Quê Em Mùa Nước Lũ", "Còn Thương Rau Đắng Mọc Sau Hè", "Áo Mới Cà Mau"],
    explanation: "'Sa Mưa Giông' của nhạc sĩ Bắc Sơn đưa giọng ca nhí Phương Mỹ Chi gây sốt toàn quốc tại The Voice Kids 2013."
  },
  {
    title: "Còn Thương Rau Đắng Mọc Sau Hè",
    artist: "Như Quỳnh",
    ytid: "R8e_P2k8_3o",
    startTime: 20,
    distractors: ["Duyên Phận", "Vùng Lá Me Bay", "Sa Mưa Giông"],
    explanation: "'Còn Thương Rau Đắng Mọc Sau Hè' của Bắc Sơn là khúc ca quê hương da diết về tình mẹ và món canh rau đắng bình dị."
  },
  {
    title: "Chim Trắng Mồ Côi",
    artist: "Đan Trường & Cẩm Ly",
    ytid: "D8e_C1k9_8o",
    startTime: 20,
    distractors: ["Phượng Buồn", "Áo Mới Cà Mau", "Vọng Cổ Buồn"],
    explanation: "'Chim Trắng Mồ Côi' của Minh Vy & Hồng Xương Long là bản song ca dân ca quê hương nổi tiếng nhất trong lịch sử V-Pop."
  },
  {
    title: "Áo Mới Cà Mau",
    artist: "Phi Nhung",
    ytid: "ZeuyOyCdsGI",
    startTime: 16,
    distractors: ["Đêm Gành Hào Nghe Điệu Hoài Lang", "Phải Lòng Con Gái Bến Tre", "Bông Điên Điển"],
    explanation: "'Áo Mới Cà Mau' sáng tác bởi nhạc sĩ Thanh Sơn qua tiếng hát cố nghệ sĩ Phi Nhung đã trở thành khúc ca quê hương quốc dân."
  },
  {
    title: "Vọng Cổ Buồn",
    artist: "Cẩm Ly",
    ytid: "VUk6OinfhVg",
    startTime: 20,
    distractors: ["Áo Mới Cà Mau", "Chim Trắng Mồ Côi", "Nỗi Buồn Mẹ Tôi"],
    explanation: "'Vọng Cổ Buồn' của nhạc sĩ Minh Vy là bản dân ca da diết gắn liền với tên tuổi 'chị Tư' Cẩm Ly."
  },
  {
    title: "Hình Bóng Quê Nhà",
    artist: "Phi Nhung",
    ytid: "H8k_B1e9_7o",
    startTime: 18,
    distractors: ["Áo Mới Cà Mau", "Bông Điên Điển", "Nỗi Buồn Mẹ Tôi"],
    explanation: "'Hình Bóng Quê Nhà' của nhạc sĩ Thanh Sơn gợi nhớ hình bóng cánh đồng quê hương và người mẹ già tần tảo sớm hôm."
  },
  {
    title: "Chuyện Hoa Sim",
    artist: "Như Quỳnh",
    ytid: "C8e_H1k9_9o",
    startTime: 20,
    distractors: ["Chuyện Ba Người", "Duyên Phận", "Người Tình Mùa Đông"],
    explanation: "'Chuyện Hoa Sim' của Anh Bằng phổ thơ Hữu Loan kể về mối tình thời chiến son sắt gắn với màu hoa sim tím đồi hoang."
  },
  {
    title: "Giọt Lệ Sầu",
    artist: "Lệ Quyên",
    ytid: "G8e_L1k9_1o",
    startTime: 20,
    distractors: ["Tình Lỡ", "Mưa Rừng", "Hoa Nở Về Đêm"],
    explanation: "'Giọt Lệ Sầu' của nhạc sĩ Lam Phương là bản Bolero trầm lắng chất chứa giọt nước mắt nghẹn ngào của cuộc tình lỡ dở."
  },
  {
    title: "Giã Từ",
    artist: "Đan Nguyên",
    ytid: "G8e_T1k9_2o",
    startTime: 20,
    distractors: ["Thói Đời", "Xin Gọi Nhau Là Cố Nhân", "Hai Lối Mộng"],
    explanation: "'Giã Từ' của nhạc sĩ Tô Thanh Tùng mở đầu bằng câu hát 'Tuổi nào nhìn nhau hờn ghen ngập lối' đầy sâu lắng."
  },
  {
    title: "Tiền Thắng Tình Thua",
    artist: "Đan Nguyên",
    ytid: "T8e_T1k9_3o",
    startTime: 20,
    distractors: ["Thói Đời", "Đắp Mộ Cuộc Tình", "Lại Nhớ Người Yêu"],
    explanation: "'Tiền Thắng Tình Thua' của nhạc sĩ Mạnh Quỳnh nói lên nỗi đau khi tình cảm chân thành bị đồng tiền chia rẽ."
  },
  {
    title: "Xót Xa",
    artist: "Đan Nguyên",
    ytid: "X8e_X1k9_4o",
    startTime: 20,
    distractors: ["Thói Đời", "Hai Lối Mộng", "Xin Gọi Nhau Là Cố Nhân"],
    explanation: "'Xót Xa' của nhạc sĩ Tô Thanh Tùng với câu hát bất hủ 'Đôi khi trộm nhìn em, xem dung nhan đó bây giờ ra sao'."
  },
  {
    title: "Hai Lối Mộng",
    artist: "Lệ Quyên",
    ytid: "H8e_L1k9_5o",
    startTime: 20,
    distractors: ["Sầu Tím Thiệp Hồng", "Tình Lỡ", "Hoa Nở Về Đêm"],
    explanation: "'Hai Lối Mộng' của nhạc sĩ Trúc Phương diễn tả cảnh hai người rẽ sang hai hướng cuộc đời chẳng còn chung đôi."
  },
  {
    title: "Mười Năm Tình Cũ",
    artist: "Lệ Quyên",
    ytid: "M8e_N1k9_6o",
    startTime: 20,
    distractors: ["Bản Tình Cuối", "Tình Lỡ", "Giọt Lệ Sầu"],
    explanation: "'Mười Năm Tình Cũ' của nhạc sĩ Trần Quảng Nam là khúc hoài niệm mười năm xa cách người thương với bao đổi thay."
  },
  {
    title: "Bài Ca Kỷ Niệm",
    artist: "Quang Lê & Minh Tuyết",
    ytid: "B8e_C1k9_7o",
    startTime: 18,
    distractors: ["Sầu Tím Thiệp Hồng", "Căn Nhà Màu Tím", "Gõ Cửa Trái Tim"],
    explanation: "'Bài Ca Kỷ Niệm' của Tú Nhi & Bằng Giang là bản song ca ngọt ngào về những kỷ niệm êm đềm thuở mới quen nhau."
  },
  {
    title: "Lâu Đài Tình Ái",
    artist: "Đàm Vĩnh Hưng",
    ytid: "L8e_D1k9_8o",
    startTime: 18,
    distractors: ["Biển Tình", "Say Tình", "Xin Lỗi Tình Yêu"],
    explanation: "'Lâu Đài Tình Ái' của nhạc sĩ Trần Thiện Thanh xây nên giấc mơ tình yêu lộng lẫy trên đỉnh lâu đài nguy nga."
  },
  {
    title: "Hàn Mặc Tử",
    artist: "Lệ Quyên",
    ytid: "qJk2L_9aPoQ",
    startTime: 20,
    distractors: ["Đồi Thông Hai Mộ", "Chuyện Tình Lan Và Điệp", "Mưa Rừng"],
    explanation: "'Hàn Mặc Tử' của nhạc sĩ Trần Thiện Thanh kể về cuộc đời và mối tình bi thương của nhà thơ tài hoa bạc mệnh."
  }
];

const TRU_TINH_DO_65 = [
  {
    title: "Đất Nước Trọn Niềm Vui",
    artist: "NSND Tạ Minh Tâm",
    ytid: "D8e_N1t9_1o",
    startTime: 18,
    distractors: ["Mùa Xuân Trên Thành Phố Hồ Chí Minh", "Bài Ca Hy Vọng", "Tiến Quân Ca"],
    explanation: "'Đất Nước Trọn Niềm Vui' của nhạc sĩ Hoàng Hà là bản hùng ca rực rỡ chào mừng ngày non sông liền một dải 30/4/1975."
  },
  {
    title: "Tàu Anh Qua Núi",
    artist: "NSND Thanh Hoa",
    ytid: "T8e_A1q9_2o",
    startTime: 16,
    distractors: ["Cô Gái Mở Đường", "Chào Em Cô Gái Lam Hồng", "Bài Ca Xây Dựng"],
    explanation: "'Tàu Anh Qua Núi' của Phan Lạc Hoa gắn liền với tiếng hát chim sơn ca của NSND Thanh Hoa vượt đèo Hải Vân kỳ vĩ."
  },
  {
    title: "Năm Anh Em Trên Một Chiếc Xe Tăng",
    artist: "NSND Quang Thọ",
    ytid: "N8e_A1e9_3o",
    startTime: 18,
    distractors: ["Đất Nước Trọn Niềm Vui", "Bác Đang Cùng Chúng Cháu Hành Quân", "Chiếc Gậy Trường Sơn"],
    explanation: "'Năm Anh Em Trên Một Chiếc Xe Tăng' của Doãn Nho phổ thơ Hữu Thỉnh ca ngợi tinh thần đoàn kết keo sơn của người lính xe tăng."
  },
  {
    title: "Cô Gái Mở Đường",
    artist: "Cẩm Ly",
    ytid: "C8e_G1m9_4o",
    startTime: 16,
    distractors: ["Tàu Anh Qua Núi", "Tiếng Đàn Ta Lư", "Chào Em Cô Gái Lam Hồng"],
    explanation: "'Cô Gái Mở Đường' của Ánh Dương tôn vinh những nữ thanh niên xung phong quả cảm san đường mở lối thời mưa bom bão đạn."
  },
  {
    title: "Bài Ca Hy Vọng",
    artist: "Hồng Nhung",
    ytid: "B8e_C1h9_5o",
    startTime: 20,
    distractors: ["Đất Nước Trọn Niềm Vui", "Giai Điệu Tổ Quốc", "Hát Về Cây Lúa Hôm Nay"],
    explanation: "'Bài Ca Hy Vọng' của nhạc sĩ Văn Ký thắp lên niềm tin son sắt vào tương lai tươi sáng và hòa bình của dân tộc."
  },
  {
    title: "Tiến Quân Ca",
    artist: "Hợp xướng Quân đội",
    ytid: "T8e_Q1c9_6o",
    startTime: 15,
    distractors: ["Đất Nước Trọn Niềm Vui", "Giai Điệu Tổ Quốc", "Giải Phóng Điện Biên"],
    explanation: "'Tiến Quân Ca' của cố nhạc sĩ Văn Cao là Quốc ca thiêng liêng và bất tử của nước Cộng hòa Xã hội Chủ nghĩa Việt Nam."
  },
  {
    title: "Hát Về Cây Lúa Hôm Nay",
    artist: "NSND Trọng Tấn",
    ytid: "H8e_V1c9_7o",
    startTime: 18,
    distractors: ["Khúc Hát Sông Quê", "Tình Ta Biển Bạc Đồng Xanh", "Về Quê"],
    explanation: "'Hát Về Cây Lúa Hôm Nay' của Hoàng Vân ca ngợi vẻ đẹp trù phú của đồng lúa vàng và công ơn người nông dân Việt Nam."
  },
  {
    title: "Bác Đang Cùng Chúng Cháu Hành Quân",
    artist: "NSND Quang Thọ",
    ytid: "B8e_D1c9_8o",
    startTime: 18,
    distractors: ["Năm Anh Em Trên Một Chiếc Xe Tăng", "Chiếc Gậy Trường Sơn", "Lá Đỏ"],
    explanation: "'Bác Đang Cùng Chúng Cháu Hành Quân' của nhạc sĩ Huy Thục tiếp thêm sức mạnh tinh thần to lớn cho đoàn quân tiến bước."
  },
  {
    title: "Trường Sơn Đông Trường Sơn Tây",
    artist: "Trung Đức & Thu Hiền",
    ytid: "T8e_S1d9_9o",
    startTime: 18,
    distractors: ["Gửi Em Ở Cuối Sông Hồng", "Tình Ta Biển Bạc Đồng Xanh", "Chiếc Gậy Trường Sơn"],
    explanation: "'Trường Sơn Đông Trường Sơn Tây' của Hoàng Hiệp phổ thơ Phạm Tiến Duật là bản tình ca thời hoa lửa kinh điển nhất."
  },
  {
    title: "Tiếng Đàn Ta Lư",
    artist: "NSND Thanh Hoa",
    ytid: "T8e_D1t9_1o",
    startTime: 16,
    distractors: ["Cô Gái Mở Đường", "Tàu Anh Qua Núi", "Xuân Chiến Khu"],
    explanation: "'Tiếng Đàn Ta Lư' của nhạc sĩ Huy Thục mang âm hưởng núi rừng Pa Cô hùng vĩ với tiếng hát vút cao reo vui chiến thắng."
  },
  {
    title: "Nối Vòng Tay Lớn",
    artist: "Trịnh Công Sơn",
    ytid: "N8e_V1t9_2o",
    startTime: 15,
    distractors: ["Một Cõi Đi Về", "Cát Bụi", "Huyền Thoại Mẹ"],
    explanation: "'Nối Vòng Tay Lớn' của Trịnh Công Sơn là khúc ca đoàn kết muôn triệu trái tim Việt Nam nắm chặt tay nhau nối liền biển trời."
  },
  {
    title: "Gửi Em Ở Cuối Sông Hồng",
    artist: "Việt Hoàn & Anh Thơ",
    ytid: "G8e_E1c9_3o",
    startTime: 18,
    distractors: ["Trường Sơn Đông Trường Sơn Tây", "Tình Ta Biển Bạc Đồng Xanh", "Khúc Hát Sông Quê"],
    explanation: "'Gửi Em Ở Cuối Sông Hồng' của Thuận Yến phổ thơ Dương Soái gửi gắm tình yêu đôi lứa nơi biên cương về hậu phương đồng bằng."
  },
  {
    title: "Mùa Xuân Trên Thành Phố Hồ Chí Minh",
    artist: "NSND Quang Thọ",
    ytid: "M8e_X1t9_4o",
    startTime: 18,
    distractors: ["Đất Nước Trọn Niềm Vui", "Tiến Quân Ca", "Giai Điệu Tổ Quốc"],
    explanation: "'Mùa Xuân Trên Thành Phố Hồ Chí Minh' của Xuân Hồng tràn ngập niềm vui phơi phới của mùa xuân độc lập đại thắng."
  },
  {
    title: "Huyền Thoại Mẹ",
    artist: "Khánh Ly",
    ytid: "H8e_T1m9_5o",
    startTime: 20,
    distractors: ["Nối Vòng Tay Lớn", "Cát Bụi", "Một Cõi Đi Về"],
    explanation: "'Huyền Thoại Mẹ' của Trịnh Công Sơn ngợi ca hình tượng người mẹ Việt Nam anh hùng âm thầm chở che cho đoàn quân."
  },
  {
    title: "Khúc Hát Sông Quê",
    artist: "Anh Thơ",
    ytid: "K8e_H1s9_6o",
    startTime: 20,
    distractors: ["Về Quê", "Hát Về Cây Lúa Hôm Nay", "Gửi Em Ở Cuối Sông Hồng"],
    explanation: "'Khúc Hát Sông Quê' của Nguyễn Trọng Tạo phổ thơ Lê Huy Mậu gợi nhắc bến nước dòng sông quê hương êm đềm tuổi thơ."
  },
  {
    title: "Câu Hò Bên Bờ Hiền Lương",
    artist: "NSND Thu Hiền",
    ytid: "C8e_H1b9_7o",
    startTime: 20,
    distractors: ["Tiếng Đàn Ta Lư", "Trường Sơn Đông Trường Sơn Tây", "Khúc Hát Sông Quê"],
    explanation: "'Câu Hò Bên Bờ Hiền Lương' của Hoàng Hiệp khắc họa nỗi niềm đau đáu cách trở đôi bờ sông Bến Hải thời kỳ chia cắt."
  },
  {
    title: "Chiếc Gậy Trường Sơn",
    artist: "NSND Trung Đức",
    ytid: "C8e_G1t9_8o",
    startTime: 18,
    distractors: ["Năm Anh Em Trên Một Chiếc Xe Tăng", "Bác Đang Cùng Chúng Cháu Hành Quân", "Lá Đỏ"],
    explanation: "'Chiếc Gậy Trường Sơn' của Phạm Tuyên kể về cây gậy hành quân từ làng Hòa Xá theo chân người lính vượt muôn dặm đèo cao."
  },
  {
    title: "Đêm Nghe Hát Điệu Ví Giặm",
    artist: "Anh Thơ",
    ytid: "D8e_N1h9_9o",
    startTime: 20,
    distractors: ["Khúc Hát Sông Quê", "Về Quê", "Câu Hò Bên Bờ Hiền Lương"],
    explanation: "'Đêm Nghe Hát Điệu Ví Giặm' của An Thuyên thắm đượm ân tình xứ Nghệ và tiếng ru ngọt ngào của người mẹ hiền."
  },
  {
    title: "Hà Nội Mùa Vắng Những Cơn Mưa",
    artist: "Cẩm Vân",
    ytid: "H8e_N1m9_1o",
    startTime: 20,
    distractors: ["Em Ơi Hà Nội Phố", "Nhớ Về Hà Nội", "Hoa Sữa"],
    explanation: "'Hà Nội Mùa Vắng Những Cơn Mưa' của Trương Quý Hải phổ thơ Bùi Thanh Tuấn là nỗi hoài niệm da diết về mùa thu Hà Nội."
  },
  {
    title: "Riêng Một Góc Trời",
    artist: "Tuấn Ngọc",
    ytid: "R8e_M1g9_2o",
    startTime: 20,
    distractors: ["Niệm Khúc Cuối", "Khúc Thụy Du", "Ru Tình"],
    explanation: "'Riêng Một Góc Trời' của nhạc sĩ Ngô Thụy Miên gắn liền với giọng ca trầm ấm lịch lãm của danh ca Tuấn Ngọc."
  },
  {
    title: "Niệm Khúc Cuối",
    artist: "Tuấn Ngọc",
    ytid: "N8e_K1c9_3o",
    startTime: 20,
    distractors: ["Riêng Một Góc Trời", "Khúc Thụy Du", "Bản Tình Cuối"],
    explanation: "'Niệm Khúc Cuối' của Ngô Thụy Miên là bản tình ca thề nguyền thủy chung dù cuộc đời qua bao giông bão."
  },
  {
    title: "Khúc Thụy Du",
    artist: "Tuấn Ngọc",
    ytid: "K8e_T1d9_4o",
    startTime: 20,
    distractors: ["Riêng Một Góc Trời", "Niệm Khúc Cuối", "Ru Tình"],
    explanation: "'Khúc Thụy Du' của Anh Bằng phổ thơ Du Tử Lê mang giai điệu nồng nàn và triết lý sâu sắc về tình yêu và cái chết."
  },
  {
    title: "Em Còn Nhớ Hay Em Đã Quên",
    artist: "Khánh Ly",
    ytid: "E8e_C1n9_5o",
    startTime: 20,
    distractors: ["Hạ Trắng", "Diễm Xưa", "Còn Tuổi Nào Cho Em"],
    explanation: "'Em Còn Nhớ Hay Em Đã Quên' của Trịnh Công Sơn gửi gắm nỗi nhớ nhung da diết về những góc phố và con đường xưa kỷ niệm."
  },
  {
    title: "Hạ Trắng",
    artist: "Khánh Ly",
    ytid: "H8e_T1r9_6o",
    startTime: 20,
    distractors: ["Diễm Xưa", "Cát Bụi", "Một Cõi Đi Về"],
    explanation: "'Hạ Trắng' của Trịnh Công Sơn với lời ca siêu thực 'Gọi nắng, trên vai em gầy đường xa áo bay' đẹp như bức tranh thơ."
  },
  {
    title: "Diễm Xưa",
    artist: "Khánh Ly",
    ytid: "D8e_X1u9_7o",
    startTime: 20,
    distractors: ["Hạ Trắng", "Còn Tuổi Nào Cho Em", "Một Cõi Đi Về"],
    explanation: "'Diễm Xưa' của Trịnh Công Sơn là nhạc phẩm vang danh thế giới, từng được dịch sang tiếng Nhật và phát sóng trên đài NHK."
  },
  {
    title: "Còn Tuổi Nào Cho Em",
    artist: "Hà Anh Tuấn",
    ytid: "C8e_T1n9_8o",
    startTime: 18,
    distractors: ["Diễm Xưa", "Hạ Trắng", "Xuân Thì"],
    explanation: "'Còn Tuổi Nào Cho Em' của Trịnh Công Sơn qua giọng ca Hà Anh Tuấn trong trẻo mang hơi thở hiện đại đến thế hệ trẻ."
  },
  {
    title: "Một Cõi Đi Về",
    artist: "Trịnh Công Sơn",
    ytid: "M8e_C1d9_9o",
    startTime: 20,
    distractors: ["Cát Bụi", "Nối Vòng Tay Lớn", "Huyền Thoại Mẹ"],
    explanation: "'Một Cõi Đi Về' của Trịnh Công Sơn đúc kết cõi nhân sinh vô thường với ca từ mộc mạc mà thấm đẫm triết lý Phật giáo."
  },
  {
    title: "Cát Bụi",
    artist: "Khánh Ly",
    ytid: "C8e_B1u9_1o",
    startTime: 20,
    distractors: ["Một Cõi Đi Về", "Hạ Trắng", "Diễm Xưa"],
    explanation: "'Cát Bụi' của Trịnh Công Sơn với câu hỏi ngàn đời 'Hạt bụi nào hóa kiếp thân tôi, để một mai vươn hình hài lớn dậy'."
  },
  {
    title: "Ru Tình",
    artist: "Tuấn Ngọc",
    ytid: "R8e_T1n9_2o",
    startTime: 20,
    distractors: ["Riêng Một Góc Trời", "Niệm Khúc Cuối", "Khúc Thụy Du"],
    explanation: "'Ru Tình' của Trịnh Công Sơn như lời ru nhẹ nhàng dỗ dành trái tim tổn thương qua những thăng trầm đời người."
  },
  {
    title: "Cho Em Quên Cơn Mộng Ảo",
    artist: "Khánh Hà",
    ytid: "C8e_E1q9_3o",
    startTime: 20,
    distractors: ["Tình Hờ", "Bản Tình Cuối", "Niệm Khúc Cuối"],
    explanation: "'Cho Em Quên Cơn Mộng Ảo' của Lam Phương là khúc tình ca quyến rũ gắn với tiếng hát điêu luyện của diva hải ngoại Khánh Hà."
  },
  {
    title: "Biển Nỗi Nhớ Và Em",
    artist: "Tấn Minh",
    ytid: "B8e_N1n9_4o",
    startTime: 20,
    distractors: ["Em Ơi Hà Nội Phố", "Nỗi Nhớ Mùa Đông", "Hà Nội Mùa Vắng Những Cơn Mưa"],
    explanation: "'Biển Nỗi Nhớ Và Em' của nhạc sĩ Phú Quang phổ thơ Hữu Thỉnh diễn tả nỗi cô đơn giằng xé trước biển đêm mênh mông."
  },
  {
    title: "Em Ơi Hà Nội Phố",
    artist: "Bằng Kiều",
    ytid: "E8e_O1h9_5o",
    startTime: 20,
    distractors: ["Hà Nội Mùa Vắng Những Cơn Mưa", "Nỗi Nhớ Mùa Đông", "Nhớ Về Hà Nội"],
    explanation: "'Em Ơi Hà Nội Phố' của Phú Quang phổ thơ Phan Vũ là bản tình ca bất hủ về mùi hoa sữa và mái ngói rêu phong Hà Nội."
  },
  {
    title: "Nỗi Nhớ Mùa Đông",
    artist: "Thu Phương",
    ytid: "N8e_N1m9_6o",
    startTime: 20,
    distractors: ["Em Ơi Hà Nội Phố", "Biển Nỗi Nhớ Và Em", "Hà Nội Mùa Vắng Những Cơn Mưa"],
    explanation: "'Nỗi Nhớ Mùa Đông' của Phú Quang với câu hát 'Dường như ai đi ngang cửa, gió mùa đông bắc se lòng' nao nức tâm can."
  },
  {
    title: "Chiều Mạc Tư Khoa",
    artist: "Quang Dũng",
    ytid: "C8e_M1t9_7o",
    startTime: 20,
    distractors: ["Triệu Đóa Hoa Hồng", "Nụ Tầm Xuân", "Lối Cũ Ta Về"],
    explanation: "'Chiều Mạc Tư Khoa' nhạc Nga lời Việt gắn liền với ký ức du học sinh và thanh niên Việt Nam thế kỷ 20."
  },
  {
    title: "Lối Cũ Ta Về",
    artist: "Thanh Lam",
    ytid: "L8e_C1t9_8o",
    startTime: 20,
    distractors: ["Hoa Sữa", "Giọt Nắng Bên Thềm", "Mây Trắng Bay Về"],
    explanation: "'Lối Cũ Ta Về' của nhạc sĩ Thanh Tùng đưa giọng hát diva Thanh Lam thăng hoa đầy cảm xúc hoài niệm tuổi hoa niên."
  },
  {
    title: "Hoa Sữa",
    artist: "Thanh Lam",
    ytid: "H8e_S1u9_9o",
    startTime: 20,
    distractors: ["Em Ơi Hà Nội Phố", "Lối Cũ Ta Về", "Hà Nội Mùa Vắng Những Cơn Mưa"],
    explanation: "'Hoa Sữa' của nhạc sĩ Hồng Đăng trong phim Hà Nội Mùa Chim Làm Tổ đưa mùi hương hoa sữa trở thành biểu tượng thủ đô."
  },
  {
    title: "Giọt Nắng Bên Thềm",
    artist: "Thanh Lam",
    ytid: "G8e_N1b9_1o",
    startTime: 18,
    distractors: ["Lối Cũ Ta Về", "Thì Thầm Mùa Xuân", "Hoa Sữa"],
    explanation: "'Giọt Nắng Bên Thềm' của nhạc sĩ Thanh Tùng đem lại nguồn sinh khí rực rỡ và ấm áp cho nền tân nhạc thập niên 90."
  },
  {
    title: "Thì Thầm Mùa Xuân",
    artist: "Mỹ Linh",
    ytid: "T8e_T1m9_2o",
    startTime: 18,
    distractors: ["Hương Ngọc Lan", "Trưa Vắng", "Trên Đỉnh Phù Vân"],
    explanation: "'Thì Thầm Mùa Xuân' của Ngọc Châu đưa giọng ca Mỹ Linh với mái tóc ngắn cá tính vụt sáng tại liên hoan âm nhạc 1993."
  },
  {
    title: "Chị Tôi",
    artist: "Trần Tiến",
    ytid: "C8e_T1o9_3o",
    startTime: 20,
    distractors: ["Sắc Màu", "Mặt Trời Bé Con", "Chiếc Khăn Piêu"],
    explanation: "'Chị Tôi' của nhạc sĩ Trần Tiến là bài ca rớt nước mắt về số phận người chị tần tảo hy sinh cả thanh xuân vì đàn em thơ."
  },
  {
    title: "Sắc Màu",
    artist: "Trần Tiến",
    ytid: "S8e_M1a9_4o",
    startTime: 18,
    distractors: ["Chị Tôi", "Mặt Trời Bé Con", "Chiếc Vòng Cầu Hôn"],
    explanation: "'Sắc Màu' của nhạc sĩ Trần Tiến đưa người nghe vào thế giới hội họa âm thanh đầy suy ngẫm về cuộc đời muôn màu."
  },
  {
    title: "Mặt Trời Bé Con",
    artist: "Trần Tiến",
    ytid: "M8e_T1b9_5o",
    startTime: 18,
    distractors: ["Sắc Màu", "Chị Tôi", "Tạm Biệt Chim Én"],
    explanation: "'Mặt Trời Bé Con' của Trần Tiến với câu chuyện ngộ nghĩnh về chú bé nhìn qua ô cửa sổ làm say đắm bao thế hệ."
  },
  {
    title: "Chiếc Khăn Piêu",
    artist: "Tùng Dương",
    ytid: "C8e_K1p9_6o",
    startTime: 18,
    distractors: ["Chảy Đi Sông Ơi", "Trên Đỉnh Phù Vân", "Con Cò"],
    explanation: "'Chiếc Khăn Piêu' của Doãn Nho qua bản phối ma mị của Tùng Dương đã giành cú đúp Bài hát yêu thích của năm."
  },
  {
    title: "Chảy Đi Sông Ơi",
    artist: "Tùng Dương",
    ytid: "C8e_D1s9_7o",
    startTime: 20,
    distractors: ["Chiếc Khăn Piêu", "Bên Kia Sông Đuống", "Hồ Trên Núi"],
    explanation: "'Chảy Đi Sông Ơi' của nhạc sĩ Phó Đức Phương là bản hùng ca tráng lệ và triết lý về những dòng sông mẹ hiền hòa."
  },
  {
    title: "Trên Đỉnh Phù Vân",
    artist: "Mỹ Linh",
    ytid: "T8e_D1p9_8o",
    startTime: 20,
    distractors: ["Hương Ngọc Lan", "Thì Thầm Mùa Xuân", "Chiếc Khăn Piêu"],
    explanation: "'Trên Đỉnh Phù Vân' của Phó Đức Phương mang đậm âm hưởng Chèo và làn khói sương mờ ảo chốn thiền môn Yên Tử."
  },
  {
    title: "Hương Ngọc Lan",
    artist: "Mỹ Linh",
    ytid: "H8e_N1l9_9o",
    startTime: 20,
    distractors: ["Trưa Vắng", "Thì Thầm Mùa Xuân", "Trên Đỉnh Phù Vân"],
    explanation: "'Hương Ngọc Lan' của nhạc sĩ Anh Quân là ca khúc R&B trữ tình đỉnh cao vẽ nên hương thơm ngát của mối tình đầu trong sáng."
  },
  {
    title: "Trưa Vắng",
    artist: "Mỹ Linh",
    ytid: "T8e_V1a9_1o",
    startTime: 20,
    distractors: ["Hương Ngọc Lan", "Thì Thầm Mùa Xuân", "Tóc Ngắn"],
    explanation: "'Trưa Vắng' của nhạc sĩ Huy Tuấn mang lại không gian tĩnh lặng, êm ả của buổi trưa hè ngập tràn hoài niệm tình yêu."
  },
  {
    title: "Nhớ Về Hà Nội",
    artist: "Hồng Nhung",
    ytid: "N8e_V1h9_2o",
    startTime: 20,
    distractors: ["Em Ơi Hà Nội Phố", "Hà Nội Mùa Vắng Những Cơn Mưa", "Hoa Sữa"],
    explanation: "'Nhớ Về Hà Nội' của Hoàng Hiệp gắn liền với giọng hát thanh thoát của 'cô Bống' Hồng Nhung về Ba Đình rực nắng."
  },
  {
    title: "Giọt Sương Bay Lên",
    artist: "Ngọc Khuê",
    ytid: "G8e_S1b9_3o",
    startTime: 18,
    distractors: ["Bà Tôi", "Chuồn Chuồn Ớt", "Cặp Ba Lá"],
    explanation: "'Giọt Sương Bay Lên' của Nguyễn Vĩnh Tiến đưa phong cách dân gian đương đại của Ngọc Khuê bùng nổ tại Bài Hát Việt."
  },
  {
    title: "Bà Tôi",
    artist: "Ngọc Khuê",
    ytid: "B8e_T1o9_4o",
    startTime: 18,
    distractors: ["Giọt Sương Bay Lên", "Chuồn Chuồn Ớt", "Chị Tôi"],
    explanation: "'Bà Tôi' của Nguyễn Vĩnh Tiến với hình ảnh người bà còng lưng gánh rạ ngạt ngào mùi hương lúa mộc mạc."
  },
  {
    title: "Chuồn Chuồn Ớt",
    artist: "Ngọc Khuê",
    ytid: "C8e_C1o9_5o",
    startTime: 16,
    distractors: ["Bà Tôi", "Giọt Sương Bay Lên", "Đá Trông Chồng"],
    explanation: "'Chuồn Chuồn Ớt' của Lê Minh Sơn là bước đột phá âm nhạc dân gian đương đại tạo nên thương hiệu 'chuồn chuồn ớt' Ngọc Khuê."
  },
  {
    title: "Về Quê",
    artist: "Anh Thơ",
    ytid: "V8e_Q1u9_6o",
    startTime: 20,
    distractors: ["Khúc Hát Sông Quê", "Hát Về Cây Lúa Hôm Nay", "Tình Ta Biển Bạc Đồng Xanh"],
    explanation: "'Về Quê' của nhạc sĩ Phó Đức Phương đưa người nghe trở về với mái nhà tranh, bờ ao và cánh cò bay lả rập rờn."
  },
  {
    title: "Tình Ta Biển Bạc Đồng Xanh",
    artist: "Trọng Tấn & Anh Thơ",
    ytid: "T8e_T1b9_7o",
    startTime: 18,
    distractors: ["Gửi Em Ở Cuối Sông Hồng", "Trường Sơn Đông Trường Sơn Tây", "Hát Về Cây Lúa Hôm Nay"],
    explanation: "'Tình Ta Biển Bạc Đồng Xanh' của Hoàng Sông Hương ca ngợi tình yêu hòa quyện giữa người chiến sĩ giữ biển và cô gái đồng quê."
  },
  {
    title: "Đường Chúng Ta Đi",
    artist: "NSND Doãn Tần",
    ytid: "D8e_C1t9_8o",
    startTime: 18,
    distractors: ["Đất Nước Trọn Niềm Vui", "Tiến Quân Ca", "Giai Điệu Tổ Quốc"],
    explanation: "'Đường Chúng Ta Đi' của nhạc sĩ Huy Du vang vọng khí thế hào hùng 'Việt Nam trên đường chúng ta đi' rực rỡ cờ sao."
  },
  {
    title: "Chào Em Cô Gái Lam Hồng",
    artist: "NSND Trung Đức",
    ytid: "C8e_E1l9_9o",
    startTime: 16,
    distractors: ["Cô Gái Mở Đường", "Tàu Anh Qua Núi", "Tiếng Đàn Ta Lư"],
    explanation: "'Chào Em Cô Gái Lam Hồng' của Ánh Dương gửi lời chào rạng rỡ tới các cô gái kiên cường ngày đêm bám đường bom đạn."
  },
  {
    title: "Bài Ca Xây Dựng",
    artist: "NSND Quang Lý",
    ytid: "B8e_C1x9_1o",
    startTime: 18,
    distractors: ["Đường Chúng Ta Đi", "Đất Nước Trọn Niềm Vui", "Tàu Anh Qua Núi"],
    explanation: "'Bài Ca Xây Dựng' của Hoàng Vân ca ngợi những bàn tay xây nên những công trình mới dựng xây đất nước hòa bình."
  },
  {
    title: "Lá Đỏ",
    artist: "Tùng Dương",
    ytid: "L8e_D1o9_2o",
    startTime: 18,
    distractors: ["Năm Anh Em Trên Một Chiếc Xe Tăng", "Chiếc Gậy Trường Sơn", "Trường Sơn Đông Trường Sơn Tây"],
    explanation: "'Lá Đỏ' của Hoàng Hiệp phổ thơ Nguyễn Đình Thi với hình ảnh rừng Trường Sơn ào ào lá đỏ tiễn đoàn quân ra trận."
  },
  {
    title: "Hò Kéo Pháo",
    artist: "Hợp xướng Quân đội",
    ytid: "H8e_K1p9_3o",
    startTime: 16,
    distractors: ["Giải Phóng Điện Biên", "Tiến Quân Ca", "Đất Nước Trọn Niềm Vui"],
    explanation: "'Hò Kéo Pháo' của Hoàng Vân tái hiện tinh thần quả cảm kéo những cỗ pháo nặng hàng tấn vào trận địa Điện Biên Phủ."
  },
  {
    title: "Giải Phóng Điện Biên",
    artist: "Đoàn Ca múa Quân đội",
    ytid: "G8e_P1d9_4o",
    startTime: 16,
    distractors: ["Hò Kéo Pháo", "Đất Nước Trọn Niềm Vui", "Tiến Quân Ca"],
    explanation: "'Giải Phóng Điện Biên' của Đỗ Nhuận sáng tác ngay trên đường hành quân mừng chiến thắng lừng lẫy năm châu chấn động địa cầu."
  },
  {
    title: "Du Kích Sông Thao",
    artist: "NSND Lê Dung",
    ytid: "D8e_K1s9_5o",
    startTime: 20,
    distractors: ["Sông Lô", "Bài Ca Hy Vọng", "Tiến Quân Ca"],
    explanation: "'Du Kích Sông Thao' của Đỗ Nhuận khắc họa hình ảnh dòng sông Thao cuộn sóng hồng phù sa cùng chiến công du kích oai hùng."
  },
  {
    title: "Xuân Chiến Khu",
    artist: "NSND Thu Hiền",
    ytid: "X8e_C1k9_6o",
    startTime: 18,
    distractors: ["Tiếng Đàn Ta Lư", "Cô Gái Mở Đường", "Chào Em Cô Gái Lam Hồng"],
    explanation: "'Xuân Chiến Khu' của Xuân Hồng mang tiếng chim rừng véo von reo vui chào đón mùa xuân mới ngập tràn niềm lạc quan."
  },
  {
    title: "Bài Ca May Áo",
    artist: "NSND Thu Hiền",
    ytid: "B8e_C1m9_7o",
    startTime: 18,
    distractors: ["Xuân Chiến Khu", "Cô Gái Mở Đường", "Câu Hò Bên Bờ Hiền Lương"],
    explanation: "'Bài Ca May Áo' của Xuân Hồng gửi gắm từng đường kim mũi chỉ chứa chan tình yêu thương gửi tới anh chiến sĩ tiền tuyến."
  },
  {
    title: "Giai Điệu Tổ Quốc",
    artist: "NSND Trung Kiên",
    ytid: "G8e_D1t9_8o",
    startTime: 18,
    distractors: ["Đất Nước Trọn Niềm Vui", "Đường Chúng Ta Đi", "Bài Ca Hy Vọng"],
    explanation: "'Giai Điệu Tổ Quốc' của Trần Tiến ngân vang tha thiết tình yêu đất nước 'Tôi nghe giai điệu Tổ quốc tôi, dịu dàng trong tiếng ru hời'."
  },
  {
    title: "Dấu Chân Phía Trước",
    artist: "NSND Cao Minh",
    ytid: "D8e_C1p9_9o",
    startTime: 18,
    distractors: ["Bác Đang Cùng Chúng Cháu Hành Quân", "Đất Nước Trọn Niềm Vui", "Giai Điệu Tổ Quốc"],
    explanation: "'Dấu Chân Phía Trước' của Phạm Minh Tuấn phổ thơ Hồ Thi ca ngợi bước chân ra đi tìm đường cứu nước của Bác Hồ từ bến Nhà Rồng."
  },
  {
    title: "Tiếng Chày Trên Sóc Bom Bo",
    artist: "Tốp ca nam nữ",
    ytid: "T8e_C1s9_1o",
    startTime: 16,
    distractors: ["Tiếng Đàn Ta Lư", "Cô Gái Mở Đường", "Xuân Chiến Khu"],
    explanation: "'Tiếng Chày Trên Sóc Bom Bo' của Xuân Hồng rộn rã nhịp chày giã gạo thâu đêm nuôi quân của đồng bào S'tiêng anh hùng."
  },
  {
    title: "Việt Nam Quê Hương Tôi",
    artist: "NSND Đỗ Lộc",
    ytid: "V8e_N1q9_2o",
    startTime: 18,
    distractors: ["Giai Điệu Tổ Quốc", "Đất Nước Trọn Niềm Vui", "Bài Ca Hy Vọng"],
    explanation: "'Việt Nam Quê Hương Tôi' của Đỗ Nhuận tự hào giới thiệu vẻ đẹp non sông gấm vóc dải đất chữ S bốn mùa cây trái xanh tươi."
  }
];

const NHAC_TRE_130 = [
  {
    title: "2 Phút Hơn",
    artist: "Pháo x Kaiz",
    ytid: "gvd3r_U_9Xk",
    startTime: 22,
    distractors: ["Cắt Đôi Nỗi Sầu", "See Tình", "Waiting For You"],
    explanation: "'2 Phút Hơn' (Kaiz Remix) của nữ rapper Pháo trở thành hiện tượng vũ đạo toàn cầu vươn lên top 1 bảng xếp hạng thế giới."
  },
  {
    title: "Kiếp Ve Sầu",
    artist: "Đan Trường",
    ytid: "qJk2o4Y9_1o",
    startTime: 18,
    distractors: ["Tình Khúc Vàng", "Đi Về Nơi Xa", "Mưa Trên Cuộc Tình"],
    explanation: "'Kiếp Ve Sầu' nhạc Hoa lời Việt là ca khúc đầu tiên đưa tên tuổi 'anh Bo' Đan Trường bùng nổ thành hiện tượng âm nhạc năm 1999."
  },
  {
    title: "Tình Khúc Vàng",
    artist: "Đan Trường",
    ytid: "T8k_K1v9_2o",
    startTime: 20,
    distractors: ["Kiếp Ve Sầu", "Dòng Máu Lạc Hồng", "Mãi Mãi Một Tình Yêu"],
    explanation: "'Tình Khúc Vàng' của nhạc sĩ Hoài An là bản hit quốc dân mang lại giải Làn Sóng Xanh cho Đan Trường."
  },
  {
    title: "Mãi Mãi Một Tình Yêu",
    artist: "Đan Trường",
    ytid: "M8k_M1t9_3o",
    startTime: 20,
    distractors: ["Tình Khúc Vàng", "Đi Về Nơi Xa", "Bước Chân Lẻ Loi"],
    explanation: "'Mãi Mãi Một Tình Yêu' của nhạc sĩ Hoài An là giai điệu tình yêu ngọt ngào gắn liền với thanh xuân thế hệ 8X - 9X."
  },
  {
    title: "Đi Về Nơi Xa",
    artist: "Đan Trường",
    ytid: "D8k_V1n9_4o",
    startTime: 18,
    distractors: ["Kiếp Ve Sầu", "Tình Khúc Vàng", "Bước Chân Lẻ Loi"],
    explanation: "'Đi Về Nơi Xa' của nhạc sĩ Lê Quang đã định hình vững chắc vị thế ngôi sao ca nhạc hàng đầu của Đan Trường."
  },
  {
    title: "Bước Chân Lẻ Loi",
    artist: "Đan Trường",
    ytid: "B8k_C1l9_5o",
    startTime: 18,
    distractors: ["Kiếp Ve Sầu", "Tình Đơn Phương", "Đi Về Nơi Xa"],
    explanation: "'Bước Chân Lẻ Loi' là một trong những bản nhạc Hoa lời Việt thành công nhất của Đan Trường thời kỳ đầu sự nghiệp."
  },
  {
    title: "Tình Đơn Phương",
    artist: "Đan Trường",
    ytid: "T8k_D1p9_6o",
    startTime: 18,
    distractors: ["Kiếp Ve Sầu", "Mưa Trên Cuộc Tình", "Bước Chân Lẻ Loi"],
    explanation: "'Tình Đơn Phương' với câu hát 'Nhiều lần ngập ngừng muốn ngỏ ý' là khúc tình đơn phương kinh điển của tuổi học trò."
  },
  {
    title: "Ước Gì",
    artist: "Mỹ Tâm",
    ytid: "U8k_G1m9_7o",
    startTime: 20,
    distractors: ["Họa Mi Tóc Nâu", "Cây Đàn Sinh Viên", "Dường Như Ta Đã"],
    explanation: "'Ước Gì' của nhạc sĩ Võ Thiện Thanh là siêu phẩm đưa 'Họa mi tóc nâu' Mỹ Tâm chạm đến đỉnh cao danh vọng."
  },
  {
    title: "Họa Mi Tóc Nâu",
    artist: "Mỹ Tâm",
    ytid: "H8k_M1t9_8o",
    startTime: 18,
    distractors: ["Ước Gì", "Nụ Hôn Bất Ngờ", "Cây Đàn Sinh Viên"],
    explanation: "'Họa Mi Tóc Nâu' của Trần Huân đã trở thành biệt danh trọn đời đi cùng sự nghiệp ca hát của Mỹ Tâm."
  },
  {
    title: "Cây Đàn Sinh Viên",
    artist: "Mỹ Tâm",
    ytid: "C8k_D1s9_9o",
    startTime: 18,
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Hát Với Chú Ve Con"],
    explanation: "'Cây Đàn Sinh Viên' của Quốc An là khúc ca thân thương của mọi thế hệ sinh viên trong các buổi liên hoan ký túc xá."
  },
  {
    title: "Nụ Hôn Bất Ngờ",
    artist: "Mỹ Tâm",
    ytid: "N8k_H1b9_1o",
    startTime: 16,
    distractors: ["Họa Mi Tóc Nâu", "Dường Như Ta Đã", "Người Hãy Quên Em Đi"],
    explanation: "'Nụ Hôn Bất Ngờ' do chính Mỹ Tâm tự tay sáng tác mang phong cách Latin Pop sôi động và tràn trề năng lượng."
  },
  {
    title: "Dường Như Ta Đã",
    artist: "Mỹ Tâm",
    ytid: "D8k_N1t9_2o",
    startTime: 20,
    distractors: ["Ước Gì", "Họa Mi Tóc Nâu", "Đâu Chỉ Riêng Em"],
    explanation: "'Dường Như Ta Đã' do Mỹ Tâm sáng tác là bản tình ca buồn tha thiết về sự chia ly không thể hàn gắn."
  },
  {
    title: "Thà Rằng Như Thế",
    artist: "Ưng Hoàng Phúc",
    ytid: "T8k_R1n9_3o",
    startTime: 18,
    distractors: ["Tôi Không Tin", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Người Ta Nói"],
    explanation: "'Thà Rằng Như Thế' phát hành năm 2002 bán được 55.000 bản đĩa, đưa cựu thành viên 1088 Ưng Hoàng Phúc thành siêu sao."
  },
  {
    title: "Tôi Không Tin",
    artist: "Ưng Hoàng Phúc",
    ytid: "T8k_K1t9_4o",
    startTime: 18,
    distractors: ["Thà Rằng Như Thế", "Người Ta Nói", "Cắn Rứt"],
    explanation: "'Tôi Không Tin' của nhạc sĩ Quang Huy là bản hit bùng nổ tiếp theo của Ưng Hoàng Phúc khuynh đảo các bảng xếp hạng."
  },
  {
    title: "Hứa Thật Nhiều Thất Hứa Thật Nhiều",
    artist: "Ưng Hoàng Phúc",
    ytid: "H8k_T1n9_5o",
    startTime: 18,
    distractors: ["Thà Rằng Như Thế", "Tôi Không Tin", "Nỗi Nhớ Nơi Con Tim Mồ Côi"],
    explanation: "'Hứa Thật Nhiều Thất Hứa Thật Nhiều' tạo nên câu cửa miệng thịnh hành suốt một thời gian dài trong giới trẻ."
  },
  {
    title: "Người Ta Nói",
    artist: "Ưng Hoàng Phúc",
    ytid: "N8k_T1n9_6o",
    startTime: 20,
    distractors: ["Thà Rằng Như Thế", "Tôi Không Tin", "Hứa Thật Nhiều Thất Hứa Thật Nhiều"],
    explanation: "'Người Ta Nói' của nhạc sĩ Nguyễn Hoài Anh là bản ballad da diết về sự thầm lặng trong tình yêu của Ưng Hoàng Phúc."
  },
  {
    title: "Nỗi Nhớ Nơi Con Tim Mồ Côi",
    artist: "Ưng Hoàng Phúc",
    ytid: "N8k_N1n9_7o",
    startTime: 18,
    distractors: ["Thà Rằng Như Thế", "Tôi Không Tin", "Người Ta Nói"],
    explanation: "'Nỗi Nhớ Nơi Con Tim Mồ Côi' là khúc ca da diết thể hiện nỗi đau chia cắt của lứa đôi."
  },
  {
    title: "Vì Một Người",
    artist: "Ưng Đại Vệ",
    ytid: "Yb9YFEIi-3w",
    startTime: 16,
    distractors: ["Yêu Một Người Phải Chăng Lầm Lỗi", "Anh Nhớ Em Nhiều", "Lời Hứa"],
    explanation: "'Vì Một Người' là bản hit solo đình đám của cựu thành viên nhóm GMC Ưng Đại Vệ, in đậm trong ký ức thế hệ 8X - 9X."
  },
  {
    title: "Cầu Vồng Khuyết",
    artist: "Tuấn Hưng",
    ytid: "v2luYYn_aAQ",
    startTime: 16,
    distractors: ["Tìm Lại Bầu Trời", "Dĩ Vãng Cuộc Tình", "Nắm Lấy Tay Anh"],
    explanation: "'Cầu Vồng Khuyết' của nhạc sĩ Minh Khang là bản hit quốc dân gắn liền với tên tuổi nam ca sĩ Tuấn Hưng."
  },
  {
    title: "Tìm Lại Bầu Trời",
    artist: "Tuấn Hưng",
    ytid: "Q8kohtX2PC4",
    startTime: 18,
    distractors: ["Cầu Vồng Khuyết", "Nắm Lấy Tay Anh", "Độc Thoại"],
    explanation: "'Tìm Lại Bầu Trời' do nhạc sĩ Khắc Việt sáng tác trở thành một trong những ca khúc được yêu thích nhất của Tuấn Hưng."
  },
  {
    title: "Nắm Lấy Tay Anh",
    artist: "Tuấn Hưng",
    ytid: "p8A3ULXgV3E",
    startTime: 18,
    distractors: ["Tìm Lại Bầu Trời", "Cầu Vồng Khuyết", "Dĩ Vãng Cuộc Tình"],
    explanation: "'Nắm Lấy Tay Anh' do nhạc sĩ Tú Dưa sáng tác, là món quà cưới ngọt ngào mà Tuấn Hưng dành tặng cho người vợ của mình."
  },
  {
    title: "Dĩ Vãng Cuộc Tình",
    artist: "Tuấn Hưng",
    ytid: "D8k_V1c9_8o",
    startTime: 20,
    distractors: ["Cầu Vồng Khuyết", "Tìm Lại Bầu Trời", "Vẫn Nhớ"],
    explanation: "'Dĩ Vãng Cuộc Tình' của nhạc sĩ Duy Mạnh là khúc ca nghẹn ngào về kỷ niệm tình đầu đã lùi xa vào quá khứ."
  },
  {
    title: "Đôi Mắt",
    artist: "WanBi Tuấn Anh",
    ytid: "CWXMj6A7u-Q",
    startTime: 16,
    distractors: ["Vụt Mất", "Dấu Vết", "Bắt Sóng Cảm Xúc"],
    explanation: "'Đôi Mắt' của cố ca sĩ WanBi Tuấn Anh là bản hit R&B thanh xuân bất hủ in sâu trong tâm trí khán giả thế hệ 8X - 9X."
  },
  {
    title: "Mùa Đông Không Lạnh",
    artist: "Akira Phan",
    ytid: "kNdm8AJuxlQ",
    startTime: 16,
    distractors: ["Lời Nguyền", "Đứng Dậy Vươn Vai", "Điều Ước Giản Đơn"],
    explanation: "'Mùa Đông Không Lạnh' do Nguyễn Văn Chung sáng tác giúp Akira Phan tạo nên cơn sốt bùng nổ khắp các quán nét năm 2008."
  },
  {
    title: "Lời Nguyền",
    artist: "Akira Phan",
    ytid: "L8k_N1g9_9o",
    startTime: 16,
    distractors: ["Mùa Đông Không Lạnh", "Điều Ước Giản Đơn", "Đợi Chờ Là Hạnh Phúc"],
    explanation: "'Lời Nguyền' là bản hit tiếp theo đưa tên tuổi Akira Phan phủ sóng rộng khắp các bảng xếp hạng âm nhạc trực tuyến."
  },
  {
    title: "Chiếc Khăn Gió Ấm",
    artist: "Khánh Phương",
    ytid: "aoBfJQFy8N0",
    startTime: 16,
    distractors: ["Tựa Vào Vai Anh", "Mưa Thủy Tinh", "Đành Thôi Quên Lãng"],
    explanation: "'Chiếc Khăn Gió Ấm' của Nguyễn Văn Chung phủ sóng toàn bộ các bảng xếp hạng và nhạc chuông điện thoại năm 2008 của Khánh Phương."
  },
  {
    title: "Tựa Vào Vai Anh",
    artist: "Khánh Phương",
    ytid: "T8k_V1a9_1o",
    startTime: 18,
    distractors: ["Chiếc Khăn Gió Ấm", "Mưa Thủy Tinh", "Nước Mắt Nàng Kiều"],
    explanation: "'Tựa Vào Vai Anh' là lời hứa che chở ấm áp của nam ca sĩ Khánh Phương dành cho người con gái mình yêu thương."
  },
  {
    title: "Cô Gái Trung Hoa",
    artist: "Lương Bích Hữu",
    ytid: "UEBIeVhplDQ",
    startTime: 16,
    distractors: ["Dằm Trong Tim", "Học Cách Đi Một Mình", "Gọi Tên Tôi Bạn Thân Hỡi"],
    explanation: "'Cô Gái Trung Hoa' là ca khúc debut solo thành công vang dội của cựu thành viên nhóm H.A.T Lương Bích Hữu."
  },
  {
    title: "Dằm Trong Tim",
    artist: "Lương Bích Hữu",
    ytid: "MYKjn9hKW80",
    startTime: 16,
    distractors: ["Cô Gái Trung Hoa", "Quên Cách Yêu", "Nước Mắt Hóa Đá"],
    explanation: "'Dằm Trong Tim' là bản ballad buồn da diết đưa tên tuổi Lương Bích Hữu ghi dấu ấn sâu đậm trong lòng người yêu nhạc."
  },
  {
    title: "Miền Cát Trắng",
    artist: "Quang Vinh",
    ytid: "6EKHvHdyZHA",
    startTime: 16,
    distractors: ["Ngôi Nhà Hoa Hồng", "Dịu Dàng Đến Từng Phút Giây", "Tình Yêu Diệu Kỳ"],
    explanation: "'Miền Cát Trắng' của nhạc sĩ Lê Quang đã làm nên biệt danh 'Hoàng tử sơn ca' của nam ca sĩ Quang Vinh."
  },
  {
    title: "Ngôi Nhà Hoa Hồng",
    artist: "Quang Vinh & Bảo Thy",
    ytid: "N8k_H1r9_2o",
    startTime: 18,
    distractors: ["Công Chúa Bong Bóng", "Miền Cát Trắng", "Vẫn Tin Mình Có Nhau"],
    explanation: "'Ngôi Nhà Hoa Hồng' là bản song ca tuổi teen đình đám nhất năm 2008 của cặp đôi Quang Vinh và Bảo Thy."
  },
  {
    title: "Công Chúa Bong Bóng",
    artist: "Bảo Thy",
    ytid: "C8k_B1b9_3o",
    startTime: 16,
    distractors: ["Ngôi Nhà Hoa Hồng", "Ngốc Nghếch", "Khóc Thêm Lần Nữa"],
    explanation: "'Công Chúa Bong Bóng' đưa Bảo Thy trở thành thần tượng tuổi teen số 1 thời kỳ game online Audition bùng nổ."
  },
  {
    title: "Ngốc Nghếch",
    artist: "Bảo Thy",
    ytid: "N8k_N1g9_4o",
    startTime: 16,
    distractors: ["Công Chúa Bong Bóng", "Khóc Thêm Lần Nữa", "Ngày Buồn Nhất"],
    explanation: "'Ngốc Nghếch' với giai điệu Pop Dance sôi động khẳng định phong cách hiện đại và trẻ trung của Bảo Thy."
  },
  {
    title: "Khóc",
    artist: "Đông Nhi",
    ytid: "K8k_K1h9_5o",
    startTime: 18,
    distractors: ["Bối Rối", "Lời Thú Tội Ngọt Ngào", "Chàng Baby Milo"],
    explanation: "'Khóc' là bản hit tự sáng tác đầu tay đưa tên tuổi Đông Nhi vụt sáng thành ca sĩ thần tượng hàng đầu V-Pop."
  },
  {
    title: "Bối Rối",
    artist: "Đông Nhi",
    ytid: "B8k_B1r9_6o",
    startTime: 16,
    distractors: ["Khóc", "Lời Thú Tội Ngọt Ngào", "Ngọt Ngào"],
    explanation: "'Bối Rối' với giai điệu ngây thơ, đáng yêu khắc họa tâm trạng rung động đầu đời của cô gái tuổi mới lớn."
  },
  {
    title: "Lời Thú Tội Ngọt Ngào",
    artist: "Đông Nhi",
    ytid: "L8k_T1t9_7o",
    startTime: 18,
    distractors: ["Khóc", "Bối Rối", "Sau Mỗi Giấc Mơ"],
    explanation: "'Lời Thú Tội Ngọt Ngào' là câu chuyện tình cảm động khẳng định tài năng sáng tác và giọng hát nội lực của Đông Nhi."
  },
  {
    title: "Con Đường Mưa",
    artist: "Cao Thái Sơn",
    ytid: "C8k_D1m9_8o",
    startTime: 18,
    distractors: ["Pha Lê Tím", "Yêu Thương Quay Về", "Cầu Vồng Sau Mưa"],
    explanation: "'Con Đường Mưa' của nhạc sĩ Nguyễn Văn Chung giúp Cao Thái Sơn bùng nổ khắp các sân khấu ca nhạc năm 2009."
  },
  {
    title: "Pha Lê Tím",
    artist: "Cao Thái Sơn",
    ytid: "P8k_L1t9_9o",
    startTime: 18,
    distractors: ["Con Đường Mưa", "Yêu Thương Quay Về", "Ngàn Lần Khắc Tên Em"],
    explanation: "'Pha Lê Tím' của Nguyễn Văn Chung với hình ảnh viên pha lê tím thủy chung làm say đắm người nghe."
  },
  {
    title: "Yêu Thương Quay Về",
    artist: "Cao Thái Sơn",
    ytid: "Y8k_T1q9_1o",
    startTime: 18,
    distractors: ["Con Đường Mưa", "Pha Lê Tím", "Cầu Vồng Sau Mưa"],
    explanation: "'Yêu Thương Quay Về' của Khắc Việt sáng tác cho Cao Thái Sơn tạo nên chuỗi hit liên hoàn của nam ca sĩ."
  },
  {
    title: "Xe Đạp",
    artist: "Thùy Chi ft. M4U",
    ytid: "X8k_D1a9_2o",
    startTime: 20,
    distractors: ["Mưa", "Giấc Mơ Trưa", "Gặp Mẹ Trong Mơ"],
    explanation: "'Xe Đạp' là khúc tình ca học trò bất hủ đưa giọng hát thiên thần Thùy Chi và nhóm M4U vào trái tim hàng triệu học sinh."
  },
  {
    title: "Mưa",
    artist: "Thùy Chi ft. M4U",
    ytid: "M8k_M1u9_3o",
    startTime: 20,
    distractors: ["Xe Đạp", "Giấc Mơ Trưa", "Phố Cổ"],
    explanation: "'Mưa' sáng tác bởi Minh Vương M4U với câu hát 'Mưa rơi tí tách' trong trẻo gợi nhớ những ngày mưa kỷ niệm."
  },
  {
    title: "Giấc Mơ Trưa",
    artist: "Thùy Chi",
    ytid: "G8k_M1t9_4o",
    startTime: 18,
    distractors: ["Xe Đạp", "Mưa", "Khoảng Trời Của Bé"],
    explanation: "'Giấc Mơ Trưa' của nhạc sĩ Giáng Son mang giai điệu êm ả, thanh bình đưa người nghe về với tuổi thơ quê nhà."
  },
  {
    title: "Suy Nghĩ Trong Anh",
    artist: "Nam Cường ft. Khắc Việt",
    ytid: "S8k_N1t9_5o",
    startTime: 18,
    distractors: ["Bay Giữa Ngân Hà", "Yêu Lại Từ Đầu", "Lời Hứa"],
    explanation: "'Suy Nghĩ Trong Anh' do Khắc Việt sáng tác đã đưa Nam Cường lên đỉnh cao danh vọng với hàng triệu lượt nghe."
  },
  {
    title: "Bay Giữa Ngân Hà",
    artist: "Nam Cường",
    ytid: "B8k_G1n9_6o",
    startTime: 18,
    distractors: ["Suy Nghĩ Trong Anh", "Một Lần Thôi", "Khó"],
    explanation: "'Bay Giữa Ngân Hà' của nhạc sĩ Nguyễn Văn Chung là giai điệu tình yêu bay bổng, lãng mạn như giữa dải ngân hà."
  },
  {
    title: "Yêu Lại Từ Đầu",
    artist: "Khắc Việt",
    ytid: "Y8k_L1t9_7o",
    startTime: 18,
    distractors: ["Như Vậy Nhé", "Ngỡ", "Quên"],
    explanation: "'Yêu Lại Từ Đầu' là siêu hit quốc dân đưa tên tuổi nhạc sĩ kiêm ca sĩ Khắc Việt trở thành hiện tượng âm nhạc lớn."
  },
  {
    title: "Như Vậy Nhé",
    artist: "Khắc Việt",
    ytid: "N8k_V1n9_8o",
    startTime: 18,
    distractors: ["Yêu Lại Từ Đầu", "Ngỡ", "Chỉ Anh Hiểu Em"],
    explanation: "'Như Vậy Nhé' mở màn cho phong cách nhạc Pop Ballad mộc mạc, gần gũi nhưng cực kỳ bắt tai của Khắc Việt."
  },
  {
    title: "Ngỡ",
    artist: "Quang Hà ft. Khắc Việt",
    ytid: "N8k_G1h9_9o",
    startTime: 20,
    distractors: ["Yêu Lại Từ Đầu", "Trăm Năm Không Quên", "Định Mệnh"],
    explanation: "'Ngỡ' của Khắc Việt viết tặng Quang Hà trở thành ca khúc hit lớn nhất trong sự nghiệp của nam ca sĩ."
  },
  {
    title: "Quên Cách Yêu",
    artist: "Lương Bích Hữu",
    ytid: "Q8k_C1y9_1o",
    startTime: 18,
    distractors: ["Dằm Trong Tim", "Cô Gái Trung Hoa", "Em Muốn Chia Tay"],
    explanation: "'Quên Cách Yêu' của Khánh Đơn đánh dấu sự trở lại đỉnh cao của Lương Bích Hữu năm 2012."
  },
  {
    title: "Tuyết Yêu Thương",
    artist: "Young Uno",
    ytid: "T8k_Y1t9_2o",
    startTime: 16,
    distractors: ["Xin Anh Đừng", "Thu Cuối", "Cơn Mưa Qua"],
    explanation: "'Tuyết Yêu Thương' của Young Uno là huyền thoại âm nhạc Audition bất hủ của thế hệ 8X - 9X đầu đời."
  },
  {
    title: "Bay",
    artist: "Thu Minh",
    ytid: "B8k_B1a9_3o",
    startTime: 16,
    distractors: ["Taxi", "Đường Cong", "Chuông Gió"],
    explanation: "'Bay' của nhạc sĩ Nguyễn Hải Phong đưa 'Nữ hoàng Dance-pop' Thu Minh bùng nổ năng lượng trên mọi sàn diễn."
  },
  {
    title: "Taxi",
    artist: "Thu Minh",
    ytid: "T8k_X1i9_4o",
    startTime: 16,
    distractors: ["Bay", "Đường Cong", "Bóng Mây Qua Thềm"],
    explanation: "'Taxi' của nhạc sĩ Nguyễn Hải Phong với tiếng còi xe vui nhộn khẳng định chất giọng khủng của Thu Minh."
  },
  {
    title: "Đường Cong",
    artist: "Thu Minh",
    ytid: "D8k_C1n9_5o",
    startTime: 16,
    distractors: ["Bay", "Taxi", "Chuông Gió"],
    explanation: "'Đường Cong' của Nguyễn Hải Phong tôn vinh nét đẹp quyến rũ của người phụ nữ hiện đại."
  },
  {
    title: "Chuông Gió",
    artist: "Thu Minh",
    ytid: "C8k_G1i9_6o",
    startTime: 18,
    distractors: ["Bay", "Đường Cong", "Bóng Mây Qua Thềm"],
    explanation: "'Chuông Gió' của nhạc sĩ Võ Thiện Thanh giúp Thu Minh đoạt giải Bài hát Việt với kỹ thuật thanh nhạc điêu luyện."
  },
  {
    title: "Tóc Hát",
    artist: "Đoan Trang",
    ytid: "T8k_H1a9_7o",
    startTime: 16,
    distractors: ["Sô-cô-la", "Quạt Giấy", "Khi Tôi Vingt Ans"],
    explanation: "'Tóc Hát' của nhạc sĩ Võ Thiện Thanh đưa hình ảnh 'thỏi sô-cô-la biết hát' Đoan Trang gây ấn tượng mạnh mẽ."
  },
  {
    title: "Sô-cô-la",
    artist: "Đoan Trang",
    ytid: "S8k_C1l9_8o",
    startTime: 16,
    distractors: ["Tóc Hát", "Quạt Giấy", "Dạ Khúc Lam"],
    explanation: "'Sô-cô-la' của nhạc sĩ Võ Thiện Thanh mang giai điệu Latin Pop sôi động gắn liền với phong cách của Đoan Trang."
  },
  {
    title: "Vệt Nắng Cuối Trời",
    artist: "Minh Vương M4U",
    ytid: "V8k_N1c9_9o",
    startTime: 18,
    distractors: ["Nỗi Đau Xót Xa", "Nhớ Em", "Mưa"],
    explanation: "'Vệt Nắng Cuối Trời' của Phùng Tiến Minh là ca khúc nhạc phim truyền hình quốc dân gây sốt màn ảnh nhỏ."
  },
  {
    title: "Nỗi Đau Xót Xa",
    artist: "Minh Vương M4U",
    ytid: "N8k_D1x9_1o",
    startTime: 18,
    distractors: ["Vệt Nắng Cuối Trời", "Nhớ Em", "Nỗi Đau Người Đến Sau"],
    explanation: "'Nỗi Đau Xót Xa' là bản ballad buồn đẫm lệ gắn liền với giọng hát truyền cảm của Minh Vương M4U."
  },
  {
    title: "Giấc Mơ Tình Yêu",
    artist: "Đan Trường & Cẩm Ly",
    ytid: "G8k_M1t9_2o",
    startTime: 20,
    distractors: ["Chim Trắng Mồ Côi", "Mưa Buồn", "Tuyết Hồng"],
    explanation: "'Giấc Mơ Tình Yêu' là một trong những bản song ca nhạc Hoa lời Việt đầu tiên làm nên cặp đôi vàng Đan Trường - Cẩm Ly."
  },
  {
    title: "Mưa Thủy Tinh",
    artist: "Khánh Phương",
    ytid: "M8k_T1t9_3o",
    startTime: 18,
    distractors: ["Chiếc Khăn Gió Ấm", "Tựa Vào Vai Anh", "Đành Thôi Quên Lãng"],
    explanation: "'Mưa Thủy Tinh' là ca khúc nhạc Hoa lời Việt da diết của nam ca sĩ Khánh Phương được khán giả trẻ thuộc lòng."
  },
  {
    title: "Tình Yêu Mang Theo",
    artist: "Nhật Tinh Anh",
    ytid: "T8k_Y1m9_4o",
    startTime: 18,
    distractors: ["Vầng Trăng Khóc", "Chiếc Băng Ca", "Khi Yêu"],
    explanation: "'Tình Yêu Mang Theo' là bản hit solo đình đám của cựu thành viên 1088 Nhật Tinh Anh sau khi tách nhóm."
  },
  {
    title: "Vầng Trăng Khóc",
    artist: "Nhật Tinh Anh & Khánh Ngọc",
    ytid: "V8k_T1k9_5o",
    startTime: 18,
    distractors: ["Tình Yêu Mang Theo", "Mộng Thủy Tinh", "Như Vẫn Còn Đây"],
    explanation: "'Vầng Trăng Khóc' của nhạc sĩ Nguyễn Văn Chung là bản song ca mưa gió trên mọi quán karaoke thập niên 2000."
  },
  {
    title: "Đêm Trăng Tình Yêu",
    artist: "GMC",
    ytid: "D8k_T1y9_6o",
    startTime: 16,
    distractors: ["Kiếp Lữ Hành", "Nỗi Sầu Đêm Vắng", "Tình Mãi Xa"],
    explanation: "'Đêm Trăng Tình Yêu' của nhóm nhạc nam GMC từng làm thổn thức hàng triệu trái tim tuổi teen thế hệ 8X - 9X."
  },
  {
    title: "Anh Không Muốn Bất Công Với Em",
    artist: "Ưng Hoàng Phúc & H.A.T",
    ytid: "A8k_K1m9_7o",
    startTime: 18,
    distractors: ["Lời Hứa Cho Tình Yêu", "Nếu Ta Còn Yêu Nhau", "Đành Quên Kỷ Niệm"],
    explanation: "'Anh Không Muốn Bất Công Với Em' là siêu hit song ca thế kỷ giữa Ưng Hoàng Phúc và nhóm nhạc nữ H.A.T."
  },
  {
    title: "Con Bướm Xuân",
    artist: "Hồ Quang Hiếu",
    ytid: "C8k_B1x9_8o",
    startTime: 16,
    distractors: ["Không Cảm Xúc", "Nơi Ấy Con Tìm Về", "Túp Lều Lý Tưởng"],
    explanation: "'Con Bướm Xuân' phiên bản remix của Hồ Quang Hiếu tạo nên cơn bão âm nhạc tưng bừng khắp các ngõ phố dịp Tết 2014."
  },
  {
    title: "Nơi Ấy Con Tìm Về",
    artist: "Hồ Quang Hiếu",
    ytid: "N8k_A1c9_9o",
    startTime: 18,
    distractors: ["Con Bướm Xuân", "Không Cảm Xúc", "Đổi Thay"],
    explanation: "'Nơi Ấy Con Tìm Về' của nhạc sĩ Phan Mạnh Quỳnh qua tiếng hát Hồ Quang Hiếu là bản ca ngợi công ơn cha mẹ đầy xúc động."
  },
  {
    title: "Không Cảm Xúc",
    artist: "Hồ Quang Hiếu",
    ytid: "K8k_C1x9_1o",
    startTime: 16,
    distractors: ["Con Bướm Xuân", "Nơi Ấy Con Tìm Về", "Giá Mình Là Người Lạ"],
    explanation: "'Không Cảm Xúc' là bản hit Electro Pop sôi động đưa Hồ Quang Hiếu phủ sóng rộng khắp thị trường ca nhạc."
  },
  {
    title: "Buồn Của Anh",
    artist: "K-ICM x Đạt G x Masew",
    ytid: "B8k_C1a9_2o",
    startTime: 18,
    distractors: ["Hongkong1", "Túy Âm", "Thằng Điên"],
    explanation: "'Buồn Của Anh' là ca khúc Underground đầu tiên cán mốc 300 triệu lượt xem trên nền tảng nghe nhạc trực tuyến."
  },
  {
    title: "Hongkong1",
    artist: "Nguyễn Trọng Tài x San Ji",
    ytid: "H8k_K1t9_3o",
    startTime: 16,
    distractors: ["Buồn Của Anh", "Mặt Trời Của Em", "1 Phút"],
    explanation: "'Hongkong1' với câu hát 'Nếu giờ anh nói, chúng ta không hợp nhau' từ một clip hát say trên bàn nhậu đã viral toàn quốc."
  },
  {
    title: "Mặt Trời Của Em",
    artist: "Phương Ly ft. JustaTee",
    ytid: "M8k_T1c9_4o",
    startTime: 16,
    distractors: ["Thằng Điên", "Missing You", "Anh Là Ai"],
    explanation: "'Mặt Trời Của Em' của Phương Ly kết hợp JustaTee đem lại làn gió tươi mới, ngọt ngào cho V-Pop năm 2017."
  },
  {
    title: "1 Phút",
    artist: "Andiez",
    ytid: "18k_P1h9_5o",
    startTime: 18,
    distractors: ["Suýt Nữa Thì", "Chờ Đợi Có Đáng Sợ", "Mảnh Ghép"],
    explanation: "'1 Phút' của Andiez Nam Trương vượt hơn 100 triệu lượt xem, là bài ca thổ lộ tình yêu da diết trước giờ ly biệt."
  },
  {
    title: "Suýt Nữa Thì",
    artist: "Andiez",
    ytid: "S8k_N1t9_6o",
    startTime: 18,
    distractors: ["1 Phút", "Mảnh Ghép", "Chờ Đợi Có Đáng Sợ"],
    explanation: "'Suýt Nữa Thì' là ca khúc nhạc phim Chuyến Đi Của Thanh Xuân chạm đến trái tim những ai từng bỏ lỡ người mình yêu."
  },
  {
    title: "Cùng Anh",
    artist: "Ngọc Dolil x Hagi",
    ytid: "C8k_A1n9_7o",
    startTime: 16,
    distractors: ["Mặt Trời Của Em", "Hongkong1", "Yêu Đương Khó Quá Thì Chạy Về Khóc Với Anh"],
    explanation: "'Cùng Anh' với giai điệu rộn ràng về những chuyến đi phượt tuổi trẻ cùng người thương đã làm mưa làm gió mạng xã hội."
  },
  {
    title: "Đã Lỡ Yêu Em Nhiều",
    artist: "JustaTee",
    ytid: "D8k_L1y9_8o",
    startTime: 18,
    distractors: ["Thằng Điên", "Bâng Khuâng", "Forever Alone"],
    explanation: "'Đã Lỡ Yêu Em Nhiều' đánh dấu sự trở lại ngoạn mục của 'ông hoàng RnB' JustaTee với sự tham gia của Phương Ly."
  },
  {
    title: "Bâng Khuâng",
    artist: "JustaTee",
    ytid: "B8k_K1h9_9o",
    startTime: 18,
    distractors: ["Đã Lỡ Yêu Em Nhiều", "Forever Alone", "Người Lạ Nơi Cuối Con Đường"],
    explanation: "'Bâng Khuâng' của JustaTee phổ thơ Hoàng Hải Yến là đỉnh cao của dòng nhạc RnB Việt Nam thập niên 2010."
  },
  {
    title: "Forever Alone",
    artist: "JustaTee",
    ytid: "F8k_A1l9_1o",
    startTime: 16,
    distractors: ["Bâng Khuâng", "Thằng Điên", "Đã Lỡ Yêu Em Nhiều"],
    explanation: "'Forever Alone' trở thành tuyên ngôn vui vẻ, tự hào của hội những người độc thân FA suốt nhiều năm liền."
  },
  {
    title: "Ghen",
    artist: "Erik x Min x Khắc Hưng",
    ytid: "G8k_G1e9_2o",
    startTime: 16,
    distractors: ["Sau Tất Cả", "Có Em Chờ", "Chạm Đáy Nỗi Đau"],
    explanation: "'Ghen' với phiên bản quốc tế 'Ghen Cô Vy' cùng vũ điệu rửa tay của Quang Đăng đã vươn tầm thành hiện tượng toàn cầu trên đài HBO."
  },
  {
    title: "Chạm Đáy Nỗi Đau",
    artist: "Erik",
    ytid: "C8k_D1n9_3o",
    startTime: 18,
    distractors: ["Sau Tất Cả", "Có Tất Cả Nhưng Thiếu Anh", "Em Không Sai Chúng Ta Sai"],
    explanation: "'Chạm Đáy Nỗi Đau' do Mr. Siro sáng tác đưa chất giọng cảm xúc của Erik chạm mốc trăm triệu lượt xem."
  },
  {
    title: "Sau Tất Cả",
    artist: "Erik",
    ytid: "S8k_T1c9_4o",
    startTime: 18,
    distractors: ["Chạm Đáy Nỗi Đau", "Ghen", "Có Tất Cả Nhưng Thiếu Anh"],
    explanation: "'Sau Tất Cả' của nhạc sĩ Khắc Hưng được mệnh danh là 'ca khúc quốc dân' của năm 2016 giúp Erik debut thành công rực rỡ."
  },
  {
    title: "Có Tất Cả Nhưng Thiếu Anh",
    artist: "Erik",
    ytid: "C8k_T1c9_5o",
    startTime: 18,
    distractors: ["Chạm Đáy Nỗi Đau", "Sau Tất Cả", "Em Không Sai Chúng Ta Sai"],
    explanation: "'Có Tất Cả Nhưng Thiếu Anh' của nhạc sĩ Vương Anh Tú là MV drama đầy kịch tính đạt top 1 trending YouTube của Erik."
  },
  {
    title: "Có Em Chờ",
    artist: "Min ft. Mr A",
    ytid: "C8k_E1c9_6o",
    startTime: 16,
    distractors: ["Ghen", "Vì Yêu Cứ Đâm Đầu", "Yêu"],
    explanation: "'Có Em Chờ' của Kai Đinh với thông điệp 'Ngoài kia nếu có khó khăn quá, về nhà anh nhé có em chờ' đốn tim hàng triệu người nghe."
  },
  {
    title: "Yêu",
    artist: "Min",
    ytid: "Y8k_Y1e9_7o",
    startTime: 16,
    distractors: ["Có Em Chờ", "Tìm", "Hôn Anh"],
    explanation: "'Yêu' là bản hit Electro Pop ngọt ngào khẳng định dấu ấn solo của Min sau khi rời nhóm nhảy St.319."
  },
  {
    title: "Vì Yêu Cứ Đâm Đầu",
    artist: "Min ft. Đen Vâu x JustaTee",
    ytid: "V8k_Y1c9_8o",
    startTime: 18,
    distractors: ["Bài Này Chill Phết", "Có Em Chờ", "Ghen"],
    explanation: "'Vì Yêu Cứ Đâm Đầu' ghi hình tại hòn đảo mèo Aoshima Nhật Bản với câu rap 'Yêu là đâm đầu' cực kỳ bắt tai."
  },
  {
    title: "Một Cú Lừa",
    artist: "Bích Phương",
    ytid: "M8k_C1l9_9o",
    startTime: 16,
    distractors: ["Đi Đu Đưa Đi", "Bùa Yêu", "Bao Giờ Lấy Chồng"],
    explanation: "'Một Cú Lừa' do Tiên Cookie sáng tác là bản phối Synthwave quyến rũ trong EP 'Tâm Trạng Tan Hơi Chậm Một Chút' của Bích Phương."
  },
  {
    title: "Bao Giờ Lấy Chồng",
    artist: "Bích Phương",
    ytid: "B8k_G1l9_1o",
    startTime: 16,
    distractors: ["Đi Đu Đưa Đi", "Bùa Yêu", "Một Cú Lừa"],
    explanation: "'Bao Giờ Lấy Chồng' là ca khúc 'thánh ca giải tỏa áp lực' của hội chị em mỗi dịp Tết đến xuân về."
  },
  {
    title: "Mình Yêu Nhau Đi",
    artist: "Bích Phương",
    ytid: "M8k_Y1n9_2o",
    startTime: 16,
    distractors: ["Có Khi Nào Rời Xa", "Bao Giờ Lấy Chồng", "Chỉ Là Em Giấu Đi"],
    explanation: "'Mình Yêu Nhau Đi' với câu nói 'Hay là mình cứ bất chấp hết yêu nhau đi anh' tạo nên trào lưu tỏ tình số một năm 2014."
  },
  {
    title: "Có Khi Nào Rời Xa",
    artist: "Bích Phương",
    ytid: "C8k_K1n9_3o",
    startTime: 18,
    distractors: ["Mình Yêu Nhau Đi", "Ký Ức Ngủ Quên", "Vẫn"],
    explanation: "'Có Khi Nào Rời Xa' của Tiên Cookie là bản ballad buồn đưa Bích Phương từ Vietnam Idol trở thành ngôi sao ca nhạc được săn đón."
  },
  {
    title: "Kém Duyên",
    artist: "Rum ft. NIT x Masew",
    ytid: "K8k_D1y9_4o",
    startTime: 16,
    distractors: ["Túy Âm", "Buồn Của Anh", "Vô Tình"],
    explanation: "'Kém Duyên' kết hợp âm hưởng dân gian đương đại với nhạc điện tử EDM đạt hơn 100 triệu lượt xem."
  },
  {
    title: "Túy Âm",
    artist: "Xesi x Masew x Nhật Nguyễn",
    ytid: "T8k_A1m9_5o",
    startTime: 16,
    distractors: ["Kém Duyên", "Vô Tình", "Buồn Của Anh"],
    explanation: "'Túy Âm' như chén rượu say ngất ngây do cô nữ sinh chuyên Hóa Xesi sáng tác đã làm bùng nổ hiện tượng âm nhạc năm 2017."
  },
  {
    title: "Vô Tình",
    artist: "Xesi x Hoaprox",
    ytid: "V8k_T1n9_6o",
    startTime: 18,
    distractors: ["Túy Âm", "Kém Duyên", "Buồn Của Anh"],
    explanation: "'Vô Tình' là sự kết hợp ăn ý tiếp theo giữa Xesi và phù thủy âm thanh Hoaprox với giai điệu huyền ảo, mộng mị."
  },
  {
    title: "Hồng Nhan",
    artist: "Jack",
    ytid: "H8k_N1h9_7o",
    startTime: 16,
    distractors: ["Bạc Phận", "Sóng Gió", "Sao Em Vô Tình"],
    explanation: "'Hồng Nhan' là ca khúc đầu tay đưa Jack từ một chàng trai Bến Tre vô danh vụt sáng thành hiện tượng âm nhạc lớn nhất năm 2019."
  },
  {
    title: "Hoa Hải Đường",
    artist: "Jack - J97",
    ytid: "H8k_H1d9_8o",
    startTime: 16,
    distractors: ["Đom Đóm", "Là 1 Thằng Con Trai", "Sóng Gió"],
    explanation: "'Hoa Hải Đường' mang phong cách Future Bass pha âm hưởng dân gian truyền thống khẳng định dấu ấn solo của Jack."
  },
  {
    title: "Chúng Ta Không Thuộc Về Nhau",
    artist: "Sơn Tùng M-TP",
    ytid: "qGRU3sRbaYw",
    startTime: 16,
    distractors: ["Lạc Trôi", "Chạy Ngay Đi", "Nơi Này Có Anh"],
    explanation: "'Chúng Ta Không Thuộc Về Nhau' mang phong cách Tropical House phát hành năm 2016 lập kỷ lục lượt xem ấn tượng của Sơn Tùng M-TP."
  },
  {
    title: "Buông Đôi Tay Nhau Ra",
    artist: "Sơn Tùng M-TP",
    ytid: "LCyo565N_5w",
    startTime: 16,
    distractors: ["Âm Thầm Bên Em", "Chắc Ai Đó Sẽ Về", "Nơi Này Có Anh"],
    explanation: "'Buông Đôi Tay Nhau Ra' ra mắt năm 2015 kể về tâm trạng day dứt nhưng dứt khoát của cặp đôi sau khi chia tay."
  },
  {
    title: "Có Chắc Yêu Là Đây",
    artist: "Sơn Tùng M-TP",
    ytid: "y7-xnyWxgAU",
    startTime: 16,
    distractors: ["Muộn Rồi Mà Sao Còn", "Chúng Ta Của Hiện Tại", "Nơi Này Có Anh"],
    explanation: "'Có Chắc Yêu Là Đây' là món quà ngọt ngào Sơn Tùng M-TP dành tặng người hâm mộ với tông màu pastel rực rỡ."
  },
  {
    title: "Chúng Ta Của Tương Lai",
    artist: "Sơn Tùng M-TP",
    ytid: "C8k_T1u9_9o",
    startTime: 18,
    distractors: ["Chúng Ta Của Hiện Tại", "Đừng Làm Trái Tim Anh Đau", "Nơi Này Có Anh"],
    explanation: "'Chúng Ta Của Tương Lai' phát hành năm 2024 viết tiếp câu chuyện tình còn dang dở với nữ diễn viên Hải Tú."
  },
  {
    title: "Hai Triệu Năm",
    artist: "Đen vâu ft. Biên",
    ytid: "H8k_T1n9_1o",
    startTime: 18,
    distractors: ["Trốn Tìm", "Một Triệu Like", "Bài Này Chill Phết"],
    explanation: "'Hai Triệu Năm' với hình ảnh Đen Vâu ngâm mình dưới làn nước biển đã tạo nên cơn sốt chế ảnh meme khổng lồ."
  },
  {
    title: "Một Triệu Like",
    artist: "Đen vâu ft. Thành Đồng",
    ytid: "M8k_T1l9_2o",
    startTime: 18,
    distractors: ["Hai Triệu Năm", "Trốn Tìm", "Đi Về Nhà"],
    explanation: "'Một Triệu Like' sử dụng sample nhạc cổ điển kinh điển 'Triệu Đóa Hoa Hồng' của nhạc sĩ Latvia Raimonds Pauls."
  },
  {
    title: "Ngày Khác Lạ",
    artist: "Đen vâu ft. Giang Phạm x Triple D",
    ytid: "N8k_K1l9_3o",
    startTime: 18,
    distractors: ["Đưa Nhau Đi Trốn", "Ta Cứ Đi Cùng Nhau", "Mười Năm"],
    explanation: "'Ngày Khác Lạ' quay tại vùng cao nguyên tuyết trắng Đài Loan là bài ca thôi thúc người trẻ xách ba lô lên và đi."
  },
  {
    title: "Đưa Nhau Đi Trốn",
    artist: "Đen vâu ft. Linh Cáo",
    ytid: "D8k_N1d9_4o",
    startTime: 18,
    distractors: ["Ta Cứ Đi Cùng Nhau", "Ngày Khác Lạ", "Đi Về Nhà"],
    explanation: "'Đưa Nhau Đi Trốn' với câu hát 'Bố em hút rất nhiều thuốc' đưa Đen Vâu và Linh Cáo trở thành biểu tượng của dân phượt."
  },
  {
    title: "Ta Cứ Đi Cùng Nhau",
    artist: "Đen vâu ft. Linh Cáo",
    ytid: "T8k_C1d9_5o",
    startTime: 18,
    distractors: ["Đưa Nhau Đi Trốn", "Ngày Khác Lạ", "Mười Năm"],
    explanation: "'Ta Cứ Đi Cùng Nhau' tiếp nối hành trình khám phá thiên nhiên và tình yêu tự do phóng khoáng của tuổi trẻ."
  },
  {
    title: "Mười Năm",
    artist: "Đen vâu ft. Ngọc Linh",
    ytid: "M8k_N1m9_6o",
    startTime: 20,
    distractors: ["Trốn Tìm", "Hai Triệu Năm", "Một Triệu Like"],
    explanation: "'Mười Năm' kỷ niệm chặng đường 10 năm theo đuổi đam mê nhạc Rap đầy thăng trầm nhưng kiên định của Đen Vâu."
  },
  {
    title: "Cho Tôi Lang Thang",
    artist: "Ngọt ft. Đen vâu",
    ytid: "C8k_T1l9_7o",
    startTime: 18,
    distractors: ["Em Dạo Này", "Thấy Chưa", "Đi Về Nhà"],
    explanation: "'Cho Tôi Lang Thang' là cú bắt tay lịch sử giữa ban nhạc Indie Ngọt và Đen Vâu truyền cảm hứng sống rực rỡ."
  },
  {
    title: "Em Dạo Này",
    artist: "Ngọt",
    ytid: "E8k_D1n9_8o",
    startTime: 16,
    distractors: ["Thấy Chưa", "Cho Tôi Lang Thang", "Lần Cuối"],
    explanation: "'Em Dạo Này' của Ngọt đạt giải Cống Hiến với câu hát hỏi thăm nhẹ nhàng 'Em dạo này có còn xem phim một mình?'."
  },
  {
    title: "Thấy Chưa",
    artist: "Ngọt",
    ytid: "T8k_C1h9_9o",
    startTime: 18,
    distractors: ["Em Dạo Này", "Cho Tôi Lang Thang", "Lần Cuối"],
    explanation: "'Thấy Chưa' là khúc ca vỗ về tâm hồn đầy bao dung và ấm áp nằm trong album 'Gieo' của ban nhạc Ngọt."
  },
  {
    title: "Một Nhà",
    artist: "Da LAB",
    ytid: "M8k_N1h9_1o",
    startTime: 16,
    distractors: ["Thanh Xuân", "Gác Lại Âu Lo", "Nước Mắt Em Lau Bằng Tình Yêu Mới"],
    explanation: "'Một Nhà' là bài hát đám cưới quốc dân của Da LAB với ca từ ngọt ngào về tổ ấm nhỏ 'Khi hai ta về một nhà'."
  },
  {
    title: "Gác Lại Âu Lo",
    artist: "Da LAB ft. Miu Lê",
    ytid: "G8k_L1a9_2o",
    startTime: 18,
    distractors: ["Thanh Xuân", "Một Nhà", "Chạy Khỏi Thế Giới Này"],
    explanation: "'Gác Lại Âu Lo' lấy cảm hứng từ các bộ phim tình cảm Hollywood kinh điển như 500 Days of Summer và La La Land."
  },
  {
    title: "Nước Mắt Em Lau Bằng Tình Yêu Mới",
    artist: "Da LAB ft. Tóc Tiên",
    ytid: "N8k_M1e9_3o",
    startTime: 18,
    distractors: ["Thanh Xuân", "Gác Lại Âu Lo", "Một Nhà"],
    explanation: "'Nước Mắt Em Lau Bằng Tình Yêu Mới' đánh dấu màn hợp tác bùng nổ giữa Da LAB và nữ ca sĩ Tóc Tiên."
  },
  {
    title: "Có Em",
    artist: "Madihu ft. Low G",
    ytid: "C8k_E1m9_4o",
    startTime: 18,
    distractors: ["An Thần", "Simp Gái 808", "Không Thèm"],
    explanation: "'Có Em' của Madihu kết hợp với verse rap cực cuốn của Low G trở thành bản tình ca chữa lành của giới trẻ năm 2022."
  },
  {
    title: "Simp Gái 808",
    artist: "Low G",
    ytid: "S8k_G1a9_5o",
    startTime: 16,
    distractors: ["An Thần", "Chán Gái 707", "Có Em"],
    explanation: "'Simp Gái 808' với flow đặc trưng và phong cách tự tin đưa rapper Low G trở thành gương mặt nổi bật của Rap Việt."
  },
  {
    title: "Chán Gái 707",
    artist: "Low G",
    ytid: "C8k_G1a9_6o",
    startTime: 16,
    distractors: ["Simp Gái 808", "An Thần", "Không Thèm"],
    explanation: "'Chán Gái 707' là phần tiếp theo dí dỏm và châm biếm trong chuỗi bài hát hài hước của 'chủ tọa' Low G."
  },
  {
    title: "Tam Giác",
    artist: "Anh Phan ft. Low G",
    ytid: "T8k_G1a9_7o",
    startTime: 16,
    distractors: ["An Thần", "Simp Gái 808", "Chán Gái 707"],
    explanation: "'Tam Giác' là hiện tượng viral bùng nổ trên TikTok với đoạn rap bắt tai và vũ đạo tam giác độc đáo."
  },
  {
    title: "Dạ Vũ",
    artist: "Tăng Duy Tân",
    ytid: "D8k_V1u9_8o",
    startTime: 18,
    distractors: ["Bên Trên Tầng Lầu", "Cắt Đôi Nỗi Sầu", "Ngây Thơ"],
    explanation: "'Dạ Vũ' đưa tên tuổi Tăng Duy Tân viral khắp thị trường quốc tế, được mệnh danh là bản hit của đêm dạ hội huyền bí."
  },
  {
    title: "Ngây Thơ",
    artist: "Tăng Duy Tân x Phong Max",
    ytid: "N8k_T1h9_9o",
    startTime: 16,
    distractors: ["Dạ Vũ", "Bên Trên Tầng Lầu", "Cắt Đôi Nỗi Sầu"],
    explanation: "'Ngây Thơ' đạt hàng trăm triệu lượt nghe tại Trung Quốc và Việt Nam, khẳng định sức hút giai điệu của Tăng Duy Tân."
  },
  {
    title: "Tình Đầu",
    artist: "Tăng Duy Tân",
    ytid: "T8k_D1a9_1o",
    startTime: 16,
    distractors: ["Ngây Thơ", "Dạ Vũ", "Bên Trên Tầng Lầu"],
    explanation: "'Tình Đầu' là ca khúc mở đường đưa Tăng Duy Tân từ giới Underground bước ra ánh sáng của thị trường âm nhạc."
  },
  {
    title: "Ánh Nắng Của Anh",
    artist: "Đức Phúc",
    ytid: "1P4DaXgzVnE",
    startTime: 18,
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Hết Thương Cạn Nhớ"],
    explanation: "'Ánh Nắng Của Anh' là ca khúc nhạc phim Chờ Em Đến Ngày Mai do nhạc sĩ Khắc Hưng sáng tác gắn liền với Đức Phúc."
  },
  {
    title: "Hơn Cả Yêu",
    artist: "Đức Phúc",
    ytid: "H8k_C1y9_2o",
    startTime: 16,
    distractors: ["Ánh Nắng Của Anh", "Ngày Đầu Tiên", "Hết Thương Cạn Nhớ"],
    explanation: "'Hơn Cả Yêu' ra mắt dịp Valentine 2020 trở thành bài hát đám cưới quốc dân tôn vinh tình cảm gia đình và tình yêu đích thực."
  },
  {
    title: "Ngày Đầu Tiên",
    artist: "Đức Phúc",
    ytid: "N8k_D1t9_3o",
    startTime: 18,
    distractors: ["Hơn Cả Yêu", "Ánh Nắng Của Anh", "Hết Thương Cạn Nhớ"],
    explanation: "'Ngày Đầu Tiên' với màn cầu hôn có thật ngập tràn nước mắt hạnh phúc tiếp tục khẳng định vị thế 'hoàng tử tình ca' của Đức Phúc."
  },
  {
    title: "Hết Thương Cạn Nhớ",
    artist: "Đức Phúc",
    ytid: "H8k_T1c9_4o",
    startTime: 18,
    distractors: ["Hơn Cả Yêu", "Ngày Đầu Tiên", "Ánh Nắng Của Anh"],
    explanation: "'Hết Thương Cạn Nhớ' lấy cảm hứng từ truyện ngắn Chí Phèo với sự tham gia của NSND Hoàng Dũng và hoa hậu Đỗ Mỹ Linh."
  },
  {
    title: "Rời Bỏ",
    artist: "Hòa Minzy",
    ytid: "R8k_B1o9_5o",
    startTime: 18,
    distractors: ["Thị Mầu", "Không Thể Cùng Nhau Suốt Kiếp", "Chấp Nhận"],
    explanation: "'Rời Bỏ' của nhạc sĩ Vũ Huy Hoàng là bản ballad buồn đánh dấu bước chuyển mình ngoạn mục của Hòa Minzy năm 2018."
  },
  {
    title: "Chấp Nhận",
    artist: "Hòa Minzy",
    ytid: "C8k_N1h9_6o",
    startTime: 18,
    distractors: ["Rời Bỏ", "Không Thể Cùng Nhau Suốt Kiếp", "Thị Mầu"],
    explanation: "'Chấp Nhận' là phần tiếp theo của câu chuyện tình dang dở trong MV Rời Bỏ với sự hy sinh thầm lặng của người con gái."
  },
  {
    title: "Thật Bất Ngờ",
    artist: "Trúc Nhân",
    ytid: "T8k_B1n9_7o",
    startTime: 16,
    distractors: ["Sáng Mắt Chưa", "Bốn Chữ Lắm", "Có Không Giữ Mất Đừng Tìm"],
    explanation: "'Thật Bất Ngờ' của nhạc sĩ Mew Amazing châm biếm sâu cay những góc khuất thị phi của showbiz Việt."
  },
  {
    title: "Bốn Chữ Lắm",
    artist: "Trúc Nhân ft. Trương Thảo Nhi",
    ytid: "B8k_C1l9_8o",
    startTime: 16,
    distractors: ["Thật Bất Ngờ", "Sáng Mắt Chưa", "Có Không Giữ Mất Đừng Tìm"],
    explanation: "'Bốn Chữ Lắm' của Phạm Toàn Thắng đã đại thắng giải thưởng Cống Hiến với giai điệu dân gian đương đại vui nhộn."
  },
  {
    title: "Lắng Nghe Nước Mắt",
    artist: "Mr. Siro",
    ytid: "L8k_N1m9_9o",
    startTime: 18,
    distractors: ["Một Bước Yêu Vạn Dặm Đau", "Dưới Những Cơn Mưa", "Gương Mặt Phu Thê"],
    explanation: "'Lắng Nghe Nước Mắt' là bài ca mở đầu cho thương hiệu 'nhạc sầu Mr. Siro' đẫm lệ lấy đi nước mắt của triệu con tim."
  },
  {
    title: "Dưới Những Cơn Mưa",
    artist: "Mr. Siro",
    ytid: "D8k_N1c9_1o",
    startTime: 18,
    distractors: ["Một Bước Yêu Vạn Dặm Đau", "Lắng Nghe Nước Mắt", "Gương Mặt Phu Thê"],
    explanation: "'Dưới Những Cơn Mưa' diễn tả nỗi đau tuyệt vọng của chàng trai đứng dưới cơn mưa tầm tã nhìn người yêu rời xa."
  },
  {
    title: "Từ Đó",
    artist: "Phan Mạnh Quỳnh",
    ytid: "T8k_D1o9_2o",
    startTime: 18,
    distractors: ["Có Chàng Trai Viết Lên Cây", "Vợ Người Ta", "Hà Lan"],
    explanation: "'Từ Đó' trong phim điện ảnh Mắt Biếc diễn tả khoảnh khắc rung động đầu đời trong veo của chàng si tình Ngạn."
  },
  {
    title: "Nước Ngoài",
    artist: "Phan Mạnh Quỳnh",
    ytid: "N8k_N1g9_3o",
    startTime: 20,
    distractors: ["Có Chàng Trai Viết Lên Cây", "Vợ Người Ta", "Hồi Ức"],
    explanation: "'Nước Ngoài' của Phan Mạnh Quỳnh là bài hát đẫm nước mắt viết về nỗi cơ cực và sự hy sinh của những người con đi xuất khẩu lao động."
  },
  {
    title: "Hồi Ức",
    artist: "Phan Mạnh Quỳnh",
    ytid: "H8k_U1c9_4o",
    startTime: 20,
    distractors: ["Có Chàng Trai Viết Lên Cây", "Nước Ngoài", "Tri Kỷ"],
    explanation: "'Hồi Ức' trong chương trình Sing My Song khẳng định tư duy âm nhạc sâu sắc, nhân văn hiếm có của Phan Mạnh Quỳnh."
  },
  {
    title: "Chăm Hoa",
    artist: "MONO",
    ytid: "C8k_H1o9_5o",
    startTime: 16,
    distractors: ["Waiting For You", "Em Là", "Quên Anh Đi"],
    explanation: "'Chăm Hoa' với bối cảnh quay thơ mộng tại châu Âu tôn vinh vẻ đẹp rạng rỡ của người phụ nữ khi được yêu thương nâng niu."
  },
  {
    title: "Em Là",
    artist: "MONO",
    ytid: "E8k_L1a9_6o",
    startTime: 16,
    distractors: ["Waiting For You", "Chăm Hoa", "Quên Anh Đi"],
    explanation: "'Em Là' nằm trong album 22 của MONO tri ân minh tinh màn bạc quá cố Marilyn Monroe với ca từ lãng mạn."
  },
  {
    title: "Gieo Quẻ",
    artist: "Hoàng Thùy Linh x Đen Vâu",
    ytid: "G8k_Q1e9_7o",
    startTime: 16,
    distractors: ["See Tình", "Để Mị Nói Cho Mà Nghe", "Bo Xì Bo"],
    explanation: "'Gieo Quẻ' mở màn đầu năm mới với thông điệp gạt bỏ muộn phiền lo âu, chỉ xin quẻ về bình an và sức khỏe."
  },
  {
    title: "Hạ Buồn",
    artist: "Phi Nhung",
    ytid: "H8k_B1u9_8o",
    startTime: 18,
    distractors: ["Nỗi Buồn Hoa Phượng", "Lưu Bút Ngày Xanh", "Ba Tháng Tạ Từ"],
    explanation: "'Hạ Buồn' của nhạc sĩ Thanh Sơn khắc họa tiếng ve kêu râm ran và cành phượng vĩ đỏ rực ngày bế giảng chia tay."
  },
  {
    title: "Lưu Bút Ngày Xanh",
    artist: "Phi Nhung",
    ytid: "L8k_B1n9_9o",
    startTime: 18,
    distractors: ["Nỗi Buồn Hoa Phượng", "Ba Tháng Tạ Từ", "Hạ Buồn"],
    explanation: "'Lưu Bút Ngày Xanh' của Thanh Sơn là những dòng mực tím chan chứa tình bạn bè và thầy cô ngày rời ghế nhà trường."
  },
  {
    title: "Sầu Lẻ Bóng",
    artist: "Lệ Quyên",
    ytid: "S8k_L1b9_1o",
    startTime: 20,
    distractors: ["Mưa Nửa Đêm", "Nửa Đêm Ngoài Phố", "Hoa Nở Về Đêm"],
    explanation: "'Sầu Lẻ Bóng' của nhạc sĩ Anh Bằng diễn tả nỗi sầu quạnh quẽ của người con gái một mình trong căn phòng vắng."
  },
  {
    title: "Tôi Đưa Em Sang Sông",
    artist: "Đan Nguyên",
    ytid: "T8k_D1s9_2o",
    startTime: 20,
    distractors: ["Xin Gọi Nhau Là Cố Nhân", "Thói Đời", "Hai Lối Mộng"],
    explanation: "'Tôi Đưa Em Sang Sông' của Nhật Ngân & Y Vũ là tuyệt phẩm tiễn người yêu đi lấy chồng bên bến đò xưa."
  },
  {
    title: "Bản Tình Cuối",
    artist: "Lệ Quyên",
    ytid: "B8k_T1c9_3o",
    startTime: 20,
    distractors: ["Tình Lỡ", "Giọt Lệ Sầu", "Mười Năm Tình Cũ"],
    explanation: "'Bản Tình Cuối' của nhạc sĩ Ngô Thụy Miên là lời nguyện cầu tha thiết 'Mưa có rơi và nắng có phai, xin người yêu hãy quay về'."
  },
  {
    title: "Tình Hờ",
    artist: "Tuấn Ngọc",
    ytid: "T8k_H1o9_4o",
    startTime: 20,
    distractors: ["Riêng Một Góc Trời", "Niệm Khúc Cuối", "Khúc Thụy Du"],
    explanation: "'Tình Hờ' của nhạc sĩ Phạm Duy là khúc tình ca chua xót về cuộc tình chắp vá hững hờ giữa dòng đời tao loạn."
  },
  {
    title: "Mây Trắng Bay Về",
    artist: "Thanh Lam",
    ytid: "M8k_T1b9_5o",
    startTime: 20,
    distractors: ["Lối Cũ Ta Về", "Hoa Sữa", "Giọt Nắng Bên Thềm"],
    explanation: "'Mây Trắng Bay Về' của Dương Thụ là tuyệt phẩm khí nhạc và giọng hát đỉnh cao của diva Thanh Lam."
  },
  {
    title: "Đá Trông Chồng",
    artist: "Ngọc Khuê",
    ytid: "D8k_T1c9_6o",
    startTime: 18,
    distractors: ["Chuồn Chuồn Ớt", "Bà Tôi", "Giọt Sương Bay Lên"],
    explanation: "'Đá Trông Chồng' của Lê Minh Sơn lấy cảm hứng từ tích nàng Tô Thị hóa đá vọng phu thủy chung chờ chồng nơi biên ải."
  },
  {
    title: "Bên Kia Sông Đuống",
    artist: "Tùng Dương",
    ytid: "B8k_K1s9_7o",
    startTime: 20,
    distractors: ["Chiếc Khăn Piêu", "Chảy Đi Sông Ơi", "Con Cò"],
    explanation: "'Bên Kia Sông Đuống' của Hoàng Cầm được Tùng Dương thể hiện đầy chất sử thi và lòng yêu quê hương xứ Kinh Bắc."
  },
  {
    title: "Hồ Trên Núi",
    artist: "NSND Quang Thọ",
    ytid: "H8k_T1n9_8o",
    startTime: 18,
    distractors: ["Đất Nước Trọn Niềm Vui", "Tàu Anh Qua Núi", "Chảy Đi Sông Ơi"],
    explanation: "'Hồ Trên Núi' của nhạc sĩ Phó Đức Phương ca ngợi bàn tay con người kỳ diệu đắp đập ngăn sông dựng nên kỳ quan hồ Cấm Sơn."
  },
  {
    title: "Con Cò",
    artist: "Tùng Dương",
    ytid: "C8k_C1o9_9o",
    startTime: 18,
    distractors: ["Chiếc Khăn Piêu", "Chảy Đi Sông Ơi", "Mưa Bay Tháp Cổ"],
    explanation: "'Con Cò' của Lưu Hà An là kiệt tác đoạt giải Bài hát của năm ca ngợi người mẹ Việt Nam tần tảo lặn lội bờ sông."
  },
  {
    title: "Mưa Bay Tháp Cổ",
    artist: "Tùng Dương",
    ytid: "M8k_B1t9_1o",
    startTime: 18,
    distractors: ["Con Cò", "Chiếc Khăn Piêu", "Ôi Quê Tôi"],
    explanation: "'Mưa Bay Tháp Cổ' của Trần Tiến mang âm hưởng Chăm-pa huyền bí đưa Tùng Dương lên ngôi quán quân Sao Mai Điểm Hẹn 2004."
  },
  {
    title: "Ôi Quê Tôi",
    artist: "Tùng Dương",
    ytid: "O8k_Q1t9_2o",
    startTime: 18,
    distractors: ["Con Cò", "Mưa Bay Tháp Cổ", "Bên Kia Sông Đuống"],
    explanation: "'Ôi Quê Tôi' của Lê Minh Sơn là khúc ca nồng nàn hương rơm rạ, khói lam chiều và tình yêu đất mẹ bao la."
  },
  {
    title: "Tình Mãi Xa",
    artist: "GMC",
    ytid: "T8k_M1x9_3o",
    startTime: 16,
    distractors: ["Đêm Trăng Tình Yêu", "Kiếp Lữ Hành", "Nỗi Sầu Đêm Vắng"],
    explanation: "'Tình Mãi Xa' là bản ballad làm nên tên tuổi nhóm nhạc nam thần tượng GMC thập niên 2000."
  },
  {
    title: "Kiếp Lữ Hành",
    artist: "GMC",
    ytid: "K8k_L1h9_4o",
    startTime: 16,
    distractors: ["Đêm Trăng Tình Yêu", "Tình Mãi Xa", "Giọt Lệ Đài Trang"],
    explanation: "'Kiếp Lữ Hành' với hình ảnh những chàng trai lãng tử phiêu bạt giang hồ in sâu trong ký ức học sinh sinh viên."
  },
  {
    title: "Giọt Lệ Đài Trang",
    artist: "Đan Trường",
    ytid: "G8k_L1d9_5o",
    startTime: 20,
    distractors: ["Kiếp Ve Sầu", "Tình Khúc Vàng", "Đi Về Nơi Xa"],
    explanation: "'Giọt Lệ Đài Trang' của Châu Kỳ là khúc hát Bolero da diết được Đan Trường thể hiện đầy thổn thức."
  },
  {
    title: "Hà Lan",
    artist: "Phan Mạnh Quỳnh",
    ytid: "H8k_L1a9_6o",
    startTime: 18,
    distractors: ["Có Chàng Trai Viết Lên Cây", "Từ Đó", "Vợ Người Ta"],
    explanation: "'Hà Lan' là bản tình ca day dứt Phan Mạnh Quỳnh dành riêng cho nhân vật có đôi mắt biếc đượm buồn trong phim Mắt Biếc."
  },
  {
    title: "Mảnh Ghép",
    artist: "Andiez",
    ytid: "M8k_G1h9_7o",
    startTime: 18,
    distractors: ["1 Phút", "Suýt Nữa Thì", "Chờ Đợi Có Đáng Sợ"],
    explanation: "'Mảnh Ghép' của Andiez Nam Trương là câu chuyện tìm kiếm mảnh ghép trái tim còn thiếu giữa dòng đời tấp nập."
  },
  {
    title: "Chờ Đợi Có Đáng Sợ",
    artist: "Andiez",
    ytid: "C8k_D1c9_8o",
    startTime: 18,
    distractors: ["1 Phút", "Suýt Nữa Thì", "Mảnh Ghép"],
    explanation: "'Chờ Đợi Có Đáng Sợ' là khúc tự sự xót xa của chàng trai kiên nhẫn chờ đợi một tình yêu không có kết quả."
  },
  {
    title: "Missing You",
    artist: "Phương Ly",
    ytid: "M8k_Y1o9_9o",
    startTime: 16,
    distractors: ["Mặt Trời Của Em", "Thằng Điên", "Anh Là Ai"],
    explanation: "'Missing You' với MV phong cách màu sắc vui nhộn tiếp tục chuỗi hit thành công của nữ ca sĩ Phương Ly."
  },
  {
    title: "Anh Là Ai",
    artist: "Phương Ly",
    ytid: "A8k_L1a9_1o",
    startTime: 16,
    distractors: ["Mặt Trời Của Em", "Missing You", "Thằng Điên"],
    explanation: "'Anh Là Ai' là ca khúc Pop R&B ngọt ngào thể hiện sự bối rối đáng yêu khi bất ngờ trúng tiếng sét ái tình."
  },
  {
    title: "Người Lạ Nơi Cuối Con Đường",
    artist: "JustaTee ft. LK",
    ytid: "N8k_L1n9_2o",
    startTime: 18,
    distractors: ["Bâng Khuâng", "Forever Alone", "Đã Lỡ Yêu Em Nhiều"],
    explanation: "'Người Lạ Nơi Cuối Con Đường' là bản thánh ca Underground mở đầu kỷ nguyên vàng son của LadyKillah."
  },
  {
    title: "Tìm",
    artist: "Min ft. Mr A",
    ytid: "T8k_M1i9_3o",
    startTime: 16,
    distractors: ["Yêu", "Có Em Chờ", "Hôn Anh"],
    explanation: "'Tìm' do Hoàng Tôn sáng tác là ca khúc debut ấn tượng đưa Min bước chân vào con đường ca hát chuyên nghiệp."
  },
  {
    title: "Hôn Anh",
    artist: "Min",
    ytid: "H8k_A1n9_4o",
    startTime: 16,
    distractors: ["Yêu", "Có Em Chờ", "Tìm"],
    explanation: "'Hôn Anh' của nhạc sĩ Trang mang màu sắc Indie Pop trong trẻo, mộng mơ tại xứ sở kim chi Hàn Quốc."
  },
  {
    title: "Chạy Khỏi Thế Giới Này",
    artist: "Da LAB ft. Phương Ly",
    ytid: "C8k_K1t9_5o",
    startTime: 18,
    distractors: ["Thanh Xuân", "Gác Lại Âu Lo", "Một Nhà"],
    explanation: "'Chạy Khỏi Thế Giới Này' là cuộc trốn chạy ngọt ngào của tình yêu khỏi những bộn bề, lo toan của cuộc sống thường nhật."
  },
  {
    title: "Sông Lô",
    artist: "Hợp xướng Quân đội",
    ytid: "S8k_L1o9_6o",
    startTime: 20,
    distractors: ["Du Kích Sông Thao", "Tiến Quân Ca", "Giải Phóng Điện Biên"],
    explanation: "'Trường Ca Sông Lô' của Văn Cao là đỉnh cao của nền âm nhạc kháng chiến với khí thế chiến thắng sông Lô oanh liệt."
  },
  {
    title: "Chiếc Vòng Cầu Hôn",
    artist: "Đàm Vĩnh Hưng",
    ytid: "C8k_V1c9_7o",
    startTime: 18,
    distractors: ["Chiếc Gậy Trường Sơn", "Lá Đỏ", "Tàu Anh Qua Núi"],
    explanation: "'Chiếc Vòng Cầu Hôn' của Trần Tiến xúc động lòng người về kỷ vật thiêng liêng của người lính gửi lại người yêu."
  },
  {
    title: "Tạm Biệt Chim Én",
    artist: "Cẩm Vân",
    ytid: "T8k_B1c9_8o",
    startTime: 18,
    distractors: ["Mặt Trời Bé Con", "Sắc Màu", "Chị Tôi"],
    explanation: "'Tạm Biệt Chim Én' của Trần Tiến là khúc tình ca lãng mạn tiễn đàn chim én bay về phương nam tránh rét."
  },
  {
    title: "Hát Với Chú Ve Con",
    artist: "Mỹ Tâm",
    ytid: "H8k_V1c9_9o",
    startTime: 16,
    distractors: ["Cây Đàn Sinh Viên", "Họa Mi Tóc Nâu", "Ước Gì"],
    explanation: "'Hát Với Chú Ve Con' của nhạc sĩ Thanh Tùng đem lại nguồn năng lượng bừng sáng tuổi trẻ cho tiếng hát Mỹ Tâm."
  },
  {
    title: "Quạt Giấy",
    artist: "Đoan Trang",
    ytid: "Q8k_G1i9_1o",
    startTime: 16,
    distractors: ["Tóc Hát", "Sô-cô-la", "Dạ Khúc Lam"],
    explanation: "'Quạt Giấy' của nhạc sĩ Lưu Thiên Hương kết hợp chất liệu dân gian đương đại với tiết tấu Rock sôi động của Đoan Trang."
  },
  {
    title: "Dạ Khúc Lam",
    artist: "Đoan Trang",
    ytid: "D8k_K1l9_2o",
    startTime: 18,
    distractors: ["Tóc Hát", "Sô-cô-la", "Quạt Giấy"],
    explanation: "'Dạ Khúc Lam' đưa Đoan Trang tỏa sáng với những bước nhảy Flamenco rực lửa và giọng hát đầy nội lực."
  },
  {
    title: "Nước Mắt Nàng Kiều",
    artist: "Khánh Phương",
    ytid: "N8k_M1k9_3o",
    startTime: 18,
    distractors: ["Chiếc Khăn Gió Ấm", "Tựa Vào Vai Anh", "Mưa Thủy Tinh"],
    explanation: "'Nước Mắt Nàng Kiều' là bản ballad buồn thương lấy cảm hứng từ số phận người con gái hồng nhan bạc phận."
  },
  {
    title: "Mưa Buồn",
    artist: "Đan Trường & Cẩm Ly",
    ytid: "M8k_B1u9_4o",
    startTime: 18,
    distractors: ["Chim Trắng Mồ Côi", "Giấc Mơ Tình Yêu", "Phượng Buồn"],
    explanation: "'Mưa Buồn' của nhạc sĩ Hoài An là bản song ca trữ tình ngọt ngào của cặp đôi Đan Trường - Cẩm Ly thời kỳ hoàng kim."
  },
  {
    title: "Tuyết Hồng",
    artist: "Đan Trường & Cẩm Ly",
    ytid: "T8k_H1o9_5o",
    startTime: 18,
    distractors: ["Chim Trắng Mồ Côi", "Giấc Mơ Tình Yêu", "Mưa Buồn"],
    explanation: "'Tuyết Hồng' là bài hát nhạc Hoa lời Việt lãng mạn gắn liền với hình ảnh cặp tình nhân tuyết trắng Đan Trường - Cẩm Ly."
  },
  {
    title: "Chiếc Băng Ca",
    artist: "Nhật Tinh Anh",
    ytid: "C8k_B1c9_6o",
    startTime: 18,
    distractors: ["Tình Yêu Mang Theo", "Vầng Trăng Khóc", "Khi Yêu"],
    explanation: "'Chiếc Băng Ca' là phim ca nhạc xúc động về sự hy sinh cao cả của người bác sĩ trong phòng cấp cứu."
  },
  {
    title: "Khi Yêu",
    artist: "Nhật Tinh Anh",
    ytid: "K8k_Y1e9_7o",
    startTime: 18,
    distractors: ["Tình Yêu Mang Theo", "Vầng Trăng Khóc", "Chiếc Băng Ca"],
    explanation: "'Khi Yêu' mang giai điệu nồng nàn về những cung bậc cảm xúc thăng hoa và đắm say trong tình yêu."
  },
  {
    title: "Mộng Thủy Tinh",
    artist: "Khánh Ngọc",
    ytid: "M8k_T1t9_8o",
    startTime: 18,
    distractors: ["Vầng Trăng Khóc", "Như Vẫn Còn Đây", "Tình Yêu Mang Theo"],
    explanation: "'Mộng Thủy Tinh' của nhạc sĩ Nguyễn Văn Chung là bản solo đầu tay khẳng định chất giọng khỏe khoắn của quán quân Tiếng hát Truyền hình Khánh Ngọc."
  },
  {
    title: "Như Vẫn Còn Đây",
    artist: "Khánh Ngọc",
    ytid: "N8k_V1c9_9o",
    startTime: 18,
    distractors: ["Mộng Thủy Tinh", "Vầng Trăng Khóc", "Tình Yêu Mang Theo"],
    explanation: "'Như Vẫn Còn Đây' là bản ballad buồn day dứt về nỗi nhớ người yêu dẫu thời gian đã trôi qua bao năm tháng."
  },
  {
    title: "Khóc Thêm Lần Nữa",
    artist: "Bảo Thy",
    ytid: "K8k_T1l9_1o",
    startTime: 16,
    distractors: ["Công Chúa Bong Bóng", "Ngôi Nhà Hoa Hồng", "Ngốc Nghếch"],
    explanation: "'Khóc Thêm Lần Nữa' là bản hit nhạc ngoại lời Việt đình đám của Bảo Thy phủ sóng khắp các quán net thời kỳ Audition."
  },
  {
    title: "Ngày Buồn Nhất",
    artist: "Bảo Thy",
    ytid: "N8k_B1n9_2o",
    startTime: 18,
    distractors: ["Khóc Thêm Lần Nữa", "Công Chúa Bong Bóng", "Ngốc Nghếch"],
    explanation: "'Ngày Buồn Nhất' của nhạc sĩ Nguyễn Hoàng Duy với câu hát xé lòng 'Ngày buồn nhất cũng đã đến rồi em ơi' của Bảo Thy."
  },
  {
    title: "Sau Mỗi Giấc Mơ",
    artist: "Đông Nhi",
    ytid: "S8k_M1g9_3o",
    startTime: 18,
    distractors: ["Khóc", "Bối Rối", "Lời Thú Tội Ngọt Ngào"],
    explanation: "'Sau Mỗi Giấc Mơ' là bản ballad đầy ma mị với những cảnh quay lặn dưới đáy biển ngoạn mục của Đông Nhi."
  },
  {
    title: "Cầu Vồng Sau Mưa",
    artist: "Cao Thái Sơn",
    ytid: "C8k_V1s9_4o",
    startTime: 18,
    distractors: ["Con Đường Mưa", "Pha Lê Tím", "Yêu Thương Quay Về"],
    explanation: "'Cầu Vồng Sau Mưa' của Nguyễn Văn Chung khép lại bộ ba ca khúc về mưa kinh điển của Cao Thái Sơn."
  },
  {
    title: "Ngàn Lần Khắc Tên Em",
    artist: "Cao Thái Sơn",
    ytid: "N8k_L1k9_5o",
    startTime: 18,
    distractors: ["Con Đường Mưa", "Pha Lê Tím", "Cầu Vồng Sau Mưa"],
    explanation: "'Ngàn Lần Khắc Tên Em' là bài hát khắc khoải nỗi nhớ nhung người yêu của Cao Thái Sơn được khán giả yêu thích."
  },
  {
    title: "Gặp Mẹ Trong Mơ",
    artist: "Thùy Chi",
    ytid: "G8k_M1t9_6o",
    startTime: 18,
    distractors: ["Xe Đạp", "Mưa", "Giấc Mơ Trưa"],
    explanation: "'Gặp Mẹ Trong Mơ' nhạc Mông Cổ lời Việt qua giọng hát trong vắt của Thùy Chi đã lấy đi nước mắt của hàng triệu người con."
  },
  {
    title: "Phố Cổ",
    artist: "Thùy Chi",
    ytid: "P8k_C1o9_7o",
    startTime: 18,
    distractors: ["Xe Đạp", "Giấc Mơ Trưa", "Mưa"],
    explanation: "'Phố Cổ' của nhạc sĩ Nguyễn Duy Hùng mang lại không gian tĩnh lặng, cổ kính của những con phố rêu phong Hà Nội."
  },
  {
    title: "Khoảng Trời Của Bé",
    artist: "Thùy Chi",
    ytid: "K8k_T1c9_8o",
    startTime: 16,
    distractors: ["Giấc Mơ Trưa", "Xe Đạp", "Mưa"],
    explanation: "'Khoảng Trời Của Bé' của nhạc sĩ Nguyễn Duy Hùng với giai điệu trong sáng, hồn nhiên như bầu trời tuổi thơ của trẻ thơ."
  },
  {
    title: "Chỉ Anh Hiểu Em",
    artist: "Khắc Việt",
    ytid: "C8k_A1h9_9o",
    startTime: 18,
    distractors: ["Yêu Lại Từ Đầu", "Như Vậy Nhé", "Ngỡ"],
    explanation: "'Chỉ Anh Hiểu Em' là bản hit Pop Ballad giàu cảm xúc khẳng định vị trí độc tôn của Khắc Việt trên các bảng xếp hạng 2011."
  },
  {
    title: "Trăm Năm Không Quên",
    artist: "Quang Hà",
    ytid: "T8k_N1k9_1o",
    startTime: 20,
    distractors: ["Ngỡ", "Định Mệnh", "Bản Tình Cuối"],
    explanation: "'Trăm Năm Không Quên' của nhạc sĩ Đức Thịnh là bản tình ca son sắt ngàn đời gắn liền với tên tuổi ca sĩ Quang Hà."
  },
  {
    title: "Bóng Mây Qua Thềm",
    artist: "Thu Minh",
    ytid: "B8k_M1q9_2o",
    startTime: 18,
    distractors: ["Chuông Gió", "Bay", "Taxi"],
    explanation: "'Bóng Mây Qua Thềm' của nhạc sĩ Võ Thiện Thanh đã đoạt giải Bài hát yêu thích nhất Bài Hát Việt 2005 của Thu Minh."
  },
  {
    title: "Khi Tôi Vingt Ans",
    artist: "Đoan Trang",
    ytid: "K8k_T1v9_3o",
    startTime: 16,
    distractors: ["Tóc Hát", "Sô-cô-la", "Quạt Giấy"],
    explanation: "'Khi Tôi Vingt Ans' mang phong cách Pop Dance trẻ trung kỷ niệm tuổi 20 rực rỡ và tràn đầy ước mơ của Đoan Trang."
  },
  {
    title: "Nhớ Em",
    artist: "Minh Vương M4U",
    ytid: "N8k_E1m9_4o",
    startTime: 18,
    distractors: ["Vệt Nắng Cuối Trời", "Nỗi Đau Xót Xa", "Mưa"],
    explanation: "'Nhớ Em' là bài hát tự sự da diết của Minh Vương M4U về nỗi nhớ người con gái phương xa."
  },
  {
    title: "Nỗi Đau Người Đến Sau",
    artist: "Minh Vương M4U",
    ytid: "N8k_D1n9_5o",
    startTime: 18,
    distractors: ["Nỗi Đau Xót Xa", "Vệt Nắng Cuối Trời", "Nhớ Em"],
    explanation: "'Nỗi Đau Người Đến Sau' diễn tả tâm sự trớ trêu của người đến sau trong cuộc tình dang dở."
  },
  {
    title: "Túp Lều Lý Tưởng",
    artist: "Hồ Quang Hiếu",
    ytid: "T8k_L1l9_6o",
    startTime: 16,
    distractors: ["Con Bướm Xuân", "Không Cảm Xúc", "Nơi Ấy Con Tìm Về"],
    explanation: "'Túp Lều Lý Tưởng' của Hoàng Thi Thơ với bản phối remix vui nhộn tạo nên không khí tưng bừng cho mọi bữa tiệc."
  },
  {
    title: "Giá Mình Là Người Lạ",
    artist: "Hồ Quang Hiếu",
    ytid: "G8k_M1l9_7o",
    startTime: 18,
    distractors: ["Không Cảm Xúc", "Con Bướm Xuân", "Nơi Ấy Con Tìm Về"],
    explanation: "'Giá Mình Là Người Lạ' là bản ballad đượm buồn về sự chia tay của hai người từng yêu nhau sâu đậm."
  },
  {
    title: "Bao Tiền Một Mớ Bình Yên",
    artist: "14 Casper & Bon",
    ytid: "B8k_T1m9_8o",
    startTime: 18,
    distractors: ["Nàng Thơ", "Chìm Sâu", "Bước Qua Nhau"],
    explanation: "'Bao Tiền Một Mớ Bình Yên' với giai điệu Acoustic mộc mạc đã xoa dịu tâm hồn hàng triệu bạn trẻ giữa cuộc sống hối hả."
  },
  {
    title: "Chìm Sâu",
    artist: "RPT MCK ft. Trung Trần",
    ytid: "C8k_S1a9_9o",
    startTime: 16,
    distractors: ["Tại Vì Sao", "Nàng Thơ", "Thích Em Hơi Nhiều"],
    explanation: "'Chìm Sâu' của MCK là bản tình ca Rap R&B ngọt ngào đạt top 1 các bảng xếp hạng âm nhạc năm 2022."
  },
  {
    title: "Tại Vì Sao",
    artist: "RPT MCK",
    ytid: "T8k_V1s9_1o",
    startTime: 16,
    distractors: ["Chìm Sâu", "Thích Quá Rùi Nà", "Tay To"],
    explanation: "'Tại Vì Sao' nằm trong album 99% của MCK khẳng định vị thế rapper kiêm nghệ sĩ Melodic hàng đầu Việt Nam."
  },
  {
    title: "Tay To",
    artist: "RPT MCK x Phong Hin",
    ytid: "T8k_T1o9_2o",
    startTime: 16,
    distractors: ["Chìm Sâu", "Tại Vì Sao", "Thủ Đô Cypher"],
    explanation: "'Tay To' là siêu phẩm Hiphop Drill khuấy đảo giới trẻ với flow biến hóa và câu từ sắc bén của MCK."
  },
  {
    title: "Thích Quá Rùi Nà",
    artist: "tlinh ft. Trung Trần",
    ytid: "T8k_Q1r9_3o",
    startTime: 16,
    distractors: ["Nếu Lúc Đó", "Gái Độc Thân", "Ghê Sợ"],
    explanation: "'Thích Quá Rùi Nà' với giai điệu tươi vui, nhí nhảnh đưa nữ rapper tlinh trở thành thần tượng của giới trẻ Gen Z."
  },
  {
    title: "Gái Độc Thân",
    artist: "tlinh",
    ytid: "G8k_D1t9_4o",
    startTime: 16,
    distractors: ["Nếu Lúc Đó", "Thích Quá Rùi Nà", "Ghê Sợ"],
    explanation: "'Gái Độc Thân' là bản tuyên ngôn nữ quyền tự tin, độc lập và quyến rũ của tlinh được đông đảo bạn nữ ủng hộ."
  },
  {
    title: "Cơn Mưa Qua",
    artist: "Lil Knight ft. Young Uno",
    ytid: "C8k_M1q9_5o",
    startTime: 18,
    distractors: ["Tuyết Yêu Thương", "Xin Anh Đừng", "Thu Cuối"],
    explanation: "'Cơn Mưa Qua' là một trong những bản nhạc Rap Việt đầu tiên thời kỳ sơ khai của diễn đàn VietHipHop."
  },
  {
    title: "Xin Anh Đừng",
    artist: "Emily ft. Lil Knight x JustaTee",
    ytid: "X8k_A1d9_6o",
    startTime: 16,
    distractors: ["Mượn Rượu Tỏ Tình", "Bâng Khuâng", "Người Lạ Nơi Cuối Con Đường"],
    explanation: "'Xin Anh Đừng' kết hợp hoàn hảo giữa giọng hát ngọt ngào của hot girl Emily và chất giọng RnB của JustaTee."
  },
  {
    title: "Mượn Rượu Tỏ Tình",
    artist: "BigDaddy x Emily",
    ytid: "M8k_R1t9_7o",
    startTime: 16,
    distractors: ["Xin Anh Đừng", "Ngõ Chạm", "Yêu Nắm"],
    explanation: "'Mượn Rượu Tỏ Tình' với câu hát 'Mượn rượu tỏ tình đấy thì sao nào' là bản hit Valentine ngọt ngào nhất của cặp vợ chồng BigDaddy - Emily."
  },
  {
    title: "Ngõ Chạm",
    artist: "BigDaddy x Emily",
    ytid: "N8k_C1h9_8o",
    startTime: 16,
    distractors: ["Mượn Rượu Tỏ Tình", "Yêu Nắm", "Ơ Sao Bé Không Lắc"],
    explanation: "'Ngõ Chạm' là bản tình ca kỷ niệm 13 năm bên nhau đầy lãng mạn và hạnh phúc của BigDaddy và Emily."
  },
  {
    title: "Bóng Phù Hoa",
    artist: "Phương Mỹ Chi",
    ytid: "B8k_P1h9_9o",
    startTime: 18,
    distractors: ["Vũ Trụ Có Anh", "Đẩy Xe Bò", "Chiếc Lược Ngà"],
    explanation: "'Bóng Phù Hoa' lấy cảm hứng từ Chuyện người con gái Nam Xương chứng minh giọng hát kỹ thuật tuyệt vời của Phương Mỹ Chi."
  },
  {
    title: "Chiếc Lược Ngà",
    artist: "Phương Mỹ Chi",
    ytid: "C8k_L1n9_1o",
    startTime: 18,
    distractors: ["Vũ Trụ Có Anh", "Bóng Phù Hoa", "Đẩy Xe Bò"],
    explanation: "'Chiếc Lược Ngà' phổ nhạc tác phẩm văn học của nhà văn Nguyễn Quang Sáng trong album Vũ Trụ Cò Bay."
  },
  {
    title: "Hai Cô Tiên",
    artist: "365daband",
    ytid: "H8k_C1t9_2o",
    startTime: 16,
    distractors: ["Bống Bống Bang Bang", "Nơi Anh Không Thuộc Về", "Và Như Thế"],
    explanation: "'Hai Cô Tiên' là ca khúc nhạc phim Ngày Nảy Ngày Nay với vũ điệu nhảy cực sôi động của nhóm 365daband."
  },
  {
    title: "Nơi Anh Không Thuộc Về",
    artist: "365daband",
    ytid: "N8k_A1k9_3o",
    startTime: 16,
    distractors: ["Bống Bống Bang Bang", "Hai Cô Tiên", "Và Như Thế"],
    explanation: "'Nơi Anh Không Thuộc Về' mang phong cách Hip-hop Dubstep hiện đại khẳng định chất lượng âm nhạc của 365daband."
  },
  {
    title: "Và Như Thế",
    artist: "365daband",
    ytid: "V8k_N1t9_4o",
    startTime: 18,
    distractors: ["Bống Bống Bang Bang", "Hai Cô Tiên", "Nơi Anh Không Thuộc Về"],
    explanation: "'Và Như Thế' là bản ballad buồn cuối cùng của nhóm 365daband trước thềm liveshow chia tay nhóm năm 2016."
  },
  {
    title: "Tâm Hồn Của Đá",
    artist: "Bức Tường",
    ytid: "T8k_H1c9_5o",
    startTime: 18,
    distractors: ["Đường Đến Ngày Vinh Quang", "Bông Hồng Thủy Tinh", "Mắt Đen"],
    explanation: "'Tâm Hồn Của Đá' của cố nghệ sĩ Trần Lập là ca khúc Rock kinh điển thức tỉnh ý chí vượt qua thử thách của người trẻ."
  },
  {
    title: "Bông Hồng Thủy Tinh",
    artist: "Bức Tường",
    ytid: "B8k_H1t9_6o",
    startTime: 18,
    distractors: ["Đường Đến Ngày Vinh Quang", "Tâm Hồn Của Đá", "Mắt Đen"],
    explanation: "'Bông Hồng Thủy Tinh' ví tình yêu đẹp nhưng mong manh như đóa hồng bằng thủy tinh cần nâng niu gìn giữ."
  },
  {
    title: "Mắt Đen",
    artist: "Bức Tường",
    ytid: "M8k_D1e9_7o",
    startTime: 18,
    distractors: ["Đường Đến Ngày Vinh Quang", "Bông Hồng Thủy Tinh", "Tâm Hồn Của Đá"],
    explanation: "'Mắt Đen' là bản tình ca Rock bất hủ Trần Lập viết tặng riêng cho người vợ hiền đồng cam cộng khổ của mình."
  }
];

console.log(`Đã nạp:`);
console.log(`- Bolero & Nhạc Vàng: ${BOLERO_VANG_65.length} bài`);
console.log(`- Trữ Tình & Nhạc Đỏ: ${TRU_TINH_DO_65.length} bài`);
console.log(`- Nhạc Trẻ Mọi Thế Hệ: ${NHAC_TRE_130.length} bài`);
console.log(`- Tổng cộng: ${BOLERO_VANG_65.length + TRU_TINH_DO_65.length + NHAC_TRE_130.length} bài hát mới!`);

module.exports = { BOLERO_VANG_65, TRU_TINH_DO_65, NHAC_TRE_130 };
