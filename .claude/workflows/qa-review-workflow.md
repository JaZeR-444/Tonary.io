# Workflow — QA Review (Pre-Merge Gates)

Run the QA gates before any merge. A gate FAILS closed: no gate may be reported as passed without evidence.

Related: [../agents/qa-engineer.md](../agents/qa-engineer.md) · [feature-build-workflow.md](feature-build-workflow.md) · [design-review-workflow.md](design-review-workflow.md) · [../rules/qa-gates.md](../rules/qa-gates.md) · [../commands/run-qa.md](../commands/run-qa.md)

## Purpose
Guarantee that shipped work is real, correct, accessible, and on-brand — and that no success is reported falsely.

## When to use
Immediately before merging any feature, screen, or content batch.

## Inputs
- The branch/change set and its build.
- The claimed deliverables list (files, tests, records).

## Gates (run in order)
1. **Files exist & non-empty.** Every claimed file is present with real content — no empty stubs, no "TODO"-only files. Verify on disk, not from memory.
2. **No fabricated data.** Every Vault/content record traces to a Source Reference. Any invented plugin fact, parameter, or preset FAILS the batch.
3. **Build.** `flutter analyze` clean (no errors); app compiles for iOS and Android targets.
4. **Tests.** `flutter test` green — unit, widget, and golden. New logic has new tests.
5. **Accessibility.** Touch targets ≥44–48dp; semantics labels on interactive/icon-only controls; contrast AA; `disableAnimations` honored; focus ring present.
6. **Brand compliance.** Passes [design-review-workflow.md](design-review-workflow.md): color law, typography, motion, surfaces.
7. **States.** Every async surface renders loading/empty/error.

## Steps
1. Read the deliverables list; verify each item against gate 1 on disk.
2. Run gates 2–7, capturing command output/evidence for each.
3. Any FAIL → stop, report FAIL with the failing gate and evidence. Do not soften.
4. All PASS → report PASS with evidence links.

## Output / report format
```
Change: <name/branch>  Reviewer: qa-engineer  Date: 2026-07-02
| Gate | Result | Evidence |
| Files non-empty | PASS/FAIL | <paths checked> |
| No fabricated data | PASS/FAIL | <sources> |
| Build | PASS/FAIL | <analyze output> |
| Tests | PASS/FAIL | <test summary> |
| Accessibility | PASS/FAIL | <notes> |
| Brand | PASS/FAIL | <design review link> |
| States | PASS/FAIL | <notes> |
Verdict: PASS / FAIL   Blocking items: <list>
```

## Guardrails
- **Never report success falsely.** Absence of evidence = FAIL, not PASS.
- A single failing gate fails the whole review.
- Do not fix code during review; file the defect and return to build workflow.
- "Looks done" is not evidence — commands and on-disk checks are.
