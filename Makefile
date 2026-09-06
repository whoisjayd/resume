# ==============================================================================
# Resume build automation
# ==============================================================================

UV          ?= uv
CV          ?= cv.yaml
DESIGN      ?= design.yaml
LOCALE      ?= locale.yaml
SETTINGS    ?= settings.yaml
OUTPUT_DIR  ?= resume

RENDERCV    := $(UV) run rendercv
RENDER_ARGS = $(CV) --design $(DESIGN) --locale-catalog $(LOCALE) \
              --settings $(SETTINGS) --output-folder $(OUTPUT_DIR)

REQUIRED_FILES = $(CV) $(DESIGN) $(LOCALE) $(SETTINGS) pyproject.toml uv.lock

.DEFAULT_GOAL := help
.DELETE_ON_ERROR:
.SUFFIXES:

.PHONY: help setup render private public all watch pdf preview check clean rebuild doctor
.PHONY: verify-inputs prepare-output normalize-png

help:
	@$(UV) run python -c "print('\n'.join(['', '  RESUME TOOLKIT', '  Build and maintain the RenderCV resume from one consistent interface.', '', '  USAGE', '    make <command> [VARIABLE=value]', '', '  DEVELOPMENT', '    setup       Synchronize the Python environment from uv.lock', '    watch       Re-render continuously while editing YAML sources', '    check       Validate sources with a quiet, complete render', '    doctor      Display tool versions and active configuration', '', '  BUILD', '    render      Generate PDF, PNG, HTML, Markdown, and Typst outputs', '    pdf         Generate only resume.pdf', '    preview     Generate only the PNG page preview(s)', '    rebuild     Remove existing artifacts, then generate everything', '', '  MAINTENANCE', '    clean       Remove generated artifacts from the output directory', '    help        Display this command reference (default)', '', '  CONFIGURATION', '    CV=$(CV)', '    DESIGN=$(DESIGN)', '    LOCALE=$(LOCALE)', '    SETTINGS=$(SETTINGS)', '    OUTPUT_DIR=$(OUTPUT_DIR)', '', '  EXAMPLES', '    make render', '    make watch', '    make render CV=alternate-cv.yaml OUTPUT_DIR=build', '']))"

setup: ## Synchronize locked dependencies
	@$(info [setup] Synchronizing the Python environment...)
	@$(UV) sync
	@$(info [done]  Environment is ready.)

render: verify-inputs prepare-output ## Generate every output format
	@$(info [build] Generating all resume formats in "$(OUTPUT_DIR)"...)
	@$(RENDERCV) render $(RENDER_ARGS)
	@$(MAKE) --no-print-directory normalize-png OUTPUT_DIR="$(OUTPUT_DIR)"
	@$(info [done]  Resume artifacts are ready in "$(OUTPUT_DIR)".)

private: ## Render local outputs, optionally including RESUME_PHONE from .env
	@$(UV) run python scripts/build_resume.py

public: override CV := cv.yaml
public: override OUTPUT_DIR := public
public: render ## Generate the sanitized public site in public/
	@$(UV) run python -c "from pathlib import Path; Path('public/index.html').write_text('<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"><title>Resume</title></head><body><p><a href=\"resume.html\">View resume</a></p></body></html>', encoding='utf-8')"
	@$(UV) run python scripts/check_public.py

all: render

watch: verify-inputs ## Re-render continuously while editing
	@$(info [watch] Monitoring resume sources. Press Ctrl+C to stop.)
	@$(RENDERCV) render $(RENDER_ARGS) --watch

pdf: verify-inputs ## Generate only the PDF
	@$(info [build] Generating "$(OUTPUT_DIR)/resume.pdf"...)
	@$(RENDERCV) render $(RENDER_ARGS) --dont-generate-png \
		--dont-generate-html --dont-generate-markdown --dont-generate-typst
	@$(info [done]  PDF is ready.)

preview: verify-inputs prepare-output ## Generate only PNG previews
	@$(info [build] Generating PNG preview(s) in "$(OUTPUT_DIR)"...)
	@$(RENDERCV) render $(RENDER_ARGS) --dont-generate-pdf \
		--dont-generate-html --dont-generate-markdown --dont-generate-typst
	@$(MAKE) --no-print-directory normalize-png OUTPUT_DIR="$(OUTPUT_DIR)"
	@$(info [done]  PNG previews are ready.)

check: verify-inputs prepare-output ## Validate sources through a complete render
	@$(info [check] Validating sources and rendering all formats...)
	@$(RENDERCV) render $(RENDER_ARGS) --quiet
	@$(MAKE) --no-print-directory normalize-png OUTPUT_DIR="$(OUTPUT_DIR)"
	@$(info [done]  Validation passed.)

clean: ## Remove generated artifacts
	@$(info [clean] Removing generated artifacts from "$(OUTPUT_DIR)"...)
	@$(UV) run python -c "from pathlib import Path; p=Path('$(OUTPUT_DIR)'); [f.unlink() for f in p.iterdir() if f.is_file()] if p.exists() else None"
	@$(info [done]  Output directory is clean.)

rebuild: clean render ## Clean and regenerate every output

doctor: ## Display versions and active configuration
	@$(UV) run python -c "print('[doctor] Toolchain')"
	@$(UV) --version
	@$(RENDERCV) --version
	@$(UV) run python -c "print('\n[doctor] Active configuration\n  CV          = $(CV)\n  DESIGN      = $(DESIGN)\n  LOCALE      = $(LOCALE)\n  SETTINGS    = $(SETTINGS)\n  OUTPUT_DIR  = $(OUTPUT_DIR)')"

verify-inputs:
	@$(UV) run python -c "from pathlib import Path; files='$(REQUIRED_FILES)'.split(); missing=[f for f in files if not Path(f).is_file()]; assert not missing, 'Missing required file(s): '+', '.join(missing)"

prepare-output:
	@$(UV) run python -c "from pathlib import Path; p=Path('$(OUTPUT_DIR)'); p.mkdir(parents=True, exist_ok=True); [f.unlink() for f in p.iterdir() if f.is_file()]"

normalize-png:
	@$(UV) run python -c "from pathlib import Path; p=Path('$(OUTPUT_DIR)'); pages=sorted(p.glob('resume_[0-9]*.png')); target=p/'resume.png'; pages[0].replace(target) if len(pages)==1 else target.unlink(missing_ok=True)"
