// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Jaydeep Solanki",
  title: "Jaydeep Solanki - CV",
  footer: context { [#emph[Jaydeep Solanki — #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Sep 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "a4",
  page-top-margin: 0.4in,
  page-bottom-margin: 0.4in,
  page-left-margin: 0.4in,
  page-right-margin: 0.4in,
  page-show-footer: false,
  page-show-top-note: true,
  colors-body: rgb(28, 28, 30),
  colors-name: rgb(20, 52, 84),
  colors-headline: rgb(70, 70, 74),
  colors-connections: rgb(88, 88, 92),
  colors-section-titles: rgb(20, 52, 84),
  colors-links: rgb(20, 52, 84),
  colors-footer: rgb(130, 130, 135),
  colors-top-note: rgb(130, 130, 135),
  typography-line-spacing: 0.74em,
  typography-alignment: "left",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
  typography-font-size-body: 9pt,
  typography-font-size-name: 20pt,
  typography-font-size-headline: 9pt,
  typography-font-size-connections: 9.1pt,
  typography-font-size-section-titles: 1.4em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: true,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: false,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: left,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.3cm,
  header-space-below-headline: 0.18cm,
  header-space-below-connections: 0.34cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "·",
  header-connections-space-between-connections: 0.3cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.42pt,
  section-titles-space-above: 0.34cm,
  section-titles-space-below: 0.18cm,
  sections-allow-page-break: false,
  sections-space-between-text-based-entries: 0.12cm,
  sections-space-between-regular-entries: 0.34cm,
  entries-date-and-location-width: 3.35cm,
  entries-side-space: 0cm,
  entries-space-between-columns: 0.14cm,
  entries-allow-page-break: false,
  entries-short-second-row: false,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0.05cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "◦" ,
  entries-highlights-space-left: 0cm,
  entries-highlights-space-above: 0.09cm,
  entries-highlights-space-between-items: 0.09cm,
  entries-highlights-space-between-bullet-and-text: 0.42em,
  date: datetime(
    year: 2026,
    month: 9,
    day: 6,
  ),
)


= Jaydeep Solanki

  #headline([Software Engineer | Backend, Cloud & DevOps])

#connections(
  [#connection-with-icon("location-dot")[Bangalore, India]],
  [#link("mailto:contactjaydeepsolanki@gmail.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[contactjaydeepsolanki\@gmail.com]]],
  [#link("https://jaydeep.is-a.dev/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[jaydeep.is-a.dev]]],
  [#link("https://linkedin.com/in/solanki-jaydeep", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[solanki-jaydeep]]],
  [#link("https://github.com/whoisjayd", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[whoisjayd]]],
)


== Experience

#regular-entry(
  [
    #strong[Engineering Intern] · #strong[Deloitte] · Bangalore, Karnataka, India

  ],
  [
    Jan 2026 – Present

  ],
  main-column-second-row: [
    - Built Python ETL pipelines for data ingestion, transformation, and validation during the virtual internship phase (Jan-Jun 2026), while training in SQL, data engineering, analytics, and visualization.

    - Moved on-site to Bangalore in July 2026 and currently work through hands-on backend, DevOps, and cloud training covering API development, containers, CI\/CD, deployments, and cloud infrastructure.

  ],
)

#regular-entry(
  [
    #strong[Project Intern] · #strong[Ellipsis Infotech] · Ahmedabad, India

  ],
  [
    May 2025 – Jun 2025

  ],
  main-column-second-row: [
    - Co-developed an IoT platform in a 2-person team for centralized control of multi-brand AC units using ESP8266, FastAPI, PostgreSQL, MQTT, WebSockets, and Next.js.

    - Built the asynchronous Python backend for device provisioning, zone and batch control, JWT\/device authentication, MQTT command routing, live state updates, and telemetry history.

    - Deployed the backend on Google Cloud Run and worked on device reliability through MQTT over TLS, reconnect with backoff, Wi-Fi provisioning, persistent state, OTA firmware updates, and multi-brand IR support.

  ],
)

#regular-entry(
  [
    #strong[Co-Founder & Software Lead] · #strong[Team Dyaus, Nirma University] · Ahmedabad, India

  ],
  [
    Nov 2022 – Jan 2026

  ],
  main-column-second-row: [
    - Co-founded Team Dyaus and led software development and system integration for aerospace and robotics projects across IN-SPACe CanSat India, TEKNOFEST Model Satellite, and Flipkart GRID.

    - Built Python ground-station software for live telemetry, command\/control, serial and WebSocket communication, GPS tracking, sensor plots, 3D attitude visualization, camera feeds, flight-state monitoring, and black-box logging.

    - Developed the Raspberry Pi flight stack around pressure, temperature, orientation, GPS, RTC, and RP2040 subsystems using concurrent sensor workers, Flask APIs, WebSocket services, mission logic, fault detection, data logging, and hardware control.

    - Built the software for an autonomous pick-and-place robot for Flipkart GRID 5.0 using custom YOLO detection, Intel RealSense depth-based 3D localization, inverse kinematics, Arduino motor control, and multithreaded ESP32 camera processing.

    - Helped the team finish 2nd at IN-SPACe CanSat India 2024, 9th internationally at TEKNOFEST 2024, and reach the Flipkart GRID 5.0 national finals; later mentored 20+ members whose teams placed 7th globally (1st in Asia) at TEKNOFEST 2025 and 3rd nationally in Model Rocketry 2025.

  ],
)

== Projects

#regular-entry(
  [
    #strong[NoteWise]

  ],
  [
    #link("https://github.com/whoisjayd/notewise")[GitHub] | #link("https://www.notewise.click/")[Website] | #link("https://pypi.org/project/notewise/")[PyPI]

  ],
  main-column-second-row: [
    - Built and published an async Python CLI that turns YouTube videos, playlists, and courses into structured study notes, quizzes, transcripts, and chapter-aware Markdown, HTML, PDF, and DOCX exports.

    - Designed the concurrent LLM pipeline around LiteLLM with multi-provider routing, rate limiting, retries, smart chunking, token\/cost tracking, and SQLite caching; releases are shipped through PyPI, Docker, automated CI, and cross-platform builds.

  ],
)

#regular-entry(
  [
    #strong[BlazeServe]

  ],
  [
    #link("https://github.com/whoisjayd/blazeserve")[GitHub] | #link("https://pypi.org/project/blazeserve/")[PyPI]

  ],
  main-column-second-row: [
    - Built and published a Python HTTP\/1.1 file server with resumable byte and multi-range downloads, uploads, streaming ZIPs, TLS, authentication, conditional caching, and bandwidth throttling.

    - Optimized file transfers with zero-copy sendfile, windowed mmap fallbacks, socket tuning, and per-IP token-bucket rate limiting; added Prometheus metrics, Kubernetes health probes, Docker\/Kubernetes deployment, and cross-platform CI.

  ],
)

== Skills

#strong[Languages:] Python, SQL, Go (basic), Bash\/Shell

#strong[Backend & Systems:] FastAPI, Flask, Django REST Framework, REST APIs, WebSockets, AsyncIO, MQTT, HTTP\/TCP

#strong[Databases & Caching:] PostgreSQL, Redis, MongoDB, SQLite, MySQL, InfluxDB

#strong[Cloud & DevOps:] AWS, GCP, Docker, Kubernetes, OpenShift, Terraform, Helm, GitHub Actions, CI\/CD, Docker Compose, Linux

#strong[Observability & Testing:] Prometheus, Grafana, pytest, Git

== Education

#education-entry(
  [
    #strong[Nirma University] · B.Tech in Electronics and Communication Engineering · Ahmedabad, Gujarat, India

  ],
  [
    Aug 2022 – May 2026

  ],
  main-column-second-row: [
    #summary[CGPA: 8.0\/10.0 | Minor in Data Science]

  ],
)
