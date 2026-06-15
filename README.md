# Salty Dawg II — Website

Single-page marketing funnel for **Salty Dawg II** fishing charter / river adventure brand on the Merrimack River.

Built with: **Astro** + **Tailwind CSS** + **GSAP**

---

## Install

```bash
npm install
```

## Dev server

```bash
npm run dev
# Opens at http://localhost:4321
```

## Build for production

```bash
npm run build
# Output in ./dist/ — drop onto Netlify, Vercel, or any static host
```

## Preview production build locally

```bash
npm run preview
```

---

## Where to edit business details

All editable content (phone, prices, trips, FAQs, policies, social URLs) lives in one file:

```
src/data/site.ts
```

Search for any `[Confirm ...]` or `[Insert ...]` string in that file and replace with real info.

## Where to add images

Drop real images into:

```
public/assets/
```

See `public/assets/ASSET-MANIFEST.md` for the exact filenames the site expects.
Images gracefully fall back when missing — add them and they appear automatically.

---

## File structure

```
saltydawg/
├── src/
│   ├── data/
│   │   └── site.ts              ← ALL editable business content
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Hero.astro
│   │   ├── TripCards.astro
│   │   ├── Gallery.astro
│   │   ├── AboutCaptain.astro
│   │   ├── Expectations.astro   ← What's Included + What to Bring
│   │   ├── Testimonials.astro   ← ⚠️ Placeholders — add real reviews
│   │   ├── FAQ.astro
│   │   └── FooterCTA.astro      ← Final CTA + footer
│   ├── layouts/
│   │   └── Layout.astro         ← HTML wrapper + GSAP animations
│   ├── pages/
│   │   └── index.astro          ← Assembles all components
│   └── styles/
│       └── global.css           ← Brand CSS + Tailwind
├── public/
│   └── assets/
│       └── ASSET-MANIFEST.md    ← Which images go where
├── TODO-confirmations.md        ← Everything still needing owner input
└── README.md
```

---

## Facts still needing owner confirmation

See `TODO-confirmations.md` for the full list. Key blockers before launch:

- Phone number
- Trip prices
- Launch dock address
- License / insurance status
- Real customer testimonials
- Booking URL
