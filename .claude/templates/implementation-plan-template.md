# Implementation Plan — `<Feature / Task>`

> Copy and fill. Keep the architecture layered but pragmatic: presentation → domain → data.
> Related: [feature-spec-template.md](feature-spec-template.md) · [qa-report-template.md](qa-report-template.md)

## Summary
- **Feature:** `<name>` · **Module:** `<Scout | Vault | Review | Flow | Briefs>`
- **Goal:** `<one sentence>`
- **Author / Date:** `<name>` / `<YYYY-MM-DD>`

## Task Breakdown
1. `<task>` — `<est>`
2. `<task>` — `<est>`
3. `<task>` — `<est>`

## Files to Touch (by lib/ folder)
| Layer | Path | Change |
|---|---|---|
| design_system | `lib/design_system/tokens/` | `<add/verify token>` |
| shared | `lib/shared/widgets/` | `<new widget>` |
| domain | `lib/features/<mod>/domain/` | `<model / use-case>` |
| data | `lib/data/repositories/` | `<repository + source>` |
| data | `lib/data/dto/` + `mappers/` | `<DTO ↔ model>` |
| presentation | `lib/features/<mod>/presentation/` | `<screen + controller>` |
| app | `lib/app/router/` | `<route entry>` |

## Order & Dependencies
- Build order: `<data → domain → presentation>` (bottom-up recommended).
- Blocked by: `<other feature / seed data>`.
- `Recommendation:` state = Riverpod; routing = go_router; storage = Drift (SQLite).

## Test Plan
- Unit: `<domain use-cases, mappers>`
- Widget/Golden: `<screen states at 390px, dark>`
- Integration: `<offline flow, repository against seed JSON>`

## Verification Steps
1. `flutter analyze` clean.
2. `flutter test` green.
3. Manual: launch on `<iOS sim / Android emu>`, walk `<flow>` with network OFF.
4. Confirm brand/color law (amber = action only).

## Rollback
- `<feature flag / revert commit>` — `<data migration reversible? Y/N>`
