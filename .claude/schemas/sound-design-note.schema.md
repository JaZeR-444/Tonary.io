# Schema: Sound Design Note

**Module:** Tonary Review (evidence-backed notes) and Tonary Briefs (fast explanations/comparisons).
**Purpose:** A short, sourced note about a plugin, preset, technique, or comparison — the atomic unit of Tonary's knowledge layer. Carries an honest `evidenceLevel` so the UI can signal confidence.

## Conventions
- `id`: kebab-case (e.g., `flex-macro-locking-tip`).
- `subjectRefs[]` point to Plugin Record and/or Preset Record ids the note is about.
- Every note MUST include a non-empty `sources[]`.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case) | yes | Unique note id | `flex-macro-locking-tip` |
| `topic` | string | yes | What the note is about | `Locking macros while browsing presets` |
| `subjectRefs` | string[] (Plugin/Preset ids) | yes | Records the note references | `["flex"]` |
| `body` | string (markdown) | yes | The note content | `Panel locks keep chosen values...` |
| `evidenceLevel` | enum: `Verified` \| `Documented` \| `Community` \| `Inferred` | yes | Confidence in the claim | `Documented` |
| `noteType` | enum: `Tip` \| `Comparison` \| `Explanation` \| `Caveat` | no | Kind of note | `Tip` |
| `sources` | string[] (Source Reference ids) | yes | Backing evidence | `["src-flex-manual"]` |
| `createdAt` | string (ISO 8601) | yes | Creation date | `2026-07-02` |
| `updatedAt` | string (ISO 8601) | no | Last edit | `2026-07-02` |

### evidenceLevel meaning
- `Verified` — confirmed by original Tonary testing.
- `Documented` — stated in an official manual/spec.
- `Community` — reputable article/video/forum consensus.
- `Inferred` — reasoned from related facts; lowest confidence, must say so in `body`.

## JSON Example
```json
{
  "id": "flex-macro-locking-tip",
  "topic": "Locking macros while browsing presets",
  "subjectRefs": ["flex"],
  "body": "Enabling panel locks keeps chosen values (e.g., Master Volume or reverb mix) fixed while auditioning presets, so loudness and wetness stay consistent between sounds.",
  "evidenceLevel": "Documented",
  "noteType": "Tip",
  "sources": ["src-flex-manual"],
  "createdAt": "2026-07-02",
  "updatedAt": "2026-07-02"
}
```

## Validation Rules
- `id` unique; kebab-case. `subjectRefs` non-empty; each resolves to a Plugin or Preset Record.
- `evidenceLevel` in the enum; if `Inferred`, `body` MUST state the inference.
- `body` non-empty; no fabricated specifics presented as fact.
- `sources` non-empty and resolvable. `createdAt` required (absolute date).

## Cross-links
- `subjectRefs[]` → `plugin-record.schema.md`, `preset-record.schema.md`.
- Comparison-type notes may reference multiple plugins; pair with a Workflow Recipe when actionable.
- Savable via `user-session.schema.md`.
- `sources[]` → `source-reference.schema.md`.

`Recommendation:` Surface `evidenceLevel` as a small non-color-only badge (icon + label) in Review/Briefs, honoring the color law (cyan = system/info).
`Open Question:` Should `Comparison` notes get a dedicated `comparisonOf[]` field, or is `subjectRefs[]` enough? Using `subjectRefs[]` until a Comparison Brief schema is introduced.
