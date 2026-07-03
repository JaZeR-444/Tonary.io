import type { Metadata, Viewport } from "next";
import "./globals.css";
import { inter, spaceGrotesk, plexMono } from "./fonts";

const description =
  "A dark-first sound-design intelligence layer for FL Studio producers — organize, understand, compare, recall, and apply plugin knowledge on mobile, offline-first.";

export const metadata: Metadata = {
  metadataBase: new URL("https://tonary.io"),
  title: {
    default: "Tonary — sound-design intelligence for FL Studio",
    template: "%s · Tonary",
  },
  description,
  applicationName: "Tonary",
  keywords: [
    "FL Studio",
    "plugins",
    "sound design",
    "presets",
    "music production",
    "beatmaking",
    "offline",
  ],
  openGraph: {
    title: "Tonary — sound-design intelligence for FL Studio",
    description,
    siteName: "Tonary",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Tonary — sound-design intelligence for FL Studio",
    description,
  },
};

export const viewport: Viewport = {
  themeColor: "#08070f",
  colorScheme: "dark",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="en"
      className={`${inter.variable} ${spaceGrotesk.variable} ${plexMono.variable}`}
    >
      <body className="min-h-screen bg-bg-app font-sans text-text-primary antialiased">
        {children}
      </body>
    </html>
  );
}
