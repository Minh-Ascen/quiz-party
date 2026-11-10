import { Question, QuestionDifficulty } from "./types";
import defaultQuestions from "../data/questionBank.json";
import { resolveQuestionImage } from "./questionImages";

export const LOCAL_QUESTION_BANK: Question[] = defaultQuestions as unknown as Question[];

/**
 * Xáo trộn mảng ngẫu nhiên thực sự theo thuật toán Fisher-Yates
 */
export function shuffleArray<T>(array: T[]): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const rand =
      typeof crypto !== "undefined" && "getRandomValues" in crypto
        ? crypto.getRandomValues(new Uint32Array(1))[0] / (0xffffffff + 1)
        : Math.random();
    const j = Math.floor(rand * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

/**
 * Xáo trộn ngẫu nhiên vị trí 4 đáp án A, B, C, D của một câu hỏi
 * và cập nhật lại correct_index chính xác.
 */
export function shuffleQuestionOptions(q: Question): Question {
  const indexedOptions = (q.options || []).map((opt, idx) => ({
    text: opt,
    isCorrect: idx === (q.correct_index ?? 0)
  }));
  const shuffled = shuffleArray(indexedOptions);
  const newCorrectIndex = Math.max(
    0,
    shuffled.findIndex((item) => item.isCorrect)
  );
  return {
    ...q,
    options: shuffled.map((item) => item.text),
    correct_index: newCorrectIndex
  };
}

/**
 * Lấy danh sách N câu hỏi ngẫu nhiên TUÂN THỦ TUYỆT ĐỐI:
 * 1. Chủ đề đã chọn (categories) - Chỉ ra câu hỏi thuộc đúng chủ đề đã chọn.
 * 2. Mức độ khó đã chọn (difficulty: all | easy | medium | hard) - Đúng 100% mức độ.
 * 3. Số lượng câu hỏi đã chọn (count: 10 | 20 | 30 | 50).
 * 4. Thời gian trả lời mỗi câu (timeLimit: 15 | 20 | 30 giây).
 * 5. Random hoàn toàn thứ tự câu hỏi và thứ tự đáp án mỗi khi tạo phòng mới.
 */
export function selectQuestionsForRoom(
  categories: string[] = [],
  difficulty: "all" | QuestionDifficulty = "all",
  count: number = 20,
  timeLimit: number = 20,
  pool: Question[] = LOCAL_QUESTION_BANK
): Question[] {
  const normalizedCategories = categories
    .map((c) => c.trim())
    .filter(Boolean);

  // 1. Lọc NGHIÊM NGẶT theo đúng chủ đề mà Host đã chọn
  const categoryMatched =
    normalizedCategories.length > 0
      ? pool.filter((q) => {
          const cat = q.category.trim();
          if (normalizedCategories.includes(cat)) return true;
          if (
            normalizedCategories.includes("Âm nhạc Việt Nam") &&
            cat.startsWith("Âm nhạc Việt")
          ) {
            return true;
          }
          return false;
        })
      : pool;

  const activeCategoryPool =
    categoryMatched.length > 0 ? categoryMatched : pool;

  // 2. Lọc NGHIÊM NGẶT theo đúng mức độ khó (Dễ / Vừa / Khó / Tất cả)
  let strictMatched = activeCategoryPool.filter((q) => {
    if (difficulty === "all") return true;
    return q.difficulty === difficulty;
  });

  if (strictMatched.length === 0) {
    strictMatched = activeCategoryPool;
  }

  // 3. Xáo trộn ngẫu nhiên hoàn toàn tập câu hỏi khớp bộ lọc
  const selected: Question[] = [];
  const firstPass = shuffleArray(strictMatched);
  selected.push(...firstPass.slice(0, count));

  // 4. Nếu số lượng câu hỏi khớp nghiêm ngặt (VD: chỉ chọn 1 chủ đề + 1 mức độ Khó = 16 câu)
  // ít hơn gói 30 hoặc 50 câu mà người chơi chọn:
  // Vẫn giữ nguyên 100% trong CÙNG CHỦ ĐỀ và CÙNG ĐỘ KHÓ đó (xáo trộn lại cho đủ số câu yêu cầu),
  // TUYỆT ĐỐI KHÔNG lấy câu hỏi từ chủ đề khác!
  while (selected.length < count && strictMatched.length > 0) {
    const extraPass = shuffleArray(strictMatched);
    for (const q of extraPass) {
      if (selected.length >= count) break;
      selected.push({
        ...q,
        id: `${q.id}-r${selected.length + 1}`
      });
    }
  }

  // 5. Chuẩn hóa từng câu hỏi: xáo trộn vị trí 4 đáp án A/B/C/D, gán đúng timeLimit và hình ảnh
  return selected.slice(0, count).map((q, idx) => {
    const withShuffledOpts = shuffleQuestionOptions(q);
    return {
      ...withShuffledOpts,
      id: `${q.id}-${idx + 1}`,
      round_no: Math.floor(idx / 10) + 1,
      question_no: idx + 1,
      difficulty: difficulty === "all" ? q.difficulty || "medium" : difficulty,
      time_limit:
        q.question_type === "AUDIO_GUESS" || q.category === "Âm nhạc Việt Nam"
          ? Math.max(30, timeLimit)
          : timeLimit,
      image_url: resolveQuestionImage(withShuffledOpts)
    };
  });
}

/**
 * Đếm số lượng câu hỏi hiện có theo bộ lọc Chủ đề và Độ khó
 */
export function countMatchingQuestions(
  categories: string[] = [],
  difficulty: "all" | QuestionDifficulty = "all",
  pool: Question[] = LOCAL_QUESTION_BANK
): number {
  const normalizedCategories = categories.map((c) => c.trim()).filter(Boolean);
  return pool.filter((q) => {
    const cat = q.category.trim();
    const matchCat =
      normalizedCategories.length === 0 ||
      normalizedCategories.includes(cat) ||
      (normalizedCategories.includes("Âm nhạc Việt Nam") && cat.startsWith("Âm nhạc Việt"));
    const matchDiff = difficulty === "all" || q.difficulty === difficulty;
    return matchCat && matchDiff;
  }).length;
}

/**
 * Thống kê tổng quan ngân hàng câu hỏi
 */
export function getQuestionBankSummary(questions: Question[] = LOCAL_QUESTION_BANK) {
  const total = questions.length;
  const categoryCounts: Record<string, number> = {};
  const difficultyCounts: Record<string, number> = { easy: 0, medium: 0, hard: 0 };
  const typeCounts: Record<string, number> = {
    MULTIPLE_CHOICE: 0,
    IMAGE_GUESS: 0,
    AUDIO_GUESS: 0,
    VIDEO_GUESS: 0,
    TRUE_FALSE: 0
  };

  questions.forEach((q) => {
    categoryCounts[q.category] = (categoryCounts[q.category] || 0) + 1;
    const diff = q.difficulty || "medium";
    difficultyCounts[diff] = (difficultyCounts[diff] || 0) + 1;
    const qType = q.question_type || "MULTIPLE_CHOICE";
    typeCounts[qType] = (typeCounts[qType] || 0) + 1;
  });

  return {
    total,
    categoryCounts,
    difficultyCounts,
    typeCounts
  };
}

/**
 * Kiểm tra các câu hỏi trùng lặp hoặc thiếu dữ liệu
 */
export function auditQuestionBank(questions: Question[]) {
  const duplicates: { prompt: string; count: number }[] = [];
  const missingFields: { prompt: string; issues: string[] }[] = [];
  const promptMap = new Map<string, number>();

  questions.forEach((q, idx) => {
    const p = (q.prompt || "").trim().toLowerCase();
    promptMap.set(p, (promptMap.get(p) || 0) + 1);

    const issues: string[] = [];
    if (!q.prompt || q.prompt.trim().length === 0) issues.push("Thiếu câu hỏi (prompt)");
    if (!q.options || q.options.length < 2) issues.push("Thiếu danh sách đáp án (options < 2)");
    if (q.correct_index === undefined || q.correct_index < 0 || q.correct_index >= (q.options?.length || 0)) {
      issues.push("Đáp án đúng không hợp lệ");
    }
    if ((q.question_type === "IMAGE_GUESS" || q.question_type === "MULTIPLE_CHOICE") && q.image_url && !q.image_url.startsWith("http")) {
      issues.push("URL hình ảnh không đúng định dạng HTTP/HTTPS");
    }

    if (issues.length > 0) {
      missingFields.push({
        prompt: q.prompt || `Câu hỏi số #${idx + 1}`,
        issues
      });
    }
  });

  promptMap.forEach((count, prompt) => {
    if (count > 1) {
      duplicates.push({ prompt, count });
    }
  });

  return {
    totalChecked: questions.length,
    duplicates,
    missingFields
  };
}

/**
 * Chuyển danh sách câu hỏi thành chuỗi CSV (hỗ trợ tiếng Việt UTF-8 BOM)
 */
export function exportToCSV(questions: Question[]): string {
  const headers = [
    "category",
    "prompt",
    "option_a",
    "option_b",
    "option_c",
    "option_d",
    "correct_index",
    "explanation",
    "difficulty",
    "question_type",
    "image_url",
    "youtube_video_id"
  ];

  const escapeCSV = (value: string | number | undefined | null) => {
    if (value === undefined || value === null) return '""';
    const str = String(value).replace(/"/g, '""');
    return `"${str}"`;
  };

  const rows = questions.map((q) => [
    escapeCSV(q.category),
    escapeCSV(q.prompt),
    escapeCSV(q.options[0] || ""),
    escapeCSV(q.options[1] || ""),
    escapeCSV(q.options[2] || ""),
    escapeCSV(q.options[3] || ""),
    escapeCSV(q.correct_index ?? 0),
    escapeCSV(q.explanation || ""),
    escapeCSV(q.difficulty || "medium"),
    escapeCSV(q.question_type || "MULTIPLE_CHOICE"),
    escapeCSV(q.image_url || ""),
    escapeCSV(q.youtube_video_id || "")
  ]);

  const csvContent = "\uFEFF" + [headers.join(","), ...rows.map((r) => r.join(","))].join("\r\n");
  return csvContent;
}

/**
 * Đọc câu hỏi từ chuỗi CSV
 */
export function parseCSV(csvText: string): Question[] {
  const lines = csvText.split(/\r?\n/).filter((l) => l.trim().length > 0);
  if (lines.length <= 1) return [];

  const parseRow = (line: string): string[] => {
    const entries: string[] = [];
    let insideQuotes = false;
    let entry = "";
    for (let i = 0; i < line.length; i++) {
      const char = line[i];
      if (char === '"') {
        if (insideQuotes && line[i + 1] === '"') {
          entry += '"';
          i++;
        } else {
          insideQuotes = !insideQuotes;
        }
      } else if (char === "," && !insideQuotes) {
        entries.push(entry.trim());
        entry = "";
      } else {
        entry += char;
      }
    }
    entries.push(entry.trim());
    return entries;
  };

  const results: Question[] = [];
  for (let i = 1; i < lines.length; i++) {
    const cols = parseRow(lines[i]);
    if (cols.length < 7) continue;

    const category = cols[0] || "Kiến thức tổng hợp";
    const prompt = cols[1];
    const options = [cols[2] || "", cols[3] || "", cols[4] || "", cols[5] || ""].filter(Boolean);
    const correct_index = parseInt(cols[6] || "0", 10);
    const explanation = cols[7] || "";
    const difficulty = (cols[8] as QuestionDifficulty) || "medium";
    const question_type = (cols[9] as any) || "MULTIPLE_CHOICE";
    const image_url = cols[10] || null;
    const youtube_video_id = cols[11] || null;

    if (!prompt || options.length < 2) continue;

    results.push({
      id: `imported-${Date.now()}-${i}`,
      round_no: 1,
      question_no: i,
      category,
      prompt,
      options,
      correct_index: isNaN(correct_index) ? 0 : Math.min(Math.max(0, correct_index), options.length - 1),
      explanation,
      difficulty,
      question_type,
      image_url,
      youtube_video_id,
      points: 1000,
      time_limit: 20
    });
  }

  return results;
}
