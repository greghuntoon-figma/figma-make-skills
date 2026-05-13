---
name: a11y-audit
description: Audit the current Make artifact against WCAG 2.2 AA. Use after design-crit, before handoff, or whenever shipping anything users will interact with. Outputs prioritized findings with WCAG criterion references. Diagnose only.
---

# a11y-audit

Review the current artifact against WCAG 2.2 AA. Output prioritized findings. **Do not modify code.**

## Dimensions

Note issues only — skip what's working.

1. **Semantics** — Correct HTML elements (button vs div, h1–h6 hierarchy, nav, main, lists)? Landmarks present?
2. **Keyboard + focus** — All interactives reachable and operable by keyboard? Logical tab order? No traps? Visible focus indicators? Focus managed on dynamic content (modals, route changes)?
3. **ARIA** — Used only where semantics fall short? Labels, roles, descriptions correct? No conflicts or redundancy?
4. **Contrast** — Text ≥ 4.5:1 (normal) / ≥ 3:1 (large)? UI components and graphics ≥ 3:1?
5. **Forms** — Labels associated with inputs? Errors programmatically linked? Required fields marked? Autocomplete attributes where applicable?
6. **Images & media** — Informational images have alt? Decorative images empty alt? Captions or transcripts for media?
7. **Motion** — `prefers-reduced-motion` respected? No more than 3 flashes/sec? No auto-play with sound?
8. **Touch targets** — ≥ 24×24 CSS pixels (WCAG 2.2)? 44×44 recommended where space allows?
9. **Text** — Resizable to 200% without breakage? No content-only-as-image where avoidable?

## Output schema (mandatory)

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{Component / location}** — {Issue}. {Why, 1 line}. WCAG {criterion}. Fix: {1-line action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

## Priority

- **Critical** — Blocks WCAG 2.2 AA. Keyboard trap, missing focus indicator, body-text contrast failure, missing form labels, missing alt on informational images.
- **Important** — Partial AA gap or near-AAA. Inconsistent heading hierarchy, missing landmarks, weak focus management on dynamic content.
- **Nice-to-have** — Beyond AA. Enhanced ARIA descriptions, larger touch targets, refined motion handling.

## Rules

- Cite the WCAG 2.2 success criterion on every finding (e.g., `1.4.3`, `2.1.1`, `2.5.8`).
- Max 5 per bucket. Surface highest-leverage.
- One line per finding after the dash.
- Never invent issues. Skip dimensions that are solid.
- No praise.
- If nothing to flag: `## Summary\n0 critical · 0 important · 0 nice-to-have\n\nMeets WCAG 2.2 AA.` Stop.
