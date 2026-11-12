const { STREETVIEW_LOCATIONS } = require('./data_streetview_40.js');
const { createQuestion } = require('./generate_doraemon_100.js');

const STREETVIEW_QUESTIONS = STREETVIEW_LOCATIONS.map((loc, idx) => {
  const streetViewUrl = `https://www.google.com/maps/embed?origin=mfe&pb=!6m6!1m5!2m2!1d${loc.lat}!2d${loc.lng}!4f-0!5f1`;
  const satelliteUrl = `https://www.google.com/maps/embed?origin=mfe&pb=!1m4!2m1!1s${loc.lat},${loc.lng}!5e1!6i17`;

  return createQuestion(
    "Đoán quốc gia qua Google Map 360°",
    "Khu vực 360° này thuộc quốc gia nào trên thế giới?",
    loc.country,
    loc.options.filter(o => o !== loc.country),
    loc.explanation,
    idx % 3 === 0 ? "easy" : idx % 3 === 1 ? "medium" : "hard",
    "STREET_VIEW_GUESS",
    {
      id: `q-streetview-${idx + 1}`,
      street_view_url: streetViewUrl,
      satellite_url: satelliteUrl,
      image_url: streetViewUrl,
      city: loc.city,
      landmark: loc.landmark,
      lat: loc.lat,
      lng: loc.lng
    }
  );
});

console.log(`Đã tạo thành công ${STREETVIEW_QUESTIONS.length} câu hỏi Street View 360°!`);

module.exports = { STREETVIEW_QUESTIONS };

