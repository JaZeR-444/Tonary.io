# Schema: Plugin Record

**Module:** Tonary Vault (primary); referenced by Scout, Flow, Review, Briefs.
**Purpose:** A Tonary-owned canonical record for one FL Studio plugin. Derived in spirit from the legacy `manifest.json` fields, but rewritten and evidence-backed — never a copy of Image-Line marketing.

## Conventions
- `id`: kebab-case, globally unique (e.g., `flex`, `fruity-parametric-eq-2`).
- JSON keys: camelCase. Enumerated values: TitleCase strings as defined below.
- `color`: hex string; used only as a subtle categorical accent in UI, never to override brand color law.
- Every Plugin Record MUST include a non-empty `sources[]` of Source Reference ids.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case) | yes | Unique plugin id | `flex` |
| `name` | string | yes | Display name (Tonary wording) | `FLEX` |
| `vendor` | enum: `Image-Line` \| `Third-Party` | yes | Who makes it; drives tier/context | `Image-Line` |
| `vendorName` | string | no | Actual third-party maker if `Third-Party` | `Xfer Records` |
| `category` | string | yes | Functional family | `Rompler / Hybrid Synth` |
| `type` | enum: `Generator` \| `Effect` | yes | Signal role | `Generator` |
| `tier` | enum: `Free` \| `Premium` | yes | Availability in FL Studio editions | `Free` |
| `description` | string | yes | 1–3 sentence Tonary-authored summary | `Preset-based synth spanning subtractive, wavetable, multisample and FM engines.` |
| `tags` | string[] (kebab-case) | yes | Search/filter tags | `["synth","rompler","presets"]` |
| `capabilities` | string[] | yes | What it can do (verbs/features) | `["wavetable-synthesis","macro-controls","built-in-fx"]` |
| `parametersRef` | string \| null | no | Id/path of the parameter set (kept separate for size) | `flex-parameters` |
| `presetRefs` | string[] | no | Preset Record ids linked to this plugin | `["flex-dark-pad-01"]` |
| `color` | string (hex) | no | Categorical accent | `#a99ee6` |
| `manualUrl` | string (url) | no | Official manual page | `https://www.image-line.com/fl-studio-learning/...` |
| `sources` | string[] (Source Reference ids) | yes | Evidence backing this record | `["src-flex-manual","src-flex-orig-research"]` |
| `createdAt` | string (ISO 8601) | no | Record creation date | `2026-07-02` |
| `updatedAt` | string (ISO 8601) | no | Last edit date | `2026-07-02` |

## JSON Example
```json
{
  "id": "flex",
  "name": "FLEX",
  "vendor": "Image-Line",
  "category": "Rompler / Hybrid Synth",
  "type": "Generator",
  "tier": "Free",
  "description": "Preset-based synthesizer spanning subtractive, wavetable, multisample and FM engines, driven by eight designer-defined macros.",
  "tags": ["synth", "rompler", "presets", "macros"],
  "capabilities": ["wavetable-synthesis", "multisample-playback", "macro-controls", "built-in-fx-chain"],
  "parametersRef": "flex-parameters",
  "presetRefs": ["flex-dark-pad-01"],
  "color": "#a99ee6",
  "manualUrl": "https://www.image-line.com/fl-studio-learning/fl-studio-online-manual/",
  "sources": ["src-flex-manual", "src-flex-orig-research"],
  "createdAt": "2026-07-02",
  "updatedAt": "2026-07-02"
}
```

## Validation Rules
- `id` unique across all Plugin Records; kebab-case only (`^[a-z0-9]+(-[a-z0-9]+)*$`).
- If `vendor` = `Third-Party`, `vendorName` SHOULD be set.
- `type` restricted to `Generator` or `Effect`; `tier` to `Free` or `Premium`.
- `tags` and `capabilities` non-empty; entries kebab-case.
- `sources` non-empty; each id MUST resolve to an existing Source Reference (`source-reference.schema.md`).
- `parametersRef` values are illustrative placeholders unless backed by a source — never fabricate real parameter numbers here.

## Cross-links
- Parameters live outside this record (large); reference by `parametersRef`.
- `presetRefs` → `preset-record.schema.md`.
- Cited by `workflow-recipe.schema.md` (`pluginChain[]`) and `sound-design-note.schema.md` (`subjectRefs[]`).
- `sources[]` → `source-reference.schema.md`.

`Recommendation:` Keep the heavy parameter payload in a separate `plugin-parameters` collection keyed by `parametersRef`, so Plugin Records stay list-friendly on mobile.
`Open Question:` Should `tier` support a third value for content bundled only with specific FL editions (e.g., Signature)? Defaulting to Free/Premium until evidenced.
