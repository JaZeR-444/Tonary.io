# Schema: Source Reference

**Module:** Cross-cutting — the evidence backbone. Every other record type (except User Session) has a `sources[]` array of Source Reference ids that point HERE.
**Purpose:** A single citation of evidence for a Tonary claim. This is what makes Tonary trustworthy instead of a generic wiki. Never fabricate a Source Reference to satisfy a required `sources[]`.

## Conventions
- `id`: kebab-case, prefixed `src-` (e.g., `src-flex-manual`).
- JSON keys camelCase. Dates are absolute ISO 8601.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case, `src-` prefix) | yes | Unique citation id | `src-flex-manual` |
| `title` | string | yes | Title of the source | `FLEX — FL Studio Online Manual` |
| `sourceType` | enum: `official-manual` \| `article` \| `video` \| `original-research` | yes | Kind of evidence | `official-manual` |
| `url` | string (url) | no | Link (omit for offline original research) | `https://www.image-line.com/fl-studio-learning/...` |
| `publisher` | string | no | Who published it | `Image-Line` |
| `author` | string | no | Named author/creator | `Tonary Research` |
| `retrievedAt` | string (ISO 8601) | yes | When accessed/tested | `2026-07-02` |
| `reliability` | enum: `High` \| `Medium` \| `Low` | yes | Editor's confidence in the source | `High` |
| `notes` | string | no | Context/caveats about the source | `Manual version current as of retrieval.` |

### reliability guidance
- `High` — official manual/spec, or first-party Tonary testing.
- `Medium` — reputable third-party article/video by a known creator.
- `Low` — forum post, uncorroborated claim; use sparingly and pair with a better source.

## JSON Example
```json
{
  "id": "src-flex-manual",
  "title": "FLEX — FL Studio Online Manual",
  "sourceType": "official-manual",
  "url": "https://www.image-line.com/fl-studio-learning/fl-studio-online-manual/",
  "publisher": "Image-Line",
  "author": null,
  "retrievedAt": "2026-07-02",
  "reliability": "High",
  "notes": "Primary reference for FLEX parameter names and behavior."
}
```

Original-research example (no URL):
```json
{
  "id": "src-flex-orig-research",
  "title": "Tonary original testing — FLEX macro behavior",
  "sourceType": "original-research",
  "publisher": "Tonary",
  "author": "Tonary Research",
  "retrievedAt": "2026-07-02",
  "reliability": "High",
  "notes": "Hands-on testing; illustrative values documented as such, not factory defaults."
}
```

## Validation Rules
- `id` unique across all sources; kebab-case with `src-` prefix.
- `sourceType` in the enum; if not `original-research`, `url` SHOULD be present.
- `retrievedAt` required and absolute. `reliability` in the enum.
- A Source Reference MUST correspond to a real, accessed source — do not create placeholder citations.

## Cross-links
- Referenced by `sources[]` in: `plugin-record.schema.md`, `preset-record.schema.md`, `workflow-recipe.schema.md`, `sound-design-note.schema.md`.
- NOT referenced by `user-session.schema.md` (user-local data carries no citations).

`Recommendation:` Store sources in their own collection and reference by id everywhere, so a single citation update propagates to all records that cite it.
`Open Question:` Do we need a `retrievalSnapshot` (archived copy/quote) for link-rot resilience on official manual pages? Deferring until offline evidence storage is designed.
