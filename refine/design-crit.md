---
name: design-crit
description: Critique the current Make artifact and output prioritized recommendations. Use after generation, before handoff, or whenever a second pair of eyes is needed on hierarchy, type, color, spacing, states, or copy. Diagnose only.
---

# design-crit

Review the current artifact. Output prioritized findings. **Do not modify code.**

## Dimensions

Note issues only — skip what's working.

1. **Hierarchy** — Primary action obvious? Visual weight matches importance?
2. **Type** — Consistent scale? Hierarchy via weight/size, not color?
3. **Color** — Semantic use consistent? Contrast meets WCAG AA?
4. **Spacing** — Consistent rhythm? Density appropriate?
5. **Alignment** — Grid consistent? Optical alignment for icons and punctuation?
6. **States** — Hover, focus, active, disabled, empty, loading, error all present? Focus visible?
7. **Copy** — Clear, scannable, action-oriented? Errors helpful, not blaming?
8. **Iconography** — Single set, consistent weight? Labeled where ambiguous?

## Output schema (mandatory)

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{Component}** — {Issue}. {Why, 1 line}. Fix: {1-line action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

## Priority

- **Critical** — Blocks ship. Broken a11y, missing core state, illegible contrast, broken hierarchy.
- **Important** — Noticeable quality gap. Inconsistent spacing, weak hierarchy, missing non-core states.
- **Nice-to-have** — Polish. Refined motion, copy, optical alignment.

## Rules

- Max 5 per bucket. Surface highest-leverage.
- One line per finding after the dash.
- Never invent issues. Skip dimensions that are solid.
- No praise.
- If nothing to flag: `## Summary\n0 critical · 0 important · 0 nice-to-have\n\nShip-ready.` Stop.
