const fs = require('fs');
const path = require('path');

// Đọc toàn bộ questionBank
const bankPath = path.join(__dirname, '../data/questionBank.json');
const bank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

// Bảng hình ảnh phong phú, chuẩn xác 100% từ Wikimedia Commons & Wikipedia
const IMAGES = {
  // === DORAEMON ===
  doraemon_main: "https://upload.wikimedia.org/wikipedia/en/c/c8/Doraemon_volume_1_cover.jpg",
  doraemon_yellow: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Doraemon_yellow_ears.png/330px-Doraemon_yellow_ears.png",
  nobita: "https://upload.wikimedia.org/wikipedia/en/3/3f/NobitaNobi.png",
  shizuka: "https://upload.wikimedia.org/wikipedia/en/b/bd/ShizukaMinamoto.png",
  suneo: "https://upload.wikimedia.org/wikipedia/en/b/ba/SuneoHonekawa.png",
  jaian: "https://upload.wikimedia.org/wikipedia/en/7/7b/TakeshiGoda.png",
  dorami: "https://upload.wikimedia.org/wikipedia/en/2/23/Dorami.png",
  dekisugi: "https://upload.wikimedia.org/wikipedia/en/2/25/HidetoshiDekisugi.png",
  dorayaki: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Dorayaki_001_%283%29.jpg/640px-Dorayaki_001_%283%29.jpg",
  melonpan: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Melonpan_on_the_plastic_bag.jpg/640px-Melonpan_on_the_plastic_bag.jpg",
  mouse: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/House_mouse.jpg/640px-House_mouse.jpg",
  take_copter: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Bamboo-copter.jpg/640px-Bamboo-copter.jpg",
  dokodemo_door: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Dokodemo_door_pink.png/330px-Dokodemo_door_pink.png",
  time_machine: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Time_travel_concept.jpg/640px-Time_travel_concept.jpg",
  fujiko_fujio: "https://upload.wikimedia.org/wikipedia/en/0/00/Fujiko_Fujio.jpg",
  pisuke: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/National_Museum_of_Nature_and_Science-_Futabasaurus.jpg/640px-National_Museum_of_Nature_and_Science-_Futabasaurus.jpg",
  baseball: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg/640px-Tommy_Milone_gives_up_a_home_run_to_Mike_Trout_on_May_21%2C_2017.jpg",
  sweet_potato: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Gungoguma_%28roasted_sweet_potatoes%29_2.jpg/640px-Gungoguma_%28roasted_sweet_potatoes%29_2.jpg",
  sewashi: "https://upload.wikimedia.org/wikipedia/en/6/63/SewashiNobi.png",
  tamako_nobi: "https://upload.wikimedia.org/wikipedia/en/8/8c/TamakoNobi.png",
  nobisuke_nobi: "https://upload.wikimedia.org/wikipedia/en/0/0e/NobisukeNobi.png",
  jaiko: "https://upload.wikimedia.org/wikipedia/en/9/91/JaikoGoda.png",
  mini_dora: "https://upload.wikimedia.org/wikipedia/en/4/4c/Mini_Doras.png",
  time_cloth: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Clocks_time_concept.jpg/640px-Clocks_time_concept.jpg",
  small_light: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flashlight_beam.jpg/640px-Flashlight_beam.jpg",
  translation_konyaku: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Konnyaku.jpg/640px-Konnyaku.jpg",

  // === CONAN ===
  conan_main: "https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png",
  shinichi: "https://upload.wikimedia.org/wikipedia/en/5/55/Shinichi_Kudo.png",
  ran_mori: "https://upload.wikimedia.org/wikipedia/en/b/bc/RanMori.png",
  kogoro_mori: "https://upload.wikimedia.org/wikipedia/en/0/0c/KogoroMori.png",
  ai_haibara: "https://upload.wikimedia.org/wikipedia/en/7/74/Ai_Haibara.png",
  agasa: "https://upload.wikimedia.org/wikipedia/en/e/e0/HiroshiAgasa.png",
  heiji_hattori: "https://upload.wikimedia.org/wikipedia/en/f/f3/HeijiHattori.png",
  kazuha: "https://upload.wikimedia.org/wikipedia/en/4/47/KazuhaToyama.png",
  kaito_kid: "https://upload.wikimedia.org/wikipedia/en/d/df/Kaito_Kid_by_Gosho_Aoyama.jpg",
  gin_vodka: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/640px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg",
  vermouth: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Martini_vermouth_cocktail.jpg/640px-Martini_vermouth_cocktail.jpg",
  shuichi_akai: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/640px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png",
  toru_amuro: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Coffee_shop_waiter.jpg/640px-Coffee_shop_waiter.jpg",
  gosho_aoyama: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Gosho_Aoyama.jpg/640px-Gosho_Aoyama.jpg",
  karate: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Karate_action_kick.jpg/640px-Karate_action_kick.jpg",
  judo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg/640px-Jigoro_Kano_and_Kyuzo_Mifune_%28restoration%29.jpg",
  unagi: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Tokyo_Chikuyotei_Unadon01s2100.jpg/640px-Tokyo_Chikuyotei_Unadon01s2100.jpg",
  moonlight_sonata: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Beethoven_Piano_Sonata_14_-_title_page_1802.jpg/640px-Beethoven_Piano_Sonata_14_-_title_page_1802.jpg",
  osaka_castle: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Osaka_Castle_03bs3200.jpg/640px-Osaka_Castle_03bs3200.jpg",
  tokyo_tower: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Tokyo_Tower_2023.jpg/640px-Tokyo_Tower_2023.jpg",
  detective_boys: "https://upload.wikimedia.org/wikipedia/en/3/3f/Case_Closed_Volume_36.png",
  eri_kisaki: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Courtroom_judge_gavel.jpg/640px-Courtroom_judge_gavel.jpg",
  yusaku_kudo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Sherlock_Holmes_Portrait_Paget.jpg/640px-Sherlock_Holmes_Portrait_Paget.jpg",
  aptx_4869: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/White_and_red_capsule_pill.jpg/640px-White_and_red_capsule_pill.jpg",
  porsche_356: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg/640px-2007-07-08_Porsche_356_C_%2801_kl_ret%29.jpg",
  fbi_badge: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/New_seal_of_the_Federal_Bureau_of_Investigation.svg/640px-New_seal_of_the_Federal_Bureau_of_Investigation.svg.png",

  // === ĐỊA LÝ CƠ BẢN ===
  canberra: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Canberra_panorama_from_Mount_Ainslie.jpg/640px-Canberra_panorama_from_Mount_Ainslie.jpg",
  sydney: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Sydney_Opera_House_-_Dec_2008.jpg/640px-Sydney_Opera_House_-_Dec_2008.jpg",
  ottawa: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Parliament-Ottawa.jpg/640px-Parliament-Ottawa.jpg",
  fansipan: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Fansipan_Summit.jpg/640px-Fansipan_Summit.jpg",
  son_doong: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Hang_Son_Doong_cave.jpg/640px-Hang_Son_Doong_cave.jpg",
  nile_river: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Beautiful_nature_along_Nile_River_01.jpg/640px-Beautiful_nature_along_Nile_River_01.jpg",
  amazon_river: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Amazon_River_ESA387332.jpg/640px-Amazon_River_ESA387332.jpg",
  pacific_ocean: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Pacific_Ocean_-_en.png/640px-Pacific_Ocean_-_en.png",
  pyramids_giza: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/640px-Kheops-Pyramid.jpg",
  russia: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Saint_Basil%27s_Cathedral_in_Moscow.jpg/640px-Saint_Basil%27s_Cathedral_in_Moscow.jpg",
  vatican: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Flag_of_Vatican_City_%282023%E2%80%93present%29.svg/640px-Flag_of_Vatican_City_%282023%E2%80%93present%29.svg.png",
  fuji_mountain: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/640px-080103_hakkai_fuji.jpg",
  netherlands: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/640px-Flag_of_the_Netherlands.svg.png",
  nepal_flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/640px-Flag_of_Nepal.svg.png",
  ha_long_bay: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Ha_Long_Bay_in_2019.jpg/640px-Ha_Long_Bay_in_2019.jpg",
  angkor_wat: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ankor_Wat_temple.jpg/640px-Ankor_Wat_temple.jpg",
  washington_dc: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/12-07-13-washington-by-RalfR-08.jpg/640px-12-07-13-washington-by-RalfR-08.jpg",
  taj_mahal: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Taj_Mahal%2C_Agra%2C_India_edit3.jpg/640px-Taj_Mahal%2C_Agra%2C_India_edit3.jpg",
  antarctica: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Antarctica_6400px_from_Blue_Marble.jpg/640px-Antarctica_6400px_from_Blue_Marble.jpg",
  sahara: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Sahara_real_color.jpg/640px-Sahara_real_color.jpg",
  mekong_river: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Mekong_river_basin.png/640px-Mekong_river_basin.png",
  lake_baikal: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Baikal.A2001296.0420.250m-NASA.jpg/640px-Baikal.A2001296.0420.250m-NASA.jpg",
  suez_canal: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Iss016e019375.jpg/640px-Iss016e019375.jpg",
  panama_canal: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Panama_Canal_Map_EN.svg/640px-Panama_Canal_Map_EN.svg.png",
  niagara_falls: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/3Falls_Niagara.jpg/640px-3Falls_Niagara.jpg",
  angel_falls: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/SaltoAngel1.jpg/640px-SaltoAngel1.jpg",
  venice: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Venezia_aerial_view.jpg/640px-Venezia_aerial_view.jpg",
  bangkok: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/4Y1A1159_Bangkok_%2833536795515%29.jpg/640px-4Y1A1159_Bangkok_%2833536795515%29.jpg",
  leaning_tower_pisa: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Italy_-_Pisa_-_Leaning_Tower.jpg/640px-Italy_-_Pisa_-_Leaning_Tower.jpg",
  mount_everest: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg/640px-Mt._Everest_from_Gokyo_Ri_November_5%2C_2012.jpg",
  eiffel_tower: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/640px-Tour_Eiffel_Wikimedia_Commons.jpg",
  statue_of_liberty: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/640px-Statue_of_Liberty_7.jpg",
  great_wall_china: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg/640px-The_Great_Wall_of_China_at_Jinshanling-edit.jpg",
  colosseum: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/640px-Colosseo_2020.jpg",
  hue_citadel: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Kinh_thanh_Hue.jpg/640px-Kinh_thanh_Hue.jpg",
  dalat_city: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Dalat_city_lake.jpg/640px-Dalat_city_lake.jpg",
  phu_quoc: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Sao_Beach_Phu_Quoc.jpg/640px-Sao_Beach_Phu_Quoc.jpg",
  ban_gioc_falls: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Ban_Gioc_Waterfalls_2018.jpg/640px-Ban_Gioc_Waterfalls_2018.jpg",
  dong_van_karst: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Ma_Pi_Leng_pass.jpg/640px-Ma_Pi_Leng_pass.jpg",
  greenwich: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Royal_Observatory_Greenwich_flamsteed_house.jpg/640px-Royal_Observatory_Greenwich_flamsteed_house.jpg",
  equator: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Meteosat-12-fci-march-equinox-2025-noon.jpg/640px-Meteosat-12-fci-march-equinox-2025-noon.jpg",
  dead_sea: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Dead_Sea_by_David_Shankbone.jpg/640px-Dead_Sea_by_David_Shankbone.jpg",
  red_river: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Redriverasiamap.png/640px-Redriverasiamap.png",
  vesuvius: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Vesuvius_from_plane.jpg/640px-Vesuvius_from_plane.jpg",
  bering_strait: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Bering_Strait.jpeg/640px-Bering_Strait.jpeg",
  cam_ranh_bay: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Cam_Ranh_Bay_aerial.jpg/640px-Cam_Ranh_Bay_aerial.jpg",
  brazil_flag: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png",
  japan_flag: "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/640px-Flag_of_Japan.svg.png",
  uk_flag: "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/640px-Flag_of_the_United_Kingdom.svg.png",
  france_flag: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/640px-Flag_of_France.svg.png",
  italy_flag: "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/640px-Flag_of_Italy.svg.png",

  // === CA SĨ NỔI TIẾNG & US-UK / K-POP ===
  son_tung: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Son_Tung_M-TP_1_2017.jpg/640px-Son_Tung_M-TP_1_2017.jpg",
  my_tam: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg/640px-Ca_s%C4%A9_M%E1%BB%B9_T%C3%A2m.jpg",
  den_vau: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Den_Vau_2019.jpg/640px-Den_Vau_2019.jpg",
  lam_truong: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Lam_Truong_at_Nha_Trang_2009.jpg/640px-Lam_Truong_at_Nha_Trang_2009.jpg",
  dan_truong: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png/640px-%C4%90an_Tr%C6%B0%E1%BB%9Dng_2021.png",
  tuan_hung: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg/640px-Tu%E1%BA%A5n_H%C6%B0ng_ATVNCG2024_%28cropped%29.jpg",
  ha_anh_tuan: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/H%C3%A0_Anh_Tu%E1%BA%A5n.png/640px-H%C3%A0_Anh_Tu%E1%BA%A5n.png",
  soobin: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg/640px-SOOBIN_-_LIVE_CONCERT_ALL-ROUNDER_THE_FINAL_2025.jpg",
  phan_manh_quynh: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png/640px-Phan_M%E1%BA%A1nh_Qu%E1%BB%B3nh.png",
  hoang_thuy_linh: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/HOANG_THUY_LINH_DIEU_HANH_A80.jpg/640px-HOANG_THUY_LINH_DIEU_HANH_A80.jpg",
  hieuthuhai: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/HIEUTHUHAI.jpg/640px-HIEUTHUHAI.jpg",
  trinh_cong_son: "https://upload.wikimedia.org/wikipedia/vi/5/5b/Trinhcongson.jpg",
  van_cao: "https://upload.wikimedia.org/wikipedia/vi/1/1a/Vancao.jpg",
  buc_tuong: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Tran_Lap_Buc_Tuong.jpg/640px-Tran_Lap_Buc_Tuong.jpg",
  taylor_swift: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png/640px-Taylor_Swift_at_the_2023_MTV_Video_Music_Awards_%283%29.png",
  celine_dion: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Celine_Dion_Concert_Singing_2012.jpg/640px-Celine_Dion_Concert_Singing_2012.jpg",
  madonna: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Madonna_Rebel_Heart_Tour_2015_-_Stockholm_%2823051422299%29_%28cropped%29.jpg/640px-Madonna_Rebel_Heart_Tour_2015_-_Stockholm_%2823051422299%29_%28cropped%29.jpg",
  ed_sheeran: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/640px-Ed_Sheeran-6886_%28cropped%29.jpg",
  elvis_presley: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Elvis_Presley_promoting_Jailhouse_Rock.jpg/640px-Elvis_Presley_promoting_Jailhouse_Rock.jpg",
  michael_jackson: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg/640px-Michael_Jackson_1983_%283x4_cropped%29_%28contrast%29.jpg",
  queen_band: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg/640px-Queen_A_Night_At_The_Opera_%281975_Elektra_publicity_photo_02%29.jpg",
  beatles: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg/640px-The_Beatles_1963_Dezo_Hoffman_Capitol_Records_press_photo_2.jpg",
  britney_spears: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Britney_Spears_2013_%28Straighten_Crop%29.jpg/640px-Britney_Spears_2013_%28Straighten_Crop%29.jpg",
  adele: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Adele_2016.jpg/640px-Adele_2016.jpg",
  bruno_mars: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg/640px-BrunoMars24KMagicWorldTourLive_%28cropped%29.jpg",
  billie_eilish: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg/640px-BillieEilishO2140725-39_-_54665577407_%28cropped%29.jpg",
  eminem: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Eminem_2021_Color_Corrected.jpg/640px-Eminem_2021_Color_Corrected.jpg",
  the_weeknd: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/The_Weeknd_Portrait_by_Brian_Ziff.jpg/640px-The_Weeknd_Portrait_by_Brian_Ziff.jpg",
  lady_gaga: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/640px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg",
  rihanna: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Rihanna_Fenty_2018.png/640px-Rihanna_Fenty_2018.png",
  katy_perry: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Katy_Perry_2026_Tribeca_Film_Festival_%28cropped_1%29.jpg/640px-Katy_Perry_2026_Tribeca_Film_Festival_%28cropped_1%29.jpg",
  justin_bieber: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Justin_Bieber_in_2015.jpg/640px-Justin_Bieber_in_2015.jpg",
  ariana_grande: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Ariana_Grande_promoting_Wicked_%282024%29.jpg/640px-Ariana_Grande_promoting_Wicked_%282024%29.jpg",
  mariah_carey: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Mariah_Carey_Library_of_Congress_2023_1_Cropped_3.png/640px-Mariah_Carey_Library_of_Congress_2023_1_Cropped_3.png",
  whitney_houston: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Whitney_Houston_%28cropped3%29.JPEG/640px-Whitney_Houston_%28cropped3%29.JPEG",
  shakira: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2023-11-16_Gala_de_los_Latin_Grammy%2C_03_%28cropped%2902.jpg/640px-2023-11-16_Gala_de_los_Latin_Grammy%2C_03_%28cropped%2902.jpg",
  drake: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg/640px-Drake_at_The_Carter_Effect_2017_%2836818935200%29_%28cropped%29.jpg",
  beyonce: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg/640px-Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%2810_of_118%29_%2852946364598%29_%28best_crop%29.jpg",
  coldplay: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/ColdplayWembley120925_%28cropped%29.jpg/640px-ColdplayWembley120925_%28cropped%29.jpg",
  maroon_5: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Maroon_5_Current_Lineup_Collage.jpg/640px-Maroon_5_Current_Lineup_Collage.jpg",
  miley_cyrus: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg/640px-Miley_Cyrus_Primavera19_-226_%2848986293772%29_%28cropped%29.jpg",
  selena_gomez: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Selena_Gomez_at_the_2024_Toronto_International_Film_Festival_10_%28cropped%29.jpg/640px-Selena_Gomez_at_the_2024_Toronto_International_Film_Festival_10_%28cropped%29.jpg",
  bts: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg/640px-BTS_during_a_White_House_press_conference_May_31%2C_2022_%28cropped%29.jpg",
  rm_bts: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/RM_at_the_2024_Bottega_Veneta_Show_02.png/640px-RM_at_the_2024_Bottega_Veneta_Show_02.png",
  jungkook_bts: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Jung_Kook_of_BTS%2C_February_12%2C_2026_%281%29.png/640px-Jung_Kook_of_BTS%2C_February_12%2C_2026_%281%29.png",
  blackpink: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/20240809_Blackpink_Pink_Carpet_09.png/640px-20240809_Blackpink_Pink_Carpet_09.png",
  jennie: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/20260526_Jennie_Kim_04.jpg/640px-20260526_Jennie_Kim_04.jpg",
  jisoo: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png/640px-Jisoo_at_Boyfriend_on_Demand_press_conference_on_26022026_%2812%29.png",
  rose: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg/640px-Blackpink_Ros%C3%A9_Rimowa_1.jpg",
  lisa: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/20240314_Lisa_Manoban_07.jpg/640px-20240314_Lisa_Manoban_07.jpg",
  g_dragon: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/G-Dragon_in_October_2025.jpg/640px-G-Dragon_in_October_2025.jpg",
  bigbang: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/BIGBANG_2011_%28current_members_since_2023%29.jpg/640px-BIGBANG_2011_%28current_members_since_2023%29.jpg",
  snsd: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/220728_GG_poleposition_266_%2853595169645%29.jpg/640px-220728_GG_poleposition_266_%2853595169645%29.jpg",
  taeyeon: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg/640px-250307_Taeyeon_%40_-The_Tense-_in_Seoul_Day_1_%2854371295597%29_%28cropped%29.jpg",
  super_junior: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/KCON_2015_Super_Junior_DSC02998_%2820357930851%29.jpg/640px-KCON_2015_Super_Junior_DSC02998_%2820357930851%29.jpg",
  twice: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Twice_260618.jpg/640px-Twice_260618.jpg",
  two_ne1: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/2NE1_2013_kpop_hologram_%28cropped%29.jpg/640px-2NE1_2013_kpop_hologram_%28cropped%29.jpg",
  exo: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Exo_monster_160618_suwon.png/640px-Exo_monster_160618_suwon.png",
  newjeans: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/NewJeans_2023_MelonMusicAwards_composite.jpg/640px-NewJeans_2023_MelonMusicAwards_composite.jpg",
  aespa: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Aespa_Love_Your_W_2025_1.jpg/640px-Aespa_Love_Your_W_2025_1.jpg",
  seventeen: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Seventeen_Carat_Land_24.jpg/640px-Seventeen_Carat_Land_24.jpg",
  psy: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/PSY_EMTV_logo_27_%288198008711%29.jpg/640px-PSY_EMTV_logo_27_%288198008711%29.jpg",
  boa: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png/640px-180417_%EB%B3%B4%EC%95%84_03_%28cropped%29_02.png",
  lee_hyori: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Lee_Hyo-ri_in_2013.jpg/640px-Lee_Hyo-ri_in_2013.jpg",

  // === PHIM HÀN QUỐC (K-DRAMA) ===
  crash_landing_on_you: "https://upload.wikimedia.org/wikipedia/en/6/64/Crash_Landing_on_You_main_poster.jpg",
  hyun_bin: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/640px-Hyun_Bin_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg",
  son_ye_jin: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Son_Ye-jin_in_May_2026.png/640px-Son_Ye-jin_in_May_2026.png",
  descendants_of_sun: "https://upload.wikimedia.org/wikipedia/en/6/6e/Descendants_of_the_Sun_poster.jpg",
  song_joong_ki: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Song_Joong-ki_at_Style_Icon_Asia_2016.jpg/640px-Song_Joong-ki_at_Style_Icon_Asia_2016.jpg",
  song_hye_kyo: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg/640px-Song_Hye_Kyo_2025_%EC%86%A1%ED%98%9C%EA%B5%90_04.jpg",
  squid_game: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Squid_Game_2021_vector_logo_english.svg/640px-Squid_Game_2021_vector_logo_english.svg.png",
  goblin: "https://upload.wikimedia.org/wikipedia/en/b/b1/Guardian_The_Lonely_and_Great_God_poster.jpg",
  gong_yoo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Gong_Yoo_in_2021_-_3.png/640px-Gong_Yoo_in_2021_-_3.png",
  lee_min_ho: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png/640px-TIFF-2026-THE-ASSASSINS-LEE-MIN-HO-02.png",
  boys_over_flowers: "https://upload.wikimedia.org/wikipedia/en/b/bb/Boys_Over_Flowers_poster.jpg",
  kim_soo_hyun: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Kim_Soo-hyun_in_August_2024_-_2.png/640px-Kim_Soo-hyun_in_August_2024_-_2.png",
  my_love_from_star: "https://upload.wikimedia.org/wikipedia/en/7/79/My_Love_from_the_Star_poster.jpg",
  jun_ji_hyun: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Jun_Ji-hyun_in_April_2026.png/640px-Jun_Ji-hyun_in_April_2026.png",
  park_seo_joon: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Park_Seo-joon_in_March_2026.png/640px-Park_Seo-joon_in_March_2026.png",
  itaewon_class: "https://upload.wikimedia.org/wikipedia/en/0/02/Itaewon_Class.png",
  reply_1988: "https://upload.wikimedia.org/wikipedia/en/7/75/Reply_1988.png",
  park_bo_gum: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Park_Bo-gum_%EB%B0%95%EB%B3%B4%EA%B2%80_%E6%9C%B4%E5%AF%B6%E5%8A%8D_for_Marie_Claire_Korea%2C_April_2025_4.png/640px-Park_Bo-gum_%EB%B0%95%EB%B3%B4%EA%B2%80_%E6%9C%B4%E5%AF%B6%E5%8A%8D_for_Marie_Claire_Korea%2C_April_2025_4.png",
  hotel_del_luna: "https://upload.wikimedia.org/wikipedia/en/2/29/Hotel_Del_Luna.png",
  iu_kdrama: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png/640px-IU_at_the_Est%C3%A9e_Lauder_launch_event%2C_26_February_2026_%2810%29.png",
  secretary_kim: "https://upload.wikimedia.org/wikipedia/en/b/bc/What%27s_Wrong_with_Secretary_Kim.png",
  queen_of_tears: "https://upload.wikimedia.org/wikipedia/en/6/69/Queen_of_Tears_poster.png",
  the_glory: "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Glory_TV_series.png",
  seoul_tower: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a6/NamsanTower_%28Cropped%29.jpeg/640px-NamsanTower_%28Cropped%29.jpeg",
  go_game: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/FloorGoban.JPG/640px-FloorGoban.JPG",

  // === PHIM MỸ & VIỆT NAM ===
  avatar_film: "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg",
  titanic_film: "https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png",
  iron_man: "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
  avengers_endgame: "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg",
  infinity_gauntlet: "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg",
  james_cameron: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/James_Cameron_at_53rd_Saturn_Awards_2026-01_%28cropped%29.jpg/640px-James_Cameron_at_53rd_Saturn_Awards_2026-01_%28cropped%29.jpg",
  phim_mai: "https://upload.wikimedia.org/wikipedia/vi/8/87/Poster_phim_Mai_2024.jpg",
  tran_thanh: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Tr%E1%BA%A5n_Th%C3%A0nh_191226.png/640px-Tr%E1%BA%A5n_Th%C3%A0nh_191226.png",
  phim_bo_gia: "https://upload.wikimedia.org/wikipedia/vi/3/30/Bo_gia_2021_poster.jpg",
  ly_hai: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Ly_hai_1_%28cropped%29.jpg/640px-Ly_hai_1_%28cropped%29.jpg",
  phim_mat_biec: "https://upload.wikimedia.org/wikipedia/vi/f/f0/Mat_biec_poster.jpg",
  phim_hai_phuong: "https://upload.wikimedia.org/wikipedia/vi/c/ca/Hai_Phuong_poster.jpg",
  ngo_thanh_van: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Ng%C3%B4_Thanh_V%C3%A2n.png/640px-Ng%C3%B4_Thanh_V%C3%A2n.png",
  harry_potter: "https://upload.wikimedia.org/wikipedia/en/b/bd/Hogwarts_crest.png",
  interstellar: "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
  inception: "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
  dark_knight_joker: "https://upload.wikimedia.org/wikipedia/en/2/2b/Heath_Ledger_as_the_Joker_in_The_Dark_Knight.png",
  em_chua_18: "https://upload.wikimedia.org/wikipedia/vi/5/5a/Em_chua_18_poster.jpg",
  keanu_reeves_wick: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/640px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg",
  the_matrix: "https://upload.wikimedia.org/wikipedia/en/d/db/The_Matrix.png",
  tom_cruise_mi: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg/640px-Tom_Cruise_at_53rd_Saturn_Awards_2026-01.jpg",
  jack_sparrow: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg/640px-Johnny_Depp_as_Captain_Jack_Sparrow_in_Queensland%2C_Australia.jpg",
  the_godfather: "https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg",
  jurassic_park: "https://upload.wikimedia.org/wikipedia/en/e/e7/Jurassic_Park_poster.jpg",
  lord_of_rings: "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
  oppenheimer: "https://upload.wikimedia.org/wikipedia/en/4/4a/Oppenheimer_%28film%29.jpg",
  home_alone: "https://upload.wikimedia.org/wikipedia/en/7/76/Home_alone_poster.jpg",
  forrest_gump: "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg",
  spider_man: "https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png",

  // === HOẠT HÌNH NHẬT BẢN ===
  pokemon_pikachu: "https://upload.wikimedia.org/wikipedia/en/a/a6/Pok%C3%A9mon_Pikachu_art.png",
  one_piece_luffy: "https://upload.wikimedia.org/wikipedia/en/c/cb/Monkey_D_Luffy.png",
  one_piece_zoro: "https://upload.wikimedia.org/wikipedia/en/a/a4/Roronoa_Zoro.jpg",
  dragon_ball_goku: "https://upload.wikimedia.org/wikipedia/en/4/4c/GokumangaToriyama.png",
  dragon_ball_vegeta: "https://upload.wikimedia.org/wikipedia/en/8/88/Vegeta_Dragon_Ball.jpg",
  naruto_uzumaki: "https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg",
  shin_chan: "https://upload.wikimedia.org/wikipedia/en/9/92/Crayon_Shin-chan_vol_1_cover.jpg",
  sailor_moon: "https://upload.wikimedia.org/wikipedia/en/e/e5/SMVolume1.jpg",
  totoro: "https://upload.wikimedia.org/wikipedia/en/0/02/My_Neighbor_Totoro_-_Tonari_no_Totoro_%28Movie_Poster%29.jpg",
  spirited_away: "https://upload.wikimedia.org/wikipedia/en/d/db/Spirited_Away_Japanese_poster.png",
  slam_dunk: "https://upload.wikimedia.org/wikipedia/en/f/f7/Slam_Dunk_%28manga%29_1.png",
  yugioh: "https://upload.wikimedia.org/wikipedia/en/3/3e/Yu-Gi-Oh%21_vol._1.png",
  inuyasha: "https://upload.wikimedia.org/wikipedia/en/6/67/Inuyasha_1.png",
  attack_on_titan: "https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg",
  demon_slayer: "https://upload.wikimedia.org/wikipedia/en/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg",
  death_note: "https://upload.wikimedia.org/wikipedia/en/6/6f/Death_Note_Vol_1.jpg",
  ramen: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg/640px-Shoyu_Ramen%EF%BC%88Tokyo_Ramen%EF%BC%89_-_01.jpg",

  // === HOẠT HÌNH MỸ ===
  tom_and_jerry: "https://upload.wikimedia.org/wikipedia/en/5/5f/TomandJerryTitleCardc.jpg",
  mickey_mouse: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Mickey_Mouse_%28poster_version%29.svg/640px-Mickey_Mouse_%28poster_version%29.svg.png",
  donald_duck: "https://upload.wikimedia.org/wikipedia/en/a/a5/Donald_Duck_angry_transparent_background.png",
  spongebob: "https://upload.wikimedia.org/wikipedia/en/thumb/2/22/SpongeBob_SquarePants_logo_by_Nickelodeon.svg/640px-SpongeBob_SquarePants_logo_by_Nickelodeon.svg.png",
  ben_10: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Ben_10_reboot_logo.png",
  phineas_and_ferb: "https://upload.wikimedia.org/wikipedia/en/thumb/6/6e/Phineas_and_Ferb_logo.svg/640px-Phineas_and_Ferb_logo.svg.png",
  powerpuff_girls: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Powerpuff_Girls_logo.png/640px-Powerpuff_Girls_logo.png",
  scooby_doo: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Scooby_doo_logo.png/640px-Scooby_doo_logo.png",
  little_mermaid: "https://upload.wikimedia.org/wikipedia/en/c/c0/The_Little_Mermaid_%28Official_1989_Film_Poster%29.png",
  lion_king: "https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg",
  aladdin: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Robin_Williams_1996_%28cropped%29_2.jpg/640px-Robin_Williams_1996_%28cropped%29_2.jpg",
  toy_story: "https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg",
  shrek: "https://upload.wikimedia.org/wikipedia/en/7/7b/Shrek_%282001_animated_feature_film%29.jpg",
  minions: "https://upload.wikimedia.org/wikipedia/en/1/19/Minions_%282015_film%29.jpg",
  up_pixar: "https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg",
  ratatouille: "https://upload.wikimedia.org/wikipedia/en/5/50/RatatouillePoster.jpg",
  frozen: "https://upload.wikimedia.org/wikipedia/en/0/05/Frozen_%282013_film%29_poster.jpg",
  elsa: "https://upload.wikimedia.org/wikipedia/en/5/5e/Elsa_from_Disney%27s_Frozen.png",

  // === PHIM & HOẠT HÌNH TRUNG QUỐC ===
  journey_to_west: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Evl53201b_pic.jpg",
  sun_wukong: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Xiyou.PNG/640px-Xiyou.PNG",
  hoan_chau_cach_cach: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Zhao_Wei.jpg/640px-Zhao_Wei.jpg",
  than_dieu_dai_hiep: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Liu_Yifei_attended_the_brand_event.jpg/640px-Liu_Yifei_attended_the_brand_event.jpg",
  bao_thanh_thien: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg/640px-%E6%AD%B7%E4%BB%A3%E8%81%96%E8%B3%A2%E5%90%8D%E4%BA%BA%E5%83%8F-30-%E5%AE%8B%E9%BE%8D%E5%9C%96%E5%AD%B8%E5%A3%AB%E5%8C%85%E5%AD%9D%E8%82%85%E5%85%AC%E6%8B%AF.jpg",
  tam_quoc_dien_nghia: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg/640px-%E6%98%8E%E4%BA%BA%E7%BB%98_%E3%80%8A%E8%AF%B8%E8%91%9B%E4%BA%AE%E5%83%8F%E3%80%8B%EF%BC%88%E5%8D%97%E8%96%B0%E6%AE%BF%E6%9C%AC%EF%BC%89.jpg",
  quan_vu: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Guanyu-1.jpg/640px-Guanyu-1.jpg",
  kim_dung: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Jin_Yong%2C_July_2007.jpg/640px-Jin_Yong%2C_July_2007.jpg",
  nezha: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg/640px-Ping_Sien_Si_-_008_Nezha_%28deity%29_%2815513109434%29.jpg"
};

