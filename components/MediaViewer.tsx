"use client";

import { useEffect, useState } from "react";
import { Image as ImageIcon, Music, Play, RotateCcw, Sparkles, VolumeX, Youtube } from "lucide-react";
import { resolveQuestionImage, CATEGORY_DEFAULT_IMAGES } from "@/lib/questionImages";

interface MediaViewerProps {
  type?: string;
  imageUrl?: string | null;
  audioUrl?: string | null;
  youtubeVideoId?: string | null;
  startTime?: number | null;
  category?: string;
  prompt?: string;
  options?: string[];
  className?: string;
  isReveal?: boolean;
  timeLimit?: number;
}

export function MediaViewer({
  type = "MULTIPLE_CHOICE",
  imageUrl,
  audioUrl,
  youtubeVideoId,
  startTime,
  category = "Quiz Party",
  prompt = "",
  options = [],
  className = "",
  isReveal = false,
  timeLimit = 20
}: MediaViewerProps) {
  const [imageError, setImageError] = useState(false);
  const [fallbackTried, setFallbackTried] = useState(false);
  const [activeSrc, setActiveSrc] = useState<string>("");
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);
  const [audioElement, setAudioElement] = useState<HTMLAudioElement | null>(null);
  const [ytBlocked, setYtBlocked] = useState(false);

  // Hiệu ứng 20 mảnh ghép che hình ảnh (5 cột x 4 hàng) mở dần theo thời gian
  const TOTAL_TILES = 20;
  const [revealedTiles, setRevealedTiles] = useState<number[]>([]);

  useEffect(() => {
    if (isReveal) {
      setRevealedTiles(Array.from({ length: TOTAL_TILES }, (_, i) => i));
      return;
    }

    const tileIndices = Array.from({ length: TOTAL_TILES }, (_, i) => i);
    for (let i = tileIndices.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [tileIndices[i], tileIndices[j]] = [tileIndices[j], tileIndices[i]];
    }

    setRevealedTiles([tileIndices[0]]);
    let currentIdx = 1;

    const intervalTime = Math.max(400, Math.floor(((timeLimit || 20) * 1000 * 0.85) / TOTAL_TILES));
    const tileTimer = window.setInterval(() => {
      if (currentIdx < TOTAL_TILES) {
        const nextTile = tileIndices[currentIdx];
        setRevealedTiles((prev) => (prev.includes(nextTile) ? prev : [...prev, nextTile]));
        currentIdx++;
      } else {
        window.clearInterval(tileTimer);
      }
    }, intervalTime);

    return () => window.clearInterval(tileTimer);
  }, [prompt, activeSrc, isReveal, timeLimit]);

  const resolvedUrl = resolveQuestionImage({
    prompt,
    category,
    options,
    image_url: imageUrl,
    youtube_video_id: youtubeVideoId
  });

  useEffect(() => {
    setImageError(false);
    setFallbackTried(false);
    setYtBlocked(false);
    setActiveSrc(resolvedUrl);
  }, [resolvedUrl, prompt, imageUrl, youtubeVideoId]);

  const cleanYtId = (() => {
    if (!youtubeVideoId) return null;
    const match = youtubeVideoId.match(/(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))([\w-]{11})/);
    if (match) return match[1];
    const trimmed = youtubeVideoId.trim();
    if (/^[\w-]{11}$/.test(trimmed)) return trimmed;
    return null;
  })();

  const isSongGuess =
    type === "AUDIO_GUESS" ||
    type === "VIDEO_GUESS" ||
    Boolean(cleanYtId) ||
    Boolean(audioUrl);

  const toggleAudio = (url: string) => {
    if (!audioElement) {
      const audio = new Audio(url);
      audio.onended = () => setIsPlayingAudio(false);
      audio.onerror = () => setIsPlayingAudio(false);
      audio.play().then(() => setIsPlayingAudio(true)).catch(() => setIsPlayingAudio(false));
      setAudioElement(audio);
    } else {
      if (isPlayingAudio) {
        audioElement.pause();
        setIsPlayingAudio(false);
      } else {
        audioElement.play().then(() => setIsPlayingAudio(true)).catch(() => setIsPlayingAudio(false));
      }
    }
  };

  const restartAudio = () => {
    if (audioElement) {
      audioElement.currentTime = 0;
      audioElement.play().then(() => setIsPlayingAudio(true)).catch(() => setIsPlayingAudio(false));
    }
  };

  const handleImageError = () => {
    if (!fallbackTried) {
      setFallbackTried(true);
      const catDefault = CATEGORY_DEFAULT_IMAGES[category] || CATEGORY_DEFAULT_IMAGES["Doraemon"];
      if (catDefault && catDefault !== activeSrc) {
        setActiveSrc(catDefault);
        return;
      }
    }
    setImageError(true);
  };

  return (
    <div className={`w-full overflow-hidden ${className}`}>
      {/* 1. GUESS THE SONG: YOUTUBE EMBED HOẶC AUDIO */}
      {isSongGuess && cleanYtId && !ytBlocked && (
        <div className="relative aspect-video w-full h-[250px] sm:h-[300px] md:h-[360px] max-h-[420px] overflow-hidden rounded-3xl bg-black border-4 border-black/80 shadow-2xl mx-auto">
          {/* LỚP MẶT NẠ CHE TIÊU ĐỀ BÀI HÁT KHI ĐANG ĐOÁN (THEO YÊU CẦU: BỎ TÊN BÀI HÁT TRÊN VIDEO ĐỂ KHÔNG BỊ LỘ) */}
          {!isReveal && (
            <div className="absolute top-0 left-0 right-0 h-20 bg-gradient-to-b from-black via-black/95 to-black/70 pointer-events-none z-30 flex items-center justify-center px-4">
              <div className="flex items-center gap-2 px-4 py-1.5 rounded-full bg-violet-950/90 border border-violet-500/40 text-white text-xs sm:text-sm font-extrabold shadow-2xl backdrop-blur-md">
                <Music size={15} className="text-pink-400 animate-bounce" />
                <span className="tracking-wide text-amber-200">🎵 Lắng nghe giai điệu & đoán tên bài hát!</span>
              </div>
            </div>
          )}

          <iframe
            key={`${cleanYtId}-${startTime || 18}`}
            src={`https://www.youtube.com/embed/${cleanYtId}?autoplay=1&start=${startTime && startTime > 0 ? startTime : 18}&enablejsapi=1&rel=0&modestbranding=1&playsinline=1`}
            title="Đoán tên bài hát qua MV"
            className={`h-full w-full border-0 transition-all duration-300 ${
              !isReveal ? "scale-[1.18] -translate-y-8" : "scale-100 translate-y-0"
            }`}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerPolicy="strict-origin-when-cross-origin"
            allowFullScreen
            onError={() => setYtBlocked(true)}
          />

          <div className="absolute bottom-2.5 right-2.5 z-20 flex items-center gap-1.5 rounded-lg bg-black/85 backdrop-blur-sm px-2.5 py-1 text-[11px] font-bold text-white shadow-md">
            <Youtube className="text-red-500" size={14} />
            <span>Đoán bài hát qua MV</span>
            {isReveal && (
              <a
                href={`https://www.youtube.com/watch?v=${cleanYtId}`}
                target="_blank"
                rel="noreferrer"
                className="ml-1 text-[10px] text-amber-300 underline hover:text-white"
                title="Mở xem MV đầy đủ trên YouTube"
              >
                Mở YouTube ↗
              </a>
            )}
          </div>
        </div>
      )}

      {/* 2. AUDIO PLAYER IF NO YOUTUBE OR IF YOUTUBE IS BLOCKED */}
      {isSongGuess && (!cleanYtId || ytBlocked) && (
        <div className="relative aspect-video w-full h-[250px] sm:h-[300px] md:h-[360px] max-h-[420px] overflow-hidden rounded-3xl bg-black/60 border-4 border-black/80 shadow-2xl mx-auto flex flex-col items-center justify-center p-4 text-center">
          {activeSrc && !imageError && (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={activeSrc}
              alt={prompt || "Hình ảnh bài hát"}
              className="mb-3 max-h-[160px] w-auto max-w-full rounded-2xl object-contain shadow-lg"
              loading="lazy"
              onError={handleImageError}
            />
          )}
          <div className="flex items-center gap-1.5 rounded-full bg-violet-500/20 px-3 py-1 text-xs font-bold uppercase tracking-wider text-violet-200 border border-violet-400/30">
            <Music size={14} /> GUESS THE SONG · ĐOÁN BÀI HÁT
          </div>
          <p className="mt-2 text-xs font-semibold text-slate-200">
            Lắng nghe giai điệu và nhập tên bài hát chính xác!
          </p>

          {cleanYtId && ytBlocked && (
            <div className="mt-3">
              <a
                href={`https://www.youtube.com/watch?v=${cleanYtId}`}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-1.5 rounded-xl bg-red-600 px-4 py-2 text-xs font-bold text-white shadow hover:bg-red-700"
              >
                <Youtube size={15} /> Mở nghe MV trên YouTube ↗
              </a>
            </div>
          )}

          {audioUrl && (
            <div className="mt-3 flex items-center gap-2">
              <button
                type="button"
                onClick={() => toggleAudio(audioUrl)}
                className="flex items-center gap-1.5 rounded-xl bg-violet-600 px-4 py-2 text-xs font-bold text-white shadow transition hover:bg-violet-700 active:scale-95"
              >
                {isPlayingAudio ? <VolumeX size={15} /> : <Play size={15} />}
                {isPlayingAudio ? "Tạm dừng" : "Phát đoạn nhạc"}
              </button>
              {audioElement && (
                <button
                  type="button"
                  onClick={restartAudio}
                  title="Nghe lại từ đầu"
                  className="rounded-xl border border-white/20 bg-white/10 p-2 text-white hover:bg-white/20"
                >
                  <RotateCcw size={15} />
                </button>
              )}
            </div>
          )}
        </div>
      )}

      {/* 3. ILLUSTRATION IMAGE CHO CÂU TRẮC NGHIỆM: HIỆU ỨNG TỪNG MẢNH GHÉP (MOSAIC TILE REVEAL) */}
      {!isSongGuess && (
        <div className="relative aspect-video w-full h-[250px] sm:h-[300px] md:h-[360px] max-h-[420px] overflow-hidden rounded-3xl bg-[#120f22] border-4 border-[#3a3556] shadow-2xl mx-auto flex items-center justify-center p-2 select-none">
          {activeSrc && !imageError ? (
            <div className="relative w-full h-full rounded-2xl overflow-hidden flex items-center justify-center bg-black/60">
              {/* Ảnh gốc bên dưới */}
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={activeSrc}
                alt={prompt || "Hình ảnh minh họa câu hỏi"}
                className="h-full w-full max-h-full max-w-full rounded-xl object-contain shadow-md"
                loading="eager"
                onError={handleImageError}
              />

              {/* Lưới 20 mảnh ghép phủ lên trên ảnh */}
              {Array.from({ length: TOTAL_TILES }).map((_, idx) => {
                const row = Math.floor(idx / 5);
                const col = idx % 5;
                const isRevealed = isReveal || revealedTiles.includes(idx);

                return (
                  <div
                    key={idx}
                    className={`absolute border border-black/40 bg-[#1e1a33] shadow-inner transition-all duration-700 ease-out flex items-center justify-center ${
                      isRevealed
                        ? "opacity-0 scale-75 pointer-events-none"
                        : "opacity-100 scale-100"
                    }`}
                    style={{
                      top: `${row * 25}%`,
                      left: `${col * 20}%`,
                      width: "20%",
                      height: "25%"
                    }}
                  >
                    <span className="text-[11px] font-mono text-white/20 select-none font-bold">
                      {idx + 1}
                    </span>
                  </div>
                );
              })}

              {/* Badge góc dưới: Hiển thị trạng thái mở mảnh ghép */}
              <div className="absolute bottom-2 left-2 z-10 px-2.5 py-1 rounded-full bg-black/75 backdrop-blur-md border border-white/10 text-[10px] sm:text-xs font-bold text-white/90 shadow-lg">
                {isReveal ? "✨ Toàn bộ hình ảnh" : `🧩 Đang mở mảnh ghép (${revealedTiles.length}/${TOTAL_TILES})`}
              </div>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center p-4 text-center text-slate-300">
              <div className="mb-2 grid h-12 w-12 place-items-center rounded-2xl bg-white/10 text-white shadow-inner">
                <Sparkles size={24} />
              </div>
              <span className="text-xs font-black uppercase tracking-wider text-slate-200">
                {category}
              </span>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
