# Agent guidance

## Project purpose

This repository is a version-controlled professional resume built with RenderCV. The resume is authored as YAML, rendered through the locked `uv` environment, and reviewed in several portable formats.

## Sources and generated contract

The canonical input files are:

- `cv.yaml` — resume content: experience, skills, projects, education, and contact details.
- `design.yaml` — RenderCV theme, typography, colors, spacing, and layout.
- `locale.yaml` — locale and display text catalog.
- `settings.yaml` — render paths and other RenderCV settings.

Edit those YAML sources for resume changes. Treat files in `resume/` as generated artifacts: do not hand-edit them. A normal render produces `resume.html`, `resume.pdf`, `resume.png`, `resume.md`, and `resume.typ` (multi-page previews may also have numbered PNG names before Makefile normalization). These generated artifacts are intentionally tracked locally so the repository has immediately reviewable outputs; the GitHub Actions job rebuilds them from the YAML sources for deployment rather than trusting checked-in binaries.

## Commands and workflow

Use the repository's existing Makefile and locked environment:

```bash
uv sync                 # install/synchronize the locked environment
make setup              # same environment setup through the Makefile
make render             # render all formats into resume/
make watch              # continuously render while editing YAML
make pdf                # render only the PDF
make preview            # render PNG preview(s)
make check              # verify inputs and perform a quiet complete render
make rebuild            # clean then render everything
make doctor             # show uv/RenderCV versions and active paths
```

The Makefile defaults to `cv.yaml`, `design.yaml`, `locale.yaml`, `settings.yaml`, and `resume/`; preserve those defaults unless a task explicitly requires an override. Python is required at `>=3.14`, and dependency changes must update both `pyproject.toml` and `uv.lock` through `uv`.

## Resume-change verification

After changing a source YAML file, run `make check` (or `make render` when visual output needs review), inspect the resulting PDF and PNG for page breaks, layout, readable text, and unintended content changes, and review the complete `resume/` diff. Keep all five required formats synchronized; commit generated updates when the source change intentionally changes them. Do not leave temporary build directories, caches, `.venv` contents, or unrelated formatting churn in the tree. For a source-only documentation or configuration change that cannot affect rendering, use the narrowest applicable check and explain why a full render was unnecessary.

## CI/CD and GitHub Pages

The Pages workflow in `.github/workflows/pages.yml` is the deployment source of truth. It uses Python 3.14, `uv sync --locked`, and the locked toolchain to render into a temporary CI site directory, then writes a root `index.html` that links to the generated files. Pull requests build and validate the site without deploying; pushes to the main branch configure, upload, and deploy the Pages artifact. The artifact layout is deliberate: generated files are published at the site root, so the deployed site exposes direct URLs such as `/resume.html`, `/resume.pdf`, `/resume.png`, `/resume.md`, and `/resume.typ` (with numbered PNG URLs when a render has multiple pages). Keep the workflow's least-privilege permissions, concurrency protection, and pinned official action majors (`actions/checkout@v7`, `astral-sh/setup-uv@v10`, `actions/configure-pages@v5`, `actions/upload-pages-artifact@v5`, and `actions/deploy-pages@v5`) intact when modifying it. Test workflow changes as narrowly as possible and verify that the generated artifact still has the expected root-level paths.

## File ownership and cleanliness

Keep changes scoped to the requested files and preserve existing conventions. Source edits own the YAML inputs; generated-output changes should be the deterministic result of a render; workflow edits belong in `.github/workflows/pages.yml`; repository-agent guidance belongs here. Never overwrite another agent's work, commit secrets or credentials, or add unrelated dependencies. Before handing off, inspect the diff for accidental generated files, local environment data, and unrelated edits.

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
