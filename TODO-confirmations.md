# Salty Dawg II — Owner Confirmations Required

Every item below is a placeholder that needs real information from the owner before launch.
All are marked `[Confirm ...]` or `[Insert ...]` throughout the site and in `src/data/site.ts`.

## Business Basics

- [ ] **Phone number** — Replace `[Insert Phone Number]` in `site.ts` → `phone` and `phoneHref`
- [ ] **Booking URL** — Replace `[Insert Booking Link]` in `site.ts` → `bookingUrl` (FareHarbor, SquareSpace, Google Form, etc.)
- [ ] **Launch dock / location** — Replace `[Confirm Launch Location]` → `launchDock`
- [ ] **Instagram URL** — Replace `#` in `site.ts` → `instagramUrl`
- [ ] **TikTok URL** — Replace `#` in `site.ts` → `tiktokUrl`

## Trip Pricing

- [ ] **Striper Trip price** — Replace `[Confirm Price]` in `trips[0].price`
- [ ] **Night Striper price** — Replace `[Confirm Price]` in `trips[1].price`
- [ ] **Sunset / Booze Cruise price** — Replace `[Confirm Price]` in `trips[2].price`
- [ ] **Private Charter price** — Replace `[Confirm Price]` in `trips[3].price`

## Policies

- [ ] **Max guests per trip** — FAQ answer for "How many people can come?"
- [ ] **Age policy / kids welcome?** — FAQ answer for "Can kids come?"
- [ ] **Gear / bait / tackle included?** — What's Included section + FAQ
- [ ] **Fishing license required?** — FAQ + What's Included
- [ ] **Catch & keep policy** — FAQ answer
- [ ] **Alcohol policy** — confirmed on booze cruise; need to clarify for fishing trips
- [ ] **Weather / cancellation policy** — FAQ answer for "What happens if weather is bad?"
- [ ] **Deposit required?** — FAQ answer

## Licensing & Credentials

- [ ] **USCG license / insurance status** — Referenced in AboutCaptain and FooterCTA as `[Confirm License / Insurance]`
- [ ] **Any certifications or credentials** the captain wants to highlight

## Testimonials

- [ ] **Real customer reviews** — Testimonials section has placeholder cards only.
  Replace placeholder text in `src/components/Testimonials.astro` with real review text.
  Suggested sources: Facebook group, Google reviews, text messages with permission.

## Assets

- [ ] Copy images from `saltydawg.zip` → `public/assets/` per `ASSET-MANIFEST.md`
- [ ] Provide transparent-background logo PNG if available (better at small sizes in header)
- [ ] `og-image.jpg` for social sharing previews

## Nice-to-haves (post-launch)

- [ ] Google Analytics / Meta Pixel ID
- [ ] Google Business Profile link
- [ ] Online booking integration (FareHarbor, Checkfront, etc.)
- [ ] Real crew/captain name for About section (currently generic)
