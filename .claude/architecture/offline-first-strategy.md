# Offline-First Strategy — Tonary

Tonary is **offline-first**: a producer mid-session, on stage, or in a studio with bad
signal must be able to browse, recall, and compare without connectivity. Parent:
[flutter-mobile-architecture.md](./flutter-mobile-architecture.md). Related:
[data-layer.md](./data-layer.md), [ai-assistant-architecture.md](./ai-assistant-architecture.md).

## Principles

1. **Local DB is the source of truth.** All reads/writes hit Drift (SQLite) on device.
   The network is never on the critical path for core flows.
2. **Ship the knowledge in the binary.** A bundled **seed JSON** dataset in
   `assets/seed/` hydrates Drift on first run — the app is fully useful the moment it
   installs, before any network call.
3. **Network is additive, never required for core.** Only Scout AI *generation* needs
   the network; everything else works at zero connectivity.
4. **Degrade transparently.** When offline, network-only features show a clear,
   non-blocking state and fall back to the best offline behavior.

## Bundled seed dataset

- Location: `assets/seed/*.json` (one file per record type — see
  [content-knowledge-base.md](./content-knowledge-base.md)).
- Produced by the content pipeline from migrated FL Studio knowledge; validated
  against [../schemas/](../schemas/) before bundling.
- **First-run hydration:** `sources/seed/` reads the JSON, deserializes to DTOs, and
  bulk-inserts into Drift. Idempotent and guarded by a **`seedVersion`** marker in a
  key-value store — hydration runs only on install and on dataset version bumps.
- **Recommendation:** hydrate inside `app/bootstrap/` before the first frame that
  needs data; show the onboarding/splash while seeding (typically sub-second for a
  curated launch subset).

## What works with ZERO connectivity

Effectively the entire core product:

- **Tonary Vault** — browse, filter, open plugin/preset/chain records, view parameters.
- **Global Search** — full-text + tag/category/capability filters (Drift FTS5).
- **Tonary Flow** — open and step through Workflow Recipes.
- **Tonary Briefs** — precomposed/templated explanations and comparisons built from
  local records + Sound Design Notes (retrieval-only rendering).
- **Tonary Review** — view Source References / evidence behind records.
- **Tonary Scout — retrieval mode** — structured/lexical matching of plugins/presets/
  chains to a goal, ranked from local records (no generation).
- **User data** — save/unsave items, personal notes (writes to `UserSavedItems`).

## What needs the network

- **Tonary Scout / Briefs — AI generation** — natural-language synthesis, comparison
  narratives, "why/next" prose via the server-proxied LLM (see
  [ai-assistant-architecture.md](./ai-assistant-architecture.md)). Offline → falls back
  to retrieval-only results, clearly labeled.
- **Content refresh** (future) — pulling an updated dataset from a backend.
- **Sync** (future) — cross-device user data.

## Optional background refresh (future)

**Open Question:** depends on the undecided backend (see
[data-layer.md](./data-layer.md)). Intended design when a backend exists:

- A `sources/remote/` source fetches a dataset delta; the repository merges it into
  Drift behind the scenes. Features keep reading Drift — no UI change.
- **Recommendation:** refresh opportunistically (app foreground + Wi-Fi), never
  blocking; respect a user setting in `features/settings/`.
- Seed content is treated as the immutable baseline; remote deltas layer on top and
  are versioned so a fresh install + refresh converges to the same state.

## Conflict strategy

Only `UserSavedItems` is user-writable, so conflicts are minimal until sync exists.

- **Seed vs local:** seed/remote content records are **read-only** and authoritative;
  they replace on version bump. User data is never overwritten by a content refresh.
- **Future sync (Open Question):** **Recommendation: last-write-wins per item using a
  monotonic `updatedAt`** for user data, which is adequate for personal saves/notes.
  Revisit if collaborative features appear. Content records need no merge (server is
  authoritative).

## Testing the offline path

- Unit-test the seed hydrator (idempotency, `seedVersion` gating) against an in-memory
  Drift database.
- Integration-test a cold start with the network stubbed off: verify Vault, Search,
  Flow, and Scout-retrieval all function. See [testing-strategy.md](./testing-strategy.md).
