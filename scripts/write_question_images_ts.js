const fs = require('fs');
const path = require('path');
const { IMAGES } = require('./build_accurate_image_map.js');

const targetPath = path.join(__dirname, '../lib/questionImages.ts');

const tsContent = `import { Question } from "./types";

/**
 * Kho hình ảnh xác thực chuẩn HD từ Wikipedia / Wikimedia Commons cho tất cả nhân vật, phim, địa danh, ca sĩ
 */
export const VERIFIED_IMAGES: Record<string, string> = ${JSON.stringify(IMAGES, null, 2)};

export const CATEGORY_DEFAULT_IMAGES: Record<string, string> = {
  "Doraemon": VERIFIED_IMAGES.doraemon_main,
  "Conan – Thám tử lừng danh": VERIFIED_IMAGES.conan_main,
  "Phim Hàn Quốc (K-Drama)": VERIFIED_IMAGES.seoul_tower,
  "Âm nhạc Việt Nam": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #1": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #2": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #3": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #4": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #5": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #6": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #7": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #8": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #9": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #10": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #11": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #12": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #13": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #14": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #15": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #16": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #17": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #18": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #19": VERIFIED_IMAGES.son_tung,
  "Âm nhạc Việt #20": VERIFIED_IMAGES.son_tung,
  "Đoán quốc gia qua Google Map 360°": VERIFIED_IMAGES.equator,
  "K-Pop": VERIFIED_IMAGES.bts,
  "US-UK": VERIFIED_IMAGES.michael_jackson,
  "Địa lý cơ bản": VERIFIED_IMAGES.equator,
  "Hoạt hình tuổi thơ Nhật Bản": VERIFIED_IMAGES.pokemon_pikachu,
  "Phim & hoạt hình tuổi thơ Trung Quốc": VERIFIED_IMAGES.sun_wukong,
  "Hoạt hình tuổi thơ Mỹ": VERIFIED_IMAGES.mickey_mouse,
  "Đoán tên ca sĩ nổi tiếng": VERIFIED_IMAGES.son_tung,
  "Phim Mỹ & Phim Việt Nam": VERIFIED_IMAGES.avatar_film
};

/**
 * Tự động tìm hình ảnh minh họa chuẩn xác 100% theo câu hỏi và đáp án đúng
 */
export function resolveQuestionImage(question: Partial<Question> | null | undefined): string {
  if (!question) return VERIFIED_IMAGES.equator;

  // 1. Nếu là câu hỏi Google Map 360°
  if (question.street_view_url && question.street_view_url.startsWith("http")) {
    return question.street_view_url;
  }

  // 2. Nếu câu hỏi có YouTube Video ID (Âm nhạc) -> lấy ảnh thumbnail chính thức từ video YouTube
  if (question.youtube_video_id) {
    return \`https://img.youtube.com/vi/\${question.youtube_video_id}/hqdefault.jpg\`;
  }

  // 3. Nếu câu hỏi đã có sẵn image_url hợp lệ (không rỗng và trỏ tới http/https) -> ưu tiên sử dụng
  if (question.image_url && question.image_url.startsWith("http")) {
    return question.image_url;
  }

  const prompt = (question.prompt || "").toLowerCase();
  const options = question.options || [];
  const correctIdx = typeof question.correct_index === "number" ? question.correct_index : 0;
  const ans = (options[correctIdx] || "").toLowerCase();
  const cat = question.category || "";
  const search = \`\${prompt} \${ans}\`;

  const check = (keywords: string[]) => {
    for (const kw of keywords) {
      if (ans.includes(kw)) return true;
    }
    for (const kw of keywords) {
      if (prompt.includes(kw)) return true;
    }
    return false;
  };

  // 1. Doraemon
  if (cat === "Doraemon") {
    if (check(["melonpan", "dưa lưới"])) return VERIFIED_IMAGES.melonpan;
    if (check(["dorayaki", "bánh rán"])) return VERIFIED_IMAGES.dorayaki;
    if (check(["chuột"])) return VERIFIED_IMAGES.mouse;
    if (check(["dorami"])) return VERIFIED_IMAGES.dorami;
    if (check(["shizuka", "xuka"])) return VERIFIED_IMAGES.shizuka;
    if (check(["suneo", "xêkô"])) return VERIFIED_IMAGES.suneo;
    if (check(["jaian", "chaien", "takeshi"])) return VERIFIED_IMAGES.jaian;
    if (check(["dekisugi", "đêkhi"])) return VERIFIED_IMAGES.dekisugi;
    if (check(["sewashi"])) return VERIFIED_IMAGES.sewashi;
    if (check(["tamako"])) return VERIFIED_IMAGES.tamako_nobi;
    if (check(["nobisuke"])) return VERIFIED_IMAGES.nobisuke_nobi;
    if (check(["jaiko"])) return VERIFIED_IMAGES.jaiko;
    if (check(["mini-dora", "mini dora"])) return VERIFIED_IMAGES.mini_dora;
    if (check(["chong chóng tre"])) return VERIFIED_IMAGES.take_copter;
    if (check(["cánh cửa thần kỳ"])) return VERIFIED_IMAGES.dokodemo_door;
    if (check(["cỗ máy thời gian", "ngăn kéo"])) return VERIFIED_IMAGES.time_machine;
    if (check(["khăn trùm thời gian"])) return VERIFIED_IMAGES.time_cloth;
    if (check(["đèn pin thu nhỏ", "đèn pin phóng to"])) return VERIFIED_IMAGES.small_light;
    if (check(["bánh mì chuyển ngữ", "konyaku"])) return VERIFIED_IMAGES.translation_konyaku;
    if (check(["pi-suke", "khủng long"])) return VERIFIED_IMAGES.pisuke;
    if (check(["fujiko"])) return VERIFIED_IMAGES.fujiko_fujio;
    if (check(["nobita", "chơi dây", "bắn súng", "0.93"])) return VERIFIED_IMAGES.nobita;
    if (check(["khoai lang"])) return VERIFIED_IMAGES.sweet_potato;
    if (check(["bóng chày"])) return VERIFIED_IMAGES.baseball;
    if (prompt.includes("màu vàng") && prompt.includes("nguyên bản")) return VERIFIED_IMAGES.doraemon_yellow;
    return VERIFIED_IMAGES.doraemon_main;
  }

  // 2. Conan
  if (cat === "Conan – Thám tử lừng danh") {
    if (ans.includes("kaito kid") || ans.includes("kuroba") || ans.includes("1412")) return VERIFIED_IMAGES.kaito_kid;
    if (ans.includes("shinichi")) return VERIFIED_IMAGES.shinichi;
    if (ans.includes("haibara") || ans.includes("shiho") || ans.includes("sherry")) return VERIFIED_IMAGES.ai_haibara;
    if (ans.includes("heiji") || ans.includes("hattori")) return VERIFIED_IMAGES.heiji_hattori;
    if (ans.includes("kazuha")) return VERIFIED_IMAGES.kazuha;
    if (ans.includes("agasa")) return VERIFIED_IMAGES.agasa;
    if (ans.includes("ran mori") || ans.includes("karate")) return VERIFIED_IMAGES.ran_mori;
    if (ans.includes("kogoro") || ans.includes("ngủ gật")) return VERIFIED_IMAGES.kogoro_mori;
    if (ans.includes("vermouth") || ans.includes("chris vineyard")) return VERIFIED_IMAGES.vermouth;
    if (ans.includes("akai") || ans.includes("rye") || ans.includes("subaru")) return VERIFIED_IMAGES.shuichi_akai;
    if (ans.includes("amuro") || ans.includes("bourbon") || ans.includes("furuya")) return VERIFIED_IMAGES.toru_amuro;
    if (ans.includes("eri kisaki")) return VERIFIED_IMAGES.eri_kisaki;
    if (ans.includes("yusaku") || ans.includes("yukiko")) return VERIFIED_IMAGES.yusaku_kudo;
    if (ans.includes("aptx")) return VERIFIED_IMAGES.aptx_4869;
    if (ans.includes("gin") || ans.includes("vodka") || ans.includes("áo đen")) return VERIFIED_IMAGES.gin_vodka;
    if (ans.includes("đội thám tử nhí") || ans.includes("ayumi") || ans.includes("mitsuhiko") || ans.includes("genta")) return VERIFIED_IMAGES.detective_boys;
    if (ans.includes("cơm lươn")) return VERIFIED_IMAGES.unagi;
    if (ans.includes("ánh trăng") || ans.includes("sonata") || ans.includes("piano")) return VERIFIED_IMAGES.moonlight_sonata;
    if (ans.includes("osaka")) return VERIFIED_IMAGES.osaka_castle;
    if (ans.includes("tháp tokyo") || ans.includes("matsuda")) return VERIFIED_IMAGES.tokyo_tower;
    if (ans.includes("fbi")) return VERIFIED_IMAGES.fbi_badge;
    if (ans.includes("gosho aoyama")) return VERIFIED_IMAGES.gosho_aoyama;

    if (prompt.includes("kaito kid") || prompt.includes("kuroba") || prompt.includes("1412")) return VERIFIED_IMAGES.kaito_kid;
    if (prompt.includes("haibara") || prompt.includes("shiho") || prompt.includes("sherry")) return VERIFIED_IMAGES.ai_haibara;
    if (prompt.includes("heiji") || prompt.includes("hattori")) return VERIFIED_IMAGES.heiji_hattori;
    if (prompt.includes("kazuha")) return VERIFIED_IMAGES.kazuha;
    if (prompt.includes("agasa") || prompt.includes("tiến sĩ")) return VERIFIED_IMAGES.agasa;
    if (prompt.includes("ran mori") || prompt.includes("karate")) return VERIFIED_IMAGES.ran_mori;
    if (prompt.includes("kogoro") || prompt.includes("ngủ gật")) return VERIFIED_IMAGES.kogoro_mori;
    if (prompt.includes("vermouth") || prompt.includes("chris vineyard")) return VERIFIED_IMAGES.vermouth;
    if (prompt.includes("akai") || prompt.includes("rye") || prompt.includes("subaru")) return VERIFIED_IMAGES.shuichi_akai;
    if (prompt.includes("amuro") || prompt.includes("bourbon") || prompt.includes("furuya")) return VERIFIED_IMAGES.toru_amuro;
    if (prompt.includes("eri kisaki") || prompt.includes("luật sư")) return VERIFIED_IMAGES.eri_kisaki;
    if (prompt.includes("yusaku") || prompt.includes("yukiko")) return VERIFIED_IMAGES.yusaku_kudo;
    if (prompt.includes("aptx") || prompt.includes("độc dược")) return VERIFIED_IMAGES.aptx_4869;
    if (prompt.includes("gin") || prompt.includes("vodka") || prompt.includes("áo đen")) return VERIFIED_IMAGES.gin_vodka;
    if (prompt.includes("porsche 356")) return VERIFIED_IMAGES.porsche_356;
    if (prompt.includes("thám tử nhí") || prompt.includes("ayumi") || prompt.includes("mitsuhiko") || prompt.includes("genta")) return VERIFIED_IMAGES.detective_boys;
    if (prompt.includes("cơm lươn")) return VERIFIED_IMAGES.unagi;
    if (prompt.includes("ánh trăng") || prompt.includes("sonata") || prompt.includes("piano")) return VERIFIED_IMAGES.moonlight_sonata;
    if (prompt.includes("osaka")) return VERIFIED_IMAGES.osaka_castle;
    if (prompt.includes("tháp tokyo") || prompt.includes("matsuda")) return VERIFIED_IMAGES.tokyo_tower;
    if (prompt.includes("fbi")) return VERIFIED_IMAGES.fbi_badge;
    if (prompt.includes("shinichi")) return VERIFIED_IMAGES.shinichi;
    if (prompt.includes("gosho aoyama")) return VERIFIED_IMAGES.gosho_aoyama;

    return VERIFIED_IMAGES.conan_main;
  }

  // 3. Địa lý cơ bản
  if (cat === "Địa lý cơ bản") {
    if (check(["canberra", "nước úc", "australia"])) return VERIFIED_IMAGES.canberra;
    if (check(["sydney"])) return VERIFIED_IMAGES.sydney;
    if (check(["ottawa", "canada"])) return VERIFIED_IMAGES.ottawa;
    if (check(["fansipan", "nóc nhà đông dương"])) return VERIFIED_IMAGES.fansipan;
    if (check(["sơn đoòng", "quảng bình"])) return VERIFIED_IMAGES.son_doong;
    if (check(["sông nin", "sông nile", "nile"])) return VERIFIED_IMAGES.nile_river;
    if (check(["amazon"])) return VERIFIED_IMAGES.amazon_river;
    if (check(["mê kông", "mekong", "cửu long"])) return VERIFIED_IMAGES.mekong_river;
    if (check(["thái bình dương"])) return VERIFIED_IMAGES.pacific_ocean;
    if (check(["kim tự tháp", "giza", "ai cập"])) return VERIFIED_IMAGES.pyramids_giza;
    if (check(["nga", "moscow", "russia"])) return VERIFIED_IMAGES.russia;
    if (check(["vatican"])) return VERIFIED_IMAGES.vatican;
    if (check(["phú sĩ", "fuji"])) return VERIFIED_IMAGES.fuji_mountain;
    if (check(["hà lan", "cối xay gió"])) return VERIFIED_IMAGES.netherlands;
    if (check(["nepal"])) return VERIFIED_IMAGES.nepal_flag;
    if (check(["hạ long"])) return VERIFIED_IMAGES.ha_long_bay;
    if (check(["angkor wat", "campuchia"])) return VERIFIED_IMAGES.angkor_wat;
    if (check(["washington", "nhà trắng"])) return VERIFIED_IMAGES.washington_dc;
    if (check(["taj mahal", "ấn độ"])) return VERIFIED_IMAGES.taj_mahal;
    if (check(["nam cực"])) return VERIFIED_IMAGES.antarctica;
    if (check(["sahara", "atacama", "sa mạc"])) return VERIFIED_IMAGES.sahara;
    if (check(["baikal"])) return VERIFIED_IMAGES.lake_baikal;
    if (check(["suez"])) return VERIFIED_IMAGES.suez_canal;
    if (check(["panama"])) return VERIFIED_IMAGES.panama_canal;
    if (check(["niagara"])) return VERIFIED_IMAGES.niagara_falls;
    if (check(["thác angel", "angel"])) return VERIFIED_IMAGES.angel_falls;
    if (check(["paris", "eiffel"])) return VERIFIED_IMAGES.eiffel_tower;
    if (check(["venice"])) return VERIFIED_IMAGES.venice;
    if (check(["bangkok", "thái lan"])) return VERIFIED_IMAGES.bangkok;
    if (check(["pisa"])) return VERIFIED_IMAGES.leaning_tower_pisa;
    if (check(["everest", "himalaya"])) return VERIFIED_IMAGES.mount_everest;
    if (check(["vạn lý trường thành"])) return VERIFIED_IMAGES.great_wall_china;
    if (check(["colosseum", "đấu trường la mã"])) return VERIFIED_IMAGES.colosseum;
    if (check(["huế", "sông hương"])) return VERIFIED_IMAGES.hue_citadel;
    if (check(["đà lạt"])) return VERIFIED_IMAGES.dalat_city;
    if (check(["phú quốc"])) return VERIFIED_IMAGES.phu_quoc;
    if (check(["bản giốc"])) return VERIFIED_IMAGES.ban_gioc_falls;
    if (check(["đồng văn", "mã pí lèng"])) return VERIFIED_IMAGES.dong_van_karst;
    if (check(["greenwich"])) return VERIFIED_IMAGES.greenwich;
    if (check(["xích đạo", "equator"])) return VERIFIED_IMAGES.equator;
    if (check(["biển chết"])) return VERIFIED_IMAGES.dead_sea;
    if (check(["sông hồng", "sông đà"])) return VERIFIED_IMAGES.red_river;
    if (check(["vesuvius", "pompeii"])) return VERIFIED_IMAGES.vesuvius;
    if (check(["bering"])) return VERIFIED_IMAGES.bering_strait;
    if (check(["cam ranh"])) return VERIFIED_IMAGES.cam_ranh_bay;
    if (check(["brazil"])) return VERIFIED_IMAGES.brazil_flag;
    if (check(["nhật bản"])) return VERIFIED_IMAGES.japan_flag;
    if (check(["vương quốc anh", "nước anh"])) return VERIFIED_IMAGES.uk_flag;
    if (check(["pháp"])) return VERIFIED_IMAGES.france_flag;
    if (check(["ý", "italy"])) return VERIFIED_IMAGES.italy_flag;
    return VERIFIED_IMAGES.equator;
  }

  // 4. Đoán tên ca sĩ nổi tiếng
  if (cat === "Đoán tên ca sĩ nổi tiếng") {
    if (ans.includes("sơn tùng") || search.includes("m-tp") || search.includes("lạc trôi")) return VERIFIED_IMAGES.son_tung;
    if (ans.includes("mỹ tâm") || search.includes("họa mi tóc nâu")) return VERIFIED_IMAGES.my_tam;
    if (ans.includes("đen vâu") || search.includes("đi về nhà") || search.includes("nấu ăn cho em")) return VERIFIED_IMAGES.den_vau;
    if (ans.includes("lam trường") || search.includes("anh hai") || search.includes("tình thôi xót xa")) return VERIFIED_IMAGES.lam_truong;
    if (ans.includes("đan trường") || search.includes("anh bo") || search.includes("kiếp ve sầu")) return VERIFIED_IMAGES.dan_truong;
    if (ans.includes("tuấn hưng") || search.includes("cầu vồng khuyết")) return VERIFIED_IMAGES.tuan_hung;
    if (ans.includes("hà anh tuấn")) return VERIFIED_IMAGES.ha_anh_tuan;
    if (ans.includes("soobin")) return VERIFIED_IMAGES.soobin;
    if (ans.includes("phan mạnh quỳnh")) return VERIFIED_IMAGES.phan_manh_quynh;
    if (ans.includes("hoàng thùy linh")) return VERIFIED_IMAGES.hoang_thuy_linh;
    if (ans.includes("hieuthuhai")) return VERIFIED_IMAGES.hieuthuhai;
    if (ans.includes("trịnh công sơn")) return VERIFIED_IMAGES.trinh_cong_son;
    if (ans.includes("văn cao")) return VERIFIED_IMAGES.van_cao;
    if (ans.includes("bức tường") || ans.includes("trần lập")) return VERIFIED_IMAGES.buc_tuong;
    if (ans.includes("taylor swift")) return VERIFIED_IMAGES.taylor_swift;
    if (ans.includes("céline dion") || ans.includes("celine dion")) return VERIFIED_IMAGES.celine_dion;
    if (ans.includes("madonna") || search.includes("queen of pop") || search.includes("nữ hoàng nhạc pop")) return VERIFIED_IMAGES.madonna;
    if (ans.includes("ed sheeran")) return VERIFIED_IMAGES.ed_sheeran;
    if (ans.includes("elvis presley")) return VERIFIED_IMAGES.elvis_presley;
    if (ans.includes("britney spears")) return VERIFIED_IMAGES.britney_spears;
    if (ans.includes("rm") || ans.includes("jungkook") || ans.includes("bts")) return VERIFIED_IMAGES.bts;
    if (ans.includes("lee hyori")) return VERIFIED_IMAGES.lee_hyori;
    if (ans.includes("boa")) return VERIFIED_IMAGES.boa;
    if (ans.includes("taeyeon") || ans.includes("snsd")) return VERIFIED_IMAGES.taeyeon;
    if (ans.includes("g-dragon") || ans.includes("bigbang")) return VERIFIED_IMAGES.g_dragon;
    if (ans.includes("iu")) return VERIFIED_IMAGES.iu_kdrama;
    if (ans.includes("psy")) return VERIFIED_IMAGES.psy;
    if (ans.includes("michael jackson")) return VERIFIED_IMAGES.michael_jackson;
    if (ans.includes("adele")) return VERIFIED_IMAGES.adele;
    if (ans.includes("shakira")) return VERIFIED_IMAGES.shakira;
    if (ans.includes("whitney houston")) return VERIFIED_IMAGES.whitney_houston;
    if (ans.includes("mariah carey")) return VERIFIED_IMAGES.mariah_carey;
    if (ans.includes("justin bieber")) return VERIFIED_IMAGES.justin_bieber;
    if (ans.includes("bruno mars")) return VERIFIED_IMAGES.bruno_mars;
    return VERIFIED_IMAGES.son_tung;
  }

  // 5. Phim Mỹ & Phim Việt Nam
  if (cat === "Phim Mỹ & Phim Việt Nam") {
    if (search.includes("avatar") || search.includes("pandora")) return VERIFIED_IMAGES.avatar_film;
    if (search.includes("titanic") || search.includes("trái tim đại dương")) return VERIFIED_IMAGES.titanic_film;
    if (search.includes("iron man") || search.includes("tony stark")) return VERIFIED_IMAGES.iron_man;
    if (search.includes("avengers") || search.includes("găng tay vô cực") || search.includes("thanos")) return VERIFIED_IMAGES.avengers_endgame;
    if (search.includes("james cameron")) return VERIFIED_IMAGES.james_cameron;
    if (search.includes("phim mai") || ans === "mai") return VERIFIED_IMAGES.phim_mai;
    if (search.includes("trấn thành") || search.includes("bố già")) return VERIFIED_IMAGES.phim_bo_gia;
    if (search.includes("lý hải") || search.includes("lật mặt")) return VERIFIED_IMAGES.ly_hai;
    if (search.includes("mắt biếc")) return VERIFIED_IMAGES.phim_mat_biec;
    if (search.includes("hai phượng") || search.includes("ngô thanh vân")) return VERIFIED_IMAGES.phim_hai_phuong;
    if (search.includes("harry potter") || search.includes("hogwarts") || search.includes("quidditch")) return VERIFIED_IMAGES.harry_potter;
    if (search.includes("interstellar") || search.includes("hố đen")) return VERIFIED_IMAGES.interstellar;
    if (search.includes("inception") || search.includes("con quay")) return VERIFIED_IMAGES.inception;
    if (search.includes("joker") || search.includes("dark knight")) return VERIFIED_IMAGES.dark_knight_joker;
    if (search.includes("em chưa 18")) return VERIFIED_IMAGES.em_chua_18;
    if (search.includes("john wick") || search.includes("keanu reeves")) return VERIFIED_IMAGES.keanu_reeves_wick;
    if (search.includes("ma trận") || search.includes("matrix")) return VERIFIED_IMAGES.the_matrix;
    if (search.includes("tom cruise") || search.includes("mission")) return VERIFIED_IMAGES.tom_cruise_mi;
    if (search.includes("jack sparrow") || search.includes("cướp biển")) return VERIFIED_IMAGES.jack_sparrow;
    if (search.includes("godfather") || search.includes("bố già corleone")) return VERIFIED_IMAGES.the_godfather;
    if (search.includes("jurassic park") || search.includes("công viên kỷ jura")) return VERIFIED_IMAGES.jurassic_park;
    if (search.includes("chúa tể của những chiếc nhẫn") || search.includes("lord of the rings") || search.includes("frodo")) return VERIFIED_IMAGES.lord_of_rings;
    if (search.includes("oppenheimer")) return VERIFIED_IMAGES.oppenheimer;
    if (search.includes("ở nhà một mình") || search.includes("home alone")) return VERIFIED_IMAGES.home_alone;
    if (search.includes("forrest gump")) return VERIFIED_IMAGES.forrest_gump;
    if (search.includes("người nhện") || search.includes("spider-man")) return VERIFIED_IMAGES.spider_man;
    return VERIFIED_IMAGES.avatar_film;
  }

  // 6. Hoạt hình Nhật Bản
  if (cat === "Hoạt hình tuổi thơ Nhật Bản") {
    if (search.includes("pikachu") || search.includes("pokémon") || search.includes("pokemon")) return VERIFIED_IMAGES.pokemon_pikachu;
    if (search.includes("luffy") || search.includes("one piece") || search.includes("mũ rơm")) return VERIFIED_IMAGES.one_piece_luffy;
    if (search.includes("zoro") || search.includes("tam kiếm")) return VERIFIED_IMAGES.one_piece_zoro;
    if (search.includes("goku") || search.includes("dragon ball") || search.includes("ngọc rồng") || search.includes("kamehameha")) return VERIFIED_IMAGES.dragon_ball_goku;
    if (search.includes("vegeta") || search.includes("ca-đíc")) return VERIFIED_IMAGES.dragon_ball_vegeta;
    if (search.includes("naruto") || search.includes("cửu vĩ") || search.includes("làng lá") || search.includes("sharingan")) return VERIFIED_IMAGES.naruto_uzumaki;
    if (search.includes("ramen")) return VERIFIED_IMAGES.ramen;
    if (search.includes("shin") || search.includes("bút chì") || search.includes("shiro")) return VERIFIED_IMAGES.shin_chan;
    if (search.includes("thủy thủ mặt trăng") || search.includes("sailor moon")) return VERIFIED_IMAGES.sailor_moon;
    if (search.includes("totoro") || search.includes("ghibli")) return VERIFIED_IMAGES.totoro;
    if (search.includes("vùng đất linh hồn") || search.includes("spirited away") || search.includes("chihiro") || search.includes("vô diện")) return VERIFIED_IMAGES.spirited_away;
    if (search.includes("slam dunk") || search.includes("sakuragi")) return VERIFIED_IMAGES.slam_dunk;
    if (search.includes("yu-gi-oh") || search.includes("yugioh") || search.includes("rồng trắng mắt xanh")) return VERIFIED_IMAGES.yugioh;
    if (search.includes("inuyasha") || search.includes("ngọc tứ hồn")) return VERIFIED_IMAGES.inuyasha;
    if (search.includes("titan") || search.includes("eren") || search.includes("levi")) return VERIFIED_IMAGES.attack_on_titan;
    if (search.includes("diệt quỷ") || search.includes("tanjiro") || search.includes("nezuko")) return VERIFIED_IMAGES.demon_slayer;
    if (search.includes("death note") || search.includes("ryuk") || search.includes("thám tử l")) return VERIFIED_IMAGES.death_note;
    return VERIFIED_IMAGES.pokemon_pikachu;
  }

  // 7. Hoạt hình Mỹ
  if (cat === "Hoạt hình tuổi thơ Mỹ") {
    if (search.includes("tom and jerry") || search.includes("tom & jerry") || search.includes("spike")) return VERIFIED_IMAGES.tom_and_jerry;
    if (search.includes("mickey") || search.includes("chuột mickey")) return VERIFIED_IMAGES.mickey_mouse;
    if (search.includes("donald") || search.includes("vịt donald")) return VERIFIED_IMAGES.donald_duck;
    if (search.includes("spongebob") || search.includes("patrick") || search.includes("bọt biển")) return VERIFIED_IMAGES.spongebob;
    if (search.includes("ben 10") || search.includes("omnitrix") || search.includes("four arms") || search.includes("heatblast")) return VERIFIED_IMAGES.ben_10;
    if (search.includes("phineas") || search.includes("ferb") || search.includes("perry") || search.includes("doofenshmirtz") || search.includes("candace")) return VERIFIED_IMAGES.phineas_and_ferb;
    if (search.includes("powerpuff") || search.includes("hóa chất x") || search.includes("mojo jojo")) return VERIFIED_IMAGES.powerpuff_girls;
    if (search.includes("scooby") || search.includes("shaggy")) return VERIFIED_IMAGES.scooby_doo;
    if (search.includes("nàng tiên cá") || search.includes("ariel")) return VERIFIED_IMAGES.little_mermaid;
    if (search.includes("lion king") || search.includes("vua sư tử") || search.includes("simba")) return VERIFIED_IMAGES.lion_king;
    if (search.includes("aladdin") || search.includes("thần đèn")) return VERIFIED_IMAGES.aladdin;
    if (search.includes("toy story") || search.includes("woody") || search.includes("buzz")) return VERIFIED_IMAGES.toy_story;
    if (search.includes("shrek") || search.includes("chú lừa")) return VERIFIED_IMAGES.shrek;
    if (search.includes("minions") || search.includes("kẻ trộm mặt trăng") || search.includes("gru")) return VERIFIED_IMAGES.minions;
    if (search.includes("vút bay") || search.includes("up") || search.includes("carl")) return VERIFIED_IMAGES.up_pixar;
    if (search.includes("ratatouille") || search.includes("chuột đầu bếp")) return VERIFIED_IMAGES.ratatouille;
    if (search.includes("frozen") || search.includes("elsa") || search.includes("băng giá")) return VERIFIED_IMAGES.elsa;
    return VERIFIED_IMAGES.mickey_mouse;
  }

  // 8. Phim & hoạt hình Trung Quốc
  if (cat === "Phim & hoạt hình tuổi thơ Trung Quốc") {
    if (search.includes("tôn ngộ không") || search.includes("lục tiểu linh đồng") || search.includes("gậy như ý")) return VERIFIED_IMAGES.sun_wukong;
    if (search.includes("tây du ký") || search.includes("trư bát giới") || search.includes("sa tăng") || search.includes("đường tăng") || search.includes("bạch long mã")) return VERIFIED_IMAGES.journey_to_west;
    if (search.includes("hoàn châu cách cách") || search.includes("tiểu yến tử") || search.includes("triệu vy") || search.includes("tử vy") || search.includes("nhĩ khang") || search.includes("dung ma ma")) return VERIFIED_IMAGES.hoan_chau_cach_cach;
    if (search.includes("thần điêu") || search.includes("tiểu long nữ") || search.includes("dương quá") || search.includes("lưu diệc phi")) return VERIFIED_IMAGES.than_dieu_dai_hiep;
    if (search.includes("bao thanh thiên") || search.includes("bao chửng") || search.includes("triển chiêu") || search.includes("công tôn sách")) return VERIFIED_IMAGES.bao_thanh_thien;
    if (search.includes("tam quốc") || search.includes("gia cát lượng") || search.includes("khổng minh") || search.includes("lưu bị") || search.includes("tào tháo")) return VERIFIED_IMAGES.tam_quoc_dien_nghia;
    if (search.includes("quan vũ")) return VERIFIED_IMAGES.quan_vu;
    if (search.includes("kim dung") || search.includes("tiêu phong") || search.includes("quách tĩnh") || search.includes("trương vô kỵ")) return VERIFIED_IMAGES.kim_dung;
    if (search.includes("na tra") || search.includes("phong hỏa luân")) return VERIFIED_IMAGES.nezha;
    return VERIFIED_IMAGES.sun_wukong;
  }

  // 9. Phim Hàn Quốc (K-Drama)
  if (cat === "Phim Hàn Quốc (K-Drama)") {
    if (search.includes("hạ cánh nơi anh") || search.includes("crash landing")) return VERIFIED_IMAGES.crash_landing_on_you;
    if (search.includes("hyun bin")) return VERIFIED_IMAGES.hyun_bin;
    if (search.includes("son ye-jin")) return VERIFIED_IMAGES.son_ye_jin;
    if (search.includes("hậu duệ mặt trời") || search.includes("descendants of the sun")) return VERIFIED_IMAGES.descendants_of_sun;
    if (search.includes("song joong-ki")) return VERIFIED_IMAGES.song_joong_ki;
    if (search.includes("song hye-kyo")) return VERIFIED_IMAGES.song_hye_kyo;
    if (search.includes("squid game") || search.includes("trò chơi con mực") || search.includes("456")) return VERIFIED_IMAGES.squid_game;
    if (search.includes("goblin") || search.includes("yêu tinh") || search.includes("gong yoo")) return VERIFIED_IMAGES.goblin;
    if (search.includes("vườn sao băng") || search.includes("boys over flowers") || search.includes("f4") || search.includes("lee min-ho") || search.includes("goo jun-pyo")) return VERIFIED_IMAGES.boys_over_flowers;
    if (search.includes("vì sao đưa anh tới") || search.includes("my love from the star") || search.includes("do min-joon")) return VERIFIED_IMAGES.my_love_from_star;
    if (search.includes("kim soo-hyun") || search.includes("nữ hoàng nước mắt")) return VERIFIED_IMAGES.queen_of_tears;
    if (search.includes("jun ji-hyun") || search.includes("chun song-yi")) return VERIFIED_IMAGES.jun_ji_hyun;
    if (search.includes("itaewon") || search.includes("park sae-royi")) return VERIFIED_IMAGES.itaewon_class;
    if (search.includes("reply 1988") || search.includes("lời hồi đáp 1988")) return VERIFIED_IMAGES.reply_1988;
    if (search.includes("park bo-gum")) return VERIFIED_IMAGES.park_bo_gum;
    if (search.includes("hotel del luna") || search.includes("khách sạn ma quái") || search.includes("jang man-wol")) return VERIFIED_IMAGES.hotel_del_luna;
    if (search.includes("thư ký kim") || search.includes("secretary kim")) return VERIFIED_IMAGES.secretary_kim;
    if (search.includes("the glory")) return VERIFIED_IMAGES.the_glory;
    if (search.includes("cờ vây") || search.includes("choi taek")) return VERIFIED_IMAGES.go_game;
    return VERIFIED_IMAGES.seoul_tower;
  }

  // 10. K-Pop
  if (cat === "K-Pop") {
    if (search.includes("bts") || search.includes("dynamite") || search.includes("army")) return VERIFIED_IMAGES.bts;
    if (search.includes("rm")) return VERIFIED_IMAGES.rm_bts;
    if (search.includes("jungkook")) return VERIFIED_IMAGES.jungkook_bts;
    if (search.includes("blackpink") || search.includes("blink") || search.includes("ddu-du")) return VERIFIED_IMAGES.blackpink;
    if (search.includes("jennie")) return VERIFIED_IMAGES.jennie;
    if (search.includes("jisoo")) return VERIFIED_IMAGES.jisoo;
    if (search.includes("rosé") || search.includes("rose")) return VERIFIED_IMAGES.rose;
    if (search.includes("lisa")) return VERIFIED_IMAGES.lisa;
    if (search.includes("g-dragon")) return VERIFIED_IMAGES.g_dragon;
    if (search.includes("bigbang") || search.includes("haru haru") || search.includes("taeyang")) return VERIFIED_IMAGES.bigbang;
    if (search.includes("snsd") || search.includes("girls' generation") || search.includes("gee")) return VERIFIED_IMAGES.snsd;
    if (search.includes("taeyeon")) return VERIFIED_IMAGES.taeyeon;
    if (search.includes("super junior") || search.includes("sorry, sorry")) return VERIFIED_IMAGES.super_junior;
    if (search.includes("twice") || search.includes("cheer up") || search.includes("tt")) return VERIFIED_IMAGES.twice;
    if (search.includes("2ne1") || search.includes("i am the best")) return VERIFIED_IMAGES.two_ne1;
    if (search.includes("exo") || search.includes("growl")) return VERIFIED_IMAGES.exo;
    if (search.includes("newjeans") || search.includes("attention") || search.includes("hype boy")) return VERIFIED_IMAGES.newjeans;
    if (search.includes("aespa") || search.includes("next level")) return VERIFIED_IMAGES.aespa;
    if (search.includes("seventeen")) return VERIFIED_IMAGES.seventeen;
    if (search.includes("psy") || search.includes("gangnam style")) return VERIFIED_IMAGES.psy;
    if (search.includes("boa")) return VERIFIED_IMAGES.boa;
    return VERIFIED_IMAGES.bts;
  }

  // 11. US-UK
  if (cat === "US-UK") {
    if (search.includes("michael jackson") || search.includes("thriller") || search.includes("moonwalk") || search.includes("ông hoàng nhạc pop")) return VERIFIED_IMAGES.michael_jackson;
    if (search.includes("beatles") || search.includes("liverpool") || search.includes("john lennon")) return VERIFIED_IMAGES.beatles;
    if (search.includes("queen") || search.includes("bohemian rhapsody") || search.includes("freddie mercury")) return VERIFIED_IMAGES.queen_band;
    if (search.includes("taylor swift") || search.includes("eras tour") || search.includes("swifties")) return VERIFIED_IMAGES.taylor_swift;
    if (search.includes("adele") || search.includes("rolling in the deep") || search.includes("skyfall")) return VERIFIED_IMAGES.adele;
    if (search.includes("ed sheeran") || search.includes("shape of you")) return VERIFIED_IMAGES.ed_sheeran;
    if (search.includes("beyoncé") || search.includes("queen bey") || search.includes("single ladies")) return VERIFIED_IMAGES.beyonce;
    if (search.includes("bruno mars") || search.includes("uptown funk")) return VERIFIED_IMAGES.bruno_mars;
    if (search.includes("billie eilish") || search.includes("bad guy")) return VERIFIED_IMAGES.billie_eilish;
    if (search.includes("eminem") || search.includes("rap god") || search.includes("lose yourself")) return VERIFIED_IMAGES.eminem;
    if (search.includes("the weeknd") || search.includes("blinding lights") || search.includes("starboy")) return VERIFIED_IMAGES.the_weeknd;
    if (search.includes("coldplay") || search.includes("viva la vida")) return VERIFIED_IMAGES.coldplay;
    if (search.includes("maroon 5") || search.includes("sugar") || search.includes("adam levine")) return VERIFIED_IMAGES.maroon_5;
    if (search.includes("lady gaga") || search.includes("bad romance") || search.includes("poker face")) return VERIFIED_IMAGES.lady_gaga;
    if (search.includes("rihanna") || search.includes("umbrella") || search.includes("diamonds")) return VERIFIED_IMAGES.rihanna;
    if (search.includes("katy perry") || search.includes("roar") || search.includes("firework")) return VERIFIED_IMAGES.katy_perry;
    if (search.includes("céline dion") || search.includes("celine dion") || search.includes("my heart will go on")) return VERIFIED_IMAGES.celine_dion;
    if (search.includes("whitney houston") || search.includes("i will always love you")) return VERIFIED_IMAGES.whitney_houston;
    if (search.includes("mariah carey") || search.includes("christmas")) return VERIFIED_IMAGES.mariah_carey;
    if (search.includes("britney spears") || search.includes("baby one more time") || search.includes("toxic")) return VERIFIED_IMAGES.britney_spears;
    if (search.includes("justin bieber") || search.includes("baby")) return VERIFIED_IMAGES.justin_bieber;
    if (search.includes("ariana grande") || search.includes("7 rings")) return VERIFIED_IMAGES.ariana_grande;
    if (search.includes("shakira") || search.includes("waka waka")) return VERIFIED_IMAGES.shakira;
    if (search.includes("drake") || search.includes("god's plan")) return VERIFIED_IMAGES.drake;
    if (search.includes("miley cyrus") || search.includes("flowers")) return VERIFIED_IMAGES.miley_cyrus;
    if (search.includes("selena gomez")) return VERIFIED_IMAGES.selena_gomez;
    if (search.includes("elvis presley")) return VERIFIED_IMAGES.elvis_presley;
    return VERIFIED_IMAGES.michael_jackson;
  }

  // Fallback chủ đề
  if (question.category && CATEGORY_DEFAULT_IMAGES[question.category]) {
    return CATEGORY_DEFAULT_IMAGES[question.category];
  }

  return VERIFIED_IMAGES.equator;
}
`;

fs.writeFileSync(targetPath, tsContent, 'utf8');
console.log('✅ Đã cập nhật xong lib/questionImages.ts!');

