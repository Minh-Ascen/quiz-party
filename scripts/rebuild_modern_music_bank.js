const fs = require('fs');

const OLD_ARTISTS_KEYWORDS = [
  'Như Quỳnh', 'Cẩm Ly', 'Phi Nhung', 'Quang Lê', 'Lệ Quyên',
  'Ưng Hoàng Phúc', 'Ưng Đại Vệ', 'Duy Mạnh', 'Lam Trường', 'Đan Trường',
  'Tuấn Hưng', 'Akira Phan', 'HKT', 'Khánh Phương', 'Hồ Quang Hiếu',
  'Bảo Thy', 'Khởi My', 'Khắc Việt', 'The Men', 'Đông Nhi'
];

const OLD_SONG_TITLES = [
  'Ước Gì', 'Dường Như Ta Đã', 'Họa Mi Tóc Nâu', 'Người Tình Mùa Đông',
  'Nỗi Buồn Hoa Phượng', 'Áo Mới Cà Mau', 'Vùng Lá Me Bay', 'Duyên Phận',
  'Sầu Tím Thiệp Hồng', 'Vọng Cổ Buồn', 'Chim Trắng Mồ Côi', 'Đi Về Nơi Xa',
  'Kiếp Ve Sầu', 'Kiếp Đỏ Đen', 'Hãy Về Đây Bên Anh', 'Tình Thôi Xót Xa',
  'Hứa Thật Nhiều Thất Hứa Thật Nhiều', 'Người Ta Nói', 'Thà Rằng Như Thế',
  'Vì Một Người', 'Cầu Vồng Khuyết', 'Mùa Đông Không Lạnh', 'Thêm Một Lần Đau',
  'Nàng Kiều Lỡ Bước', 'Công Chúa Bong Bóng', 'Con Bướm Xuân', 'Gửi Cho Anh',
  'Vì Sao', 'Như Vậy Nhé', 'Yêu Lại Từ Đầu', 'Gọi Tên Em Trong Đêm', 'Nếu Là Anh',
  'Khóc', 'Bối Rối', 'Em Luôn Ở Trong Tâm Trí Anh', 'Hoa Nở Về Đêm', 'Không Cảm Xúc',
  'Chiếc Khăn Gió Ấm', 'Nắm Lấy Tay Anh', 'Tình Khúc Vàng', 'Con Đường Xưa Em Đi',
  'Ngôi Nhà Hoa Hồng', 'Tìm Lại Bầu Trời'
];

const bank = JSON.parse(fs.readFileSync('./data/questionBank.json', 'utf8'));
const nonMusic = bank.filter(q => !q.category.startsWith('Âm nhạc Việt') && q.category !== 'Âm nhạc Việt Nam');
const existingMusic = bank.filter(q => q.category.startsWith('Âm nhạc Việt') || q.category === 'Âm nhạc Việt Nam');

// 1. Lọc các bài nhạc hiện đại đã có sẵn trong bank
const keptExisting = existingMusic.filter(q => {
  const title = q.options[q.correct_index];
  const source = q.source || '';
  const isOldArtist = OLD_ARTISTS_KEYWORDS.some(a => source.toLowerCase().includes(a.toLowerCase()));
  const isOldTitle = OLD_SONG_TITLES.some(t => title.toLowerCase().includes(t.toLowerCase()) || source.toLowerCase().includes(t.toLowerCase()));
  return !isOldArtist && !isOldTitle;
});

console.log('Kept existing modern music questions:', keptExisting.length);

// 2. Nạp các bài nhạc trẻ mới đã verify
const verifiedNewYouth = JSON.parse(fs.readFileSync('./scripts/verified_new_youth.json', 'utf8'));

