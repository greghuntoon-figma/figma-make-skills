# Contributing

## Skill anatomy

Every skill is a single `.md` file with YAML frontmatter:

```yaml
---
name: skill-name              # becomes the slash command: /skill-name
description: When to use ... and what it does ...
---
```

The body is markdown. Target: under ~80 lines / 3 KB.

**Context in Figma Make is expensive.** The `description` is always in context. Every byte there is paid on every Make session, not just on invocation. Keep descriptions tight but pushy enough to combat undertriggering — describe both *what* the skill does and *when* to use it.

## SVELT discipline

- **Imperative voice.** "Convert intent → prompt." not "This skill converts..."
- **No preamble.** No "You are an expert in..."; no "Your job is to..."
- **No restated rules.** Each constraint stated once.
- **Cut voice that isn't load-bearing.** Clever framing without instructional value gets removed.
- **Output schemas are literal templates** (fenced code blocks). The model fills in the structure rather than constructing it.
- **Anti-patterns inline.** A short "do not" list inside the skill prevents the most common failures.

## Tier conventions

### workflow (pre-generation)
Skills that run before Make builds. Output text the user runs next. Must not build.

### design (applied visual design — not 0 → 1)
Skills that encode a specific design discipline applied to a build output: information design (`/chart`), motion design and spatial choreography (`/parallax`), narrative composition (`/hero`), interaction design (`/microinteractions`). Make does the 0 → 1 visual work; these skills apply established visual-design canon to specific output types.

Four sections per skill:
1. **Selection** — Decision table by intent (or intent × data shape)
2. **Implementation** — Concrete library + token + behavior contract
3. **Quality gate** — Must-be-true checklist
4. **Anti-patterns** — Must-not list

Library choices must be concrete. Library-agnostic design skills produce variance and defeat the purpose.

### refine (review and refine the build)
Skills that critique, audit, evaluate, and fix the build between generation and handoff. Loops — run any subset, refine, repeat.

Two sub-shapes within refine:
- **Diagnose** (read-only): `-crit`, `-audit`, `-set` suffixes. Output structured findings; do not modify code. Use the canonical diagnose schema below unless the output is fundamentally a different shape (e.g. `/eval-set` is a test plan).
- **Transform** (modifies code): `-pass`, action verbs (`extract-tokens`). Apply numbered passes in order. Output cleaned code plus a short summary of what changed.

### handoff (prep for export)
Terminal cleanup. Runs once when iteration is complete. Inherits the manifest schema below.

## Shared schemas

### Diagnose output

```
## Summary
{n} critical · {n} important · {n} nice-to-have

## Critical
1. **{Component / location}** — {Issue}. {Why, 1 line}. Fix: {1-line action}.

## Important
1. **{...}** — {...}.

## Nice-to-have
1. **{...}** — {...}.
```

Priority definitions:
- **Critical** — Blocks ship.
- **Important** — Noticeable quality gap.
- **Nice-to-have** — Polish.

Rules:
- Max 5 per bucket.
- No praise.
- Skip empty buckets.
- Clean run: `Summary` line + a single confirmation sentence (e.g. `Ship-ready.`, `Meets WCAG 2.2 AA.`, `Code is solid.`).

### Manifest output (`HANDOFF.md`)

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
- {Skill name + tool} — {what it does in the destination}

## Not done
- {Explicit non-goals}
```

## Adding a new skill

1. Pick a tier. Confirm an existing skill doesn't already cover the job.
2. For a new design-tier skill, confirm it encodes a recognized design discipline (information / motion / narrative / interaction / etc.). Patterns without a discipline behind them don't belong in `design/`.
3. Draft using the conventions above.
4. Add to the appropriate tier folder.
5. Add a one-line entry to `README.md` under `Suite contents`.
6. Add a `CHANGELOG.md` entry.

## Naming

- Slash command: kebab-case, verb-first or noun-only (`make-prompt`, `design-crit`, `chart`).
- Refine diagnose skills end with `-crit`, `-audit`, or `-set`.
- Refine transform skills end with `-pass` or use an action verb (`extract-tokens`).
- Design skills use the noun for what they produce (`chart`, `hero`).
- Handoff skills are prefixed `handoff-` (`handoff-prep`, `handoff-spec`).

## Testing

Currently manual: run the skill against real Make artifacts, check the output, iterate. A more rigorous test harness is a v0.4 goal.
