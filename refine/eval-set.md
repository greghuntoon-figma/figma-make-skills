---
name: eval-set
description: Generate a test plan and eval set for the current Make artifact. Covers functional cases, edge cases, state coverage, accessibility checks, responsive checks, and regression risks. Use as a handoff artifact, or as input to /code-crit and /a11y-audit. Diagnose only — no test code.
---

# eval-set

Scan the current artifact. Output a structured test plan. **Do not modify code or write tests.**

## Coverage areas

1. **Functional** — Happy path for each user-facing flow. What does the user accomplish? What confirms success?
2. **Edge cases** — Long text overflow, empty data, max/min values, rapid input, slow network, offline.
3. **States** — Empty, loading, partial-loading, error, success, disabled.
4. **A11y** — Keyboard-only walkthrough, screen reader landmark order, focus management on dynamic content, `prefers-reduced-motion`.
5. **Responsive** — Smallest supported width, largest expected width, key breakpoints.
6. **Regression risks** — Areas of code that, if changed, are likely to break silently (shared utilities, layout primitives, state machines).

## Output schema (mandatory)

```
## Eval set

### Functional
1. **{Flow}** — Setup: {state}. Action: {user does X}. Expected: {observable outcome}.

### Edge cases
1. **{Case}** — Setup: {state}. Expected: {observable handling}.

### States
1. **{Component} / {state}** — Trigger: {how to reach}. Expected: {what's visible / interactive}.

### A11y
1. **{Check}** — Method: {keyboard / SR / contrast tool}. Expected: {result}.

### Responsive
1. **{Breakpoint}** — Expected layout: {description}.

### Regression risks
- **{Area}** — Why risky: {1 line}. Watch when: {what kinds of changes trigger inspection}.
```

## Rules

- Every case has: setup, action (where applicable), expected.
- Observable expectations only. "Feels responsive" is not testable; "responds within 100ms" is.
- Max 5 per section. Surface highest-leverage.
- Skip sections that don't apply to this artifact.
- No praise, no narrative.
- This is a plan, not test code. Don't write tests.
