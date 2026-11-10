const fs = require('fs');

const bankPath = 'data/questionBank.json';
const bank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

// Tách các câu hỏi nhạc Việt và câu hỏi chủ đề khác
const musicQuestions = bank.filter(q => q.category === 'Âm nhạc Việt Nam' || q.category.startsWith('Âm nhạc Việt'));
const nonMusicQuestions = bank.filter(q => q.category !== 'Âm nhạc Việt Nam' && !q.category.startsWith('Âm nhạc Việt'));

console.log(`Tìm thấy ${musicQuestions.length} câu hỏi nhạc Việt Nam`);

// Thuật toán xáo trộn Fisher-Yates
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

// Xáo trộn ngẫu nhiên toàn bộ bài hát trước
const shuffledAll = shuffle(musicQuestions);

// Chia đều vào 7 part:
// Part 1 -> 6: 21 câu mỗi part
// Part 7: 20 câu
// Tổng: 6 * 21 + 20 = 146 câu
const NUM_PARTS = 7;
const partBuckets = Array.from({ length: NUM_PARTS }, () => []);

// Phân bổ round-robin các bài hát đã xáo trộn vào 7 part để mỗi part đều cực kỳ đa dạng
shuffledAll.forEach((q, idx) => {
  const partIndex = idx % NUM_PARTS;
  partBuckets[partIndex].push(q);
});

const updatedMusicQuestions = [];

partBuckets.forEach((bucket, pIdx) => {
  const partNum = pIdx + 1;
  const partCategoryName = `Âm nhạc Việt #${partNum}`;

  // Xáo trộn một lần nữa trong từng Part để thứ tự ngẫu nhiên hoàn hảo
  const finalBucket = shuffle(bucket);

  console.log(`Part #${partNum} (${partCategoryName}): ${finalBucket.length} câu`);

  finalBucket.forEach((q, qIdx) => {
    const questionNum = qIdx + 1;
    updatedMusicQuestions.push({
      ...q,
      id: `q-music-p${partNum}-${questionNum}`,
      round_no: partNum,
      question_no: questionNum,
      category: partCategoryName
    });
  });
});

// Kết hợp lại ngân hàng câu hỏi hoàn chỉnh
const finalBank = [...updatedMusicQuestions, ...nonMusicQuestions];

fs.writeFileSync(bankPath, JSON.stringify(finalBank, null, 2), 'utf8');
console.log(`Đã cập nhật thành công ${updatedMusicQuestions.length} câu hỏi nhạc vào 7 part trong questionBank.json!`);
console.log(`Tổng ngân hàng câu hỏi: ${finalBank.length}`);

