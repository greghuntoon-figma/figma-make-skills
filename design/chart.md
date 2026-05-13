---
name: chart
description: Build a production-quality chart in Make. Encodes chart-type selection by data shape and intent, applies WSJ-guide visual conventions, and locks in library and token usage. Use whenever the user wants to visualize data — even a single chart. Replaces freeform Make defaults.
---

# chart

Build a chart with disciplined pattern selection. Apply selection, implementation contract, quality gate, and anti-patterns below.

## Selection (by intent × data shape)

| Intent | Data | Use |
|---|---|---|
| Trend over time | 1 series | Line |
| Trend over time | 2–5 series | Multi-line |
| Trend over time | many series | Small multiples |
| Compare categories | 1 series | Bar (horizontal if labels long) |
| Compare categories | 2–4 series | Grouped bar |
| Part-to-whole over time | stacked | Stacked area or stacked bar |
| Part-to-whole snapshot | 2–4 parts | Stacked bar (single) — **not** pie |
| Distribution / correlation | x,y pairs | Scatter |
| Density / 2D pattern | matrix | Heatmap |
| Single number with trend | 1 metric | KPI tile + sparkline |

## Implementation

- **Library:** Recharts (default) or Visx for advanced needs.
- **Tokens:** All colors, spacing, and type from token references. No inline literals.
- **Color:** Categorical palette (≤ 6 hues, perceptually distinct). Sequential palette for ordinal scales. Single hue + opacity for one-series charts.
- **Annotation:** Title, axis labels, units, source. Direct-label series over legends where space allows.
- **Reference lines:** Zero baseline always shown on bar/area. Comparison lines (avg, target) where context demands.

## Quality gate

- Axis labels include units
- Numbers formatted (thousands separators, currency symbols, % where applicable)
- Color-blind safe palette (test against deuteranopia)
- Legible at smallest expected viewport
- Source attribution present where origin matters
- `role="img"` with `aria-label` summarizing the chart

## Anti-patterns (do not)

- Pie charts with ≥ 5 slices
- 3D anything
- Truncated y-axis on bar charts
- Dual y-axes (use small multiples instead)
- Rainbow gradients on continuous scales
- Legend when direct labels would fit
