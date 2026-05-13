---
name: extract-tokens
description: Pull every hardcoded design value in the current Make artifact (color, spacing, typography, radius, shadow, motion) into a tokens file. Replace usages with token references. Use when porting tokens to a design system, theming, or as a focused alternative to handoff-prep.
---

# extract-tokens

Identify hardcoded values, group and name them, output a tokens file, replace usages. Output `tokens.ts` first, then the modified code.

## Categories

Extract from each. Skip if none present.

1. **Color** — hex, rgb, hsl, oklch literals. Include opacity variants.
2. **Spacing** — px, rem, em values used for margin, padding, gap.
3. **Typography** — font-family, font-size, font-weight, line-height, letter-spacing.
4. **Radius** — border-radius values.
5. **Shadow** — box-shadow, drop-shadow.
6. **Motion** — durations, easing functions, delays.

## Process

1. Scan the artifact. Collect every value in each category above.
2. Dedupe. Values that appear ≥ 2 times become tokens. One-offs stay inline.
3. Name. Semantic where intent is clear (`color.primary`, `space.cardPadding`). Descriptive fallback (`color.blue600`, `space[4]`).
4. Output `tokens.ts` in the shape below.
5. Replace usages in the code with token references.
6. List any inline one-offs at the bottom of `tokens.ts` with reason.

## Output schema (mandatory)

```
// tokens.ts

export const color = {
  primary: '#...',      // semantic where intent clear
  danger: '#...',
  blue600: '#...',      // descriptive fallback
} as const;

export const space = {
  1: '0.25rem',         // 4px scale
  2: '0.5rem',
  // ...
} as const;

export const font = {
  family: { ... },
  size: { ... },
  weight: { ... },
  lineHeight: { ... },
} as const;

export const radius = { ... } as const;
export const shadow = { ... } as const;
export const motion = {
  duration: { ... },
  easing: { ... },
} as const;

/* Inline (not tokenized):
 * - {file:line} {value} — {reason}
 */
```

## Rules

- **Semantic over descriptive** where intent is clear. `color.danger` beats `color.red500`.
- **Don't invent semantic meaning.** A value used decoratively once has no role.
- **Preserve original values.** No rounding, no normalizing. Extraction ≠ redesign.
- **One-offs stay inline.** A value used once with no semantic intent isn't a token. Document at the bottom.
- **No visual changes.** Rename-and-reference only.
