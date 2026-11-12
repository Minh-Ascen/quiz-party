const fs = require('fs');
const path = require('path');
const { BOLERO_VANG_65, TRU_TINH_DO_65, NHAC_TRE_130 } = require('./data_music_260.js');

const bankPath = path.join(__dirname, '..', 'data', 'questionBank.json');
const currentBank = JSON.parse(fs.readFileSync(bankPath, 'utf8'));

console.log('Current bank count:', currentBank.length);

// Verify we don't already have parts 8 to 20
const existingNewParts = currentBank.filter(q => {
  if (!q.category) return false;
  const match = q.category.match(/^Âm nhạc Việt #(\d+)$/);
  if (match) {
    const num = parseInt(match[1], 10);
    return num >= 8 && num <= 20;
  }
  return false;
});

if (existingNewParts.length > 0) {
  console.log(`Warning: Found ${existingNewParts.length} existing questions for parts #8-#20. Removing them before re-adding.`);
}

const cleanedBank = currentBank.filter(q => {
  if (!q.category) return true;
  const match = q.category.match(/^Âm nhạc Việt #(\d+)$/);
  if (match) {
    const num = parseInt(match[1], 10);
    return num < 8 || num > 20;
  }
  return true;
});

const newQuestions = [];

// Seeded pseudorandom shuffle helper for deterministic order
function seededShuffle(arr, seed) {
  const result = [...arr];
  let s = seed;
  for (let i = result.length - 1; i > 0; i--) {
    s = (s * 9301 + 49297) % 233280;
    const j = Math.floor((s / 233280) * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

// 13 parts: Part 8 to Part 20
for (let p = 8; p <= 20; p++) {
  const idx = p - 8;
  const catName = `Âm nhạc Việt #${p}`;
  
  // 5 Bolero/Vàng
  const boleroSlice = BOLERO_VANG_65.slice(idx * 5, (idx + 1) * 5);
  // 5 Trữ tình/Đỏ
  const truTinhSlice = TRU_TINH_DO_65.slice(idx * 5, (idx + 1) * 5);
  // 10 Nhạc trẻ
  const nhacTreSlice = NHAC_TRE_130.slice(idx * 10, (idx + 1) * 10);

  if (boleroSlice.length !== 5 || truTinhSlice.length !== 5 || nhacTreSlice.length !== 10) {
    throw new Error(`Slice count mismatch for Part ${p}: Bolero=${boleroSlice.length}, TruTinh=${truTinhSlice.length}, NhacTre=${nhacTreSlice.length}`);
  }

  // Combine and shuffle the 20 songs
  const partSongs = seededShuffle([...boleroSlice, ...truTinhSlice, ...nhacTreSlice], p * 777);

  partSongs.forEach((song, qIdx) => {
    // 4 options: title + 3 distractors, shuffled
    const optionsRaw = [song.title, ...song.distractors];
    // Clean any accidental parentheses from options or title
    const cleanOptions = optionsRaw.map(opt => opt.replace(/\s*\([^)]*\)/g, '').trim());
    
    // Ensure 4 unique options
    const uniqueOptions = Array.from(new Set(cleanOptions));
    if (uniqueOptions.length !== 4) {
      throw new Error(`Duplicate options found for song "${song.title}": ${JSON.stringify(cleanOptions)}`);
    }

    // Deterministically shuffle options so correct answer is not always in same slot
    const shuffledOptions = seededShuffle(uniqueOptions, (p * 100 + qIdx) * 13);
    const cleanCorrectTitle = song.title.replace(/\s*\([^)]*\)/g, '').trim();
    const correctIndex = shuffledOptions.findIndex(opt => opt.toLowerCase() === cleanCorrectTitle.toLowerCase());

    if (correctIndex === -1) {
      throw new Error(`Correct answer not found in options for "${song.title}"`);
    }

    const qObj = {
      prompt: "Đây là bài hát nào?",
      options: shuffledOptions,
      correct_index: correctIndex,
      explanation: song.explanation,
      image_url: `https://img.youtube.com/vi/${song.ytid}/hqdefault.jpg`,
      audio_url: null,
      video_url: null,
      youtube_video_id: song.ytid,
      start_time: song.startTime || 20,
      question_type: "AUDIO_GUESS",
      difficulty: "medium",
      points: 1000,
      time_limit: 30,
      source: `${song.artist} - ${cleanCorrectTitle}`,
      is_double_points: false,
      active: true,
      id: `q-music-p${p}-${qIdx + 1}`,
      round_no: p,
      question_no: qIdx + 1,
      category: catName
    };

    newQuestions.push(qObj);
  });
}

console.log(`Generated ${newQuestions.length} new questions across 13 parts.`);

// Final check: confirm each of parts 8 to 20 has exactly 20 questions
for (let p = 8; p <= 20; p++) {
  const cat = `Âm nhạc Việt #${p}`;
  const count = newQuestions.filter(q => q.category === cat).length;
  console.log(`${cat}: ${count} questions`);
  if (count !== 20) throw new Error(`${cat} does not have 20 questions (has ${count})`);
}

// Check for any parentheses across all options in new questions
let parenCount = 0;
newQuestions.forEach(q => {
  q.options.forEach(opt => {
    if (opt.includes('(') || opt.includes(')')) parenCount++;
  });
});
console.log('Parentheses in new options:', parenCount);
if (parenCount > 0) throw new Error('Parentheses detected in new questions options!');

// Merge and write back to questionBank.json
const finalBank = [...cleanedBank, ...newQuestions];
fs.writeFileSync(bankPath, JSON.stringify(finalBank, null, 2), 'utf8');

console.log(`SUCCESS! questionBank.json updated. Total questions: ${finalBank.length}`);

