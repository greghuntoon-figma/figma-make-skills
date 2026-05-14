# Changelog

## v0.3.1 — 2026-05-13

- Added three refine-tier skills inspired by Figma Community MCP skills:
  - `/sr-spec` — screen reader spec generator (inspired by Uber `/create-voice`)
  - `/ds-audit` — DS drift audit, post-flight sibling to `/ds-check` (inspired by Edenspiekermann `/audit-design-system`)
  - `/token-drift` — token drift detection (inspired by Firebender `/sync-figma-token`)
- Added "Related work" section to README documenting the relationship to the broader Figma skills ecosystem.
- Updated philosophy text per maintainer revision.

## v0.3 — 2026-05-13

- **Four-tier model.** Replaced workflow / capability / handoff (with diagnose/transform sub-tiers) with **workflow / design / refine / handoff**.
- **Renamed `capability/` → `design/`** to honor the framing: these skills encode applied visual design (information, motion, narrative, interaction), not 0 → 1 generation.
- **Added `refine/` tier** for the design iteration loop (crit, audit, eval, fix). Previously folded into handoff/ — incorrectly.
- **Skill moves:**
  - `design-crit`, `a11y-audit`, `code-crit`, `eval-set`, `a11y-pass`, `extract-tokens` → `refine/`
  - `handoff-spec`, `handoff-prep` stay in `handoff/`
  - `chart`, `parallax`, `hero`, `microinteractions` → `design/` (renamed from `capability/`)
- **No skill content changes.** Folder reorganization and metadata only.
- Updated `README.md`, `CONTRIBUTING.md`, `scripts/flatten.sh` to match.

## v0.2 — 2026-05-12

- **Compression pass** on initial three skills. ~23% byte reduction across `make-prompt`, `design-crit`, `handoff-prep`. Cuts focused on: redundant rule restatements, voice without instructional load, and dimension over-specification.
- **Added 11 skills.**
  - Workflow: `ds-check`
  - Capability: `chart`, `parallax`, `hero`, `microinteractions`
  - Diagnose: `a11y-audit`, `code-crit`, `eval-set`, `handoff-spec`
  - Transform: `extract-tokens`, `a11y-pass`
- **Fixed:** TC-EBC final letter in `make-prompt`. `Contract` → `Constraints`.

## v0.1

- Initial three skills: `make-prompt`, `design-crit`, `handoff-prep`.
- Established canonical diagnose output schema: `Summary → Critical → Important → Nice-to-have`.
- Established manifest schema for `HANDOFF.md`.
