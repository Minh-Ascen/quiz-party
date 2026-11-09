"use client";

import { useEffect, useRef, useState } from "react";
import { Player } from "@/lib/types";
import { soundFX } from "@/lib/soundEffects";
import { ArrowLeft, Crown, RotateCcw, Sparkles, Trophy } from "lucide-react";

interface PodiumCeremonyProps {
  players: Player[];
  onRestart: () => void;
  isHost: boolean;
}

/**
 * Hiệu ứng pháo hoa Canvas mừng chiến thắng rực rỡ
 */
function FireworksCanvas() {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    let animId: number;
    let width = (canvas.width = window.innerWidth);
    let height = (canvas.height = window.innerHeight);

    const handleResize = () => {
      if (!canvas) return;
      width = canvas.width = window.innerWidth;
      height = canvas.height = window.innerHeight;
    };
    window.addEventListener("resize", handleResize);

    interface Particle {
      x: number;
      y: number;
      vx: number;
      vy: number;
      alpha: number;
      color: string;
      size: number;
    }

    interface Rocket {
      x: number;
      y: number;
      targetY: number;
      vy: number;
      color: string;
    }

    const colors = [
      "#f59e0b",
      "#ef4444",
      "#38bdf8",
      "#10b981",
      "#8b5cf6",
      "#ec4899",
      "#ffffff",
      "#facc15"
    ];
    const rockets: Rocket[] = [];
    const particles: Particle[] = [];

    const launchRocket = () => {
      rockets.push({
        x: Math.random() * (width - 200) + 100,
        y: height,
        targetY: Math.random() * (height * 0.45) + height * 0.1,
        vy: -(Math.random() * 4 + 11),
        color: colors[Math.floor(Math.random() * colors.length)]
      });
    };

    const explode = (x: number, y: number, color: string) => {
      const count = 55 + Math.floor(Math.random() * 30);
      for (let i = 0; i < count; i++) {
        const angle = (Math.PI * 2 * i) / count + (Math.random() - 0.5) * 0.3;
        const speed = Math.random() * 6.5 + 2.5;
        particles.push({
          x,
          y,
          vx: Math.cos(angle) * speed,
          vy: Math.sin(angle) * speed,
          alpha: 1,
          color,
          size: Math.random() * 3.5 + 2
        });
      }
    };

    // Khởi động sẵn 3 quả pháo hoa ngay lập tức
    launchRocket();
    launchRocket();
    launchRocket();

    let frame = 0;
    const loop = () => {
      frame++;
      ctx.clearRect(0, 0, width, height);

      // Bắn pháo hoa liên tục mỗi 15-20 frame
      if (frame % 18 === 0) {
        launchRocket();
      }

      // Cập nhật tên lửa bay lên
      for (let i = rockets.length - 1; i >= 0; i--) {
        const r = rockets[i];
        r.y += r.vy;
        ctx.fillStyle = r.color;
        ctx.beginPath();
        ctx.arc(r.x, r.y, 3.5, 0, Math.PI * 2);
        ctx.fill();

        if (r.y <= r.targetY) {
          explode(r.x, r.y, r.color);
          rockets.splice(i, 1);
        }
      }

      // Cập nhật tia pháo hoa rơi tỏa sáng
      for (let i = particles.length - 1; i >= 0; i--) {
        const p = particles[i];
        p.x += p.vx;
        p.y += p.vy;
        p.vy += 0.085; // trọng lực
        p.vx *= 0.98; // sức cản gió
        p.alpha -= 0.014;

        ctx.fillStyle = p.color;
        ctx.globalAlpha = Math.max(0, p.alpha);
        ctx.beginPath();
        ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
        ctx.fill();

        if (p.alpha <= 0) {
          particles.splice(i, 1);
        }
      }
      ctx.globalAlpha = 1;

      animId = requestAnimationFrame(loop);
    };

    loop();

    return () => {
      cancelAnimationFrame(animId);
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  return (
    <canvas
      ref={canvasRef}
      className="pointer-events-none fixed inset-0 z-50 h-full w-full"
    />
  );
}

export function PodiumCeremony({ players, onRestart, isHost }: PodiumCeremonyProps) {
  const sorted = [...players].sort((a, b) => b.score - a.score);
  const first = sorted[0];
  const second = sorted[1];
  const third = sorted[2];
  const remaining = sorted.slice(3);

  // Giai đoạn công bố lần lượt: 0 (chuẩn bị) -> 1 (Top 3) -> 2 (Top 2) -> 3 (Top 1 + Pháo hoa)
  const [stage, setStage] = useState(0);

  useEffect(() => {
    // 1. Công bố Top 3 sau 1s
    const t1 = setTimeout(() => {
      setStage(1);
      soundFX.playSelect();
    }, 1000);

    // 2. Công bố Top 2 sau 3s
    const t2 = setTimeout(() => {
      setStage(2);
      soundFX.playSelect();
    }, 3000);

    // 3. Công bố Top 1 (Quán Quân) sau 5s kèm Fanfare & Pháo hoa
    const t3 = setTimeout(() => {
      setStage(3);
      soundFX.playFanfare();
    }, 5000);

    return () => {
      clearTimeout(t1);
      clearTimeout(t2);
      clearTimeout(t3);
    };
  }, []);

  return (
    <div className="relative mx-auto max-w-4xl overflow-hidden rounded-3xl bg-gradient-to-b from-[#1e1b4b] via-[#2e1065] to-[#0f172a] p-6 text-white shadow-2xl md:p-10 my-auto">
      {/* Pháo hoa bắn chúc mừng khi công bố Quán quân (stage 3) */}
      {stage >= 3 && <FireworksCanvas />}

      <div className="pattern absolute inset-0 opacity-20 pointer-events-none" />

      <div className="relative z-10 text-center">
        <div className="inline-flex items-center gap-2 rounded-full border border-amber-400/40 bg-amber-400/10 px-4 py-1.5 text-xs font-black tracking-wider text-amber-300">
          <Sparkles size={16} /> LỄ TRAO GIẢI GAMESHOW QUIZ PARTY
        </div>
        <h1 className="mt-3 text-3xl font-black md:text-5xl">
          {stage < 3 ? "Đang Công Bố Bảng Vàng..." : "Chúc Mừng Nhà Vô Địch! 🎉"}
        </h1>
        <p className="mt-2 text-sm text-purple-200/80">
          {stage === 0 && "Hồi hộp chuẩn bị công bố Top 3 xuất sắc nhất..."}
          {stage === 1 && "Chúc mừng Huy chương Đồng (Hạng Ba)!"}
          {stage === 2 && "Chúc mừng Huy chương Bạc (Hạng Nhì)!"}
          {stage >= 3 && "Vinh danh Quán quân với số điểm kỷ lục!"}
        </p>

        {/* BỤC VINH QUANG TOP 3 (CÔNG BỐ LẦN LƯỢT TỪ TOP 3 -> TOP 2 -> TOP 1) */}
        <div className="mx-auto mt-10 grid max-w-2xl grid-cols-3 items-end gap-2 md:gap-4 min-h-[320px]">
          {/* HẠNG 2 (BẠC) - CÔNG BỐ Ở GIAI ĐOẠN 2 */}
          <div className="flex flex-col items-center">
            {stage >= 2 && second ? (
              <div className="mb-2 flex flex-col items-center animate-bounce">
                <span className="text-3xl md:text-4xl">{second.avatar || "🐻"}</span>
                <span className="mt-1 max-w-[90px] truncate text-xs font-extrabold text-slate-200 md:text-sm">
                  {second.display_name}
                </span>
                <span className="rounded-full bg-slate-700/80 px-2.5 py-0.5 text-[11px] font-black text-slate-200 shadow">
                  {second.score.toLocaleString()} đ
                </span>
              </div>
            ) : (
              <div className="mb-3 grid h-12 w-12 place-items-center rounded-full bg-slate-800/80 text-slate-500 font-black text-lg border border-slate-700">
                ?
              </div>
            )}
            <div className="flex h-36 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-slate-300 bg-gradient-to-b from-slate-400/30 to-slate-800/80 p-3 shadow-lg md:h-44">
              <div className="grid h-9 w-9 place-items-center rounded-full bg-slate-300 font-black text-slate-900 shadow">
                2
              </div>
              <div className="text-center">
                <div className="text-xs font-black text-slate-200">HẠNG NHÌ</div>
                <div className="text-[10px] font-bold text-slate-400">HUY CHƯƠNG BẠC</div>
              </div>
            </div>
          </div>

          {/* HẠNG 1 (VÀNG) - CÔNG BỐ Ở GIAI ĐOẠN 3 (CUỐI CÙNG & CAO NHẤT) */}
          <div className="flex flex-col items-center">
            {stage >= 3 && first ? (
              <div className="mb-2 flex flex-col items-center animate-pulse">
                <Crown className="text-amber-400 animate-bounce" size={36} />
                <span className="text-4xl md:text-5xl">{first.avatar || "🦊"}</span>
                <span className="mt-1 max-w-[120px] truncate text-sm font-black text-amber-300 md:text-base">
                  {first.display_name}
                </span>
                <span className="rounded-full bg-amber-400 px-3 py-1 text-xs font-black text-amber-950 shadow-lg">
                  {first.score.toLocaleString()} điểm
                </span>
              </div>
            ) : (
              <div className="mb-3 grid h-14 w-14 place-items-center rounded-full bg-amber-950/80 text-amber-400 font-black text-2xl border-2 border-amber-500/50 animate-pulse">
                👑 ?
              </div>
            )}
            <div className="flex h-48 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-amber-400 bg-gradient-to-b from-amber-500/40 to-amber-950/90 p-3 shadow-2xl md:h-60">
              <div className="grid h-12 w-12 place-items-center rounded-full bg-gradient-to-tr from-amber-400 to-yellow-200 font-black text-amber-950 shadow-lg">
                <Trophy size={24} />
              </div>
              <div className="text-center">
                <div className="text-sm font-black text-amber-300">QUÁN QUÂN</div>
                <div className="text-[11px] font-bold text-amber-200/80">CÚP VÀNG</div>
              </div>
            </div>
          </div>

          {/* HẠNG 3 (ĐỒNG) - CÔNG BỐ ĐẦU TIÊN Ở GIAI ĐOẠN 1 */}
          <div className="flex flex-col items-center">
            {stage >= 1 && third ? (
              <div className="mb-2 flex flex-col items-center animate-bounce">
                <span className="text-3xl md:text-4xl">{third.avatar || "🐼"}</span>
                <span className="mt-1 max-w-[90px] truncate text-xs font-extrabold text-amber-200 md:text-sm">
                  {third.display_name}
                </span>
                <span className="rounded-full bg-amber-900/80 px-2.5 py-0.5 text-[11px] font-black text-amber-200 shadow">
                  {third.score.toLocaleString()} đ
                </span>
              </div>
            ) : (
              <div className="mb-3 grid h-12 w-12 place-items-center rounded-full bg-amber-950/80 text-amber-600 font-black text-lg border border-amber-900">
                ?
              </div>
            )}
            <div className="flex h-28 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-amber-700 bg-gradient-to-b from-amber-700/30 to-amber-950/80 p-3 shadow-md md:h-36">
              <div className="grid h-8 w-8 place-items-center rounded-full bg-amber-700 font-black text-amber-100 shadow">
                3
              </div>
              <div className="text-center">
                <div className="text-xs font-black text-amber-500">HẠNG BA</div>
                <div className="text-[10px] font-bold text-amber-600/80">HUY CHƯƠNG ĐỒNG</div>
              </div>
            </div>
          </div>
        </div>

        {/* BẢNG TỔNG KẾT ĐẦY ĐỦ */}
        <div className="mx-auto mt-8 max-w-2xl rounded-2xl border border-white/10 bg-white/5 p-4 text-left backdrop-blur-md">
          <div className="mb-3 flex items-center justify-between text-xs font-bold uppercase tracking-wider text-purple-200">
            <span>Bảng xếp hạng chung cuộc ({sorted.length} người)</span>
            <span>Tổng điểm</span>
          </div>
          <div className="max-h-64 space-y-2 overflow-y-auto pr-1">
            {sorted.map((p, idx) => (
              <div
                key={p.id}
                className={`flex items-center justify-between rounded-xl px-4 py-3 transition ${
                  idx === 0
                    ? "border border-amber-400/40 bg-amber-400/15 text-white"
                    : "bg-white/5 hover:bg-white/10 text-slate-200"
                }`}
              >
                <div className="flex items-center gap-3">
                  <span
                    className={`grid h-7 w-7 place-items-center rounded-lg text-xs font-black ${
                      idx === 0
                        ? "bg-amber-400 text-amber-950"
                        : idx === 1
                        ? "bg-slate-300 text-slate-900"
                        : idx === 2
                        ? "bg-amber-700 text-white"
                        : "bg-slate-800 text-slate-400"
                    }`}
                  >
                    #{idx + 1}
                  </span>
                  <span className="text-2xl">{p.avatar || "🦊"}</span>
                  <div>
                    <div className="font-bold flex items-center gap-2">
                      <span>{p.display_name}</span>
                      {p.is_host && (
                        <span className="rounded bg-amber-400/20 px-1.5 py-0.2 text-[9px] font-black text-amber-300">
                          HOST
                        </span>
                      )}
                    </div>
                  </div>
                </div>
                <div className="text-right">
                  <span className="font-mono text-base font-black text-amber-300">
                    {p.score.toLocaleString()}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* NÚT ĐIỀU KHIỂN CHƠI LẠI HOẶC VỀ MENU */}
        <div className="mt-8 flex flex-wrap items-center justify-center gap-3">
          {isHost ? (
            <button
              onClick={onRestart}
              className="flex items-center gap-2 rounded-2xl bg-gradient-to-r from-amber-400 to-yellow-500 px-8 py-3.5 text-sm font-black text-slate-950 shadow-xl shadow-amber-500/20 transition hover:brightness-110 active:scale-95"
            >
              <RotateCcw size={18} /> Chơi Lại Ván Mới
            </button>
          ) : (
            <button
              onClick={onRestart}
              className="flex items-center gap-2 rounded-2xl bg-white/10 border border-white/20 px-6 py-3.5 text-sm font-bold text-white hover:bg-white/20 transition"
            >
              <ArrowLeft size={18} /> Về Trang Chủ
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
