// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Jaydeep Solanki",
  title: "Jaydeep Solanki - CV",
  footer: context { [#emph[Jaydeep Solanki — #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Oct 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "a4",
  page-top-margin: 0.4in,
  page-bottom-margin: 0.35in,
  page-left-margin: 0.5in,
  page-right-margin: 0.5in,
  page-show-footer: false,
  page-show-top-note: false,
  colors-body: rgb(26, 26, 28),
  colors-name: rgb(14, 42, 74),
  colors-headline: rgb(60, 64, 72),
  colors-connections: rgb(80, 84, 92),
  colors-section-titles: rgb(14, 42, 74),
  colors-links: rgb(31, 84, 140),
  colors-footer: rgb(130, 130, 135),
  colors-top-note: rgb(130, 130, 135),
  typography-line-spacing: 0.66em,
  typography-alignment: "left",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
  typography-font-size-body: 9.2pt,
  typography-font-size-name: 23pt,
  typography-font-size-headline: 10.4pt,
  typography-font-size-connections: 9pt,
  typography-font-size-section-titles: 1.2em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: true,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: left,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.22cm,
  header-space-below-headline: 0.16cm,
  header-space-below-connections: 0.28cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "·",
  header-connections-space-between-connections: 0.35cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.24cm,
  section-titles-space-below: 0.16cm,
  sections-allow-page-break: false,
  sections-space-between-text-based-entries: 0.1cm,
  sections-space-between-regular-entries: 0.22cm,
  entries-date-and-location-width: 4.1cm,
  entries-side-space: 0cm,
  entries-space-between-columns: 0.15cm,
  entries-allow-page-break: false,
  entries-short-second-row: false,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0.04cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "◦" ,
  entries-highlights-space-left: 0.05cm,
  entries-highlights-space-above: 0.08cm,
  entries-highlights-space-between-items: 0.07cm,
  entries-highlights-space-between-bullet-and-text: 0.45em,
  date: datetime(
    year: 2026,
    month: 10,
    day: 12,
  ),
)


= Jaydeep Solanki

  #headline([AI & Backend Engineer | Python, LLM Systems])

#connections(
  [#connection-with-icon("location-dot")[Bangalore, India]],
  [#link("mailto:contactjaydeepsolanki@gmail.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[contactjaydeepsolanki\@gmail.com]]],
  [#link("https://jaydeepsolanki.vercel.app/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[jaydeepsolanki.vercel.app]]],
  [#link("https://linkedin.com/in/solanki-jaydeep", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[solanki-jaydeep]]],
  [#link("https://github.com/whoisjayd", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[whoisjayd]]],
)


== Summary

Python engineer focused on LLM-powered tools and the backend systems around them. I build, publish and maintain my own software: two packages on PyPI, an IoT backend, and flight and vision software for national and international robotics competitions.

== Projects

#regular-entry(
  [
    #strong[NoteWise: LLM study-notes CLI]

  ],
  [
    #link("https://github.com/whoisjayd/notewise")[GitHub] | #link("https://notewise.click/docs")[Docs] | #link("https://pypi.org/project/notewise/")[PyPI]

  ],
  main-column-second-row: [
    - Built and maintain an open-source async Python CLI that turns YouTube lectures and playlists into structured Markdown, HTML, PDF and DOCX notes with quizzes. 16 releases since March 2026 (v1.0 to v1.7), 258 commits, 10 stars and 13 forks.

    - Solved long-input limits by splitting transcripts into 4,000-token chunks with 200-token overlap, then stitching them at heading and code-block boundaries so the output reads as one document.

    - Routes requests across LLM providers (Gemini, Claude, OpenAI, Groq, local Ollama) through LiteLLM, with exponential backoff and jitter, token and cost tracking, and a SQLite cache that skips repeat transcript fetches.

    - Ships like a product: typed codebase, tests with CI and coverage tracking, docs site, standalone installers and a Docker image.

  ],
)

#regular-entry(
  [
    #strong[GitResume: repository-grounded resume assistant]

  ],
  [
    #link("https://jaydeep.is-a.dev/projects/gitresume")[Project page]

  ],
  main-column-second-row: [
    - Built an AI tool that takes a GitHub repository and a job description and produces resume bullets, project summaries and interview questions grounded in the code, without inventing achievements.

    - Used Tree-sitter to extract structure and stack from real code instead of keyword matching; streamed long analyses over WebSockets, added GitHub OAuth for private repos, Redis for session state and swappable model providers.

  ],
)

#regular-entry(
  [
    #strong[BlazeServe: high-throughput HTTP file server]

  ],
  [
    #link("https://github.com/whoisjayd/blazeserve")[GitHub] | #link("https://pypi.org/project/blazeserve/")[PyPI]

  ],
  main-column-second-row: [
    - Built and published a Python HTTP\/1.1 file server that keeps memory flat on multi-GB files: zero-copy sendfile for full downloads, 256 MB sliding-window mmap for range requests and a bounded buffered fallback.

    - Implemented the protocol details instead of skipping them: resumable single and multi-range downloads (RFC 7233), conditional caching with ETag and 304 responses, and per-IP token-bucket rate limiting with 429 responses.

    - Added Prometheus metrics plus built-in doctor and benchmark commands; checked with Ruff, strict mypy and pytest.

  ],
)

== Experience

#regular-entry(
  [
    #strong[Deloitte] · #emph[Engineering Intern, Data & Backend]

  ],
  [
    Jan 2026 – Present

  ],
  main-column-second-row: [
    - Built Python ETL pipelines covering ingestion, transformation and validation during the data engineering phase (Jan-Jun 2026), alongside SQL and analytics training.

    - On-site in Bangalore since July 2026 in a structured backend program focused on Python API development and data services.

  ],
)

#regular-entry(
  [
    #strong[Ellipsis Infotech] · #emph[Project Intern]

  ],
  [
    May 2025 – Jun 2025

  ],
  main-column-second-row: [
    - Co-built an IoT platform in a 2-person team for centralized control of multi-brand AC units, using ESP8266 devices, FastAPI, PostgreSQL, MQTT, WebSockets and a Next.js dashboard.

    - Wrote the async Python backend: device provisioning, JWT\/device auth, MQTT command routing, live state updates, telemetry history.

    - Deployed on Google Cloud Run; hardened device connectivity with MQTT over TLS, reconnect with backoff and OTA updates.

  ],
)

