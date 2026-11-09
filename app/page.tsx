"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import { supabase, isSupabaseConfigured, newPlayerToken } from "@/lib/supabase";
import {
  AVATAR_OPTIONS,
  Player,
  Question,
  RoomCreationOptions,
  RoomState
} from "@/lib/types";
import { soundFX } from "@/lib/soundEffects";
import { MediaViewer } from "@/components/MediaViewer";
import { RoomCreationModal } from "@/components/RoomCreationModal";
import { PodiumCeremony } from "@/components/PodiumCeremony";
import { AdminQuestionManager } from "@/components/AdminQuestionManager";
import {
  ArrowRight,
  CheckCircle2,
  Clock3,
  Copy,
  Crown,
  Database,
  Gamepad2,
  HelpCircle,
  Laptop,
  Layers,
  Loader2,
  LogIn,
  Plus,
  RefreshCw,
  Settings,
  Share2,
  Smartphone,
  Sparkles,
  Trophy,
  Users,
  Volume2,
  VolumeX,
  XCircle,
  Zap
} from "lucide-react";

type RpcResult<T> = { data: T | null; error: { message: string; code?: string } | null };

export default function Home() {
  const [screen, setScreen] = useState<"home" | "room">("home");
  const [name, setName] = useState("");
  const [roomCode, setRoomCode] = useState("");
  const [joinAvatar, setJoinAvatar] = useState("🐻");
  const [state, setState] = useState<RoomState | null>(null);
  const [selected, setSelected] = useState<number | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [notice, setNotice] = useState("");
  const [seconds, setSeconds] = useState(20);
  const [autoNextCountdown, setAutoNextCountdown] = useState<number | null>(null);
  const [isMuted, setIsMuted] = useState(false);
  const [isExitDialogOpen, setIsExitDialogOpen] = useState(false);

  // Modals
  const [isCreateModalOpen, setIsCreateModalOpen] = useState(false);
  const [isAdminOpen, setIsAdminOpen] = useState(false);
  const [copied, setCopied] = useState(false);
  const [copiedLink, setCopiedLink] = useState(false);

  // Tự động nhận mã phòng từ đường dẫn mời (?room=ABCDEF) khi bạn bè mở trên điện thoại hoặc PC
  useEffect(() => {
    if (typeof window === "undefined") return;
    const params = new URLSearchParams(window.location.search);
    const codeParam = params.get("room");
    if (codeParam && codeParam.trim().length >= 4) {
      setRoomCode(codeParam.trim().toUpperCase());
    }
  }, []);

  // Time elapsed since question started
  const [questionStartTime, setQuestionStartTime] = useState<number>(Date.now());

  // Sound Mute Toggle
  const toggleSound = () => {
    const muted = soundFX.toggleMute();
    setIsMuted(muted);
  };

  const call = useCallback(async <T,>(fn: string, args: Record<string, unknown>) => {
    const res = await fetch("/api/quiz", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ action: fn, ...args })
    });
    const json = (await res.json()) as RpcResult<T>;
    if (!res.ok || json.error) {
      throw new Error(json.error?.message || "Lỗi kết nối máy chủ.");
    }
    return json.data as T;
  }, []);

  const refresh = useCallback(
    async (code?: string, token?: string) => {
      const activeCode = code || roomCode;
      const activeToken =
        token ||
        (typeof window !== "undefined"
          ? sessionStorage.getItem(`qp-token-${activeCode}`)
          : null);
      if (!activeCode || !activeToken) return;
      try {
        const data = await call<RoomState>("get_room_state", {
          p_code: activeCode,
          p_player_token: activeToken
        });
        setState(data);
      } catch (e) {
        setError(e instanceof Error ? e.message : "Không thể tải dữ liệu phòng.");
      }
    },
    [call, roomCode]
  );

  // Realtime subscription + Polling fallback
  useEffect(() => {
    if (screen !== "room" || !roomCode) return;
    const token = sessionStorage.getItem(`qp-token-${roomCode}`);
    const channel = isSupabaseConfigured
      ? supabase.channel(`room-${roomCode}`, {
          config: { broadcast: { self: false } }
        })
      : null;
    if (channel) {
      channel.on("broadcast", { event: "room_update" }, () =>
        refresh(roomCode, token || undefined)
      );
      channel.subscribe();
    }
    const timer = window.setInterval(
      () => refresh(roomCode, token || undefined),
      1200
    );
    return () => {
      window.clearInterval(timer);
      if (channel) supabase.removeChannel(channel);
    };
  }, [screen, roomCode, refresh]);

  // Timer countdown per question (synchronized with room time_limit: 15s / 20s / 30s)
  useEffect(() => {
    if (!state || state.status !== "playing") return;
    const limit = state.question?.time_limit || state.time_limit || 20;
    const startedMs = state.current_question_started_at
      ? new Date(state.current_question_started_at).getTime()
      : Date.now();
    const initialRemaining = Math.max(
      0,
      Math.min(limit, Math.ceil(limit - (Date.now() - startedMs) / 1000))
    );
    setSeconds(initialRemaining > 0 ? initialRemaining : limit);
    setQuestionStartTime(Date.now());

    const timer = window.setInterval(() => {
      setSeconds((s) => {
        if (s <= 1) {
          return 0;
        }
        if (s <= 5) {
          soundFX.playTick();
        }
        return s - 1;
      });
    }, 1000);

    return () => window.clearInterval(timer);
  }, [state?.current_index, state?.status, state?.question?.id, state?.time_limit]);

  // Auto-reveal when countdown reaches 0s
  useEffect(() => {
    if (state?.status === "playing" && seconds === 0 && roomCode) {
      const token = sessionStorage.getItem(`qp-token-${roomCode}`);
      call("reveal_answer", { p_code: roomCode, p_player_token: token })
        .then(() => refresh(roomCode, token || undefined))
        .catch(() => {});
    }
  }, [seconds, state?.status, roomCode, call, refresh]);

  // Reset selected answer on new question
  useEffect(() => {
    setSelected(null);
  }, [state?.current_index]);

  // Reset selected answer when entering playing state
  useEffect(() => {
    if (state?.status === "playing") {
      setSelected(null);
    }
  }, [state?.status]);

  // Play sound on answer reveal & Auto-transition countdown in 5 seconds
  useEffect(() => {
    if (state?.status === "reveal") {
      if (state.question && selected !== null) {
        if (selected === state.question.correct_index) {
          soundFX.playCorrect();
        } else {
          soundFX.playWrong();
        }
      }

      // Đếm ngược 5 giây tự động chuyển câu tiếp theo
      setAutoNextCountdown(5);
      const countdownTimer = window.setInterval(() => {
        setAutoNextCountdown((prev) => {
          if (prev === null || prev <= 1) {
            window.clearInterval(countdownTimer);
            return 0;
          }
          return prev - 1;
        });
      }, 1000);

      // Khi đếm về 0 (sau 5s): Nếu là Host thì tự động gọi next_question
      const autoNextTimeout = window.setTimeout(() => {
        soundFX.playTransition();
        if (state.is_host && roomCode) {
          const token = sessionStorage.getItem(`qp-token-${roomCode}`);
          call<RoomState>("next_question", {
            p_code: roomCode,
            p_player_token: token
          })
            .then((nextState) => {
              if (nextState) setState(nextState);
              broadcast();
            })
            .catch(() => {});
        }
      }, 5000);

      return () => {
        window.clearInterval(countdownTimer);
        window.clearTimeout(autoNextTimeout);
      };
    } else {
      setAutoNextCountdown(null);
    }
  }, [state?.status, state?.current_index]);

  const broadcast = async () => {
    if (!roomCode) return;
    try {
      const channel = supabase.channel(`room-${roomCode}`);
      await channel.send({
        type: "broadcast",
        event: "room_update",
        payload: { at: Date.now() }
      });
      await supabase.removeChannel(channel);
    } catch {
      // Ignore broadcast errors
    }
    await refresh();
  };

  const enterRoom = async (code: string, token: string) => {
    setRoomCode(code);
    setScreen("room");
    await refresh(code, token);
  };

  // Host creates room with full customization
  const handleCreateRoom = async (options: RoomCreationOptions) => {
    setBusy(true);
    setError("");
    setNotice("");
    try {
      const token = newPlayerToken();

      let customQuestions: Question[] | undefined;
      try {
        const saved = localStorage.getItem("qp-custom-questions-v2");
        if (saved) {
          const parsed = JSON.parse(saved);
          if (Array.isArray(parsed) && parsed.length > 0) {
            customQuestions = parsed;
          }
        }
      } catch {
        // Ignore localStorage parse error
      }

      const result = await call<{ room_code: string; player_id: string; state?: RoomState }>(
        "create_room",
        {
          p_host_name: options.hostName,
          p_player_token: token,
          p_room_name: options.roomName,
          p_categories: options.categories,
          p_difficulty: options.difficulty,
          p_question_count: options.questionCount,
          p_time_limit: options.timeLimit,
          p_media_mode: options.mediaMode,
          p_avatar: options.avatar,
          p_custom_questions: customQuestions
        }
      );

      sessionStorage.setItem(`qp-token-${result.room_code}`, token);
      setIsCreateModalOpen(false);
      if (result.state) {
        setState(result.state);
      }
      await enterRoom(result.room_code, token);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Tạo phòng thất bại.");
    } finally {
      setBusy(false);
    }
  };

  // Player joins room
  const handleJoinRoom = async () => {
    setBusy(true);
    setError("");
    setNotice("");
    try {
      if (!name.trim()) throw new Error("Vui lòng nhập tên hiển thị.");
      if (roomCode.trim().length < 4) throw new Error("Mã phòng chưa hợp lệ.");

      const token = newPlayerToken();
      const result = await call<{ room_code: string; player_id: string; state?: RoomState }>(
        "join_room",
        {
          p_code: roomCode.trim().toUpperCase(),
          p_display_name: name.trim(),
          p_player_token: token,
          p_avatar: joinAvatar
        }
      );

      sessionStorage.setItem(`qp-token-${result.room_code}`, token);
      if (result.state) {
        setState(result.state);
      }
      await enterRoom(result.room_code, token);
      await broadcast();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Không thể tham gia phòng.");
    } finally {
      setBusy(false);
    }
  };

  // Host action: start_game, reveal_answer, next_question, restart_game
  const hostAction = async (fn: string) => {
    if (!state) return;
    setBusy(true);
    setError("");
    try {
      const token = sessionStorage.getItem(`qp-token-${roomCode}`);
      const nextState = await call<RoomState>(fn, {
        p_code: roomCode,
        p_player_token: token
      });
      if (nextState) setState(nextState);
      await broadcast();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Thao tác thất bại.");
    } finally {
      setBusy(false);
    }
  };

  // Player submits answer with speed measurement
  const handleAnswer = async (index: number) => {
    if (!state?.question || selected !== null || state.status !== "playing") return;
    soundFX.playSelect();
    setSelected(index);
    setBusy(true);
    setError("");

    try {
      const token = sessionStorage.getItem(`qp-token-${roomCode}`);
      const elapsed = Math.max(0.1, (Date.now() - questionStartTime) / 1000);

      const nextState = await call<RoomState>("submit_answer", {
        p_code: roomCode,
        p_player_token: token,
        p_question_id: state.question.id,
        p_answer_index: index,
        p_client_elapsed: elapsed
      });
      if (nextState) setState(nextState);

      await broadcast();
    } catch (e) {
      setSelected(null);
      setError(e instanceof Error ? e.message : "Gửi câu trả lời thất bại.");
    } finally {
      setBusy(false);
    }
  };

  const copyRoomCode = () => {
    if (state?.room_code) {
      navigator.clipboard.writeText(state.room_code);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    }
  };

  const copyInviteLink = () => {
    if (state?.room_code && typeof window !== "undefined") {
      const url = `${window.location.origin}/?room=${state.room_code}`;
      navigator.clipboard.writeText(url);
      setCopiedLink(true);
      setTimeout(() => setCopiedLink(false), 2000);
    }
  };

  const sortedPlayers = useMemo(
    () => [...(state?.players || [])].sort((a, b) => b.score - a.score),
    [state?.players]
  );

  const totalTimeLimit = state?.question?.time_limit || state?.time_limit || 20;
  const timeProgress = Math.max(0, Math.min(100, (seconds / totalTimeLimit) * 100));
  const questionProgress = state
    ? Math.min(
        100,
        ((state.current_index + (state.status === "finished" ? 1 : 0)) /
          Math.max(1, state.total_questions)) *
          100
      )
    : 0;

  // Kahoot-style colorful 4-answer buttons
  const answerStyles = [
    {
      bg: "bg-[#e21b3c]",
      hover: "hover:bg-[#d01736]",
      border: "border-[#e21b3c]",
      shape: "▲",
      letter: "A",
      text: "text-white"
    },
    {
      bg: "bg-[#1368ce]",
      hover: "hover:bg-[#1059b0]",
      border: "border-[#1368ce]",
      shape: "◆",
      letter: "B",
      text: "text-white"
    },
    {
      bg: "bg-[#d89e00]",
      hover: "hover:bg-[#be8b00]",
      border: "border-[#d89e00]",
      shape: "●",
      letter: "C",
      text: "text-white"
    },
    {
      bg: "bg-[#26890c]",
      hover: "hover:bg-[#20740a]",
      border: "border-[#26890c]",
      shape: "■",
      letter: "D",
      text: "text-white"
    }
  ];

  /* =========================================================================
     IN-GAME / ROOM SCREEN
     ========================================================================= */
  if (screen === "room" && state) {
    return (
      <main className="min-h-screen bg-[#f3f2f8] px-2 py-2 md:px-6 md:py-4 flex flex-col justify-between">
        <div className="mx-auto w-full max-w-5xl">
          {/* TOP BAR */}
          <header className="mb-3 flex flex-wrap items-center justify-between gap-2">
            <button
              onClick={() => setIsExitDialogOpen(true)}
              className="flex items-center gap-2 font-black text-lg text-slate-900 hover:opacity-80 transition"
            >
              <span className="grid h-8 w-8 place-items-center rounded-xl bg-violet-600 text-white shadow-md shadow-violet-500/20">
                <Gamepad2 size={18} />
              </span>
              <span className="hidden sm:inline">Quiz Party</span>
            </button>

            <div className="flex items-center gap-2">
              {/* Nút thoát / chuyển màn hình */}
              <button
                onClick={() => setIsExitDialogOpen(true)}
                className="flex items-center gap-1.5 rounded-xl border border-gray-200 bg-white px-3 py-1.5 text-xs font-bold text-gray-700 shadow-sm hover:bg-gray-50 transition"
              >
                <span>Rời phòng</span>
              </button>

              {/* Sound Toggle */}
              <button
                onClick={toggleSound}
                title={isMuted ? "Bật âm thanh" : "Tắt âm thanh"}
                className="grid h-8 w-8 place-items-center rounded-xl border border-gray-200 bg-white text-gray-600 shadow-sm hover:bg-gray-50"
              >
                {isMuted ? <VolumeX size={16} /> : <Volume2 size={16} />}
              </button>

              {/* Room Code Badge */}
              <div className="flex items-center gap-1.5 rounded-xl border border-violet-100 bg-white px-3 py-1 text-xs font-bold shadow-sm">
                <span className="text-gray-400">Mã:</span>
                <span className="font-mono text-xs md:text-sm tracking-wider text-violet-700">
                  {state.room_code}
                </span>
                <button
                  onClick={copyRoomCode}
                  className="ml-0.5 text-violet-600 hover:text-violet-800"
                  title="Sao chép mã phòng"
                >
                  {copied ? <CheckCircle2 size={14} className="text-green-600" /> : <Copy size={14} />}
                </button>
              </div>
            </div>
          </header>

          {/* 1. LOBBY SCREEN */}
          {state.status === "lobby" && (
            <div className="grid gap-6 lg:grid-cols-[1.3fr_.7fr]">
              <section className="card p-6 md:p-8">
                <div className="mb-4 flex items-center justify-between">
                  <div className="flex items-center gap-2 text-xs font-black uppercase tracking-wider text-violet-600">
                    <Users size={16} /> PHÒNG CHỜ GAMESHOW
                  </div>
                  {state.room_name && (
                    <span className="rounded-full bg-violet-50 px-3 py-1 text-xs font-bold text-violet-700">
                      {state.room_name}
                    </span>
                  )}
                </div>

                <h1 className="text-3xl font-black text-slate-900 md:text-4xl">
                  Sẵn Sàng Cho Trận Đấu!
                </h1>
                <p className="mt-2 text-sm text-gray-500">
                  Hãy mời bạn bè nhập mã phòng để cùng tham gia tranh tài từ máy tính hoặc điện thoại.
                </p>

                {/* BIG ROOM CODE BANNER */}
                <div className="my-6 rounded-3xl bg-gradient-to-br from-violet-600 to-indigo-700 p-6 text-center text-white shadow-xl shadow-violet-500/20">
                  <div className="text-xs font-extrabold uppercase tracking-widest text-violet-200">
                    MÃ THAM GIA PHÒNG
                  </div>
                  <div className="my-2 font-mono text-4xl font-black tracking-[.25em] md:text-6xl text-amber-300">
                    {state.room_code}
                  </div>
                  <div className="mt-3 flex flex-wrap items-center justify-center gap-2.5">
                    <button
                      onClick={copyRoomCode}
                      className="inline-flex items-center gap-2 rounded-xl bg-white/20 px-4 py-2 text-xs font-bold text-white hover:bg-white/30 backdrop-blur-md"
                    >
                      {copied ? (
                        <>
                          <CheckCircle2 size={15} className="text-green-300" /> Đã sao chép mã!
                        </>
                      ) : (
                        <>
                          <Copy size={15} /> Sao chép mã phòng
                        </>
                      )}
                    </button>

                    <button
                      onClick={copyInviteLink}
                      className="inline-flex items-center gap-2 rounded-xl bg-amber-400 px-4 py-2 text-xs font-extrabold text-slate-950 shadow hover:bg-amber-300"
                    >
                      {copiedLink ? (
                        <>
                          <CheckCircle2 size={15} className="text-emerald-800" /> Đã chép Link mời!
                        </>
                      ) : (
                        <>
                          <Share2 size={15} /> Sao chép Link mời bạn bè
                        </>
                      )}
                    </button>
                  </div>
                </div>

                {/* PLAYERS LIST IN LOBBY */}
                <div className="mb-3 flex items-center justify-between">
                  <h2 className="font-extrabold text-slate-800">
                    Người chơi đã vào ({state.players.length}/50)
                  </h2>
                  <span className="flex items-center gap-1.5 text-xs text-green-600 font-bold">
                    <span className="h-2 w-2 rounded-full bg-green-500 animate-ping" />
                    Đồng bộ trực tiếp
                  </span>
                </div>

                <div className="grid gap-2.5 sm:grid-cols-2">
                  {state.players.map((p) => (
                    <div
                      key={p.id}
                      className="flex items-center gap-3 rounded-2xl border border-gray-100 bg-white p-3.5 shadow-sm transition hover:shadow-md"
                    >
                      <span className="grid h-11 w-11 shrink-0 place-items-center rounded-2xl bg-violet-50 text-2xl shadow-inner">
                        {p.avatar || "🦊"}
                      </span>
                      <div className="min-w-0 flex-1">
                        <div className="truncate font-extrabold text-sm text-slate-900">
                          {p.display_name}
                        </div>
                        <div className="text-[11px] font-semibold text-gray-400">
                          {p.is_host ? "Chủ phòng (Host)" : "Người chơi"}
                        </div>
                      </div>
                      {p.is_host && <Crown size={18} className="text-amber-500 shrink-0" />}
                    </div>
                  ))}
                </div>

                {/* START GAME BUTTON (HOST ONLY) */}
                {state.is_host ? (
                  <button
                    disabled={busy || state.players.length < 1}
                    onClick={() => hostAction("start_game")}
                    className="btn-primary mt-8 flex w-full items-center justify-center gap-2 text-base shadow-lg shadow-violet-600/30"
                  >
                    {busy ? (
                      <Loader2 className="animate-spin" size={20} />
                    ) : (
                      <>
                        <Zap size={20} className="text-amber-300" /> Bắt Đầu Gameshow Ngay
                        <ArrowRight size={18} />
                      </>
                    )}
                  </button>
                ) : (
                  <div className="mt-8 flex items-center justify-center gap-2 rounded-2xl bg-violet-50 p-4 text-center text-sm font-semibold text-violet-700">
                    <Loader2 className="animate-spin text-violet-600" size={18} />
                    Đang chờ chủ phòng bắt đầu trận đấu…
                  </div>
                )}
              </section>

              {/* LOBBY SIDEBAR: ROOM SETTINGS & RULES */}
              <aside className="space-y-4">
                <div className="card p-6 border-violet-200 bg-gradient-to-br from-violet-50/80 to-white">
                  <div className="mb-3 flex items-center gap-2 font-black text-violet-950 text-sm">
                    <Settings className="text-violet-600" size={18} /> Cấu Hình Ván Đấu Đã Chọn
                  </div>
                  <div className="space-y-2.5 text-xs">
                    <div className="flex items-center justify-between rounded-xl bg-white p-2.5 shadow-sm border border-violet-100">
                      <span className="text-gray-500 font-bold">Số lượng câu hỏi:</span>
                      <span className="font-black text-violet-700">{state.total_questions} câu (Random)</span>
                    </div>
                    <div className="flex items-center justify-between rounded-xl bg-white p-2.5 shadow-sm border border-violet-100">
                      <span className="text-gray-500 font-bold">Thời gian mỗi câu:</span>
                      <span className="font-black text-violet-700">{state.time_limit || 20} giây</span>
                    </div>
                    <div className="flex items-center justify-between rounded-xl bg-white p-2.5 shadow-sm border border-violet-100">
                      <span className="text-gray-500 font-bold">Mức độ khó:</span>
                      <span className="font-black text-violet-700">
                        {state.difficulty === "easy"
                          ? "Dễ"
                          : state.difficulty === "medium"
                          ? "Vừa"
                          : state.difficulty === "hard"
                          ? "Khó"
                          : "Tất cả mức độ"}
                      </span>
                    </div>
                    <div className="rounded-xl bg-white p-2.5 shadow-sm border border-violet-100">
                      <div className="text-gray-500 font-bold mb-1.5">
                        Chủ đề câu hỏi ({state.categories?.length || 12}):
                      </div>
                      <div className="flex flex-wrap gap-1">
                        {(state.categories && state.categories.length > 0
                          ? state.categories
                          : ["Tất cả 12 chủ đề"]
                        ).map((cat) => (
                          <span
                            key={cat}
                            className="rounded-lg bg-violet-100 px-2 py-0.5 text-[11px] font-extrabold text-violet-800"
                          >
                            {cat}
                          </span>
                        ))}
                      </div>
                    </div>
                  </div>
                </div>

                <div className="card p-6">
                  <div className="mb-4 flex items-center gap-2 font-black text-slate-900">
                    <Sparkles className="text-amber-500" size={20} /> Luật Chơi Gameshow
                  </div>
                  <ul className="space-y-3 text-xs text-gray-600 leading-relaxed">
                    <li className="flex items-start gap-2">
                      <span className="grid h-4 w-4 shrink-0 place-items-center rounded-full bg-violet-100 text-[10px] font-bold text-violet-700">1</span>
                      <span>Bộ câu hỏi được <b>random mới 100%</b> theo đúng chủ đề và độ khó đã chọn.</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="grid h-4 w-4 shrink-0 place-items-center rounded-full bg-violet-100 text-[10px] font-bold text-violet-700">2</span>
                      <span><b>Thưởng tốc độ:</b> Trả lời càng nhanh trong {state.time_limit || 20}s, điểm cộng càng cao!</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="grid h-4 w-4 shrink-0 place-items-center rounded-full bg-violet-100 text-[10px] font-bold text-violet-700">3</span>
                      <span>Hết thời gian hệ thống sẽ tự động khóa và công bố đáp án chính xác.</span>
                    </li>
                  </ul>
                </div>
              </aside>
            </div>
          )}

          {/* 2. IN-GAME QUESTION & REVEAL SCREEN */}
          {(state.status === "playing" || state.status === "reveal") && state.question && (
            <div className="grid gap-5 lg:grid-cols-[1fr_290px]">
              <section className="card overflow-hidden">
                {/* QUESTION HEADER BAR */}
                <div className="bg-gradient-to-r from-violet-700 via-indigo-700 to-purple-800 p-3 md:p-4 text-white">
                  <div className="flex flex-wrap items-center justify-between gap-1.5 text-xs font-black">
                    <div className="flex flex-wrap items-center gap-1.5">
                      <span className="rounded-full bg-white/15 px-2.5 py-0.5 text-[11px] uppercase tracking-wider backdrop-blur-md">
                        {state.question.category} · CÂU {state.current_index + 1}/{state.total_questions}
                      </span>
                      <span
                        className={`rounded-full px-2 py-0.5 text-[10px] uppercase tracking-wider ${
                          state.question.difficulty === "easy"
                            ? "bg-emerald-400/25 text-emerald-200 border border-emerald-300/30"
                            : state.question.difficulty === "hard"
                            ? "bg-rose-400/25 text-rose-200 border border-rose-300/30"
                            : "bg-amber-400/25 text-amber-200 border border-amber-300/30"
                        }`}
                      >
                        {state.question.difficulty === "easy"
                          ? "Dễ"
                          : state.question.difficulty === "hard"
                          ? "Khó"
                          : "Vừa"}
                      </span>
                      {state.question.is_double_points && (
                        <span className="rounded-full bg-amber-400 px-2 py-0.5 text-[10px] font-black text-slate-950 shadow-sm animate-pulse">
                          ⚡ x2 ĐIỂM
                        </span>
                      )}
                    </div>

                    {/* COUNTDOWN TIMER BADGE */}
                    <div
                      className={`flex items-center gap-1 rounded-full px-2.5 py-0.5 font-mono text-xs md:text-sm shadow-md transition ${
                        seconds <= 5 && state.status === "playing"
                          ? "bg-red-500 text-white animate-pulse"
                          : "bg-white/20 text-white"
                      }`}
                    >
                      <Clock3 size={14} />
                      {state.status === "playing"
                        ? `${seconds}s`
                        : "Đã chốt"}
                    </div>
                  </div>

                  {/* SMOOTH TIME PROGRESS BAR */}
                  <div className="mt-2.5 h-1.5 w-full overflow-hidden rounded-full bg-black/25">
                    <div
                      className={`h-full rounded-full transition-all duration-1000 ${
                        seconds <= 5
                          ? "bg-rose-400"
                          : seconds <= 10
                          ? "bg-amber-300"
                          : "bg-emerald-400"
                      }`}
                      style={{ width: `${timeProgress}%` }}
                    />
                  </div>

                  <div className="mt-1 flex items-center justify-between text-[10px] text-white/70">
                    <span>Tiến trình: {Math.round(questionProgress)}% ván đấu</span>
                    <span>
                      Đã trả lời: {state.answered_count} / {state.players.length} người
                    </span>
                  </div>
                </div>

                {/* QUESTION CONTENT */}
                <div className="p-3 md:p-5">
                  <h1 className="mx-auto max-w-2xl text-center text-sm md:text-lg font-bold leading-snug tracking-tight text-slate-900">
                    {state.question.prompt}
                  </h1>

                  {/* MEDIA VIEWER (IMAGE / AUDIO / YOUTUBE) */}
                  <MediaViewer
                    type={state.question.question_type}
                    imageUrl={state.question.image_url}
                    audioUrl={state.question.audio_url}
                    youtubeVideoId={state.question.youtube_video_id}
                    category={state.question.category}
                    prompt={state.question.prompt}
                    options={state.question.options}
                  />

                  {/* 4 KAHOOT-STYLE ANSWER BUTTONS */}
                  <div className="mt-3 grid grid-cols-2 gap-2 md:gap-3">
                    {state.question.options.map((option, i) => {
                      const style = answerStyles[i % answerStyles.length];
                      const isCorrect =
                        state.status === "reveal" &&
                        state.question?.correct_index === i;
                      const isChosen = selected === i;
                      const isWrong =
                        state.status === "reveal" &&
                        isChosen &&
                        state.question?.correct_index !== i;

                      return (
                        <button
                          key={i}
                          disabled={state.status !== "playing" || selected !== null || busy}
                          onClick={() => handleAnswer(i)}
                          className={`relative flex min-h-[52px] md:min-h-[64px] items-center gap-2.5 rounded-xl p-2.5 md:p-3.5 text-left font-bold shadow-sm transition-all active:scale-95 ${
                            isCorrect
                              ? "bg-emerald-600 text-white ring-4 ring-emerald-300 scale-[1.01]"
                              : isWrong
                              ? "bg-rose-600 text-white opacity-90 ring-4 ring-rose-300"
                              : isChosen
                              ? "bg-violet-700 text-white ring-4 ring-violet-300"
                              : `${style.bg} ${style.hover} ${style.text}`
                          } disabled:cursor-not-allowed`}
                        >
                          <span className="grid h-7 w-7 md:h-8 md:w-8 shrink-0 place-items-center rounded-lg bg-black/20 text-xs md:text-sm font-black">
                            {style.shape}
                          </span>
                          <span className="flex-1 text-xs md:text-sm leading-snug line-clamp-2">
                            {option}
                          </span>
                          {isCorrect && (
                            <CheckCircle2 size={20} className="text-white shrink-0 animate-bounce" />
                          )}
                          {isWrong && (
                            <XCircle size={20} className="text-white shrink-0" />
                          )}
                        </button>
                      );
                    })}
                  </div>

                  {/* IN-GAME STATUS NOTICE */}
                  {state.status === "playing" && (
                    <div className="mt-2 text-center text-[11px] font-semibold text-gray-500">
                      {selected !== null ? (
                        <span className="text-violet-700 font-bold flex items-center justify-center gap-1">
                          <CheckCircle2 size={14} /> Bạn đã chọn câu trả lời! Đang chờ đối thủ…
                        </span>
                      ) : (
                        "Hãy nhanh tay chọn đáp án chính xác để nhận thưởng tốc độ!"
                      )}
                    </div>
                  )}

                  {/* REVEAL EXPLANATION & AUTO-TRANSITION BANNER */}
                  {state.status === "reveal" && (
                    <div className="mt-3 rounded-xl border border-emerald-200 bg-emerald-50 p-2.5 md:p-3 text-xs text-emerald-950">
                      <div className="flex flex-wrap items-center justify-between gap-1.5 font-black text-emerald-900">
                        <span className="flex items-center gap-1.5">
                          <CheckCircle2 size={16} className="text-emerald-600 shrink-0" />
                          Đáp án đúng: {state.question.options[state.question.correct_index ?? 0]}
                        </span>
                        {autoNextCountdown !== null && (
                          <span className="rounded-full bg-emerald-200 px-2 py-0.5 text-[11px] font-black text-emerald-900 animate-pulse">
                            Tự chuyển câu sau {autoNextCountdown}s ⏳
                          </span>
                        )}
                      </div>
                      {state.question.explanation && (
                        <p className="mt-1 text-emerald-800/90 leading-tight">
                          <b>Giải thích:</b> {state.question.explanation}
                        </p>
                      )}
                    </div>
                  )}

                  {/* HOST CONTROLS */}
                  {state.is_host && (
                    <div className="mt-3 flex gap-2">
                      {state.status === "playing" && (
                        <button
                          disabled={busy}
                          onClick={() => hostAction("reveal_answer")}
                          className="btn-secondary w-full text-xs font-black py-2.5"
                        >
                          Chốt Câu Hỏi & Mở Đáp Án
                        </button>
                      )}

                      {state.status === "reveal" && (
                        <button
                          disabled={busy}
                          onClick={() => hostAction("next_question")}
                          className="btn-primary w-full text-xs font-black py-2.5 flex items-center justify-center gap-1.5"
                        >
                          {state.current_index + 1 >= state.total_questions ? (
                            <>Xem Kết Quả Chung Cuộc <Trophy size={16} /></>
                          ) : (
                            <>Câu Tiếp Theo (Ngay Lập Tức) <ArrowRight size={16} /></>
                          )}
                        </button>
                      )}
                    </div>
                  )}
                </div>
              </section>

              {/* LIVE LEADERBOARD SIDEBAR */}
              <aside className="card h-fit p-5">
                <div className="mb-4 flex items-center justify-between border-b border-gray-100 pb-3">
                  <h2 className="flex items-center gap-2 text-sm font-black text-slate-900">
                    <Trophy className="text-amber-500" size={18} /> Điểm Số
                  </h2>
                  <span className="text-[11px] font-bold text-gray-400">
                    {state.players.length} người
                  </span>
                </div>

                <div className="space-y-2.5">
                  {sortedPlayers.map((p, idx) => (
                    <div
                      key={p.id}
                      className="flex items-center gap-2.5 rounded-xl p-2 transition hover:bg-gray-50"
                    >
                      <span
                        className={`grid h-7 w-7 shrink-0 place-items-center rounded-lg text-xs font-black ${
                          idx === 0
                            ? "bg-amber-400 text-amber-950 shadow-sm"
                            : idx === 1
                            ? "bg-slate-300 text-slate-900"
                            : idx === 2
                            ? "bg-amber-700 text-white"
                            : "bg-gray-100 text-gray-500"
                        }`}
                      >
                        {idx + 1}
                      </span>
                      <span className="text-xl shrink-0">{p.avatar || "🦊"}</span>
                      <div className="min-w-0 flex-1">
                        <div className="truncate text-xs font-bold text-slate-900">
                          {p.display_name}
                        </div>
                        <div className="text-[10px] text-gray-400">
                          {p.has_answered ? (
                            <span className="text-emerald-600 font-semibold">✓ Đã trả lời</span>
                          ) : (
                            "Đang suy nghĩ…"
                          )}
                        </div>
                      </div>
                      <div className="text-right">
                        <div className="font-black text-violet-700 text-xs">
                          {p.score}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </aside>
            </div>
          )}

          {/* 3. PODIUM CEREMONY (GAME FINISHED) */}
          {state.status === "finished" && (
            <PodiumCeremony
              players={state.players}
              isHost={state.is_host}
              onRestart={() => {
                if (state.is_host) {
                  setSelected(null);
                  hostAction("restart_game");
                } else {
                  setScreen("home");
                  setState(null);
                  setSelected(null);
                }
              }}
            />
          )}

          {error && (
            <div className="mt-4 rounded-2xl bg-red-50 p-3.5 text-xs font-bold text-red-700 flex items-center gap-2">
              <XCircle size={16} /> {error}
            </div>
          )}

          {/* EXIT DIALOG: TRỞ VỀ LOBBY HOẶC MENU CHÍNH */}
          {isExitDialogOpen && (
            <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4 backdrop-blur-sm">
              <div className="relative w-full max-w-sm rounded-2xl bg-white p-5 shadow-2xl">
                <h3 className="text-base font-black text-slate-900">
                  Tùy chọn rời phòng
                </h3>
                <p className="mt-1 text-xs text-gray-500">
                  Bạn muốn quay về phòng chờ (Lobby) hay trở về trang chủ menu chính?
                </p>

                <div className="mt-4 space-y-2">
                  <button
                    onClick={() => {
                      setIsExitDialogOpen(false);
                      if (state.is_host) {
                        hostAction("restart_game");
                      } else {
                        // Người chơi quay về trạng thái lobby
                        setState((prev) => (prev ? { ...prev, status: "lobby" } : null));
                      }
                      setSelected(null);
                    }}
                    className="flex w-full items-center justify-center gap-2 rounded-xl bg-violet-600 py-2.5 text-xs font-extrabold text-white shadow hover:bg-violet-700"
                  >
                    <span>🏠 Trở về phòng chờ (Lobby)</span>
                  </button>

                  <button
                    onClick={() => {
                      setIsExitDialogOpen(false);
                      setScreen("home");
                      setState(null);
                      setSelected(null);
                    }}
                    className="flex w-full items-center justify-center gap-2 rounded-xl border border-gray-200 bg-gray-50 py-2.5 text-xs font-bold text-gray-700 hover:bg-gray-100"
                  >
                    <span>🚪 Trở về menu chính (Thoát game)</span>
                  </button>

                  <button
                    onClick={() => setIsExitDialogOpen(false)}
                    className="w-full text-center text-xs font-semibold text-gray-400 hover:text-gray-600 py-1"
                  >
                    Hủy bỏ
                  </button>
                </div>
              </div>
            </div>
          )}

          <footer className="mt-8 text-center text-xs text-gray-400">
            Quiz Party · Nền tảng Gameshow trực tuyến nhiều người chơi thời gian thực
          </footer>
        </div>
      </main>
    );
  }

  /* =========================================================================
     HOME SCREEN (LOBBY / JOIN / CREATE)
     ========================================================================= */
  return (
    <main className="min-h-screen overflow-hidden px-4 py-6 md:px-8">
      <div className="mx-auto max-w-6xl">
        {/* NAV BAR */}
        <nav className="flex items-center justify-between">
          <div className="flex items-center gap-2 text-xl font-black text-slate-900">
            <span className="grid h-10 w-10 place-items-center rounded-2xl bg-violet-600 text-white shadow-md shadow-violet-500/20">
              <Gamepad2 size={22} />
            </span>
            <span>Quiz Party</span>
          </div>

          <div className="flex items-center gap-3">
            <button
              onClick={() => setIsAdminOpen(true)}
              className="flex items-center gap-1.5 rounded-xl border border-gray-200 bg-white px-3.5 py-2 text-xs font-bold text-gray-700 shadow-sm hover:bg-gray-50 transition"
            >
              <Database size={15} className="text-violet-600" />
              <span>Ngân Hàng Câu Hỏi</span>
            </button>
            <button
              onClick={toggleSound}
              title={isMuted ? "Bật âm thanh" : "Tắt âm thanh"}
              className="grid h-9 w-9 place-items-center rounded-xl border border-gray-200 bg-white text-gray-600 shadow-sm hover:bg-gray-50"
            >
              {isMuted ? <VolumeX size={16} /> : <Volume2 size={16} />}
            </button>
          </div>
        </nav>

        {/* HERO GAMESHOW BANNER */}
        <section className="relative mt-8 overflow-hidden rounded-[36px] bg-gradient-to-br from-[#1e1b4b] via-[#3b198a] to-[#6366f1] px-6 py-12 text-center text-white shadow-2xl md:mt-12 md:px-12 md:py-16">
          <div className="pattern absolute inset-0 opacity-30" />
          <div className="relative mx-auto max-w-3xl">
            <div className="mx-auto mb-4 flex w-fit items-center gap-2 rounded-full border border-amber-400/30 bg-amber-400/10 px-4 py-1.5 text-xs font-black tracking-wide text-amber-300">
              <Sparkles size={15} /> GAMESHOW TRỰC TUYẾN THẾ HỆ MỚI
            </div>
            <h1 className="text-4xl font-black leading-tight tracking-tight md:text-6xl">
              Đấu Trí Đỉnh Cao Cùng <span className="text-amber-300">Quiz Party</span>
            </h1>
            <p className="mx-auto mt-4 max-w-xl text-sm leading-6 text-purple-100/80 md:text-base">
              Hơn 500 câu hỏi chất lượng cao qua 12 chủ đề bắt buộc: Doraemon, Conan, K-Drama, V-Pop, K-Pop, Đoán tên bài hát qua video/audio, Phim ảnh và Địa lý.
            </p>

            <div className="mt-8 flex flex-wrap justify-center gap-3 text-xs font-bold text-white/90">
              <span className="rounded-full bg-white/10 px-4 py-2 backdrop-blur-md">
                <Smartphone className="mr-1.5 inline" size={14} /> Chơi trên Điện thoại
              </span>
              <span className="rounded-full bg-white/10 px-4 py-2 backdrop-blur-md">
                <Laptop className="mr-1.5 inline" size={14} /> Màn hình Laptop
              </span>
              <span className="rounded-full bg-white/10 px-4 py-2 backdrop-blur-md">
                <Users className="mr-1.5 inline" size={14} /> Tối đa 50 Người/Phòng
              </span>
            </div>
          </div>
        </section>

        {/* ACTION CARDS: CREATE & JOIN */}
        <section className="mx-auto -mt-6 grid max-w-4xl gap-6 md:grid-cols-2">
          {/* TẠO PHÒNG MỚI */}
          <div className="card relative z-10 p-6 md:p-8">
            <div className="mb-4 grid h-12 w-12 place-items-center rounded-2xl bg-violet-100 text-violet-700 shadow-inner">
              <Plus size={26} />
            </div>
            <h2 className="text-2xl font-black text-slate-900">Tạo Phòng Mới</h2>
            <p className="mb-6 mt-1 text-xs text-gray-500">
              Chọn chủ đề yêu thích, thiết lập số lượng câu hỏi (lên đến 50 câu) và làm chủ phòng.
            </p>
            <button
              onClick={() => setIsCreateModalOpen(true)}
              className="btn-primary w-full flex items-center justify-center gap-2 py-3.5 text-sm"
            >
              <Settings size={18} /> Thiết Lập & Tạo Phòng
            </button>
          </div>

          {/* THAM GIA PHÒNG */}
          <div className="card relative z-10 p-6 md:p-8">
            <div className="mb-4 grid h-12 w-12 place-items-center rounded-2xl bg-amber-100 text-amber-700 shadow-inner">
              <LogIn size={26} />
            </div>
            <h2 className="text-2xl font-black text-slate-900">Tham Gia Phòng</h2>
            <p className="mb-4 mt-1 text-xs text-gray-500">
              Nhập mã phòng do bạn bè chia sẻ để bước vào ván đấu ngay.
            </p>

            <div className="space-y-3">
              <div>
                <label className="mb-1 block text-xs font-bold text-gray-700">
                  Tên hiển thị của bạn
                </label>
                <div className="flex gap-2">
                  <input
                    className="field py-2.5 text-xs"
                    placeholder="VD: Tuấn Minh"
                    maxLength={24}
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                  />
                  <select
                    value={joinAvatar}
                    onChange={(e) => setJoinAvatar(e.target.value)}
                    className="rounded-xl border border-gray-200 bg-white px-2.5 py-2 text-xl outline-none"
                    title="Chọn avatar đại diện"
                  >
                    {AVATAR_OPTIONS.map((a) => (
                      <option key={a.emoji} value={a.emoji}>
                        {a.emoji} {a.label}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <div>
                <label className="mb-1 block text-xs font-bold text-gray-700">
                  Mã phòng (6 ký tự)
                </label>
                <input
                  className="field py-2.5 text-xs uppercase tracking-widest font-mono"
                  placeholder="VD: 180EE5"
                  maxLength={8}
                  value={roomCode}
                  onChange={(e) => setRoomCode(e.target.value.toUpperCase())}
                />
              </div>

              <button
                disabled={busy}
                onClick={handleJoinRoom}
                className="btn-primary w-full flex items-center justify-center gap-2 py-3.5 text-sm bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white shadow-md shadow-amber-500/20"
              >
                {busy ? (
                  <Loader2 className="animate-spin" size={18} />
                ) : (
                  <>
                    <LogIn size={18} /> Tham Gia Ngay
                  </>
                )}
              </button>
            </div>
          </div>
        </section>

        {error && (
          <div className="mx-auto mt-6 max-w-4xl rounded-2xl bg-red-50 p-3.5 text-xs font-bold text-red-700 flex items-center gap-2">
            <XCircle size={16} /> {error}
          </div>
        )}

        {/* DATABASE BANNER (IF SUPABASE NOT CONFIGURED) */}
        {!isSupabaseConfigured && (
          <div className="mx-auto mt-6 max-w-4xl rounded-2xl border border-amber-200 bg-amber-50 p-4 text-xs text-amber-900 leading-relaxed">
            <b>Lưu ý cấu hình cơ sở dữ liệu:</b> Bạn cần cấu hình URL và Anon Key của Supabase trong file <code>.env.local</code> và chạy file <code>supabase/schema.sql</code> để bật phòng chơi trực tuyến.
          </div>
        )}

        {/* 12 THEMES SHOWCASE */}
        <section className="mx-auto mt-16 max-w-5xl">
          <div className="text-center">
            <div className="text-xs font-black uppercase tracking-wider text-violet-600">
              Chủ đề phong phú
            </div>
            <h2 className="mt-1 text-2xl font-black text-slate-900 md:text-3xl">
              12 Nhóm Chủ Đề Hấp Dẫn Bậc Nhất
            </h2>
          </div>

          <div className="mt-8 grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
            {[
              { title: "Doraemon", icon: "🐱", desc: "Bảo bối & nhân vật" },
              { title: "Conan", icon: "🔍", desc: "Áo Đen & vụ án" },
              { title: "Phim Hàn Quốc", icon: "🎬", desc: "K-Drama kinh điển" },
              { title: "Âm nhạc Việt Nam", icon: "🎤", desc: "V-Pop & Đoán bài hát" },
              { title: "K-Pop", icon: "⭐", desc: "BTS, BLACKPINK..." },
              { title: "US-UK", icon: "🎸", desc: "Taylor, Michael Jackson" },
              { title: "Địa lý cơ bản", icon: "🌍", desc: "Thủ đô, kỳ quan thế giới" },
              { title: "Anime tuổi thơ", icon: "⚡", desc: "Pokemon, Naruto, One Piece" },
              { title: "Tuổi thơ Trung Quốc", icon: "🐒", desc: "Tây Du Ký, Kiếm hiệp" },
              { title: "Hoạt hình Mỹ", icon: "🧀", desc: "Tom & Jerry, Ben 10" },
              { title: "Đoán tên ca sĩ", icon: "👤", desc: "Nhận diện qua ảnh & hit" },
              { title: "Phim Mỹ & Việt Nam", icon: "🍿", desc: "Marvel, rạp chiếu kinh điển" }
            ].map((theme, i) => (
              <div
                key={i}
                className="rounded-2xl border border-gray-100 bg-white p-4 shadow-sm hover:shadow-md transition"
              >
                <div className="text-2xl mb-1">{theme.icon}</div>
                <div className="font-extrabold text-xs text-slate-900">{theme.title}</div>
                <div className="text-[11px] text-gray-400 mt-0.5">{theme.desc}</div>
              </div>
            ))}
          </div>
        </section>

        {/* FOOTER */}
        <footer className="mt-16 border-t border-gray-200/60 pb-8 pt-8 text-center text-xs text-gray-400">
          <p>© 2026 Quiz Party · Nền tảng Gameshow trực tuyến tương tác cao trên mọi thiết bị</p>
        </footer>
      </div>

      {/* ROOM CREATION MODAL */}
      <RoomCreationModal
        isOpen={isCreateModalOpen}
        onClose={() => setIsCreateModalOpen(false)}
        onSubmit={handleCreateRoom}
        busy={busy}
      />

      {/* ADMIN CMS QUESTION MANAGER MODAL */}
      {isAdminOpen && (
        <AdminQuestionManager onClose={() => setIsAdminOpen(false)} />
      )}
    </main>
  );
}
