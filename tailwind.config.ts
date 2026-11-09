import type { Config } from "tailwindcss";
const config: Config = {
  content: ["./app/**/*.{js,ts,jsx,tsx,mdx}", "./components/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: { extend: {
    colors: {
      ink: "#111827",
      violet: { 450: "#8170f4", 550: "#6955e8" },
      paper: "#f7f7fb"
    },
    boxShadow: { soft: "0 18px 60px rgba(30, 27, 75, .09)" }
  }},
  plugins: [],
};
export default config;