#regular-entry(
  [
    #strong[Team Dyaus, Nirma University] · #emph[Co-Founder & Software Lead]

  ],
  [
    Nov 2022 – Jan 2026

  ],
  main-column-second-row: [
    - Co-founded a student aerospace and robotics team and led its software. Results: 2nd at IN-SPACe CanSat India 2024, 9th internationally at TEKNOFEST 2024, Flipkart GRID 5.0 national finals. Mentored 20+ members whose teams placed 7th globally (1st in Asia) at TEKNOFEST 2025.

    - Built Python ground-station and flight software: live telemetry and command\/control over serial and WebSocket, concurrent sensor workers on a Raspberry Pi, fault detection and black-box logging.

    - Built the vision stack for an autonomous pick-and-place robot: custom YOLO object detection, Intel RealSense depth-based 3D localization and inverse kinematics.

  ],
)

== Skills

#strong[Languages:] Python, SQL, Go (basic), Bash

#strong[LLM & AI:] LiteLLM, multi-provider routing (Gemini, Claude, OpenAI, Groq, Ollama), long-document chunking, token and cost tracking, Tree-sitter code parsing, YOLO object detection

#strong[Backend & Data:] FastAPI, Flask, Django REST Framework, AsyncIO, WebSockets, MQTT, JWT and OAuth, PostgreSQL, Redis, SQLite, MongoDB, ETL pipelines

#strong[Tools:] Git, Docker, Linux, pytest, Ruff, mypy, Prometheus, Grafana, GCP, AWS

== Education

#education-entry(
  [
    #strong[Nirma University] · B.Tech in Electronics and Communication Engineering, Minor in Data Science

  ],
  [
    Aug 2022 – May 2026

  ],
  main-column-second-row: [
    #summary[CGPA: 8.0\/10.0]

  ],
)
