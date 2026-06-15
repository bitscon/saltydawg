# CHANGE-2026-06-15-001-initial-site-build

Date: 2026-06-15
Type: feat
ADR reference: none

## What changed
Built full single-page Astro + Tailwind CSS + GSAP marketing funnel site for Salty Dawg II fishing charter brand.

## Why
Initial site scaffold per operator instruction. Project saltydawg bootstrapped in workspaces with AGENT_OS.md governance.

## Components built
- Layout.astro (HTML wrapper + all GSAP animations)
- Header.astro (sticky nav, mobile drawer)
- Hero.astro (full-width hero, headline, CTAs)
- TripCards.astro (4 trip package cards)
- Gallery.astro (6-image masonry grid)
- AboutCaptain.astro (bio + trust badges)
- Expectations.astro (What's Included + What to Bring)
- Testimonials.astro (placeholder cards only — no real reviews in assets)
- FAQ.astro (11 questions, CSS accordion)
- FooterCTA.astro (final CTA banner + full footer)
- src/data/site.ts (all editable content in one file)

## Risk
Low. Static build only. No backend. Images gracefully degrade when missing.

## Verified
- npm run build: PASS (no errors, no warnings)
- 1 page built to dist/
