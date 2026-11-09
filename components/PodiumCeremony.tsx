"use client";

import { useEffect } from "react";
import { Player } from "@/lib/types";
import { soundFX } from "@/lib/soundEffects";
import { ArrowLeft, Award, CheckCircle2, Clock, Crown, Flame, Sparkles, Trophy } from "lucide-react";

interface PodiumCeremonyProps {
  players: Player[];
  onRestart: () => void;
  isHost: boolean;
}

export function PodiumCeremony({ players, onRestart, isHost }: PodiumCeremonyProps) {
  const sorted = [...players].sort((a, b) => b.score - a.score);
  const first = sorted[0];
  const second = sorted[1];
  const third = sorted[2];
  const remaining = sorted.slice(3);

  useEffect(() => {
    soundFX.playFanfare();
  }, []);

  return (
    <div className="relative mx-auto max-w-4xl overflow-hidden rounded-3xl bg-gradient-to-b from-[#1e1b4b] via-[#2e1065] to-[#0f172a] p-6 text-white shadow-2xl md:p-10">
      {/* Background celebration particles */}
      <div className="pattern absolute inset-0 opacity-20" />

      <div className="relative z-10 text-center">
        <div className="inline-flex items-center gap-2 rounded-full border border-amber-400/40 bg-amber-400/10 px-4 py-1.5 text-xs font-black tracking-wider text-amber-300">
          <Sparkles size={16} /> LỄ TRAO GIẢI GAMESHOW QUIZ PARTY
        </div>
        <h1 className="mt-3 text-3xl font-black md:text-5xl">
          Chúc Mừng Nhà Vô Địch!
        </h1>
        <p className="mt-2 text-sm text-purple-200/80">
          Trận đấu đã khép lại sau những màn rượt đuổi điểm số nghẹt thở!
        </p>

        {/* TOP 3 PODIUM */}
        <div className="mx-auto mt-10 grid max-w-2xl grid-cols-3 items-end gap-2 md:gap-4">
          {/* HẠNG 2 (BẠC) */}
          <div className="flex flex-col items-center">
            {second && (
              <div className="mb-2 flex flex-col items-center animate-bounce">
                <span className="text-3xl">{second.avatar || "🐻"}</span>
                <span className="mt-1 max-w-[90px] truncate text-xs font-extrabold text-slate-200 md:text-sm">
                  {second.display_name}
                </span>
                <span className="rounded-full bg-slate-700/60 px-2 py-0.5 text-[11px] font-black text-slate-300">
                  {second.score.toLocaleString()} đ
                </span>
              </div>
            )}
            <div className="flex h-36 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-slate-300 bg-gradient-to-b from-slate-400/30 to-slate-800/80 p-3 shadow-lg md:h-44">
              <div className="grid h-9 w-9 place-items-center rounded-full bg-slate-300 font-black text-slate-900 shadow">
                2
              </div>
              <div className="text-center">
                <div className="text-xs font-bold text-slate-300">HẠNG NHÌ</div>
                <div className="text-[10px] text-slate-400">HUY CHƯƠNG BẠC</div>
              </div>
            </div>
          </div>

          {/* HẠNG 1 (VÀNG - CAO NHẤT) */}
          <div className="flex flex-col items-center">
            {first && (
              <div className="mb-2 flex flex-col items-center animate-pulse">
                <Crown className="text-amber-400" size={32} />
                <span className="text-4xl md:text-5xl">{first.avatar || "🦊"}</span>
                <span className="mt-1 max-w-[120px] truncate text-sm font-black text-amber-300 md:text-base">
                  {first.display_name}
                </span>
                <span className="rounded-full bg-amber-400 px-3 py-0.5 text-xs font-black text-amber-950 shadow-md">
                  {first.score.toLocaleString()} điểm
                </span>
              </div>
            )}
            <div className="flex h-48 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-amber-400 bg-gradient-to-b from-amber-500/40 to-amber-950/90 p-3 shadow-2xl md:h-60">
              <div className="grid h-12 w-12 place-items-center rounded-full bg-gradient-to-tr from-amber-400 to-yellow-200 font-black text-amber-950 shadow-lg">
                <Trophy size={24} />
              </div>
              <div className="text-center">
                <div className="text-sm font-black text-amber-300">QUÁN QUÂN</div>
                <div className="text-[11px] font-semibold text-amber-200/70">CÚP VÀNG</div>
              </div>
            </div>
          </div>

          {/* HẠNG 3 (ĐỒNG) */}
          <div className="flex flex-col items-center">
            {third && (
              <div className="mb-2 flex flex-col items-center animate-bounce">
                <span className="text-3xl">{third.avatar || "🐼"}</span>
                <span className="mt-1 max-w-[90px] truncate text-xs font-extrabold text-amber-200 md:text-sm">
                  {third.display_name}
                </span>
                <span className="rounded-full bg-amber-900/60 px-2 py-0.5 text-[11px] font-black text-amber-200">
                  {third.score.toLocaleString()} đ
                </span>
              </div>
            )}
            <div className="flex h-28 w-full flex-col items-center justify-between rounded-t-2xl border-t-4 border-amber-700 bg-gradient-to-b from-amber-700/30 to-amber-950/80 p-3 shadow-md md:h-36">
              <div className="grid h-8 w-8 place-items-center rounded-full bg-amber-700 font-black text-amber-100 shadow">
                3
              </div>
              <div className="text-center">
                <div className="text-xs font-bold text-amber-600">HẠNG BA</div>
                <div className="text-[10px] text-amber-700">HUY CHƯƠNG ĐỒNG</div>
              </div>
            </div>
          </div>
        </div>

        {/* BẢNG TỔNG KẾT CHI TIẾT */}
        <div className="mx-auto mt-8 max-w-2xl rounded-2xl border border-white/10 bg-white/5 p-4 text-left backdrop-blur-md">
          <div className="mb-3 flex items-center justify-between text-xs font-bold uppercase tracking-wider text-purple-200">
            <span>Bảng xếp hạng đầy đủ ({sorted.length} người chơi)</span>
            <span>Thống kê phong độ</span>
          </div>
          <div className="max-h-64 space-y-2 overflow-y-auto pr-1">
            {sorted.map((p, idx) => (
              <div
                key={p.id}
                className={`flex items-center justify-between rounded-xl px-4 py-3 transition ${
                  idx === 0
                    ? "border border-amber-400/30 bg-amber-400/10 text-white"
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
                    <div className="font-bold">{p.display_name}</div>
                    <div className="flex items-center gap-3 text-[11px] text-purple-200/60">
                      <span className="flex items-center gap-1">
                        <CheckCircle2 size={12} className="text-green-400" />
                        {p.correct_count ?? 0} câu đúng
                      </span>
                      {p.average_time ? (
                        <span className="flex items-center gap-1">
                          <Clock size={12} className="text-blue-300" />
                          {p.average_time}s / câu
                        </span>
                      ) : null}
                    </div>
                  </div>
                </div>

                <div className="text-right">
                  <div className="text-base font-black text-amber-400">
                    {p.score.toLocaleString()}
                  </div>
                  <div className="text-[10px] text-slate-400">điểm tổng</div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* NÚT THAO TÁC */}
        <div className="mt-8 flex flex-wrap justify-center gap-4">
          {isHost ? (
            <button
              onClick={onRestart}
              className="flex items-center gap-2 rounded-2xl bg-gradient-to-r from-amber-500 to-yellow-400 px-8 py-3.5 text-base font-black text-amber-950 shadow-lg shadow-amber-500/30 transition hover:brightness-110 active:scale-95"
            >
              <Flame size={20} /> Tạo Phòng Ván Mới
            </button>
          ) : (
            <button
              onClick={onRestart}
              className="flex items-center gap-2 rounded-2xl bg-white/10 px-6 py-3 text-sm font-bold text-white transition hover:bg-white/20 active:scale-95"
            >
              <ArrowLeft size={18} /> Về Trang Chủ
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

