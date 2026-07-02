# Tonary.io — Project Overview

> Orientation for any Claude session or contributor. Start here, then read `../../CLAUDE.md`.

## One-liner
Tonary is a premium, mobile-first (Flutter) dark-first **sound-design intelligence layer** for FL Studio producers. Project/web identity: **Tonary.io**.

## Current status (2026-07-02)
- **Phase 0 — Foundation.** This `.claude/` framework exists; **no Flutter code yet.** Do not scaffold a full app without explicit confirmation.
- Brand system adopted from `Tonary Brand Kit/`. Content strategy defined as *migration map*, not import.

## Repository layout
```
Tonary.io/
├── CLAUDE.md          operating manual (read every session)
└── .claude/
    ├── project/       this overview, product foundation, principles, scope, roadmap, terminology
    ├── architecture/  Flutter mobile architecture, data/AI/offline/testing strategy
    ├── brand/         brand law, voice, visual direction, naming, UI language
    ├── rules/         engineering + content + QA rules
    ├── workflows/     repeatable step-by-step processes
    ├── agents/        reusable Claude specialist roles
    ├── commands/      copy/paste command prompts
    ├── schemas/       Tonary data record schemas (evidence-backed)
    ├── templates/     fill-in scaffolds
    ├── memory/        durable decisions, constraints, glossary, open questions, risks
    └── outputs/       source inventory, migration map, foundation report, next steps
```

## Modules
Scout (AI matching) · Vault (curated records) · Review (evidence-backed notes) · Flow (workflow recipes) · Briefs (fast explanations/comparisons). These map to `lib/features/`.

## Tech direction (Recommendations — see `../architecture/`)
Flutter (iOS+Android) · Riverpod · go_router · Drift/SQLite + bundled seed JSON · freezed. Offline-first, layered architecture.

## Source folders (siblings of `Tonary.io/`, do not modify)
- `2026 — FL Studio Plugin ~ DEEPER DIVES/` — primary content source.
- `FL-Studio-Master-Hub/` — legacy Next.js web app; learn the data model, discard the rest.
- `Tonary Brand Kit/` — adopted brand foundation.
- `Project - FL Studio Plugin/` — superseded archive (fallback only).
See `../outputs/source-inventory.md`.

## How to work here
1. Read `../../CLAUDE.md` (§11 = never-do list).
2. Pick the relevant command in `../commands/` and follow its workflow in `../workflows/`.
3. Respect brand law (`../brand/`) and rules (`../rules/`).
4. Record durable decisions in `../memory/decisions.md`; log unknowns in `../memory/open-questions.md`.
5. Report work per `CLAUDE.md` §12.

## Immediate next steps
See `../outputs/next-steps.md`.
