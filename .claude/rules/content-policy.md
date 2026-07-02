# Content Policy — Publishing Rules (Legal Gate)

> Scope: The rules every published Vault/Briefs record must satisfy so Tonary can ship curated
> content without reproducing third-party IP. Satisfies **gate #1** of
> [`../outputs/oq-12-licensing-decision-brief.md`](../outputs/oq-12-licensing-decision-brief.md).
> Inherits [global-rules.md](global-rules.md); enforced alongside [content-migration-rules.md](content-migration-rules.md)
> and [data-modeling-rules.md](data-modeling-rules.md).
>
> **Not legal advice.** A human/legal sign-off on this policy is still required before the first public
> release (gate #5 — the one item this project cannot self-certify).

Adopted **2026-07-02** as the conservative content policy. Fail publishing review if any rule is violated.

## 1. Rephrase, never reproduce
- **No verbatim or near-verbatim manual text.** Every description/explanation/note is written in Tonary's own
  words. Paraphrase that tracks the source too closely is a fail — restate the *fact*, not the *sentence*.
- Where a claim can't be safely restated without losing accuracy, **link out** to the official source instead of
  reproducing it.

## 2. Facts get stated; expression gets cited or linked
- Parameter names, ranges, types, defaults, categories, capabilities are **facts** — state them, each with a
  `sourceRef`. (Schema already rejects records without sources.)
- Creative *expression* (prose, tutorials, curated write-ups) is not reproduced — it is rephrased + cited, or
  linked out.

## 3. Presets — no files, no factory dumps
- **Never ship factory preset files, sample content, or exact factory-patch value dumps.**
- Preset knowledge is published as an **original technique/recipe** ("to get a similar sound, do X") in Tonary's
  words, cited. Individual documented default values may be stated as facts with a source; a full factory patch
  reproduced verbatim may not.
- Reproducing factory presets wholesale requires an explicit Image-Line licence — out of scope until obtained.

## 4. Sources — cite, prefer official, respect licences
- Every factual record cites a **Source Reference**; prefer manufacturer/official manuals over third-party prose
  when they conflict.
- **Drop any source whose licence forbids derivation** or that is paywalled/restrictively licensed; never
  reproduce its text. Record `retrievedAt` (and a snapshot where allowed) for provenance.

## 5. Trademark & affiliation
- "FL Studio" / "Image-Line" appear **only as compatibility context**, never as Tonary branding
  (see [../brand/naming-rules.md](../brand/naming-rules.md)).
- The app ships a **non-affiliation disclaimer + trademark attribution** (Settings ▸ About). It must remain
  present in any release that publishes this content.

## 6. No fabrication (restated — highest severity)
- Never invent values to fill gaps. Unknown stays null/absent and flagged. Copying a value from a similar plugin
  as a stand-in is fabrication (see [data-modeling-rules.md](data-modeling-rules.md)).

## Pre-publish checklist (per migrated batch)
Run before any batch enters the shipped seed dataset:
- [ ] No verbatim/near-verbatim manual text anywhere in the batch.
- [ ] Every factual record carries a valid `sourceRef`; validator passes.
- [ ] No preset files / no exact factory-value dumps included.
- [ ] No fabricated or borrowed-as-stand-in values; gaps are flagged, not filled.
- [ ] All sources permit derivation; restrictively-licensed ones dropped or linked-out only.
- [ ] Non-affiliation disclaimer present in the build.

When every box is checked **and** the human sign-off (gate #5) is on record, `/migrate-content` may publish the
batch. Until then, only the reviewed pilot (FLEX, Sytrus, Fruity Parametric EQ 2) ships.
