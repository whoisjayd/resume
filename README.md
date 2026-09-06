# Resume

<p align="center">
  <img src="resume/resume.png" alt="CV preview" width="450"/>
</p>

Current positioning: backend, platform, and cloud engineering. Projects on the CV: [NoteWise](https://github.com/whoisjayd/notewise), [BlazeServe](https://github.com/whoisjayd/blazeserve).

The resume is maintained as YAML and rendered with [RenderCV](https://rendercv.com/). Dependencies are locked with `uv`. Local outputs are written to ignored `resume/`, while the sanitized public build writes all deployable files to `public/`.

## Quick start

Requirements:

- [`uv`](https://docs.astral.sh/uv/)
- `make` (GNU Make or a compatible implementation)

```bash
make setup
make render
```

`make render` creates local outputs from the phone-free `cv.yaml`. Run `make private` after setting `RESUME_PHONE` in `.env` to include a private phone number locally. Run `make public` to render sanitized outputs into `public/`.

Run `make help` to open the grouped command reference, current configuration, and usage examples. Running `make` without a target shows the same reference.

## Continuous integration and deployment

The Pages workflow runs `make public`, which always renders phone-free `cv.yaml` into `public/` and uploads that directory. The deployed site root contains the generated resume formats and an `index.html` link to the HTML resume. Run `make check` locally to validate the selected local source.

- `cv.yaml` - sanitized public content
- `design.yaml` - `engineeringresumes` theme, colors, fonts, and spacing
- `locale.yaml` - English locale catalog
- `settings.yaml` - render settings
- `scripts/build_resume.py` - local renderer using optional `.env` contact data
- `scripts/check_public.py` - deterministic phone-marker gate for public outputs
- `resume/` - ignored local render outputs
- `public/` - tracked sanitized deployment outputs
- `Makefile` - shortcuts for setup, rendering, validation, and cleanup

## Commands

| Command        | Description                                      |
| -------------- | ------------------------------------------------ |
| `make setup`   | Synchronize `.venv` exactly from `uv.lock`       |
| `make render`  | Render local outputs from `cv.yaml`              |
| `make private` | Render local outputs with optional `.env` phone  |
| `make public`  | Render sanitized outputs into `public/`         |
| `make watch`   | Watch YAML files and re-render after changes     |
| `make pdf`     | Generate only the local PDF                      |
| `make preview` | Generate only local PNG previews                 |
| `make check`   | Verify inputs and complete a quiet local render  |
| `make clean`   | Remove generated files from `resume/`            |
| `make rebuild` | Clean and regenerate all local outputs           |
| `make doctor`  | Show tool versions and active build configuration|

`make` with no target displays the help text. Variables can be overridden when needed:

```bash
make render OUTPUT_DIR=build
make render CV=alternate-cv.yaml
```

## Editing workflow

1. Update public resume content in `cv.yaml`.
2. Copy `.env.example` to `.env` and set `RESUME_PHONE` only for a local private render. Keep `.env` untracked; `make private` creates ignored outputs without changing `cv.yaml`.
3. Adjust visual styling in `design.yaml`, translations in `locale.yaml`, or rendering behavior in `settings.yaml`.
4. Run `make render` for sanitized local outputs, `make private` for local phone-inclusive outputs, or `make public` for the deployable sanitized build.
5. Review generated files before sharing them. Never commit `.env`, private contact data, or outputs that contain it.

The equivalent public command without Make is:

```bash
uv run rendercv render cv.yaml --design design.yaml --locale-catalog locale.yaml --settings settings.yaml --output-folder public
```

## Privacy before publishing

The public build intentionally omits `cv.phone` from `cv.yaml`. The public source keeps the listed email, website, LinkedIn, and GitHub links. Local `make private` reads optional `RESUME_PHONE` from ignored `.env`, creates a temporary source, and renders into ignored `resume/`; it never mutates `cv.yaml`. `make public` runs `scripts/check_public.py` after rendering and fails if the source has a phone key or public files contain phone or telephone markers.

`.gitignore` protects only untracked local files. It cannot remove a tracked file or erase data from Git history. Before publishing, search the current tree and all Git refs for phone numbers, secrets, and personally identifiable information (PII). Historical secrets or PII require Git history cleanup before publication; ignore rules alone cannot make them safe.

## Dependency maintenance

The `.venv/` directory is managed by `uv` and ignored by Git. To update RenderCV within the version constraint in `pyproject.toml`, refresh the lockfile and environment:

```bash
uv lock --upgrade-package rendercv
make setup
```
