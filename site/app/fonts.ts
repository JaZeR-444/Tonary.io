import localFont from "next/font/local";

/// Self-hosted brand typefaces (OFL) — no network fetch, brand-accurate.
/// Inter (UI), Space Grotesk (display/hero), IBM Plex Mono (IDs/labels).
export const inter = localFont({
  src: "./fonts/Inter-Variable.ttf",
  variable: "--font-inter",
  display: "swap",
});

export const spaceGrotesk = localFont({
  src: "./fonts/SpaceGrotesk-Variable.ttf",
  variable: "--font-space-grotesk",
  display: "swap",
});

export const plexMono = localFont({
  src: [
    { path: "./fonts/IBMPlexMono-Regular.ttf", weight: "400" },
    { path: "./fonts/IBMPlexMono-Medium.ttf", weight: "500" },
  ],
  variable: "--font-plex-mono",
  display: "swap",
});
