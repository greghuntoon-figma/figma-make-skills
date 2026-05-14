---
name: sr-spec
description: Generate screen reader specifications for the current Make artifact. Documents how each interactive and informational element should be announced by VoiceOver, TalkBack, and what ARIA attributes support those announcements. Use as a handoff artifact for QA, accessibility review, or developer reference. Diagnose only — does not modify code.
---

# sr-spec

Scan interactives and informational regions. Output a screen reader specification. **Do not modify code.**

## Coverage

Note every element that has a non-trivial screen reader announcement. Skip purely decorative content.

1. **Landmarks** — Header, nav, main, footer, search, complementary regions.
2. **Headings** — Hierarchy and announced text.
3. **Buttons and links** — Accessible name source (visible text vs `aria-label`) and announcement.
4. **Form controls** — Label association, required state, error linkage, autocomplete role.
5. **Dynamic regions** — Live regions (`aria-live`), status messages (`role="status"`), alerts (`role="alert"`).
6. **Images and media** — `alt` text or empty alt (decorative). Long descriptions if applicable.
7. **Tables and lists** — Caption, scope, list semantics.
8. **Modals, menus, tabs** — Focus management, `aria-expanded` / `aria-selected` / `aria-controls` relationships.

## Output schema (mandatory)

```
# Screen reader spec

## Landmarks
- {role / element} — {announced label}

## Heading outline
- h1: {text}
  - h2: {text}
    - h3: {text}

## Interactives
| Element | Visible text | Accessible name | VoiceOver announces | TalkBack announces | Notes |
|---|---|---|---|---|---|
| {Button "Save"} | Save | Save | "Save, button" | "Save, button" | — |
| {Icon button} | — | aria-label="Close dialog" | "Close dialog, button" | "Close dialog, button" | Icon-only; label required |

## Forms
| Input | Label association | Required | Error linkage | Autocomplete |
|---|---|---|---|---|
| {Email} | <label for> | yes (aria-required) | aria-describedby="email-error" | email |

## Dynamic regions
- {Region} — Role: {status / alert / live}. Politeness: {polite / assertive}. Announced when: {trigger}.

## Reading order check
- {Section / component} — {Expected DOM order matches visual order? Y / N. If N, the divergence.}

## Gaps
- {Element / location} — {What's missing for a clean announcement}. Fix: {1-line action}.
```

## Rules

- **Document, don't fix.** This is a spec, not a patch. Gaps go in the `Gaps` section; don't modify code.
- **VoiceOver and TalkBack both.** Where announcements differ meaningfully (rotor behavior, role names), note both.
- **Visible text first, ARIA second.** Prefer accessible names from visible text. Flag `aria-label` overrides where visible text would suffice.
- **Reading order matters.** DOM order drives screen reader sequence; visual order is a separate concern. Flag divergence.
- **No praise. No narrative.** Spec content only.
- **Inspired by** Uber's `/create-voice` MCP skill for Figma canvas. This is the Make-side parallel for already-generated artifacts.
