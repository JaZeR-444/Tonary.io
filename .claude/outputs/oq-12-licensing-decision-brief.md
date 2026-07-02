# OQ-12 — Licensing & Attribution Decision Brief

> **Status:** 🔴 Open — blocks publishing Vault beyond the 3 pilot plugins.
> **Purpose:** Turn the legal gate into concrete decisions you can make (or hand to a lawyer), plus a checklist that, once satisfied, unblocks content migration.
> **Not legal advice.** This is a structured brief to inform a decision and scope a legal review. Sources: [`../memory/known-risks.md`](../memory/known-risks.md) (🔴 Content licensing, 🟠 Trademark), [`../rules/content-migration-rules.md`](../rules/content-migration-rules.md), [`../rules/data-modeling-rules.md`](../rules/data-modeling-rules.md).

Convert relative dates to absolute — brief written **2026-07-02**.

---

## 1. The question, restated
Tonary's Vault/Briefs data is derived from **FL Studio manuals, factory presets, and third-party research**. Reproducing that material may require attribution or permission. Until there's a clear policy (and a human sign-off on it), we should not publish curated content beyond the reviewed pilot. The question is really **five smaller decisions**, each with a safe default.

---

## 2. The five sub-decisions

### A. Plugin factual data (parameters, ranges, types, categories, capabilities)
- **Framing:** Individual facts are not copyrightable; a *creative selection/arrangement* of them can be (compilation copyright). Stating "Fruity Parametric EQ 2 has 7 bands" is a fact; copying the manual's exact table layout and prose is expression.
- **Options:** (1) State facts in Tonary's own schema + words, cite the source. (2) Reproduce manual tables/wording verbatim. (3) Link out only.
- **Recommendation:** **(1)** — facts re-keyed into Tonary's schema with a `sourceRef`, never verbatim manual expression. This is already what [`data-modeling-rules.md`](../rules/data-modeling-rules.md) requires.

### B. Manual-derived prose (descriptions, explanations, notes)
- **Framing:** Prose is protected expression. Paraphrase ≠ copy; verbatim or near-verbatim is infringement.
- **Recommendation:** **Rephrase in Tonary's voice + cite**; never paste manual sentences. Where a claim can't be safely rephrased without losing accuracy, **link out** to the official manual instead of reproducing it. (Matches "prefer original phrasing + citations; link rather than reproduce.")

### C. Factory-preset reproduction
- **Framing:** This is the **highest-risk** item. A preset is a set of parameter values; raw values are facts, but (a) a specific curated preset can carry thin creative copyright, and (b) shipping Image-Line's actual **preset files or sample content** is clearly their IP.
- **Options:** (1) Don't ship preset files/exact factory-value dumps; instead describe *how to achieve a similar sound* as an original recipe, cited. (2) Reproduce factory preset values wholesale. (3) Seek explicit permission/license from Image-Line to reproduce presets.
- **Recommendation:** **(1)** for MVP — technique/recipe descriptions in original words, no shipped preset files, no exact factory-patch dumps. Pursue **(3)** later only if reproducing factory presets becomes a core feature.

### D. Trademark — "FL Studio" / "Image-Line"
- **Framing:** These are third-party marks. Referring to them to describe what Tonary is *about* is generally nominative use, **provided Tonary does not imply endorsement or affiliation** and never uses the marks as its own branding.
- **Recommendation:** (i) Ship an in-app **non-affiliation disclaimer** + trademark attribution; (ii) keep the naming rules ([`../brand/naming-rules.md`](../brand/naming-rules.md)) — marks only as platform context, never Tonary branding. *(Concrete, buildable now — see §4.)*

### E. Third-party research sources
- **Framing:** Each source has its own license; some may be paywalled or restrictively licensed.
- **Recommendation:** Cite and **link out**; never reproduce paywalled/licensed text; drop any source whose license forbids derivation. Prefer official/manufacturer docs over third-party prose when they conflict (already a migration rule).

---

## 3. What Tonary's existing rules already de-risk
The framework was built defensively, which narrows the exposure:
- **Every factual record must carry a `sourceRef`** (schema-invalid without one) → provenance is traceable.
- **No fabrication** → we don't invent values that could misrepresent Image-Line's product.
- **Review-then-migrate, no bulk import** → nothing ships unreviewed.
- **Discard the legacy web theme/assets** → no carried-over third-party UI.
So the *residual* decision is mostly a **content policy + a human sign-off**, not a rebuild.

---

## 4. Gates to unblock publishing (checklist)
Publishing Vault content beyond the pilot is unblocked when **all** of these are true:
1. [x] **Content policy adopted** (written): [`../rules/content-policy.md`](../rules/content-policy.md) — rephrase-not-reproduce; cite every fact; link-out when unsure; no preset files / no exact factory-value dumps; drop restrictively-licensed sources.
2. [x] **Every record cites a Source Reference** — enforced by schema/validator.
3. [x] **In-app non-affiliation disclaimer + trademark attribution** — shipped in Settings ▸ About.
4. [ ] **Reviewed sample batch passes a legal-content check:** no verbatim manual text, all values sourced, no fabricated values, no shipped preset files. *(Runs per batch at `/migrate-content` time — see the policy's pre-publish checklist.)*
5. [ ] **Human/legal sign-off on the policy** — the one item Claude cannot self-certify. **This is the actual 🔴 blocker.**

Items 1–4 are things I can implement/enforce; **item 5 is your call** (self-accept the conservative policy, or route to counsel — recommended before first public release).

---

## 5. Recommended path
Adopt the **conservative content policy** (facts + original phrasing + citations + link-out + no preset files + disclaimer). This unblocks migration under clear constraints *now*, while keeping the highest-risk activity (reproducing factory presets/files) out of scope until/unless an explicit Image-Line license is obtained. Get a human legal sign-off on the policy before the first public release.

`Recommendation:` The fastest safe unblock is to (a) let me implement gate #3 (the About disclaimer) and draft the written policy for gate #1, then (b) you make the gate-#5 sign-off call. After that, `/migrate-content` can proceed on the conservative rules.

`Open Question:` Do you want to self-accept the conservative policy for an initial release, or route it through counsel first? That single answer resolves OQ-12.
