import Image from "next/image";

const MAILTO =
  "mailto:contact@jazeratx.com?subject=Tonary%20early%20access&body=I'd%20like%20early%20access%20to%20Tonary.";

const modules = [
  {
    name: "Scout",
    glyph: "◎",
    blurb: "Match plugins, presets, and chains to what you're going for.",
    status: "Available",
  },
  {
    name: "Vault",
    glyph: "▤",
    blurb: "A curated library of plugin, preset, and parameter records.",
    status: "Available",
  },
  {
    name: "Briefs",
    glyph: "⇄",
    blurb: "Compare two plugins side by side, with evidence-backed notes.",
    status: "Available",
  },
  {
    name: "Flow",
    glyph: "❯",
    blurb: "Workflow recipes, setup paths, and sound-design playbooks.",
    status: "Soon",
  },
  {
    name: "Review",
    glyph: "✓",
    blurb: "Source review with cited, evidence-backed notes.",
    status: "Soon",
  },
];

const features = [
  {
    title: "Offline-first",
    body: "The whole library lives on-device. No account, no network required — it opens instantly and works on the plane.",
  },
  {
    title: "Evidence-backed",
    body: "Every fact cites its source. Nothing is fabricated — unknown values stay flagged, never guessed.",
  },
  {
    title: "Dark-first",
    body: "Built for low-light studio sessions from the first pixel. Calm, legible, and easy on the eyes at 2am.",
  },
  {
    title: "Mobile-first",
    body: "Thumb-reachable, one-handed, designed for phone widths — your reference where the ideas actually happen.",
  },
];

const shots = [
  { src: "/shots/home.png", label: "Home" },
  { src: "/shots/onboarding.png", label: "Onboarding" },
  { src: "/shots/vault.png", label: "Vault" },
];

function Wordmark() {
  return (
    <span className="inline-flex items-center gap-2.5">
      <Image src="/mark.png" alt="" width={28} height={28} priority />
      <span className="font-display text-lg font-bold tracking-tight">
        Tonary<span className="text-amber">.io</span>
      </span>
    </span>
  );
}

