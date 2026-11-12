const fs = require('fs');
const path = require('path');
const { getQuestionImage, IMAGES } = require('./build_accurate_image_map.js');

const bankPath = path.join(__dirname, '../data/questionBank.json');
const bank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

console.log(`Đang xử lý ${bank.length} câu hỏi trong ngân hàng...`);

let musicCount = 0;
let streetViewCount = 0;
let updatedNonMusicCount = 0;

const updatedBank = bank.map(q => {
  // 1. Nhạc Việt
  if (q.category && q.category.startsWith('Âm nhạc')) {
    musicCount++;
    const ytid = q.youtube_video_id;
    return {
      ...q,
      image_url: ytid ? `https://img.youtube.com/vi/${ytid}/hqdefault.jpg` : q.image_url
    };
  }

  // 2. Google Map 360°
  if (q.category === 'Đoán quốc gia qua Google Map 360°' || q.question_type === 'STREET_VIEW_GUESS') {
    streetViewCount++;
    return q;
  }

  // 3. Toàn bộ các chủ đề còn lại (Doraemon, Conan, Địa lý, Hoạt hình, Phim ảnh, Ca sĩ, K-Pop, US-UK)
  const bestImg = getQuestionImage(q);
  if (bestImg) {
    updatedNonMusicCount++;
    return {
      ...q,
      image_url: bestImg
    };
  }

  return q;
});

console.log(`- Nhạc Việt: ${musicCount} câu`);
console.log(`- Google Map 360°: ${streetViewCount} câu`);
console.log(`- Đã cập nhật ảnh chuẩn xác cho: ${updatedNonMusicCount} câu`);

// Ghi đè vào data/questionBank.json
fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');
console.log('✅ Đã cập nhật xong toàn bộ data/questionBank.json!');

