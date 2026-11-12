function normalizeVietnamese(str) {
  if (!str) return "";
  return str
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[đĐ]/g, "d")
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function cleanMusicTitle(str) {
  if (!str) return "";
  return normalizeVietnamese(str)
    .replace(/\s*\([^)]*\)/g, "")
    .replace(/^(bai hat|bai)\s+/, "")
    .trim();
}

// Bảng chuyển đổi số sang chữ và ngược lại
const DIGIT_TO_WORDS = {
  "0": "khong",
  "1": "mot",
  "2": "hai",
  "3": "ba",
  "4": "bon",
  "5": "nam",
  "6": "sau",
  "7": "bay",
  "8": "tam",
  "9": "chin",
  "10": "muoi",
  "20": "hai muoi",
  "24": "hai muoi bon",
  "60": "sau muoi",
  "100": "mot tram"
};

const WORD_TO_DIGITS = {
  "khong": "0",
  "mot": "1",
  "hai": "2",
  "ba": "3",
  "bon": "4",
  "tu": "4",
  "nam": "5",
  "sau": "6",
  "bay": "7",
  "tam": "8",
  "chin": "9",
  "muoi": "10",
  "hai muoi bon": "24",
  "hai tu": "24",
  "hai muoi": "20",
  "sau muoi": "60",
  "mot tram": "100"
};

function getTitleVariants(cleanStr) {
  const variants = new Set();
  variants.add(cleanStr);
  variants.add(cleanStr.replace(/\s+/g, ""));

  // 1. Chuyển chữ số thành chữ (ví dụ: '2 phut hon' -> 'hai phut hon')
  let wordVer = cleanStr;
  for (const [digit, word] of Object.entries(DIGIT_TO_WORDS)) {
    const regex = new RegExp(`\\b${digit}\\b`, "g");
    wordVer = wordVer.replace(regex, word);
  }
  variants.add(wordVer);
  variants.add(wordVer.replace(/\s+/g, ""));

  // Biến thể 'bon' <-> 'tu' (ví dụ: 'hai muoi bon' <-> 'hai muoi tu')
  if (wordVer.includes("bon")) {
    const tuVer = wordVer.replace(/\bbon\b/g, "tu");
    variants.add(tuVer);
    variants.add(tuVer.replace(/\s+/g, ""));
  }
  if (wordVer.includes("tu")) {
    const bonVer = wordVer.replace(/\btu\b/g, "bon");
    variants.add(bonVer);
    variants.add(bonVer.replace(/\s+/g, ""));
  }

  // 2. Chuyển chữ thành số (ví dụ: 'hai phut hon' -> '2 phut hon', 'sau muoi nam' -> '60 nam')
  let digitVer = cleanStr;
  for (const [word, digit] of Object.entries(WORD_TO_DIGITS)) {
    const regex = new RegExp(`\\b${word}\\b`, "g");
    digitVer = digitVer.replace(regex, digit);
  }
  variants.add(digitVer);
  variants.add(digitVer.replace(/\s+/g, ""));

  return Array.from(variants).filter(Boolean);
}

function levenshteinDistance(a, b) {
  if (a === b) return 0;
  if (!a.length) return b.length;
  if (!b.length) return a.length;
  const row = Array.from({ length: b.length + 1 }, (_, i) => i);
  for (let i = 1; i <= a.length; i++) {
    let prev = i;
    for (let j = 1; j <= b.length; j++) {
      const val = a[i - 1] === b[j - 1] ? row[j - 1] : Math.min(row[j - 1], prev, row[j]) + 1;
      row[j - 1] = prev;
      prev = val;
    }
    row[b.length] = prev;
  }
  return row[b.length];
}

function isMusicAnswerCorrect(userInput, correctTitle) {
  const u = cleanMusicTitle(userInput);
  const t = cleanMusicTitle(correctTitle);
  if (!u || !t) return false;

  const uVariants = getTitleVariants(u);
  const tVariants = getTitleVariants(t);

  // So khớp chéo giữa các biến thể của User và Target
  for (const uv of uVariants) {
    for (const tv of tVariants) {
      if (uv === tv) return true;
      if (uv.replace(/\s+/g, "") === tv.replace(/\s+/g, "")) return true;

      // Sai số 1 ký tự đối với bài hát dài
      if (tv.length >= 12 && Math.abs(uv.length - tv.length) <= 1) {
        if (levenshteinDistance(uv, tv) <= 1) return true;
      }
    }
  }

  return false;
}

// TEST CASES
console.log("--- TEST CHỮ VÀ SỐ ---");
console.log("'2 phut hon' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("2 phut hon", "Hai Phút Hơn")); // TRUE
console.log("'hai phut hon' vs '2 Phút Hơn':", isMusicAnswerCorrect("hai phut hon", "2 Phút Hơn")); // TRUE
console.log("'2 phút hơn' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("2 phút hơn", "Hai Phút Hơn")); // TRUE
console.log("'60 nam cuoc doi' vs 'Sáu Mươi Năm Cuộc Đời':", isMusicAnswerCorrect("60 nam cuoc doi", "Sáu Mươi Năm Cuộc Đời")); // TRUE
console.log("'sau muoi nam cuoc doi' vs '60 Năm Cuộc Đời':", isMusicAnswerCorrect("sau muoi nam cuoc doi", "60 Năm Cuộc Đời")); // TRUE
console.log("'chuyen ba nguoi' vs 'Chuyện 3 Người':", isMusicAnswerCorrect("chuyen ba nguoi", "Chuyện 3 Người")); // TRUE
console.log("'chuyen 3 nguoi' vs 'Chuyện Ba Người':", isMusicAnswerCorrect("chuyen 3 nguoi", "Chuyện Ba Người")); // TRUE
console.log("'1 phut' vs 'Một Phút':", isMusicAnswerCorrect("1 phut", "Một Phút")); // TRUE
console.log("'mot phut' vs '1 Phút':", isMusicAnswerCorrect("mot phut", "1 Phút")); // TRUE
console.log("'nam anh em tren mot chiec xe tang' vs '5 Anh Em Trên Một Chiếc Xe Tăng':", isMusicAnswerCorrect("nam anh em tren mot chiec xe tang", "5 Anh Em Trên Một Chiếc Xe Tăng")); // TRUE

console.log("\n--- TEST CHẶN GÕ SAI / KÝ TỰ ĐƠN / TÊN CA SĨ ---");
console.log("'a' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("a", "Hai Phút Hơn")); // FALSE
console.log("'Phao' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("Phao", "Hai Phút Hơn")); // FALSE
console.log("'phut hon' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("phut hon", "Hai Phút Hơn")); // FALSE
console.log("'hai' vs 'Hai Phút Hơn':", isMusicAnswerCorrect("hai", "Hai Phút Hơn")); // FALSE

