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

  const isSongGuess =
    type === "AUDIO_GUESS" ||
    type === "VIDEO_GUESS" ||
    Boolean(youtubeVideoId) ||
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
    <div className="mx-auto my-4 w-full max-w-xl overflow-hidden rounded-2xl border border-violet-100 bg-gradient-to-b from-violet-50/60 to-slate-50/80 p-2 shadow-inner">
      {/* 1. GUESS THE SONG: YOUTUBE EMBED OR AUDIO */}
      {isSongGuess && youtubeVideoId && !ytBlocked && (
        <div className="relative aspect-video w-full overflow-hidden rounded-xl bg-black shadow-md">
          <iframe
            src={`https://www.youtube.com/embed/${youtubeVideoId}?autoplay=1&rel=0&modestbranding=1`}
            title="Đoán tên bài hát"
            className="h-full w-full border-0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
            onError={() => setYtBlocked(true)}
          />
          <div className="absolute bottom-2 right-2 rounded-md bg-black/75 px-2.5 py-1 text-[11px] font-semibold text-white">
            <Youtube className="mr-1 inline text-red-500" size={13} />
            Đoán tên bài hát qua Video
          </div>
        </div>
      )}

      {/* 2. AUDIO PLAYER IF NO YOUTUBE OR IF YOUTUBE IS BLOCKED */}
      {isSongGuess && (!youtubeVideoId || ytBlocked) && (
        <div className="flex flex-col items-center justify-center p-5 text-center">
          {activeSrc && !imageError && (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={activeSrc}
              alt={prompt || "Hình ảnh bài hát"}
              className="mb-3 max-h-[180px] w-auto max-w-full rounded-xl object-contain shadow-sm"
              loading="lazy"
              onError={handleImageError}
            />
          )}
          <div className="flex items-center gap-2 rounded-full bg-violet-100 px-3 py-1 text-xs font-bold uppercase tracking-wider text-violet-700">
            <Music size={14} /> GUESS THE SONG · ĐOÁN BÀI HÁT
          </div>
          <p className="mt-1.5 text-xs font-semibold text-gray-600">
            Lắng nghe giai điệu và đoán tên bài hát cùng ca sĩ thể hiện!
          </p>

          {audioUrl ? (
            <div className="mt-3 flex items-center gap-3">
              <button
                type="button"
                onClick={() => toggleAudio(audioUrl)}
                className="flex items-center gap-2 rounded-xl bg-violet-600 px-5 py-2.5 text-sm font-bold text-white shadow transition hover:bg-violet-700 active:scale-95"
              >
                {isPlayingAudio ? <VolumeX size={18} /> : <Play size={18} />}
                {isPlayingAudio ? "Tạm dừng" : "Phát đoạn nhạc"}
              </button>
              {audioElement && (
                <button
                  type="button"
                  onClick={restartAudio}
                  title="Nghe lại từ đầu"
                  className="rounded-xl border border-gray-200 bg-white p-2.5 text-gray-700 hover:bg-gray-50"
                >
                  <RotateCcw size={18} />
                </button>
              )}
            </div>
          ) : (
            <div className="mt-2.5 rounded-xl bg-amber-50 px-4 py-1.5 text-xs font-medium text-amber-800">
              🎵 Hãy nhớ lại ca từ và giai điệu quen thuộc để chọn đáp án đúng!
            </div>
          )}
        </div>
      )}

      {/* 3. ILLUSTRATION IMAGE FOR EVERY QUESTION */}
      {!isSongGuess && (
        <div className="relative flex min-h-[180px] max-h-[260px] w-full items-center justify-center overflow-hidden rounded-xl bg-white/80 p-2">
          {activeSrc && !imageError ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={activeSrc}
              alt={prompt || "Hình ảnh minh họa câu hỏi"}
              className="max-h-[240px] w-auto max-w-full rounded-xl object-contain shadow-sm transition duration-300 hover:scale-[1.03]"
              loading="eager"
              onError={handleImageError}
            />
          ) : (
            <div className="flex flex-col items-center justify-center p-6 text-center text-gray-500">
              <div className="mb-2 grid h-14 w-14 place-items-center rounded-2xl bg-violet-100 text-violet-600 shadow-inner">
                <Sparkles size={26} />
              </div>
              <span className="text-xs font-extrabold uppercase tracking-wider text-violet-700">
                {category}
              </span>
              <span className="mt-1 text-xs text-gray-400">
                Hình ảnh minh họa chủ đề
              </span>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
