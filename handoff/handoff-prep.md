---
name: handoff-prep
description: Clean up the current Make artifact for export. Tightens types, extracts tokens, restructures components, adds an a11y baseline, isolates mocks, and writes a handoff manifest. Use after design-crit and a11y-audit, before downloading.
---

# handoff-prep

Transform the current artifact for portability. Apply all six passes in order. Output `HANDOFF.md` first, then cleaned code.

## Passes (in order)

1. **Structure** — One component per file. Named exports. Remove Make-only imports and flag them under `Known gaps` in the manifest. Group into `components/`, `hooks/`, `lib/`, `types/`.
2. **Types** — Replace `any` and implicit-any with inferred or explicit types. Prop types on every component. Return types where non-trivial. Zod schemas for boundary-crossing data shapes.
3. **Tokens** — Extract hardcoded color, spacing, font-size, radius, shadow into a tokens object. Replace usages. Output `tokens.ts`.
4. **A11y baseline** — Semantic HTML over divs. ARIA only where semantics fall short. Visible focus rings. Keyboard handlers for non-button interactives. `prefers-reduced-motion` guards on motion.
5. **Mock isolation** — Move inline mock data into `mocks/`. Type the contracts. Add `// REPLACE: connect to {endpoint shape}` at each mock site.
6. **Manifest** — Write `HANDOFF.md` using the schema below.

## Manifest schema (mandatory)

```
# Handoff manifest

## Built
- {Component} — {purpose, 1 line}

## Tokens
- Color: {n} → tokens.ts
- Spacing: {n} → tokens.ts
- Type: {scale}
- Other: {radii, shadows, motion}

## Data contracts
- {Endpoint}: {fields, types, mocked at}

## Routing assumptions
- {Path}: {component}

## Known gaps
- {Gap}: {next step in destination repo}

## Recommended destination skills
- figma-create-design-system-rules (Claude Code / Cursor) — map tokens and components to repo conventions.

## Not done
- {Explicit non-goals}
```

## Rules

- **Diagnose before transform.** If `/design-crit` or `/a11y-audit` weren't run, note under `Recommended pre-handoff` in the manifest. Don't refuse.
- **Never invent data shapes.** Document assumptions in the manifest.
- **No visual changes.** Structure, types, tokens, a11y — not redesign.
