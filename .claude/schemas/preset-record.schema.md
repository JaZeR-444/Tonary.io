# Schema: Preset Record

**Module:** Tonary Vault (primary); surfaced by Scout (matching) and Flow (recipe steps).
**Purpose:** A reusable preset/patch archetype for a plugin — a snapshot of parameter intent plus use-case and genre metadata. Built from legacy `02-Data/presets` archetypes, Tonary-owned.

## Conventions
- `id`: kebab-case (e.g., `flex-dark-pad-01`).
- `pluginId` MUST reference an existing Plugin Record `id`.
- JSON keys camelCase. Every Preset Record MUST include a non-empty `sources[]`.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case) | yes | Unique preset id | `flex-dark-pad-01` |
| `pluginId` | string (Plugin Record id) | yes | Parent plugin | `flex` |
| `name` | string | yes | Display name | `Dark Evolving Pad` |
| `category` | string | yes | Sound family | `Pad` |
| `params` | object (paramName → value) | no | Illustrative parameter snapshot | see example |
| `useCases` | string[] | yes | Where it fits | `["intro-atmosphere","background-texture"]` |
| `genreTags` | string[] (kebab-case) | yes | Genre fit | `["cinematic","lo-fi"]` |
| `notes` | string | no | Tonary-authored tips/caveats | `Automate Macro 1 for slow filter opening.` |
| `sources` | string[] (Source Reference ids) | yes | Evidence backing values/claims | `["src-flex-orig-research"]` |
| `createdAt` | string (ISO 8601) | no | Creation date | `2026-07-02` |

## JSON Example
```json
{
  "id": "flex-dark-pad-01",
  "pluginId": "flex",
  "name": "Dark Evolving Pad",
  "category": "Pad",
  "params": {
    "cutoffPct": 35,
    "resonancePct": 20,
    "attackPct": 70,
    "releasePct": 80,
    "reverbMixPct": 25
  },
  "useCases": ["intro-atmosphere", "background-texture"],
  "genreTags": ["cinematic", "lo-fi"],
  "notes": "Illustrative values only. Automate Macro 1 (often brightness) for a slow filter opening across 4-8 bars.",
  "sources": ["src-flex-orig-research"],
  "createdAt": "2026-07-02"
}
```

> **Placeholder disclosure:** All values in `params` above are clearly illustrative examples (suffixed `Pct`), NOT captured real FLEX preset values. Never present placeholder numbers as evidenced factory settings.

## Validation Rules
- `id` unique; kebab-case. `pluginId` MUST resolve to a Plugin Record.
- `params` is optional; when present, values are treated as illustrative unless a source documents exact factory values.
- `useCases` and `genreTags` non-empty; entries kebab-case.
- `sources` non-empty; each resolves to a Source Reference.

## Cross-links
- `pluginId` → `plugin-record.schema.md`.
- Referenced by `workflow-recipe.schema.md` steps and `sound-design-note.schema.md` (`subjectRefs[]`).
- Savable via `user-session.schema.md` (`savedItems[]`).
- `sources[]` → `source-reference.schema.md`.

`Recommendation:` Store `params` as a flat map of semantic keys rather than raw DAW indices, so presets stay portable and human-readable in Scout results.
`Open Question:` Do we need a `variantOf` field to chain preset variations, or is `useCases[]` sufficient for now?
