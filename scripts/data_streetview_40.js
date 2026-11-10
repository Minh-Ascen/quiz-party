const STREETVIEW_LOCATIONS = [
  {
    city: "Bangkok",
    landmark: "Chùa Wat Arun bên bờ sông Chao Phraya",
    country: "Thái Lan",
    lat: 13.7437,
    lng: 100.4889,
    options: ["Thái Lan", "Campuchia", "Lào", "Myanmar"],
    explanation: "Đây là khu vực chùa Wat Arun nổi tiếng bên dòng sông Chao Phraya ở thủ đô Bangkok, Thái Lan với kiến trúc Phật giáo Nguyên thủy đặc trưng và thuyền máy đuôi dài."
  },
  {
    city: "Tokyo",
    landmark: "Ngã tư sầm uất Shibuya",
    country: "Nhật Bản",
    lat: 35.6595,
    lng: 139.7005,
    options: ["Nhật Bản", "Hàn Quốc", "Đài Loan", "Trung Quốc"],
    explanation: "Ngã tư Shibuya huyền thoại tại Tokyo, Nhật Bản - giao lộ đi bộ đông đúc nhất hành tinh với biển hiệu chữ Kanji/Katakana và làn sóng người qua đường."
  },
  {
    city: "Seoul",
    landmark: "Cung điện Gyeongbokgung & Quảng trường Gwanghwamun",
    country: "Hàn Quốc",
    lat: 37.5759,
    lng: 126.9768,
    options: ["Hàn Quốc", "Nhật Bản", "Đài Loan", "Mông Cổ"],
    explanation: "Khu vực quảng trường Gwanghwamun tại Seoul, Hàn Quốc với tượng Tướng quân Yi Sun-sin và chữ Hangeul đặc trưng trên các biển chỉ dẫn."
  },
  {
    city: "Paris",
    landmark: "Công viên Champ de Mars dưới chân Tháp Eiffel",
    country: "Pháp",
    lat: 48.8584,
    lng: 2.2945,
    options: ["Pháp", "Bỉ", "Thụy Sĩ", "Hà Lan"],
    explanation: "Góc nhìn 360 độ từ công viên Champ de Mars hướng về Tháp Eiffel biểu tượng tại thủ đô Paris, nước Pháp."
  },
  {
    city: "Rome",
    landmark: "Đấu trường La Mã cổ đại Colosseum",
    country: "Ý",
    lat: 41.8902,
    lng: 12.4922,
    options: ["Ý", "Hy Lạp", "Tây Ban Nha", "Bồ Đào Nha"],
    explanation: "Đấu trường La Mã Colosseum sừng sững tại thủ đô Rome, nước Ý - kiệt tác kiến trúc cổ đại La Mã hơn 2000 năm tuổi."
  },
  {
    city: "London",
    landmark: "Cầu Westminster & Tháp đồng hồ Big Ben",
    country: "Vương quốc Anh",
    lat: 51.5007,
    lng: -0.1246,
    options: ["Vương quốc Anh", "Ireland", "Scotland", "Hà Lan"],
    explanation: "Cầu Westminster bắc qua sông Thames với tháp đồng hồ Big Ben và xe buýt 2 tầng đỏ đặc trưng của nước Anh (lái xe bên trái)."
  },
  {
    city: "Berlin",
    landmark: "Cổng Brandenburg (Brandenburger Tor)",
    country: "Đức",
    lat: 52.5163,
    lng: 13.3777,
    options: ["Đức", "Áo", "Ba Lan", "Cộng hòa Séc"],
    explanation: "Cổng Brandenburg tại thủ đô Berlin, nước Đức - biểu tượng lịch sử của sự thống nhất nước Đức với cỗ xe tứ mã Quadriga trên đỉnh."
  },
  {
    city: "New York",
    landmark: "Giao lộ Quảng trường Thời đại Times Square",
    country: "Hoa Kỳ",
    lat: 40.758,
    lng: -73.9855,
    options: ["Hoa Kỳ", "Canada", "Mexico", "Vương quốc Anh"],
    explanation: "Quảng trường Thời đại (Times Square) tại Manhattan, New York, Hoa Kỳ rực rỡ màn hình LED khổng lồ và taxi vàng đặc trưng."
  },
  {
    city: "Sydney",
    landmark: "Cảng Circular Quay & Nhà hát Con Sò Opera Sydney",
    country: "Úc",
    lat: -33.8568,
    lng: 151.2153,
    options: ["Úc", "New Zealand", "Fiji", "Papua New Guinea"],
    explanation: "Nhà hát Opera Sydney hình cánh buồm trắng vươn ra cảng biển Port Jackson, thành phố Sydney, nước Úc."
  },
  {
    city: "Rio de Janeiro",
    landmark: "Bờ biển Copacabana & Phố đi bộ Mosaic",
    country: "Brazil",
    lat: -22.9711,
    lng: -43.1825,
    options: ["Brazil", "Argentina", "Colombia", "Peru"],
    explanation: "Bờ biển Copacabana trứ danh tại Rio de Janeiro, Brazil với vỉa hè lát đá hoa văn sóng lượn đen trắng và hàng cọ nhiệt đới."
  },
  {
    city: "Cairo",
    landmark: "Khu lăng mộ Kim tự tháp Giza & Nhân sư",
    country: "Ai Cập",
    lat: 29.9792,
    lng: 31.1342,
    options: ["Ai Cập", "Jordan", "Morocco", "Ả Rập Xê Út"],
    explanation: "Quần thể Đại Kim tự tháp Giza và tượng Đại Nhân Sư trên sa mạc ngoại ô Cairo, Ai Cập - kỳ quan cổ đại duy nhất còn tồn tại."
  },
  {
    city: "Singapore",
    landmark: "Vịnh Marina Bay & Khách sạn thuyền trên không",
    country: "Singapore",
    lat: 1.2834,
    lng: 103.8607,
    options: ["Singapore", "Malaysia", "Indonesia", "Brunei"],
    explanation: "Khu nghỉ dưỡng phức hợp Marina Bay Sands với công viên Sands SkyPark hình con thuyền khổng lồ tại đảo quốc sư tử Singapore."
  },
  {
    city: "Kuala Lumpur",
    landmark: "Chân Tháp đôi Petronas (KLCC)",
    country: "Malaysia",
    lat: 3.1578,
    lng: 101.7119,
    options: ["Malaysia", "Indonesia", "Thái Lan", "Singapore"],
    explanation: "Tháp đôi Petronas Twin Towers cao 451,9m với cầu nối Skybridge tại trung tâm thủ đô Kuala Lumpur, Malaysia."
  },
  {
    city: "Amsterdam",
    landmark: "Hệ thống kênh đào Prinsengracht & Nhà gạch cổ",
    country: "Hà Lan",
    lat: 52.3731,
    lng: 4.8926,
    options: ["Hà Lan", "Bỉ", "Đan Mạch", "Đức"],
    explanation: "Kênh đào đặc trưng với những dãy nhà hẹp mái nhọn và hàng nghìn chiếc xe đạp đậu ven bờ tại Amsterdam, Hà Lan."
  },
  {
    city: "Athens",
    landmark: "Khu di tích Vệ thành Acropolis & Đền Parthenon",
    country: "Hy Lạp",
    lat: 37.9715,
    lng: 23.7266,
    options: ["Hy Lạp", "Ý", "Thổ Nhĩ Kỳ", "Síp"],
    explanation: "Khu thành cổ Acropolis và đền Parthenon bằng đá cẩm thạch tọa lạc trên đỉnh đồi đá nhìn xuống toàn cảnh thủ đô Athens, Hy Lạp."
  },
  {
    city: "Madrid",
    landmark: "Quảng trường Plaza Mayor lát đá cổ kính",
    country: "Tây Ban Nha",
    lat: 40.4154,
    lng: -3.7074,
    options: ["Tây Ban Nha", "Bồ Đào Nha", "Ý", "Pháp"],
    explanation: "Quảng trường Plaza Mayor hình chữ nhật bao quanh bởi các tòa nhà 4 tầng sơn đỏ có 237 ban công tại thủ đô Madrid, Tây Ban Nha."
  },
  {
    city: "Lisbon",
    landmark: "Tháp Belém bên bờ sông Tagus",
    country: "Bồ Đào Nha",
    lat: 38.6916,
    lng: -9.216,
    options: ["Bồ Đào Nha", "Tây Ban Nha", "Ý", "Morocco"],
    explanation: "Tháp Belém theo phong cách Manueline kiên cố bảo vệ cửa sông Tagus tại thủ đô Lisbon, Bồ Đào Nha."
  },
  {
    city: "Oslo",
    landmark: "Bến cảng Aker Brygge hướng ra vịnh Fjord",
    country: "Na Uy",
    lat: 59.911,
    lng: 10.729,
    options: ["Na Uy", "Thụy Điển", "Phần Lan", "Đan Mạch"],
    explanation: "Khu bến cảng Aker Brygge hiện đại tại thủ đô Oslo, Na Uy với vịnh hẹp Fjord thơ mộng và các công trình bằng gỗ, kính tinh tế."
  },
  {
    city: "Stockholm",
    landmark: "Khu phố cổ Gamla Stan & Quảng trường Stortorget",
    country: "Thụy Điển",
    lat: 59.3251,
    lng: 18.0711,
    options: ["Thụy Điển", "Na Uy", "Phần Lan", "Đan Mạch"],
    explanation: "Những ngôi nhà sơn màu vàng cam rực rỡ từ thế kỷ 17 trên quảng trường Stortorget, khu phố cổ Gamla Stan, Stockholm, Thụy Điển."
  },
  {
    city: "Helsinki",
    landmark: "Nhà thờ Trắng Helsinki trên Quảng trường Thượng viện",
    country: "Phần Lan",
    lat: 60.1695,
    lng: 24.9523,
    options: ["Phần Lan", "Estonia", "Thụy Điển", "Na Uy"],
    explanation: "Nhà thờ chính tòa Helsinki uy nghi màu trắng ngà theo kiến trúc Tân cổ điển tại thủ đô Helsinki, Phần Lan."
  },
  {
    city: "Copenhagen",
    landmark: "Kênh đào Nyhavn với dãy nhà sắc màu",
    country: "Đan Mạch",
    lat: 55.6795,
    lng: 12.5898,
    options: ["Đan Mạch", "Thụy Điển", "Hà Lan", "Đức"],
    explanation: "Bến cảng Nyhavn rực rỡ sắc màu thế kỷ 17 với các con tàu gỗ cổ đậu san sát tại Copenhagen, Đan Mạch."
  },
  {
    city: "Prague",
    landmark: "Cầu Charles bắc qua sông Vltava",
    country: "Cộng hòa Séc",
    lat: 50.0865,
    lng: 14.4114,
    options: ["Cộng hòa Séc", "Slovakia", "Ba Lan", "Hungary"],
    explanation: "Cây cầu đá cổ Karlův Most (Cầu Charles) với 30 bức tượng thánh dọc hai bên tại 'thành phố 100 ngọn tháp' Praha, Cộng hòa Séc."
  },
  {
    city: "Vienna",
    landmark: "Cung điện Hoàng gia Hofburg / Schönbrunn",
    country: "Áo",
    lat: 48.1858,
    lng: 16.3128,
    options: ["Áo", "Đức", "Thụy Sĩ", "Hungary"],
    explanation: "Cung điện mùa hè Schönbrunn lộng lẫy theo phong cách Baroque của triều đại Habsburg tại Vienna, nước Áo."
  },
  {
    city: "Bern",
    landmark: "Tháp đồng hồ thiên văn Zytglogge cổ kính",
    country: "Thụy Sĩ",
    lat: 46.948,
    lng: 7.4474,
    options: ["Thụy Sĩ", "Áo", "Liechtenstein", "Đức"],
    explanation: "Tháp đồng hồ Zytglogge từ thời Trung cổ tại thủ đô Bern, Thụy Sĩ - thành phố cổ được bao bọc bởi dòng sông Aare xanh ngọc."
  },
  {
    city: "Warsaw",
    landmark: "Quảng trường Lâu đài Hoàng gia Plac Zamkowy",
    country: "Ba Lan",
    lat: 52.2497,
    lng: 21.0122,
    options: ["Ba Lan", "Litva", "Cộng hòa Séc", "Ukraine"],
    explanation: "Quảng trường Lâu đài Plac Zamkowy với cột tượng Vua Sigismund III tại khu phố cổ Warsaw, Ba Lan."
  },
  {
    city: "Toronto",
    landmark: "Chân Tháp truyền hình CN Tower",
    country: "Canada",
    lat: 43.6426,
    lng: -79.3871,
    options: ["Canada", "Hoa Kỳ", "Greenland", "Vương quốc Anh"],
    explanation: "Tháp CN Tower cao 553,3m biểu tượng của thành phố Toronto, Canada bên bờ hồ Ontario với biển hiệu song ngữ Anh - Pháp."
  },
  {
    city: "Mexico City",
    landmark: "Quảng trường Zócalo & Nhà thờ Chính tòa Metropolitan",
    country: "Mexico",
    lat: 19.4326,
    lng: -99.1332,
    options: ["Mexico", "Guatemala", "Colombia", "Costa Rica"],
    explanation: "Quảng trường Zócalo khổng lồ tại trung tâm Mexico City, Mexico với lá cờ quốc gia tung bay và tàn tích đền Templo Mayor của người Aztec."
  },
  {
    city: "Buenos Aires",
    landmark: "Đại lộ 9 de Julio & Cột tháp Obelisco",
    country: "Argentina",
    lat: -34.6037,
    lng: -58.3816,
    options: ["Argentina", "Uruguay", "Chile", "Paraguay"],
    explanation: "Đại lộ 9 de Julio rộng nhất thế giới với cột đài tưởng niệm Obelisco vươn cao tại thủ đô Buenos Aires, Argentina."
  },
  {
    city: "Santiago",
    landmark: "Toà tháp Gran Torre Santiago & Dãy núi Andes",
    country: "Chile",
    lat: -33.4253,
    lng: -70.6331,
    options: ["Chile", "Argentina", "Peru", "Bolivia"],
    explanation: "Thủ đô Santiago, Chile với tòa nhà chọc trời Gran Torre Santiago cao nhất Nam Mỹ tựa lưng vào dãy núi Andes tuyết phủ hùng vĩ."
  },
  {
    city: "Cusco",
    landmark: "Quảng trường Plaza de Armas thành phố Inca cổ",
    country: "Peru",
    lat: -13.5168,
    lng: -71.9788,
    options: ["Peru", "Bolivia", "Ecuador", "Colombia"],
    explanation: "Thành phố Cusco, Peru - cố đô của Đế chế Inca nằm ở độ cao 3.400m trên dãy Andes với các bức tường đá khổng lồ ghép không vữa."
  },
  {
    city: "Bogota",
    landmark: "Khu phố cổ La Candelaria với nhà ngói thuộc địa",
    country: "Colombia",
    lat: 4.5975,
    lng: -74.0758,
    options: ["Colombia", "Venezuela", "Ecuador", "Peru"],
    explanation: "Khu phố cổ La Candelaria tại Bogota, Colombia với những con dốc đá cuội, nghệ thuật tranh tường graffiti sống động và kiến trúc thuộc địa."
  },
  {
    city: "Cape Town",
    landmark: "Bến cảng V&A Waterfront nhìn lên Núi Bàn Table Mountain",
    country: "Nam Phi",
    lat: -33.9036,
    lng: 18.4205,
    options: ["Nam Phi", "Namibia", "Botswana", "Zimbabwe"],
    explanation: "Khung cảnh ngoạn mục của Núi Bàn (Table Mountain) đỉnh phẳng nhìn từ bến cảng Victoria & Alfred tại Cape Town, Nam Phi."
  },
  {
    city: "Nairobi",
    landmark: "Trung tâm Hội nghị Quốc tế Kenyatta (KICC)",
    country: "Kenya",
    lat: -1.2884,
    lng: 36.8233,
    options: ["Kenya", "Tanzania", "Uganda", "Ethiopia"],
    explanation: "Tòa tháp KICC hình nón tròn độc đáo tại trung tâm thủ đô Nairobi, Kenya - 'thủ đô safari' của Đông Phi."
  },
  {
    city: "Dubai",
    landmark: "Chân toà tháp cao nhất thế giới Burj Khalifa",
    country: "UAE",
    lat: 25.1972,
    lng: 55.2744,
    options: ["UAE", "Qatar", "Ả Rập Xê Út", "Kuwait"],
    explanation: "Dưới chân tòa tháp chọc trời Burj Khalifa cao 828m và hồ nước nhạc nước khổng lồ tại thành phố Dubai, Các Tiểu vương quốc Ả Rập Thống nhất (UAE)."
  },
  {
    city: "Istanbul",
    landmark: "Đại thánh đường Hagia Sophia & Eo biển Bosphorus",
    country: "Thổ Nhĩ Kỳ",
    lat: 41.0086,
    lng: 28.9802,
    options: ["Thổ Nhĩ Kỳ", "Hy Lạp", "Bulgaria", "Georgia"],
    explanation: "Thánh đường Hagia Sophia tráng lệ tại Istanbul, Thổ Nhĩ Kỳ - thành phố duy nhất trên thế giới nằm vắt ngang hai châu lục Á - Âu."
  },
  {
    city: "New Delhi",
    landmark: "Khải Hoàn Môn India Gate",
    country: "Ấn Độ",
    lat: 28.6129,
    lng: 77.2295,
    options: ["Ấn Độ", "Pakistan", "Bangladesh", "Nepal"],
    explanation: "Cổng Ấn Độ (India Gate) bằng đá sa thạch đỏ trên đại lộ Rajpath tưởng niệm các chiến sĩ tại thủ đô New Delhi, Ấn Độ."
  },
  {
    city: "Kathmandu",
    landmark: "Quảng trường đền tháp Durbar Square cổ kính",
    country: "Nepal",
    lat: 27.7042,
    lng: 85.3072,
    options: ["Nepal", "Bhutan", "Ấn Độ", "Tây Tạng"],
    explanation: "Quảng trường cổ Durbar ở thung lũng Kathmandu, Nepal với quần thể đền chùa gỗ nhiều tầng thờ thần Hindu và cờ cầu nguyện lung linh."
  },
  {
    city: "Auckland",
    landmark: "Cầu cảng Auckland Harbour & Tháp Sky Tower",
    country: "New Zealand",
    lat: -36.8485,
    lng: 174.7633,
    options: ["New Zealand", "Úc", "Samoa", "Fiji"],
    explanation: "'Thành phố của những cánh buồm' Auckland, New Zealand với tháp viễn thông Sky Tower cao 328m và cảng Waitematā lộng gió."
  },
  {
    city: "Manila",
    landmark: "Thành cổ Tây Ban Nha Intramuros & Pháo đài Santiago",
    country: "Philippines",
    lat: 14.5895,
    lng: 120.9754,
    options: ["Philippines", "Indonesia", "Malaysia", "Đài Loan"],
    explanation: "Khu thành đá cổ Intramuros do người Tây Ban Nha xây dựng từ thế kỷ 16 tại trung tâm thủ đô Manila, Philippines."
  },
  {
    city: "Jakarta",
    landmark: "Quảng trường Tượng đài Quốc gia Monas ngọn đuốc vàng",
    country: "Indonesia",
    lat: -6.1754,
    lng: 106.8272,
    options: ["Indonesia", "Malaysia", "Philippines", "Đông Timor"],
    explanation: "Tượng đài Quốc gia Monas cao 132m với chóp ngọn đuốc mạ vàng rực rỡ tại quảng trường Merdeka, thủ đô Jakarta, Indonesia."
  }
];

module.exports = { STREETVIEW_LOCATIONS };