// 3. Danh sách bổ sung các siêu hit hiện đại đã verify
const verifiedAdditionalHits = [
  {
    title: 'Bạc Phận',
    artist: 'K-ICM ft. Jack',
    ytid: '21X5lGlDOfg',
    startTime: 18,
    distractors: ['Hồng Nhan', 'Sóng Gió', 'Sao Em Vô Tình'],
    explanation: "'Bạc Phận' ra mắt năm 2019 là siêu hit triệu view làm mưa làm gió làng nhạc Việt của Jack và K-ICM."
  },
  {
    title: 'Waiting For You',
    artist: 'MONO',
    ytid: 'CHw1b_1LVBA',
    startTime: 20,
    distractors: ['Em Là', 'Quên Anh Đi', 'Cười Lên'],
    explanation: "'Waiting For You' trong album 22 là bản hit Synth-pop bùng nổ đưa MONO thành tân binh khủng long năm 2022."
  },
  {
    title: 'Trốn Tìm',
    artist: 'Đen vâu ft. MTV Band',
    ytid: 'Ws-QlpSltr8',
    startTime: 18,
    distractors: ['Đi Về Nhà', 'Nấu Ăn Cho Em', 'Mang Tiền Về Cho Mẹ'],
    explanation: "'Trốn Tìm' của Đen vâu kết hợp cùng nhóm MTV band mang giai điệu hoài niệm về sự trưởng thành và tình yêu."
  },
  {
    title: 'Có Không Giữ Mất Đừng Tìm',
    artist: 'Trúc Nhân',
    ytid: 'kdVeYgGtO3Q',
    startTime: 20,
    distractors: ['Sáng Mắt Chưa', 'Thật Bất Ngờ', 'Bốn Chữ Lắm'],
    explanation: "'Có Không Giữ Mất Đừng Tìm' sáng tác bởi Bùi Công Nam với MV độc đáo có sự góp mặt của Miu Lê."
  },
  {
    title: 'Sau Tất Cả',
    artist: 'ERIK',
    ytid: 'wHF3Jv6Gk2o',
    startTime: 18,
    distractors: ['Chạm Đáy Nỗi Đau', 'Em Không Sai Chúng Ta Sai', 'Có Tất Cả Nhưng Thiếu Anh'],
    explanation: "'Sau Tất Cả' sáng tác bởi Khắc Hưng là bản ballad debut kinh điển đưa tên tuổi ERIK vụt sáng năm 2016."
  },
  {
    title: 'Đi Đu Đưa Đi',
    artist: 'Bích Phương',
    ytid: 'ZF3b1nK-TjM',
    startTime: 20,
    distractors: ['Bùa Yêu', 'Em Bỏ Hút Thuốc Chưa', 'Nâng Chén Tiêu Sầu'],
    explanation: "'Đi Đu Đưa Đi' mang phong cách Disco sôi động là bản hit đình đám của Bích Phương và Tiên Cookie."
  },
  {
    title: 'Bông Hoa Đẹp Nhất',
    artist: 'Quân A.P',
    ytid: 'fTXd-DpN3AI',
    startTime: 18,
    distractors: ['Ai Là Người Thương Em', 'Còn Gì Đau Hơn Chữ Đã Từng', 'Đáp Án Cuối Cùng'],
    explanation: "'Bông Hoa Đẹp Nhất' là bản ballad đốn tim khán giả đạt vị trí Top 1 Trending YouTube của Quân A.P."
  },
  {
    title: 'Có Chắc Yêu Là Đây',
    artist: 'Sơn Tùng M-TP',
    ytid: '6t-MjBazs3o',
    startTime: 20,
    distractors: ['Nơi Này Có Anh', 'Muộn Rồi Mà Sao Còn', 'Đừng Làm Trái Tim Anh Đau'],
    explanation: "'Có Chắc Yêu Là Đây' là món quà ngọt ngào Sơn Tùng M-TP dành tặng người hâm mộ vào mùa hè 2020."
  },
  {
    title: 'Muộn Rồi Mà Sao Còn',
    artist: 'Sơn Tùng M-TP',
    ytid: 'xypzmu5mMPY',
    startTime: 22,
    distractors: ['Có Chắc Yêu Là Đây', 'Chúng Ta Của Hiện Tại', 'Lạc Trôi'],
    explanation: "'Muộn Rồi Mà Sao Còn' mang phong cách R&B tươi vui kể về nỗi tương tư ngọt ngào của Sơn Tùng M-TP."
  },
  {
    title: 'Gác Lại Âu Lo',
    artist: 'Da LAB ft. Miu Lê',
    ytid: 'ECxVfrwwTp0',
    startTime: 18,
    distractors: ['Thanh Xuân', 'Một Nhà', 'Nước Mắt Em Lau Bằng Tình Yêu Mới'],
    explanation: "'Gác Lại Âu Lo' là bản hit tươi sáng, tràn đầy năng lượng tích cực của Da LAB kết hợp cùng Miu Lê."
  },
  {
    title: 'Duyên Âm',
    artist: 'Hoàng Thùy Linh',
    ytid: 'T1xzr_iEy_I',
    startTime: 20,
    distractors: ['See Tình', 'Để Mị Nói Cho Mà Nghe', 'Bo Xì Bo'],
    explanation: "'Duyên Âm' là ca khúc dân gian đương đại sôi động trong album Hoàng của Hoàng Thùy Linh."
  }
];

