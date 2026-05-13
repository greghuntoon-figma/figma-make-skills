---
name: ds-check
description: Pre-flight check on a Make prompt against your design system. Pair with a @Notion DS doc or @Figma library URL. Identifies which DS components the prompt should use, flags missing components and tokens, and enriches the prompt with DS-aware context. Use before invoking Make on anything that should respect a DS.
---

# ds-check

Validate the prompt against the referenced DS. **Do not build the artifact.** Output an enriched prompt or a gap report.

## Process

1. Require a DS reference (`@Notion` doc or `@Figma` library URL). If none, ask the user and stop.
2. Parse the prompt for UI elements (components, layouts, patterns).
3. Match each against DS inventory.
4. Output one of the two modes below.
5. End with: `Run the enriched prompt as your next message to build.` Stop.

## Output (one of two modes)

### Mode A — Enriched prompt (all elements map to DS)

Output a copy of the original prompt with explicit DS references injected:
- "use the `Card` component from @DS"
- "color tokens: `brand.primary`, `surface.elevated`"
- "spacing tokens: `space.md`, `space.lg`"

### Mode B — Gap report (one or more elements missing from DS)

```
## DS gap report

### Maps to DS
- {Prompt element} → {DS component / token}

### Missing from DS
- **{Element}** — {What the prompt assumes}. Options: (1) build inline and flag for DS contribution, (2) substitute {nearest DS equivalent}, (3) revise prompt to scope out.

### Decision needed
- {1-line description of what user must choose before running}
```

## Rules

- **DS is the source of truth.** Don't invent component names. If unclear, ask.
- **One mode per output.** Either enriched prompt or gap report, not both.
- **Don't build.** Output text only; user runs the enriched prompt next.
- **Flag, don't decide.** If gaps exist, present options. User chooses.
