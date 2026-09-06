# Agent guidance

## Project purpose

This repository is a version-controlled professional resume built with RenderCV. The resume is authored as YAML, rendered through the locked `uv` environment, and reviewed in several portable formats.

## Sources and generated contract

The canonical input files are:

- `cv.yaml` — sanitized public resume content: experience, skills, projects,
  education, and public contact details.
- `.env.example` — blank template for optional local private contact input.
- `design.yaml` — RenderCV theme, typography, colors, spacing, and layout.
- `locale.yaml` — locale and display text catalog.
- `settings.yaml` — render paths and other RenderCV settings.

Edit those YAML sources for resume changes. `make render` renders local phone-free
outputs into ignored `resume/`. `make private` reads optional `RESUME_PHONE` from
ignored `.env`, creates a temporary source, and renders local outputs without
changing `cv.yaml`. `make public` always uses `cv.yaml`, writes sanitized
deployment files into `public/`, and runs `scripts/check_public.py`; the Pages
workflow uploads that directory. The gate rejects a `phone` key in `cv.yaml` or
phone and telephone markers in public files. Never commit `.env`, private contact
data, or generated outputs that contain it.

Treat files in `resume/` and `public/` as generated artifacts: do not hand-edit
them. The GitHub Actions job rebuilds public artifacts from the sanitized source.

## Commands and workflow

Use the repository's existing Makefile and locked environment:

```bash
uv sync                 # install/synchronize the locked environment
make setup              # same environment setup through the Makefile
make render             # render phone-free local outputs into resume/
make private            # render local outputs with optional .env phone
make public             # render sanitized deployable outputs into public/
make watch              # continuously render while editing YAML
make pdf                # render only the local PDF
make preview            # render PNG preview(s)
make check              # verify inputs and perform a quiet complete render
make rebuild            # clean then render everything locally
make doctor             # show uv/RenderCV versions and active paths
```

The Makefile defaults to `cv.yaml`, `design.yaml`, `locale.yaml`, `settings.yaml`,
and `resume/`; preserve those defaults unless a task explicitly requires an
override. Python is required at `>=3.14`, and dependency changes must update both
`pyproject.toml` and `uv.lock` through `uv`.

## Resume-change verification

After changing a source YAML file, run `make check` (or `make render` when visual output needs review), inspect the resulting PDF and PNG for page breaks, layout, readable text, and unintended content changes, and review the complete generated diff. Keep public outputs sanitized; run `make public` before publication. For a source-only documentation or configuration change that cannot affect rendering, use the narrowest applicable check and explain why a full render was unnecessary.

## CI/CD and GitHub Pages

The Pages workflow in `.github/workflows/pages.yml` is the deployment source of truth. It uses Python 3.14, `uv sync --locked`, and the locked toolchain to render the sanitized `public/` directory. `make public` generates `public/index.html` as an exact copy of `public/resume.html`, so the Pages root URL displays the resume directly; the same files remain available at `/resume.html`, `/resume.pdf`, `/resume.png`, `/resume.md`, and `/resume.typ`. Pull requests build and validate the site without deploying; pushes to the main branch configure, upload, and deploy the Pages artifact. Keep the workflow's least-privilege permissions, concurrency protection, and pinned official actions intact when modifying it.

## File ownership and cleanliness

Keep changes scoped to the requested files and preserve existing conventions. Source edits own the YAML inputs; generated-output changes should be the deterministic result of a render; workflow edits belong in `.github/workflows/pages.yml`; repository-agent guidance belongs here. Never overwrite another agent's work, commit secrets or credentials, or add unrelated dependencies. Before handing off, inspect the diff for accidental generated files, local environment data, private contact values, and unrelated edits.

## Skills to load before changing this repository

| Task | Relevant skill(s) |
| --- | --- |
| RenderCV resume content, design, locale, or output behavior | `rendercv`; `python-packaging` when changing Python project metadata or dependencies |
| Python dependency or `uv` packaging changes | `python-packaging`; `uv-package-manager` |
| GitHub Actions workflow or Pages deployment | `github-actions-templates`; `deployment-pipeline-design` |
| Git history, branches, generated-file cutovers, or GitHub Pages repository operations | `git-advanced-workflows`; `gitops-workflow` where deployment configuration is involved |
| Editing `AGENTS.md` or other agent-facing guidance | `writing-for-agents` |
| Reviewing workflow permissions, dependency provenance, secrets, or publication risk | `security-reviewer` |

Load the relevant skill before making the corresponding change, then follow the verification expectations above rather than inventing a second build process.
