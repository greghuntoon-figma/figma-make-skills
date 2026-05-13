# Figma Make Skills

A suite of custom skills for [Figma Make](https://help.figma.com/hc/en-us/articles/40283639496599-Custom-skills-for-Figma-Make) covering the design disciplines that surround 0 → 1 visual generation.

## Philosophy

> Make handles 0 → 1 visual design, or builds from existing Figma designs. These skills are for the other satellite functions in your design processes.

Make generates brand-and-layout output from prompts. These skills cover the disciplines that wrap that generation: scoping the work, applying domain-specific visual design (information, motion, narrative, interaction), reviewing and refining, and preparing for production handoff. The disciplines good teams want to do consistently — and skip when manual.

## Tier map

| Tier | Phase | Skills |
|---|---|---|
| **workflow** | Scoping the build | `/make-prompt`, `/ds-check` |
| **design** | Applied visual design (not 0 → 1) | `/chart`, `/parallax`, `/hero`, `/microinteractions` |
| **refine** | Review and refine the build | `/design-crit`, `/a11y-audit`, `/code-crit`, `/eval-set`, `/a11y-pass`, `/extract-tokens` |
| **handoff** | Prep for export | `/handoff-spec`, `/handoff-prep` |

## Constraints (Figma Make)

- Custom skills are supported only on the **default** and **Claude Opus 4.7** models.
- Skills are single-file `.md` only — no bundled scripts, references, or assets.
- Skills are **account-scoped**, not team-scoped. To share, export the `.md` and have your teammate upload it on their account.
- Only **one skill per prompt** is invoked. Compose skills sequentially across prompts, not within a single prompt.

## Install

1. Run `./scripts/flatten.sh` to gather all skills into `./dist/`.
2. In Figma Make, click the **+** in the prompt box.
3. Select **Skills → Create skill → Import from computer**.
4. Upload each `.md` file from `./dist/`.

Skills become available as slash commands (e.g. `/make-prompt`, `/design-crit`).

## Canonical pipeline

```
intent
  │
  ▼
/make-prompt           structured TC-EBC prompt
  │
  ▼
/ds-check              validate against design system  (optional)
  │
  ▼
[Make builds]  ◄────────────────────┐
  │                                 │
  ▼                                 │
/design-crit                        │
/a11y-audit                         │  refine loop
/code-crit                          │  (repeat as needed)
/eval-set                           │
  │                                 │
  ▼                                 │
/a11y-pass                          │
/extract-tokens                     │
  │                                 │
  └──── more iteration? ────────────┘
  │
  ▼
/handoff-prep          full export prep
/handoff-spec          read-only manifest  (alternative)
  │
  ▼
export → destination (Claude Code / Cursor with figma-create-design-system-rules)
```

Design-tier skills (`/chart`, `/parallax`, `/hero`, `/microinteractions`) plug directly into Make builds when generating their specific output types.

## Suite contents

### workflow

- **`/make-prompt`** — Build a TC-EBC (Task, Context, Examples, Behavior, Constraints) prompt from raw intent. Outputs the prompt; does not build.
- **`/ds-check`** — Pre-flight check on a prompt against a Notion DS doc or Figma library URL. Identifies DS components to use and flags gaps.

### design (applied visual design)

- **`/chart`** — Information design. Selection by intent × data shape. Recharts default; WSJ-guide conventions.
- **`/parallax`** — Motion design and spatial choreography. Three scroll-tied patterns.
- **`/hero`** — Narrative composition for above-the-fold sections. Five canonical patterns.
- **`/microinteractions`** — Interaction design. Locked motion contract (durations, easings, stagger).

### refine

- **`/design-crit`** — Visual hierarchy, type, color, spacing, state coverage, copy.
- **`/a11y-audit`** — WCAG 2.2 AA audit with criterion references.
- **`/code-crit`** — Types, structure, props, state, dependencies, naming.
- **`/eval-set`** — Test plan: functional, edge cases, states, a11y, responsive, regression risks.
- **`/a11y-pass`** — Applies WCAG 2.2 AA fixes. Summary cites criteria.
- **`/extract-tokens`** — Pulls color, spacing, type, radius, shadow, motion into `tokens.ts`.

### handoff

- **`/handoff-spec`** — Read-only manifest of the current artifact.
- **`/handoff-prep`** — Full cleanup: structure, types, tokens, a11y, mocks, manifest.

## Shared schemas

Two contracts cross the suite:

- **Diagnose output** — Every crit/audit skill outputs `Summary → Critical → Important → Nice-to-have`. New diagnose skills inherit this shape.
- **Manifest output** — `/handoff-prep` and `/handoff-spec` produce the same `HANDOFF.md`. Destination-side tools (Claude Code, Cursor with `figma-create-design-system-rules`) consume either output identically.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for full schema details.

## Versioning

See [`CHANGELOG.md`](CHANGELOG.md).

## License

MIT — see [`LICENSE`](LICENSE).
