# Feature Spec — `<Feature Name>`

> Copy this file into a feature folder and fill every `<placeholder>`. Delete guidance in `_italics_`.
> Related: [implementation-plan-template.md](implementation-plan-template.md) · [screen-spec-template.md](screen-spec-template.md) · [../project/product-principles.md](../project/product-principles.md)

## Identity
- **Feature name:** `<name>`
- **Module:** `<Scout | Vault | Review | Flow | Briefs>` _(only these five modules exist)_
- **Owner:** `<name / contact@jazeratx.com>`
- **Status:** `<Draft | Approved | In build | Shipped>`
- **Date:** `<YYYY-MM-DD>`

## Problem
_One paragraph. What user problem does this solve? Why now? Tie to a product principle._
`<problem statement>`

## User Stories
- As a `<persona>`, I want to `<action>` so that `<outcome>`.
- As a `<persona>`, I want to `<action>` so that `<outcome>`.

## Scope
### In scope
- `<capability>`
### Out of scope (explicit)
- `<deferred capability>` — _label `Recommendation:` or `Open Question:` if unresolved._

## Data (schemas used)
_Reference Tonary target schemas — do not fabricate fields._
| Schema | Read/Write | Key fields used | Source |
|---|---|---|---|
| `<Plugin Record>` | `<R>` | `<id, name, category, tier>` | `<Vault seed / Drift>` |

## Screens
_List each screen; link to its screen-spec._
- `<Screen name>` → `<route>` → see [screen-spec](screen-spec-template.md)

## States
- **Loading:** `<behavior>`
- **Empty:** `<copy + next action>`
- **Error:** `<recovery path, offline-first fallback>`
- **Populated:** `<default view>`

## Acceptance Criteria
- [ ] `<Given / When / Then, testable>`
- [ ] Offline path verified (no network required for core view).
- [ ] Dark-first tokens only; violet reserved for brand action.

## Risks & Open Questions
- `Open Question:` `<unknown>`
- `Recommendation:` `<proposed default>`
