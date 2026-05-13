---
name: handoff-spec
description: Generate a handoff manifest for the current Make artifact without modifying code. Use when you want to document what was built — components, tokens, data assumptions, gaps — without the full handoff-prep transform. Pairs with destination-side skills like figma-create-design-system-rules.
---

# handoff-spec

Scan the current artifact. Output `HANDOFF.md` only. **Do not modify code.**

## Process

1. Scan components, hooks, hardcoded values, mocks, routing, library imports.
2. Output `HANDOFF.md` using the schema below.
3. Stop.

## Manifest schema (mandatory)

```
# Handoff manifest

## Built
- {Component} — {purpose, 1 line}

## Tokens (in use, not yet extracted)
- Color: {n} unique values
- Spacing: {n} unique values
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

## Recommended pre-handoff
- {Skill}: {what it would address}
```

## Rules

- **Read-only.** Document what exists. Don't transform.
- **Never invent.** If a contract or assumption is unclear, write `unclear — needs spec` instead of guessing.
- **Flag pre-handoff opportunities.** If hardcoded values, missing types, or a11y gaps are visible, list under `Recommended pre-handoff` with the skill that would fix them (e.g., `/extract-tokens`, `/a11y-pass`).
