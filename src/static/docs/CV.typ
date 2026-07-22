#set page(
  paper: "a4",
  margin: (top: 0.5in, bottom: 0.5in, left: 0.6in, right: 0.6in),
)
#set text(font: "Helvetica Neue", size: 9.5pt)
#set par(justify: false, leading: 0.65em)
#set page(numbering: none)
#set list(indent: 10pt, spacing: auto)

#let section(title) = {
  v(14pt)
  text(weight: "bold", size: 11pt, title)
  v(2pt)
  line(length: 100%, stroke: 0.4pt)
  v(4pt)
}

#let entry(left, right) = {
  block(width: 100%, spacing: 0.8em)[#left #h(1fr) #right]
}

// Header
#align(
  center,
)[
  #text(size: 20pt, weight: "bold", tracking: 0.5pt, "Jacob O'Neill")
  #v(4pt)
  #text(
    size: 9.5pt,
  )[
    #link("mailto:jacoboneill2000@outlook.com")[jacoboneill2000\@outlook.com]
    #h(10pt)
    #link("https://jacoboneill.dev")[jacoboneill.dev]
    #h(10pt)
    #link("https://github.com/jacoboneill")[github.com/jacoboneill]
    #h(10pt)
    Warwickshire, UK
  ]
]

// Profile
#section("Profile")
Software engineer with nearly three years experience building production systems across IoT, industrial compliance, and e-learning. Comfortable across the full stack, from embedded firmware to deployment infrastructure. Strongest in TypeScript and Python, building end-to-end from API and database design through to deployment.

// Skills
#section("Skills")
*Languages:* TypeScript, JavaScript, Python, C++\
*Frontend:* React, Preact, Vite\
*Backend:* Node.js, Express, Flask\
*Databases:* PostgreSQL, MongoDB\
*Infrastructure:* Docker, Caddy, GitHub Actions, Linux, Cloudflare (Pages, R2, Workers, DNS), Wrangler\
*E-learning standards:* SCORM 2004, xAPI, cmi5\
*Tools:* Bash, Git, GitHub, OpenAPI\
*Learning:* Go (net/http, HTMX, Templ, SQLC), Terraform, OpenTofu

// Work Experience
#section("Work Experience")

#entry[*Independent Software Contractor* -- O'Neill Technology Solutions][Jan 2025 -- Present]
- Sole developer on an ATEX industrial compliance platform for CGS Engineering (Jan 2025 - Mar 2026). Owned the full lifecycle, from requirements gathering with domain experts through to architecture, implementation, and technical documentation.
- Built and deployed a containerised web application (Flask, React, PostgreSQL, Docker, Caddy) serving multiple client organisations, with role-based access control and white-label theming.
- Sole developer for the curation of e-learning modules building a modern xAPI/cmi5 e-learning framework (TypeScript, Preact, Vite) for Front Foot Creative (Jun 2026 - Present). Using modern e-learning standards to allow for streaming 20GB+ video assets from Cloudflare R2 and deployment straight to Cloudflare Pages via Wrangler and GitHub Actions for CI/CD.
- Onboarding for non-technical clients onto TalentLMS with strict GDPR/DPA compliance and German, Polish, and Romanian localisations.
- Earlier e-learning work: a custom SCORM 2004 content generation framework published as a private npm package (Preact, Vite).
- Incorporated O'Neill Technology Solutions (Jan 2026). Handle client scoping, contract negotiations, and delivery directly.

#entry[*Lead Software Developer* -- Bioscope Technologies][Jan 2022 -- Mar 2023]
- Led fullstack IoT system development from electronic circuit design, ESP32 embedded firmware (C++), Node.js/Express backend APIs, and React frontend dashboard
- Built real-time environmental monitoring with ESP32 sensor nodes polling data via a REST API to a Node.js/Express backend with MongoDB, feeding a live React dashboard via Websockets.
- Automated manual measurement processes with projected savings of £250k-£500k per year per factory.
- Setup and maintained on-premises Debian Linux server for production deployment

#entry[*Service Leader* -- Welcome Break (Costa Coffee)][Aug 2024 -- Dec 2024]
- Team leadership role between technical positions.
- Managed shifts.
- Handled financial processes.
- Improved customer experience.

// Projects
#pagebreak()
#section("Projects")

#entry[*goto* -- Minimal URL shortener written to interface with curl][#link(
  "https://github.com/jacoboneill/goto",
)[github.com/jacoboneill/goto]]
- Terminal-first URL shortener: `curl` to mint a short link, `-L` to follow it, and a `/stats` endpoint returning a plain-text dashboard of 24h and 7-day click counts.
- Go stdlib net/http, SQLite via SQLC, and structured logging with slog
- Multi-stage Dockerfile runs sqlc generation, golangci-lint, and the test suite before compiling a static CGO-free binary into a scratch image.
- 90% test coverage.

#entry[*SecureBin* -- End-to-end encrypted pastebin][#link(
  "https://github.com/jacoboneill/SecureBin",
)[github.com/jacoboneill/SecureBin]]
- Go web service with client-side AES-256-GCM encryption via the Web Crypto API. Server stores only ciphertext, with paste keys in the URL fragment so they never reach the server.
- Built with Go stdlib net/http, Templ for type-safe templating, HTMX v4 for interactivity, SQLite via SQLC for type-safe queries, and golang-migrate for schema migrations.
- Integration-tested with in-memory SQLite via a shared testutil helper; multi-stage Dockerfile; CI via GitHub Actions; architecture documented with Mermaid sequence diagrams and ERD.

#entry[*Backpack Trading* -- Stock portfolio optimiser][#link(
  "https://github.com/jacoboneill/backpack-trading",
)[github.com/jacoboneill/backpack-trading]]
- CS50x final project (self-designed): historical NASDAQ data scraper feeding a knapsack-algorithm-based portfolio simulator with data visualisation.
- Built in Python with object-oriented design and supports swapping between different trading algorithms using the adapter design pattern.

#entry[*pico-bios-kbd* -- USB HID keyboard for headless servers][#link(
  "https://github.com/jacoboneill/pico-bios-kbd",
)[github.com/jacoboneill/pico-bios-kbd]]
- Four-button USB HID keyboard built on a Raspberry Pi Pico for headless BIOS navigation.
- Embedded development demonstrating microcontroller programming and USB protocol handling.

#entry[*Music Education Platform* -- University final project][]
- Identified a market gap in UK music education (engineering students need musicians, student musicians need engineers for high quality recordings) and validated the concept through stakeholder interviews across Manchester music education institutions (Spirit Studios, Royal Northern College of Music, BIMM).
- Built a landing portal with analytics integration (HTML, CSS, JavaScript) secured institutional interest from Spirit Studios and the Royal Northern College of Music.

#entry[*Homelab* -- Self-hosted infrastructure][]
- ThinkCentre M920Q running Debian with Docker Compose for service orchestration, Caddy as reverse proxy, Tailscale for off-LAN networking, and a suite of self-hosted services including media, and monitoring. A practical playground for infrastructure and deployment workflows that feed back into client work..

// Education
#section("Education")
#entry[*Harvard (online via edX)* -- CS50x: Introduction to Computer Science][Nov 2024]
#entry[*University of Central Lancashire* -- BSc (Hons) Live Audio Engineering and Music Production (First Class)][June 2023]
