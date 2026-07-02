# Workflow — Source Review

Review a legacy source folder or file (from **DEEPER DIVES** / FL Studio Master Hub) and classify it **keep / rewrite / archive / ignore**, feeding the Tonary migration map. Legacy content is strategic *source material*, not a blueprint.

Related: [../agents/content-taxonomist.md](../agents/content-taxonomist.md) · [content-migration-workflow.md](content-migration-workflow.md) · [../rules/migration-rules.md](../rules/migration-rules.md) · [../commands/review-source.md](../commands/review-source.md)

## Purpose
Produce an auditable, per-source decision so migration starts from a MAP, never a bulk import. Prevent fabrication and prevent carrying legacy web architecture into the Flutter app.

## When to use
- Before migrating any plugin folder or content batch.
- When triaging the ~190 plugin folders (~98 standardized) for the first pass.
- Any time an unknown legacy file needs a keep/discard decision.

## Inputs
- Path to the source folder/file.
- The canonical brief (schemas, discard list, naming rules).
- Existing migration map (append target), if one exists.

## Steps
1. **Enumerate.** List every file in the source. Note the folder shape: `00-START-HERE.md`, `MASTER-INDEX.md`, `README.md`, `01-Learning/`, `02-Data/` (JSON), `03-Workflows/`, `04-Reference/`, and any legacy web "Plugin Page Setup".
2. **Read the data layer first.** `02-Data/{parameters,presets,rules}` JSON and any `manifest.json` (id, name, category, tier, type, description, tags[], capabilities[], version, color) are the highest-value keep candidates.
3. **Classify each file** against the rubric below. Record a one-line reason per file.
4. **Map to target schema.** For every KEEP/REWRITE, name the Tonary target: Plugin Record, Preset Record, Workflow Recipe, Sound Design Note, Source Reference, Comparison Brief, Learning Path.
5. **Flag facts to verify.** Any claim that cannot be traced to the source becomes an `Open Question:` — never fill the gap by inventing data.
6. **Append to the migration map** with source path → decision → target schema → reviewer + date.

## Classification rubric
- **KEEP** — factual, schema-ready data: parameters, presets, verified capabilities, manifest fields. Migrate largely as-is (after mapping).
- **REWRITE** — good substance, wrong form/voice: prose docs, `00-START-HERE`, workflows needing Tonary voice + schema shaping.
- **ARCHIVE** — historical value but not shipping: session summaries, batch reports, superseded drafts. Retain out of the app.
- **IGNORE / DISCARD** — legacy web HTML/CSS/JS page setups, purple glassmorphism theme, Next.js code, `.ico`, `desktop.ini`, thumbnail caches, empty stubs.

## Output / report format
```
Source: <absolute path>
Reviewer: <name>  Date: 2026-07-02
| File | Decision | Target schema | Reason |
|------|----------|---------------|--------|
Summary: X keep · Y rewrite · Z archive · W ignore
Open Questions: <list or "none">
```

## Guardrails
- Never fabricate plugin facts, parameter ranges, or presets. Unverifiable → `Open Question:`.
- Discard-list items are auto-IGNORE — do not "rescue" web theme or React code.
- Do not carry FL Studio interface terms (Browser, Channel Rack, Mixer, Playlist) into Tonary-owned naming.
- One decision per source; ambiguity resolves to ARCHIVE, not KEEP.
