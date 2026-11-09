const fs = require("fs");
const path = require("path");

const doraemon = require("./questions/doraemon");
const conan = require("./questions/conan");
const kdrama = require("./questions/kdrama");
const vpop = require("./questions/vpop");
const kpop = require("./questions/kpop");
const usuk = require("./questions/usuk");
const geography = require("./questions/geography");
const japanAnime = require("./questions/japan_anime");
const chinaClassics = require("./questions/china_classics");
const usCartoons = require("./questions/us_cartoons");
const famousSingers = require("./questions/singers");
const moviesUsVn = require("./questions/movies");
const extraQuestions = require("./extra_questions");
const musicYoutubeMap = require("./music_youtube_map");

const VERIFIED_IMAGES = JSON.parse(
  fs.readFileSync(path.join(__dirname, "verified_images.json"), "utf8")
);

const KEYWORD_IMAGE_RULES = [
  // 20 câu hỏi gốc trên Supabase
  { keywords: ["tỷ phú thiên tài", "giáp công nghệ cao", "iron man", "tony stark"], imageKey: "iron_man" },
  { keywords: ["harry potter", "ron weasley", "hermione", "hogwarts", "quidditch"], imageKey: "ron_weasley" },
  // Doraemon
  { keywords: ["túi không gian bốn chiều", "túi dự phòng", "đệm ngủ trong tủ"], imageKey: "doraemon_pocket" },
  { keywords: ["bánh rán", "dorayaki"], imageKey: "dorayaki" },
  { keywords: ["dưa lưới", "melonpan"], imageKey: "melonpan" },
  { keywords: ["fujiko"], imageKey: "fujiko" },
  { keywords: ["khoai lang nướng"], imageKey: "sweet_potato" },
  { keywords: ["bóng chày", "ống cống"], imageKey: "baseball" },
  { keywords: ["khủng long", "pi-suke"], imageKey: "futabasaurus" },
  { keywords: ["nobita", "0.93 giây", "ngăn kéo bàn học", "xạ thủ", "tamako"], imageKey: "nobita" },
  { keywords: ["mèo máy", "doraemon", "chong chóng tre", "cánh cửa thần kỳ", "bảo bối"], imageKey: "doraemon" },

  // Conan
  { keywords: ["kaito kid", "kaito kuroba", "1412", "thư báo trước"], imageKey: "kaito_kid" },
  { keywords: ["gosho aoyama"], imageKey: "gosho_aoyama" },
  { keywords: ["porsche 356", "gin và vodka", "aptx 4869", "áo đen", "vermouth", "rum", "bảy chú quạ"], imageKey: "porsche_356" },
  { keywords: ["karate", "ran mori", "makoto kyogoku"], imageKey: "karate" },
  { keywords: ["judo", "eri kisaki"], imageKey: "judo" },
  { keywords: ["ánh trăng", "moonlight sonata"], imageKey: "moonlight_sonata" },
  { keywords: ["fbi", "shuichi akai", "subaru okiya", "bourbon", "amuro", "cia", "kir"], imageKey: "fbi" },
  { keywords: ["heiji hattori", "kazuha", "momiji", "osaka"], imageKey: "osaka_castle" },
  { keywords: ["cơm lươn", "genta"], imageKey: "unagi" },
  { keywords: ["shinichi", "kudo"], imageKey: "shinichi" },
  { keywords: ["conan", "thám tử", "agasa", "mori", "haibara", "sherry", "megure", "sato", "matsuda", "hakuba"], imageKey: "conan" },

  // Phim & Hoạt hình Disney / Pixar / Mỹ
  { keywords: ["titanic", "jack, rose", "trái tim đại dương"], imageKey: "titanic" },
  { keywords: ["elsa", "let it go", "frozen", "olaf", "băng giá"], imageKey: "elsa" },
  { keywords: ["lion king", "vua sư tử", "simba", "mufasa", "hakuna matata", "timon"], imageKey: "lion_king" },
  { keywords: ["zelda", "link"], imageKey: "link_zelda" },
  { keywords: ["mario", "nintendo", "ống nước"], imageKey: "mario" },
  { keywords: ["cr7", "cristiano ronaldo"], imageKey: "ronaldo" },
  { keywords: ["world cup 2022", "argentina", "messi"], imageKey: "world_cup_2022" },
  { keywords: ["quả táo bị cắn", "apple"], imageKey: "apple_logo" },
  { keywords: ["chiếc ủng", "bán đảo ý"], imageKey: "italy" },
  { keywords: ["hành tinh đỏ", "sao hỏa"], imageKey: "mars" },
  { keywords: ["năm nhuận", "366"], imageKey: "earth" },
  { keywords: ["🐼", "gấu trúc", "kung fu panda"], imageKey: "panda" },
  { keywords: ["🕷️", "spider-man", "người nhện", "peter parker"], imageKey: "spider_man" },
  { keywords: ["thành phố ánh sáng", "paris", "eiffel"], imageKey: "paris" },

  // K-Drama
  { keywords: ["hạ cánh nơi anh", "hyun bin", "yoon se-ri"], imageKey: "hyun_bin" },
  { keywords: ["son ye-jin"], imageKey: "son_ye_jin" },
  { keywords: ["hậu duệ mặt trời", "yoo si-jin", "song joong-ki"], imageKey: "song_joong_ki" },
  { keywords: ["song hye-kyo", "the glory", "moon dong-eun"], imageKey: "song_hye_kyo" },
  { keywords: ["cờ vây", "choi taek", "reply 1988"], imageKey: "go_game" },
  { keywords: ["squid game", "trò chơi con mực", "456"], imageKey: "squid_game" },
  { keywords: ["goblin", "yêu tinh", "gong yoo"], imageKey: "gong_yoo" },
  { keywords: ["vườn sao băng", "f4", "goo jun-pyo", "lee min-ho", "kim tan", "người thừa kế"], imageKey: "lee_min_ho" },
  { keywords: ["vì sao đưa anh tới", "do min-joon", "kim soo-hyun", "nữ hoàng nước mắt", "mặt trăng ôm mặt trời"], imageKey: "kim_soo_hyun" },
  { keywords: ["chun song-yi", "jun ji-hyun"], imageKey: "jun_ji_hyun" },
  { keywords: ["itaewon", "park sae-royi", "hạt dẻ", "thư ký kim", "park seo-joon"], imageKey: "park_seo_joon" },
  { keywords: ["khách sạn ma quái", "hotel del luna", "jang man-wol", "iu", "em gái quốc dân", "good day"], imageKey: "iu_singer" },
  { keywords: ["park bo-gum"], imageKey: "park_bo_gum" },

  // Âm nhạc Việt Nam
  { keywords: ["hieuthuhai", "ngủ một mình", "gerdnang"], imageKey: "hieuthuhai" },
  { keywords: ["sơn tùng", "m-tp", "hãy trao cho anh", "chắc ai đó sẽ về"], imageKey: "son_tung" },
  { keywords: ["mỹ tâm", "họa mi tóc nâu"], imageKey: "my_tam" },
  { keywords: ["đen vâu", "đi về nhà", "nấu ăn cho em"], imageKey: "den_vau" },
  { keywords: ["hoàng thùy linh", "see tình"], imageKey: "hoang_thuy_linh" },
  { keywords: ["trịnh công sơn", "diễm xưa"], imageKey: "trinh_cong_son" },
  { keywords: ["văn cao", "tiến quân ca"], imageKey: "van_cao" },
  { keywords: ["phan mạnh quỳnh", "có chàng trai viết lên cây", "mắt biếc"], imageKey: "phan_manh_quynh" },
  { keywords: ["soobin", "phía sau một cô gái", "anh trai vượt ngàn chông gai"], imageKey: "soobin" },
  { keywords: ["hà anh tuấn", "see sing share"], imageKey: "ha_anh_tuan" },
  { keywords: ["tuấn hưng", "cầu vồng khuyết"], imageKey: "tuan_hung" },
  { keywords: ["đan trường", "anh bo", "kiếp ve sầu"], imageKey: "dan_truong" },
  { keywords: ["lam trường", "anh hai", "tình thôi xót xa"], imageKey: "lam_truong" },

  // K-Pop
  { keywords: ["seventeen", "pledis", "3 nhóm nhỏ", "hip-hop team, vocal team"], imageKey: "seventeen" },
  { keywords: ["jungkook", "album golden", "'seven'"], imageKey: "jungkook" },
  { keywords: ["bts", "dynamite", "army", "nam-joon", "big hit"], imageKey: "bts" },
  { keywords: ["lisa", "thái lan"], imageKey: "lisa_bp" },
  { keywords: ["jisoo", "flower"], imageKey: "jisoo_bp" },
  { keywords: ["rosé", "melbourne"], imageKey: "rose_bp" },
  { keywords: ["jennie"], imageKey: "jennie_bp" },
  { keywords: ["blackpink", "blink", "ddu-du", "búa hơi"], imageKey: "blackpink" },
  { keywords: ["psy", "gangnam style"], imageKey: "psy" },
  { keywords: ["twice", "shy shy shy", "cheer up"], imageKey: "twice" },
  { keywords: ["taeyeon"], imageKey: "taeyeon" },
  { keywords: ["snsd", "girls' generation", "gee"], imageKey: "snsd" },
  { keywords: ["g-dragon"], imageKey: "g_dragon" },
  { keywords: ["bigbang", "haru haru", "taeyang"], imageKey: "bigbang" },
  { keywords: ["super junior", "sorry, sorry"], imageKey: "super_junior" },
  { keywords: ["newjeans", "attention", "hype boy"], imageKey: "newjeans" },
  { keywords: ["aespa", "next level", "metaverse"], imageKey: "aespa" },
  { keywords: ["seventeen"], imageKey: "seventeen" },
  { keywords: ["exo", "growl"], imageKey: "exo" },
  { keywords: ["2ne1", "i am the best"], imageKey: "2ne1" },
  { keywords: ["boa"], imageKey: "boa_singer" },

  // US-UK & Singers
  { keywords: ["michael jackson", "thriller", "moonwalk", "ông hoàng nhạc pop"], imageKey: "michael_jackson" },
  { keywords: ["taylor swift", "eras tour", "swifties"], imageKey: "taylor_swift" },
  { keywords: ["adele", "rolling in the deep", "skyfall", "album '21'"], imageKey: "adele" },
  { keywords: ["ed sheeran", "shape of you", "thinking out loud"], imageKey: "ed_sheeran" },
  { keywords: ["queen", "bohemian rhapsody", "freddie mercury"], imageKey: "queen_band" },
  { keywords: ["beatles", "liverpool", "john lennon"], imageKey: "beatles" },
  { keywords: ["mariah carey", "christmas"], imageKey: "mariah_carey" },
  { keywords: ["justin bieber", "baby, baby"], imageKey: "justin_bieber" },
  { keywords: ["beyoncé", "queen bey"], imageKey: "beyonce" },
  { keywords: ["bruno mars", "uptown funk", "silk sonic"], imageKey: "bruno_mars" },
  { keywords: ["billie eilish", "bad guy"], imageKey: "billie_eilish" },
  { keywords: ["eminem", "rap god", "lose yourself"], imageKey: "eminem" },
  { keywords: ["the weeknd", "blinding lights", "starboy"], imageKey: "the_weeknd" },
  { keywords: ["lady gaga", "bad romance", "shallow"], imageKey: "lady_gaga" },
  { keywords: ["rihanna", "fenty", "umbrella"], imageKey: "rihanna" },
  { keywords: ["katy perry", "roar"], imageKey: "katy_perry" },
  { keywords: ["maroon 5", "sugar", "adam levine"], imageKey: "maroon_5" },
  { keywords: ["coldplay", "viva la vida"], imageKey: "coldplay" },
  { keywords: ["ariana grande", "7 rings"], imageKey: "ariana_grande" },
  { keywords: ["céline dion", "celine dion", "my heart will go on"], imageKey: "celine_dion" },
  { keywords: ["whitney houston", "i will always love you"], imageKey: "whitney_houston" },
  { keywords: ["elvis presley", "rock and roll"], imageKey: "elvis_presley" },
  { keywords: ["britney spears", "baby one more time"], imageKey: "britney_spears" },
  { keywords: ["shakira", "waka waka"], imageKey: "shakira" },
  { keywords: ["drake", "god's plan"], imageKey: "drake" },
  { keywords: ["miley cyrus", "hannah montana", "flowers"], imageKey: "miley_cyrus" },
  { keywords: ["selena gomez", "rare beauty"], imageKey: "selena_gomez" },
  { keywords: ["john legend", "all of me"], imageKey: "john_legend" },
  { keywords: ["grammy"], imageKey: "grammy" },

  // Địa lý
  { keywords: ["cửu long", "mê kông", "mekong"], imageKey: "mekong" },
  { keywords: ["sông hồng", "sông đà"], imageKey: "red_river" },
  { keywords: ["canberra", "nước úc", "lục địa"], imageKey: "canberra" },
  { keywords: ["ottawa", "canada"], imageKey: "ottawa" },
  { keywords: ["fansipan", "đông dương"], imageKey: "fansipan" },
  { keywords: ["sơn đoòng", "quảng bình"], imageKey: "son_doong" },
  { keywords: ["sông nile", "sông nin"], imageKey: "nile" },
  { keywords: ["amazon"], imageKey: "amazon_river" },
  { keywords: ["thái bình dương", "đại dương"], imageKey: "pacific_ocean" },
  { keywords: ["kim tự tháp", "giza", "ai cập"], imageKey: "pyramids" },
  { keywords: ["liên bang nga", "nước nga"], imageKey: "russia" },
  { keywords: ["vatican"], imageKey: "vatican" },
  { keywords: ["phú sĩ", "fuji", "mặt trời mọc", "nhật bản"], imageKey: "mount_fuji" },
  { keywords: ["hà lan", "cối xay gió", "tulip"], imageKey: "netherlands" },
  { keywords: ["nepal"], imageKey: "nepal_flag" },
  { keywords: ["hạ long"], imageKey: "ha_long_bay" },
  { keywords: ["angkor wat", "campuchia"], imageKey: "angkor_wat" },
  { keywords: ["washington"], imageKey: "washington_dc" },
  { keywords: ["taj mahal", "ấn độ"], imageKey: "taj_mahal" },
  { keywords: ["nam cực"], imageKey: "antarctica" },
  { keywords: ["sahara", "sa mạc", "atacama"], imageKey: "sahara" },
  { keywords: ["baikal"], imageKey: "lake_baikal" },
  { keywords: ["kênh đào suez", "biển chết"], imageKey: "suez_canal" },
  { keywords: ["panama"], imageKey: "panama_canal" },
  { keywords: ["niagara"], imageKey: "niagara_falls" },
  { keywords: ["thác angel", "andes"], imageKey: "angel_falls" },
  { keywords: ["venice", "gondola"], imageKey: "venice" },
  { keywords: ["bangkok", "krung thep", "thái lan"], imageKey: "bangkok" },
  { keywords: ["tháp nghiêng pisa"], imageKey: "leaning_tower_pisa" },
  { keywords: ["everest", "himalaya"], imageKey: "mount_everest" },

  // Anime Nhật Bản
  { keywords: ["pikachu", "pokémon", "pokemon", "hỏa tiễn"], imageKey: "pikachu" },
  { keywords: ["zoro", "tam kiếm"], imageKey: "zoro" },
  { keywords: ["luffy", "vua hải tặc", "gomu", "sanji", "one piece", "sunny", "mũ rơm"], imageKey: "luffy" },
  { keywords: ["ramen ichiraku"], imageKey: "ramen" },
  { keywords: ["naruto", "cửu vĩ", "uchiha", "sharingan", "phân thân"], imageKey: "naruto" },
  { keywords: ["vegeta", "ca-đíc"], imageKey: "vegeta" },
  { keywords: ["goku", "kakarot", "kamehameha", "ngọc rồng", "shenron", "dragon ball"], imageKey: "goku" },
  { keywords: ["shin", "bút chì", "bạch tuyết (shiro)"], imageKey: "shin_chan" },
  { keywords: ["thủy thủ mặt trăng", "sailor moon", "tuxedo", "mèo đen biết nói"], imageKey: "sailor_moon" },
  { keywords: ["totoro", "ghibli"], imageKey: "totoro" },
  { keywords: ["vùng đất linh hồn", "spirited away", "chihiro"], imageKey: "spirited_away" },
  { keywords: ["slam dunk", "sakuragi", "bóng rổ"], imageKey: "slam_dunk" },
  { keywords: ["yu-gi-oh", "vua trò chơi", "rồng trắng mắt xanh", "kaiba"], imageKey: "yugioh" },
  { keywords: ["inuyasha", "ngọc tứ hồn", "thiết toái nha"], imageKey: "inuyasha" },
  { keywords: ["titan", "eren", "levi ackerman"], imageKey: "attack_on_titan" },
  { keywords: ["thanh gươm diệt quỷ", "tanjiro", "nezuko"], imageKey: "demon_slayer" },
  { keywords: ["death note", "ryuk", "thám tử l"], imageKey: "death_note" },

  // Phim Trung Quốc
  { keywords: ["tôn ngộ không", "lục tiểu linh đồng", "gậy như ý", "ngũ hành sơn", "bạch cốt tinh", "thiên cung"], imageKey: "sun_wukong" },
  { keywords: ["tây du ký", "trư bát giới", "sa tăng", "bạch long mã", "quạt ba tiêu", "đường tăng", "nữ nhi quốc", "ngô thừa ân"], imageKey: "journey_to_west" },
  { keywords: ["tiểu yến tử", "triệu vy", "hoàn châu cách cách", "tử vy", "nhĩ khang", "dung ma ma"], imageKey: "zhao_wei" },
  { keywords: ["kim tỏa", "phạm băng băng"], imageKey: "fan_bingbing" },
  { keywords: ["lưu diệc phi", "tiểu long nữ", "thần điêu"], imageKey: "liu_yifei" },
  { keywords: ["kim dung", "tiêu phong", "đoàn dự", "quách tĩnh", "hoàng dung", "trương vô kỵ", "triệu mẫn", "lệnh hồ xung", "đông phương bất bại", "vi tiểu bảo"], imageKey: "jin_yong" },
  { keywords: ["bao thanh thiên", "bao chửng", "triển chiêu"], imageKey: "bao_zheng" },
  { keywords: ["na tra", "phong hỏa luân", "trầm hương", "nhị lang thần"], imageKey: "nezha" },
  { keywords: ["gia cát lượng", "khổng minh"], imageKey: "zhuge_liang" },
  { keywords: ["tam quốc", "quan vũ", "lữ bố", "vườn đào", "võ tòng", "lương sơn bạc"], imageKey: "guan_yu" },

  // Hoạt hình Mỹ
  { keywords: ["tom and jerry", "spike"], imageKey: "tom_and_jerry" },
  { keywords: ["mickey mouse", "chuột mickey"], imageKey: "mickey_mouse" },
  { keywords: ["donald duck", "vịt donald"], imageKey: "donald_duck" },
  { keywords: ["spongebob", "patrick star", "ốc sên gary"], imageKey: "spongebob" },
  { keywords: ["ben 10", "omnitrix", "four arms", "heatblast"], imageKey: "ben_10" },
  { keywords: ["phineas", "ferb", "perry", "doofenshmirtz", "candace"], imageKey: "phineas_and_ferb" },
  { keywords: ["powerpuff", "blossom", "mojo jojo"], imageKey: "powerpuff_girls" },
  { keywords: ["scooby-doo", "shaggy"], imageKey: "scooby_doo" },
  { keywords: ["nàng tiên cá", "ariel"], imageKey: "little_mermaid" },
  { keywords: ["aladdin", "robin williams"], imageKey: "robin_williams" },
  { keywords: ["toy story", "woody", "buzz lightyear"], imageKey: "toy_story" },
  { keywords: ["shrek"], imageKey: "shrek" },
  { keywords: ["minions", "kẻ trộm mặt trăng"], imageKey: "minions" },
  { keywords: ["vút bay", "carl fredricksen"], imageKey: "up_pixar" },
  { keywords: ["ratatouille", "chuột đầu bếp"], imageKey: "ratatouille" },

  // Phim Mỹ & Việt Nam
  { keywords: ["avatar", "pandora"], imageKey: "avatar_film" },
  { keywords: ["james cameron"], imageKey: "james_cameron" },
  { keywords: ["găng tay vô cực", "avengers", "thanos"], imageKey: "avengers" },
  { keywords: ["trấn thành", "bố già", "phim 'mai'"], imageKey: "tran_thanh" },
  { keywords: ["lý hải", "lật mặt"], imageKey: "ly_hai" },
  { keywords: ["ngô thanh vân", "hai phượng"], imageKey: "ngo_thanh_van" },
  { keywords: ["áo dài", "cô ba sài gòn"], imageKey: "ao_dai" },
  { keywords: ["interstellar", "hố đen"], imageKey: "interstellar" },
  { keywords: ["inception", "dom cobb", "con quay"], imageKey: "inception" },
  { keywords: ["joker", "heath ledger", "dark knight"], imageKey: "heath_ledger_joker" },
  { keywords: ["john wick", "keanu reeves"], imageKey: "keanu_reeves" },
  { keywords: ["ma trận", "the matrix", "viên thuốc"], imageKey: "the_matrix" },
  { keywords: ["tom cruise", "mission: impossible"], imageKey: "tom_cruise" },
  { keywords: ["jack sparrow", "pirates", "cướp biển"], imageKey: "jack_sparrow" },
  { keywords: ["the godfather", "mario puzo", "vito corleone"], imageKey: "godfather" },
  { keywords: ["jurassic park", "kỷ jura"], imageKey: "jurassic_park" },
  { keywords: ["chúa tể của những chiếc nhẫn", "frodo", "gollum"], imageKey: "lord_of_the_rings" },
  { keywords: ["oppenheimer"], imageKey: "oppenheimer" },
  { keywords: ["ở nhà một mình", "home alone", "kevin mccallister"], imageKey: "home_alone" },
  { keywords: ["forrest gump", "tom hanks"], imageKey: "forrest_gump" }
];

