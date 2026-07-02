# Global Rules — Master Index

> The master rule set for building Tonary. Every other rule file inherits these principles.
> Tonary is a mobile-first Flutter, dark-first, offline-first sound-design intelligence layer for FL Studio producers.

## Prime directives
1. **Mobile-first Flutter.** iOS + Android, offline-first. No desktop-first layouts, ever. See [mobile-first-rules.md](mobile-first-rules.md).
2. **Legacy content is source, not blueprint.** The legacy FL Studio Master Hub (Next.js/React/Tailwind, purple
   "Deep Space Cyberpunk" theme) is a **different, discarded product**. Learn only its data-model ideas. Do not carry
   its web architecture, theme, or component code. See [content-migration-rules.md](content-migration-rules.md).
3. **Never fabricate.** Do not invent plugin data, parameter values, sources, or facts. If unknown, write an
   `Open Question:` or leave the field empty and flag it. Fabrication is the single worst failure mode. See [data-modeling-rules.md](data-modeling-rules.md).
4. **Never overwrite useful work without inspecting it first.** Read a file before replacing it. Preserve
   anything factual or reusable. Merge, don't clobber.
5. **No empty placeholder files.** Every file created must be substantive and non-empty. No lorem ipsum, no bare "TODO" stubs.
6. **Never report success unless the files/artifacts actually exist.** Verify before claiming done. See [qa-rules.md](qa-rules.md).
7. **Honor the brand kit.** The Tonary Brand Kit tokens are immutable source. Dark-first, the amber/cyan/green/violet/red
   color law, outline-control requirement. See [brand-rules.md](brand-rules.md) (code-review flavor) and
   [../brand/brand-rules.md](../brand/brand-rules.md) (fuller doc).

## Rule file index

| File | Governs |
| --- | --- |
| [flutter-rules.md](flutter-rules.md) | Flutter/Dart code: null-safety, Riverpod, architecture, deps, naming |
| [mobile-first-rules.md](mobile-first-rules.md) | Screen widths, thumb reach, bottom nav, tap targets, safe areas |
| [ui-ux-rules.md](ui-ux-rules.md) | Focus, motion, contrast, states, spacing — grounded in the brand kit |
| [data-modeling-rules.md](data-modeling-rules.md) | Schema conventions, ids, source references, no fabrication |
| [content-migration-rules.md](content-migration-rules.md) | Keep/rewrite/archive/ignore discipline for DEEPER DIVES content |
| [brand-rules.md](brand-rules.md) | Code-review brand guardrail checklist (fuller doc in ../brand/) |
| [qa-rules.md](qa-rules.md) | QA gates: existence, no fabrication, a11y, brand, build, tests |

## Architecture at a glance
Clean-ish layered architecture, pragmatic not over-engineered:
`presentation (features) → domain (models/use-cases) → data (repositories/sources)`.
Recommended `lib/` structure and package choices are in [flutter-rules.md](flutter-rules.md).
Modules map to feature folders: scout→Scout, vault→Vault, review→Review, flow→Flow, briefs→Briefs.

## Working posture
- Practical over theoretical. Ship a migration **map** before a bulk import.
- Label recommendations `Recommendation:` and unknowns `Open Question:`.
- Convert relative dates to absolute (today's context: 2026-07-02).
- Cross-link related rule/brand files with relative paths.