export default function Home() {
  return (
    <div className="relative overflow-x-hidden">
      {/* Ambient backdrop — subtle radial, not glow-as-meaning */}
      <div
        aria-hidden
        className="pointer-events-none absolute inset-x-0 top-0 h-[600px] bg-[radial-gradient(60%_60%_at_50%_0%,rgba(56,189,248,0.06),transparent_70%)]"
      />

      {/* Nav */}
      <header className="sticky top-0 z-50 border-b border-outline/40 bg-bg-app/80 backdrop-blur">
        <nav className="mx-auto flex h-16 max-w-6xl items-center justify-between px-6">
          <Wordmark />
          <div className="flex items-center gap-6">
            <a
              href="#modules"
              className="hidden text-sm text-text-secondary transition-colors hover:text-text-primary sm:block"
            >
              Modules
            </a>
            <a
              href="#features"
              className="hidden text-sm text-text-secondary transition-colors hover:text-text-primary sm:block"
            >
              Features
            </a>
            <a
              href={MAILTO}
              className="rounded-lg bg-amber px-4 py-2 text-sm font-semibold text-bg-app transition-colors hover:bg-amber-hover"
            >
              Get early access
            </a>
          </div>
        </nav>
      </header>

      <main className="relative mx-auto max-w-6xl px-6">
        {/* Hero */}
        <section className="grid grid-cols-1 items-center gap-12 py-20 md:grid-cols-2 md:py-28">
          <div>
            <p className="mb-5 inline-flex items-center gap-2 rounded-full border border-outline bg-surface-card px-3 py-1 font-mono text-xs text-text-secondary">
              <span className="h-1.5 w-1.5 rounded-full bg-green" />
              Dark-first · Offline-first · Evidence-backed
            </p>
            <h1 className="font-display text-4xl font-bold leading-[1.05] tracking-tight sm:text-5xl lg:text-6xl">
              Sound-design intelligence for FL Studio producers.
            </h1>
            <p className="mt-6 max-w-xl text-lg leading-relaxed text-text-secondary">
              Tonary helps you organize, understand, compare, recall, and apply
              plugin knowledge — on mobile, offline — without flattening the
              creative process.
            </p>
            <div className="mt-8 flex flex-wrap items-center gap-3">
              <a
                href={MAILTO}
                className="rounded-lg bg-amber px-5 py-3 font-semibold text-bg-app transition-colors hover:bg-amber-hover"
              >
                Get early access
              </a>
              <a
                href="#modules"
                className="rounded-lg border border-outline bg-surface-card px-5 py-3 font-semibold text-text-primary transition-colors hover:bg-surface-raised"
              >
                See the modules
              </a>
            </div>
            <p className="mt-4 font-mono text-xs text-text-muted">
              iOS &amp; Android · no account · works fully offline
            </p>
          </div>

          {/* Phone hero */}
          <div className="flex justify-center md:justify-end">
            <PhoneFrame src="/shots/home.png" priority />
          </div>
        </section>

        {/* Modules */}
        <section id="modules" className="scroll-mt-20 py-16">
          <SectionHeading
            eyebrow="The modules"
            title="Five ways to move faster"
            sub="Each module does one thing well — and every answer traces back to a cited source."
          />
          <div className="mt-10 grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {modules.map((m) => (
              <div
                key={m.name}
                className="rounded-2xl border border-outline bg-surface-card p-6 transition-colors hover:bg-surface-raised"
              >
                <div className="flex items-center justify-between">
                  <span className="flex h-10 w-10 items-center justify-center rounded-lg border border-outline bg-surface-raised text-lg text-text-primary">
                    {m.glyph}
                  </span>
                  <StatusPill status={m.status} />
                </div>
                <h3 className="mt-4 font-display text-xl font-semibold">
                  {m.name}
                </h3>
                <p className="mt-2 text-sm leading-relaxed text-text-secondary">
                  {m.blurb}
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* Features */}
        <section id="features" className="scroll-mt-20 py-16">
          <SectionHeading
            eyebrow="Why Tonary"
            title="A reference that respects the craft"
            sub="Not a plugin database. Not an AI chatbot. Not a DAW. A calm, trustworthy intelligence layer."
          />
          <div className="mt-10 grid grid-cols-1 gap-px overflow-hidden rounded-2xl border border-outline bg-outline/60 sm:grid-cols-2">
            {features.map((f) => (
              <div key={f.title} className="bg-surface-card p-8">
                <h3 className="font-display text-lg font-semibold">{f.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-text-secondary">
                  {f.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* Showcase */}
        <section className="py-16">
          <SectionHeading
            eyebrow="On device"
            title="Built for the phone in your hand"
            sub="Calm, dark, thumb-reachable — designed for 360–430pt widths first."
          />
          <div className="mt-12 flex flex-wrap items-end justify-center gap-8">
            {shots.map((s, i) => (
              <div
                key={s.src}
                className={i === 1 ? "order-first sm:order-none" : ""}
              >
                <PhoneFrame src={s.src} small={i !== 1} />
                <p className="mt-4 text-center font-mono text-xs uppercase tracking-wider text-text-muted">
                  {s.label}
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* CTA band */}
        <section className="py-16">
          <div className="relative overflow-hidden rounded-3xl border border-outline bg-surface-card p-10 text-center sm:p-16">
            <div
              aria-hidden
              className="pointer-events-none absolute inset-0 bg-[radial-gradient(50%_80%_at_50%_0%,rgba(255,177,59,0.08),transparent_70%)]"
            />
            <div className="relative">
              <Image
                src="/mark.png"
                alt=""
                width={56}
                height={56}
                className="mx-auto"
              />
              <h2 className="mx-auto mt-6 max-w-2xl font-display text-3xl font-bold tracking-tight sm:text-4xl">
                Move faster — without losing the plot.
              </h2>
              <p className="mx-auto mt-4 max-w-xl text-text-secondary">
                Be first to try Tonary when early access opens.
              </p>
              <a
                href={MAILTO}
                className="mt-8 inline-block rounded-lg bg-amber px-6 py-3 font-semibold text-bg-app transition-colors hover:bg-amber-hover"
              >
                Get early access
              </a>
            </div>
          </div>
        </section>
      </main>

      {/* Footer */}
      <footer className="border-t border-outline/40">
        <div className="mx-auto max-w-6xl px-6 py-12">
          <div className="flex flex-col justify-between gap-8 sm:flex-row">
            <div className="max-w-md">
              <Wordmark />
              <p className="mt-4 text-sm leading-relaxed text-text-muted">
                A dark-first sound-design intelligence layer for FL Studio
                producers. Offline-first · single-device · no account.
              </p>
            </div>
            <div className="text-sm">
              <p className="font-mono text-xs uppercase tracking-wider text-text-secondary">
                Contact
              </p>
              <a
                href="mailto:contact@jazeratx.com"
                className="mt-2 inline-block text-text-primary transition-colors hover:text-amber"
              >
                contact@jazeratx.com
              </a>
            </div>
          </div>
          <div className="mt-10 border-t border-outline/40 pt-6">
            <p className="text-xs leading-relaxed text-text-muted">
              Tonary is independent — not affiliated with, endorsed by, or
              sponsored by Image-Line. “FL Studio” and “Image-Line” are
              trademarks of their respective owners, used here only to describe
              compatibility.
            </p>
            <p className="mt-3 text-xs text-text-muted">
              © 2026 Tonary. All rights reserved.
            </p>
          </div>
        </div>
      </footer>
    </div>
  );
}

function SectionHeading({
  eyebrow,
  title,
  sub,
}: {
  eyebrow: string;
  title: string;
  sub: string;
}) {
  return (
    <div className="max-w-2xl">
      <p className="font-mono text-xs uppercase tracking-wider text-cyan">
        {eyebrow}
      </p>
      <h2 className="mt-3 font-display text-3xl font-bold tracking-tight sm:text-4xl">
        {title}
      </h2>
      <p className="mt-3 text-text-secondary">{sub}</p>
    </div>
  );
}

function StatusPill({ status }: { status: string }) {
  const available = status === "Available";
  return (
    <span
      className={`inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 font-mono text-[11px] ${
        available ? "text-green" : "text-text-muted"
      }`}
    >
      <span
        className={`h-1.5 w-1.5 rounded-full ${
          available ? "bg-green" : "bg-text-muted"
        }`}
      />
      {status}
    </span>
  );
}

function PhoneFrame({
  src,
  small = false,
  priority = false,
}: {
  src: string;
  small?: boolean;
  priority?: boolean;
}) {
  const w = small ? 220 : 270;
  const h = Math.round((w * 844) / 390);
  return (
    <div className="rounded-[2.4rem] border border-outline bg-bg-shell p-2 shadow-2xl shadow-black/50">
      <Image
        src={src}
        alt=""
        width={w}
        height={h}
        priority={priority}
        className="rounded-[2rem]"
      />
    </div>
  );
}