// Chuyển đổi các bài mới sang format Question chuẩn
function convertToQuestion(item) {
  const options = [item.title, ...(item.distractors || ['Nơi Này Có Anh', 'Bùa Yêu', 'Lạc Trôi'])].slice(0, 4);
  // Đảo vị trí đáp án đúng
  const correctTitle = item.title;
  // Fisher yates options
  for (let i = options.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [options[i], options[j]] = [options[j], options[i]];
  }
  const correctIndex = options.indexOf(correctTitle);

  return {
    prompt: "Đây là bài hát nào?",
    options,
    correct_index: correctIndex,
    explanation: item.explanation || `'${correctTitle}' là một ca khúc nổi tiếng của ${item.artist}.`,
    image_url: `https://img.youtube.com/vi/${item.ytid}/hqdefault.jpg`,
    audio_url: null,
    video_url: null,
    youtube_video_id: item.ytid,
    start_time: item.startTime || 20,
    question_type: "AUDIO_GUESS",
    difficulty: "medium",
    points: 1000,
    time_limit: 30,
    source: `${item.artist} - ${correctTitle}`,
    is_double_points: false,
    active: true
  };
}

const convertedNew = [...verifiedNewYouth, ...verifiedAdditionalHits].map(convertToQuestion);

// Ghép lại toàn bộ bài nhạc hiện đại
const allModernPool = [...keptExisting, ...convertedNew];

// Deduplicate theo YouTube ID và Title
const seenYt = new Set();
const seenTitle = new Set();
const uniqueModern = [];

for (const q of allModernPool) {
  const t = q.options[q.correct_index].toLowerCase().trim();
  const y = q.youtube_video_id;
  if (!seenYt.has(y) && !seenTitle.has(t)) {
    seenYt.add(y);
    seenTitle.add(t);
    uniqueModern.push(q);
  }
}

console.log('Total unique modern songs available:', uniqueModern.length);

// Xáo trộn ngẫu nhiên hoàn toàn theo Fisher-Yates
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

const shuffledPool = shuffle(uniqueModern);

// Chọn chính xác 140 bài cho 7 part (mỗi part đúng 20 câu)
const TARGET_PARTS = 7;
const QUESTIONS_PER_PART = 20;
const TOTAL_NEEDED = TARGET_PARTS * QUESTIONS_PER_PART; // 140

if (shuffledPool.length < TOTAL_NEEDED) {
  console.error(`Cần ${TOTAL_NEEDED} bài nhưng chỉ có ${shuffledPool.length}!`);
  process.exit(1);
}

const selected140 = shuffledPool.slice(0, TOTAL_NEEDED);

const finalMusicQuestions = [];

for (let p = 0; p < TARGET_PARTS; p++) {
  const partNum = p + 1;
  const partCategoryName = `Âm nhạc Việt #${partNum}`;
  const partSlice = selected140.slice(p * QUESTIONS_PER_PART, (p + 1) * QUESTIONS_PER_PART);

  partSlice.forEach((q, idx) => {
    const qNum = idx + 1;
    finalMusicQuestions.push({
      ...q,
      id: `q-music-p${partNum}-${qNum}`,
      round_no: partNum,
      question_no: qNum,
      category: partCategoryName
    });
  });
  console.log(`Part #${partNum} (${partCategoryName}): ${partSlice.length} câu`);
}

// Gộp với nonMusic questions
const finalBank = [...finalMusicQuestions, ...nonMusic];

fs.writeFileSync('./data/questionBank.json', JSON.stringify(finalBank, null, 2), 'utf8');
console.log(`✅ ĐÃ CẬP NHẬT THÀNH CÔNG questionBank.json!`);
console.log(`- Nhạc Việt: ${finalMusicQuestions.length} câu (7 part x 20 câu)`);
console.log(`- Chủ đề khác: ${nonMusic.length} câu`);
console.log(`- Tổng cộng: ${finalBank.length} câu`);
