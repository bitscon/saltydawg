// ============================================================
//  SALTY DAWG II — EDITABLE SITE CONTENT
//  Edit this file to update all business details across the site.
//  Placeholders marked [Confirm ...] need owner verification.
// ============================================================

export const site = {
  name: "Salty Dawg II",
  tagline: "This Is Not Your Average Boat Ride.",
  subtagline: "Stripers, Sunsets & Good Times on the Merrimack.",

  phone: "[Insert Phone Number]",
  phoneHref: "tel:+10000000000", // Update with real number
  bookingUrl: "[Insert Booking Link]",
  facebookUrl: "https://www.facebook.com/groups/1410987557385865",
  instagramUrl: "#", // [Insert Instagram URL]
  tiktokUrl: "#",   // [Insert TikTok URL]

  location: "Merrimack River, NH / MA", // [Confirm Launch Location]
  launchDock: "[Confirm Launch Location / Dock Address]",

  cta: {
    primary: "Call / Text to Book",
    secondary: "View Trips",
  },
};

export const trips = [
  {
    id: "striper-trips",
    title: "Striper Trips",
    emoji: "🎣",
    description:
      "Hit the Merrimack River hard chasing trophy striped bass. Action-packed, nonstop, and built for people who came to fish.",
    bestFor: "Anglers & First-Timers",
    price: "[Confirm Price]",
    cta: "Book This Trip",
    image: "/assets/flyer-monster-catch.jpg",
    imageFallback: "striper",
    highlights: ["Night Stripers Available", "Limits Possible", "Nonstop Action"],
  },
  {
    id: "night-stripers",
    title: "Night Stripers",
    emoji: "🌙",
    description:
      "Leaving at 5 PM, back around 10 PM. The river comes alive after dark — this is where the giants feed. Serious inquiries only.",
    bestFor: "Experienced Anglers",
    price: "[Confirm Price]",
    cta: "Book This Trip",
    image: "/assets/flyer-striper-fishing.jpg",
    imageFallback: "night",
    highlights: ["5 PM Departure", "~10 PM Return", "Good Vibes Guaranteed"],
  },
  {
    id: "sunset-booze-cruise",
    title: "Sunset / Booze Cruise",
    emoji: "🍺",
    description:
      "Ice cold drinks. Music cranked loud. Sunset views turning into party mode. Non-stop laughs with the crew. ALL GAS. NO BRAKES. FULL SEND.",
    bestFor: "Groups & Good Times",
    price: "[Confirm Price]",
    cta: "Book This Trip",
    image: "/assets/flyer-booze-cruise.jpg",
    imageFallback: "sunset",
    highlights: ["6 PM – 9 PM", "Ice Cold Drinks", "Sunset on the Merrimack"],
  },
  {
    id: "private-charter",
    title: "Private Charter",
    emoji: "⚓",
    description:
      "The whole boat is yours. Bachelor parties, birthdays, corporate outings, or just a crew that wants a private Salty Dawg experience.",
    bestFor: "Groups & Private Events",
    price: "[Confirm Price]",
    cta: "Book Private Charter",
    image: "/assets/flyer-captain.jpg",
    imageFallback: "private",
    highlights: ["Exclusive Boat", "Your Crew Only", "Custom Experience"],
  },
];

export const gallery = [
  { src: "/assets/flyer-monster-catch.jpg", alt: "Absolute Monster striper catch on the Merrimack River — Salty Dawg II" },
  { src: "/assets/flyer-booze-cruise.jpg", alt: "Salty Dawg II booze cruise at sunset on the Merrimack River" },
  { src: "/assets/flyer-striper-fishing.jpg", alt: "Salty Dawg II night striper fishing charter" },
  { src: "/assets/flyer-pirate-hanson.jpg", alt: "Pirate Hanson looking for the tuna — Salty Dawg II crew" },
  { src: "/assets/flyer-good-eating.jpg", alt: "Down below good eating — fresh fish from the Salty Dawg II" },
  { src: "/assets/flyer-captain.jpg", alt: "2026 Boat Hair Don't Care — Salty Dawg II captain" },
];

export const included = [
  { icon: "🗺️", label: "Local Water Knowledge", note: "" },
  { icon: "🐟", label: "Striper Action", note: "" },
  { icon: "🌅", label: "Sunset Views", note: "" },
  { icon: "😎", label: "Good Vibes Only", note: "" },
  { icon: "🆕", label: "Beginner Friendly", note: "" },
  { icon: "⚓", label: "Private Trip Option", note: "" },
  { icon: "🎣", label: "Gear / Bait / Tackle", note: "[Confirm Gear Policy]" },
];

export const whatToBring = [
  { icon: "🕶️", item: "Sunglasses" },
  { icon: "🧴", item: "Sunscreen" },
  { icon: "🥤", item: "Drinks & Snacks" },
  { icon: "🧥", item: "Weather-Appropriate Clothes" },
  { icon: "📱", item: "Camera / Phone" },
  { icon: "🎣", item: "Fishing Gear (if required — [Confirm Gear Policy])" },
  { icon: "⚡", item: "Energy. Bring it." },
];

export const faqs = [
  {
    q: "How do I book?",
    a: "Call or text [Insert Phone Number] to check availability and lock in your spot. Limited spots — don't get left at the dock.",
  },
  {
    q: "Where do trips leave from?",
    a: "[Confirm Launch Location / Dock Address] — on the Merrimack River.",
  },
  {
    q: "How many people can come?",
    a: "[Confirm Max Guests] per trip. Private charters fill the whole boat.",
  },
  {
    q: "Do I need fishing experience?",
    a: "Nope. Beginner-friendly all the way. If you're ready to have a good time, you're qualified.",
  },
  {
    q: "Can kids come?",
    a: "[Confirm Age Policy] — ask when you book.",
  },
  {
    q: "Do I need to bring gear?",
    a: "[Confirm Gear Policy] — check with us when booking.",
  },
  {
    q: "Do I need a fishing license?",
    a: "[Confirm License / Insurance Policy]",
  },
  {
    q: "Can we keep fish?",
    a: "[Confirm Catch & Keep Policy]",
  },
  {
    q: "Is alcohol allowed?",
    a: "The booze cruise is literally in the name 🍺. Check with us on policies for fishing trips.",
  },
  {
    q: "What happens if weather is bad?",
    a: "[Confirm Weather Policy] — we'll let you know ASAP if conditions change.",
  },
  {
    q: "Is a deposit required?",
    a: "[Confirm Deposit Policy]",
  },
];