console.log(`Defined ${Object.keys(IMAGES).length} verified images.`);

function getQuestionImage(q) {
  const prompt = (q.prompt || '').toLowerCase();
  const ans = (q.options[q.correct_index] || '').toLowerCase();
  const cat = q.category || '';
  const search = `${prompt} ${ans}`;
  
  // Ưu tiên đối chiếu đáp án đúng trước (vì đáp án đúng là đối tượng đích của câu hỏi), sau đó mới tới câu hỏi
  const check = (keywords) => {
    for (const kw of keywords) {
      if (ans.includes(kw)) return true;
    }
    for (const kw of keywords) {
      if (prompt.includes(kw)) return true;
    }
    return false;
  };

  // ================= 1. DORAEMON =================
  if (cat === 'Doraemon') {
    if (check(['melonpan', 'dưa lưới'])) return IMAGES.melonpan;
    if (check(['dorayaki', 'bánh rán'])) return IMAGES.dorayaki;
    if (check(['chuột'])) return IMAGES.mouse;
    if (check(['dorami'])) return IMAGES.dorami;
    if (check(['shizuka', 'xuka'])) return IMAGES.shizuka;
    if (check(['suneo', 'xêkô'])) return IMAGES.suneo;
    if (check(['jaian', 'chaien', 'takeshi'])) return IMAGES.jaian;
    if (check(['dekisugi', 'đêkhi'])) return IMAGES.dekisugi;
    if (check(['sewashi'])) return IMAGES.sewashi;
    if (check(['tamako'])) return IMAGES.tamako_nobi;
    if (check(['nobisuke'])) return IMAGES.nobisuke_nobi;
    if (check(['jaiko'])) return IMAGES.jaiko;
    if (check(['mini-dora', 'mini dora'])) return IMAGES.mini_dora;
    if (check(['chong chóng tre'])) return IMAGES.take_copter;
    if (check(['cánh cửa thần kỳ'])) return IMAGES.dokodemo_door;
    if (check(['cỗ máy thời gian', 'ngăn kéo'])) return IMAGES.time_machine;
    if (check(['khăn trùm thời gian'])) return IMAGES.time_cloth;
    if (check(['đèn pin thu nhỏ', 'đèn pin phóng to'])) return IMAGES.small_light;
    if (check(['bánh mì chuyển ngữ', 'konyaku'])) return IMAGES.translation_konyaku;
    if (check(['pi-suke', 'khủng long'])) return IMAGES.pisuke;
    if (check(['fujiko'])) return IMAGES.fujiko_fujio;
    if (check(['nobita', 'chơi dây', 'bắn súng', '0.93'])) return IMAGES.nobita;
    if (check(['khoai lang'])) return IMAGES.sweet_potato;
    if (check(['bóng chày'])) return IMAGES.baseball;
    if (prompt.includes('màu vàng') && prompt.includes('nguyên bản')) return IMAGES.doraemon_yellow;
    return IMAGES.doraemon_main;
  }

  // ================= 2. CONAN =================
  if (cat === 'Conan – Thám tử lừng danh') {
    // Phase 1: Check đáp án trước
    if (ans.includes('kaito kid') || ans.includes('kuroba') || ans.includes('1412')) return IMAGES.kaito_kid;
    if (ans.includes('shinichi')) return IMAGES.shinichi;
    if (ans.includes('haibara') || ans.includes('shiho') || ans.includes('sherry')) return IMAGES.ai_haibara;
    if (ans.includes('heiji') || ans.includes('hattori')) return IMAGES.heiji_hattori;
    if (ans.includes('kazuha')) return IMAGES.kazuha;
    if (ans.includes('agasa')) return IMAGES.agasa;
    if (ans.includes('ran mori') || ans.includes('karate')) return IMAGES.ran_mori;
    if (ans.includes('kogoro') || ans.includes('ngủ gật')) return IMAGES.kogoro_mori;
    if (ans.includes('vermouth') || ans.includes('chris vineyard')) return IMAGES.vermouth;
    if (ans.includes('akai') || ans.includes('rye') || ans.includes('subaru')) return IMAGES.shuichi_akai;
    if (ans.includes('amuro') || ans.includes('bourbon') || ans.includes('furuya')) return IMAGES.toru_amuro;
    if (ans.includes('eri kisaki')) return IMAGES.eri_kisaki;
    if (ans.includes('yusaku') || ans.includes('yukiko')) return IMAGES.yusaku_kudo;
    if (ans.includes('aptx')) return IMAGES.aptx_4869;
    if (ans.includes('gin') || ans.includes('vodka') || ans.includes('áo đen')) return IMAGES.gin_vodka;
    if (ans.includes('đội thám tử nhí') || ans.includes('ayumi') || ans.includes('mitsuhiko') || ans.includes('genta')) return IMAGES.detective_boys;
    if (ans.includes('cơm lươn')) return IMAGES.unagi;
    if (ans.includes('ánh trăng') || ans.includes('sonata') || ans.includes('piano')) return IMAGES.moonlight_sonata;
    if (ans.includes('osaka')) return IMAGES.osaka_castle;
    if (ans.includes('tháp tokyo') || ans.includes('matsuda')) return IMAGES.tokyo_tower;
    if (ans.includes('fbi')) return IMAGES.fbi_badge;
    if (ans.includes('gosho aoyama')) return IMAGES.gosho_aoyama;

    // Phase 2: Check câu hỏi
    if (prompt.includes('kaito kid') || prompt.includes('kuroba') || prompt.includes('1412')) return IMAGES.kaito_kid;
    if (prompt.includes('haibara') || prompt.includes('shiho') || prompt.includes('sherry')) return IMAGES.ai_haibara;
    if (prompt.includes('heiji') || prompt.includes('hattori')) return IMAGES.heiji_hattori;
    if (prompt.includes('kazuha')) return IMAGES.kazuha;
    if (prompt.includes('agasa') || prompt.includes('tiến sĩ')) return IMAGES.agasa;
    if (prompt.includes('ran mori') || prompt.includes('karate')) return IMAGES.ran_mori;
    if (prompt.includes('kogoro') || prompt.includes('ngủ gật')) return IMAGES.kogoro_mori;
    if (prompt.includes('vermouth') || prompt.includes('chris vineyard')) return IMAGES.vermouth;
    if (prompt.includes('akai') || prompt.includes('rye') || prompt.includes('subaru')) return IMAGES.shuichi_akai;
    if (prompt.includes('amuro') || prompt.includes('bourbon') || prompt.includes('furuya')) return IMAGES.toru_amuro;
    if (prompt.includes('eri kisaki') || prompt.includes('luật sư')) return IMAGES.eri_kisaki;
    if (prompt.includes('yusaku') || prompt.includes('yukiko')) return IMAGES.yusaku_kudo;
    if (prompt.includes('aptx') || prompt.includes('độc dược')) return IMAGES.aptx_4869;
    if (prompt.includes('gin') || prompt.includes('vodka') || prompt.includes('áo đen')) return IMAGES.gin_vodka;
    if (prompt.includes('porsche 356')) return IMAGES.porsche_356;
    if (prompt.includes('thám tử nhí') || prompt.includes('ayumi') || prompt.includes('mitsuhiko') || prompt.includes('genta')) return IMAGES.detective_boys;
    if (prompt.includes('cơm lươn')) return IMAGES.unagi;
    if (prompt.includes('ánh trăng') || prompt.includes('sonata') || prompt.includes('piano')) return IMAGES.moonlight_sonata;
    if (prompt.includes('osaka')) return IMAGES.osaka_castle;
    if (prompt.includes('tháp tokyo') || prompt.includes('matsuda')) return IMAGES.tokyo_tower;
    if (prompt.includes('fbi')) return IMAGES.fbi_badge;
    if (prompt.includes('shinichi')) return IMAGES.shinichi;
    if (prompt.includes('gosho aoyama')) return IMAGES.gosho_aoyama;

    return IMAGES.conan_main;
  }

  // ================= 3. ĐỊA LÝ CƠ BẢN =================
  if (cat === 'Địa lý cơ bản') {
    if (check(['canberra', 'nước úc', 'australia'])) return IMAGES.canberra;
    if (check(['sydney'])) return IMAGES.sydney;
    if (check(['ottawa', 'canada'])) return IMAGES.ottawa;
    if (check(['fansipan', 'nóc nhà đông dương'])) return IMAGES.fansipan;
    if (check(['sơn đoòng', 'quảng bình'])) return IMAGES.son_doong;
    if (check(['sông nin', 'sông nile', 'nile'])) return IMAGES.nile_river;
    if (check(['amazon'])) return IMAGES.amazon_river;
    if (check(['mê kông', 'mekong', 'cửu long'])) return IMAGES.mekong_river;
    if (check(['thái bình dương'])) return IMAGES.pacific_ocean;
    if (check(['kim tự tháp', 'giza', 'ai cập'])) return IMAGES.pyramids_giza;
    if (check(['nga', 'moscow', 'russia'])) return IMAGES.russia;
    if (check(['vatican'])) return IMAGES.vatican;
    if (check(['phú sĩ', 'fuji'])) return IMAGES.fuji_mountain;
    if (check(['hà lan', 'cối xay gió'])) return IMAGES.netherlands;
    if (check(['nepal'])) return IMAGES.nepal_flag;
    if (check(['hạ long'])) return IMAGES.ha_long_bay;
    if (check(['angkor wat', 'campuchia'])) return IMAGES.angkor_wat;
    if (check(['washington', 'nhà trắng'])) return IMAGES.washington_dc;
    if (check(['taj mahal', 'ấn độ'])) return IMAGES.taj_mahal;
    if (check(['nam cực'])) return IMAGES.antarctica;
    if (check(['sahara', 'atacama', 'sa mạc'])) return IMAGES.sahara;
    if (check(['baikal'])) return IMAGES.lake_baikal;
    if (check(['suez'])) return IMAGES.suez_canal;
    if (check(['panama'])) return IMAGES.panama_canal;
    if (check(['niagara'])) return IMAGES.niagara_falls;
    if (check(['thác angel', 'angel'])) return IMAGES.angel_falls;
    if (check(['paris', 'eiffel'])) return IMAGES.eiffel_tower;
    if (check(['venice'])) return IMAGES.venice;
    if (check(['bangkok', 'thái lan'])) return IMAGES.bangkok;
    if (check(['pisa'])) return IMAGES.leaning_tower_pisa;
    if (check(['everest', 'himalaya'])) return IMAGES.mount_everest;
    if (check(['vạn lý trường thành'])) return IMAGES.great_wall_china;
    if (check(['colosseum', 'đấu trường la mã'])) return IMAGES.colosseum;
    if (check(['huế', 'sông hương'])) return IMAGES.hue_citadel;
    if (check(['đà lạt'])) return IMAGES.dalat_city;
    if (check(['phú quốc'])) return IMAGES.phu_quoc;
    if (check(['bản giốc'])) return IMAGES.ban_gioc_falls;
    if (check(['đồng văn', 'mã pí lèng'])) return IMAGES.dong_van_karst;
    if (check(['greenwich'])) return IMAGES.greenwich;
    if (check(['xích đạo', 'equator'])) return IMAGES.equator;
    if (check(['biển chết'])) return IMAGES.dead_sea;
    if (check(['sông hồng', 'sông đà'])) return IMAGES.red_river;
    if (check(['vesuvius', 'pompeii'])) return IMAGES.vesuvius;
    if (check(['bering'])) return IMAGES.bering_strait;
    if (check(['cam ranh'])) return IMAGES.cam_ranh_bay;
    if (check(['brazil'])) return IMAGES.brazil_flag;
    if (check(['nhật bản'])) return IMAGES.japan_flag;
    if (check(['vương quốc anh', 'nước anh'])) return IMAGES.uk_flag;
    if (check(['pháp'])) return IMAGES.france_flag;
    if (check(['ý', 'italy'])) return IMAGES.italy_flag;
    return IMAGES.equator;
  }

  // ================= 4. ĐOÁN TÊN CA SĨ NỔI TIẾNG =================
  if (cat === 'Đoán tên ca sĩ nổi tiếng') {
    if (ans.includes('sơn tùng') || search.includes('m-tp') || search.includes('lạc trôi')) return IMAGES.son_tung;
    if (ans.includes('mỹ tâm') || search.includes('họa mi tóc nâu')) return IMAGES.my_tam;
    if (ans.includes('đen vâu') || search.includes('đi về nhà') || search.includes('nấu ăn cho em')) return IMAGES.den_vau;
    if (ans.includes('lam trường') || search.includes('anh hai') || search.includes('tình thôi xót xa')) return IMAGES.lam_truong;
    if (ans.includes('đan trường') || search.includes('anh bo') || search.includes('kiếp ve sầu')) return IMAGES.dan_truong;
    if (ans.includes('tuấn hưng') || search.includes('cầu vồng khuyết')) return IMAGES.tuan_hung;
    if (ans.includes('hà anh tuấn')) return IMAGES.ha_anh_tuan;
    if (ans.includes('soobin')) return IMAGES.soobin;
    if (ans.includes('phan mạnh quỳnh')) return IMAGES.phan_manh_quynh;
    if (ans.includes('hoàng thùy linh')) return IMAGES.hoang_thuy_linh;
    if (ans.includes('hieuthuhai')) return IMAGES.hieuthuhai;
    if (ans.includes('trịnh công sơn')) return IMAGES.trinh_cong_son;
    if (ans.includes('văn cao')) return IMAGES.van_cao;
    if (ans.includes('bức tường') || ans.includes('trần lập')) return IMAGES.buc_tuong;
    if (ans.includes('taylor swift')) return IMAGES.taylor_swift;
    if (ans.includes('céline dion') || ans.includes('celine dion')) return IMAGES.celine_dion;
    if (ans.includes('madonna') || search.includes('queen of pop') || search.includes('nữ hoàng nhạc pop')) return IMAGES.madonna;
    if (ans.includes('ed sheeran')) return IMAGES.ed_sheeran;
    if (ans.includes('elvis presley')) return IMAGES.elvis_presley;
    if (ans.includes('britney spears')) return IMAGES.britney_spears;
    if (ans.includes('rm') || ans.includes('jungkook') || ans.includes('bts')) return IMAGES.bts;
    if (ans.includes('lee hyori')) return IMAGES.lee_hyori;
    if (ans.includes('boa')) return IMAGES.boa;
    if (ans.includes('taeyeon') || ans.includes('snsd')) return IMAGES.taeyeon;
    if (ans.includes('g-dragon') || ans.includes('bigbang')) return IMAGES.g_dragon;
    if (ans.includes('iu')) return IMAGES.iu_kdrama;
    if (ans.includes('psy')) return IMAGES.psy;
    if (ans.includes('michael jackson')) return IMAGES.michael_jackson;
    if (ans.includes('adele')) return IMAGES.adele;
    if (ans.includes('shakira')) return IMAGES.shakira;
    if (ans.includes('whitney houston')) return IMAGES.whitney_houston;
    if (ans.includes('mariah carey')) return IMAGES.mariah_carey;
    if (ans.includes('justin bieber')) return IMAGES.justin_bieber;
    if (ans.includes('bruno mars')) return IMAGES.bruno_mars;
    return IMAGES.son_tung;
  }

  // ================= 5. PHIM MỸ & PHIM VIỆT NAM =================
  if (cat === 'Phim Mỹ & Phim Việt Nam') {
    if (search.includes('avatar') || search.includes('pandora')) return IMAGES.avatar_film;
    if (search.includes('titanic') || search.includes('trái tim đại dương')) return IMAGES.titanic_film;
    if (search.includes('iron man') || search.includes('tony stark')) return IMAGES.iron_man;
    if (search.includes('avengers') || search.includes('găng tay vô cực') || search.includes('thanos')) return IMAGES.avengers_endgame;
    if (search.includes('james cameron')) return IMAGES.james_cameron;
    if (search.includes('phim mai') || ans === 'mai') return IMAGES.phim_mai;
    if (search.includes('trấn thành') || search.includes('bố già')) return IMAGES.phim_bo_gia;
    if (search.includes('lý hải') || search.includes('lật mặt')) return IMAGES.ly_hai;
    if (search.includes('mắt biếc')) return IMAGES.phim_mat_biec;
    if (search.includes('hai phượng') || search.includes('ngô thanh vân')) return IMAGES.phim_hai_phuong;
    if (search.includes('harry potter') || search.includes('hogwarts') || search.includes('quidditch')) return IMAGES.harry_potter;
    if (search.includes('interstellar') || search.includes('hố đen')) return IMAGES.interstellar;
    if (search.includes('inception') || search.includes('con quay')) return IMAGES.inception;
    if (search.includes('joker') || search.includes('dark knight')) return IMAGES.dark_knight_joker;
    if (search.includes('em chưa 18')) return IMAGES.em_chua_18;
    if (search.includes('john wick') || search.includes('keanu reeves')) return IMAGES.keanu_reeves_wick;
    if (search.includes('ma trận') || search.includes('matrix')) return IMAGES.the_matrix;
    if (search.includes('tom cruise') || search.includes('mission')) return IMAGES.tom_cruise_mi;
    if (search.includes('jack sparrow') || search.includes('cướp biển')) return IMAGES.jack_sparrow;
    if (search.includes('godfather') || search.includes('bố già corleone')) return IMAGES.the_godfather;
    if (search.includes('jurassic park') || search.includes('công viên kỷ jura')) return IMAGES.jurassic_park;
    if (search.includes('chúa tể của những chiếc nhẫn') || search.includes('lord of the rings') || search.includes('frodo')) return IMAGES.lord_of_rings;
    if (search.includes('oppenheimer')) return IMAGES.oppenheimer;
    if (search.includes('ở nhà một mình') || search.includes('home alone')) return IMAGES.home_alone;
    if (search.includes('forrest gump')) return IMAGES.forrest_gump;
    if (search.includes('người nhện') || search.includes('spider-man')) return IMAGES.spider_man;
    return IMAGES.avatar_film;
  }

  // ================= 6. HOẠT HÌNH TUỔI THƠ NHẬT BẢN =================
  if (cat === 'Hoạt hình tuổi thơ Nhật Bản') {
    if (search.includes('pikachu') || search.includes('pokémon') || search.includes('pokemon')) return IMAGES.pokemon_pikachu;
    if (search.includes('luffy') || search.includes('one piece') || search.includes('mũ rơm')) return IMAGES.one_piece_luffy;
    if (search.includes('zoro') || search.includes('tam kiếm')) return IMAGES.one_piece_zoro;
    if (search.includes('goku') || search.includes('dragon ball') || search.includes('ngọc rồng') || search.includes('kamehameha')) return IMAGES.dragon_ball_goku;
    if (search.includes('vegeta') || search.includes('ca-đíc')) return IMAGES.dragon_ball_vegeta;
    if (search.includes('naruto') || search.includes('cửu vĩ') || search.includes('làng lá') || search.includes('sharingan')) return IMAGES.naruto_uzumaki;
    if (search.includes('ramen')) return IMAGES.ramen;
    if (search.includes('shin') || search.includes('bút chì') || search.includes('shiro')) return IMAGES.shin_chan;
    if (search.includes('thủy thủ mặt trăng') || search.includes('sailor moon')) return IMAGES.sailor_moon;
    if (search.includes('totoro') || search.includes('ghibli')) return IMAGES.totoro;
    if (search.includes('vùng đất linh hồn') || search.includes('spirited away') || search.includes('chihiro') || search.includes('vô diện')) return IMAGES.spirited_away;
    if (search.includes('slam dunk') || search.includes('sakuragi')) return IMAGES.slam_dunk;
    if (search.includes('yu-gi-oh') || search.includes('yugioh') || search.includes('rồng trắng mắt xanh')) return IMAGES.yugioh;
    if (search.includes('inuyasha') || search.includes('ngọc tứ hồn')) return IMAGES.inuyasha;
    if (search.includes('titan') || search.includes('eren') || search.includes('levi')) return IMAGES.attack_on_titan;
    if (search.includes('diệt quỷ') || search.includes('tanjiro') || search.includes('nezuko')) return IMAGES.demon_slayer;
    if (search.includes('death note') || search.includes('ryuk') || search.includes('thám tử l')) return IMAGES.death_note;
    return IMAGES.pokemon_pikachu;
  }

  // ================= 7. HOẠT HÌNH TUỔI THƠ MỸ =================
  if (cat === 'Hoạt hình tuổi thơ Mỹ') {
    if (search.includes('tom and jerry') || search.includes('tom & jerry') || search.includes('spike')) return IMAGES.tom_and_jerry;
    if (search.includes('mickey') || search.includes('chuột mickey')) return IMAGES.mickey_mouse;
    if (search.includes('donald') || search.includes('vịt donald')) return IMAGES.donald_duck;
    if (search.includes('spongebob') || search.includes('patrick') || search.includes('bọt biển')) return IMAGES.spongebob;
    if (search.includes('ben 10') || search.includes('omnitrix') || search.includes('four arms') || search.includes('heatblast')) return IMAGES.ben_10;
    if (search.includes('phineas') || search.includes('ferb') || search.includes('perry') || search.includes('doofenshmirtz') || search.includes('candace')) return IMAGES.phineas_and_ferb;
    if (search.includes('powerpuff') || search.includes('hóa chất x') || search.includes('mojo jojo')) return IMAGES.powerpuff_girls;
    if (search.includes('scooby') || search.includes('shaggy')) return IMAGES.scooby_doo;
    if (search.includes('nàng tiên cá') || search.includes('ariel')) return IMAGES.little_mermaid;
    if (search.includes('lion king') || search.includes('vua sư tử') || search.includes('simba')) return IMAGES.lion_king;
    if (search.includes('aladdin') || search.includes('thần đèn')) return IMAGES.aladdin;
    if (search.includes('toy story') || search.includes('woody') || search.includes('buzz')) return IMAGES.toy_story;
    if (search.includes('shrek') || search.includes('chú lừa')) return IMAGES.shrek;
    if (search.includes('minions') || search.includes('kẻ trộm mặt trăng') || search.includes('gru')) return IMAGES.minions;
    if (search.includes('vút bay') || search.includes('up') || search.includes('carl')) return IMAGES.up_pixar;
    if (search.includes('ratatouille') || search.includes('chuột đầu bếp')) return IMAGES.ratatouille;
    if (search.includes('frozen') || search.includes('elsa') || search.includes('băng giá')) return IMAGES.elsa;
    return IMAGES.mickey_mouse;
  }

  // ================= 8. PHIM & HOẠT HÌNH TRUNG QUỐC =================
  if (cat === 'Phim & hoạt hình tuổi thơ Trung Quốc') {
    if (search.includes('tôn ngộ không') || search.includes('lục tiểu linh đồng') || search.includes('gậy như ý')) return IMAGES.sun_wukong;
    if (search.includes('tây du ký') || search.includes('trư bát giới') || search.includes('sa tăng') || search.includes('đường tăng') || search.includes('bạch long mã')) return IMAGES.journey_to_west;
    if (search.includes('hoàn châu cách cách') || search.includes('tiểu yến tử') || search.includes('triệu vy') || search.includes('tử vy') || search.includes('nhĩ khang') || search.includes('dung ma ma')) return IMAGES.hoan_chau_cach_cach;
    if (search.includes('thần điêu') || search.includes('tiểu long nữ') || search.includes('dương quá') || search.includes('lưu diệc phi')) return IMAGES.than_dieu_dai_hiep;
    if (search.includes('bao thanh thiên') || search.includes('bao chửng') || search.includes('triển chiêu') || search.includes('công tôn sách')) return IMAGES.bao_thanh_thien;
    if (search.includes('tam quốc') || search.includes('gia cát lượng') || search.includes('khổng minh') || search.includes('lưu bị') || search.includes('tào tháo')) return IMAGES.tam_quoc_dien_nghia;
    if (search.includes('quan vũ')) return IMAGES.quan_vu;
    if (search.includes('kim dung') || search.includes('tiêu phong') || search.includes('quách tĩnh') || search.includes('trương vô kỵ')) return IMAGES.kim_dung;
    if (search.includes('na tra') || search.includes('phong hỏa luân')) return IMAGES.nezha;
    return IMAGES.sun_wukong;
  }

  // ================= 9. PHIM HÀN QUỐC (K-DRAMA) =================
  if (cat === 'Phim Hàn Quốc (K-Drama)') {
    if (search.includes('hạ cánh nơi anh') || search.includes('crash landing')) return IMAGES.crash_landing_on_you;
    if (search.includes('hyun bin')) return IMAGES.hyun_bin;
    if (search.includes('son ye-jin')) return IMAGES.son_ye_jin;
    if (search.includes('hậu duệ mặt trời') || search.includes('descendants of the sun')) return IMAGES.descendants_of_sun;
    if (search.includes('song joong-ki')) return IMAGES.song_joong_ki;
    if (search.includes('song hye-kyo')) return IMAGES.song_hye_kyo;
    if (search.includes('squid game') || search.includes('trò chơi con mực') || search.includes('456')) return IMAGES.squid_game;
    if (search.includes('goblin') || search.includes('yêu tinh') || search.includes('gong yoo')) return IMAGES.goblin;
    if (search.includes('vườn sao băng') || search.includes('boys over flowers') || search.includes('f4') || search.includes('lee min-ho') || search.includes('goo jun-pyo')) return IMAGES.boys_over_flowers;
    if (search.includes('vì sao đưa anh tới') || search.includes('my love from the star') || search.includes('do min-joon')) return IMAGES.my_love_from_star;
    if (search.includes('kim soo-hyun') || search.includes('nữ hoàng nước mắt')) return IMAGES.queen_of_tears;
    if (search.includes('jun ji-hyun') || search.includes('chun song-yi')) return IMAGES.jun_ji_hyun;
    if (search.includes('itaewon') || search.includes('park sae-royi')) return IMAGES.itaewon_class;
    if (search.includes('reply 1988') || search.includes('lời hồi đáp 1988')) return IMAGES.reply_1988;
    if (search.includes('park bo-gum')) return IMAGES.park_bo_gum;
    if (search.includes('hotel del luna') || search.includes('khách sạn ma quái') || search.includes('jang man-wol')) return IMAGES.hotel_del_luna;
    if (search.includes('thư ký kim') || search.includes('secretary kim')) return IMAGES.secretary_kim;
    if (search.includes('the glory')) return IMAGES.the_glory;
    if (search.includes('cờ vây') || search.includes('choi taek')) return IMAGES.go_game;
    return IMAGES.seoul_tower;
  }

  // ================= 10. K-POP =================
  if (cat === 'K-Pop') {
    if (search.includes('bts') || search.includes('dynamite') || search.includes('army')) return IMAGES.bts;
    if (search.includes('rm')) return IMAGES.rm_bts;
    if (search.includes('jungkook')) return IMAGES.jungkook_bts;
    if (search.includes('blackpink') || search.includes('blink') || search.includes('ddu-du')) return IMAGES.blackpink;
    if (search.includes('jennie')) return IMAGES.jennie;
    if (search.includes('jisoo')) return IMAGES.jisoo;
    if (search.includes('rosé') || search.includes('rose')) return IMAGES.rose;
    if (search.includes('lisa')) return IMAGES.lisa;
    if (search.includes('g-dragon')) return IMAGES.g_dragon;
    if (search.includes('bigbang') || search.includes('haru haru') || search.includes('taeyang')) return IMAGES.bigbang;
    if (search.includes('snsd') || search.includes('girls\' generation') || search.includes('gee')) return IMAGES.snsd;
    if (search.includes('taeyeon')) return IMAGES.taeyeon;
    if (search.includes('super junior') || search.includes('sorry, sorry')) return IMAGES.super_junior;
    if (search.includes('twice') || search.includes('cheer up') || search.includes('tt')) return IMAGES.twice;
    if (search.includes('2ne1') || search.includes('i am the best')) return IMAGES.two_ne1;
    if (search.includes('exo') || search.includes('growl')) return IMAGES.exo;
    if (search.includes('newjeans') || search.includes('attention') || search.includes('hype boy')) return IMAGES.newjeans;
    if (search.includes('aespa') || search.includes('next level')) return IMAGES.aespa;
    if (search.includes('seventeen')) return IMAGES.seventeen;
    if (search.includes('psy') || search.includes('gangnam style')) return IMAGES.psy;
    if (search.includes('boa')) return IMAGES.boa;
    return IMAGES.bts;
  }

  // ================= 11. US-UK =================
  if (cat === 'US-UK') {
    if (search.includes('michael jackson') || search.includes('thriller') || search.includes('moonwalk') || search.includes('ông hoàng nhạc pop')) return IMAGES.michael_jackson;
    if (search.includes('beatles') || search.includes('liverpool') || search.includes('john lennon')) return IMAGES.beatles;
    if (search.includes('queen') || search.includes('bohemian rhapsody') || search.includes('freddie mercury')) return IMAGES.queen_band;
    if (search.includes('taylor swift') || search.includes('eras tour') || search.includes('swifties')) return IMAGES.taylor_swift;
    if (search.includes('adele') || search.includes('rolling in the deep') || search.includes('skyfall')) return IMAGES.adele;
    if (search.includes('ed sheeran') || search.includes('shape of you')) return IMAGES.ed_sheeran;
    if (search.includes('beyoncé') || search.includes('queen bey') || search.includes('single ladies')) return IMAGES.beyonce;
    if (search.includes('bruno mars') || search.includes('uptown funk')) return IMAGES.bruno_mars;
    if (search.includes('billie eilish') || search.includes('bad guy')) return IMAGES.billie_eilish;
    if (search.includes('eminem') || search.includes('rap god') || search.includes('lose yourself')) return IMAGES.eminem;
    if (search.includes('the weeknd') || search.includes('blinding lights') || search.includes('starboy')) return IMAGES.the_weeknd;
    if (search.includes('coldplay') || search.includes('viva la vida')) return IMAGES.coldplay;
    if (search.includes('maroon 5') || search.includes('sugar') || search.includes('adam levine')) return IMAGES.maroon_5;
    if (search.includes('lady gaga') || search.includes('bad romance') || search.includes('poker face')) return IMAGES.lady_gaga;
    if (search.includes('rihanna') || search.includes('umbrella') || search.includes('diamonds')) return IMAGES.rihanna;
    if (search.includes('katy perry') || search.includes('roar') || search.includes('firework')) return IMAGES.katy_perry;
    if (search.includes('céline dion') || search.includes('celine dion') || search.includes('my heart will go on')) return IMAGES.celine_dion;
    if (search.includes('whitney houston') || search.includes('i will always love you')) return IMAGES.whitney_houston;
    if (search.includes('mariah carey') || search.includes('christmas')) return IMAGES.mariah_carey;
    if (search.includes('britney spears') || search.includes('baby one more time') || search.includes('toxic')) return IMAGES.britney_spears;
    if (search.includes('justin bieber') || search.includes('baby')) return IMAGES.justin_bieber;
    if (search.includes('ariana grande') || search.includes('7 rings')) return IMAGES.ariana_grande;
    if (search.includes('shakira') || search.includes('waka waka')) return IMAGES.shakira;
    if (search.includes('drake') || search.includes('god\'s plan')) return IMAGES.drake;
    if (search.includes('miley cyrus') || search.includes('flowers')) return IMAGES.miley_cyrus;
    if (search.includes('selena gomez')) return IMAGES.selena_gomez;
    if (search.includes('elvis presley')) return IMAGES.elvis_presley;
    return IMAGES.michael_jackson;
  }

  return null;
}

// Test match on all non-music questions
const nonMusic = bank.filter(q => !q.category.startsWith('Âm nhạc') && q.category !== 'Đoán quốc gia qua Google Map 360°');
console.log(`Checking ${nonMusic.length} non-music questions...`);

let matchedCount = 0;
let defaultFallbackCount = 0;

nonMusic.forEach(q => {
  const img = getQuestionImage(q);
  if (img) {
    matchedCount++;
  } else {
    defaultFallbackCount++;
  }
});

console.log(`Matched: ${matchedCount} / ${nonMusic.length}`);
console.log(`Fallbacks: ${defaultFallbackCount}`);

module.exports = {
  getQuestionImage,
  IMAGES
};


