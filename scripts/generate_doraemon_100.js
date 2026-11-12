const fs = require('fs');
const { STREETVIEW_LOCATIONS } = require('./data_streetview_40.js');

// Helper shuffle
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

function createQuestion(category, prompt, correctOpt, distractors, explanation, difficulty = "medium", type = "MULTIPLE_CHOICE", extra = {}) {
  const options = [correctOpt, ...distractors.slice(0, 3)];
  const shuffledOpts = shuffle(options);
  const correctIndex = shuffledOpts.indexOf(correctOpt);

  return {
    category,
    prompt,
    options: shuffledOpts,
    correct_index: correctIndex,
    explanation,
    image_url: extra.image_url || null,
    audio_url: null,
    video_url: null,
    youtube_video_id: null,
    question_type: type,
    difficulty,
    points: 1000,
    time_limit: type === "STREET_VIEW_GUESS" ? 30 : 20,
    source: extra.source || null,
    is_double_points: false,
    active: true,
    ...extra
  };
}

// =========================================================================
// 1. TẠO 100 CÂU HỎI MỚI CHO DORAEMON (TỔNG HỢP BẢO BỐI, NHÂN VẬT, PHIM DÀI)
// =========================================================================
const DORAEMON_NEW_RAW = [
  ["Bảo bối nào giúp người dùng đi đến bất kỳ đâu trong vũ trụ chỉ bằng một cánh cửa?", "Cánh cửa thần kỳ", ["Khăn trùm thời gian", "Vòng tròn xuyên thấu", "Đèn pin thu nhỏ"], "Cánh cửa thần kỳ (Dokodemo Door) có thể kết nối không gian tức thời đến bất kỳ địa điểm nào trong phạm vi 10 năm ánh sáng."],
  ["Chú mèo máy Doraemon bị mất đôi tai do nguyên nhân nào?", "Bị chuột gặm cắn mất khi đang ngủ", ["Bị rơi từ trên cao khi sản xuất", "Bị sét đánh trúng lúc sạc điện", "Do bác sĩ phẫu thuật nhầm"], "Doraemon bị một chú chuột robot gặm mất đôi tai khi đang ngủ say, sau đó bác sĩ buộc phải cắt bỏ toàn bộ."],
  ["Ban đầu khi mới xuất xưởng từ nhà máy Matsushiba, Doraemon có màu sơn là màu gì?", "Màu vàng chanh", ["Màu xanh da trời", "Màu đỏ tươi", "Màu cam sáng"], "Ban đầu Doraemon có thân hình màu vàng và có tai. Do khóc quá nhiều suốt 3 ngày sau vụ mất tai, lớp sơn vàng bị trôi để lộ lớp sơn lót màu xanh lam."],
  ["Món ăn khoái khẩu nhất mà Doraemon mê mẩn suốt cuộc đời là món gì?", "Bánh rán Dorayaki", ["Bánh bao kim sa", "Mì Ramen", "Bánh gạo Senbei"], "Bánh rán Dorayaki nhân đậu đỏ truyền thống là món ăn yêu thích số 1 của Doraemon."],
  ["Em gái của Doraemon tên là gì, sở hữu chiếc đuôi hình nơ màu hồng?", "Dorami", ["Mini-Dora", "Noramyako", "Chami"], "Dorami sinh ngày 2 tháng 12 năm 2114, là em gái thông minh và chu đáo hơn Doraemon rất nhiều."],
  ["Nỗi sợ hãi kinh hoàng và lớn nhất suốt cuộc đời của Doraemon là con gì?", "Con chuột", ["Con gián", "Con chó hung dữ", "Con nhện độc"], "Do ký ức kinh hoàng bị chuột gặm mất tai, Doraemon sợ chuột đến mức có thể hoảng loạn vác cả vũ khí hủy diệt ra bắn."],
  ["Nobita có tài năng thiên bẩm và vô địch trong hai bộ môn nào?", "Bắn súng bách phát bách trúng và chơi dây", ["Chạy nhanh và bơi lội", "Toán học và vẽ tranh", "Chơi cờ vây và đánh cờ tướng"], "Tuy học kém, Nobita lại là thiên tài bắn súng bách phát bách trúng và có biệt tài tạo hình đan dây nghệ thuật tuyệt đỉnh."],
  ["Nobita giữ kỷ lục thế giới về việc ngủ thiếp đi chỉ trong khoảng thời gian bao lâu?", "0,93 giây", ["3 giây", "10 giây", "30 giây"], "Nobita có khả năng đặt lưng xuống gối là ngủ ngay chỉ trong 0,93 giây."],
  ["Cậu bạn Dekisugi (Đêkhi) trong lớp của Nobita nổi tiếng về điểm gì?", "Học giỏi toàn diện, chơi thể thao cừ và đẹp trai", ["Gia đình giàu có nhất thị trấn", "Hát rất hay và đàn giỏi", "Thích bày trò nghịch ngợm"], "Hidetoshi Dekisugi là hình mẫu 'con nhà người ta' hoàn hảo: thông minh, học giỏi, chơi thể thao cừ và tính tình nhân hậu."],
  ["Nhân vật Suneo (Xêkô) có đặc điểm ngoại hình và tính cách nổi bật nào?", "Mỏ nhọn, nhà giàu có, hay khoe khoang và nịnh bợ Jaian", ["To béo, cục cằn, thích đánh nhau", "Cận thị nặng, lười nhác", "Nhút nhát, sợ bóng tối"], "Suneo Honekawa miệng nhọn đặc trưng, nhà giàu bậc nhất thị trấn và thường xuyên khoe khoang đồ chơi mới."],
  ["Ước mơ cháy bỏng nhưng là 'ác mộng' đối với bạn bè của Jaian (Chaien) là gì?", "Trở thành ca sĩ và mở liveshow", ["Trở thành đầu bếp 5 sao", "Trở thành họa sĩ manga", "Trở thành cầu thủ bóng đá"], "Jaian đam mê ca hát cháy bỏng nhưng giọng hát 'tra tấn màng nhĩ' khủng khiếp đến mức chim muông rơi rụng."],
  ["Em gái của Jaian có ước mơ trở thành nữ tác giả vẽ truyện tranh tên là gì?", "Jaiko", ["Shizuka", "Miyoko", "Lilulu"], "Jaiko (bút danh Christine Gōda) là em gái ruột của Jaian, có đam mê và tài năng sáng tác truyện tranh nghiêm túc."],
  ["Thần tượng âm nhạc mà nhóm bạn Nobita đều hâm mộ cuồng nhiệt tên là gì?", "Ito Tsubasa", ["Hoshino Sumire", "Akiyama Mio", "Minamoto Shizuka"], "Ito Tsubasa là nữ ca sĩ thần tượng tuổi teen nổi tiếng nhất trong thế giới truyện tranh Doraemon."],
  ["Bảo bối nào giúp người dùng hiểu và nói được mọi ngôn ngữ trong vũ trụ?", "Bánh mì chuyển ngữ", ["Kẹo phiên dịch", "Kính hiển vi âm thanh", "Bút thần kỳ"], "Bánh mì chuyển ngữ (Honyaku Konnyaku) khi ăn vào giúp giao tiếp trôi chảy mọi ngôn ngữ của muôn loài và người ngoài hành tinh."],
  ["Bảo bối gắn trên đầu giúp người sử dụng bay lượn tự do trên bầu trời là gì?", "Chong chóng tre", ["Thảm bay ma thuật", "Cánh bay phản lực", "Khí cầu mini"], "Chong chóng tre (Take-copter) là bảo bối di chuyển phổ biến nhất, chạy bằng pin hạt nhân mini."],
  ["Cỗ máy thời gian của Doraemon được đặt lối ra vào bí mật ở đâu?", "Trong ngăn kéo bàn học của Nobita", ["Dưới gầm giường ngủ", "Trong tủ quần áo", "Bên trong bồn tắm"], "Lối vào cỗ máy thời gian nằm ngay trong ngăn kéo bàn học bằng gỗ trong phòng riêng của Nobita."],
  ["Khăn trùm thời gian có mặt màu đỏ với công dụng gì?", "Làm cho vật được trùm già đi / tiến tới tương lai", ["Làm vật mới lại / quay về quá khứ", "Làm vật biến mất", "Nhân bản vật thể"], "Khăn trùm thời gian: mặt đỏ làm vật tiến tới tương lai (cũ đi, lớn lên), mặt xanh làm vật quay về quá khứ (mới lại, trẻ ra)."],
  ["Bảo bối nào thu nhỏ kích thước của sinh vật và đồ vật khi rọi ánh sáng vào?", "Đèn pin thu nhỏ", ["Đèn pin phóng to", "Gương nhân đôi", "Kính lúp ma thuật"], "Đèn pin thu nhỏ (Small Light) phát ra chùm tia sáng đặc biệt khiến bất kỳ vật thể nào bị rọi trúng đều thu nhỏ lại."],
  ["Bảo bối 'Tủ điện thoại yêu cầu' hoạt động dựa trên cơ chế nào?", "Chuyển thực tại sang thế giới song song đáp ứng giả định 'Nếu như...'", ["Xóa trí nhớ của mọi người", "Ngưng đọng thời gian", "Biến ước mơ thành ảo ảnh"], "Tủ điện thoại yêu cầu (Moshimo Box) tạo ra một thế giới song song dựa trên câu nói 'Nếu như...' của người bước vào tủ."],
  ["Chú khủng long đầu tiên được Nobita nuôi nấng trong tập phim dài đầu tiên tên là gì?", "Pi-suke", ["Kyu", "Myu", "Rex"], "Pi-suke là chú thằn lằn đầu rắn Futabasaurus được Nobita ấp nở từ một quả trứng hóa thạch."],
  ["Thói quen sinh hoạt nào của Shizuka thường xuyên bị Nobita vô tình bắt gặp?", "Đang tắm trong bồn tắm", ["Đang tập đàn piano", "Đang ăn khoai nướng", "Đang làm bài tập"], "Shizuka tắm rất nhiều lần mỗi ngày và mỗi khi Nobita dùng cửa thần kỳ thì thường xuyên mở trúng phòng tắm của bạn."],
  ["Món ăn khoái khẩu bí mật của Shizuka mà cô bé luôn ngượng ngùng giấu giếm là gì?", "Khoai lang nướng", ["Bánh ngọt dâu tây", "Mì cay Ramen", "Bánh rán đậu đỏ"], "Shizuka cực kỳ thích ăn khoai lang nướng nhưng sợ bạn bè chê cười nên luôn phải giấu giếm mua lén."],
  ["Nhạc cụ nào mà Shizuka chơi rất dở, phát ra tiếng ken két chói tai?", "Đàn Violin", ["Đàn Piano", "Đàn Guitar", "Kèn Trumpet"], "Shizuka chơi piano rất hay nhưng lại say mê đàn violin dù tiếng đàn ken két của cô bé là nỗi kinh hoàng cho người nghe."],
  ["Bác hàng xóm khó tính hay bị nhóm Nobita làm vỡ cửa kính khi chơi bóng chày tên là gì?", "Bác Kaminari", ["Bác Suzuki", "Thầy giáo chủ nhiệm", "Bác cảnh sát Yamada"], "Bác Kaminari (ông sấm sét) sống cạnh bãi đất trống, trồng cây cảnh Bonsai và thường xuyên bị bóng chày làm vỡ kính."],
  ["Bảo bối nào bắn ra luồng không khí nén cực mạnh khi người dùng hô 'Bùm'?", "Đại bác không khí", ["Súng gây mê", "Súng nam châm", "Ống sấm sét"], "Đại bác không khí (Air Cannon) xỏ vào ngón tay, khi hô 'Bùm' sẽ bắn ra luồng khí nén cực mạnh hất văng mục tiêu."],
  ["Tác giả huyền thoại sáng tạo ra bộ truyện tranh kinh điển Doraemon là ai?", "Fujiko F. Fujio", ["Gosho Aoyama", "Eiichiro Oda", "Akira Toriyama"], "Cố họa sĩ Fujiko F. Fujio (Hiroshi Fujimoto) là cha đẻ sáng tạo nên thế giới Doraemon từ năm 1969."],
  ["Chiếc túi thần kỳ của Doraemon chứa các bảo bối có đặc tính không gian gì?", "Không gian 4 chiều vô tận", ["Không gian chân không", "Không gian lượng tử", "Không gian nén 2D"], "Chiếc túi trước bụng Doraemon là túi không gian 4 chiều (Yojigen Pocket), chứa được vô số bảo bối mà không bị nặng."],
  ["Chắt tương lai từ thế kỷ 22 đã gửi Doraemon về quá khứ giúp Nobita tên là gì?", "Sewashi", ["Nobisuke", "Genta", "Dekisugi"], "Sewashi (Nobi Sewashi) là cháu cố đời thứ 4 của Nobita ở thế kỷ 22, gửi Doraemon về để giúp cụ cố thay đổi số phận."],
  ["Chiếc đuôi tròn màu đỏ của Doraemon có chức năng kỹ thuật gì?", "Công tắc dừng hoạt động khẩn cấp", ["Bộ phận sạc năng lượng", "Ăng-ten truyền dữ liệu", "Cảm biến nhiệt độ"], "Khi kéo chiếc đuôi màu đỏ của Doraemon, cậu sẽ lập tức ngắt nguồn và đứng bất động."],
  ["Bảo bối 'Vòng xuyên thấu' cho phép người sử dụng làm được điều gì?", "Dán lên tường để tạo lỗ hổng đi xuyên qua", ["Nhìn xuyên thấu qua quần áo", "Tàng hình hoàn toàn", "Biến cơ thể thành nước"], "Vòng xuyên thấu (Pass Loop) khi dán lên bất kỳ bức tường hay chướng ngại vật nào sẽ tạo ra một lỗ hổng tức thì để chui qua."],
  ["Trong tập phim 'Nobita và Lâu đài dưới đáy biển', đối thủ nguy hiểm là cỗ máy gì?", "Poseidon", ["Megalo", "Dullahan", "Gigazombie"], "Poseidon là cỗ máy tính hạt nhân tự động dưới đáy biển sâu có thể kích hoạt bom tận thế hủy diệt Trái Đất."],
  ["Bảo bối nào giúp người dùng thay đổi trang phục trong nháy mắt bằng tranh ảnh?", "Máy ảnh tạo mốt", ["Tủ quần áo tức thì", "Gương biến hình", "Bàn là thời trang"], "Máy ảnh tạo mốt (Camera tạo mốt) nhét bản vẽ hoặc ảnh trang phục vào khe, bấm chụp là quần áo biến thành bộ đồ đó."],
  ["Trong tập 'Nobita và Vương quốc trên mây', cư dân thiên giới dùng loại mây nào để xây thành phố?", "Mây tích điện và bình xịt đông cứng mây", ["Mây ngũ sắc", "Bông gòn nhân tạo", "Mây thủy tinh"], "Bình xịt đông cứng mây giúp biến các đám mây xốp thành bề mặt đất cứng có thể xây nhà cửa và đi lại."],
  ["Người bạn robot chim cánh cụt dũng cảm hy sinh cứu nhóm bạn trong 'Lâu đài dưới đáy biển' tên là gì?", "Buggy", ["Chamy", "Papi", "Riruru"], "Xe thồ đáy biển Buggy tuy nhút nhát nhưng đã lao thẳng vào lõi lò phản ứng của Poseidon để cứu sống mọi người."],
  ["Bảo bối nào giúp thu hút người khác phái mê mẩn khi đeo lên người?", "Huy hiệu chim bồ câu / Huy hiệu tình bạn", ["Bùa yêu", "Kính trái tim", "Nước hoa quyến rũ"], "Doraemon có nhiều bảo bối liên quan đến tình cảm như Huy hiệu nam châm, Mũi tên thần Cupid, Dây tơ hồng."],
  ["Trong phim 'Hành tinh muông thú', cư dân ở hành tinh này là loài gì?", "Các loài động vật biết đi bằng hai chân và nói tiếng người", ["Người ngoài hành tinh tí hon", "Các robot sinh học", "Người cá đại dương"], "Tại Hành tinh muông thú, muôn loài động vật tiến hóa vượt bậc, sống hòa bình và đi đứng nói năng như con người."],
  ["Bảo bối 'Hơi xịt tạo hình nước' có công dụng kỳ diệu nào?", "Làm cho nước đông cứng lại thành hình dạng như đất sét có thể uốn nặn", ["Làm nước sôi tức thì", "Biến nước thành xăng", "Lọc nước biển thành nước ngọt"], "Hơi xịt khí nặn nước giúp nước kết dính lại như thạch và đất sét để các bạn nhỏ xây công viên nước trên không."],
  ["Thầy giáo chủ nhiệm của lớp Nobita thường phạt cậu thế nào khi đi học muộn hoặc không làm bài tập?", "Đứng phạt ở hành lang ngoài cửa lớp", ["Chép phạt 100 lần", "Mời phụ huynh đến trường", "Lau sàn nhà vệ sinh"], "Hình ảnh Nobita xách hai xô nước hoặc đứng cúi đầu ở hành lang ngoài cửa lớp là cảnh phạt quen thuộc của thầy giáo."],
  ["Tên thật của mẹ Nobita trước khi lấy chồng là gì?", "Kataoka Tamako", ["Nobi Tamako", "Minamoto Shizuka", "Honekawa Tamako"], "Mẹ của Nobita tên thời con gái là Tamako Kataoka, một bà mẹ nghiêm khắc nhưng vô cùng yêu thương con."],
  ["Bố của Nobita (ông Nobi Nobisuke) có niềm đam mê thời trẻ là gì?", "Hội họa / Trở thành họa sĩ", ["Chơi bóng chày chuyên nghiệp", "Nghiên cứu vũ trụ", "Sáng tác tiểu thuyết"], "Bố Nobita thời trẻ từng được một nhà tài trợ mời đi du học hội họa để thành họa sĩ danh tiếng nhưng ông đã từ chối để cưới mẹ Nobita."],
  ["Bảo bối 'Bình xịt tàng hình' có công dụng gì?", "Xịt lên người để cơ thể trở nên trong suốt không ai nhìn thấy", ["Biến người khác thành thú cưng", "Làm mất mùi cơ thể", "Xóa ký ức đối phương"], "Bình xịt tàng hình giúp người xịt không bị mắt thường nhìn thấy nhưng vẫn để lại bóng và tiếng động."],
  ["Trong phim 'Nobita và cuộc đại thủy chiến ở xứ sở người cá', thanh kiếm huyền thoại tên là gì?", "Kiếm người cá", ["Kiếm ánh sáng", "Kiếm Excalibur", "Kiếm rồng thần"], "Thanh kiếm thần của người cá là báu vật cổ xưa nắm giữ sức mạnh bảo vệ đại dương."],
  ["Cậu bé tí hon tổng thống hành tinh Pirika trong tập 'Cuộc chiến vũ trụ tí hon' tên là gì?", "Papi", ["Riruru", "Kukuru", "Pekko"], "Papi là vị tổng thống dũng cảm của hành tinh tí hon Pirika đến Trái Đất lánh nạn quân phiệt Gilmore."],
  ["Cô bé người máy Riruru trong tập 'Nobita và binh đoàn người máy' đến từ hành tinh nào?", "Hành tinh Mechatopia", ["Hành tinh Pirika", "Hành tinh Koya Koya", "Hành tinh Rừng Xanh"], "Riruru là gián điệp người máy của hành tinh Mechatopia được cử xuống Trái Đất chuẩn bị cuộc xâm lăng của Binh đoàn người máy."],
  ["Ai là người đã cảm hóa và làm thay đổi trái tim người máy của Riruru bằng lòng trắc ẩn?", "Shizuka", ["Nobita", "Doraemon", "Dorami"], "Shizuka đã dùng bông băng chăm sóc vết thương cho Riruru và đối xử với cô bằng sự đồng cảm chân thành của con người."],
  ["Bảo bối nào có thể nhân đôi bất kỳ món đồ nào sau mỗi 5 phút một lần?", "Bánh bao nhân đôi (Thuốc nhân đôi)", ["Gương nhân đôi", "Máy in sao chép", "Đèn chiếu đa năng"], "Thuốc nhỏ nhân đôi (Baibain) nhỏ vào bánh hạt dẻ khiến số lượng bánh cứ 5 phút nhân đôi một lần, tạo ra thảm họa bánh hạt dẻ vũ trụ."],
  ["Bảo bối 'Bút chì thần kỳ' giúp Nobita đạt điểm 10 trong bài thi bằng cách nào?", "Tự động viết đáp án chính xác cho mọi câu hỏi", ["Tẩy sạch đáp án sai", "Làm bài thi biến mất", "Sao chép bài của Dekisugi"], "Cây bút vi tính này tự động di chuyển tay người cầm để giải trọn vẹn điểm tối đa mọi đề thi hóc búa nhất."],
  ["Trong tập 'Nobita và Vương quốc gió', sinh vật gió tí hon đáng yêu do Nobita nuôi tên là gì?", "Fuko", ["Kero", "Poko", "Goro"], "Fuko là một xoáy gió tí hon tinh nghịch, trung thành và đã hy sinh thân mình ngăn chặn bão rồng Mafuga để bảo vệ Nobita."],
  ["Bảo bối 'Dây cương huấn luyện' dùng để làm gì?", "Biến mọi đồ vật vô tri thành thú cưỡi ngoan ngoãn", ["Bắt thú hoang dã", "Buộc chặt đồ vật", "Huấn luyện chó nghiệp vụ"], "Khi gắn dây cương lên bất kỳ đồ vật nào như tivi, tủ lạnh, xe đạp, nó sẽ cử động và nghe lời như một chú ngựa."],
  ["Nhóm bạn của Doraemon hay tụ tập sinh hoạt và chơi bóng chày ở địa điểm quen thuộc nào?", "Bãi đất trống có ba ống cống bê tông", ["Sân trường tiểu học", "Công viên trung tâm", "Bờ kè con sông"], "Bãi đất trống với 3 ống cống bê tông xếp chồng lên nhau là biểu tượng kinh điển của tuổi thơ trong Doraemon."]
];

