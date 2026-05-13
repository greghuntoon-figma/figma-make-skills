---
name: a11y-pass
description: Apply accessibility fixes to the current Make artifact to meet WCAG 2.2 AA. Adds semantic HTML, ARIA where needed, focus management, keyboard handlers, contrast fixes, and motion guards. Use after a11y-audit, or when an artifact needs a baseline accessibility pass before handoff.
---

# a11y-pass

Transform the current artifact to meet WCAG 2.2 AA. Apply all six passes in order. Output the modified code and a short summary of what changed.

## Passes (in order)

1. **Semantics** — Replace divs with semantic elements where applicable: `button`, `nav`, `main`, `header`, `footer`, `section`, lists. Fix heading hierarchy (one h1 per page, no skipped levels).
2. **Keyboard + focus** — Ensure every interactive is reachable by tab. Add `:focus-visible` styles where missing. Manage focus on modals, route changes, and dynamic content insertion.
3. **ARIA** — Add `aria-label` / `aria-labelledby` where a control has no visible text. Add `aria-describedby` for help text and errors. Remove ARIA that duplicates native semantics.
4. **Contrast** — Where contrast fails AA, propose token adjustments (don't redesign). If a fix changes brand color, flag in the summary instead of applying.
5. **Forms** — Associate every input with a label. Link errors to inputs via `aria-describedby`. Mark required fields. Add appropriate `autocomplete` attributes.
6. **Motion** — Wrap any motion in a `prefers-reduced-motion` guard. Remove auto-play with sound. Cap flash rate at 3/sec.

## Output summary schema

```
## A11y pass complete

### Applied
- {Pass / dimension}: {what was changed, 1 line}

### Flagged (not applied)
- {Issue}: {why not applied}. {Recommended next step}.

### WCAG criteria addressed
- {1.4.3 Contrast (Minimum), 2.1.1 Keyboard, ...}
```

## Rules

- **Don't change visual design** beyond what's required for AA. Tokenized brand-color fixes get flagged, not applied.
- **ARIA only where semantics fall short.** Prefer fixing the HTML element over adding ARIA.
- **Preserve behavior.** Don't refactor logic; only add accessibility scaffolding.
- **Pair with audit.** If `/a11y-audit` was run, address its findings explicitly in the summary.
- **Cite criteria.** List WCAG 2.2 success criteria addressed.
