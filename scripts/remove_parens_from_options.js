const fs = require('fs');
const path = require('path');

const bankPath = path.join(__dirname, '../data/questionBank.json');
const questionBank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

let updatedCount = 0;
let optionsCleaned = 0;

const updatedBank = questionBank.map((q) => {
  let hasChange = false;
  const newOptions = (q.options || []).map((opt) => {
    if (/\([^)]*\)/.test(opt)) {
      const cleaned = opt.replace(/\s*\([^)]*\)/g, '').replace(/\s+/g, ' ').trim();
      if (cleaned.length > 0) {
        optionsCleaned++;
        hasChange = true;
        return cleaned;
      }
    }
    return opt;
  });

  if (hasChange) {
    updatedCount++;
    return {
      ...q,
      options: newOptions
    };
  }
  return q;
});

// Kiểm tra xem có trùng lặp đáp án trong câu nào không
let duplicates = 0;
updatedBank.forEach((q) => {
  const seen = new Set();
  q.options.forEach((opt) => {
    if (seen.has(opt.toLowerCase())) {
      duplicates++;
      console.warn(`[CẢNH BÁO TRÙNG] Câu ${q.id}: "${opt}"`);
    }
    seen.add(opt.toLowerCase());
  });
});

console.log(`Đã xử lý xong:`);
console.log(`- Tổng số câu hỏi trong ngân hàng: ${updatedBank.length}`);
console.log(`- Số câu hỏi có đáp án được làm sạch dấu chú thích (): ${updatedCount}`);
console.log(`- Tổng số lượt đáp án loại bỏ (): ${optionsCleaned}`);
console.log(`- Số trùng lặp đáp án phát hiện: ${duplicates}`);

fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');
console.log(`✅ Đã lưu thành công vào ${bankPath}!`);

