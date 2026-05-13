---
name: make-prompt
description: Build a TC-EBC structured prompt from the user's intent. Use when they want to make anything non-trivial — multi-screen flows, stateful components, custom behavior, motion, or data. Outputs the prompt; does not build.
---

# make-prompt

Convert intent → structured prompt. **Output the prompt only. Do not build.** User runs it next.

## Process

1. If intent is vague, ask up to 3 targeted questions. Then proceed.
2. Output the prompt in the structure below.
3. End with: `Run this as your next prompt to build.` Stop.

## Output structure

```
**Task**
One sentence. Concrete noun + verb.

**Context**
3–5 bullets: audience, environment, constraints, existing components/tokens, framework targets.

**Examples**
1–3 anchors: URLs, screenshots, named patterns ("Linear-style command palette"). Skip if none.

**Behavior**
Interactions, states, motion. Always include empty / loading / error / success. Touch/keyboard if relevant. `prefers-reduced-motion` fallback if motion is specified.

**Constraints**
Hard limits. Framework and library boundaries, performance budgets, a11y floor (WCAG 2.2 AA), responsive breakpoints, scope exclusions (what NOT to build), deprecations to avoid.
```

## Rules

- Specify states explicitly — Make defaults to skipping empty/error.
- Name libraries when they matter (Framer Motion, Recharts, R3F). Never say "an animation library."
- If tokens are in use, list them inline.
- No prose inside prompt sections.
- No emoji, no decorative formatting.
