# Migration Plan — `<Source Batch / Plugin Folder>`

> Legacy plugin content is STRATEGIC SOURCE MATERIAL, not a blueprint. Map before importing.
> Decide keep / rewrite / archive / ignore per source. Never fabricate plugin facts.
> Related: [../project/mvp-scope.md](../project/mvp-scope.md) · [qa-report-template.md](qa-report-template.md)

## Source
- **Source folder / file:** `<path in legacy Master Hub>`
- **Content type:** `<Concept .md | parameters JSON | presets JSON | rules JSON | workflow .md | manifest.json | web page setup HTML/CSS/JS | meta-file>`
- **Standardized?** `<Yes ~98 folders | No>`

## Decision
- **Disposition:** `<KEEP | REWRITE | ARCHIVE | IGNORE>`
  - _Ignore/Discard by rule:_ legacy web HTML/CSS/JS, purple glassmorphism theme, Next.js code, `.ico`/`desktop.ini`, batch/session-summary meta-files.

## Target
- **Target module:** `<Scout | Vault | Review | Flow | Briefs>`
- **Target schema:** `<Plugin Record | Preset Record | Workflow Recipe | Sound Design Note | Source Reference | Comparison Brief | Learning Path | User Saved Item>`

## Field Mapping
| Source field | Target field | Transform |
|---|---|---|
| `id (kebab-case)` | `Plugin Record.id` | `<verbatim>` |
| `name` | `.name` | `<verbatim>` |
| `category` | `.category` | `<normalize vocab>` |
| `tier (Free/Premium)` | `.tier` | `<map>` |
| `type (Generator/Effect)` | `.type` | `<map>` |
| `tags[] / capabilities[]` | `.tags[]` | `<dedupe>` |

## Transform Steps
1. `<extract / clean>`
2. `<map to schema>`
3. `<validate against Drift schema + seed JSON>`

## Validation
- [ ] Every record has required fields; no invented facts.
- [ ] IDs unique & kebab-case.
- [ ] Seed JSON parses; Drift import succeeds.

## Risks
- `Open Question:` `<ambiguous source data>`
- `Recommendation:` `<default handling>`