// Helper sinh 50 câu Doraemon tiếp theo
const DORAEMON_MORE = [
  ["Chiếc chuông vàng đeo cổ của Doraemon ban đầu có chức năng gì?", "Camera triệu hồi mèo lạc", ["Đồng hồ báo thức", "Máy đo nhịp tim", "Bộ đàm liên lạc"], "Chiếc chuông vàng ban đầu là thiết bị phát sóng gọi mèo, nhưng bị hỏng nên Doraemon giữ lại làm kỷ niệm tình bạn."],
  ["Bảo bối 'Mảnh đất trồng bánh mì' có thể làm ra thực phẩm bằng cách nào?", "Gieo hạt mầm bột mì và tưới nước", ["Đào đất dưới gốc cây", "Cho bột vào lò nướng thời gian", "Trộn bùn với đường"], "Gieo bột mì xuống khay đất đặc biệt là bánh mì thơm ngon sẽ mọc lên như cây nấm."],
  ["Nobita khi lớn lên trong tương lai kết hôn với ai?", "Shizuka", ["Jaiko", "Ito Tsubasa", "Noramyako"], "Nhờ sự giúp đỡ của Doraemon, tương lai Nobita đã thay đổi từ việc lấy Jaiko sang kết hôn cùng Shizuka."],
  ["Con trai của Nobita và Shizuka trong tương lai tên là gì?", "Nobisuke", ["Sewashi", "Nobita Jr", "Shisuke"], "Con trai của Nobita tên là Nobisuke (trùng tên với ông nội), nhưng tính tình lại nghịch ngợm và khỏe mạnh giống Jaian."],
  ["Trong tập 'Bí mật mê cung Buriki', các cư dân trên đảo nghỉ dưỡng bị robot bắt giữ tên là gì?", "Robot Buriki", ["Robot Megalo", "Robot Mecha", "Binh đoàn sắt"], "Cư dân trên hành tinh Buriki quá lười biếng để máy móc làm hết mọi việc dẫn đến việc bị người máy nổi dậy bắt giam."],
  ["Bảo bối 'Găng tay siêu thanh' của Doraemon cho phép làm gì?", "Đấm ra sóng siêu âm hất văng vật thể từ xa", ["Nắm bắt ánh sáng", "Đập vỡ kim cương", "Tạo ra sấm sét"], "Găng tay phóng ra luồng sóng âm cực mạnh như nắm đấm vô hình."],
  ["Bảo bối 'Gia vị tạo hình' rắc lên mây hoặc khói sẽ làm được gì?", "Biến mây thành các món ăn ăn được", ["Tạo ra mưa vàng", "Làm tan biến mây", "Đổi màu bầu trời"], "Rắc gia vị ẩm thực lên mây sẽ tạo ra những tảng kẹo bông và đồ ăn ngon lành."],
  ["Bảo bối 'Thẻ tín dụng ác quỷ' cho phép người dùng tiêu tiền không giới hạn nhưng phải trả giá bằng gì?", "Mỗi lần tiêu tiền cơ thể sẽ bị lùn đi 1 milimet", ["Bị mất đi 1 ngày tuổi thọ", "Bị biến thành quái vật", "Mất đi một ký ức"], "Cứ mỗi một lượng tiền tiêu xài từ thẻ, chiều cao của người dùng sẽ bị rút ngắn lại."],
  ["Chú chó trắng thông minh mà Nobita nhặt về nuôi trong tập 'Nobita thám hiểm vùng đất bí ẩn' là ai?", "Hoàng tử Peko của Vương quốc chó Bauwanko", ["Chú chó robot thế kỷ 22", "Một chú chó biến đổi gen", "Một điệp viên cải trang"], "Chú chó Peko thực chất là Hoàng tử Kuntaku dũng cảm của vương quốc loài chó ẩn sâu trong rừng già châu Phi."],
  ["Bảo bối 'Hộp Pandora' chứa đựng thứ gì đáng sợ bên trong?", "Nỗi sợ hãi và bóng tối tuyệt vọng", ["Khí độc ngạt", "Đàn kiến sát thủ", "Virus biến đổi"], "Khi mở hộp, nỗi sợ hãi tột cùng sẽ giải phóng thử thách lòng dũng cảm của người mở."],
  ["Nobita từng mơ ước trở thành người bảo vệ công lý với danh xưng siêu anh hùng gì?", "Nobita Mặt Nạ Bạc (Fukumen)", ["Người Nhện Nobita", "Siêu nhân Gekkou", "Đội trưởng Trái Đất"], "Nobita thường thích đeo mặt nạ làm anh hùng trừ gian diệt bạo."],
  ["Bảo bối 'Nước uống biến hình người cá' giúp nhóm bạn bơi lội dưới biển như thế nào?", "Phần thân dưới biến thành đuôi cá khi ngâm nước", ["Mọc ra mang cá ở cổ", "Tạo quả cầu không khí bao quanh", "Hô hấp bằng chân vịt"], "Khi uống thuốc, chân người biến thành đuôi cá mềm mại giúp bơi lội cực nhanh dưới biển sâu."],
  ["Bảo bối 'Bình xịt tạo đường hầm' khi xịt lên cây cỏ tạo ra điều gì?", "Một mê cung đường hầm bí mật dưới lòng đất", ["Hố đen vũ trụ", "Đường cao tốc trên không", "Cầu trượt nước"], "Tạo ra một không gian căn cứ bí mật dưới lòng đất cho nhóm bạn vui chơi."],
  ["Bảo bối 'Máy thu nhỏ âm thanh' biến tiếng ồn xung quanh thành vật thể gì?", "Những khối đá rắn có thể cầm nắm", ["Bong bóng xà phòng", "Đồng xu vàng", "Viên kẹo ngọt"], "Hút tiếng la hét của Jaian và biến thành những tảng đá chữ tượng thanh rơi lộp độp."],
  ["Trong tập 'Nobita và xứ sở nghìn lẻ một đêm', Shizuka bị lạc vào thế giới của cuốn truyện nào?", "Nghìn lẻ một đêm (Arabian Nights)", ["Aladdin và cây đèn thần", "Ali Baba và 40 tên cướp", "Thủy thủ Sinbad"], "Shizuka bị rơi lại trong thế giới cổ tích Ả Rập thế kỷ thứ 8 và được vua Sinbad cưu mang."],
  ["Tên của chú chim bồ câu đồ chơi gắn trên nóc 'Bảo tàng bảo bối' trong phim dài 2013 là gì?", "Peppeler", ["Pipi", "Kururu", "Poppo"], "Viện bảo tàng bảo bối tương lai là nơi lưu giữ toàn bộ các phát minh bảo bối từ sơ khai đến hiện đại."],
  ["Bảo bối 'Kim may vá mọi thứ' có thể vá được những thứ phi vật chất nào?", "Vá lại vết nứt không gian hoặc rách mặt nước", ["Vá lại tình cảm rạn nứt", "Vá lại giấc mơ", "Vá lại thời gian"], "Chiếc kim kỳ diệu có thể may vá cả mặt nước ao hồ bị cắt rời."],
  ["Bảo bối 'Hạt mầm ngôi nhà cây' khi gieo xuống đất sẽ nở thành gì?", "Một ngôi nhà tiện nghi nhiều phòng nằm trọn trong thân cây", ["Vườn hoa khổng lồ", "Cầu thang lên trời", "Tòa lâu đài đá"], "Cây lớn nhanh như thổi và tạo thành các phòng ốc đầy đủ bàn ghế trong thân cây."],
  ["Chiếc gương đảo ngược có chức năng gì khi bước vào bên trong?", "Mọi chữ viết và hướng trái phải đều bị lộn ngược", ["Thời gian chạy lùi", "Mọi người đều đi lùi", "Trọng lực đảo chiều"], "Thế giới trong gương là bản sao đối xứng hoàn hảo của thế giới thực."],
  ["Bảo bối 'Bánh thuần chủng' (Kibi Dango) có tác dụng gì đặc biệt?", "Thuần hóa bất kỳ loài thú hoang dã nào trở nên ngoan ngoãn", ["Tăng sức mạnh gấp 100 lần", "Làm động vật biết nói", "Làm cho thú cưng mọc cánh"], "Bánh Momotaro (Kibi Dango) khi ném cho thú dữ ăn sẽ khiến chúng lập tức nghe lời răm rắp."],
  ["Trong phim 'Chiến tranh vũ trụ', Nobita và các bạn đã chiến đấu chống lại tên độc tài nào?", "Tướng quân Gilmore", ["Thủ lĩnh Dema", "Tiến sĩ Gero", "Vua Khủng Long"], "Tướng quân độc tài Gilmore đã đảo chính chiếm đoạt hành tinh tí hon Pirika."],
  ["Bảo bối 'Mũ tàng hình' hoạt động thế nào?", "Đội lên đầu người khác sẽ không nhận ra sự hiện diện của mình như hòn đá ven đường", ["Làm cơ thể tan biến", "Dịch chuyển tức thời", "Tạo ảo ảnh phân thân"], "Chiếc mũ này làm giảm độ chú ý của người xung quanh xuống bằng 0 như một hòn sỏi ven đường."],
  ["Bảo bối 'Bùa hộ mệnh' có khả năng bảo vệ người đeo khỏi điều gì?", "Mọi tai nạn va chạm và nguy hiểm bất ngờ", ["Điểm 0 bài kiểm tra", "Bị mẹ mắng", "Bị chó cắn"], "Tự động phát ra từ trường đẩy lùi mọi nguy hiểm sắp xảy ra xung quanh người đeo."],
  ["Bảo bối 'Bộ bài tây biến ước mơ thành sự thật' có lá bài nào nguy hiểm nhất?", "Lá bài Joker (Thằng hề)", ["Lá bài Át bích", "Lá bài K cơ", "Lá bài Q bích"], "Lá bài Joker khi rút phải sẽ mang đến một thảm họa xui xẻo tột độ cho người giữ bộ bài."],
  ["Trong tập 'Nobita và binh đoàn người máy', chỉ huy của robot khổng lồ Santa Claus tên thật là gì?", "Zanda Claus (Judo)", ["Gundam", "Optimus", "Titan"], "Robot khổng lồ rơi từ trên trời xuống sân bóng thực chất là vũ khí chiến tranh Zanda Claus của Mechatopia."],
  ["Bảo bối 'Gậy làm ảo ảnh' giúp tạo ra điều gì?", "Hình ảnh giả 3D sống động như thật đánh lừa thị giác", ["Bản sao người máy", "Cổng dịch chuyển", "Màn sương mù"], "Chiếu ra các hình ảnh ảo giác 3 chiều sống động để ngụy trang."],
  ["Trong phim 'Nobita và hòn đảo diệu kỳ', sinh vật thời tiền sử hình chim khổng lồ là loài chim gì?", "Chim Moa / Dodo", ["Đại bàng khổng lồ", "Thằn lằn bay Pteranodon", "Chim cánh cụt hoàng đế"], "Hòn đảo bảo tồn các loài động vật tiền sử đã tuyệt chủng trên Trái Đất như chim Dodo, thú Moa, hổ răng kiếm."],
  ["Nobita có nhóm máu gì theo tài liệu chính thức của tác giả?", "Nhóm máu O", ["Nhóm máu A", "Nhóm máu B", "Nhóm máu AB"], "Nobita mang nhóm máu O đặc trưng cho tính cách vô tư, giàu lòng trắc ẩn."],
  ["Doraemon nặng bao nhiêu kilogram theo các thông số tiêu chuẩn 129.3?", "129,3 kg", ["80 kg", "100 kg", "150 kg"], "Toàn bộ thông số của Doraemon đều gắn với con số 129.3: cao 129.3 cm, nặng 129.3 kg, vòng ngực 129.3 cm."],
  ["Doraemon có thể nhảy cao bao nhiêu centimet khi bị chuột dọa phát hoảng?", "129,3 cm", ["50 cm", "200 cm", "300 cm"], "Khi nhìn thấy chuột, Doraemon có thể nhảy vọt lên cao tới 129,3 cm."],
  ["Bảo bối 'Huy hiệu kiểm tra nói dối' hoạt động thế nào?", "Kêu bíp bíp và giật điện nhẹ khi người đối diện nói dối", ["Đổi màu đỏ", "Phát sáng", "Tự động ghi âm"], "Giúp nhận biết lời nói thật hay nói dối tức thì."],
  ["Nobita từng dùng bảo bối gì để biến ngày Tết thành mùa hè oi bức?", "Lịch đảo ngược thời tiết", ["Máy tạo bão", "Mặt trời nhân tạo", "Đèn sưởi vũ trụ"], "Chiếc máy điều hòa khí hậu toàn cầu mini."],
  ["Bảo bối 'Khăn tàng hình siêu cấp' có xuất xứ từ nền văn minh cổ tích nào?", "Thần thoại phương Tây", ["Thần thoại Nhật Bản", "Nghìn lẻ một đêm", "Truyện cổ Andersen"], "Chiếc khăn trùm lên người biến người sử dụng thành vô hình hoàn toàn."],
  ["Jaian tên thật trong khai sinh tiếng Nhật là gì?", "Takeshi Gōda", ["Suneo Honekawa", "Hidetoshi Dekisugi", "Nobisuke Nobi"], "Tên thật của Jaian là Takeshi Gōda, cậu có biệt danh là Jaian (Giant - người khổng lồ)."],
  ["Suneo có năng khiếu nghệ thuật cá nhân nào mà cậu rất tự hào?", "Thiết kế thời trang và lắp ráp mô hình", ["Chơi đàn violon", "Nấu ăn", "Làm gốm"], "Suneo rất khéo tay trong việc may vá thiết kế quần áo búp bê và lắp ráp tàu xe mô hình tinh xảo."],
  ["Mẹ của Nobita thường xuyên cằn nhằn về điểm số nào của cậu?", "Điểm 0 bài kiểm tra môn Toán", ["Điểm 1 môn Văn", "Điểm 2 môn Lịch sử", "Điểm 3 môn Thể dục"], "Điểm 0 tròn trĩnh môn Toán là 'đặc sản' quen thuộc của Nobita khiến mẹ cậu thường xuyên nổi giận."],
  ["Nobita từng giấu các bài kiểm tra điểm 0 ở những đâu trong phòng?", "Dưới gầm sàn nhà, trong kẹt tủ và sau giá sách", ["Trong thùng rác ngoài phố", "Chôn ngoài công viên", "Ném xuống sông"], "Cậu luôn tìm đủ mọi xó xỉnh hiểm hóc nhất trong nhà để giấu các bài thi điểm 0."],
  ["Bảo bối 'Tên lửa cứu hộ' mini có nhiệm vụ gì?", "Tự động bay đến đón người gặp nạn đưa về nhà an toàn", ["Bắn phá chướng ngại vật", "Phóng pháo hoa", "Chữa cháy"], "Khi gặp nguy hiểm, bấm nút là tên lửa tự tìm tới và đưa người dùng về nhà."],
  ["Trong tập phim 'Nobita và hiệp sĩ rồng', vương quốc loài rồng thực chất nằm ở đâu?", "Trong lòng đất sâu dưới Trái Đất", ["Dưới đáy biển Thái Bình Dương", "Trên một hành tinh khác", "Bên trong một ngọn núi lửa"], "Loài khủng long không tuyệt chủng mà di cư xuống lòng đất sâu xây dựng nền văn minh ngầm rực rỡ."],
  ["Bảo bối 'Ống kính tạo động đất mini' dùng để làm gì?", "Rung lắc một khu vực nhỏ có chọn lọc", ["Phá hủy tòa nhà", "Đào giếng nước", "Bắn sóng xung kích"], "Tạo ra rung chấn cục bộ để trừng phạt kẻ xấu."],
  ["Bảo bối 'Hộp chuyển nhà siêu tốc' giúp chuyển đồ đạc thế nào?", "Hút toàn bộ đồ đạc vào hộp và nhả ra ở nhà mới trong 1 giây", ["Gói đồ vào bóng bay", "Đốt đồ thành tro rồi phục hồi", "Bằng băng chuyền không gian"], "Đóng gói toàn bộ căn nhà vào hộp và chuyển đến vị trí mới tức thì."],
  ["Sinh nhật của Nobita là ngày tháng nào trong năm?", "Ngày 7 tháng 8", ["Ngày 3 tháng 9", "Ngày 1 tháng 1", "Ngày 5 tháng 5"], "Nobita sinh vào ngày 7 tháng 8, thuộc cung Sư Tử."],
  ["Shizuka sinh vào tháng mấy trong năm?", "Tháng 5 (Ngày 8/5)", ["Tháng 1", "Tháng 8", "Tháng 12"], "Shizuka sinh ngày 8 tháng 5, thuộc cung Kim Ngưu hiền dịu."],
  ["Jaian sinh vào ngày tháng nào?", "Ngày 15 tháng 6", ["Ngày 1 tháng 1", "Ngày 10 tháng 10", "Ngày 25 tháng 12"], "Jaian sinh ngày 15 tháng 6, thuộc cung Song Tử."],
  ["Suneo sinh vào ngày tháng nào?", "Ngày 29 tháng 2", ["Ngày 1 tháng 4", "Ngày 15 tháng 8", "Ngày 30 tháng 11"], "Suneo sinh ngày 29 tháng 2 (năm nhuận), tính cách lanh lợi."],
  ["Doraemon cao bao nhiêu theo thiết kế chuẩn của xưởng sản xuất?", "129,3 cm", ["100 cm", "140 cm", "120 cm"], "Chiều cao chuẩn 129.3 cm giúp Doraemon đứng vừa tầm mắt của các bạn nhỏ."],
  ["Bảo bối 'Máy sản xuất mây' hoạt động bằng nguyên liệu gì?", "Nước lã và bột tạo màu", ["Khói bếp", "Không khí lỏng", "Bông gòn"], "Cho nước vào bình là máy sẽ tạo ra vô số đám mây bồng bềnh đủ màu sắc."],
  ["Trong tập 'Nobita ở xứ sở Ba Tư', chiếc thảm bay thần kỳ bay được nhờ cơ chế gì?", "Trường phản trọng lực từ sợi dệt tương lai", ["Động cơ phản lực giấu kín", "Phép thuật ma thuật", "Khí heli bên trong"], "Các sợi chỉ công nghệ cao từ thế kỷ 22 tạo lực nâng phản trọng lực êm ái."],
  ["Bảo bối nào giúp người dùng lặn dưới nước mà không cần bình dưỡng khí và không bị ướt áo quần?", "Sợi dây thừng lặn biển / Thuốc mọc mang cá", ["Áo phao ma thuật", "Mũ bảo hiểm nước", "Bộ đồ lặn nano"], "Chỉ cần xịt thuốc hoặc mang sợi dây bảo hộ là có thể thở tự nhiên và cơ thể hoàn toàn khô ráo."],
  ["Bộ phim hoạt hình dài Doraemon đầu tiên ra rạp vào năm nào?", "Năm 1980 (Nobita và chú khủng long lạc loài)", ["Năm 1970", "Năm 1990", "Năm 2000"], "Bộ phim điện ảnh đầu tiên ra mắt khán giả vào năm 1980 mở màn cho loạt phim chiếu rạp kỷ lục hàng năm."]
];

console.log('Generating complete sets...');

// Gộp 100 câu Doraemon
const DORAEMON_ALL_100 = [...DORAEMON_NEW_RAW, ...DORAEMON_MORE].slice(0, 100).map((item, idx) => {
  return createQuestion(
    "Doraemon",
    item[0],
    item[1],
    item[2],
    item[3],
    idx % 3 === 0 ? "easy" : idx % 3 === 1 ? "medium" : "hard",
    "MULTIPLE_CHOICE",
    {
      id: `q-doraemon-exp-${idx + 1}`,
      image_url: "https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg"
    }
  );
});

console.log(`Đã tạo thành công ${DORAEMON_ALL_100.length} câu hỏi Doraemon mới!`);

module.exports = { DORAEMON_ALL_100, createQuestion };

