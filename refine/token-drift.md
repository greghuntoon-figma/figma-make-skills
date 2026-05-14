---
name: token-drift
description: Detect token drift between the current Make artifact and a reference tokens file. Pair with a @Notion tokens doc, @Figma variables URL, or referenced tokens.json. Flags values in the artifact that don't match the reference, and reference tokens the artifact should be using. Use before handoff to a repo with an established token system. Diagnose only.
---

# token-drift

Compare the artifact's design values to a reference token set. Output drift findings. **Do not modify code.**

## Process

1. Require a token reference (`@Notion` tokens doc, `@Figma` variables URL, or path/URL to a `tokens.json`). If none, ask and stop.
2. Extract values in the artifact: color, spacing, font-size, font-weight, line-height, radius, shadow, motion (duration, easing).
3. Match each against the reference.
4. Output findings using the diagnose schema below.

## Drift categories

1. **Off-token values** — Hardcoded values that *should* map to a reference token but don't (e.g. `#1A73E8` when `color.primary` exists as `#1976D2`).
2. **Near-misses** — Values within tolerance of a reference token (≤ 2% off on color, ≤ 1px off on spacing). Likely intent mismatches.
3. **Unmapped tokens** — Reference tokens that exist for the use case but the artifact uses inline values instead.
4. **Phantom tokens** — The artifact references token names that don't exist in the reference.
5. **Scale violations** — Values outside the reference scale (e.g. `13px` when scale is `12 / 14 / 16`).

## Output schema (mandatory)

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{Location}** — {Category}: {artifact value} ↔ {reference token / value}. Fix: {action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

## Priority

- **Critical** — Phantom tokens (reference doesn't exist), brand-color drift, scale violations on type/spacing.
- **Important** — Off-token values where a reference token exists and matches intent; unmapped tokens in high-frequency locations.
- **Nice-to-have** — Near-misses; unmapped tokens in one-off locations.

## Rules

- **Reference is source of truth.** Never recommend changing the reference to match the artifact.
- **Cite both sides.** Every finding shows the artifact value and the reference value/token name.
- **Tolerance bands declared.** Color: ≤ 2% per channel. Spacing: ≤ 1px. Anything outside is full drift, not near-miss.
- Max 5 per bucket.
- One line per finding after the dash.
- Skip categories with no drift.
- No praise.
- If clean: `## Summary\n0 critical · 0 important · 0 nice-to-have\n\nTokens aligned.` Stop.
- **Inspired by** Firebender's `/sync-figma-token` MCP skill. This is the Make-side parallel for already-generated artifacts.
