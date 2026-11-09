// Script lấy URL hình ảnh xác thực từ Wikipedia REST API cho các chủ đề & nhân vật câu hỏi
const fs = require("fs");
const path = require("path");

const WIKI_TOPICS = {
  // 20 câu gốc trên Supabase
  iron_man: { lang: "en", title: "Iron_Man" },
  ron_weasley: { lang: "en", title: "Ron_Weasley" },
  harry_potter: { lang: "en", title: "Harry_Potter" },
  doraemon: { lang: "en", title: "Doraemon" },
  conan: { lang: "en", title: "Case_Closed" },
  shinichi: { lang: "en", title: "Jimmy_Kudo" },
  titanic: { lang: "en", title: "Titanic_(1997_film)" },
  frozen: { lang: "en", title: "Frozen_(2013_film)" },
  elsa: { lang: "en", title: "Elsa_(Frozen)" },
  justin_bieber: { lang: "en", title: "Justin_Bieber" },
  bts: { lang: "en", title: "BTS" },
  link_zelda: { lang: "en", title: "Link_(The_Legend_of_Zelda)" },
  mario: { lang: "en", title: "Mario" },
  ronaldo: { lang: "en", title: "Cristiano_Ronaldo" },
  messi: { lang: "en", title: "Lionel_Messi" },
  world_cup_2022: { lang: "en", title: "2022_FIFA_World_Cup" },
  apple_logo: { lang: "en", title: "Apple_Inc." },
  italy: { lang: "en", title: "Italy" },
  mars: { lang: "en", title: "Mars" },
  calendar: { lang: "en", title: "Leap_year" },
  panda: { lang: "en", title: "Giant_panda" },
  spider_man: { lang: "en", title: "Spider-Man" },
  lion_king: { lang: "en", title: "The_Lion_King" },
  paris: { lang: "en", title: "Paris" },

  // Chủ đề A: Doraemon
  dorayaki: { lang: "en", title: "Dorayaki" },
  nobita: { lang: "en", title: "Nobita_Nobi" },
  shizuka: { lang: "en", title: "Shizuka_Minamoto" },
  fujiko: { lang: "en", title: "Fujiko_F._Fujio" },
  melonpan: { lang: "en", title: "Melonpan" },
  time_machine: { lang: "en", title: "Time_machine" },
  baseball: { lang: "en", title: "Baseball" },
  sweet_potato: { lang: "en", title: "Roasted_sweet_potato" },
  futabasaurus: { lang: "en", title: "Futabasaurus" },

  // Chủ đề B: Conan
  kaito_kid: { lang: "en", title: "Kaito_Kid" },
  gosho_aoyama: { lang: "en", title: "Gosho_Aoyama" },
  porsche_356: { lang: "en", title: "Porsche_356" },
  karate: { lang: "en", title: "Karate" },
  judo: { lang: "en", title: "Judo" },
  moonlight_sonata: { lang: "en", title: "Piano_Sonata_No._14_(Beethoven)" },
  fbi: { lang: "en", title: "Federal_Bureau_of_Investigation" },
  osaka_castle: { lang: "en", title: "Osaka_Castle" },
  sherlock_holmes: { lang: "en", title: "Sherlock_Holmes" },
  unagi: { lang: "en", title: "Unadon" },

  // Chủ đề C: K-Drama
  hyun_bin: { lang: "en", title: "Hyun_Bin" },
  son_ye_jin: { lang: "en", title: "Son_Ye-jin" },
  song_joong_ki: { lang: "en", title: "Song_Joong-ki" },
  song_hye_kyo: { lang: "en", title: "Song_Hye-kyo" },
  squid_game: { lang: "en", title: "Squid_Game" },
  gong_yoo: { lang: "en", title: "Gong_Yoo" },
  lee_min_ho: { lang: "en", title: "Lee_Min-ho" },
  kim_soo_hyun: { lang: "en", title: "Kim_Soo-hyun" },
  jun_ji_hyun: { lang: "en", title: "Jun_Ji-hyun" },
  park_seo_joon: { lang: "en", title: "Park_Seo-joon" },
  iu_singer: { lang: "en", title: "IU_(singer)" },
  park_bo_gum: { lang: "en", title: "Park_Bo-gum" },
  seoul_tower: { lang: "en", title: "N_Seoul_Tower" },
  go_game: { lang: "en", title: "Go_(game)" },

  // Chủ đề D: Âm nhạc Việt Nam
  son_tung: { lang: "vi", title: "Sơn_Tùng_M-TP" },
  my_tam: { lang: "vi", title: "Mỹ_Tâm" },
  den_vau: { lang: "vi", title: "Đen_(rapper)" },
  hoang_thuy_linh: { lang: "vi", title: "Hoàng_Thùy_Linh" },
  trinh_cong_son: { lang: "vi", title: "Trịnh_Công_Sơn" },
  van_cao: { lang: "vi", title: "Văn_Cao" },
  soobin: { lang: "vi", title: "Soobin_Hoàng_Sơn" },
  ha_anh_tuan: { lang: "vi", title: "Hà_Anh_Tuấn" },
  phan_manh_quynh: { lang: "vi", title: "Phan_Mạnh_Quỳnh" },
  dan_truong: { lang: "vi", title: "Đan_Trường" },
  lam_truong: { lang: "vi", title: "Lam_Trường" },
  tuan_hung: { lang: "vi", title: "Tuấn_Hưng" },
  acoustic_guitar: { lang: "en", title: "Acoustic_guitar" },
  microphone: { lang: "en", title: "Microphone" },

  // Chủ đề E: K-Pop
  blackpink: { lang: "en", title: "Blackpink" },
  lisa_bp: { lang: "en", title: "Lisa_(rapper)" },
  jennie_bp: { lang: "en", title: "Jennie_(singer)" },
  jisoo_bp: { lang: "en", title: "Jisoo" },
  rose_bp: { lang: "en", title: "Rosé_(singer)" },
  psy: { lang: "en", title: "Psy" },
  twice: { lang: "en", title: "Twice" },
  snsd: { lang: "en", title: "Girls'_Generation" },
  g_dragon: { lang: "en", title: "G-Dragon" },
  bigbang: { lang: "en", title: "BigBang_(South_Korean_band)" },
  super_junior: { lang: "en", title: "Super_Junior" },
  newjeans: { lang: "en", title: "NewJeans" },
  aespa: { lang: "en", title: "Aespa" },
  exo: { lang: "en", title: "Exo" },
  seventeen: { lang: "en", title: "Seventeen_(South_Korean_band)" },
  "2ne1": { lang: "en", title: "2NE1" },
  jungkook: { lang: "en", title: "Jungkook" },
  taeyeon: { lang: "en", title: "Taeyeon" },
  boa_singer: { lang: "en", title: "BoA" },

  // Chủ đề F: US-UK & Ca sĩ quốc tế
  michael_jackson: { lang: "en", title: "Michael_Jackson" },
  taylor_swift: { lang: "en", title: "Taylor_Swift" },
  adele: { lang: "en", title: "Adele" },
  ed_sheeran: { lang: "en", title: "Ed_Sheeran" },
  queen_band: { lang: "en", title: "Queen_(band)" },
  beatles: { lang: "en", title: "The_Beatles" },
  mariah_carey: { lang: "en", title: "Mariah_Carey" },
  beyonce: { lang: "en", title: "Beyoncé" },
  bruno_mars: { lang: "en", title: "Bruno_Mars" },
  billie_eilish: { lang: "en", title: "Billie_Eilish" },
  eminem: { lang: "en", title: "Eminem" },
  the_weeknd: { lang: "en", title: "The_Weeknd" },
  lady_gaga: { lang: "en", title: "Lady_Gaga" },
  rihanna: { lang: "en", title: "Rihanna" },
  katy_perry: { lang: "en", title: "Katy_Perry" },
  maroon_5: { lang: "en", title: "Maroon_5" },
  coldplay: { lang: "en", title: "Coldplay" },
  ariana_grande: { lang: "en", title: "Ariana_Grande" },
  celine_dion: { lang: "en", title: "Celine_Dion" },
  whitney_houston: { lang: "en", title: "Whitney_Houston" },
  elvis_presley: { lang: "en", title: "Elvis_Presley" },
  britney_spears: { lang: "en", title: "Britney_Spears" },
  shakira: { lang: "en", title: "Shakira" },
  drake: { lang: "en", title: "Drake_(musician)" },
  miley_cyrus: { lang: "en", title: "Miley_Cyrus" },
  selena_gomez: { lang: "en", title: "Selena_Gomez" },
  john_legend: { lang: "en", title: "John_Legend" },
  grammy: { lang: "en", title: "Grammy_Award" },

  // Chủ đề G: Địa lý
  canberra: { lang: "en", title: "Canberra" },
  ottawa: { lang: "en", title: "Ottawa" },
  fansipan: { lang: "en", title: "Fansipan" },
  son_doong: { lang: "en", title: "Hang_Sơn_Đoòng" },
  nile: { lang: "en", title: "Nile" },
  amazon_river: { lang: "en", title: "Amazon_River" },
  pacific_ocean: { lang: "en", title: "Pacific_Ocean" },
  pyramids: { lang: "en", title: "Giza_pyramid_complex" },
  russia: { lang: "en", title: "Russia" },
  vatican: { lang: "en", title: "Vatican_City" },
  mount_fuji: { lang: "en", title: "Mount_Fuji" },
  netherlands: { lang: "en", title: "Netherlands" },
  nepal_flag: { lang: "en", title: "Flag_of_Nepal" },
  ha_long_bay: { lang: "en", title: "Hạ_Long_Bay" },
  angkor_wat: { lang: "en", title: "Angkor_Wat" },
  washington_dc: { lang: "en", title: "Washington,_D.C." },
  taj_mahal: { lang: "en", title: "Taj_Mahal" },
  antarctica: { lang: "en", title: "Antarctica" },
  sahara: { lang: "en", title: "Sahara" },
  lake_baikal: { lang: "en", title: "Lake_Baikal" },
  suez_canal: { lang: "en", title: "Suez_Canal" },
  panama_canal: { lang: "en", title: "Panama_Canal" },
  niagara_falls: { lang: "en", title: "Niagara_Falls" },
  angel_falls: { lang: "en", title: "Angel_Falls" },
  venice: { lang: "en", title: "Venice" },
  bangkok: { lang: "en", title: "Bangkok" },
  leaning_tower_pisa: { lang: "en", title: "Leaning_Tower_of_Pisa" },
  mount_everest: { lang: "en", title: "Mount_Everest" },
  earth: { lang: "en", title: "Earth" },

  // Chủ đề H: Anime Nhật Bản
  pikachu: { lang: "en", title: "Pikachu" },
  luffy: { lang: "en", title: "Monkey_D._Luffy" },
  one_piece: { lang: "en", title: "One_Piece" },
  zoro: { lang: "en", title: "Roronoa_Zoro" },
  naruto: { lang: "en", title: "Naruto" },
  ramen: { lang: "en", title: "Ramen" },
  goku: { lang: "en", title: "Goku" },
  dragon_ball: { lang: "en", title: "Dragon_Ball" },
  vegeta: { lang: "en", title: "Vegeta" },
  shin_chan: { lang: "en", title: "Crayon_Shin-chan" },
  sailor_moon: { lang: "en", title: "Sailor_Moon" },
  totoro: { lang: "en", title: "My_Neighbor_Totoro" },
  spirited_away: { lang: "en", title: "Spirited_Away" },
  slam_dunk: { lang: "en", title: "Slam_Dunk_(manga)" },
  yugioh: { lang: "en", title: "Yu-Gi-Oh!" },
  inuyasha: { lang: "en", title: "Inuyasha" },
  attack_on_titan: { lang: "en", title: "Attack_on_Titan" },
  demon_slayer: { lang: "en", title: "Demon_Slayer:_Kimetsu_no_Yaiba" },
  death_note: { lang: "en", title: "Death_Note" },

  // Chủ đề I: Phim Trung Quốc
  sun_wukong: { lang: "en", title: "Monkey_King" },
  journey_to_west: { lang: "en", title: "Journey_to_the_West" },
  zhao_wei: { lang: "en", title: "Zhao_Wei" },
  fan_bingbing: { lang: "en", title: "Fan_Bingbing" },
  liu_yifei: { lang: "en", title: "Liu_Yifei" },
  jin_yong: { lang: "en", title: "Jin_Yong" },
  bao_zheng: { lang: "en", title: "Bao_Zheng" },
  nezha: { lang: "en", title: "Nezha" },
  zhuge_liang: { lang: "en", title: "Zhuge_Liang" },
  guan_yu: { lang: "en", title: "Guan_Yu" },
  forbidden_city: { lang: "en", title: "Forbidden_City" },

  // Chủ đề J: Hoạt hình Mỹ
  tom_and_jerry: { lang: "en", title: "Tom_and_Jerry" },
  mickey_mouse: { lang: "en", title: "Mickey_Mouse" },
  donald_duck: { lang: "en", title: "Donald_Duck" },
  spongebob: { lang: "en", title: "SpongeBob_SquarePants" },
  ben_10: { lang: "en", title: "Ben_10" },
  phineas_and_ferb: { lang: "en", title: "Phineas_and_Ferb" },
  powerpuff_girls: { lang: "en", title: "The_Powerpuff_Girls" },
  scooby_doo: { lang: "en", title: "Scooby-Doo" },
  little_mermaid: { lang: "en", title: "The_Little_Mermaid_(1989_film)" },
  robin_williams: { lang: "en", title: "Robin_Williams" },
  toy_story: { lang: "en", title: "Toy_Story" },
  shrek: { lang: "en", title: "Shrek" },
  kung_fu_panda: { lang: "en", title: "Kung_Fu_Panda" },
  minions: { lang: "en", title: "Minions_(film)" },
  up_pixar: { lang: "en", title: "Up_(2009_film)" },
  ratatouille: { lang: "en", title: "Ratatouille_(film)" },

  // Chủ đề L: Phim Mỹ & Phim Việt Nam
  avatar_film: { lang: "en", title: "Avatar_(2009_film)" },
  avengers: { lang: "en", title: "The_Avengers_(2012_film)" },
  james_cameron: { lang: "en", title: "James_Cameron" },
  tran_thanh: { lang: "vi", title: "Trấn_Thành" },
  ly_hai: { lang: "vi", title: "Lý_Hải" },
  ngo_thanh_van: { lang: "vi", title: "Ngô_Thanh_Vân" },
  interstellar: { lang: "en", title: "Interstellar_(film)" },
  inception: { lang: "en", title: "Inception" },
  heath_ledger_joker: { lang: "en", title: "Joker_(The_Dark_Knight)" },
  keanu_reeves: { lang: "en", title: "Keanu_Reeves" },
  tom_cruise: { lang: "en", title: "Tom_Cruise" },
  jack_sparrow: { lang: "en", title: "Jack_Sparrow" },
  godfather: { lang: "en", title: "The_Godfather" },
  jurassic_park: { lang: "en", title: "Jurassic_Park" },
  lord_of_the_rings: { lang: "en", title: "The_Lord_of_the_Rings_(film_series)" },
  the_matrix: { lang: "en", title: "The_Matrix" },
  oppenheimer: { lang: "en", title: "Oppenheimer_(film)" },
  home_alone: { lang: "en", title: "Home_Alone" },
  forrest_gump: { lang: "en", title: "Forrest_Gump" },
  ao_dai: { lang: "en", title: "Áo_dài" },
  cinema: { lang: "en", title: "Movie_theater" }
};

async function fetchAll() {
  const results = {};
  const entries = Object.entries(WIKI_TOPICS);
  console.log(`Đang tải ${entries.length} hình ảnh xác thực từ Wikipedia API...`);

  // Fetch in batches of 15
  for (let i = 0; i < entries.length; i += 15) {
    const batch = entries.slice(i, i + 15);
    await Promise.all(
      batch.map(async ([key, info]) => {
        try {
          const url = `https://${info.lang}.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(info.title)}`;
          const res = await fetch(url, {
            headers: { "User-Agent": "QuizPartyGame/1.0 (contact@quizparty.local)" }
          });
          if (res.ok) {
            const data = await res.json();
            if (data.thumbnail && data.thumbnail.source) {
              // Remove query params if any
              results[key] = data.thumbnail.source.split("?")[0];
            }
          }
        } catch (err) {
          // ignore
        }
      })
    );
  }

  console.log(`Đã lấy thành công ${Object.keys(results).length}/${entries.length} URL hình ảnh!`);
  fs.writeFileSync(
    path.join(__dirname, "verified_images.json"),
    JSON.stringify(results, null, 2),
    "utf8"
  );
}

fetchAll();
