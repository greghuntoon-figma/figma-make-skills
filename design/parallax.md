---
name: parallax
description: Build a parallax effect in Make with disciplined pattern selection. Covers layered translation, pinned scenes, and image reveal. Performance-aware (IntersectionObserver / transform) and accessibility-aware (`prefers-reduced-motion`). Use whenever scroll-tied motion is requested.
---

# parallax

Build a scroll-tied effect using one of three patterns. Apply selection, implementation contract, quality gate, and anti-patterns below.

## Selection

| Intent | Pattern |
|---|---|
| Background moves slower than foreground | **Layered translation** |
| One section holds while content animates | **Pinned scene** |
| Image reveals as user scrolls | **Image reveal** |
| Multiple of the above | Compose; layered translation as base |

## Implementation

- **Library:** Framer Motion (`useScroll`, `useTransform`) or CSS `scroll-timeline` where supported.
- **Trigger:** `IntersectionObserver` for "in view" detection. Never raw `window.scroll` listeners.
- **Transform:** `transform: translate3d()` only. Never `top` / `left` — they trigger layout.
- **Layers:** Each parallax layer in its own absolutely-positioned container with `will-change: transform`.
- **Speed:** Background ≤ 50% of foreground scroll velocity. Subtle beats dramatic.
- **Range:** Effect activates only while section intersects viewport. No work off-screen.

## Quality gate

- `prefers-reduced-motion` falls back to static layout
- 60fps on smallest expected viewport
- No cumulative layout shift on initial paint
- Touch / mobile: parallax reduced or disabled if it harms scroll feel
- No content trapped behind parallax layers at any scroll position

## Anti-patterns (do not)

- Animate `top`, `left`, `margin`, or anything that triggers layout
- Attach handlers to `window.scroll` without throttling
- Parallax depth so extreme it disorients
- Auto-play parallax on hover (parallax is scroll-tied; hover is a different pattern)
- Layer text behind shapes where contrast becomes unreadable
