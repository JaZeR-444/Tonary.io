# Tonary — Product Principles

> Durable decisions that outlive any single feature. When a trade-off is unclear, these win.
> Related: [target-user.md](target-user.md) · [mvp-scope.md](mvp-scope.md) · [roadmap.md](roadmap.md) · [terminology.md](terminology.md)

Tonary is a premium, dark-first **sound-design intelligence layer** for FL Studio producers, beatmakers, sound designers, and plugin-heavy creators. It helps them organize, understand, compare, recall, and apply plugin/preset/workflow knowledge on mobile — without flattening the creative process.

## The Principles

1. **Mobile-first, always.** Every screen is designed for a phone in portrait first (360–430px), offline in a studio or on the move. Desktop-first layouts are rejected. Tablet is an adaptation, never the baseline.

2. **Premium and restrained.** The interface is calm, dark, and confident. Density over decoration. We spend attention on clarity, not ornament. No glassmorphism, no neon cyberpunk carryover from the legacy web app.

3. **Evidence-backed, never fabricated.** Plugin, preset, and parameter facts come from real sources. When we don't know, we say `Open Question:` — we never invent capabilities, values, or claims. Tonary Review exists to keep notes tied to sources.

4. **Source, not blueprint.** Legacy content and third-party material are strategic *input*, not something we copy wholesale. We map, curate, and rewrite into Tonary schemas rather than bulk-importing.

5. **Offline-first.** Core value works with no network: Vault records, Briefs, saved items, and search all resolve from local storage (Drift/SQLite + bundled seed). The cloud enriches; it is never a prerequisite for the core view.

6. **Sound-design intelligence, not a database.** We are not a plugin wiki. Value lives in comparison, recall, recommendation, and applied workflow — helping the *next action*, not just listing facts.

7. **Assistant only when it helps.** Tonary is not an "AI chatbot first." AI (Tonary Scout) surfaces recommendations and matches at the moment of decision. If a plain list or filter serves better, we use that instead.

8. **Respect the creative process.** We speed producers up without dictating taste. No forced "correct" sound. Suggestions are optional, dismissible, and never block the user's own direction.

9. **Accessibility is non-negotiable.** AA contrast on dark, tap targets ≥48dp, semantics on every control, and `prefers-reduced-motion` honored (`MediaQuery.disableAnimations`). Never convey meaning by color alone.

10. **Modular by design.** Only five official modules exist — **Scout, Vault, Review, Flow, Briefs**. Features map cleanly to one. We do not spawn parallel concepts or reuse FL Studio interface terms (Browser, Channel Rack, Mixer, Playlist) as Tonary-owned names.

11. **Color law is disciplined.** Violet = brand action (and nothing else decorative). Lavender = focus/system. Green = success. Lavender = exploratory. Rose = exceptional. `text-muted` is placeholder/microcopy only, never body text.

12. **Pragmatic architecture.** Clean-ish layers (presentation → domain → data), not over-engineering. `Recommendation:` Riverpod + go_router + Drift. Ship value; refactor when a real seam appears.

## Applying These
Every [feature spec](../templates/feature-spec-template.md) should trace at least one principle in its Problem section. QA checks the color law and offline/accessibility principles explicitly — see [qa-report-template.md](../templates/qa-report-template.md).
