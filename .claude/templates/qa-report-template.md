# QA Report — `<Feature / Release>`

> Copy and fill. Verdict must be evidence-backed, not assumed.
> Related: [implementation-plan-template.md](implementation-plan-template.md) · [changelog-template.md](changelog-template.md)

## Identity
- **Scope:** `<what was tested>`
- **Module(s):** `<Scout | Vault | Review | Flow | Briefs>`
- **Build / Commit:** `<sha / version>`
- **Tester / Date:** `<name>` / `<YYYY-MM-DD>`

## Checks Run
- [ ] Files exist & non-empty (`<key paths>`)
- [ ] `flutter analyze` clean
- [ ] `flutter test` (unit + golden) green
- [ ] Offline-first flow works (network OFF)
- [ ] Accessibility (tap targets ≥48dp, AA contrast, semantics, reduced-motion)
- [ ] Brand/color law (violet = action only; light label on the violet button; no meaning-by-color-alone)

## Results
| Check | Result | Evidence / Notes |
|---|---|---|
| Files exist/non-empty | `<PASS/FAIL>` | `<path list>` |
| Build (`analyze`) | `<PASS/FAIL>` | `<warnings>` |
| Tests | `<PASS/FAIL>` | `<count passed/failed>` |
| Offline | `<PASS/FAIL>` | `<observation>` |
| Accessibility | `<PASS/FAIL>` | `<findings>` |
| Brand | `<PASS/FAIL>` | `<token misuse>` |

## Defects
| ID | Severity | Description | Repro | Status |
|---|---|---|---|---|
| `<D-1>` | `<blocker/major/minor>` | `<what>` | `<steps>` | `<open/fixed>` |

## Verdict
**`<PASS | FAIL>`** — `<one-line justification. Blockers must be zero to PASS.>`
