"use client";

import { useMemo, useState } from "react";
import { Question, QuestionDifficulty, QuestionType, QUESTION_CATEGORIES } from "@/lib/types";
import {
  LOCAL_QUESTION_BANK,
  auditQuestionBank,
  exportToCSV,
  parseCSV
} from "@/lib/questionBank";
import { MediaViewer } from "./MediaViewer";
import {
  AlertTriangle,
  ArrowUpDown,
  CheckCircle,
  Download,
  Edit2,
  Eye,
  FileSpreadsheet,
  FileText,
  Filter,
  Plus,
  RefreshCw,
  Search,
  Trash2,
  Upload,
  X
} from "lucide-react";

interface AdminQuestionManagerProps {
  onClose: () => void;
}

export function AdminQuestionManager({ onClose }: AdminQuestionManagerProps) {
  const [questions, setQuestions] = useState<Question[]>(LOCAL_QUESTION_BANK);
  const [search, setSearch] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("all");
  const [selectedDifficulty, setSelectedDifficulty] = useState("all");
  const [selectedType, setSelectedType] = useState("all");

  // Modal states
  const [previewQuestion, setPreviewQuestion] = useState<Question | null>(null);
  const [editingQuestion, setEditingQuestion] = useState<Question | null>(null);
  const [isCreating, setIsCreating] = useState(false);
  const [auditResult, setAuditResult] = useState<any | null>(null);
  const [notice, setNotice] = useState("");

  // Form state for creating/editing
  const [formData, setFormData] = useState<Partial<Question>>({
    category: QUESTION_CATEGORIES[0],
    prompt: "",
    options: ["", "", "", ""],
    correct_index: 0,
    explanation: "",
    difficulty: "medium",
    question_type: "MULTIPLE_CHOICE",
    points: 1000,
    time_limit: 20,
    image_url: "",
    youtube_video_id: ""
  });

  // Filtered questions
  const filteredQuestions = useMemo(() => {
    return questions.filter((q) => {
      const matchSearch =
        !search ||
        q.prompt.toLowerCase().includes(search.toLowerCase()) ||
        q.category.toLowerCase().includes(search.toLowerCase());
      const matchCat =
        selectedCategory === "all" || q.category === selectedCategory;
      const matchDiff =
        selectedDifficulty === "all" || q.difficulty === selectedDifficulty;
      const matchType =
        selectedType === "all" || q.question_type === selectedType;
      return matchSearch && matchCat && matchDiff && matchType;
    });
  }, [questions, search, selectedCategory, selectedDifficulty, selectedType]);

  const handleDelete = (id: string) => {
    if (confirm("Bạn có chắc chắn muốn xóa câu hỏi này?")) {
      setQuestions((prev) => prev.filter((q) => q.id !== id));
      setNotice("Đã xóa câu hỏi thành công.");
      setTimeout(() => setNotice(""), 3000);
    }
  };

  const handleEdit = (q: Question) => {
    setEditingQuestion(q);
    setFormData({
      ...q,
      options: [...q.options]
    });
    setIsCreating(true);
  };

  const handleCreateNew = () => {
    setEditingQuestion(null);
    setFormData({
      category: QUESTION_CATEGORIES[0],
      prompt: "",
      options: ["", "", "", ""],
      correct_index: 0,
      explanation: "",
      difficulty: "medium",
      question_type: "MULTIPLE_CHOICE",
      points: 1000,
      time_limit: 20,
      image_url: "",
      youtube_video_id: ""
    });
    setIsCreating(true);
  };

  const handleSaveQuestion = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.prompt || !formData.prompt.trim()) {
      alert("Vui lòng nhập nội dung câu hỏi.");
      return;
    }
    const cleanOptions = (formData.options || []).map((o) => o.trim()).filter(Boolean);
    if (cleanOptions.length < 2) {
      alert("Cần có tối thiểu 2 đáp án lựa chọn.");
      return;
    }

    if (editingQuestion) {
      // Update
      setQuestions((prev) =>
        prev.map((q) =>
          q.id === editingQuestion.id
            ? ({
                ...q,
                ...formData,
                options: cleanOptions,
                id: q.id
              } as Question)
            : q
        )
      );
      setNotice("Đã cập nhật câu hỏi thành công.");
    } else {
      // Create
      const newQ: Question = {
        id: `q-custom-${Date.now()}`,
        round_no: 1,
        question_no: questions.length + 1,
        category: formData.category || QUESTION_CATEGORIES[0],
        prompt: formData.prompt.trim(),
        options: cleanOptions,
        correct_index: formData.correct_index ?? 0,
        explanation: formData.explanation || "",
        difficulty: formData.difficulty || "medium",
        question_type: formData.question_type || "MULTIPLE_CHOICE",
        points: formData.points || 1000,
        time_limit: formData.time_limit || 20,
        image_url: formData.image_url || null,
        youtube_video_id: formData.youtube_video_id || null
      };
      setQuestions((prev) => [newQ, ...prev]);
      setNotice("Đã thêm câu hỏi mới thành công.");
    }

    setIsCreating(false);
    setTimeout(() => setNotice(""), 3000);
  };

  // Export JSON
  const handleExportJSON = () => {
    const dataStr =
      "data:text/json;charset=utf-8," +
      encodeURIComponent(JSON.stringify(questions, null, 2));
    const a = document.createElement("a");
    a.setAttribute("href", dataStr);
    a.setAttribute("download", `quiz_party_questions_${Date.now()}.json`);
    a.click();
  };

  // Export CSV
  const handleExportCSV = () => {
    const csv = exportToCSV(questions);
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.setAttribute("href", url);
    a.setAttribute("download", `quiz_party_questions_${Date.now()}.csv`);
    a.click();
  };

  // Import JSON / CSV
  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (event) => {
      try {
        const content = event.target?.result as string;
        if (file.name.endsWith(".json")) {
          const parsed = JSON.parse(content);
          if (Array.isArray(parsed)) {
            setQuestions((prev) => [...parsed, ...prev]);
            setNotice(`Đã nhập thành công ${parsed.length} câu hỏi từ JSON.`);
          }
        } else if (file.name.endsWith(".csv")) {
          const parsed = parseCSV(content);
          setQuestions((prev) => [...parsed, ...prev]);
          setNotice(`Đã nhập thành công ${parsed.length} câu hỏi từ CSV.`);
        }
        setTimeout(() => setNotice(""), 4000);
      } catch (err) {
        alert("Lỗi khi đọc file: " + (err instanceof Error ? err.message : "Định dạng không hợp lệ"));
      }
    };
    reader.readAsText(file, "UTF-8");
  };

  // Kiểm tra trùng lặp
  const handleRunAudit = () => {
    const res = auditQuestionBank(questions);
    setAuditResult(res);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-2 backdrop-blur-sm md:p-6">
      <div className="relative flex h-full max-h-[95vh] w-full max-w-6xl flex-col rounded-3xl bg-white shadow-2xl overflow-hidden">
        {/* HEADER */}
        <div className="flex items-center justify-between border-b border-gray-100 px-6 py-4">
          <div>
            <div className="flex items-center gap-2">
              <span className="grid h-8 w-8 place-items-center rounded-xl bg-violet-600 text-white font-black text-xs">
                CMS
              </span>
              <h2 className="text-xl font-black text-gray-900">
                Quản Trị Ngân Hàng Câu Hỏi ({questions.length} câu)
              </h2>
            </div>
            <p className="mt-0.5 text-xs text-gray-500">
              Thêm, sửa, xóa, tìm kiếm, xuất nhập JSON/CSV và kiểm tra trùng lặp
            </p>
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={handleCreateNew}
              className="flex items-center gap-1.5 rounded-xl bg-violet-600 px-3.5 py-2 text-xs font-bold text-white hover:bg-violet-700 shadow"
            >
              <Plus size={16} /> Thêm câu hỏi mới
            </button>
            <button
              onClick={onClose}
              className="rounded-xl p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-700"
            >
              <X size={20} />
            </button>
          </div>
        </div>

        {notice && (
          <div className="bg-emerald-50 px-6 py-2.5 text-xs font-bold text-emerald-800 border-b border-emerald-100 flex items-center gap-2">
            <CheckCircle size={15} /> {notice}
          </div>
        )}

        {/* TOOLBAR SEARCH & ACTIONS */}
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-gray-100 bg-slate-50/60 px-6 py-3">
          <div className="flex flex-1 flex-wrap items-center gap-2">
            <div className="relative min-w-[220px] flex-1">
              <Search
                className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"
                size={16}
              />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Tìm kiếm câu hỏi, nội dung..."
                className="w-full rounded-xl border border-gray-200 bg-white py-1.5 pl-9 pr-3 text-xs outline-none focus:border-violet-500"
              />
            </div>

            <select
              value={selectedCategory}
              onChange={(e) => setSelectedCategory(e.target.value)}
              className="rounded-xl border border-gray-200 bg-white px-2.5 py-1.5 text-xs font-semibold text-gray-700 outline-none"
            >
              <option value="all">Tất cả chủ đề ({QUESTION_CATEGORIES.length})</option>
              {QUESTION_CATEGORIES.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>

            <select
              value={selectedDifficulty}
              onChange={(e) => setSelectedDifficulty(e.target.value)}
              className="rounded-xl border border-gray-200 bg-white px-2.5 py-1.5 text-xs font-semibold text-gray-700 outline-none"
            >
              <option value="all">Mọi độ khó</option>
              <option value="easy">Dễ</option>
              <option value="medium">Trung bình</option>
              <option value="hard">Khó</option>
            </select>

            <select
              value={selectedType}
              onChange={(e) => setSelectedType(e.target.value)}
              className="rounded-xl border border-gray-200 bg-white px-2.5 py-1.5 text-xs font-semibold text-gray-700 outline-none"
            >
              <option value="all">Mọi loại câu hỏi</option>
              <option value="MULTIPLE_CHOICE">Trắc nghiệm chữ</option>
              <option value="IMAGE_GUESS">Câu hỏi hình ảnh</option>
              <option value="AUDIO_GUESS">Đoán bài hát</option>
            </select>
          </div>

          <div className="flex items-center gap-2">
            <label className="flex cursor-pointer items-center gap-1 rounded-xl border border-gray-200 bg-white px-3 py-1.5 text-xs font-bold text-gray-700 hover:bg-gray-50 shadow-sm">
              <Upload size={14} /> Import File
              <input
                type="file"
                accept=".json,.csv"
                className="hidden"
                onChange={handleFileUpload}
              />
            </label>

            <button
              onClick={handleExportCSV}
              title="Xuất danh sách ra file CSV Excel"
              className="flex items-center gap-1 rounded-xl border border-gray-200 bg-white px-3 py-1.5 text-xs font-bold text-emerald-700 hover:bg-emerald-50 shadow-sm"
            >
              <FileSpreadsheet size={14} /> CSV
            </button>

            <button
              onClick={handleExportJSON}
              title="Xuất file JSON nguyên bản"
              className="flex items-center gap-1 rounded-xl border border-gray-200 bg-white px-3 py-1.5 text-xs font-bold text-blue-700 hover:bg-blue-50 shadow-sm"
            >
              <FileText size={14} /> JSON
            </button>

            <button
              onClick={handleRunAudit}
              title="Kiểm tra câu hỏi bị trùng lặp hoặc thiếu thông tin"
              className="flex items-center gap-1 rounded-xl border border-amber-200 bg-amber-50 px-3 py-1.5 text-xs font-bold text-amber-800 hover:bg-amber-100 shadow-sm"
            >
              <AlertTriangle size={14} /> Kiểm tra trùng
            </button>
          </div>
        </div>

        {/* AUDIT REPORT MODAL / BANNER */}
        {auditResult && (
          <div className="border-b border-amber-200 bg-amber-50/80 px-6 py-3 text-xs">
            <div className="flex items-center justify-between font-bold text-amber-900">
              <span>
                Báo cáo kiểm tra {auditResult.totalChecked} câu hỏi:{" "}
                {auditResult.duplicates.length === 0
                  ? "✓ Không có câu hỏi nào bị trùng lặp!"
                  : `Phát hiện ${auditResult.duplicates.length} câu hỏi trùng lặp.`}
              </span>
              <button
                onClick={() => setAuditResult(null)}
                className="text-amber-800 hover:underline"
              >
                Đóng
              </button>
            </div>
            {auditResult.duplicates.length > 0 && (
              <ul className="mt-1 list-disc pl-5 text-amber-700">
                {auditResult.duplicates.map((d: any, idx: number) => (
                  <li key={idx}>
                    &quot;{d.prompt}&quot; - Xuất hiện {d.count} lần
                  </li>
                ))}
              </ul>
            )}
          </div>
        )}

        {/* TABLE OF QUESTIONS */}
        <div className="flex-1 overflow-y-auto px-6 py-4">
          <table className="w-full text-left text-xs">
            <thead className="sticky top-0 bg-white text-gray-400 border-b border-gray-100">
              <tr>
                <th className="py-2.5 font-bold">#</th>
                <th className="py-2.5 font-bold">Chủ đề</th>
                <th className="py-2.5 font-bold">Câu hỏi</th>
                <th className="py-2.5 font-bold">Loại / Media</th>
                <th className="py-2.5 font-bold">Độ khó</th>
                <th className="py-2.5 text-right font-bold">Thao tác</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filteredQuestions.map((q, idx) => (
                <tr key={q.id || idx} className="hover:bg-violet-50/40 transition">
                  <td className="py-3 font-mono text-gray-400">{idx + 1}</td>
                  <td className="py-3">
                    <span className="rounded-md bg-gray-100 px-2 py-0.5 font-bold text-gray-700">
                      {q.category}
                    </span>
                  </td>
                  <td className="py-3 font-semibold text-gray-900 max-w-md">
                    <div className="line-clamp-2">{q.prompt}</div>
                    <div className="mt-1 text-[11px] text-green-700">
                      ✓ {q.options[q.correct_index ?? 0]}
                    </div>
                  </td>
                  <td className="py-3">
                    <div className="flex items-center gap-1.5">
                      <span className="rounded-full bg-violet-100 px-2 py-0.5 text-[10px] font-bold text-violet-700">
                        {q.question_type || "MC"}
                      </span>
                      {q.image_url && <span title="Có hình ảnh">🖼️</span>}
                      {q.youtube_video_id && <span title="Có video YouTube">▶️</span>}
                      {q.audio_url && <span title="Có file âm thanh">🎵</span>}
                    </div>
                  </td>
                  <td className="py-3">
                    <span
                      className={`rounded-full px-2 py-0.5 text-[10px] font-black ${
                        q.difficulty === "easy"
                          ? "bg-emerald-100 text-emerald-800"
                          : q.difficulty === "hard"
                          ? "bg-rose-100 text-rose-800"
                          : "bg-amber-100 text-amber-800"
                      }`}
                    >
                      {q.difficulty === "easy" ? "Dễ" : q.difficulty === "hard" ? "Khó" : "Vừa"}
                    </span>
                  </td>
                  <td className="py-3 text-right">
                    <div className="flex items-center justify-end gap-1">
                      <button
                        onClick={() => setPreviewQuestion(q)}
                        title="Xem trước câu hỏi"
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-violet-50 hover:text-violet-600"
                      >
                        <Eye size={15} />
                      </button>
                      <button
                        onClick={() => handleEdit(q)}
                        title="Chỉnh sửa câu hỏi"
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-blue-50 hover:text-blue-600"
                      >
                        <Edit2 size={15} />
                      </button>
                      <button
                        onClick={() => handleDelete(q.id)}
                        title="Xóa câu hỏi"
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-rose-50 hover:text-rose-600"
                      >
                        <Trash2 size={15} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          {filteredQuestions.length === 0 && (
            <div className="py-12 text-center text-gray-400">
              Không tìm thấy câu hỏi phù hợp với bộ lọc hiện tại.
            </div>
          )}
        </div>

        {/* PREVIEW MODAL */}
        {previewQuestion && (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm">
            <div className="relative w-full max-w-lg rounded-3xl bg-white p-6 shadow-2xl">
              <button
                onClick={() => setPreviewQuestion(null)}
                className="absolute right-4 top-4 text-gray-400 hover:text-gray-700"
              >
                <X size={20} />
              </button>
              <div className="text-xs font-bold text-violet-600 uppercase">
                {previewQuestion.category} · {previewQuestion.difficulty}
              </div>
              <h3 className="mt-2 text-lg font-black text-gray-900">
                {previewQuestion.prompt}
              </h3>

              <MediaViewer
                type={previewQuestion.question_type}
                imageUrl={previewQuestion.image_url}
                audioUrl={previewQuestion.audio_url}
                youtubeVideoId={previewQuestion.youtube_video_id}
                category={previewQuestion.category}
                prompt={previewQuestion.prompt}
                options={previewQuestion.options}
              />

              <div className="mt-4 space-y-2">
                {previewQuestion.options.map((opt, i) => (
                  <div
                    key={i}
                    className={`rounded-xl border p-3 text-xs font-bold ${
                      i === previewQuestion.correct_index
                        ? "border-green-500 bg-green-50 text-green-900"
                        : "border-gray-200 bg-gray-50 text-gray-700"
                    }`}
                  >
                    {String.fromCharCode(65 + i)}. {opt}{" "}
                    {i === previewQuestion.correct_index && "✓ (Đáp án đúng)"}
                  </div>
                ))}
              </div>

              {previewQuestion.explanation && (
                <div className="mt-4 rounded-xl bg-violet-50 p-3 text-xs text-violet-900">
                  <b>Giải thích:</b> {previewQuestion.explanation}
                </div>
              )}
            </div>
          </div>
        )}

        {/* CREATE / EDIT MODAL */}
        {isCreating && (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm">
            <div className="relative max-h-[90vh] w-full max-w-2xl overflow-y-auto rounded-3xl bg-white p-6 shadow-2xl">
              <button
                onClick={() => setIsCreating(false)}
                className="absolute right-4 top-4 text-gray-400 hover:text-gray-700"
              >
                <X size={20} />
              </button>
              <h3 className="text-xl font-black text-gray-900">
                {editingQuestion ? "Chỉnh Sửa Câu Hỏi" : "Thêm Câu Hỏi Mới"}
              </h3>

              <form onSubmit={handleSaveQuestion} className="mt-4 space-y-4 text-xs">
                <div>
                  <label className="block font-bold mb-1">Chủ đề *</label>
                  <select
                    value={formData.category}
                    onChange={(e) => setFormData({ ...formData, category: e.target.value })}
                    className="field"
                  >
                    {QUESTION_CATEGORIES.map((c) => (
                      <option key={c} value={c}>
                        {c}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block font-bold mb-1">Nội dung câu hỏi *</label>
                  <textarea
                    rows={3}
                    value={formData.prompt}
                    onChange={(e) => setFormData({ ...formData, prompt: e.target.value })}
                    placeholder="Nhập nội dung câu hỏi..."
                    className="field"
                    required
                  />
                </div>

                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block font-bold mb-1">Loại câu hỏi</label>
                    <select
                      value={formData.question_type}
                      onChange={(e) =>
                        setFormData({ ...formData, question_type: e.target.value as QuestionType })
                      }
                      className="field"
                    >
                      <option value="MULTIPLE_CHOICE">Trắc nghiệm thông thường</option>
                      <option value="IMAGE_GUESS">Nhìn ảnh đoán tên</option>
                      <option value="AUDIO_GUESS">Đoán tên bài hát (Audio/Video)</option>
                    </select>
                  </div>

                  <div>
                    <label className="block font-bold mb-1">Độ khó</label>
                    <select
                      value={formData.difficulty}
                      onChange={(e) =>
                        setFormData({ ...formData, difficulty: e.target.value as QuestionDifficulty })
                      }
                      className="field"
                    >
                      <option value="easy">Dễ (1000 điểm)</option>
                      <option value="medium">Trung bình (1000 điểm)</option>
                      <option value="hard">Khó (1000 điểm)</option>
                    </select>
                  </div>
                </div>

                {/* 4 ĐÁP ÁN */}
                <div>
                  <label className="block font-bold mb-2">4 Đáp án lựa chọn (Chọn đáp án đúng)</label>
                  <div className="space-y-2">
                    {[0, 1, 2, 3].map((idx) => (
                      <div key={idx} className="flex items-center gap-2">
                        <input
                          type="radio"
                          name="correct_index"
                          checked={formData.correct_index === idx}
                          onChange={() => setFormData({ ...formData, correct_index: idx })}
                          className="h-4 w-4 text-violet-600"
                        />
                        <span className="font-bold text-gray-500 w-5">
                          {String.fromCharCode(65 + idx)}
                        </span>
                        <input
                          type="text"
                          value={formData.options?.[idx] || ""}
                          onChange={(e) => {
                            const newOpts = [...(formData.options || ["", "", "", ""])];
                            newOpts[idx] = e.target.value;
                            setFormData({ ...formData, options: newOpts });
                          }}
                          placeholder={`Đáp án ${String.fromCharCode(65 + idx)}`}
                          className="field flex-1 py-2 text-xs"
                          required
                        />
                      </div>
                    ))}
                  </div>
                </div>

                {/* MEDIA */}
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block font-bold mb-1">URL Hình ảnh (nếu có)</label>
                    <input
                      type="url"
                      value={formData.image_url || ""}
                      onChange={(e) => setFormData({ ...formData, image_url: e.target.value })}
                      placeholder="https://upload.wikimedia.org/..."
                      className="field py-2 text-xs"
                    />
                  </div>

                  <div>
                    <label className="block font-bold mb-1">YouTube Video ID (cho Đoán bài hát)</label>
                    <input
                      type="text"
                      value={formData.youtube_video_id || ""}
                      onChange={(e) => setFormData({ ...formData, youtube_video_id: e.target.value })}
                      placeholder="Ví dụ: gdZLi9oWNZg"
                      className="field py-2 text-xs"
                    />
                  </div>
                </div>

                <div>
                  <label className="block font-bold mb-1">Giải thích đáp án</label>
                  <textarea
                    rows={2}
                    value={formData.explanation || ""}
                    onChange={(e) => setFormData({ ...formData, explanation: e.target.value })}
                    placeholder="Giải thích chi tiết vì sao đáp án đúng..."
                    className="field py-2 text-xs"
                  />
                </div>

                <div className="flex justify-end gap-2 pt-2">
                  <button
                    type="button"
                    onClick={() => setIsCreating(false)}
                    className="rounded-xl border border-gray-200 px-4 py-2 font-bold text-gray-600 hover:bg-gray-50"
                  >
                    Hủy bỏ
                  </button>
                  <button
                    type="submit"
                    className="rounded-xl bg-violet-600 px-5 py-2 font-bold text-white hover:bg-violet-700 shadow"
                  >
                    Lưu câu hỏi
                  </button>
                </div>
              </form>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

