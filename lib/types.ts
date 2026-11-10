export type QuestionType =
  | "MULTIPLE_CHOICE"
  | "IMAGE_GUESS"
  | "AUDIO_GUESS"
  | "VIDEO_GUESS"
  | "TRUE_FALSE";

export type QuestionDifficulty = "easy" | "medium" | "hard";

export interface Question {
  id: string;
  round_no: number;
  question_no: number;
  category: string;
  prompt: string;
  options: string[];
  correct_index?: number;
  explanation?: string;
  image_url?: string | null;
  audio_url?: string | null;
  video_url?: string | null;
  youtube_video_id?: string | null;
  question_type?: QuestionType;
  difficulty?: QuestionDifficulty;
  points?: number;
  time_limit?: number;
  source?: string | null;
  start_time?: number | null;
  is_double_points?: boolean;
}

export interface Player {
  id: string;
  display_name: string;
  avatar: string;
  score: number;
  is_host: boolean;
  has_answered: boolean;
  streak?: number;
  correct_count?: number;
  average_time?: number;
  last_points?: number;
  previous_score?: number;
}

export interface RoomState {
  room_code: string;
  room_name?: string;
  status: "lobby" | "playing" | "reveal" | "finished";
  current_index: number;
  total_questions: number;
  time_limit?: number;
  current_question_started_at?: string;
  categories?: string[];
  difficulty?: string;
  players: Player[];
  question: Question | null;
  is_host: boolean;
  my_player_id: string;
  answered_count: number;
  my_answer?: {
    is_correct?: boolean;
    points_awarded?: number;
    answer_index?: number;
    text_answer?: string;
  };
}

export interface RoomCreationOptions {
  hostName: string;
  roomName: string;
  categories: string[];
  difficulty: "all" | "easy" | "medium" | "hard";
  questionCount: 10 | 20 | 30 | 50;
  timeLimit: 15 | 20 | 30;
  mediaMode: "all" | "text_only" | "media_only";
  avatar: string;
}

export const QUESTION_CATEGORIES = [
  "Âm nhạc Việt #1",
  "Âm nhạc Việt #2",
  "Âm nhạc Việt #3",
  "Âm nhạc Việt #4",
  "Âm nhạc Việt #5",
  "Âm nhạc Việt #6",
  "Âm nhạc Việt #7",
  "Doraemon",
  "Conan – Thám tử lừng danh",
  "Phim Hàn Quốc (K-Drama)",
  "K-Pop",
  "US-UK",
  "Địa lý cơ bản",
  "Hoạt hình tuổi thơ Nhật Bản",
  "Phim & hoạt hình tuổi thơ Trung Quốc",
  "Hoạt hình tuổi thơ Mỹ",
  "Đoán tên ca sĩ nổi tiếng",
  "Phim Mỹ & Phim Việt Nam"
] as const;

export const AVATAR_OPTIONS = [
  { emoji: "🦊", label: "Cáo đỏ" },
  { emoji: "🐻", label: "Gấu nâu" },
  { emoji: "🐼", label: "Gấu trúc" },
  { emoji: "🐯", label: "Hổ vằn" },
  { emoji: "🦁", label: "Sư tử" },
  { emoji: "🐸", label: "Ếch xanh" },
  { emoji: "🐱", label: "Mèo con" },
  { emoji: "🐶", label: "Cún cưng" },
  { emoji: "🦄", label: "Kỳ lân" },
  { emoji: "🐧", label: "Chim cánh cụt" },
  { emoji: "🦉", label: "Cú mèo" },
  { emoji: "🐙", label: "Bạch tuộc" }
];

