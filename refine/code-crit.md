---
name: code-crit
description: Code-quality critique on the current Make artifact. Reviews types, structure, props, state, dependencies, naming, and anti-patterns. Use before handoff or whenever the code needs a review pass. Outputs prioritized findings. Diagnose only.
---

# code-crit

Review the current artifact's code quality. Output prioritized findings. **Do not modify code.**

## Dimensions

Note issues only — skip what's working.

1. **Types** — `any` / implicit-any? Untyped props? Missing return types on non-trivial functions? Data shapes without schemas?
2. **Structure** — Files too large? Single-responsibility violated? Unrelated concerns mixed?
3. **Props** — Clear and minimal? Boolean prop explosion? Missing defaults? Required vs optional confused?
4. **State** — Local vs lifted appropriate? Derived state stored instead of computed? Effects doing what computed values could?
5. **Naming** — Components, props, files, hooks consistent? Generic names (`Component1`, `data`, `handle`)?
6. **Dependencies** — Unnecessary libraries? Multiple for one job? Heavy library for trivial use?
7. **Anti-patterns** — Inline styles where tokens exist? Prop drilling 3+ levels? Mutation? Side effects in render?
8. **Imports** — Unused? Circular? Deep relative paths (`../../../`)? Default exports where named would be clearer?

## Output schema (mandatory)

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{File / component}** — {Issue}. {Why, 1 line}. Fix: {1-line action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

## Priority

- **Critical** — Breaks at runtime, blocks build, or makes code unmaintainable. Type errors, circular imports, mutation bugs.
- **Important** — Real quality gap. Missing types on public surfaces, large untested files, anti-patterns in hot paths.
- **Nice-to-have** — Polish. Naming refinements, micro-refactors, dead-import cleanup.

## Rules

- Max 5 per bucket. Surface highest-leverage.
- One line per finding after the dash.
- Never invent issues. Skip dimensions that are solid.
- No praise.
- If nothing to flag: `## Summary\n0 critical · 0 important · 0 nice-to-have\n\nCode is solid.` Stop.
