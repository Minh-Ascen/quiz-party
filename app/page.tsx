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
  X,
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
  const [liveScore, setLiveScore] = useState(1000);
  const [frozenScore, setFrozenScore] = useState<number | null>(null);
  const [musicInput, setMusicInput] = useState("");
  const [musicFeedback, setMusicFeedback] = useState<{ type: "success" | "wrong"; message: string } | null>(null);
  const [musicSubmitted, setMusicSubmitted] = useState(false);
  const [showLeaderboard, setShowLeaderboard] = useState(false);
  const [revealStep, setRevealStep] = useState<"answer" | "scoreboard">("answer");
  const [scoreboardStage, setScoreboardStage] = useState<"initial" | "points" | "ranked">("initial");
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

  // Timer countdown per question (synchronized with question time_limit: 15s / 20s / 30s)
  useEffect(() => {
    if (!state || state.status !== "playing") return;
    const limit = state.question?.time_limit || state.time_limit || 20;
    const startedMs = state.current_question_started_at
      ? new Date(state.current_question_started_at).getTime()
      : Date.now();
    const elapsed = Math.max(0, (Date.now() - startedMs) / 1000);
    const initialRemaining = Math.max(1, Math.ceil(limit - elapsed));

    setSeconds(initialRemaining);
    setQuestionStartTime(Date.now());

    const timer = window.setInterval(() => {
      setSeconds((s) => {
        if (s <= 1) {
          window.clearInterval(timer);
          // Tự động mở đáp án khi đếm ngược chạm mốc 0 giây
          if (roomCode) {
            const token = sessionStorage.getItem(`qp-token-${roomCode}`);
            call("reveal_answer", { p_code: roomCode, p_player_token: token })
              .then(() => refresh(roomCode, token || undefined))
              .catch(() => {});
          }
          return 0;
        }
        if (s <= 5) {
          soundFX.playTick();
        }
        return s - 1;
      });
    }, 1000);

    return () => window.clearInterval(timer);
  }, [state?.current_index, state?.status, state?.question?.id, state?.question?.time_limit, state?.time_limit, roomCode, call, refresh]);

  // Live score countdown từ 1000 trở xuống theo thời gian nếu người chơi trả lời trễ
  useEffect(() => {
    if (state?.status === "playing") {
      const timeLimit = state.time_limit || 20;
      const basePoints = state.question?.points || 1000;
      const isDouble = Boolean(state.question?.is_double_points);
      const maxPts = isDouble ? basePoints * 2 : basePoints;

      setLiveScore(maxPts);
      const startMs = Date.now();
      const interval = window.setInterval(() => {
        const elapsed = (Date.now() - startMs) / 1000;
        const remaining = Math.max(0.1, 1 - elapsed / timeLimit);
        const pts = Math.round(maxPts * remaining);
        setLiveScore(pts);
        if (elapsed >= timeLimit) {
          window.clearInterval(interval);
        }
      }, 100);

      return () => window.clearInterval(interval);
    }
  }, [state?.status, state?.current_index, state?.time_limit, state?.question?.points, state?.question?.is_double_points]);

  // Reset selected answer & music input on new question
  useEffect(() => {
    setSelected(null);
    setFrozenScore(null);
    setMusicInput("");
    setMusicFeedback(null);
    setMusicSubmitted(false);
  }, [state?.current_index]);

  // Reset selected answer when entering playing state
  useEffect(() => {
    if (state?.status === "playing") {
      setSelected(null);
      setFrozenScore(null);
      setMusicInput("");
      setMusicFeedback(null);
      setMusicSubmitted(false);
    }
  }, [state?.status]);

  // Play sound on answer reveal -> Hiển thị Xếp hạng (Scoreboard) với hiệu ứng +Điểm & Thăng hạng -> Tự động chuyển câu
  useEffect(() => {
    if (state?.status === "reveal") {
      setRevealStep("answer");
      setScoreboardStage("initial");
      if (state.question && selected !== null) {
        if (selected === state.question.correct_index) {
          soundFX.playCorrect();
        } else {
          soundFX.playWrong();
        }
      }

      // 1. Sau 2.0 giây: Chuyển sang màn hình Bảng Xếp Hạng (giai đoạn initial: giữ nguyên hạng cũ)
      const toScoreboardTimeout = window.setTimeout(() => {
        setRevealStep("scoreboard");
        setScoreboardStage("initial");
        soundFX.playTransition();
      }, 2000);

      // 2. Sau 2.8 giây (trong scoreboard): Nổ hiệu ứng +Điểm (+1000)
      const pointsAnimTimeout = window.setTimeout(() => {
        setScoreboardStage("points");
      }, 2800);

      // 3. Sau 4.2 giây (trong scoreboard): Hiệu ứng thăng hạng nhảy vị trí (🚀 +X Hạng)
      const rankUpTimeout = window.setTimeout(() => {
        setScoreboardStage("ranked");
      }, 4200);

      // 4. Sau 7.5 giây (hoàn tất hiển thị bảng xếp hạng): Tự động chuyển qua câu tiếp theo
      const autoNextTimeout = window.setTimeout(() => {
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
      }, 7500);

      return () => {
        window.clearTimeout(toScoreboardTimeout);
        window.clearTimeout(pointsAnimTimeout);
        window.clearTimeout(rankUpTimeout);
        window.clearTimeout(autoNextTimeout);
      };
    } else {
      setRevealStep("answer");
      setScoreboardStage("initial");
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

  // Player submits answer with speed measurement (Khóa điểm tức thì khi chọn)
  const handleAnswer = async (index: number) => {
    if (!state?.question || selected !== null || state.status !== "playing") return;
    soundFX.playSelect();
    setSelected(index);
    setFrozenScore(liveScore);
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
      setFrozenScore(null);
      setError(e instanceof Error ? e.message : "Gửi câu trả lời thất bại.");
    } finally {
      setBusy(false);
    }
  };

  // Player submits music text guess (Gõ chữ Unikey đoán tên bài hát - Khóa điểm khi gõ đúng)
  const handleMusicSubmit = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    if (!musicInput.trim() || musicSubmitted || busy || !roomCode || state?.status !== "playing") return;
    setBusy(true);
    setError("");

    try {
      const token = sessionStorage.getItem(`qp-token-${roomCode}`);
      const elapsed = Math.max(0.1, (Date.now() - questionStartTime) / 1000);

      const res = await fetch("/api/quiz", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "submit_answer",
          p_code: roomCode,
          p_player_token: token,
          p_text_answer: musicInput.trim(),
          p_client_elapsed: elapsed
        })
      });

      const json = await res.json();
      if (json.wrongTry) {
        soundFX.playWrong();
        setMusicFeedback({ type: "wrong", message: "Chưa chính xác, thử lại nhé!" });
      } else if (json.data) {
        soundFX.playCorrect();
        setMusicSubmitted(true);
        const pts = json.data.my_answer?.points_awarded || liveScore;
        setFrozenScore(pts);
        setMusicFeedback({ type: "success", message: `🎉 Chính xác! Bạn nhận được +${pts} điểm!` });
        setState(json.data);
        await broadcast();
      }
    } catch {
      // Ignore network errors
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

  // Dữ liệu bảng xếp hạng giữa các câu với animation +Điểm và Thăng hạng
  const scoreboardData = useMemo(() => {
    const players = state?.players || [];
    const before = [...players].sort(
      (a, b) => (b.previous_score ?? b.score) - (a.previous_score ?? a.score)
    );
    const after = [...players].sort((a, b) => b.score - a.score);

    const prevRankMap = new Map<string, number>();
    before.forEach((p, idx) => prevRankMap.set(p.id, idx));

    const afterRankMap = new Map<string, number>();
    after.forEach((p, idx) => afterRankMap.set(p.id, idx));

    const list = scoreboardStage === "ranked" ? after : before;

    return list.map((p) => {
      const prevRank = prevRankMap.get(p.id) ?? 0;
      const currRank = afterRankMap.get(p.id) ?? 0;
      const rankGain = prevRank - currRank;
      const displayScore =
        scoreboardStage === "initial"
          ? (p.previous_score ?? p.score)
          : p.score;
      const ptsEarned = p.last_points || 0;

      return {
        ...p,
        displayScore,
        ptsEarned,
        rankGain
      };
    });
  }, [state?.players, scoreboardStage]);

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

  const pastelStyles = [
    {
      bg: "bg-[#a7f3d0]",
      hover: "hover:bg-[#86efac]",
      border: "border-2 border-emerald-950 shadow-[0_4px_0_#065f46]",
      text: "text-emerald-950",
      letter: "A"
    },
    {
      bg: "bg-[#d9f99d]",
      hover: "hover:bg-[#bef264]",
      border: "border-2 border-lime-950 shadow-[0_4px_0_#4d7c0f]",
      text: "text-lime-950",
      letter: "B"
    },
    {
      bg: "bg-[#fed7aa]",
      hover: "hover:bg-[#fdba74]",
      border: "border-2 border-amber-950 shadow-[0_4px_0_#b45309]",
      text: "text-amber-950",
      letter: "C"
    },
    {
      bg: "bg-[#fecdd3]",
      hover: "hover:bg-[#fca5a5]",
      border: "border-2 border-rose-950 shadow-[0_4px_0_#be123c]",
      text: "text-rose-950",
      letter: "D"
    }
  ];

  const isMusicQuestion = Boolean(
    state?.question && (
      state.question.category === "Âm nhạc Việt Nam" ||
      state.question.category === "K-Pop" ||
      state.question.category === "US-UK" ||
      state.question.question_type === "AUDIO_GUESS" ||
      Boolean(state.question.youtube_video_id)
    )
  );

  const isPlayingOrReveal = Boolean(
    state &&
    (state.status === "playing" || state.status === "reveal") &&
    state.question
  );

  const myPlayer = useMemo(
    () => state?.players.find((p) => p.id === state.my_player_id),
    [state?.players, state?.my_player_id]
  );

  const myRank = useMemo(
    () => sortedPlayers.findIndex((p) => p.id === state?.my_player_id),
    [sortedPlayers, state?.my_player_id]
  );

  const getOrdinal = (n: number): string => {
    if (n <= 0) return "1st";
    const s = ["th", "st", "nd", "rd"];
    const v = n % 100;
    return n + (s[(v - 20) % 10] || s[v] || s[0]);
  };

  /* =========================================================================
     IN-GAME / ROOM SCREEN
     ========================================================================= */
  if (screen === "room" && state) {
    const bgContainerClass = isPlayingOrReveal
      ? isMusicQuestion
        ? "game-pattern-music text-white"
        : "game-pattern-quiz text-white"
      : "bg-[#f3f2f8] text-slate-900";

    return (
      <main className={`min-h-screen px-2 py-2 md:px-5 md:py-3 flex flex-col justify-between transition-colors duration-300 ${bgContainerClass}`}>
        <div className="mx-auto w-full max-w-7xl flex-1 flex flex-col justify-between">
          {/* TOP BAR */}
          <header className={`mb-2 flex flex-wrap items-center justify-between gap-2 pb-2 ${isPlayingOrReveal ? "border-b border-white/10" : "border-b border-gray-200"}`}>
            <div className="flex items-center gap-2.5">
              <button
                onClick={() => setIsExitDialogOpen(true)}
                className="flex items-center gap-2 font-black text-lg hover:opacity-85 transition"
              >
                <span className="grid h-8 w-8 place-items-center rounded-xl bg-gradient-to-tr from-amber-400 to-rose-500 text-slate-950 font-black shadow-md">
                  Q
                </span>
                <span className={`font-black tracking-wider ${isPlayingOrReveal ? "bg-gradient-to-r from-amber-300 via-pink-300 to-cyan-300 bg-clip-text text-transparent" : "text-slate-900"}`}>
                  QUIZ PARTY
                </span>
              </button>

              {/* PIN ROOM CODE */}
              <div className={`flex items-center gap-1 rounded-full px-3 py-1 text-xs font-mono font-bold ${isPlayingOrReveal ? "bg-white/10 text-white border border-white/15" : "bg-white text-violet-700 border border-violet-100"}`}>
                <span className={isPlayingOrReveal ? "text-white/60" : "text-gray-400"}>PIN</span>
                <span className="font-extrabold tracking-wider">{state.room_code}</span>
                <button onClick={copyRoomCode} title="Sao chép PIN" className="ml-0.5 hover:opacity-80">
                  {copied ? <CheckCircle2 size={13} className="text-green-400" /> : <Copy size={13} />}
                </button>
              </div>

              {/* CATEGORY TITLE (IN PLAYING/REVEAL) */}
              {isPlayingOrReveal && state.question && (
                <div className="hidden md:flex items-center gap-1.5 rounded-full bg-white/10 px-3 py-1 text-xs font-bold text-white/90 border border-white/15">
                  <span>{state.question.category}</span>
                </div>
              )}

              {/* PLAYER ANSWERED COUNT */}
              {isPlayingOrReveal && (
                <div className="flex items-center gap-1 text-xs font-bold text-white/80">
                  <Users size={14} className="text-cyan-300" />
                  <span>{state.answered_count} ({state.players.length})</span>
                </div>
              )}
            </div>

            <div className="flex items-center gap-2">
              {/* SLIDE COUNTER (SLIDE 2/22) */}
              {isPlayingOrReveal && (
                <div className="font-mono text-xs md:text-sm font-black text-white/95 bg-white/10 px-3 py-1 rounded-xl border border-white/15">
                  Slide {state.current_index + 1}/{state.total_questions}
                </div>
              )}

              {/* BXH LEADERBOARD BUTTON */}
              {isPlayingOrReveal && (
                <button
                  onClick={() => setShowLeaderboard(true)}
                  title="Xem Bảng Xếp Hạng"
                  className="flex items-center gap-1.5 rounded-xl border border-white/20 bg-white/10 px-2.5 py-1 text-xs font-bold text-white shadow-sm hover:bg-white/20 transition"
                >
                  <Trophy size={14} className="text-amber-400" />
                  <span className="hidden sm:inline">BXH</span>
                </button>
              )}

              {/* Sound Toggle */}
              <button
                onClick={toggleSound}
                title={isMuted ? "Bật âm thanh" : "Tắt âm thanh"}
                className={`grid h-8 w-8 place-items-center rounded-xl border shadow-sm ${isPlayingOrReveal ? "border-white/20 bg-white/10 text-white hover:bg-white/20" : "border-gray-200 bg-white text-gray-600 hover:bg-gray-50"}`}
              >
                {isMuted ? <VolumeX size={15} /> : <Volume2 size={15} />}
              </button>

              {/* Nút thoát / Rời phòng */}
              <button
                onClick={() => setIsExitDialogOpen(true)}
                className={`flex items-center gap-1.5 rounded-xl border px-3 py-1 text-xs font-bold transition ${isPlayingOrReveal ? "border-white/20 bg-white/10 text-rose-200 hover:bg-rose-500/20" : "border-gray-200 bg-white text-gray-700 hover:bg-gray-50"}`}
              >
                <span>Rời phòng</span>
              </button>
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

          {/* 2. IN-GAME QUESTION & REVEAL SCREEN (GIAO DIỆN THEO HÌNH THIẾT KẾ QUIZ.COM) */}
          {isPlayingOrReveal && state.question && (
            <div className="flex-1 flex flex-col justify-between my-auto w-full max-w-6xl mx-auto py-2">
              {/* --- KHI Ở TRẠNG THÁI HIỂN THỊ XẾP HẠNG GIỮA CÁC CÂU (SCOREBOARD THEO ĐÚNG HÌNH 3) --- */}
              {state.status === "reveal" && revealStep === "scoreboard" ? (
                <div className="flex-1 flex flex-col justify-between my-auto w-full max-w-3xl mx-auto py-4">
                  {/* GÓC TRÊN BÊN TRÁI: ĐIỂM VÀ THỨ HẠNG CỦA BẠN (VD: Quick Fire 795 (1st)) */}
                  <div className="text-left mb-4">
                    {myPlayer && (
                      <div className="font-black text-sm sm:text-base text-white/90 drop-shadow flex items-center gap-2">
                        <span>{myPlayer.display_name}</span>
                        <span className="font-mono text-amber-300 font-extrabold">{myPlayer.score}</span>
                        <span className="text-white/70">({getOrdinal((myRank >= 0 ? myRank : 0) + 1)})</span>
                      </div>
                    )}
                  </div>

                  {/* DANH SÁCH BẢNG XẾP HẠNG DẠNG VIÊN THUỐC (PILL) THEO CHUẨN HÌNH 3 */}
                  <div className="space-y-3 w-full my-auto">
                    {scoreboardData.map((p, idx) => (
                      <div
                        key={p.id}
                        className={`w-full flex items-center justify-between px-5 py-3 rounded-full border-2 border-black/80 shadow-[0_4px_0_rgba(0,0,0,0.35)] transition-all duration-700 ease-out ${
                          idx === 0
                            ? "bg-[#d9f99d] text-lime-950"
                            : idx === 1
                            ? "bg-[#fed7aa] text-amber-950"
                            : idx === 2
                            ? "bg-[#a7f3d0] text-emerald-950"
                            : "bg-[#e2e8f0] text-slate-800"
                        }`}
                      >
                        <div className="flex items-center gap-3">
                          <span className="grid h-7 w-7 place-items-center rounded-full bg-black/15 font-black text-sm">
                            {idx + 1}
                          </span>
                          <span className="text-2xl">{p.avatar || "🦊"}</span>
                          <span className="font-black text-base sm:text-lg">{p.display_name}</span>
                          {p.is_host && (
                            <span className="rounded bg-black/15 px-1.5 py-0.5 text-[10px] font-black uppercase">
                              HOST
                            </span>
                          )}

                          {/* HIỆU ỨNG THĂNG HẠNG: Khi 1 người chơi thăng hạng sẽ nhảy lên vị trí cao hơn và hiện badge động */}
                          {scoreboardStage === "ranked" && p.rankGain > 0 && (
                            <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full bg-amber-400 text-amber-950 font-black text-xs shadow-md border border-amber-600 animate-bounce">
                              🚀 +{p.rankGain} Hạng
                            </span>
                          )}
                        </div>

                        <div className="flex items-center gap-3">
                          {/* HIỆU ỨNG + ĐIỂM SAU MỖI CÂU: Kiểu '+1000' có hiệu ứng nổ động nhảy tưng tưng */}
                          {scoreboardStage !== "initial" && p.ptsEarned > 0 && (
                            <span className="inline-flex items-center px-2.5 py-0.5 rounded-full bg-emerald-500 text-white font-black text-xs sm:text-sm shadow-lg border border-white animate-bounce">
                              +{p.ptsEarned}
                            </span>
                          )}
                          <span className="font-mono text-lg sm:text-xl font-black">
                            {p.displayScore}
                          </span>
                        </div>
                      </div>
                    ))}
                  </div>

                  {/* ĐƯỜNG THẲNG TỰ ĐỘNG CHẠY HẾT ĐỂ CHUYỂN SANG CÂU TIẾP THEO */}
                  <div className="mt-6 w-full">
                    <div className="h-2 w-full overflow-hidden rounded-full bg-black/50 border border-white/20 shadow-inner">
                      <div
                        className="h-full rounded-full bg-gradient-to-r from-violet-500 via-pink-500 to-emerald-400"
                        style={{ animation: "revealLine 5.5s linear forwards" }}
                      />
                    </div>
                    {state.is_host && (
                      <div className="mt-2 text-right">
                        <button
                          disabled={busy}
                          onClick={() => hostAction("next_question")}
                          className="text-[11px] font-bold text-violet-300 hover:text-white underline transition inline-flex items-center gap-1"
                          title="Bỏ qua chờ và chuyển câu tiếp theo ngay lập tức"
                        >
                          Bỏ qua chờ & chuyển câu ngay <ArrowRight size={12} />
                        </button>
                      </div>
                    )}
                  </div>
                </div>
              ) : (
                /* --- GIAO DIỆN CHƠI GAME & MỞ ĐÁP ÁN (PLAYING & REVEAL ANSWER) --- */
                <>
                  <div className="grid grid-cols-1 lg:grid-cols-12 gap-5 lg:gap-8 items-center">
                    {/* CỘT TRÁI: KHU VỰC TƯƠNG TÁC (ĐOÁN TÊN BÀI HÁT HOẶC 4 NÚT PASTEL) */}
                    <div className="lg:col-span-6 flex flex-col justify-center space-y-4">
                      {/* --- A. CHẾ ĐỘ ÂM NHẠC: NHẬP CHỮ UNIKEY TIẾNG VIỆT (HÌNH 1) --- */}
                      {isMusicQuestion ? (
                        <div className="space-y-4">
                          <h1 className="text-2xl sm:text-3xl font-black text-white text-center lg:text-left drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)] tracking-tight">
                            Đây là bài hát nào?
                          </h1>

                          <form onSubmit={handleMusicSubmit} className="space-y-3">
                            {/* Ô NHẬP TÊN BÀI HÁT (UNIKEY TIẾNG VIỆT) */}
                            <div className="relative">
                              <input
                                type="text"
                                lang="vi"
                                autoComplete="off"
                                autoCorrect="off"
                                spellCheck={false}
                                disabled={state.status !== "playing" || musicSubmitted || busy}
                                value={musicInput}
                                onChange={(e) => setMusicInput(e.target.value)}
                                placeholder={musicSubmitted ? "Đã gửi câu trả lời! Đang chờ..." : "Nhập tên bài hát..."}
                                className="w-full rounded-2xl sm:rounded-3xl bg-[#fffdf0] px-4 py-3.5 sm:py-4 text-center text-lg sm:text-xl font-black text-slate-900 border-2 border-slate-900 shadow-[0_4px_0_#1e1b2e] focus:outline-none focus:ring-4 focus:ring-emerald-400 disabled:opacity-85 transition placeholder:text-gray-400 placeholder:font-semibold"
                              />
                            </div>

                            {/* NÚT TRY (XANH LÁ 3D) */}
                            <button
                              type="submit"
                              disabled={!musicInput.trim() || state.status !== "playing" || musicSubmitted || busy}
                              className="w-full rounded-full bg-[#1cb06f] hover:bg-[#16995f] px-6 py-3.5 text-lg font-black text-white border-2 border-emerald-950 shadow-[0_4px_0_#064e3b] active:translate-y-1 active:shadow-none transition disabled:opacity-50 disabled:cursor-not-allowed"
                            >
                              Try
                            </button>
                          </form>

                          {/* THÔNG BÁO FEEDBACK (ĐÚNG HOẶC SAI) */}
                          {musicFeedback && (
                            <div
                              className={`text-center font-bold text-xs sm:text-sm px-3 py-1.5 rounded-xl border ${
                                musicFeedback.type === "success"
                                    ? "bg-emerald-500/20 text-emerald-200 border-emerald-400/40"
                                    : "bg-rose-500/20 text-rose-200 border-rose-400/40 animate-pulse"
                              }`}
                            >
                              {musicFeedback.message}
                            </div>
                          )}

                          {/* CANDY RAINBOW SCORE LINE (TỪ 1000 TRỞ XUỐNG, DỪNG LẠI KHI ĐOÁN ĐÚNG) */}
                          <div className="pt-1">
                            <div className="flex items-center gap-3 w-full">
                              <div className="relative flex-1 h-3.5 sm:h-4 overflow-hidden rounded-full border-2 border-black/80 bg-black/60 p-0.5 shadow-inner">
                                <div
                                  className="h-full rounded-full transition-all duration-100 ease-linear candy-stripes"
                                  style={{
                                    width: `${Math.max(
                                      5,
                                      (((frozenScore !== null ? frozenScore : liveScore) /
                                        (state.question.is_double_points ? 2000 : 1000)) *
                                        100)
                                    )}%`
                                  }}
                                />
                              </div>
                              <span className="font-mono text-base sm:text-lg font-black tracking-wider text-white drop-shadow-[0_2px_3px_rgba(0,0,0,0.9)] flex items-center gap-1">
                                {frozenScore !== null ? frozenScore : liveScore}
                                {frozenScore !== null && <span className="text-xs text-emerald-300">🔒</span>}
                              </span>
                            </div>
                          </div>
                        </div>
                      ) : (
                        /* --- B. CÁC QUIZ CHỦ ĐỀ KHÁC: 4 NÚT PASTEL PILL XẾP DỌC (HÌNH 2) --- */
                        <div className="space-y-3.5">
                          <h1 className="text-xl sm:text-2xl font-black text-white text-center lg:text-left drop-shadow-[0_2px_4px_rgba(0,0,0,0.8)] leading-snug">
                            {state.question.prompt}
                          </h1>

                          {/* 4 NÚT PILL PASTEL XẾP DỌC BÊN TRÁI: KHÓA ĐIỂM ĐỨNG IM KHI ĐÃ CHỌN */}
                          <div className="space-y-2.5">
                            {state.question.options.map((option, i) => {
                              const pastel = pastelStyles[i % pastelStyles.length];
                              const isReveal = state.status === "reveal";
                              const isCorrect = isReveal && state.question?.correct_index === i;
                              const isChosen = selected === i;
                              const isWrong = isReveal && isChosen && state.question?.correct_index !== i;

                              return (
                                <button
                                  key={i}
                                  disabled={state.status !== "playing" || selected !== null || busy}
                                  onClick={() => handleAnswer(i)}
                                  className={`w-full rounded-full px-5 py-2.5 sm:py-3 text-center font-black text-sm sm:text-base transition-all active:translate-y-1 active:shadow-none flex items-center justify-between gap-2 ${
                                    isCorrect
                                      ? "bg-[#4ade80] text-emerald-950 border-2 border-emerald-950 shadow-[0_4px_0_#166534] scale-[1.01]"
                                      : isWrong
                                      ? "bg-[#f87171] text-rose-950 border-2 border-rose-950 shadow-[0_4px_0_#991b1b]"
                                      : isChosen
                                      ? "bg-amber-300 text-amber-950 border-2 border-amber-950 shadow-[0_4px_0_#b45309] ring-2 ring-white"
                                      : `${pastel.bg} ${pastel.hover} ${pastel.text} ${pastel.border} ${
                                          selected !== null ? "opacity-60" : ""
                                        }`
                                  } disabled:cursor-not-allowed`}
                                >
                                  <span className="w-5" />
                                  <span className="flex-1 truncate">{option}</span>
                                  <span className="min-w-6 flex items-center justify-end font-bold text-xs">
                                    {/* Trong lúc đang chơi: Đã chọn đáp án thì số điểm đứng im và hiện ổ khóa */}
                                    {!isReveal && isChosen && (
                                      <span className="text-amber-950 bg-amber-400 px-2 py-0.5 rounded-full text-[11px] font-black shadow-sm">
                                        🔒 {frozenScore !== null ? `+${frozenScore}đ` : "Đã chọn"}
                                      </span>
                                    )}
                                    {/* Khi hết giờ hoặc chốt câu hỏi: Mới biết đúng hay sai và hiện số điểm */}
                                    {isCorrect && (
                                      <span className="inline-flex items-center gap-1 text-emerald-950 font-black">
                                        <CheckCircle2 size={18} />
                                        {isChosen && frozenScore !== null && <span>+{frozenScore}đ</span>}
                                      </span>
                                    )}
                                    {isWrong && (
                                      <span className="inline-flex items-center gap-1 text-rose-950 font-black">
                                        <XCircle size={18} />
                                        <span>+0đ</span>
                                      </span>
                                    )}
                                  </span>
                                </button>
                              );
                            })}
                          </div>

                          {/* CANDY RAINBOW SCORE LINE (TỪ 1000 TRỞ XUỐNG, ĐỨNG IM KHI ĐÃ CHỌN ĐÁP ÁN) */}
                          <div className="pt-1">
                            <div className="flex items-center gap-3 w-full">
                              <div className="relative flex-1 h-3.5 sm:h-4 overflow-hidden rounded-full border-2 border-black/80 bg-black/60 p-0.5 shadow-inner">
                                <div
                                  className="h-full rounded-full transition-all duration-100 ease-linear candy-stripes"
                                  style={{
                                    width: `${Math.max(
                                      5,
                                      (((frozenScore !== null ? frozenScore : liveScore) /
                                        (state.question.is_double_points ? 2000 : 1000)) *
                                        100)
                                    )}%`
                                  }}
                                />
                              </div>
                              <span className="font-mono text-base sm:text-lg font-black tracking-wider text-white drop-shadow-[0_2px_3px_rgba(0,0,0,0.9)] flex items-center gap-1">
                                {frozenScore !== null ? frozenScore : liveScore}
                                {frozenScore !== null && <span className="text-xs text-amber-300">🔒</span>}
                              </span>
                            </div>
                          </div>
                        </div>
                      )}
                    </div>

                    {/* CỘT PHẢI: MEDIA VIEWER (YOUTUBE MV HOẶC ẢNH MINH HỌA) */}
                    <div className="lg:col-span-6 flex items-center justify-center">
                      <MediaViewer
                        type={state.question.question_type}
                        imageUrl={state.question.image_url}
                        audioUrl={state.question.audio_url}
                        youtubeVideoId={state.question.youtube_video_id}
                        startTime={state.question.start_time}
                        category={state.question.category}
                        prompt={state.question.prompt}
                        options={state.question.options}
                        isReveal={state.status === "reveal"}
                        timeLimit={state.question.time_limit || state.time_limit || 20}
                      />
                    </div>
                  </div>

                  {/* THÔNG BÁO ĐÁP ÁN ĐÚNG TRƯỚC KHI CHUYỂN SANG BẢNG XẾP HẠNG */}
                  {state.status === "reveal" && (
                    <div className="mt-4 rounded-2xl bg-black/75 backdrop-blur-md border border-white/20 p-3 sm:p-4 text-white shadow-2xl max-w-3xl mx-auto w-full">
                      <div className="flex items-center gap-2 font-black text-sm sm:text-base text-emerald-300">
                        <CheckCircle2 size={18} className="text-emerald-400" />
                        <span>Đáp án chính xác: {state.question.options[state.question.correct_index ?? 0]}</span>
                      </div>
                      {state.question.explanation && (
                        <p className="mt-1 text-xs sm:text-sm text-slate-300 leading-snug">
                          <b>Giải thích:</b> {state.question.explanation}
                        </p>
                      )}
                    </div>
                  )}
                </>
              )}
            </div>
          )}

          {/* FLOATING LEADERBOARD MODAL (BẢNG XẾP HẠNG THỜI GIAN THỰC) */}
          {showLeaderboard && (
            <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4">
              <div className="card w-full max-w-md p-5 bg-white text-slate-900 rounded-3xl shadow-2xl relative border-2 border-violet-200">
                <div className="flex items-center justify-between border-b border-gray-100 pb-3 mb-3">
                  <h3 className="text-base font-black flex items-center gap-2 text-slate-900">
                    <Trophy className="text-amber-500" size={18} /> Bảng Xếp Hạng ({state.players.length} người)
                  </h3>
                  <button
                    onClick={() => setShowLeaderboard(false)}
                    className="rounded-full p-1.5 hover:bg-gray-100 text-gray-500"
                  >
                    <X size={18} />
                  </button>
                </div>
                <div className="space-y-1.5 max-h-[50vh] overflow-y-auto pr-1">
                  {sortedPlayers.map((p, idx) => (
                    <div
                      key={p.id}
                      className={`flex items-center gap-2.5 rounded-xl p-2.5 transition border ${
                        idx === 0
                          ? "border-amber-200 bg-amber-50/70"
                          : "border-gray-100 bg-gray-50/60"
                      }`}
                    >
                      <span
                        className={`grid h-6 w-6 shrink-0 place-items-center rounded-lg text-xs font-black ${
                          idx === 0
                            ? "bg-amber-400 text-amber-950"
                            : idx === 1
                            ? "bg-slate-300 text-slate-900"
                            : idx === 2
                            ? "bg-amber-700 text-white"
                            : "bg-gray-200 text-gray-700"
                        }`}
                      >
                        {idx + 1}
                      </span>
                      <span className="text-xl shrink-0">{p.avatar || "🦊"}</span>
                      <div className="min-w-0 flex-1">
                        <div className="truncate text-xs font-bold text-slate-900 flex items-center gap-1">
                          <span>{p.display_name}</span>
                          {p.is_host && <span className="text-[9px] bg-amber-100 text-amber-800 px-1 rounded font-extrabold">HOST</span>}
                        </div>
                        <div className="text-[10px] text-gray-400">
                          {p.has_answered ? <span className="text-emerald-600 font-bold">✓ Đã trả lời</span> : "Đang suy nghĩ…"}
                        </div>
                      </div>
                      <div className="text-right font-black text-violet-700 text-sm">
                        {p.score}
                      </div>
                    </div>
                  ))}
                </div>
                <div className="mt-4 pt-3 border-t text-center">
                  <button
                    onClick={() => setShowLeaderboard(false)}
                    className="btn-secondary w-full py-2 text-xs font-bold rounded-xl"
                  >
                    Đóng bảng xếp hạng
                  </button>
                </div>
              </div>
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
                      setSelected(null);
                      if (state.is_host) {
                        hostAction("reset_to_lobby");
                      } else {
                        // Người chơi quay về trạng thái lobby đồng bộ
                        const token = sessionStorage.getItem(`qp-token-${roomCode}`);
                        call<RoomState>("reset_to_lobby", {
                          p_code: roomCode,
                          p_player_token: token
                        })
                          .then((nextState) => {
                            if (nextState) setState(nextState);
                            broadcast();
                          })
                          .catch(() => {
                            setState((prev) => (prev ? { ...prev, status: "lobby" } : null));
                          });
                      }
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