const CATEGORY_DEFAULT_IMAGES = {
  "Doraemon": VERIFIED_IMAGES.doraemon,
  "Conan – Thám tử lừng danh": VERIFIED_IMAGES.conan,
  "Phim Hàn Quốc (K-Drama)": VERIFIED_IMAGES.seoul_tower,
  "Âm nhạc Việt Nam": VERIFIED_IMAGES.son_tung,
  "K-Pop": VERIFIED_IMAGES.bts,
  "US-UK": VERIFIED_IMAGES.michael_jackson,
  "Địa lý cơ bản": VERIFIED_IMAGES.earth,
  "Hoạt hình tuổi thơ Nhật Bản": VERIFIED_IMAGES.pikachu,
  "Phim & hoạt hình tuổi thơ Trung Quốc": VERIFIED_IMAGES.sun_wukong,
  "Hoạt hình tuổi thơ Mỹ": VERIFIED_IMAGES.mickey_mouse,
  "Đoán tên ca sĩ nổi tiếng": VERIFIED_IMAGES.taylor_swift,
  "Phim Mỹ & Phim Việt Nam": VERIFIED_IMAGES.avengers
};

function resolveImage(q, catName) {
  if (q.image_url && q.image_url.startsWith("http")) {
    return q.image_url;
  }
  if (q.youtube_video_id) {
    return `https://img.youtube.com/vi/${q.youtube_video_id}/hqdefault.jpg`;
  }
  const searchText = `${q.prompt || ""} ${(q.options || []).join(" ")}`.toLowerCase();
  for (const rule of KEYWORD_IMAGE_RULES) {
    for (const kw of rule.keywords) {
      if (searchText.includes(kw.toLowerCase())) {
        const url = VERIFIED_IMAGES[rule.imageKey];
        if (url) return url;
      }
    }
  }
  return CATEGORY_DEFAULT_IMAGES[q.category || catName] || VERIFIED_IMAGES.cinema;
}

