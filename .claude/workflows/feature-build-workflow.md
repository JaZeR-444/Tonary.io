# Workflow — Feature Build (End to End)

Build a Tonary feature from spec to QA-passed report. Mobile-first Flutter, offline-first, clean layered architecture.

Related: [../agents/product-architect.md](../agents/product-architect.md) · [../agents/flutter-architect.md](../agents/flutter-architect.md) · [flutter-screen-build-workflow.md](flutter-screen-build-workflow.md) · [qa-review-workflow.md](qa-review-workflow.md) · [../architecture/flutter-mobile-architecture.md](../architecture/flutter-mobile-architecture.md) · [../rules/coding-standards.md](../rules/coding-standards.md)

## Purpose
Ship a complete feature slice that lands in the correct `features/<module>/` folder, uses the right state/data layers, and passes QA gates before merge.

## When to use
Any new capability inside a module: **Scout, Vault, Review, Flow, Briefs**, plus search/settings/onboarding/home.

## Inputs
- Feature spec (problem, user, module, acceptance criteria).
- Target module and its data needs (which Vault records it reads/writes).
- Design references (screens/components) if UI is involved.

## Steps
1. **Spec & scope.** Confirm the module owner (product-architect). Write acceptance criteria and MVP boundary. Out-of-scope items become `Open Question:` or backlog.
2. **Architecture placement.** Decide layers: `features/<module>/` (presentation) → domain models/use-cases in `shared/models` + feature `domain/` → `data/repositories` + `data/sources`. Confirm Riverpod providers and go_router route. (See flutter-architect.)
3. **Data contract.** Define/confirm domain models and DTOs + mappers. Reads go through a repository; no direct source access from widgets. Offline-first: local Drift/seed JSON is the source of truth.
4. **Implement.** Build presentation, state (Riverpod), use-cases, repository. Keep design tokens from `design_system/`. Handle loading/empty/error states for every async surface.
5. **Tests.** Unit-test use-cases and mappers; widget-test key states; golden test for primary screens (see screen workflow).
6. **QA pass.** Run [qa-review-workflow.md](qa-review-workflow.md): files exist/non-empty, no fabricated data, build passes, tests green, accessibility + brand compliance.
7. **Report.** Summarize what shipped, decisions, open questions.

## Output / report format
```
Feature: <name>  Module: <Scout|Vault|Review|Flow|Briefs|…>
Files added/changed: <paths>
Layers touched: presentation / domain / data
State: Riverpod providers <list>  Route: <go_router path>
Tests: <unit/widget/golden> — pass/fail
QA gate: PASS/FAIL (link report)
Recommendations / Open Questions: <list>
```

## Guardrails
- No business logic in widgets; no direct source/DB calls from presentation.
- Do not import legacy Next.js/web patterns or the purple theme.
- Every async state renders loading, empty, and error — never a blank/frozen screen.
- No fabricated Vault data; missing content is an `Open Question:`, not invented.
- Feature must not exceed its module boundary; cross-module needs go to product-architect.
