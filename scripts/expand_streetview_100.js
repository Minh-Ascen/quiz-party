const fs = require('fs');
const path = require('path');

const { STREETVIEW_100_NEW } = require('./data_streetview_100_new.js');
const { createQuestion } = require('./generate_doraemon_100.js');

const bankPath = path.join(__dirname, '../data/questionBank.json');
const currentBank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

// Lọc các câu hỏi Streetview hiện có
const existingStreetView = currentBank.filter(q => q.category === 'Đoán quốc gia qua Google Map 360°');
console.log(`Số câu hỏi Street View hiện tại: ${existingStreetView.length}`);

// Lấy đúng 100 địa điểm mới đa dạng từ 6 châu lục
const selected100Locations = STREETVIEW_100_NEW.slice(0, 100);

const newStreetViewQuestions = selected100Locations.map((loc, idx) => {
  const qNum = existingStreetView.length + idx + 1;
  const streetViewUrl = `https://www.google.com/maps/embed?origin=mfe&pb=!6m6!1m5!2m2!1d${loc.lat}!2d${loc.lng}!4f-0!5f1`;
  const satelliteUrl = `https://www.google.com/maps/embed?origin=mfe&pb=!1m4!2m1!1s${loc.lat},${loc.lng}!5e1!6i17`;

  const question = createQuestion(
    "Đoán quốc gia qua Google Map 360°",
    "Khu vực 360° này thuộc quốc gia nào trên thế giới?",
    loc.country,
    loc.options.filter(o => o !== loc.country),
    loc.explanation,
    idx % 3 === 0 ? "easy" : idx % 3 === 1 ? "medium" : "hard",
    "STREET_VIEW_GUESS",
    {
      id: `q-streetview-${qNum}`,
      street_view_url: streetViewUrl,
      satellite_url: satelliteUrl,
      image_url: streetViewUrl,
      city: loc.city,
      landmark: loc.landmark,
      lat: loc.lat,
      lng: loc.lng
    }
  );

  return {
    ...question,
    id: `q-streetview-${qNum}`,
    question_no: qNum,
    time_limit: 30,
    points: 1000
  };
});

console.log(`Đã tạo thành công ${newStreetViewQuestions.length} câu hỏi mới!`);

const updatedBank = [...currentBank, ...newStreetViewQuestions];

fs.writeFileSync(bankPath, JSON.stringify(updatedBank, null, 2), 'utf8');

console.log(`\n🎉 Đã cập nhật thành công ngân hàng câu hỏi!`);
console.log(`- Tổng số câu hỏi hiện tại: ${updatedBank.length} câu (trước đó: ${currentBank.length})`);

const svCount = updatedBank.filter(q => q.category === 'Đoán quốc gia qua Google Map 360°').length;
console.log(`- Tổng số câu 'Đoán quốc gia qua Google Map 360°': ${svCount} câu (tăng thêm +100 câu)`);
