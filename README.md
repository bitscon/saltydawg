# Salty Dawg II — Website

Single-page marketing funnel for **Salty Dawg II** fishing charter / river adventure brand on the Merrimack River.

Built with: **Astro 6** + **Tailwind CSS 4** + **GSAP 3** — static output.

---

## Quick start (local dev)

```bash
npm install
npm run dev
# http://localhost:4321
```

## Production build

```bash
npm run build
# Output → dist/   (this is what gets deployed)
```

## Preview built site locally

```bash
npm run preview
```

---

## Editing business content

All editable business details live in **one file**:

```
src/data/site.ts
```

Search for `[Confirm ...]` or `[Insert ...]` to find anything still needing real information.

See `TODO-confirmations.md` for the full checklist.

## Adding images

Drop image files into `public/assets/` — exact filenames are listed in:

```
public/assets/ASSET-MANIFEST.md
```

---

## Deployment

### Plesk (production)

Plesk pulls from GitHub and runs `bash deploy/plesk-deploy.sh` automatically.

Full setup guide: **[docs/DEPLOY-PLESK.md](docs/DEPLOY-PLESK.md)**

Quick reference:
- Repo: `https://github.com/bitscon/saltydawg`
- Branch: `main`
- App root in Plesk: `httpdocs`
- Document root: `httpdocs/dist`
- Deploy command: `bash deploy/plesk-deploy.sh`

### Barn server / nginx (dev — `dev.saltydawg2.net`)

See **[docs/DEPLOY-NGINX.md](docs/DEPLOY-NGINX.md)** for the nginx dev setup.

---

## File structure

```
saltydawg/
├── src/
│   ├── data/site.ts              ← ALL editable business content
│   ├── components/               ← Header, Hero, TripCards, Gallery, etc.
│   ├── layouts/Layout.astro      ← HTML wrapper + GSAP animations
│   ├── pages/index.astro         ← Assembles all components
│   └── styles/global.css         ← Brand CSS + Tailwind
├── public/assets/                ← Drop images here
│   └── ASSET-MANIFEST.md         ← Which images go where
├── deploy/
│   └── plesk-deploy.sh           ← Plesk build + deploy script
├── docs/
│   ├── DEPLOY-PLESK.md           ← Plesk setup guide
│   └── DEPLOY-NGINX.md           ← nginx dev setup guide
├── TODO-confirmations.md         ← Owner action items before launch
└── README.md
```
