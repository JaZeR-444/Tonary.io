# Voice & Tone

> Scope: How Tonary writes. Copy direction for UI strings, empty states, alerts, and assistant text.
> Pairs with [brand-rules.md](brand-rules.md), [ui-language.md](ui-language.md), and [naming-rules.md](naming-rules.md).

## The core posture
Tonary is **indexed sound-design intelligence**, not an "AI chatbot". We write like a precise studio tool
that respects a producer's time and taste. Confident, specific, restrained. We never flatten the creative process;
we help producers organize, understand, compare, recall, and apply plugin/preset/workflow knowledge faster.

Lead with the capability, not the mechanism:
- Say: "indexed sound-design intelligence", "evidence-backed notes", "compare patches".
- Avoid: "AI-powered assistant", "chat with our bot", "ask the AI anything".

## Precise verbs (use these)
Prefer exact, technical verbs over vague ones:
**index · review · compare · cite · retrieve · route · organize · evaluate · recall · match · surface · trace.**

- Do: "Review the patch and cite its source."
- Don't: "Let our AI check things out for you."

## Empty states
Every empty state = what this is + what to do next. Never a dead end. Never blame the user.
- Vault (empty): "No records yet. Index a plugin to start your Vault." + primary action.
- Scout (no matches): "No matches for these constraints. Loosen a filter or try a broader chain." + action.
- Review (nothing queued): "Nothing to review. Add a source to build evidence-backed notes."
- Tone: calm, forward-moving. Optional: a light `TONARY.wav` easter-egg is allowed here (hero styling only — see naming-rules.md).

## Alerts and errors (what happened / why / what next)
Every alert answers three things, in order:
1. **What happened** — plain, specific.
2. **Why** — the cause, if known. Never fabricate a reason.
3. **What next** — a concrete, tappable next step.

- Do: "Sync failed (no connection). Your changes are saved locally and will retry when you're back online."
- Don't: "Something went wrong." / "Error 0x5." / "Oops!"

Reserve alarming tone (red, assertive fills) for truly blocking, exceptional failures. Most issues are calm.

## Assistant language — only when it aids the next action
Assistant/conversational phrasing is a tool, not the identity. Use it only when it moves the user toward a decision.
- Good (aids next action): "3 chains match this vocal. Compare them?"
- Bad (chatbot theater): "Hi! I'm your AI music buddy. How can I help you today? 😊"

No emoji in product copy. No exclamation-heavy hype. No fake personality.

## Casing and mechanics
- Sentence case for UI copy and buttons ("Compare chains", not "Compare Chains").
- Module names are proper nouns: Tonary Scout, Vault, Review, Flow, Briefs (see naming-rules.md).
- Numbers, IDs, and parameter names render in mono (IBM Plex Mono). Human labels render in UI face.
- Never expose internal jargon (kebab ids, DTO names) in user-facing copy.

## Do / Don't quick table

| Do | Don't |
| --- | --- |
| "Indexed sound-design intelligence for FL Studio." | "An AI chatbot for music." |
| "Compare these two reverb chains." | "Let AI pick for you." |
| "Sync failed — saved locally, will retry." | "Oops, something broke!" |
| "No records yet. Index a plugin to start." | "Nothing here." |
| "Cite the source for this note." | "Trust me on this one." |
| Precise verbs, sentence case, calm tone | Hype, emoji, exclamation spam, fake persona |

Open Question: Do we allow a named assistant persona at all, or keep assistance strictly anonymous/functional?
Recommendation: Keep it functional and unnamed at launch; revisit only if a persona measurably aids the next action.
