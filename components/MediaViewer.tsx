"use client";

import { useEffect, useState, useRef, useCallback } from "react";
import { Compass, Globe, Image as ImageIcon, Layers, MapPin, Music, Navigation, Play, RotateCcw, Sparkles, Volume2, VolumeX, Youtube } from "lucide-react";
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
  streetViewUrl?: string | null;
  satelliteUrl?: string | null;
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
  timeLimit = 20,
  streetViewUrl,
  satelliteUrl
}: MediaViewerProps) {
  const [imageError, setImageError] = useState(false);
  const [fallbackTried, setFallbackTried] = useState(false);
  const [activeSrc, setActiveSrc] = useState<string>("");
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);
  const [audioElement, setAudioElement] = useState<HTMLAudioElement | null>(null);
  const [ytBlocked, setYtBlocked] = useState(false);
  const [isPlayingYt, setIsPlayingYt] = useState(false);
  const iframeRef = useRef<HTMLIFrameElement>(null);

  // Gửi lệnh điều khiển trực tiếp tới YouTube Player qua postMessage
  const sendYtCommand = useCallback((func: string, args: any[] = []) => {
    if (iframeRef.current && iframeRef.current.contentWindow) {
      try {
        iframeRef.current.contentWindow.postMessage(
          JSON.stringify({ event: "command", func, args }),
          "*"
        );
      } catch (err) {
        // ignore cross-origin sandbox errors
      }
    }
  }, []);

  // Kích hoạt tự động phát video nhạc và bật âm thanh ngay khi bắt đầu đếm câu
  const triggerPlay = useCallback(() => {
    sendYtCommand("playVideo");
    sendYtCommand("unMute");
    sendYtCommand("setVolume", [100]);
    setTimeout(() => {
      sendYtCommand("unMute");
      sendYtCommand("setVolume", [100]);
    }, 150);
  }, [sendYtCommand]);

  // Nạp YouTube Iframe API toàn cục một lần duy nhất
  useEffect(() => {
    if (typeof window === "undefined") return;
    if (!(window as any).YT) {
      const tag = document.createElement("script");
      tag.src = "https://www.youtube.com/iframe_api";
      const firstScriptTag = document.getElementsByTagName("script")[0];
      firstScriptTag?.parentNode?.insertBefore(tag, firstScriptTag);
    }
  }, []);

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

  const isStreetView =
    type === "STREET_VIEW_GUESS" ||
    category === "Đoán quốc gia qua Google Map 360°" ||
    Boolean(streetViewUrl);

  const [mapViewMode, setMapViewMode] = useState<"street" | "satellite">("street");

  useEffect(() => {
    setMapViewMode("street");
  }, [streetViewUrl, prompt]);

  const isSongGuess =
    !isStreetView &&
    (type === "AUDIO_GUESS" ||
      type === "VIDEO_GUESS" ||
      Boolean(cleanYtId) ||
      Boolean(audioUrl));

  // Tự động phát video nhạc mỗi khi bắt đầu đếm câu hỏi & khi người dùng tương tác
  useEffect(() => {
    if (!isSongGuess || !cleanYtId) return;

    setIsPlayingYt(false);

    // Lắng nghe phản hồi từ iframe YouTube
    const handleYtMessage = (e: MessageEvent) => {
      if (typeof e.data === "string") {
        try {
          const data = JSON.parse(e.data);
          if (data.event === "onStateChange") {
            // 1 = PLAYING, 3 = BUFFERING
            if (data.info === 1 || data.info === 3) {
              setIsPlayingYt(true);
              sendYtCommand("unMute");
              sendYtCommand("setVolume", [100]);
            } else if (data.info === 2) {
              // Nếu bị tạm dừng, ép phát tiếp ngay lập tức
              sendYtCommand("playVideo");
              sendYtCommand("unMute");
              sendYtCommand("setVolume", [100]);
            }
          } else if (data.event === "initialDelivery") {
            triggerPlay();
          }
        } catch {}
      }
    };
    window.addEventListener("message", handleYtMessage);

    // Mọi tương tác của người dùng (click chuột, bấm phím gõ tên bài hát, chạm màn hình) đều kích hoạt phát video
    const handleUserInteraction = () => {
      triggerPlay();
    };
    window.addEventListener("click", handleUserInteraction, { passive: true });
    window.addEventListener("keydown", handleUserInteraction, { passive: true });
    window.addEventListener("touchstart", handleUserInteraction, { passive: true });

    // Hàng loạt xung lệnh phát tự động ngay khi vừa bắt đầu đếm câu hỏi
    const t1 = setTimeout(triggerPlay, 100);
    const t2 = setTimeout(triggerPlay, 350);
    const t3 = setTimeout(triggerPlay, 800);
    const t4 = setTimeout(triggerPlay, 1600);

    return () => {
      window.removeEventListener("message", handleYtMessage);
      window.removeEventListener("click", handleUserInteraction);
      window.removeEventListener("keydown", handleUserInteraction);
      window.removeEventListener("touchstart", handleUserInteraction);
      clearTimeout(t1);
      clearTimeout(t2);
      clearTimeout(t3);
      clearTimeout(t4);
    };
  }, [isSongGuess, cleanYtId, triggerPlay, sendYtCommand]);

  // Khởi tạo YouTube Player API trực tiếp trên iframe để bảo đảm video tự động hát 100%
  useEffect(() => {
    if (!cleanYtId || !iframeRef.current || typeof window === "undefined") return;

    let playerInstance: any = null;
    const bindApi = () => {
      const YT = (window as any).YT;
      if (YT && YT.Player && iframeRef.current) {
        try {
          playerInstance = new YT.Player(iframeRef.current, {
            events: {
              onReady: (e: any) => {
                try {
                  e.target.playVideo();
                  e.target.unMute();
                  e.target.setVolume(100);
                } catch {}
              },
              onStateChange: (e: any) => {
                if (e.data === 1) {
                  try {
                    e.target.unMute();
                    e.target.setVolume(100);
                  } catch {}
                } else if (e.data === 2) {
                  try {
                    e.target.playVideo();
                    e.target.unMute();
                    e.target.setVolume(100);
                  } catch {}
                }
              }
            }
          });
        } catch {}
      }
    };

    if ((window as any).YT && (window as any).YT.Player) {
      bindApi();
    } else {
      const prevCallback = (window as any).onYouTubeIframeAPIReady;
      (window as any).onYouTubeIframeAPIReady = () => {
        if (prevCallback) prevCallback();
        bindApi();
      };
    }

    return () => {
      if (playerInstance && playerInstance.destroy) {
        try {
          playerInstance.destroy();
        } catch {}
      }
    };
  }, [cleanYtId, startTime]);

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
      {/* 0. STREET VIEW / GOOGLE MAPS 360° GEOGUESSR INTERACTIVE VIEWER */}
      {isStreetView && (
        <div className="relative aspect-video w-full h-[270px] sm:h-[320px] md:h-[380px] max-h-[420px] overflow-hidden rounded-3xl bg-[#090d16] border-4 border-[#1e293b] shadow-2xl mx-auto flex flex-col select-none">
          {/* Header controls bar */}
          <div className="flex items-center justify-between px-3 sm:px-4 py-2 bg-[#0c1322] border-b border-white/10 z-10 text-xs">
            <div className="flex items-center gap-1.5 font-bold text-amber-300">
              <Compass size={16} className="text-amber-400" />
              <span className="hidden sm:inline">Khám phá 360°: Kéo xoay & bấm mũi tên trên đường để di chuyển!</span>
              <span className="sm:hidden">Kéo xoay & đi tới lui 360°</span>
            </div>

            <div className="flex items-center gap-1.5">
              <button
                type="button"
                onClick={() => setMapViewMode("street")}
                className={`flex items-center gap-1 px-2.5 py-1 rounded-lg font-bold text-[11px] sm:text-xs transition-all ${
                  mapViewMode === "street"
                    ? "bg-amber-400 text-slate-950 shadow-md font-black"
                    : "bg-white/10 text-slate-300 hover:bg-white/20"
                }`}
              >
                <Navigation size={13} />
                <span>360° Đường phố</span>
              </button>

              {satelliteUrl && (
                <button
                  type="button"
                  onClick={() => setMapViewMode("satellite")}
                  className={`flex items-center gap-1 px-2.5 py-1 rounded-lg font-bold text-[11px] sm:text-xs transition-all ${
                    mapViewMode === "satellite"
                      ? "bg-emerald-400 text-slate-950 shadow-md font-black"
                      : "bg-white/10 text-slate-300 hover:bg-white/20"
                  }`}
                >
                  <Layers size={13} />
                  <span>Vệ tinh 3D</span>
                </button>
              )}
            </div>
          </div>

          {/* Iframe View */}
          <div className="relative w-full flex-1 bg-black">
            <iframe
              key={`${mapViewMode}-${streetViewUrl || imageUrl}`}
              src={mapViewMode === "satellite" && satelliteUrl ? satelliteUrl : (streetViewUrl || imageUrl || "")}
              title="Google Map 360° Geoguessr"
              className="w-full h-full border-0"
              allow="fullscreen; geolocation; accelerometer; gyroscope; magnetometer"
              loading="eager"
            />

            {/* Bottom floating tips */}
            <div className="pointer-events-none absolute bottom-2 left-2 right-2 sm:right-auto px-3 py-1.5 rounded-xl bg-black/80 backdrop-blur-md border border-white/15 text-[11px] sm:text-xs text-white shadow-lg flex items-center gap-2">
              <span className="flex items-center gap-1 text-amber-300 font-bold shrink-0">
                <MapPin size={13} /> Gợi ý Geoguessr:
              </span>
              <span className="text-slate-200 truncate">
                Quan sát chữ viết, biển số xe, kiểu cột điện và cảnh quan xung quanh!
              </span>
            </div>
          </div>
        </div>
      )}

      {/* 1. GUESS THE SONG: YOUTUBE EMBED HOẶC AUDIO */}
      {isSongGuess && cleanYtId && !ytBlocked && (
        <div className="relative aspect-video w-full h-[250px] sm:h-[300px] md:h-[360px] max-h-[420px] overflow-hidden rounded-3xl bg-black border-4 border-black/80 shadow-2xl mx-auto">
          {/* LỚP MẶT NẠ OPAQUE 100% CHE HOÀN TOÀN TIÊU ĐỀ BÀI HÁT KHI ĐANG ĐOÁN (KHÔNG BAO GIỜ BỊ LỘ TÊN BÀI) */}
          {!isReveal && (
            <div className="absolute top-0 left-0 right-0 h-16 sm:h-20 bg-[#0c0a18] border-b border-violet-500/20 pointer-events-none z-30 flex items-center justify-center px-4 shadow-xl">
              <div className="flex items-center gap-2 px-4 py-1.5 rounded-full bg-violet-900/90 border border-violet-400/40 text-white text-xs sm:text-sm font-extrabold shadow-2xl backdrop-blur-md">
                <Music size={15} className="text-pink-400 animate-bounce" />
                <span className="tracking-wide text-amber-200">🎵 Lắng nghe giai điệu & đoán tên bài hát!</span>
              </div>
            </div>
          )}

          <iframe
            ref={iframeRef}
            id="yt-player-frame"
            key={`${cleanYtId}-${startTime || 24}`}
            src={`https://www.youtube.com/embed/${cleanYtId}?autoplay=1&mute=0&start=${startTime && startTime > 0 ? startTime : 24}&enablejsapi=1&rel=0&modestbranding=1&playsinline=1&controls=1&origin=${encodeURIComponent(typeof window !== "undefined" ? window.location.origin : "")}`}
            title="Đoán tên bài hát qua MV"
            onLoad={() => {
              triggerPlay();
              setTimeout(triggerPlay, 100);
              setTimeout(triggerPlay, 300);
              setTimeout(triggerPlay, 700);
            }}
            className={`w-full border-0 transition-all duration-300 ${
              !isReveal
                ? "h-[122%] -mt-10 sm:-mt-14 scale-[1.18]"
                : "h-full mt-0 scale-100"
            }`}
            allow="autoplay; encrypted-media; fullscreen; picture-in-picture; accelerometer; gyroscope; web-share"
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

      {/* 3. ILLUSTRATION IMAGE CHO CÂU TRẮC NGHIỆM: HIỆU ỨNG TỪNG MẢNH GHÉP (MOSAIC TILE REVEAL THEO HÌNH GỬI) */}
      {!isSongGuess && !isStreetView && (
        <div className="relative aspect-video w-full h-[250px] sm:h-[300px] md:h-[360px] max-h-[420px] overflow-hidden rounded-3xl bg-[#0f1722] border-4 border-[#223044] shadow-2xl mx-auto flex items-center justify-center p-2 select-none">
          {activeSrc && !imageError ? (
            <div className="relative w-full h-full rounded-2xl overflow-hidden flex items-center justify-center bg-black/50">
              {/* Ảnh gốc bên dưới */}
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={activeSrc}
                alt={prompt || "Hình ảnh minh họa câu hỏi"}
                className="h-full w-full max-h-full max-w-full rounded-xl object-contain shadow-md"
                loading="eager"
                onError={handleImageError}
              />

              {/* Lưới 20 mảnh ghép che phủ ảnh - tự động mở dần từng mảnh theo thời gian (giống hình boyband) */}
              {Array.from({ length: TOTAL_TILES }).map((_, idx) => {
                const row = Math.floor(idx / 5);
                const col = idx % 5;
                const isRevealed = isReveal || revealedTiles.includes(idx);

                return (
                  <div
                    key={idx}
                    className={`absolute border border-black/30 bg-[#162332] shadow-inner transition-all duration-700 ease-out ${
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
                  />
                );
              })}

              {/* Badge góc dưới: Hiển thị trạng thái mở mảnh ghép */}
              <div className="absolute bottom-2 left-2 z-10 px-2.5 py-1 rounded-full bg-black/80 backdrop-blur-md border border-white/10 text-[10px] sm:text-xs font-bold text-white/90 shadow-lg flex items-center gap-1.5">
                {isReveal ? (
                  <span>✨ Đã mở toàn bộ ảnh</span>
                ) : (
                  <span>🧩 Đang mở dần từng mảnh ({revealedTiles.length}/{TOTAL_TILES})</span>
                )}
              </div>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center p-6 text-center text-slate-300">
              <div className="mb-3 grid h-14 w-14 place-items-center rounded-2xl bg-white/10 text-white shadow-inner">
                <Sparkles size={28} className="text-amber-400 animate-pulse" />
              </div>
              <span className="text-sm font-black uppercase tracking-wider text-slate-100">
                {category}
              </span>
              <p className="mt-1 text-xs text-slate-400">Hình ảnh minh họa cho câu hỏi</p>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
