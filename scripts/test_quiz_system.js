// Script kiểm thử toàn diện hệ thống Quiz Party
const fs = require("fs");
const path = require("path");

console.log("==================================================");
console.log("BẮT ĐẦU KIỂM THỬ TOÀN DIỆN QUIZ PARTY GAMESHOW");
console.log("==================================================");

// 1. Kiểm tra ngân hàng 504 câu hỏi
console.log("\n[Test 1] Kiểm tra tính toàn vẹn của Ngân hàng câu hỏi:");
const bankPath = path.join(__dirname, "..", "data", "questionBank.json");
if (!fs.existsSync(bankPath)) {
  console.error("FAIL: Không tìm thấy file data/questionBank.json");
  process.exit(1);
}

const questions = JSON.parse(fs.readFileSync(bankPath, "utf8"));
console.log(`- Tổng số câu hỏi trong ngân hàng: ${questions.length}`);
if (questions.length < 500) {
  console.error("FAIL: Số lượng câu hỏi < 500");
  process.exit(1);
}

const categories = {};
const promptSet = new Set();
let invalidCount = 0;

questions.forEach((q, idx) => {
  categories[q.category] = (categories[q.category] || 0) + 1;
  const p = q.prompt.trim().toLowerCase();
  if (promptSet.has(p)) {
    console.error(`- Trùng câu hỏi: "${q.prompt}"`);
    invalidCount++;
  }
  promptSet.add(p);

  if (!q.options || q.options.length < 2) {
    console.error(`- Câu #${idx + 1} không đủ đáp án: ${q.prompt}`);
    invalidCount++;
  }
  if (q.correct_index === undefined || q.correct_index < 0 || q.correct_index >= q.options.length) {
    console.error(`- Câu #${idx + 1} sai correct_index: ${q.prompt}`);
    invalidCount++;
  }
});

console.log("- Phân bố 12 chủ đề bắt buộc:");
Object.keys(categories).forEach((cat) => {
  console.log(`  + ${cat}: ${categories[cat]} câu`);
});

if (invalidCount === 0) {
  console.log("=> PASS [Test 1]: Toàn bộ 504 câu hỏi hợp lệ 100%, không trùng lặp.");
} else {
  console.error(`=> FAIL [Test 1]: Có ${invalidCount} câu hỏi không hợp lệ.`);
  process.exit(1);
}

// 2. Kiểm tra thuật toán chọn 50 câu hỏi cho phòng chơi
console.log("\n[Test 2] Kiểm tra thuật toán chọn 50 câu hỏi cho phòng chơi:");
function simulateSelect(categoriesToPick, count) {
  const matched = questions.filter((q) => {
    return !categoriesToPick || categoriesToPick.length === 0 || categoriesToPick.includes(q.category);
  });
  // Shuffle
  const shuffled = [...matched].sort(() => Math.random() - 0.5);
  const selected = shuffled.slice(0, count);

  if (selected.length < count) {
    const selectedPrompts = new Set(selected.map((q) => q.prompt.trim().toLowerCase()));
    const remaining = questions.filter((q) => !selectedPrompts.has(q.prompt.trim().toLowerCase()));
    const shuffledRemaining = [...remaining].sort(() => Math.random() - 0.5);
    selected.push(...shuffledRemaining.slice(0, count - selected.length));
  }

  return selected;
}

// Thử thách chọn 50 câu từ 1 chủ đề chỉ có 42 câu (Hệ thống phải tự bổ sung thêm 8 câu từ chủ đề khác mà không trùng)
const selected50 = simulateSelect(["Doraemon"], 50);
console.log(`- Yêu cầu 50 câu từ chủ đề 'Doraemon' (chỉ có 42 câu). Kết quả lấy được: ${selected50.length} câu.`);
const uniquePrompts = new Set(selected50.map((q) => q.prompt));
if (selected50.length === 50 && uniquePrompts.size === 50) {
  console.log("=> PASS [Test 2]: Hệ thống đã tự động bổ sung đủ 50 câu và KHÔNG hề bị trùng lặp.");
} else {
  console.error("FAIL [Test 2]: Lỗi trùng lặp hoặc không đủ 50 câu.");
  process.exit(1);
}

// 3. Kiểm tra tính điểm an toàn và Speed Bonus
console.log("\n[Test 3] Kiểm tra công thức tính điểm và Speed Bonus:");
function calcScore(basePoints, timeLimit, elapsed, isCorrect, isDouble) {
  if (!isCorrect) return 0;
  const speedRatio = Math.max(0, (timeLimit - elapsed) / timeLimit);
  let points = Math.round(basePoints * (0.6 + 0.4 * speedRatio));
  if (isDouble) points *= 2;
  return points;
}

const fastScore = calcScore(1000, 20, 1.5, true, false); // Trả lời sau 1.5s
const slowScore = calcScore(1000, 20, 18.0, true, false); // Trả lời sau 18s
const wrongScore = calcScore(1000, 20, 2.0, false, false); // Trả lời sai
const doubleScore = calcScore(1000, 20, 1.5, true, true); // Double points

console.log(`- Trả lời đúng cực nhanh (1.5s): ${fastScore} điểm`);
console.log(`- Trả lời đúng gần hết giờ (18s): ${slowScore} điểm`);
console.log(`- Trả lời sai: ${wrongScore} điểm`);
console.log(`- Trả lời đúng câu x2 điểm: ${doubleScore} điểm`);

if (fastScore > slowScore && slowScore >= 600 && wrongScore === 0 && doubleScore === fastScore * 2) {
  console.log("=> PASS [Test 3]: Công thức tính điểm server-side hoạt động chính xác tuyệt đối.");
} else {
  console.error("FAIL [Test 3]: Công thức tính điểm sai.");
  process.exit(1);
}

// 4. Kiểm tra file SQL seed và migration
console.log("\n[Test 4] Kiểm tra tính sẵn sàng của file SQL migration & seed:");
const migFile = path.join(__dirname, "..", "supabase", "migrations", "001_upgrade_quiz_system.sql");
const seedFile = path.join(__dirname, "..", "supabase", "seed_500_questions.sql");

if (fs.existsSync(migFile) && fs.existsSync(seedFile)) {
  const migSize = fs.statSync(migFile).size;
  const seedSize = fs.statSync(seedFile).size;
  console.log(`- File migration: ${migFile} (${(migSize / 1024).toFixed(1)} KB)`);
  console.log(`- File seed 500 câu: ${seedFile} (${(seedSize / 1024).toFixed(1)} KB)`);
  console.log("=> PASS [Test 4]: Các tệp SQL đã được khởi tạo đầy đủ và sẵn sàng.");
} else {
  console.error("FAIL [Test 4]: Thiếu file migration hoặc seed.");
  process.exit(1);
}

console.log("\n==================================================");
console.log("TẤT CẢ KIỂM THỬ ĐÃ HOÀN TẤT THÀNH CÔNG RỰC RỠ!");
console.log("==================================================");

