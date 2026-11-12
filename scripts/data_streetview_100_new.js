 // 100 ĐỊA ĐIỂM GOOGLE MAP 360° STREET VIEW TOÀN CẦU MỚI (PHONG CÁCH GEOGUESSR)
// Tất cả các đáp án đều thuộc CÙNG MỘT KHU VỰC ĐỊA LÝ để tăng độ khó và tính thách thức
// TUYỆT ĐỐI KHÔNG CÓ DẤU NGOẶC CHÚ THÍCH () TRONG CÁC ĐÁP ÁN

const STREETVIEW_100_NEW = [
  // --- 1. ĐÔNG NAM Á (SOUTHEAST ASIA) ---
  {
    city: "Siem Reap",
    landmark: "Quần thể đền cổ Angkor Wat",
    country: "Campuchia",
    lat: 13.4125,
    lng: 103.8670,
    options: ["Campuchia", "Lào", "Thái Lan", "Myanmar"],
    explanation: "Đây là kỳ quan Angkor Wat tại Siem Reap, Campuchia - quần thể di tích tôn giáo lớn nhất thế giới xây bằng đá sa thạch vào thế kỷ 12."
  },
  {
    city: "Luang Prabang",
    landmark: "Phố cổ di sản Wat Xieng Thong",
    country: "Lào",
    lat: 19.8974,
    lng: 102.1432,
    options: ["Lào", "Campuchia", "Thái Lan", "Việt Nam"],
    explanation: "Cố đô Luang Prabang của nước Lào với mái chùa cong nhiều tầng đặc trưng Phật giáo Thượng tọa bộ bên ngã ba sông Mekong và sông Nam Khan."
  },
  {
    city: "Bagan",
    landmark: "Vùng đất vạn tháp cổ Bagan",
    country: "Myanmar",
    lat: 21.1717,
    lng: 94.8585,
    options: ["Myanmar", "Thái Lan", "Lào", "Campuchia"],
    explanation: "Quần thể hơn 2.000 ngôi đền chùa gạch đỏ cổ kính tại Bagan, Myanmar được xây dựng từ thế kỷ 9 đến thế kỷ 13 dọc sông Ayeyarwady."
  },
  {
    city: "Hà Nội",
    landmark: "Hồ Hoàn Kiếm và Tháp Rùa",
    country: "Việt Nam",
    lat: 21.0285,
    lng: 105.8542,
    options: ["Việt Nam", "Lào", "Thái Lan", "Campuchia"],
    explanation: "Trái tim thủ đô Hà Nội, Việt Nam với Hồ Hoàn Kiếm xanh ngắt, Tháp Rùa cổ kính, cầu Thê Húc son đỏ và những hàng cây lộc vừng rủ bóng."
  },
  {
    city: "Hội An",
    landmark: "Phố cổ Hội An và Chùa Cầu",
    country: "Việt Nam",
    lat: 15.8776,
    lng: 108.3262,
    options: ["Việt Nam", "Đài Loan", "Philippines", "Thái Lan"],
    explanation: "Đô thị cổ Hội An thuộc tỉnh Quảng Nam, Việt Nam - thương cảng quốc tế sầm uất thế kỷ 17 với những dãy nhà tường vàng mái ngói âm dương rực rỡ đèn lồng."
  },
  {
    city: "Bali",
    landmark: "Đền nước thiêng Ulun Danu Beratan",
    country: "Indonesia",
    lat: -8.2752,
    lng: 115.1668,
    options: ["Indonesia", "Malaysia", "Philippines", "Thái Lan"],
    explanation: "Ngôi đền Hindu giáo Ulun Danu nổi tiếng nằm trên hồ núi lửa Beratan tại đảo thiên đường Bali, Indonesia với cổng Candi Bentar truyền thống."
  },
  {
    city: "Bandar Seri Begawan",
    landmark: "Nhà thờ Hồi giáo Sultan Omar Ali Saifuddien",
    country: "Brunei",
    lat: 4.8897,
    lng: 114.9398,
    options: ["Brunei", "Malaysia", "Indonesia", "Singapore"],
    explanation: "Thánh đường Hồi giáo dát vàng rực rỡ Omar Ali Saifuddien tại thủ đô Bandar Seri Begawan của quốc vương Brunei soi bóng bên đầm nước nhân tạo."
  },
  {
    city: "Penang",
    landmark: "Phố bích họa George Town",
    country: "Malaysia",
    lat: 5.4164,
    lng: 100.3327,
    options: ["Malaysia", "Singapore", "Thái Lan", "Indonesia"],
    explanation: "Khu phố cổ George Town trên đảo Penang, Malaysia nổi tiếng với những bức tranh bích họa 3D đường phố kết hợp xe máy và xe đạp của Ernest Zacharevic."
  },
  {
    city: "Chiang Mai",
    landmark: "Chùa cổ Wat Phra Singh",
    country: "Thái Lan",
    lat: 18.7885,
    lng: 98.9817,
    options: ["Thái Lan", "Myanmar", "Lào", "Campuchia"],
    explanation: "Ngôi chùa hoàng gia Wat Phra Singh cổ kính tại 'đóa hồng phương Bắc' Chiang Mai, Thái Lan với kiến trúc Phật giáo Lanna mạ vàng tinh xảo."
  },
  {
    city: "Cebu",
    landmark: "Thập tự giá Magellan và Pháo đài San Pedro",
    country: "Philippines",
    lat: 10.2936,
    lng: 123.9019,
    options: ["Philippines", "Indonesia", "Đông Timor", "Malaysia"],
    explanation: "Thành phố lịch sử Cebu tại Philippines nơi nhà thám hiểm Ferdinand Magellan cập bến năm 1521 và dựng cây thánh giá đầu tiên tại châu Á."
  },

  // --- 2. ĐÔNG Á & TRUNG Á (EAST & CENTRAL ASIA) ---
  {
    city: "Kyoto",
    landmark: "Đền Fushimi Inari-taisha với ngàn cổng Torii",
    country: "Nhật Bản",
    lat: 34.9671,
    lng: 135.7727,
    options: ["Nhật Bản", "Hàn Quốc", "Đài Loan", "Trung Quốc"],
    explanation: "Hơn 10.000 cổng Torii màu đỏ son xếp san sát uốn lượn quanh núi Inari tại cố đô Kyoto, Nhật Bản - ngôi đền Thần Đạo thờ thần lúa gạo Inari."
  },
  {
    city: "Osaka",
    landmark: "Phố ẩm thực Dotonbori và biển hiệu Glico Man",
    country: "Nhật Bản",
    lat: 34.6687,
    lng: 135.5013,
    options: ["Nhật Bản", "Hàn Quốc", "Đài Loan", "Singapore"],
    explanation: "Giao lộ sầm uất Dotonbori tại thành phố Osaka, Nhật Bản với biển quảng cáo vận động viên Glico Man khổng lồ và ẩm thực đường phố Takoyaki."
  },
  {
    city: "Busan",
    landmark: "Làng văn hóa bích họa Gamcheon",
    country: "Hàn Quốc",
    lat: 35.0975,
    lng: 129.0106,
    options: ["Hàn Quốc", "Nhật Bản", "Đài Loan", "Mông Cổ"],
    explanation: "Làng bích họa Gamcheon rực rỡ sắc màu xếp tầng bậc trên sườn đồi nhìn ra cảng biển tại thành phố cảng Busan, Hàn Quốc."
  },
  {
    city: "Jeju",
    landmark: "Đỉnh núi lửa Seongsan Ilchulbong",
    country: "Hàn Quốc",
    lat: 33.4586,
    lng: 126.9426,
    options: ["Hàn Quốc", "Nhật Bản", "Đài Loan", "Trung Quốc"],
    explanation: "Đỉnh núi lửa hình lòng chảo Seongsan Ilchulbong (Đỉnh Nhật Xuất) nhô ra biển Đông tại đảo ngọc Jeju, Hàn Quốc."
  },
  {
    city: "Đài Bắc",
    landmark: "Tòa tháp biểu tượng chọc trời Taipei 101",
    country: "Đài Loan",
    lat: 25.0339,
    lng: 121.5645,
    options: ["Đài Loan", "Nhật Bản", "Hàn Quốc", "Singapore"],
    explanation: "Tháp Taipei 101 tại Đài Bắc, Đài Loan với thiết kế mô phỏng từng đốt cây tre vươn cao, từng là tòa nhà cao nhất thế giới từ năm 2004 đến 2010."
  },
  {
    city: "Cửu Phần",
    landmark: "Phố cổ treo đèn lồng Jiufen",
    country: "Đài Loan",
    lat: 25.1099,
    lng: 121.8452,
    options: ["Đài Loan", "Nhật Bản", "Hàn Quốc", "Hồng Kông"],
    explanation: "Làng cổ Jiufen nằm trên sườn núi nhìn ra biển tại Đài Loan với những bậc thang dốc và hàng lồng đèn đỏ nguồn cảm hứng cho phim Spirited Away."
  },
  {
    city: "Ulaanbaatar",
    landmark: "Quảng trường Sukhbaatar và Tượng Thành Cát Tư Hãn",
    country: "Mông Cổ",
    lat: 47.9188,
    lng: 106.9176,
    options: ["Mông Cổ", "Kazakhstan", "Kyrgyzstan", "Nga"],
    explanation: "Quảng trường trung tâm Sukhbaatar tại thủ đô Ulaanbaatar, Mông Cổ với tượng cưỡi ngựa dũng mãnh và chữ viết Cyrillic tiếng Mông Cổ."
  },
  {
    city: "Almaty",
    landmark: "Nhà thờ chính tòa Chúa Ba Ngôi Zenkov bằng gỗ",
    country: "Kazakhstan",
    lat: 43.2589,
    lng: 76.9535,
    options: ["Kazakhstan", "Uzbekistan", "Kyrgyzstan", "Tajikistan"],
    explanation: "Nhà thờ Chính thống giáo Zenkov tại công viên Panfilov ở Almaty, Kazakhstan - kiệt tác xây hoàn toàn bằng gỗ không dùng một cây đinh nào."
  },
  {
    city: "Samarkand",
    landmark: "Quảng trường vĩ đại Registan trên Con đường Tơ lụa",
    country: "Uzbekistan",
    lat: 39.6548,
    lng: 66.9757,
    options: ["Uzbekistan", "Kazakhstan", "Turkmenistan", "Tajikistan"],
    explanation: "Quảng trường Registan tại Samarkand, Uzbekistan - trái tim cổ kính của Con đường Tơ lụa với ba tu viện Hồi giáo Madrasah khảm gạch men xanh ngọc lộng lẫy."
  },
  {
    city: "Bishkek",
    landmark: "Quảng trường Ala-Too và rặng núi tuyết Thiên Sơn",
    country: "Kyrgyzstan",
    lat: 42.8765,
    lng: 74.6037,
    options: ["Kyrgyzstan", "Kazakhstan", "Tajikistan", "Uzbekistan"],
    explanation: "Quảng trường Ala-Too tại thủ đô Bishkek, Kyrgyzstan với phông nền là những đỉnh núi tuyết trùng điệp của rặng Thiên Sơn (Tian Shan)."
  },
  {
    city: "Baku",
    landmark: "Cụm ba tòa tháp hình ngọn lửa Flame Towers",
    country: "Azerbaijan",
    lat: 40.3595,
    lng: 49.8277,
    options: ["Azerbaijan", "Georgia", "Armenia", "Thổ Nhĩ Kỳ"],
    explanation: "Flame Towers sừng sững bên bờ biển Caspi tại thủ đô Baku, Azerbaijan - tượng trưng cho 'vùng đất của lửa' vĩnh cửu và trữ lượng dầu mỏ phong phú."
  },
  {
    city: "Tbilisi",
    landmark: "Phố cổ Tbilisi và Pháo đài Narikala trên vách đá",
    country: "Georgia",
    lat: 41.6881,
    lng: 44.8087,
    options: ["Georgia", "Armenia", "Azerbaijan", "Thổ Nhĩ Kỳ"],
    explanation: "Cảnh sắc thơ mộng bên dòng sông Kura tại thủ đô Tbilisi, Georgia với những ban công gỗ uốn lượn và chữ viết chữ tròn độc nhất vô nhị tiếng Gruzia."
  },
  {
    city: "Yerevan",
    landmark: "Bậc thang nghệ thuật Cascade nhìn về núi Ararat",
    country: "Armenia",
    lat: 40.1911,
    lng: 44.5156,
    options: ["Armenia", "Georgia", "Azerbaijan", "Iran"],
    explanation: "Khu phức hợp điêu khắc Cascade bằng đá vôi trắng tại thủ đô Yerevan, Armenia với tầm nhìn hướng thẳng về ngọn núi thánh tuyết phủ Ararat."
  },

  // --- 3. NAM Á & TRUNG ĐÔNG (SOUTH ASIA & MIDDLE EAST) ---
  {
    city: "Agra",
    landmark: "Lăng mộ cẩm thạch trắng Taj Mahal",
    country: "Ấn Độ",
    lat: 27.1751,
    lng: 78.0421,
    options: ["Ấn Độ", "Pakistan", "Bangladesh", "Nepal"],
    explanation: "Lăng mộ Taj Mahal bên bờ sông Yamuna ở Agra, Ấn Độ - biểu tượng tình yêu vĩnh cửu do Hoàng đế Mughal Shah Jahan xây dựng cho hoàng hậu quá cố."
  },
  {
    city: "Jaipur",
    landmark: "Cung điện Gió Hawa Mahal với hàng trăm ô cửa sổ",
    country: "Ấn Độ",
    lat: 26.9239,
    lng: 75.8267,
    options: ["Ấn Độ", "Nepal", "Sri Lanka", "Pakistan"],
    explanation: "Cung điện Hawa Mahal màu hồng đỏ tại 'Thành phố hồng' Jaipur, Ấn Độ được xây từ đá sa thạch với 953 ô cửa sổ đón gió tinh xảo."
  },
  {
    city: "Mumbai",
    landmark: "Khải Hoàn Môn Gateway of India bên vịnh biển",
    country: "Ấn Độ",
    lat: 18.9220,
    lng: 72.8347,
    options: ["Ấn Độ", "Pakistan", "Bangladesh", "Sri Lanka"],
    explanation: "Cổng vòm đá đồ sộ Gateway of India bên bờ biển Ả Rập tại Mumbai, Ấn Độ - công trình đón tàu viễn dương xây dựng dưới thời thuộc địa Anh."
  },
  {
    city: "Galle",
    landmark: "Pháo đài cổ Hà Lan và ngọn hải đăng trắng",
    country: "Sri Lanka",
    lat: 6.0267,
    lng: 80.2170,
    options: ["Sri Lanka", "Ấn Độ", "Maldives", "Bangladesh"],
    explanation: "Pháo đài cổ Galle bên bờ Ấn Độ Dương tại miền nam Sri Lanka do người Bồ Đào Nha và Hà Lan xây dựng từ thế kỷ 16 với ngọn hải đăng trắng đặc trưng."
  },
  {
    city: "Lahore",
    landmark: "Thánh đường Badshahi dát đá đỏ lộng lẫy",
    country: "Pakistan",
    lat: 31.5882,
    lng: 74.3106,
    options: ["Pakistan", "Ấn Độ", "Afghanistan", "Iran"],
    explanation: "Đại thánh đường Badshahi xây bằng đá sa thạch đỏ tại Lahore, Pakistan - một trong những biểu tượng rực rỡ nhất thời kỳ đế chế Mughal."
  },
  {
    city: "Thimphu",
    landmark: "Tượng Phật Dordenma khổng lồ trên đỉnh núi",
    country: "Bhutan",
    lat: 27.4435,
    lng: 89.6386,
    options: ["Bhutan", "Nepal", "Ấn Độ", "Myanmar"],
    explanation: "Đại tượng Phật Dordenma bằng đồng mạ vàng cao 51 mét nhìn xuống thung lũng thủ đô Thimphu tại vương quốc hạnh phúc Bhutan trên dãy Himalaya."
  },
  {
    city: "Abu Dhabi",
    landmark: "Đại thánh đường Hồi giáo Sheikh Zayed trắng tinh khiết",
    country: "UAE",
    lat: 24.4128,
    lng: 54.4749,
    options: ["UAE", "Qatar", "Ả Rập Xê Út", "Oman"],
    explanation: "Thánh đường Sheikh Zayed Grand Mosque tại Abu Dhabi, UAE - kỳ quan đá cẩm thạch trắng muốt với 82 mái vòm và chiếc thảm len dệt tay lớn nhất hành tinh."
  },
  {
    city: "Doha",
    landmark: "Chợ truyền thống Souq Waqif và vịnh Corniche",
    country: "Qatar",
    lat: 25.2867,
    lng: 51.5333,
    options: ["Qatar", "Bahrain", "UAE", "Kuwait"],
    explanation: "Khu chợ cổ sầm uất Souq Waqif tại thủ đô Doha, Qatar với kiến trúc tường bùn rơm cổ truyền đối lập với rừng tháp chọc trời vịnh Corniche."
  },
  {
    city: "Manama",
    landmark: "Tòa tháp đôi Trung tâm Thương mại Thế giới Bahrain",
    country: "Bahrain",
    lat: 26.2399,
    lng: 50.5824,
    options: ["Bahrain", "Qatar", "Kuwait", "Ả Rập Xê Út"],
    explanation: "Tòa tháp đôi hình cánh buồm kết hợp ba tuabin gió khổng lồ ở giữa tại thủ đô Manama của quốc đảo vùng Vịnh Bahrain."
  },
  {
    city: "Riyadh",
    landmark: "Tòa tháp Kingdom Centre với cây cầu trên không",
    country: "Ả Rập Xê Út",
    lat: 24.7114,
    lng: 46.6744,
    options: ["Ả Rập Xê Út", "UAE", "Qatar", "Jordan"],
    explanation: "Tòa tháp Kingdom Centre 99 tầng có hình dáng chiếc mở nút chai độc đáo với đài quan sát Sky Bridge tại thủ đô Riyadh, Ả Rập Xê Út."
  },
  {
    city: "Muscat",
    landmark: "Cung điện Al Alam và pháo đài Mirani bên vách núi",
    country: "Oman",
    lat: 23.6158,
    lng: 58.5947,
    options: ["Oman", "Yemen", "UAE", "Ả Rập Xê Út"],
    explanation: "Cung điện Al Alam của Quốc vương Sultan tại thủ đô Muscat, Oman với các cột màu xanh lam vàng rực rỡ nép mình bên dãy núi đá Al Hajar."
  },
  {
    city: "Petra",
    landmark: "Hẻm núi Siq và Đền Kho báu Al-Khazneh tạc vào vách đá",
    country: "Jordan",
    lat: 30.3285,
    lng: 35.4444,
    options: ["Jordan", "Israel", "Ai Cập", "Li-băng"],
    explanation: "Thành phố cổ Petra màu hồng sa thạch tại Jordan do người Nabataean đục đẽo trực tiếp vào lòng núi đá từ thế kỷ 1 trước Công nguyên."
  },
  {
    city: "Kuwait City",
    landmark: "Bộ ba tháp nước hình quả cầu Kuwait Towers",
    country: "Kuwait",
    lat: 29.3897,
    lng: 48.0033,
    options: ["Kuwait", "Bahrain", "Qatar", "Ả Rập Xê Út"],
    explanation: "Ba ngọn tháp nhọn Kuwait Towers soi bóng bên vịnh Ả Rập tại thủ đô Kuwait City với các quả cầu ốp hàng chục ngàn viên đĩa thép xanh ngọc bích."
  },

  // --- 4. TÂY ÂU & NAM ÂU (WESTERN & SOUTHERN EUROPE) ---
  {
    city: "Barcelona",
    landmark: "Vương cung thánh đường Sagrada Família của Antoni Gaudí",
    country: "Tây Ban Nha",
    lat: 41.4036,
    lng: 2.1744,
    options: ["Tây Ban Nha", "Bồ Đào Nha", "Pháp", "Ý"],
    explanation: "Kiệt tác kiến trúc Sagrada Família đang xây dựng dở dang hơn 140 năm của đại danh họa Antoni Gaudí tại Barcelona, xứ Catalonia, Tây Ban Nha."
  },
  {
    city: "Seville",
    landmark: "Quảng trường Plaza de España hình bán nguyệt lộng lẫy",
    country: "Tây Ban Nha",
    lat: 37.3772,
    lng: -5.9869,
    options: ["Tây Ban Nha", "Bồ Đào Nha", "Ý", "Hy Lạp"],
    explanation: "Quảng trường Plaza de España tại Seville, miền nam Tây Ban Nha với gạch men gốm Azulejo đại diện cho 48 tỉnh thành và con kênh nhỏ uốn lượn."
  },
  {
    city: "Porto",
    landmark: "Cầu sắt hai tầng Dom Luis I bắc qua sông Douro",
    country: "Bồ Đào Nha",
    lat: 41.1405,
    lng: -8.6095,
    options: ["Bồ Đào Nha", "Tây Ban Nha", "Pháp", "Ý"],
    explanation: "Cây cầu vòm kim loại Dom Luis I nối hai bờ sông Douro tại thành phố Porto, Bồ Đào Nha do học trò của Gustave Eiffel thiết kế năm 1886."
  },
  {
    city: "Venice",
    landmark: "Kênh đào Grand Canal và Cầu Rialto",
    country: "Ý",
    lat: 45.4380,
    lng: 12.3359,
    options: ["Ý", "Croatia", "Slovenia", "Hy Lạp"],
    explanation: "Thành phố kênh đào Venice huyền thoại của nước Ý với những chiếc thuyền Gondola truyền thống xuôi ngược dưới chân cầu đá cổ Rialto."
  },
  {
    city: "Florence",
    landmark: "Nhà thờ chính tòa Duomo Santa Maria del Fiore",
    country: "Ý",
    lat: 43.7731,
    lng: 11.2559,
    options: ["Ý", "Tây Ban Nha", "Pháp", "Thụy Sĩ"],
    explanation: "Mái vòm gạch đỏ đồ sộ do Brunelleschi thiết kế tại nhà thờ Duomo ở cái nôi phong trào Phục Hưng Florence, vùng Tuscany, nước Ý."
  },
  {
    city: "Milan",
    landmark: "Thánh đường phong cách Gothic Duomo di Milano",
    country: "Ý",
    lat: 45.4642,
    lng: 9.1919,
    options: ["Ý", "Thụy Sĩ", "Áo", "Pháp"],
    explanation: "Đại giáo đường Milan bằng đá cẩm thạch trắng hồng với 135 chóp nhọn phong cách Gothic tại kinh đô thời trang Milan, miền bắc nước Ý."
  },
  {
    city: "Valletta",
    landmark: "Khu vườn Upper Barrakka Gardens nhìn ra Đại Cảng",
    country: "Malta",
    lat: 35.8953,
    lng: 14.5126,
    options: ["Malta", "Ý", "Hy Lạp", "Síp"],
    explanation: "Vọng cảnh nhìn ra Grand Harbour từ pháo đài đá vôi vàng rực rỡ tại thủ đô Valletta của quốc đảo hiệp sĩ Malta giữa Địa Trung Hải."
  },
  {
    city: "Monaco",
    landmark: "Sòng bạc hoàng gia Casino de Monte-Carlo",
    country: "Monaco",
    lat: 43.7392,
    lng: 7.4282,
    options: ["Monaco", "Pháp", "Ý", "Thụy Sĩ"],
    explanation: "Quảng trường Casino de Monte-Carlo tại công quốc Monaco xa hoa bên bờ biển Riviera với siêu xe thể thao và cung đường đua F1 đường phố."
  },
  {
    city: "Nice",
    landmark: "Đại lộ bờ biển Promenade des Anglais bên vịnh Thiên Thần",
    country: "Pháp",
    lat: 43.6953,
    lng: 7.2656,
    options: ["Pháp", "Ý", "Tây Ban Nha", "Monaco"],
    explanation: "Bờ biển Côte d'Azur nước xanh ngọc lam và hàng cọ dài ngút ngàn dọc đại lộ Promenade des Anglais tại thành phố Nice, miền nam nước Pháp."
  },
  {
    city: "Lyon",
    landmark: "Vương cung thánh đường Notre-Dame de Fourviere",
    country: "Pháp",
    lat: 45.7622,
    lng: 4.8223,
    options: ["Pháp", "Bỉ", "Thụy Sĩ", "Đức"],
    explanation: "Đỉnh đồi Fourviere nhìn xuống ngã ba hai dòng sông Saone và Rhone tại kinh đô ẩm thực Lyon, miền đông nam nước Pháp."
  },
  {
    city: "Brussels",
    landmark: "Quảng trường Lớn Grand Place dát vàng",
    country: "Bỉ",
    lat: 50.8467,
    lng: 4.3524,
    options: ["Bỉ", "Hà Lan", "Luxembourg", "Pháp"],
    explanation: "Quảng trường trung tâm Grand Place tại thủ đô Brussels, Bỉ được Victor Hugo ca ngợi là 'quảng trường đẹp nhất thế giới' với tòa thị chính Gothic lộng lẫy."
  },
  {
    city: "Bruges",
    landmark: "Kênh đào và tháp chuông cổ Belfort tại Bruges",
    country: "Bỉ",
    lat: 51.2089,
    lng: 3.2242,
    options: ["Bỉ", "Hà Lan", "Pháp", "Đức"],
    explanation: "Thành phố Trung cổ Bruges được ví như 'Venice phương Bắc' của nước Bỉ với các ngôi nhà gạch đỏ soi bóng bên dòng kênh đào thiên nga êm đềm."
  },
  {
    city: "Luxembourg",
    landmark: "Pháo đài cổ Casemates du Bock bên thung lũng sông Alzette",
    country: "Luxembourg",
    lat: 49.6116,
    lng: 6.1364,
    options: ["Luxembourg", "Bỉ", "Đức", "Pháp"],
    explanation: "Hệ thống pháo đài ngầm khoét sâu vào vách núi Bock cheo leo tại thủ đô của Đại Công quốc Luxembourg giữa lòng Tây Âu."
  },
  {
    city: "Rotterdam",
    landmark: "Cầu dây văng Erasmusbrug và nhà hình khối lập phương Cube Houses",
    country: "Hà Lan",
    lat: 51.9200,
    lng: 4.4900,
    options: ["Hà Lan", "Bỉ", "Đức", "Đan Mạch"],
    explanation: "Khu nhà độc lạ hình khối nghiêng 45 độ Cube Houses của kiến trúc sư Piet Blom tại thành phố cảng Rotterdam, Hà Lan."
  },
  {
    city: "Geneva",
    landmark: "Vòi phun nước khổng lồ Jet d'Eau trên hồ Geneva",
    country: "Thụy Sĩ",
    lat: 46.2074,
    lng: 6.1559,
    options: ["Thụy Sĩ", "Pháp", "Ý", "Áo"],
    explanation: "Cột nước Jet d'Eau phun cao 140 mét sừng sững trên hồ Léman (hồ Geneva) tại Geneva, Thụy Sĩ - thành phố của hòa bình và trụ sở Liên Hợp Quốc."
  },
  {
    city: "Zurich",
    landmark: "Nhà thờ đôi Grossmunster bên bờ sông Limmat",
    country: "Thụy Sĩ",
    lat: 47.3703,
    lng: 8.5441,
    options: ["Thụy Sĩ", "Áo", "Đức", "Liechtenstein"],
    explanation: "Hai tòa tháp song sinh của giáo đường Grossmunster cổ kính soi bóng trên sông Limmat tại trung tâm tài chính Zurich, Thụy Sĩ."
  },
  {
    city: "Vaduz",
    landmark: "Lâu đài cổ Vaduz Castle nhìn xuống thung lũng sông Rhine",
    country: "Liechtenstein",
    lat: 47.1396,
    lng: 9.5244,
    options: ["Liechtenstein", "Thụy Sĩ", "Áo", "Đức"],
    explanation: "Lâu đài Vaduz ngự trên vách núi cao nhìn xuống thung lũng sông Rhine - nơi ở chính thức của Hoàng tử trị vì công quốc tí hon Liechtenstein."
  },
  {
    city: "Salzburg",
    landmark: "Pháo đài kiên cố Hohensalzburg trên đỉnh núi",
    country: "Áo",
    lat: 47.7950,
    lng: 13.0478,
    options: ["Áo", "Đức", "Thụy Sĩ", "Cộng hòa Séc"],
    explanation: "Pháo đài đá trắng Hohensalzburg sừng sững trên ngọn đồi Festungsberg tại Salzburg, nước Áo - quê hương của thiên tài âm nhạc Mozart."
  },
  {
    city: "Munich",
    landmark: "Tòa thị chính mới Neues Rathaus tại quảng trường Marienplatz",
    country: "Đức",
    lat: 48.1374,
    lng: 11.5755,
    options: ["Đức", "Áo", "Thụy Sĩ", "Cộng hòa Séc"],
    explanation: "Tòa thị chính Neues Rathaus mang kiến trúc Gothic phục hưng với tháp chuông đồng hồ Glockenspiel tại quảng trường Marienplatz ở Munich, bang Bavaria, Đức."
  },
  {
    city: "Hamburg",
    landmark: "Nhà hát thính phòng hình cánh buồm Elbphilharmonie",
    country: "Đức",
    lat: 53.5413,
    lng: 9.9841,
    options: ["Đức", "Hà Lan", "Đan Mạch", "Ba Lan"],
    explanation: "Kiệt tác kiến trúc sóng nước thủy tinh Elbphilharmonie mọc lên từ kho gạch đỏ cũ bên sông Elbe tại thành phố cảng Hamburg, miền bắc nước Đức."
  },

  // --- 5. BẮC ÂU & QUẦN ĐẢO ANH (NORTHERN EUROPE & BRITISH ISLES) ---
  {
    city: "Edinburgh",
    landmark: "Lâu đài Edinburgh ngự trên đỉnh núi đá lửa cổ",
    country: "Vương quốc Anh",
    lat: 55.9486,
    lng: -3.1999,
    options: ["Vương quốc Anh", "Ireland", "Na Uy", "Đan Mạch"],
    explanation: "Lâu đài Edinburgh trấn giữ trên mỏm đá Castle Rock tại thủ phủ Edinburgh, vùng Scotland thuộc Vương quốc Anh."
  },
  {
    city: "Dublin",
    landmark: "Khu phố quán bar gạch đỏ sôi động Temple Bar",
    country: "Ireland",
    lat: 53.3454,
    lng: -6.2642,
    options: ["Ireland", "Vương quốc Anh", "Hà Lan", "Đan Mạch"],
    explanation: "Khu phố văn hóa âm nhạc dân gian Temple Bar rực rỡ sắc đỏ hoa tươi tại thủ đô Dublin, Ireland - quê hương của bia đen Guinness trứ danh."
  },
  {
    city: "Reykjavik",
    landmark: "Nhà thờ Hallgrimskirkja mô phỏng cột đá bazan núi lửa",
    country: "Iceland",
    lat: 64.1417,
    lng: -21.9266,
    options: ["Iceland", "Na Uy", "Đan Mạch", "Thụy Điển"],
    explanation: "Kiến trúc độc nhất vô nhị của nhà thờ Hallgrimskirkja tại thủ đô Reykjavik, Iceland lấy cảm hứng từ những cột đá dung nham núi lửa thiên nhiên."
  },
  {
    city: "Bergen",
    landmark: "Dãy nhà kho gỗ cổ Bryggen bên bến cảng",
    country: "Na Uy",
    lat: 60.3976,
    lng: 5.3243,
    options: ["Na Uy", "Thụy Điển", "Đan Mạch", "Phần Lan"],
    explanation: "Khu thương cảng gỗ Bryggen sơn các tông màu đỏ vàng ấm áp từ thời kỳ liên minh Hanseatic tại thành phố vịnh hẹp Bergen, Na Uy."
  },
  {
    city: "Gothenburg",
    landmark: "Quảng trường Gotaplatsen và bức tượng Thần biển Poseidon",
    country: "Thụy Điển",
    lat: 57.6970,
    lng: 11.9795,
    options: ["Thụy Điển", "Na Uy", "Đan Mạch", "Phần Lan"],
    explanation: "Tượng đồng Poseidon dũng mãnh của nhà điêu khắc Carl Milles tại quảng trường trung tâm Gotaplatsen ở thành phố cảng Gothenburg, Thụy Điển."
  },
  {
    city: "Aarhus",
    landmark: "Vòng tròn cầu vồng Your Rainbow Panorama trên mái bảo tàng",
    country: "Đan Mạch",
    lat: 56.1539,
    lng: 10.1997,
    options: ["Đan Mạch", "Thụy Điển", "Đức", "Na Uy"],
    explanation: "Lối đi bộ kính 360 độ ngập tràn sắc màu quang phổ cầu vồng của nghệ sĩ Olafur Eliasson trên nóc bảo tàng ARoS tại thành phố Aarhus, Đan Mạch."
  },
  {
    city: "Rovaniemi",
    landmark: "Làng Santa Claus Village trên Vòng Bắc Cực",
    country: "Phần Lan",
    lat: 66.5436,
    lng: 25.8472,
    options: ["Phần Lan", "Thụy Điển", "Na Uy", "Nga"],
    explanation: "Quê hương chính thức của Ông già Noel nằm ngay trên vĩ tuyến Bắc Cực (Arctic Circle) tại vùng tuyết trắng Lapland, Phần Lan."
  },

  // --- 6. TRUNG & ĐÔNG ÂU (CENTRAL & EASTERN EUROPE) ---
  {
    city: "Budapest",
    landmark: "Tòa nhà Quốc hội Hungary khổng lồ soi bóng bên sông Danube",
    country: "Hungary",
    lat: 47.5071,
    lng: 19.0456,
    options: ["Hungary", "Áo", "Slovakia", "Romania"],
    explanation: "Tòa nhà Quốc hội Hungary nguy nga tráng lệ bậc nhất châu Âu với mái vòm trung tâm cao 96m bên dòng sông xanh Danube tại thủ đô Budapest."
  },
  {
    city: "Bratislava",
    landmark: "Lâu đài Bratislava trắng toát bốn góc tháp",
    country: "Slovakia",
    lat: 48.1422,
    lng: 17.1002,
    options: ["Slovakia", "Cộng hòa Séc", "Áo", "Hungary"],
    explanation: "Lâu đài Bratislava tọa lạc trên ngọn đồi nhìn thẳng ra sông Danube và ngã ba biên giới giáp ranh giữa ba nước Slovakia, Áo và Hungary."
  },
  {
    city: "Krakow",
    landmark: "Quảng trường chợ lớn Rynek Glowny và Nhà thờ Thánh Mary",
    country: "Ba Lan",
    lat: 50.0617,
    lng: 19.9374,
    options: ["Ba Lan", "Cộng hòa Séc", "Slovakia", "Hungary"],
    explanation: "Quảng trường chợ Trung cổ lớn nhất châu Âu Rynek Glowny tại cố đô Krakow, Ba Lan với Chợ Vải Sukiennice tráng lệ."
  },
  {
    city: "Gdansk",
    landmark: "Phố cổ Dlugi Targ và Đài phun nước Sao Hải Vương",
    country: "Ba Lan",
    lat: 54.3486,
    lng: 18.6534,
    options: ["Ba Lan", "Lithuania", "Đức", "Latvia"],
    explanation: "Những ngôi nhà mặt tiền hẹp thanh mảnh rực rỡ sắc màu phong cách Flemish dọc phố Dlugi Targ tại thành phố cảng biển Baltic Gdansk, Ba Lan."
  },
  {
    city: "Tallinn",
    landmark: "Thành cổ Toompea thời Trung cổ nhìn ra vịnh Phần Lan",
    country: "Estonia",
    lat: 59.4370,
    lng: 24.7453,
    options: ["Estonia", "Latvia", "Lithuania", "Phần Lan"],
    explanation: "Khu phố cổ Tallinn nguyên vẹn nhất châu Âu thời Trung Cổ với những tháp pháo mái ngón nhọn đỏ son tại thủ đô Estonia bên bờ biển Baltic."
  },
  {
    city: "Riga",
    landmark: "Tòa nhà House of the Black Heads với gạch đỏ chạm trổ",
    country: "Latvia",
    lat: 56.9475,
    lng: 24.1067,
    options: ["Latvia", "Lithuania", "Estonia", "Ba Lan"],
    explanation: "Ngôi nhà của Hội huynh đệ Đầu Đen (Blackheads) được xây dựng lại nguyên bản tuyệt đẹp tại quảng trường Tòa thị chính Riga, Latvia."
  },
  {
    city: "Vilnius",
    landmark: "Nhà thờ gạch đỏ phong cách Flamboyant Gothic Thánh Anne",
    country: "Lithuania",
    lat: 54.6830,
    lng: 25.2926,
    options: ["Lithuania", "Latvia", "Ba Lan", "Estonia"],
    explanation: "Kiệt tác gạch đỏ Gothic rực lửa St. Anne's Church tại Vilnius, Lithuania được truyền thuyết kể rằng từng khiến Napoleon muốn đặt lên lòng bàn tay mang về Paris."
  },
  {
    city: "Zagreb",
    landmark: "Nhà thờ Thánh Mark với mái ngói hình quốc huy rực rỡ",
    country: "Croatia",
    lat: 45.8163,
    lng: 15.9734,
    options: ["Croatia", "Slovenia", "Serbia", "Bosnia"],
    explanation: "Mái ngói xếp hình quốc huy Croatia, Dalmatia và Slavonia độc nhất vô nhị tại nhà thờ St. Mark ở khu phố cổ thượng Gornji Grad, thủ đô Zagreb, Croatia."
  },
  {
    city: "Dubrovnik",
    landmark: "Bức tường thành đá cổ bao quanh thành phố bên bờ biển Adriatic",
    country: "Croatia",
    lat: 42.6413,
    lng: 18.1100,
    options: ["Croatia", "Montenegro", "Ý", "Hy Lạp"],
    explanation: "Thành cổ Dubrovnik với bức tường thành đá trắng vươn mình ra biển xanh ngọc - phim trường nổi tiếng cho thành King's Landing trong Game of Thrones."
  },
  {
    city: "Split",
    landmark: "Cung điện La Mã cổ đại Diocletian",
    country: "Croatia",
    lat: 43.5081,
    lng: 16.4402,
    options: ["Croatia", "Ý", "Slovenia", "Montenegro"],
    explanation: "Khu phức hợp cung điện cổ đại của Hoàng đế La Mã Diocletian xây dựng từ năm 305 SCN tại trung tâm thành phố cảng Split, Croatia."
  },
  {
    city: "Ljubljana",
    landmark: "Cầu Rồng Zmajski Most và Lâu đài Ljubljana trên đồi",
    country: "Slovenia",
    lat: 46.0514,
    lng: 14.5098,
    options: ["Slovenia", "Croatia", "Áo", "Ý"],
    explanation: "Cây Cầu Rồng với bốn bức tượng rồng xanh hộ vệ bên dòng sông Ljubljanica thơ mộng tại thủ đô Ljubljana xanh ngát của nước Slovenia."
  },
  {
    city: "Bled",
    landmark: "Nhà thờ trên hòn đảo giữa lòng hồ băng xanh ngọc Bled",
    country: "Slovenia",
    lat: 46.3625,
    lng: 14.0936,
    options: ["Slovenia", "Áo", "Ý", "Croatia"],
    explanation: "Hòn đảo tự nhiên duy nhất của Slovenia nằm giữa lòng hồ nước băng tan Bled với nhà thờ Đức Mẹ Hồn Xác Lên Trời và chiếc chuông điều ước 99 bậc thang."
  },
  {
    city: "Sarajevo",
    landmark: "Đài phun nước bằng gỗ Sebilj tại khu chợ cổ Bascarsija",
    country: "Bosnia và Herzegovina",
    lat: 43.8598,
    lng: 18.4313,
    options: ["Bosnia và Herzegovina", "Serbia", "Croatia", "Montenegro"],
    explanation: "Đài phun nước bằng gỗ phong cách Ottoman Sebilj tại trung tâm quảng trường bồ câu Bascarsija ở thủ đô Sarajevo, Bosnia và Herzegovina."
  },
  {
    city: "Belgrade",
    landmark: "Pháo đài cổ Kalemegdan tại ngã ba sông Sava và Danube",
    country: "Serbia",
    lat: 44.8236,
    lng: 20.4503,
    options: ["Serbia", "Croatia", "Hungary", "Romania"],
    explanation: "Pháo đài Kalemegdan sừng sững tại ngã ba nơi sông Sava hòa vào dòng Danube ở thủ đô Belgrade, Serbia - một trong những thành phố có người ở lâu đời nhất châu Âu."
  },
  {
    city: "Bucharest",
    landmark: "Tòa nhà Quốc hội khổng lồ Cung điện Nhân dân",
    country: "Romania",
    lat: 44.4275,
    lng: 26.0874,
    options: ["Romania", "Bulgaria", "Hungary", "Moldova"],
    explanation: "Cung điện Quốc hội Romania (Palatul Parlamentului) tại Bucharest - tòa nhà hành chính dân sự nặng nhất và đắt đỏ nhất thế giới do Nicolae Ceausescu xây dựng."
  },
  {
    city: "Sofia",
    landmark: "Nhà thờ chính tòa Alexander Nevsky với mái vòm vàng",
    country: "Bulgaria",
    lat: 42.6958,
    lng: 23.3328,
    options: ["Bulgaria", "Romania", "Hy Lạp", "Bắc Macedonia"],
    explanation: "Thánh đường Chính thống giáo Alexander Nevsky tại thủ đô Sofia, Bulgaria - một trong những nhà thờ Chính thống giáo lớn nhất thế giới với mái vòm dát vàng lấp lánh."
  },
  {
    city: "Santorini",
    landmark: "Những ngôi nhà quét vôi trắng và mái vòm xanh ở làng Oia",
    country: "Hy Lạp",
    lat: 36.4618,
    lng: 25.3753,
    options: ["Hy Lạp", "Ý", "Síp", "Thổ Nhĩ Kỳ"],
    explanation: "Khung cảnh ngắm hoàng hôn đẹp nhất hành tinh tại làng Oia trên vách đá đảo núi lửa Santorini, Hy Lạp với tường vôi trắng tinh và vòm chuông xanh biếc."
  },
  {
    city: "Nicosia",
    landmark: "Khu phố cổ tường thành Venetian tại Nicosia",
    country: "Síp",
    lat: 35.1744,
    lng: 33.3642,
    options: ["Síp", "Hy Lạp", "Thổ Nhĩ Kỳ", "Li-băng"],
    explanation: "Bức tường thành đá hình sao 11 cánh của người Venice bao quanh thủ đô Nicosia của đảo quốc Síp (Cyprus) tại phía đông Địa Trung Hải."
  },

  // --- 7. BẮC MỸ (NORTH AMERICA) ---
  {
    city: "Washington D.C.",
    landmark: "Điện Capitol Hoa Kỳ và đài tưởng niệm Washington",
    country: "Hoa Kỳ",
    lat: 38.8899,
    lng: -77.0091,
    options: ["Hoa Kỳ", "Canada", "Mexico", "Vương quốc Anh"],
    explanation: "Tòa nhà Quốc hội Hoa Kỳ (US Capitol) với mái vòm trắng biểu tượng nhìn ra công viên National Mall tại thủ đô Washington D.C."
  },
  {
    city: "San Francisco",
    landmark: "Cầu Cổng Vàng màu cam rực rỡ Golden Gate Bridge",
    country: "Hoa Kỳ",
    lat: 37.8199,
    lng: -122.4783,
    options: ["Hoa Kỳ", "Canada", "Úc", "New Zealand"],
    explanation: "Cây cầu treo biểu tượng Cầu Cổng Vàng sơn màu cam quốc tế (International Orange) vắt qua eo biển San Francisco tại bang California, Hoa Kỳ."
  },
  {
    city: "Los Angeles",
    landmark: "Đại lộ danh vọng Hollywood Walk of Fame",
    country: "Hoa Kỳ",
    lat: 34.1016,
    lng: -118.3418,
    options: ["Hoa Kỳ", "Mexico", "Canada", "Úc"],
    explanation: "Hơn 2.700 ngôi sao năm cánh bằng đồng khảm trên vỉa hè đại lộ Hollywood Boulevard tại Los Angeles, bang California, Hoa Kỳ."
  },
  {
    city: "Las Vegas",
    landmark: "Đại lộ rực rỡ đèn neon Las Vegas Strip",
    country: "Hoa Kỳ",
    lat: 36.1147,
    lng: -115.1728,
    options: ["Hoa Kỳ", "Mexico", "Canada", "UAE"],
    explanation: "Thủ phủ giải trí không ngủ giữa sa mạc Nevada, Hoa Kỳ với các khu nghỉ dưỡng mô phỏng tháp Eiffel, Kim Tự Tháp Luxor và đài phun nước Bellagio."
  },
  {
    city: "Miami",
    landmark: "Khu phố kiến trúc Art Deco và bãi biển South Beach",
    country: "Hoa Kỳ",
    lat: 25.7826,
    lng: -80.1303,
    options: ["Hoa Kỳ", "Bahamas", "Cuba", "Mexico"],
    explanation: "Những tòa khách sạn màu pastel phong cách Art Deco thập niên 1930 dọc đại lộ Ocean Drive ven bờ biển Miami, bang Florida, Hoa Kỳ."
  },
  {
    city: "Chicago",
    landmark: "Tác phẩm điêu khắc hạt đậu gương The Bean tại Millennium Park",
    country: "Hoa Kỳ",
    lat: 41.8827,
    lng: -87.6233,
    options: ["Hoa Kỳ", "Canada", "Vương quốc Anh", "Úc"],
    explanation: "Tác phẩm điêu khắc thép không gỉ nguyên khối Cloud Gate (thường gọi là Hạt Đậu - The Bean) phản chiếu đường chân trời thành phố Chicago, bang Illinois, Hoa Kỳ."
  },
  {
    city: "Honolulu",
    landmark: "Bãi biển nhiệt đới Waikiki và miệng núi lửa Diamond Head",
    country: "Hoa Kỳ",
    lat: 21.2765,
    lng: -157.8272,
    options: ["Hoa Kỳ", "Úc", "Fiji", "Philippines"],
    explanation: "Bờ biển lướt sóng Waikiki ngập tràn hàng dừa nhiệt đới với phông nền là đỉnh núi lửa tắt Diamond Head tại hòn đảo Oahu, bang Hawaii, Hoa Kỳ."
  },
  {
    city: "Vancouver",
    landmark: "Công viên Stanley Park nhìn ra vịnh biển và núi tuyết",
    country: "Canada",
    lat: 49.3017,
    lng: -123.1442,
    options: ["Canada", "Hoa Kỳ", "Úc", "New Zealand"],
    explanation: "Đường đê kè ven biển Seawall bao quanh Stanley Park tại thành phố Vancouver, tỉnh British Columbia, Canada nơi biển cả giao hòa với dãy núi tuyết Coast Mountains."
  },
  {
    city: "Montreal",
    landmark: "Vương cung thánh đường Đức Bà Basilica Notre-Dame",
    country: "Canada",
    lat: 45.5045,
    lng: -73.5560,
    options: ["Canada", "Pháp", "Hoa Kỳ", "Bỉ"],
    explanation: "Nội thất dát vàng lộng lẫy và mái vòm sao đêm màu xanh lam sâu thẳm của thánh đường Notre-Dame tại khu phố cổ Montreal, tỉnh Quebec, Canada (vùng nói tiếng Pháp)."
  },
  {
    city: "Quebec",
    landmark: "Khách sạn lâu đài cổ tích Chateau Frontenac trên vách đá",
    country: "Canada",
    lat: 46.8123,
    lng: -71.2050,
    options: ["Canada", "Pháp", "Hoa Kỳ", "Ireland"],
    explanation: "Khách sạn cổ kính Chateau Frontenac được chụp ảnh nhiều nhất thế giới ngự trên vách đá Cap Diamant nhìn xuống sông Saint Lawrence tại thành phố Quebec, Canada."
  },
  {
    city: "Banff",
    landmark: "Hồ băng xanh ngọc bích Lake Louise giữa rặng núi Rockies",
    country: "Canada",
    lat: 51.4172,
    lng: -116.2168,
    options: ["Canada", "Hoa Kỳ", "Thụy Sĩ", "Na Uy"],
    explanation: "Màu nước hồ xanh ngọc bích do bột đá băng tuyết tan tạo nên tại Lake Louise trong vườn quốc gia Banff, tỉnh Alberta, Canada."
  },
  {
    city: "Cancun",
    landmark: "Bãi biển cát trắng mịn màng và khu nghỉ dưỡng ven biển",
    country: "Mexico",
    lat: 21.1378,
    lng: -86.7456,
    options: ["Mexico", "Cuba", "Guatemala", "Colombia"],
    explanation: "Dải cát trắng mịn bên làn nước biển Caribe xanh biếc tại khu khách sạn Zona Hotelera ở thành phố nghỉ dưỡng Cancun, bán đảo Yucatan, Mexico."
  },
  {
    city: "Guadalajara",
    landmark: "Nhà thờ chính tòa Guadalajara hai ngọn tháp nhọn màu vàng",
    country: "Mexico",
    lat: 20.6770,
    lng: -103.3470,
    options: ["Mexico", "Colombia", "Tây Ban Nha", "Guatemala"],
    explanation: "Thánh đường Guadalajara với hai tòa tháp neo-Gothic màu vàng nổi bật tại bang Jalisco, Mexico - cái nôi của âm nhạc Mariachi và rượu Tequila."
  },

  // --- 8. MỸ LATINH & CARIBE (LATIN AMERICA & CARIBBEAN) ---
  {
    city: "San Jose",
    landmark: "Nhà hát Quốc gia Costa Rica nguy nga phong cách châu Âu",
    country: "Costa Rica",
    lat: 9.9331,
    lng: -84.0769,
    options: ["Costa Rica", "Panama", "Nicaragua", "Colombia"],
    explanation: "Nhà hát Quốc gia Teatro Nacional de Costa Rica tại thủ đô San Jose được tài trợ bằng thuế xuất khẩu cà phê từ cuối thế kỷ 19."
  },
  {
    city: "Panama City",
    landmark: "Đường chân trời hiện đại và Kênh đào Panama",
    country: "Panama",
    lat: 8.9714,
    lng: -79.5266,
    options: ["Panama", "Costa Rica", "Colombia", "Ecuador"],
    explanation: "Đại lộ ven biển Cinta Costera nhìn ngắm rừng tháp chọc trời tài chính hiện đại tại Panama City - đất nước sở hữu kênh đào kết nối hai đại dương."
  },
  {
    city: "Havana",
    landmark: "Đại lộ bờ biển Malecon và những chiếc xe cổ mui trần cổ điển",
    country: "Cuba",
    lat: 23.1415,
    lng: -82.3590,
    options: ["Cuba", "Cộng hòa Dominica", "Puerto Rico", "Mexico"],
    explanation: "Đại lộ kè đá Malecon tại thủ đô Havana, Cuba nơi những chiếc xe hơi cổ điển Mỹ thập niên 1950 lướt gió bên bờ sóng biển Caribe."
  },
  {
    city: "Santo Domingo",
    landmark: "Quảng trường Parque Colon và Nhà thờ đầu tiên ở châu Mỹ",
    country: "Cộng hòa Dominica",
    lat: 18.4735,
    lng: -69.8833,
    options: ["Cộng hòa Dominica", "Puerto Rico", "Cuba", "Jamaica"],
    explanation: "Khu phố cổ Zona Colonial tại thủ đô Santo Domingo của nước Cộng hòa Dominica - khu định cư lâu đời nhất của người châu Âu tại Tân Thế Giới."
  },
  {
    city: "San Juan",
    landmark: "Pháo đài cổ Castillo San Felipe del Morro bên đại dương",
    country: "Puerto Rico",
    lat: 18.4711,
    lng: -66.1233,
    options: ["Puerto Rico", "Cộng hòa Dominica", "Cuba", "Colombia"],
    explanation: "Pháo đài đá khổng lồ El Morro vươn ra biển Đại Tây Dương trấn thủ lối vào vịnh San Juan tại hòn đảo Puerto Rico thuộc vùng Caribe."
  },
  {
    city: "Medellin",
    landmark: "Khu phố bích họa Comuna 13 và hệ thống cáp treo đô thị",
    country: "Colombia",
    lat: 6.2529,
    lng: -75.6231,
    options: ["Colombia", "Ecuador", "Venezuela", "Peru"],
    explanation: "Khu phố sắc màu Comuna 13 tại Medellin, Colombia - biểu tượng tái sinh kỳ diệu từ bạo lực trở thành trung tâm nghệ thuật tranh tường và thang cuốn ngoài trời."
  },
  {
    city: "Cartagena",
    landmark: "Phố cổ tường thành rực rỡ hoa giấy Cartagena de Indias",
    country: "Colombia",
    lat: 10.4236,
    lng: -75.5480,
    options: ["Colombia", "Panama", "Venezuela", "Ecuador"],
    explanation: "Đô thị cổ Cartagena bên bờ biển Caribe của Colombia với những ngôi nhà thuộc địa Tây Ban Nha ban công gỗ tràn ngập hoa giấy bougainvillea rực rỡ."
  },
  {
    city: "Quito",
    landmark: "Tượng đài đường Xích Đạo Mitad del Mundo",
    country: "Ecuador",
    lat: -0.0022,
    lng: -78.4558,
    options: ["Ecuador", "Colombia", "Peru", "Bolivia"],
    explanation: "Tượng đài 'Trung tâm của thế giới' Mitad del Mundo gần thủ đô Quito, Ecuador đánh dấu vĩ tuyến 0°0'0\" phân chia hai nửa bán cầu Bắc và Nam."
  },
  {
    city: "Lima",
    landmark: "Công viên tình yêu Parque del Amor trên vách đá nhìn ra Thái Bình Dương",
    country: "Peru",
    lat: -12.1258,
    lng: -77.0375,
    options: ["Peru", "Chile", "Ecuador", "Bolivia"],
    explanation: "Công viên tình yêu Parque del Amor với các bức tường ốp gốm mosaic phong cách Antoni Gaudi trên đỉnh vách đá Miraflores tại thủ đô Lima, Peru."
  },
  {
    city: "La Paz",
    landmark: "Thung lũng Mặt Trăng Valle de la Luna và cáp treo Mi Teleferico",
    country: "Bolivia",
    lat: -16.5678,
    lng: -68.0933,
    options: ["Bolivia", "Peru", "Chile", "Argentina"],
    explanation: "Khu vực địa hình xói mòn như bề mặt Mặt Trăng tại thung lũng La Paz, Bolivia - thủ đô hành chính nằm ở độ cao hơn 3.600m so với mực nước biển."
  },
  {
    city: "Sao Paulo",
    landmark: "Đại lộ tài chính sầm uất Avenida Paulista",
    country: "Brazil",
    lat: -23.5614,
    lng: -46.6559,
    options: ["Brazil", "Argentina", "Uruguay", "Chile"],
    explanation: "Trục đại lộ tài chính huyết mạch Avenida Paulista với Bảo tàng Nghệ thuật MASP treo trên 4 cột đỏ khổng lồ tại siêu đô thị Sao Paulo, Brazil."
  },
  {
    city: "Salvador",
    landmark: "Quảng trường Pelourinho với những ngôi nhà sơn màu phấn",
    country: "Brazil",
    lat: -12.9718,
    lng: -38.5080,
    options: ["Brazil", "Bồ Đào Nha", "Colombia", "Argentina"],
    explanation: "Khu phố cổ Pelourinho tại Salvador da Bahia, Brazil - cố đô đầu tiên mang đậm bản sắc văn hóa Afro-Brazil và điệu nhảy lễ hội rộn ràng."
  },
  {
    city: "Brasilia",
    landmark: "Nhà thờ chính tòa hình vương miện gai Catedral Metropolitana",
    country: "Brazil",
    lat: -15.7983,
    lng: -47.8755,
    options: ["Brazil", "Argentina", "Chile", "Colombia"],
    explanation: "Nhà thờ độc đáo hình 16 cột bê tông uốn cong mô phỏng đôi bàn tay vươn lên trời do kiến trúc sư Oscar Niemeyer thiết kế tại thủ đô Brasilia, Brazil."
  },
  {
    city: "Montevideo",
    landmark: "Quảng trường Độc lập Plaza Independencia và Tháp Palacio Salvo",
    country: "Uruguay",
    lat: -34.9064,
    lng: -56.1995,
    options: ["Uruguay", "Argentina", "Paraguay", "Brazil"],
    explanation: "Quảng trường Plaza Independencia tại thủ đô Montevideo, Uruguay với tòa tháp Palacio Salvo biểu tượng nhìn ra cửa sông Rio de la Plata."
  },
  {
    city: "Asuncion",
    landmark: "Cung điện Tổng thống Palacio de los Lopez bên vịnh Asuncion",
    country: "Paraguay",
    lat: -25.2778,
    lng: -57.6375,
    options: ["Paraguay", "Bolivia", "Uruguay", "Argentina"],
    explanation: "Dinh Tổng thống Palacio de los Lopez sơn màu hồng nhạt duyên dáng bên bờ sông Paraguay tại thủ đô Asuncion của đất nước nội lục Paraguay."
  },
  {
    city: "Valparaiso",
    landmark: "Những ngọn đồi rực rỡ bích họa và thang máy cổ funicular",
    country: "Chile",
    lat: -33.0425,
    lng: -71.6288,
    options: ["Chile", "Argentina", "Peru", "Uruguay"],
    explanation: "Thành phố cảng Valparaiso của Chile nổi tiếng với 43 ngọn đồi dốc đứng phủ kín tranh vẽ graffiti và những toa xe thang máy kéo bằng dây cáp từ thế kỷ 19."
  },
  {
    city: "Ushuaia",
    landmark: "Biển hiệu 'Điểm tận cùng thế giới' Fin del Mundo tại eo biển Beagle",
    country: "Argentina",
    lat: -54.8072,
    lng: -68.3074,
    options: ["Argentina", "Chile", "Na Uy", "New Zealand"],
    explanation: "Thành phố cực nam của địa cầu Ushuaia tại vùng đất lửa Tierra del Fuego, Argentina - cửa ngõ xuất phát của các đoàn thám hiểm tới lục địa Nam Cực."
  },
  {
    city: "Mendoza",
    landmark: "Cánh đồng nho bạt ngàn dưới chân rặng núi tuyết Andes",
    country: "Argentina",
    lat: -32.8895,
    lng: -68.8458,
    options: ["Argentina", "Chile", "Uruguay", "Bolivia"],
    explanation: "Vùng trồng nho và sản xuất rượu vang Malbec trứ danh Mendoza, Argentina nép mình dưới chân đỉnh núi cao nhất châu Mỹ Aconcagua thuộc dãy Andes."
  },

  // --- 9. CHÂU PHI (AFRICA) ---
  {
    city: "Alexandria",
    landmark: "Thư viện hiện đại Bibliotheca Alexandrina bên bờ Địa Trung Hải",
    country: "Ai Cập",
    lat: 31.2089,
    lng: 29.9092,
    options: ["Ai Cập", "Hy Lạp", "Li-băng", "Tunisia"],
    explanation: "Tòa nhà hình đĩa nghiêng độc đáo của Thư viện mới Alexandria, Ai Cập tái hiện thư viện cổ đại huyền thoại bên bờ biển Địa Trung Hải."
  },
  {
    city: "Luxor",
    landmark: "Đại sảnh cột khổng lồ tại Quần thể đền Karnak",
    country: "Ai Cập",
    lat: 25.7188,
    lng: 32.6573,
    options: ["Ai Cập", "Jordan", "Sudan", "Ả Rập Xê Út"],
    explanation: "Khu rừng 134 cột đá khổng lồ khắc chữ tượng hình cổ đại tại đền Karnak, thành phố Luxor bên dòng sông Nile, Ai Cập."
  },
  {
    city: "Marrakech",
    landmark: "Quảng trường người kể chuyện và xiếc rắn Jemaa el-Fnaa",
    country: "Ma-rốc",
    lat: 31.6258,
    lng: -7.9891,
    options: ["Ma-rốc", "Tunisia", "Algeria", "Ai Cập"],
    explanation: "Quảng trường cổ Jemaa el-Fnaa tại 'thành phố đỏ' Marrakech, Ma-rốc - di sản truyền khẩu nhân loại với các gian hàng gia vị và diễn xướng dân gian."
  },
  {
    city: "Casablanca",
    landmark: "Thánh đường Hồi giáo Hassan II vươn mình ra biển Đại Tây Dương",
    country: "Ma-rốc",
    lat: 33.6086,
    lng: -7.6328,
    options: ["Ma-rốc", "Tunisia", "Algeria", "Ai Cập"],
    explanation: "Ngọn tháp minaret cao 210 mét của thánh đường Hassan II xây trên mỏm đá nhô ra biển Đại Tây Dương tại Casablanca, Ma-rốc."
  },
  {
    city: "Tunis",
    landmark: "Làng cổ tích tường trắng cửa sổ xanh Sidi Bou Said",
    country: "Tunisia",
    lat: 36.8702,
    lng: 10.3417,
    options: ["Tunisia", "Ma-rốc", "Hy Lạp", "Ý"],
    explanation: "Ngôi làng ven biển Địa Trung Hải Sidi Bou Said tại Tunisia với sự hòa quyện tuyệt mỹ giữa màu tường trắng tinh khôi và cửa gỗ xanh da trời."
  },
  {
    city: "Johannesburg",
    landmark: "Cầu dây văng Nelson Mandela Bridge bắc qua ga đường sắt",
    country: "Nam Phi",
    lat: -26.1969,
    lng: 28.0347,
    options: ["Nam Phi", "Botswana", "Namibia", "Kenya"],
    explanation: "Cây cầu mang tên cố Tổng thống Nelson Mandela nối liền hai khu phố Braamfontein và Newtown tại trung tâm thành phố Johannesburg, Nam Phi."
  },
  {
    city: "Durban",
    landmark: "Bãi biển Golden Mile ngập tràn ánh nắng và ván lướt sóng",
    country: "Nam Phi",
    lat: -29.8519,
    lng: 31.0378,
    options: ["Nam Phi", "Mozambique", "Kenya", "Namibia"],
    explanation: "Bờ biển cát vàng Golden Mile nhìn ra Ấn Độ Dương tại thành phố Durban, Nam Phi - thiên đường lướt sóng và khí hậu ấm áp quanh năm."
  },
  {
    city: "Windhoek",
    landmark: "Nhà thờ Chúa Kitô Christuskirche phong cách Đức",
    country: "Namibia",
    lat: -22.5694,
    lng: 17.0869,
    options: ["Namibia", "Botswana", "Nam Phi", "Angola"],
    explanation: "Nhà thờ bằng đá sa thạch Christuskirche tại thủ đô Windhoek của Namibia - minh chứng cho thời kỳ từng là thuộc địa Tây Nam Phi thuộc Đức."
  },
  {
    city: "Gaborone",
    landmark: "Đài tưởng niệm Ba vị Tù trưởng vĩ đại Three Dikgosi Monument",
    country: "Botswana",
    lat: -24.6467,
    lng: 25.9083,
    options: ["Botswana", "Nam Phi", "Zimbabwe", "Namibia"],
    explanation: "Ba bức tượng đồng cao 5,4 mét của ba vị thủ lĩnh lịch sử tại thủ đô Gaborone của đất nước kim cương hòa bình Botswana."
  },
  {
    city: "Victoria Falls",
    landmark: "Thác nước khổng lồ Victoria Falls 'Khói sấm sét'",
    country: "Zimbabwe",
    lat: -17.9243,
    lng: 25.8572,
    options: ["Zimbabwe", "Zambia", "Botswana", "Nam Phi"],
    explanation: "Màn nước rơi khổng lồ rộng hơn 1.700 mét của Thác Victoria trên sông Zambezi giáp ranh giữa Zimbabwe và Zambia với làn hơi nước tung mây mịt mù."
  },
  {
    city: "Dakar",
    landmark: "Tượng đài Phục hưng Châu Phi bằng đồng khổng lồ",
    country: "Senegal",
    lat: 14.7222,
    lng: -17.4947,
    options: ["Senegal", "Bờ Biển Ngà", "Ghana", "Nigeria"],
    explanation: "Bức tượng đồng cao 49 mét sừng sững trên đỉnh đồi nhìn ra Đại Tây Dương tại thủ đô Dakar, Senegal - tượng đài cao nhất toàn châu Phi."
  },
  {
    city: "Accra",
    landmark: "Quảng trường Độc lập Black Star Square và Khải Hoàn Môn",
    country: "Ghana",
    lat: 5.5492,
    lng: -0.1925,
    options: ["Ghana", "Nigeria", "Bờ Biển Ngà", "Senegal"],
    explanation: "Khải Hoàn Môn với ngôi sao đen Black Star tại quảng trường độc lập Accra, Ghana - quốc gia đầu tiên ở vùng châu Phi cận Sahara giành được độc lập."
  },
  {
    city: "Lagos",
    landmark: "Cầu treo dây văng Lekki-Ikoyi Link Bridge rực rỡ",
    country: "Nigeria",
    lat: 6.4474,
    lng: 3.4475,
    options: ["Nigeria", "Ghana", "Cameroon", "Kenya"],
    explanation: "Cây cầu dây văng hiện đại Lekki-Ikoyi bắc qua đầm phá tại siêu đô thị hơn 20 triệu dân Lagos, Nigeria - nền kinh tế lớn nhất Tây Phi."
  },
  {
    city: "Kigali",
    landmark: "Trung tâm Hội nghị vòm tròn Kigali Convention Centre",
    country: "Rwanda",
    lat: -1.9536,
    lng: 30.0931,
    options: ["Rwanda", "Uganda", "Kenya", "Tanzania"],
    explanation: "Tòa nhà hình vòm bán cầu thắp sáng đa sắc màu mô phỏng túp lều truyền thống của nhà vua tại thủ đô xanh và sạch nhất châu Phi Kigali, Rwanda."
  },
  {
    city: "Antananarivo",
    landmark: "Cung điện Hoàng hậu Rova ngự trên đỉnh đồi cao nhất",
    country: "Madagascar",
    lat: -18.9242,
    lng: 47.5325,
    options: ["Madagascar", "Mauritius", "Mozambique", "Nam Phi"],
    explanation: "Tổ hợp hoàng gia Rova of Antananarivo tọa lạc trên đỉnh đồi Analamanga nhìn xuống toàn cảnh thủ đô hòn đảo khổng lồ Madagascar."
  },

  // --- 10. CHÂU ĐẠI DƯƠNG (OCEANIA) ---
  {
    city: "Melbourne",
    landmark: "Ga đường sắt Flinders Street Station và xe điện lịch sử",
    country: "Úc",
    lat: -37.8180,
    lng: 144.9671,
    options: ["Úc", "New Zealand", "Vương quốc Anh", "Canada"],
    explanation: "Tòa nhà nhà ga mái vòm màu vàng Flinders Street Station cổ kính đối diện quảng trường Federation Square tại Melbourne, bang Victoria, nước Úc."
  },
  {
    city: "Brisbane",
    landmark: "Vòng xoay bãi biển nhân tạo South Bank nhìn ra trung tâm thành phố",
    country: "Úc",
    lat: -27.4764,
    lng: 153.0205,
    options: ["Úc", "New Zealand", "Hoa Kỳ", "Nam Phi"],
    explanation: "Khu đầm phá tắm biển nhân tạo Streets Beach ngay giữa lòng trung tâm thành phố Brisbane bên bờ sông Brisbane, bang Queensland, Úc."
  },
  {
    city: "Perth",
    landmark: "Công viên Kings Park nhìn toàn cảnh thành phố bên sông Swan",
    country: "Úc",
    lat: -31.9614,
    lng: 115.8436,
    options: ["Úc", "Nam Phi", "New Zealand", "Singapore"],
    explanation: "Công viên thực vật trên đồi Kings Park nhìn xuống ngã ba sông Swan và những tòa cao ốc trung tâm tại Perth, miền tây nước Úc."
  },
  {
    city: "Cairns",
    landmark: "Bến tàu du thuyền xuất phát đi Rạn san hô Great Barrier Reef",
    country: "Úc",
    lat: -16.9240,
    lng: 145.7790,
    options: ["Úc", "Fiji", "Indonesia", "Philippines"],
    explanation: "Thành phố nhiệt đới Cairns tại bang Queensland, Úc - cửa ngõ chính yếu để lặn biển khám phá kỳ quan thiên nhiên Great Barrier Reef."
  },
  {
    city: "Wellington",
    landmark: "Tòa nhà Quốc hội hình tổ ong The Beehive",
    country: "New Zealand",
    lat: -41.2784,
    lng: 174.7767,
    options: ["New Zealand", "Úc", "Vương quốc Anh", "Ireland"],
    explanation: "Tòa nhà hành pháp Quốc hội hình tròn giật cấp mô phỏng chiếc tổ ong (The Beehive) tại thủ đô lộng gió Wellington, New Zealand."
  },
  {
    city: "Queenstown",
    landmark: "Hồ Wakatipu trong vắt và dãy núi The Remarkables",
    country: "New Zealand",
    lat: -45.0312,
    lng: 168.6626,
    options: ["New Zealand", "Thụy Sĩ", "Úc", "Na Uy"],
    explanation: "Thủ đô phiêu lưu mạo hiểm Queenstown trên đảo Nam New Zealand nằm bên bờ hồ Wakatipu hình chữ S dưới chân dãy núi hùng vĩ The Remarkables."
  },
  {
    city: "Suva",
    landmark: "Dinh Thống đốc và công viên Albert Park trung tâm",
    country: "Fiji",
    lat: -18.1472,
    lng: 178.4239,
    options: ["Fiji", "Samoa", "Tonga", "Vanuatu"],
    explanation: "Công viên Albert Park và các tòa nhà thuộc địa kiến trúc gỗ nhiệt đới tại thủ đô Suva của quốc đảo Thái Bình Dương Fiji."
  }
];

module.exports = { STREETVIEW_100_NEW };
