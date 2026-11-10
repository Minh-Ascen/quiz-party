const fs = require('fs');

const file = 'data/questionBank.json';
const bank = JSON.parse(fs.readFileSync(file, 'utf8'));

// Cập nhật startTime cho các bài Sơn Tùng và Pop ballads để vào ngay giai điệu, không phải chờ intro logo
const startTimeMap = {
  "q-music-1": 24, // Em Của Ngày Hôm Qua
  "q-music-2": 20, // Cơn Mưa Ngang Qua
  "q-music-3": 20, // Nắng Ấm Xa Dần
  "q-music-4": 28, // Lạc Trôi
  "q-music-5": 24, // Nơi Này Có Anh
  "q-music-6": 25, // Chúng Ta Không Thuộc Về Nhau
  "q-music-7": 22, // Buông Đôi Tay Nhau Ra
  "q-music-8": 28, // Âm Thầm Bên Em
  "q-music-9": 22, // Chắc Ai Đó Sẽ Về
  "q-music-10": 26, // Hãy Trao Cho Anh
  "q-music-11": 30, // Chạy Ngay Đi
  "q-music-12": 24, // Có Chắc Yêu Là Đây
  "q-music-13": 35, // Chúng Ta Của Hiện Tại
  "q-music-14": 25, // Muộn Rồi Mà Sao Còn
  "q-music-15": 28, // Đừng Làm Trái Tim Anh Đau
  "q-music-16": 22, // Thái Bình Mồ Hôi Rơi
  "q-music-17": 20, // Như Ngày Hôm Qua
  "q-music-22": 22, // Em Gì Ơi
  "q-music-63": 22, // Dấu Mưa
  "q-music-65": 22  // Chưa Bao Giờ
};

let updated = 0;
for (const q of bank) {
  if (startTimeMap[q.id]) {
    q.start_time = startTimeMap[q.id];
    updated++;
  }
}

fs.writeFileSync(file, JSON.stringify(bank, null, 2), 'utf8');
console.log(`Đã cập nhật startTime vào ngay giai điệu cho ${updated} bài hát!`);

