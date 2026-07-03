# UI Language

> Scope: Standard in-app labels, microcopy vocabulary, and casing. The single source for what buttons,
> tabs, badges, and states are literally called. Enforces [voice-and-tone.md](voice-and-tone.md) and [naming-rules.md](naming-rules.md).

## Casing rules
- **Buttons & actions:** sentence case, verb-first — "Compare chains", "Index plugin", "Save note".
- **Nav / tab labels:** short and functional, sentence case — "Home", "Scout", "Vault", "Review", "Flow", "Briefs".
- **Badges:** title case, single word where possible — "Free", "Premium", "Generator", "Effect".
- **Section headers:** sentence case. Only module proper nouns are capitalized mid-sentence.
- **Tokens / IDs / parameter names:** mono face, verbatim (e.g. `serum-osc-a`), never re-cased for display.

## Navigation labels (bottom nav — short, functional)
`Home` · `Scout` · `Vault` · `Review` · `Flow` — with `Briefs`, `Search`, `Settings` reachable secondarily.
Keep to one word. Module tabs use the bare module word once the "Tonary" context is established elsewhere.

## Module tab names
Full name on first/formal surface (headers, onboarding): "Tonary Scout". Bare word in nav and repeated in-context: "Scout".

## Button verbs (the approved set)
Use precise verbs: **Index, Review, Compare, Cite, Retrieve, Route, Save, Generate, Import, Continue, Match, Open, Add, Remove, Filter.**
Avoid vague filler: "Go", "Do it", "Submit" (prefer the specific action), "Click here".

## Badge labels
- Tier: `Free`, `Premium`.
- Plugin type: `Generator`, `Effect`.
- Discovery/experimental tags: violet soft fill, e.g. `Exploratory` (see color law in [brand-rules.md](brand-rules.md)).
- Never fully filled red/orange badges in dense lists — use soft semantic fill + bright text.

## State strings
- Loading: "Indexing…", "Retrieving…", "Comparing…" (verb + ellipsis, present continuous).
- Empty: "No records yet. Index a plugin to start your Vault." (what + next action).
- Error: "Sync failed — saved locally, will retry." (what happened / why / what next — see voice-and-tone.md).
- Success: "Saved" · "Indexed" · "Note added" (quiet, past tense, green + icon, never color alone).
- Offline: "Offline — changes saved locally."

## Preferred terms vs. banned terms (glossary)

| Preferred | Banned / avoid | Why |
| --- | --- | --- |
| Vault | Plugin Database, Library | "Plugin Database" is an FL Studio term (see naming-rules.md). |
| Scout | Browser | "Browser" is an FL Studio term. |
| Record | Entry, Item (in data context) | "Record" matches the Vault schema vocabulary. |
| Note | Comment | Review produces evidence-backed notes, not comments. |
| Chain | Rack, Channel Rack | "Channel Rack" is FL Studio's; use "chain" for signal chains. |
| Brief | Summary, Report | Matches the Briefs module. |
| Recipe / Flow | Tutorial, Guide | Matches the Flow module's playbook framing. |
| Source | Citation source, ref | Say "Source" in UI; "Source Reference" is the schema name. |
| Indexed sound-design intelligence | AI chatbot, AI assistant | Lead with capability, not mechanism. |
| Premium | Pro, Paid, Plus | One tier word: `Premium` (paired with `Free`). |

## Microcopy discipline
- Microcopy uses `text-muted (#837da3)` and caps ~50 characters/line. Body copy aims 60–72 chars/line.
- Placeholders are never the only label — every input keeps a persistent visible label.
- No emoji, no exclamation spam, no internal jargon (DTO/kebab ids) in user-facing text.

Open Question: Final bottom-nav item count (4 vs 5)? Recommendation: 5 primary (Home, Scout, Vault, Review, Flow),
with Briefs surfaced contextually inside other modules to keep the bar thumb-friendly.
