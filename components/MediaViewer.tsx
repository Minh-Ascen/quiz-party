"use client";

import { useEffect, useState } from "react";
import { Image as ImageIcon, Music, Play, RotateCcw, Sparkles, VolumeX, Youtube } from "lucide-react";
import { resolveQuestionImage, CATEGORY_DEFAULT_IMAGES } from "@/lib/questionImages";

interface MediaViewerProps {
  type?: string;
  imageUrl?: string | null;
  audioUrl?: string | null;
  youtubeVideoId?: string | null;
  category?: string;
  prompt?: string;
  options?: string[];
}

export function MediaViewer({
  type = "MULTIPLE_CHOICE",
  imageUrl,
  audioUrl,
  youtubeVideoId,
  category = "Quiz Party",
  prompt = "",
  options = []
}: MediaViewerProps) {
  const [imageError, setImageError] = useState(false);
  const [fallbackTried, setFallbackTried] = useState(false);
  const [activeSrc, setActiveSrc] = useState<string>("");
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);
  const [audioElement, setAudioElement] = useState<HTMLAudioElement | null>(null);
  const [ytBlocked, setYtBlocked] = useState(false);

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
    <div className="mx-auto my-2 w-full max-w-2xl overflow-hidden rounded-2xl border border-violet-100 bg-gradient-to-b from-violet-50/70 to-slate-50/90 p-2 shadow-inner">
      {/* 1. GUESS THE SONG: YOUTUBE EMBED HOẶC AUDIO */}
      {isSongGuess && cleanYtId && !ytBlocked && (
        <div className="relative aspect-video w-full h-[210px] sm:h-[240px] md:h-[270px] max-h-[300px] overflow-hidden rounded-xl bg-black shadow-lg mx-auto">
          <iframe
            src={`https://www.youtube-nocookie.com/embed/${cleanYtId}?autoplay=1&enablejsapi=1&rel=0&modestbranding=1&playsinline=1`}
            title="Đoán tên bài hát qua MV"
            className="h-full w-full border-0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerPolicy="strict-origin-when-cross-origin"
            allowFullScreen
            onError={() => setYtBlocked(true)}
          />
          <div className="absolute bottom-2 right-2 flex items-center gap-1.5 rounded-lg bg-black/85 backdrop-blur-sm px-2.5 py-1 text-[11px] font-bold text-white shadow-md">
            <Youtube className="text-red-500" size={14} />
            <span>Đoán tên bài hát qua MV</span>
            <a
              href={`https://www.youtube.com/watch?v=${cleanYtId}`}
              target="_blank"
              rel="noreferrer"
              className="ml-1 text-[10px] text-amber-300 underline hover:text-white"
              title="Mở nghe MV trên YouTube nếu trình duyệt chặn"
            >
              Mở YouTube ↗
            </a>
          </div>
        </div>
      )}

      {/* 2. AUDIO PLAYER IF NO YOUTUBE OR IF YOUTUBE IS BLOCKED */}
      {isSongGuess && (!cleanYtId || ytBlocked) && (
        <div className="flex flex-col items-center justify-center p-3 text-center">
          {activeSrc && !imageError && (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={activeSrc}
              alt={prompt || "Hình ảnh bài hát"}
              className="mb-2 max-h-[130px] w-auto max-w-full rounded-lg object-contain shadow-sm"
              loading="lazy"
              onError={handleImageError}
            />
          )}
          <div className="flex items-center gap-1.5 rounded-full bg-violet-100 px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wider text-violet-700">
            <Music size={12} /> GUESS THE SONG · ĐOÁN BÀI HÁT
          </div>
          <p className="mt-1 text-[11px] font-semibold text-gray-600">
            Lắng nghe giai điệu và chọn tên bài hát chính xác!
          </p>

          {cleanYtId && ytBlocked && (
            <div className="mt-2">
              <a
                href={`https://www.youtube.com/watch?v=${cleanYtId}`}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-1.5 rounded-lg bg-red-600 px-3.5 py-1.5 text-xs font-bold text-white shadow hover:bg-red-700"
              >
                <Youtube size={14} /> Mở nghe MV trên YouTube ↗
              </a>
            </div>
          )}

          {audioUrl ? (
            <div className="mt-2 flex items-center gap-2">
              <button
                type="button"
                onClick={() => toggleAudio(audioUrl)}
                className="flex items-center gap-1.5 rounded-lg bg-violet-600 px-3.5 py-1.5 text-xs font-bold text-white shadow transition hover:bg-violet-700 active:scale-95"
              >
                {isPlayingAudio ? <VolumeX size={15} /> : <Play size={15} />}
                {isPlayingAudio ? "Tạm dừng" : "Phát đoạn nhạc"}
              </button>
              {audioElement && (
                <button
                  type="button"
                  onClick={restartAudio}
                  title="Nghe lại từ đầu"
                  className="rounded-lg border border-gray-200 bg-white p-1.5 text-gray-700 hover:bg-gray-50"
                >
                  <RotateCcw size={15} />
                </button>
              )}
            </div>
          ) : (
            <div className="mt-1.5 rounded-lg bg-amber-50 px-3 py-1 text-[11px] font-medium text-amber-800">
              🎵 Hãy nhớ lại ca từ và giai điệu quen thuộc để chọn đáp án đúng!
            </div>
          )}
        </div>
      )}

      {/* 3. ILLUSTRATION IMAGE FOR EVERY QUESTION */}
      {!isSongGuess && (
        <div className="relative flex min-h-[110px] max-h-[160px] w-full items-center justify-center overflow-hidden rounded-lg bg-white/80 p-1">
          {activeSrc && !imageError ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={activeSrc}
              alt={prompt || "Hình ảnh minh họa câu hỏi"}
              className="max-h-[150px] w-auto max-w-full rounded-lg object-contain shadow-sm transition duration-200 hover:scale-[1.02]"
              loading="eager"
              onError={handleImageError}
            />
          ) : (
            <div className="flex flex-col items-center justify-center p-3 text-center text-gray-500">
              <div className="mb-1 grid h-9 w-9 place-items-center rounded-xl bg-violet-100 text-violet-600 shadow-inner">
                <Sparkles size={18} />
              </div>
              <span className="text-[11px] font-extrabold uppercase tracking-wider text-violet-700">
                {category}
              </span>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
