# Schema: User Session

**Module:** User-local layer (backs the "User Saved Item" concept across Vault, Flow, Review, Briefs).
**Purpose:** Device-local user state — saved items, history, collections, preferences. This is the ONLY record type that does NOT carry a `sources[]` array (it is user data, not an evidence-backed knowledge record). Stores no PII beyond what lives locally on the device.

## Conventions
- `id`: kebab-case, local/device-scoped (e.g., `local-session`). Not a network user id.
- JSON keys camelCase. All references point to record ids elsewhere (plugin/preset/recipe/note).
- Offline-first: this document is the source of truth on-device and syncs later only if a user opts in.

## Fields

| Field | Type | Required | Description | Example |
|---|---|---|---|---|
| `id` | string (kebab-case) | yes | Local session id | `local-session` |
| `savedItems` | SavedItem[] | no | Saved records (the "User Saved Item" set) | see example |
| `recentlyViewed` | ViewedRef[] | no | History of viewed records | see example |
| `collections` | Collection[] | no | User-made groupings | see example |
| `preferences` | Preferences | no | Local app prefs | see example |
| `updatedAt` | string (ISO 8601) | no | Last local change | `2026-07-02` |

### SavedItem shape
| Field | Type | Required | Description |
|---|---|---|---|
| `refType` | enum: `plugin` \| `preset` \| `recipe` \| `note` | yes | Which record kind |
| `refId` | string | yes | Target record id |
| `savedAt` | string (ISO 8601) | yes | When saved |

### ViewedRef shape
| Field | Type | Required | Description |
|---|---|---|---|
| `refType` | enum: `plugin` \| `preset` \| `recipe` \| `note` | yes | Record kind |
| `refId` | string | yes | Target record id |
| `viewedAt` | string (ISO 8601) | yes | When viewed |

### Collection shape
| Field | Type | Required | Description |
|---|---|---|---|
| `id` | string (kebab-case) | yes | Collection id |
| `name` | string | yes | User label |
| `itemRefs` | string[] | yes | Record ids in the collection |

### Preferences shape
| Field | Type | Required | Description |
|---|---|---|---|
| `theme` | enum: `dark` | yes | Dark-first; only `dark` supported today |
| `reducedMotion` | boolean | no | Mirror of OS setting when overridden |
| `defaultModule` | enum: `scout` \| `vault` \| `review` \| `flow` \| `briefs` | no | Landing module |

## JSON Example
```json
{
  "id": "local-session",
  "savedItems": [
    { "refType": "plugin", "refId": "flex", "savedAt": "2026-07-02" },
    { "refType": "recipe", "refId": "warm-analog-bass-flex", "savedAt": "2026-07-02" }
  ],
  "recentlyViewed": [
    { "refType": "preset", "refId": "flex-dark-pad-01", "viewedAt": "2026-07-02" }
  ],
  "collections": [
    { "id": "my-bass-kit", "name": "My Bass Kit", "itemRefs": ["flex", "warm-analog-bass-flex"] }
  ],
  "preferences": {
    "theme": "dark",
    "reducedMotion": false,
    "defaultModule": "scout"
  },
  "updatedAt": "2026-07-02"
}
```

## Validation Rules
- `id` present; kebab-case. No `sources[]` — intentionally omitted for this type only.
- Every `refId` MUST resolve to an existing record of the declared `refType`.
- No PII fields (no email, name, phone, account id). Keep strictly local unless the user opts into sync.
- `theme` limited to `dark` (dark-first mandate); extend only if a light theme is ever specified.

## Cross-links
- `savedItems` / `recentlyViewed` / `collections.itemRefs` → `plugin-record`, `preset-record`, `workflow-recipe`, `sound-design-note` schemas.
- Consumed by every feature that shows "Saved" or "Recent" surfaces.

`Recommendation:` Persist this document via Drift (SQLite) as a normalized set of tables (saved_items, viewed, collections) rather than one JSON blob, so queries and pagination stay fast on mobile.
`Open Question:` When device-to-cloud sync is added, does `id` migrate to an authenticated user id, or do we keep `local-session` and attach an account pointer separately? Keeping local-only until sync is specified.
