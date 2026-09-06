# Resume

<p align="center">
  <img src="resume/resume.png" alt="CV preview" width="450"/>
</p>

Current positioning: backend, platform, and cloud engineering. Projects on the CV: [NoteWise](https://github.com/whoisjayd/notewise), [BlazeServe](https://github.com/whoisjayd/blazeserve).

The resume is maintained as YAML and rendered with [RenderCV](https://rendercv.com/). Dependencies are locked with `uv`, and the generated files are written to `resume/` as `resume.pdf`, `resume.png`, `resume.html`, `resume.md`, and `resume.typ`. A single-page PNG is named `resume.png`; multi-page previews retain RenderCV's numbered names such as `resume_1.png` and `resume_2.png`.

## Quick start

Requirements:

- [`uv`](https://docs.astral.sh/uv/)
- `make` (GNU Make or a compatible implementation)

```bash
make setup
make render
```

Run `make help` to open the grouped command reference, current configuration, and usage examples. Running `make` without a target shows the same reference.

## Layout

- `cv.yaml` - content: experience, skills, projects, education
- `design.yaml` - `engineeringresumes` theme, colors, fonts, spacing
- `locale.yaml` - English locale catalog
- `settings.yaml` - render settings
- `resume/` - generated PDF, PNG, HTML, Markdown, and Typst files
- `Makefile` - shortcuts for setup, rendering, validation, and cleanup
- `pyproject.toml` and `uv.lock` - Python dependency definition and lockfile

## Commands

| Command        | Description                                            |
| -------------- | ------------------------------------------------------ |
| `make setup`   | Synchronize `.venv` exactly from `uv.lock`.            |
| `make render`  | Generate every supported output format in `resume/`.   |
| `make watch`   | Watch the YAML files and re-render after changes.      |
| `make pdf`     | Generate only the PDF.                                 |
| `make preview` | Generate only PNG page previews.                       |
| `make check`   | Verify required files and complete a quiet render.     |
| `make clean`   | Remove generated files from `resume/`.                 |
| `make rebuild` | Clean and regenerate all outputs.                      |
| `make doctor`  | Show tool versions and the active build configuration. |

`make` with no target displays the help text. Variables can be overridden when needed:

```bash
make render OUTPUT_DIR=build
make render CV=alternate-cv.yaml
```

## Editing workflow

1. Update the resume content in `cv.yaml`.
2. Adjust visual styling in `design.yaml`, translations in `locale.yaml`, or rendering behavior in `settings.yaml`.
3. Run `make watch` while editing for automatic regeneration, or `make render` once after editing.
4. Review the PDF and PNG files in `resume/` before committing generated artifacts.

The equivalent command without Make is:

```bash
uv run rendercv render cv.yaml --design design.yaml --locale-catalog locale.yaml --settings settings.yaml --output-folder resume
```

## Dependency maintenance

The `.venv/` directory is managed by `uv` and ignored by Git. To update RenderCV within the version constraint in `pyproject.toml`, refresh the lockfile and environment:

```bash
uv lock --upgrade-package rendercv
make setup
```
