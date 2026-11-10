"use client";

import { useMemo, useState } from "react";
import {
  AVATAR_OPTIONS,
  QUESTION_CATEGORIES,
  RoomCreationOptions
} from "@/lib/types";
import { countMatchingQuestions } from "@/lib/questionBank";
import {
  Check,
  Clock,
  HelpCircle,
  Layers,
  Shuffle,
  Sparkles,
  Users,
  X,
  Zap
} from "lucide-react";

interface RoomCreationModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSubmit: (options: RoomCreationOptions) => void;
  busy?: boolean;
}

export function RoomCreationModal({
  isOpen,
  onClose,
  onSubmit,
  busy = false
}: RoomCreationModalProps) {
  const [hostName, setHostName] = useState("");
  const [roomName, setRoomName] = useState("Quiz Party Gameshow");
  const [selectedCategories, setSelectedCategories] = useState<string[]>([
    QUESTION_CATEGORIES[0]
  ]);
  const [difficulty, setDifficulty] = useState<"all" | "easy" | "medium" | "hard">("all");
  const [questionCount, setQuestionCount] = useState<10 | 20 | 30 | 50>(20);
  const [timeLimit, setTimeLimit] = useState<15 | 20 | 30>(20);
  const [mediaMode, setMediaMode] = useState<"all" | "text_only" | "media_only">("all");
  const [avatar, setAvatar] = useState("🦊");
  const [error, setError] = useState("");

  const matchingPoolCount = useMemo(
    () => countMatchingQuestions(selectedCategories, difficulty),
    [selectedCategories, difficulty]
  );

  if (!isOpen) return null;

  const isAllSelected = selectedCategories.length === QUESTION_CATEGORIES.length;

  const handleCategoryClick = (cat: string) => {
    setError("");
    // Nếu đang ở chế độ "Chọn tất cả (12/12)" mà người dùng bấm vào 1 chủ đề -> Chọn riêng chủ đề đó ngay lập tức
    if (isAllSelected) {
      setSelectedCategories([cat]);
      return;
    }

    if (selectedCategories.includes(cat)) {
      if (selectedCategories.length === 1) {
        // Đang chọn 1 chủ đề duy nhất thì giữ nguyên chủ đề đó
        return;
      }
      setSelectedCategories(selectedCategories.filter((c) => c !== cat));
    } else {
      setSelectedCategories([...selectedCategories, cat]);
    }
  };

  const selectOnlyCategory = (cat: string, e: React.MouseEvent) => {
    e.stopPropagation();
    setSelectedCategories([cat]);
    setError("");
  };

  const selectAllCategories = () => {
    setSelectedCategories([...QUESTION_CATEGORIES]);
    setError("");
  };

  const handleCreate = (e: React.FormEvent) => {
    e.preventDefault();
    if (!hostName.trim()) {
      setError("Vui lòng nhập tên hiển thị của bạn (Chủ phòng).");
      return;
    }
    if (selectedCategories.length === 0) {
      setError("Vui lòng chọn ít nhất một chủ đề.");
      return;
    }

    onSubmit({
      hostName: hostName.trim(),
      roomName: roomName.trim() || "Quiz Party Gameshow",
      categories: selectedCategories,
      difficulty,
      questionCount,
      timeLimit,
      mediaMode,
      avatar
    });
  };

  const difficultyLabel =
    difficulty === "easy"
      ? "Dễ"
      : difficulty === "medium"
      ? "Vừa"
      : difficulty === "hard"
      ? "Khó"
      : "Tất cả mức độ";

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm animate-in fade-in duration-200">
      <div className="relative max-h-[92vh] w-full max-w-2xl overflow-y-auto rounded-3xl border border-violet-100 bg-white p-6 shadow-2xl md:p-8">
        <button
          onClick={onClose}
          className="absolute right-5 top-5 rounded-full p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-700"
        >
          <X size={20} />
        </button>

        <div className="flex items-center gap-2 text-xs font-black uppercase tracking-wider text-violet-600">
          <Sparkles size={16} /> Thiết lập Gameshow
        </div>
        <h2 className="mt-1 text-2xl font-black text-slate-900 md:text-3xl">
          Tạo Phòng Thi Đấu Mới
        </h2>
        <p className="mt-1 text-sm text-gray-500">
          Chọn chủ đề, độ khó, số câu và thời gian trả lời. Câu hỏi sẽ được <b>random ngẫu nhiên 100%</b> mỗi khi mở phòng mới.
        </p>

        {error && (
          <div className="mt-4 rounded-xl bg-red-50 p-3 text-sm font-semibold text-red-700">
            {error}
          </div>
        )}

        <form onSubmit={handleCreate} className="mt-5 space-y-5">
          {/* TÊN HIỂN THỊ & AVATAR */}
          <div className="grid gap-4 sm:grid-cols-[1fr_auto]">
            <div>
              <label className="mb-1 block text-xs font-black uppercase tracking-wider text-gray-700">
                Tên của bạn (Chủ phòng) *
              </label>
              <input
                type="text"
                value={hostName}
                onChange={(e) => setHostName(e.target.value)}
                placeholder="Ví dụ: Hoàng Anh"
                maxLength={24}
                className="field"
                required
              />
            </div>

            <div>
              <label className="mb-1 block text-xs font-black uppercase tracking-wider text-gray-700">
                Avatar đại diện
              </label>
              <div className="flex flex-wrap gap-1.5 rounded-2xl border border-gray-200 p-1.5">
                {AVATAR_OPTIONS.slice(0, 6).map((item) => (
                  <button
                    key={item.emoji}
                    type="button"
                    onClick={() => setAvatar(item.emoji)}
                    className={`grid h-10 w-10 place-items-center rounded-xl text-xl transition ${
                      avatar === item.emoji
                        ? "bg-violet-600 text-white shadow-md scale-110"
                        : "hover:bg-gray-100"
                    }`}
                  >
                    {item.emoji}
                  </button>
                ))}
              </div>
            </div>
          </div>

          {/* TÊN PHÒNG */}
          <div>
            <label className="mb-1 block text-xs font-black uppercase tracking-wider text-gray-700">
              Tên phòng chơi
            </label>
            <input
              type="text"
              value={roomName}
              onChange={(e) => setRoomName(e.target.value)}
              placeholder="VD: Trận Đấu Đại Chiến Cuối Tuần"
              maxLength={40}
              className="field"
            />
          </div>

          {/* SỐ LƯỢNG CÂU HỎI (10, 20, 30, 50 CÂU) */}
          <div>
            <label className="mb-2 flex items-center justify-between text-xs font-black uppercase tracking-wider text-gray-700">
              <span className="flex items-center gap-1.5">
                <HelpCircle size={15} className="text-violet-600" /> Số lượng câu hỏi mỗi ván
              </span>
              <span className="text-violet-600 font-extrabold">{questionCount} câu</span>
            </label>
            <div className="grid grid-cols-4 gap-2">
              {[10, 20, 30, 50].map((num) => (
                <button
                  key={num}
                  type="button"
                  onClick={() => setQuestionCount(num as 10 | 20 | 30 | 50)}
                  className={`flex flex-col items-center justify-center rounded-2xl border-2 py-3 font-black transition ${
                    questionCount === num
                      ? "border-violet-600 bg-violet-50 text-violet-700 shadow-sm"
                      : "border-gray-200 bg-white text-gray-600 hover:border-gray-300"
                  }`}
                >
                  <span className="text-lg md:text-xl">{num}</span>
                  <span className="text-[10px] font-bold text-gray-400">câu hỏi</span>
                </button>
              ))}
            </div>
          </div>

          {/* THỜI GIAN TRẢ LỜI MỖI CÂU & MỨC ĐỘ KHÓ */}
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="mb-2 block text-xs font-black uppercase tracking-wider text-gray-700">
                <Clock className="mr-1 inline text-violet-600" size={15} /> Thời gian mỗi câu
              </label>
              <div className="grid grid-cols-3 gap-2">
                {[15, 20, 30].map((sec) => (
                  <button
                    key={sec}
                    type="button"
                    onClick={() => setTimeLimit(sec as 15 | 20 | 30)}
                    className={`rounded-xl border py-2.5 text-xs font-black transition ${
                      timeLimit === sec
                        ? "border-violet-600 bg-violet-600 text-white shadow-sm"
                        : "border-gray-200 bg-white text-gray-700 hover:bg-gray-50"
                    }`}
                  >
                    {sec} giây
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className="mb-2 block text-xs font-black uppercase tracking-wider text-gray-700">
                <Zap className="mr-1 inline text-amber-500" size={15} /> Mức độ khó
              </label>
              <div className="grid grid-cols-4 gap-1.5">
                {[
                  { id: "all", label: "Tất cả" },
                  { id: "easy", label: "Dễ" },
                  { id: "medium", label: "Vừa" },
                  { id: "hard", label: "Khó" }
                ].map((d) => (
                  <button
                    key={d.id}
                    type="button"
                    onClick={() => setDifficulty(d.id as "all" | "easy" | "medium" | "hard")}
                    className={`rounded-xl border py-2.5 text-xs font-black transition ${
                      difficulty === d.id
                        ? "border-violet-600 bg-violet-600 text-white shadow-sm"
                        : "border-gray-200 bg-white text-gray-700 hover:bg-gray-50"
                    }`}
                  >
                    {d.label}
                  </button>
                ))}
              </div>
            </div>
          </div>

          {/* CHỦ ĐỀ CÂU HỎI (12 CHỦ ĐỀ BẮT BUỘC) */}
          <div>
            <div className="mb-2 flex flex-wrap items-center justify-between gap-2">
              <label className="flex items-center gap-1.5 text-xs font-black uppercase tracking-wider text-gray-700">
                <Layers size={15} className="text-violet-600" /> Chọn chủ đề ({selectedCategories.length}/{QUESTION_CATEGORIES.length})
              </label>
              <div className="flex items-center gap-3 text-xs">
                <button
                  type="button"
                  onClick={() => setSelectedCategories([QUESTION_CATEGORIES[0]])}
                  className="font-bold text-gray-500 hover:text-violet-600 hover:underline"
                >
                  Chỉ chọn 1 chủ đề
                </button>
                <button
                  type="button"
                  onClick={selectAllCategories}
                  className="font-extrabold text-violet-600 hover:underline"
                >
                  Chọn tất cả (Trộn {QUESTION_CATEGORIES.length} chủ đề)
                </button>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-2 sm:grid-cols-3">
              {QUESTION_CATEGORIES.map((cat) => {
                const active = selectedCategories.includes(cat);
                return (
                  <div
                    key={cat}
                    onClick={() => handleCategoryClick(cat)}
                    role="button"
                    tabIndex={0}
                    onKeyDown={(e) => {
                      if (e.key === "Enter" || e.key === " ") handleCategoryClick(cat);
                    }}
                    className={`group flex cursor-pointer items-center justify-between gap-1.5 rounded-xl border p-2.5 text-left text-xs font-bold transition ${
                      active
                        ? "border-violet-600 bg-violet-50 text-violet-900 shadow-sm"
                        : "border-gray-200 bg-white text-gray-500 hover:border-gray-300"
                    }`}
                  >
                    <div className="flex min-w-0 items-center gap-2">
                      <div
                        className={`grid h-4 w-4 shrink-0 place-items-center rounded-md border ${
                          active
                            ? "border-violet-600 bg-violet-600 text-white"
                            : "border-gray-300 bg-white"
                        }`}
                      >
                        {active && <Check size={11} strokeWidth={3} />}
                      </div>
                      <span className="truncate" title={cat}>
                        {cat}
                      </span>
                    </div>

                    {selectedCategories.length > 1 && (
                      <button
                        type="button"
                        onClick={(e) => selectOnlyCategory(cat, e)}
                        title={`Chỉ chơi duy nhất chủ đề ${cat}`}
                        className="hidden shrink-0 rounded bg-violet-200/80 px-1.5 py-0.5 text-[10px] font-extrabold text-violet-800 hover:bg-violet-600 hover:text-white group-hover:inline-block"
                      >
                        Chỉ mục này
                      </button>
                    )}
                  </div>
                );
              })}
            </div>

            {/* TÓM TẮT BỘ LỌC CÂU HỎI SẼ ÁP DỤNG */}
            <div className="mt-3 flex flex-wrap items-center justify-between gap-2 rounded-2xl border border-violet-100 bg-violet-50/70 px-4 py-2.5 text-xs text-violet-900">
              <div className="flex items-center gap-2">
                <Shuffle size={15} className="shrink-0 text-violet-600" />
                <span>
                  <b>Bộ đề:</b>{" "}
                  {selectedCategories.length === QUESTION_CATEGORIES.length
                    ? "Trộn ngẫu nhiên 12 chủ đề"
                    : selectedCategories.join(", ")}{" "}
                  · <b>Độ khó:</b> {difficultyLabel} · <b>{questionCount} câu</b> ({timeLimit}s/câu)
                </span>
              </div>
              <span className="rounded-full bg-white px-2.5 py-0.5 font-extrabold text-violet-700 shadow-sm">
                Kho đề: {matchingPoolCount} câu khớp 100%
              </span>
            </div>
          </div>

          {/* NÚT TẠO PHÒNG */}
          <div className="pt-1">
            <button
              type="submit"
              disabled={busy}
              className="flex w-full items-center justify-center gap-2 rounded-2xl bg-violet-600 py-4 text-base font-black text-white shadow-lg shadow-violet-600/30 transition hover:bg-violet-700 active:scale-95 disabled:opacity-50"
            >
              {busy ? (
                <>Đang khởi tạo phòng...</>
              ) : (
                <>
                  <Users size={20} /> Tạo Phòng & Mở Lobby
                </>
              )}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
