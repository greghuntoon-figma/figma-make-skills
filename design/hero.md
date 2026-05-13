---
name: hero
description: Build a landing-page hero in Make with disciplined pattern selection. Covers 5 canonical patterns from static to interactive. Locks library, tokens, and performance constraints. Use whenever a hero, splash, or above-the-fold section is requested.
---

# hero

Build a hero using one of five patterns. Apply selection, implementation contract, quality gate, and anti-patterns below.

## Selection

| Intent | Pattern |
|---|---|
| Brand-led, type-forward, minimal motion | **Static + ambient** (subtle gradient or noise) |
| Atmospheric, modern | **Animated mesh gradient** |
| Tech / product-led, depth | **Particle field** (canvas) |
| Story-led, scroll-driven | **Scroll-tied 3D** (R3F) |
| Editorial, media-led | **Video background + overlay** |

## Implementation

- **Type:** Hero headline always the largest type on the page. Single visual focal point. CTA visible above the fold on smallest expected viewport.
- **Tokens:** All color, spacing, and type from tokens.
- **Motion library:** Framer Motion for entrance and scroll. Three.js + R3F for 3D. Canvas API for particles.
- **Loading:** Hero must show usable content before motion / 3D / video loads. Progressive enhancement.
- **Media:** Video MP4 + WebM with poster image required. Background gradients in CSS, not images. SVG for static decorative shapes.

## Quality gate

- LCP target: ≤ 2.5s on 4G
- `prefers-reduced-motion` falls back to static
- CTA reachable by keyboard, focus visible
- Hero readable without motion / 3D loaded
- No autoplay video with sound
- Mobile: video may be replaced with poster image to save bandwidth

## Anti-patterns (do not)

- Block content render on motion / 3D / video load
- Hero CTA below the fold on any supported viewport
- Decorative motion that competes with the CTA for attention
- Headline wraps to more than 3 lines on any breakpoint
- Carousel / slider hero (low conversion, accessibility burden)
