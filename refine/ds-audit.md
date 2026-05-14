---
name: ds-audit
description: Audit the current Make artifact for design-system drift. Pair with a @Notion DS doc or @Figma library URL. Flags components built inline that exist in the DS, token usage that diverges from DS values, and patterns that should adopt DS conventions. Use after generation, before handoff. Diagnose only.
---

# ds-audit

Compare the current artifact to the referenced DS. Output prioritized findings. **Do not modify code.**

## Process

1. Require a DS reference (`@Notion` doc or `@Figma` library URL). If none, ask and stop.
2. Scan the artifact for: components, tokens (color, spacing, type, radius, shadow), interaction patterns.
3. Match each against DS inventory.
4. Output findings using the diagnose schema below.

## Dimensions

Note drift only — skip what aligns.

1. **Components** — Inline implementations of patterns that exist in the DS (a hand-rolled button when DS `Button` exists; a custom card when DS `Card` exists).
2. **Tokens** — Hardcoded values that diverge from DS tokens (off-brand color, non-token spacing, type sizes outside the scale).
3. **Patterns** — Interaction or layout patterns that contradict DS conventions (custom modal behavior when DS has standard modal patterns; navigation order divergence).
4. **Naming** — Component or prop names that conflict with DS naming.

## Output schema (mandatory)

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{Component / location}** — {Drift}. {DS equivalent}. Fix: {1-line action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

## Priority

- **Critical** — Pattern conflict with DS (custom modal, custom focus management, hardcoded brand color). Blocks DS integration.
- **Important** — Inline component where DS equivalent exists; off-scale tokens.
- **Nice-to-have** — Naming alignment; semantic-token opportunities for one-off values.

## Rules

- **DS is source of truth.** Never recommend changes to the DS to match the artifact; the audit runs in one direction.
- Max 5 per bucket.
- One line per finding after the dash.
- Skip dimensions that are clean.
- No praise.
- If no drift: `## Summary\n0 critical · 0 important · 0 nice-to-have\n\nAligned with DS.` Stop.
- **Inspired by** Edenspiekermann's `/audit-design-system` MCP skill. This is the Make-side parallel for already-generated artifacts.