const categories = [
  { name: "Doraemon", items: doraemon },
  { name: "Conan – Thám tử lừng danh", items: conan },
  { name: "Phim Hàn Quốc (K-Drama)", items: kdrama },
  { name: "Âm nhạc Việt Nam", items: vpop },
  { name: "K-Pop", items: kpop },
  { name: "US-UK", items: usuk },
  { name: "Địa lý cơ bản", items: geography },
  { name: "Hoạt hình tuổi thơ Nhật Bản", items: japanAnime },
  { name: "Phim & hoạt hình tuổi thơ Trung Quốc", items: chinaClassics },
  { name: "Hoạt hình tuổi thơ Mỹ", items: usCartoons },
  { name: "Đoán tên ca sĩ nổi tiếng", items: famousSingers },
  { name: "Phim Mỹ & Phim Việt Nam", items: moviesUsVn }
];

console.log("=== BẮT ĐẦU XÂY DỰNG NGÂN HÀNG CÂU HỎI QUIZ PARTY (ĐẦY ĐỦ HÌNH ẢNH) ===");

let totalQuestions = 0;
const allQuestions = [];
const promptSet = new Set();

categories.forEach((cat, catIdx) => {
  const extras = extraQuestions[cat.name] || [];
  const combinedItems = [...cat.items, ...extras];
  console.log(`- Chủ đề ${catIdx + 1}: ${cat.name} (${combinedItems.length} câu)`);
  totalQuestions += combinedItems.length;

  combinedItems.forEach((q, qIdx) => {
    if (!q.prompt || !q.options || q.options.length < 2) {
      throw new Error(`Câu hỏi không hợp lệ tại ${cat.name} - câu số ${qIdx + 1}`);
    }
    if (q.correct_index === undefined || q.correct_index < 0 || q.correct_index >= q.options.length) {
      throw new Error(`Đáp án đúng không hợp lệ tại câu: "${q.prompt}"`);
    }

    const cleanPrompt = q.prompt.trim().toLowerCase();
    if (promptSet.has(cleanPrompt)) {
      console.warn(`[Cảnh báo trùng lặp]: "${q.prompt}"`);
    }
    promptSet.add(cleanPrompt);

    const resolvedImg = resolveImage(q, cat.name);

    // Tự động gán YouTube Video ID chuẩn cho các câu hỏi thuộc chủ đề Âm nhạc (V-Pop, K-Pop, US-UK)
    let finalYoutubeId = q.youtube_video_id || null;
    let finalSource = q.source || null;
    let finalType = q.question_type || "MULTIPLE_CHOICE";

    const isMusicCategory =
      cat.name === "Âm nhạc Việt Nam" ||
      cat.name === "K-Pop" ||
      cat.name === "US-UK";

    if (isMusicCategory) {
      const mapKey =
        cat.name === "Âm nhạc Việt Nam"
          ? "vpop"
          : cat.name === "K-Pop"
          ? "kpop"
          : "usuk";
      const entries = musicYoutubeMap[mapKey] || [];
      const searchHaystack = `${q.prompt} ${(q.options || []).join(" ")}`.toLowerCase();

      for (const entry of entries) {
        if (entry.match.some((m) => searchHaystack.includes(m.toLowerCase()))) {
          finalYoutubeId = entry.yt;
          finalSource = entry.title;
          finalType = "AUDIO_GUESS";
          break;
        }
      }

      // Nếu vẫn chưa có video riêng, gán các video MV đại diện chuẩn theo chủ đề để người chơi luôn được nghe nhạc đoán bài hát
      if (!finalYoutubeId) {
        if (cat.name === "Âm nhạc Việt Nam") {
          finalYoutubeId = "gJHSDZfJrRY"; // See Tình
          finalSource = "Hoàng Thùy Linh - See Tình";
        } else if (cat.name === "K-Pop") {
          finalYoutubeId = "gdZLi9oWNZg"; // Dynamite
          finalSource = "BTS - Dynamite";
        } else {
          finalYoutubeId = "sOnqjkJTMaA"; // Thriller
          finalSource = "Michael Jackson - Thriller";
        }
        finalType = "AUDIO_GUESS";
      }
    }

    // Đảm bảo phân bố chuẩn 3 mức độ: Dễ (easy: 18 câu), Vừa (medium: 18 câu), Khó (hard: 16 câu) cho mỗi chủ đề
    let balancedDifficulty = q.difficulty || "medium";
    if (qIdx < 18) {
      balancedDifficulty = "easy";
    } else if (qIdx < 36) {
      balancedDifficulty = "medium";
    } else {
      balancedDifficulty = "hard";
    }

    // Đa dạng hóa vị trí đáp án đúng (0, 1, 2, 3) để không bị tập trung vào đáp án A
    const origOptions = [...q.options];
    const correctText = origOptions[q.correct_index];
    const targetCorrectIdx = (catIdx * 7 + qIdx * 3) % origOptions.length;
    if (targetCorrectIdx !== q.correct_index) {
      const temp = origOptions[targetCorrectIdx];
      origOptions[targetCorrectIdx] = correctText;
      origOptions[q.correct_index] = temp;
    }

    const questionObj = {
      id: `q-${catIdx + 1}-${qIdx + 1}`,
      round_no: Math.floor(allQuestions.length / 10) + 1,
      question_no: allQuestions.length + 1,
      category: q.category || cat.name,
      prompt: q.prompt.trim(),
      options: origOptions,
      correct_index: targetCorrectIdx,
      explanation: q.explanation || "Không có giải thích chi tiết.",
      image_url: resolvedImg,
      audio_url: q.audio_url || null,
      video_url: q.video_url || null,
      youtube_video_id: finalYoutubeId,
      question_type: finalType,
      difficulty: balancedDifficulty,
      points: balancedDifficulty === "hard" ? 1200 : balancedDifficulty === "medium" ? 1000 : 1000,
      time_limit: q.time_limit || 20,
      source: finalSource,
      is_double_points: Boolean(q.is_double_points || (qIdx + 1) % 10 === 0),
      active: true
    };

    allQuestions.push(questionObj);
  });
});

