# Contributing

Thanks for helping improve this resume template.

## Before you start

- Read `AGENTS.md` for the source-of-truth and rendering rules.
- Keep personal contact data out of tracked files unless it is intentionally public.
- Prefer focused pull requests that explain the user-facing or build-facing change.

## Local workflow

```bash
make setup
make check
make public
```

Edit the YAML sources, not generated files. The public build is produced from the sanitized `cv.yaml` and must pass `scripts/check_public.py`.

## Pull requests

Include:

- what changed and why;
- screenshots or rendered artifacts when the layout changes;
- the command used to validate the change;
- any privacy implications.

Pull requests build the public site in GitHub Actions. Only pushes to `main` deploy to GitHub Pages.
