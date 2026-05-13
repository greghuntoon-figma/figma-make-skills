---
name: microinteractions
description: Build microinteractions in Make with disciplined motion patterns. Covers button feedback, form validation, content arrival, toasts, loading, and success confirmation. Locks easing, duration, and accessibility guards. Use whenever an artifact needs hover, focus, success, error, or loading feedback that isn't already there.
---

# microinteractions

Build microinteractions using the patterns below. Apply selection, motion contract, quality gate, and anti-patterns.

## Selection

| Intent | Pattern |
|---|---|
| Button / interactive feedback | **Hover / press** — opacity, scale, or color shift |
| Form input validation | **Inline state** — color + icon transition on blur or submit |
| Content arrival | **Fade + rise** — opacity 0→1, translateY 8px→0 |
| Content removal | **Fade + collapse** — opacity 1→0, height to 0 |
| Status announcement | **Toast** — slide in from edge, auto-dismiss with progress |
| Loading | **Skeleton** for layout-known; **spinner** for unknown duration |
| Success confirmation | **Inline checkmark** with brief scale-in |

## Motion contract

- **Library:** Framer Motion. Native CSS transitions for hover / focus only.
- **Duration:** 150–250ms for state changes. 300–400ms for content arrival/removal. Never > 500ms for UI feedback.
- **Easing:** `easeOut` for entrances, `easeIn` for exits, `easeInOut` for state toggles. No linear.
- **Stagger:** 30–60ms between sibling animations. Lead-follow, not chorus.
- **Tokens:** All durations and easings from `motion` tokens, not inline values.

## Quality gate

- `prefers-reduced-motion` falls back to instant state changes (opacity / display only, no transform)
- Focus states match hover states in clarity (visible to keyboard users)
- Disabled states visually distinct and not interactive
- Toasts dismissible by keyboard (`Esc`) and announced (`role="status"` or `role="alert"`)
- No flash on initial mount; animations fire on user action or genuine state arrival

## Anti-patterns (do not)

- Animate on every render (use `key` or mount/unmount triggers)
- Bounce or overshoot on UI feedback (reserve for delight moments)
- Spinner where progress is knowable (use a determinate bar)
- Toast queue with > 3 visible simultaneously
- Hover-only feedback (touch and keyboard users get nothing)
- Decorative motion that competes with the user's primary task