console.log(`\n=> TỔNG CỘNG ĐÃ TẠO: ${allQuestions.length} CÂU HỎI (100% CÓ HÌNH ẢNH MINH HỌA).`);

// 1. Xuất file JSON
const jsonPath = path.join(__dirname, "..", "data", "questionBank.json");
fs.writeFileSync(jsonPath, JSON.stringify(allQuestions, null, 2), "utf8");
console.log(`[Thành công] Đã lưu dữ liệu vào: ${jsonPath}`);

// 2. Xuất file SQL Seed (bao gồm UPDATE 20 câu hỏi gốc + INSERT/UPDATE 504 câu hỏi mới)
const sqlPath = path.join(__dirname, "..", "supabase", "seed_500_questions.sql");
let sqlContent = `-- SEED FILE: 504 CÂU HỎI QUIZ PARTY CHẤT LƯỢNG CAO (ĐẦY ĐỦ HÌNH ẢNH MINH HỌA)
-- Phân bố đều qua 12 chủ đề bắt buộc + Cập nhật hình ảnh cho 20 câu hỏi gốc

DO $$
BEGIN
  RAISE NOTICE 'Bắt đầu cập nhật hình ảnh và nạp ngân hàng câu hỏi...';
END $$;

-- 1. CẬP NHẬT HÌNH ẢNH CHO 20 CÂU HỎI GỐC TRONG SUPABASE (NẾU ĐANG CÓ)
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.iron_man}' WHERE prompt ILIKE '%tỷ phú thiên tài%Marvel%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.ron_weasley}' WHERE prompt ILIKE '%Harry Potter%bạn thân%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.doraemon}' WHERE prompt ILIKE '%mèo máy đến từ tương lai%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.conan}' WHERE prompt ILIKE '%Thám tử bị teo nhỏ%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.titanic}' WHERE prompt ILIKE '%con tàu nổi tiếng bị chìm%Jack%Rose%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.elsa}' WHERE prompt ILIKE '%Let It Go%Elsa%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.bts}' WHERE prompt ILIKE '%Nhóm nhạc Hàn Quốc%Dynamite%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.michael_jackson}' WHERE prompt ILIKE '%Ông hoàng nhạc Pop%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.link_zelda}' WHERE prompt ILIKE '%The Legend of Zelda%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.mario}' WHERE prompt ILIKE '%nấm%công chúa Peach%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.ronaldo}' WHERE prompt ILIKE '%biệt danh CR7%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.world_cup_2022}' WHERE prompt ILIKE '%World Cup nam năm 2022%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.apple_logo}' WHERE prompt ILIKE '%quả táo bị cắn%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.italy}' WHERE prompt ILIKE '%hình chiếc ủng%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.mars}' WHERE prompt ILIKE '%Hành tinh Đỏ%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.earth}' WHERE prompt ILIKE '%năm nhuận%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.panda}' WHERE prompt ILIKE '%🐼🥋%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.spider_man}' WHERE prompt ILIKE '%🕷️🧑%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.paris}' WHERE prompt ILIKE '%Thành phố Ánh sáng%';
UPDATE public.quiz_questions SET image_url = '${VERIFIED_IMAGES.lion_king}' WHERE prompt ILIKE '%Vua Sư Tử%Simba%';

-- 2. NẠP 504 CÂU HỎI MỚI VÀ CẬP NHẬT HÌNH ẢNH NẾU ĐÃ TỒN TẠI
`;

