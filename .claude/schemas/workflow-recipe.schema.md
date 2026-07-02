# Schema: Workflow Recipe

**Module:** Tonary Flow (primary); surfaced by Scout (chain matching) and Briefs (next-step suggestions).
**Purpose:** A repeatable, goal-oriented recipe — an ordered plugin chain plus concrete steps to achieve a sound-design outcome. Built from legacy `03-Workflows/by-goal`, Tonary-owned.

## Conventions
- `id`: kebab-case (e.g., `warm-analog-bass-flex`).
- `pluginChain[]` entries are Plugin Record ids in signal-flow order.
- Steps reference plugins/presets by id where possible. Every recipe MUST include a non-empty `sources[]`.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case) | yes | Unique recipe id | `warm-analog-bass-flex` |
| `title` | string | yes | Human title | `Warm Analog Bass with FLEX` |
| `goal` | string | yes | Outcome in one sentence | `Create a rounded, mono-safe analog-style bass.` |
| `pluginChain` | string[] (Plugin Record ids) | yes | Signal flow order | `["flex","fruity-parametric-eq-2"]` |
| `steps` | Step[] | yes | Ordered actions (see Step shape) | see example |
| `difficulty` | enum: `Beginner` \| `Intermediate` \| `Advanced` | yes | Skill level | `Beginner` |
| `timeEstimate` | string (ISO 8601 duration or human) | yes | Rough time | `PT10M` |
| `genreTags` | string[] (kebab-case) | yes | Genre fit | `["trap","hip-hop"]` |
| `presetRefs` | string[] | no | Preset Records used | `["flex-dark-pad-01"]` |
| `sources` | string[] (Source Reference ids) | yes | Evidence | `["src-flex-orig-research"]` |
| `createdAt` | string (ISO 8601) | no | Creation date | `2026-07-02` |

### Step shape
| Field | Type | Required | Description |
|---|---|---|---|
| `order` | integer | yes | 1-based sequence |
| `pluginId` | string | no | Which plugin this step touches |
| `action` | string | yes | What to do |
| `tip` | string | no | Optional refinement note |

## JSON Example
```json
{
  "id": "warm-analog-bass-flex",
  "title": "Warm Analog Bass with FLEX",
  "goal": "Create a rounded, mono-safe analog-style bass suitable for trap.",
  "pluginChain": ["flex", "fruity-parametric-eq-2"],
  "steps": [
    { "order": 1, "pluginId": "flex", "action": "Load a subtractive bass preset; keep it dry (0% reverb/delay).", "tip": "Illustrative: lower cutoff for a darker tone." },
    { "order": 2, "pluginId": "flex", "action": "Shorten release to a tight value so notes do not overlap.", "tip": "Check mono compatibility for the low end." },
    { "order": 3, "pluginId": "fruity-parametric-eq-2", "action": "High-pass rumble below the fundamental and gently boost body." }
  ],
  "difficulty": "Beginner",
  "timeEstimate": "PT10M",
  "genreTags": ["trap", "hip-hop"],
  "presetRefs": [],
  "sources": ["src-flex-orig-research"]
}
```

> **Placeholder disclosure:** Any numeric guidance in `tip`/`action` is illustrative unless a cited source documents it. Never present invented settings as factory or manual-verified.

## Validation Rules
- `id` unique; kebab-case. `pluginChain` non-empty; each id resolves to a Plugin Record.
- `steps` non-empty; `order` values are contiguous 1..N; each step has an `action`.
- `difficulty` in the enum; `timeEstimate` present.
- `genreTags` non-empty, kebab-case. `sources` non-empty and resolvable.

## Cross-links
- `pluginChain[]` / step `pluginId` → `plugin-record.schema.md`.
- `presetRefs[]` → `preset-record.schema.md`.
- Savable via `user-session.schema.md`.
- `sources[]` → `source-reference.schema.md`.

`Recommendation:` Prefer ISO 8601 durations (`PT10M`) for `timeEstimate` so Flow can sort recipes by effort on device.
`Open Question:` Should recipes support branch/alternative steps (e.g., "for EDM instead do X"), or should variants be separate recipes? Separate recipes for now.
