const fs = require('fs');
const path = require('path');

const { DORAEMON_ALL_100 } = require('./generate_doraemon_100.js');
const { CONAN_ALL_100 } = require('./generate_conan_100.js');
const { GEO_ALL_100 } = require('./generate_geo_100.js');
const { STREETVIEW_QUESTIONS } = require('./generate_streetview_questions.js');

const qbPath = path.join(__dirname, '../data/questionBank.json');
const currentBank = JSON.parse(fs.readFileSync(qbPath, 'utf8'));

console.log(`Số câu hỏi hiện tại: ${currentBank.length}`);

// Xác định index cao nhất cho các category để đánh số ID nối tiếp mượt mà
const existingDoraemon = currentBank.filter(q => q.category === 'Doraemon');
const existingConan = currentBank.filter(q => q.category === 'Conan – Thám tử lừng danh');
const existingGeo = currentBank.filter(q => q.category === 'Địa lý cơ bản');

console.log(`- Doraemon hiện có: ${existingDoraemon.length}`);
console.log(`- Conan hiện có: ${existingConan.length}`);
console.log(`- Địa lý cơ bản hiện có: ${existingGeo.length}`);

// Chuẩn hóa ID cho 100 câu Doraemon mới
const newDoraemon = DORAEMON_ALL_100.map((q, idx) => ({
  ...q,
  id: `q-doraemon-exp-${existingDoraemon.length + idx + 1}`,
  question_no: existingDoraemon.length + idx + 1
}));

// Chuẩn hóa ID cho 100 câu Conan mới
const newConan = CONAN_ALL_100.map((q, idx) => ({
  ...q,
  id: `q-conan-exp-${existingConan.length + idx + 1}`,
  question_no: existingConan.length + idx + 1
}));

// Chuẩn hóa ID cho 100 câu Địa lý mới
const newGeo = GEO_ALL_100.map((q, idx) => ({
  ...q,
  id: `q-geo-exp-${existingGeo.length + idx + 1}`,
  question_no: existingGeo.length + idx + 1
}));

// Chuẩn hóa ID cho 40 câu Street View 360°
const newStreetView = STREETVIEW_QUESTIONS.map((q, idx) => ({
  ...q,
  id: `q-streetview-${idx + 1}`,
  question_no: idx + 1
}));

console.log(`Chuẩn bị gộp:`);
console.log(`+ ${newDoraemon.length} câu Doraemon (tổng sẽ là ${existingDoraemon.length + newDoraemon.length})`);
console.log(`+ ${newConan.length} câu Conan (tổng sẽ là ${existingConan.length + newConan.length})`);
console.log(`+ ${newGeo.length} câu Địa lý (tổng sẽ là ${existingGeo.length + newGeo.length})`);
console.log(`+ ${newStreetView.length} câu Đoán quốc gia qua Google Map 360°`);

const updatedBank = [
  ...currentBank,
  ...newDoraemon,
  ...newConan,
  ...newGeo,
  ...newStreetView
];

// Lưu file questionBank.json
fs.writeFileSync(qbPath, JSON.stringify(updatedBank, null, 2), 'utf8');

console.log(`\n🎉 Đã gộp thành công! Tổng số câu hỏi hiện tại: ${updatedBank.length}`);

// Kiểm tra thống kê
const stats = {};
updatedBank.forEach(q => {
  stats[q.category] = (stats[q.category] || 0) + 1;
});
console.log('\nThống kê theo chủ đề:');
console.table(stats);