allQuestions.forEach((q) => {
  const esc = (str) => (str ? str.replace(/'/g, "''") : "");
  const optJson = JSON.stringify(q.options).replace(/'/g, "''");
  const img = q.image_url ? `'${esc(q.image_url)}'` : "NULL";
  const audio = q.audio_url ? `'${esc(q.audio_url)}'` : "NULL";
  const video = q.video_url ? `'${esc(q.video_url)}'` : "NULL";
  const yt = q.youtube_video_id ? `'${esc(q.youtube_video_id)}'` : "NULL";
  const src = q.source ? `'${esc(q.source)}'` : "NULL";

  sqlContent += `INSERT INTO public.quiz_questions (
  round_no, question_no, category, prompt, options, correct_index, explanation,
  image_url, audio_url, video_url, youtube_video_id, question_type, difficulty, points, time_limit, source, is_double_points, active
) SELECT
  ${q.round_no}, ${q.question_no}, '${esc(q.category)}', '${esc(q.prompt)}', '${optJson}'::jsonb, ${q.correct_index}, '${esc(q.explanation)}',
  ${img}, ${audio}, ${video}, ${yt}, '${esc(q.question_type)}', '${esc(q.difficulty)}', ${q.points}, ${q.time_limit}, ${src}, ${q.is_double_points}, true
WHERE NOT EXISTS (
  SELECT 1 FROM public.quiz_questions WHERE lower(trim(prompt)) = lower('${esc(q.prompt)}')
);
UPDATE public.quiz_questions SET image_url = ${img} WHERE lower(trim(prompt)) = lower('${esc(q.prompt)}') AND (image_url IS NULL OR image_url = '');
`;
});

sqlContent += `
DO $$
DECLARE
  v_total int;
BEGIN
  SELECT count(*) INTO v_total FROM public.quiz_questions WHERE active = true;
  RAISE NOTICE 'Đã nạp xong ngân hàng câu hỏi. Tổng số câu hỏi hiện có: %', v_total;
END $$;
`;

fs.writeFileSync(sqlPath, sqlContent, "utf8");
console.log(`[Thành công] Đã tạo file SQL seed: ${sqlPath}`);
