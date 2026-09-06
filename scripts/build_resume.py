"""Render local resume outputs without modifying the public source."""

from __future__ import annotations

import json
import os
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PUBLIC_CV = ROOT / "cv.yaml"
OUTPUT_DIR = ROOT / "resume"


def load_dotenv() -> None:
    """Load simple KEY=VALUE entries from the repository's optional .env file."""
    env_path = ROOT / ".env"
    if not env_path.is_file():
        return
    for raw_line in env_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        os.environ.setdefault(key.strip(), value.strip().strip('"').strip("'"))


def main() -> None:
    """Render into the ignored local output directory."""
    load_dotenv()
    phone = os.environ.get("RESUME_PHONE", "")
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    for path in OUTPUT_DIR.iterdir():
        if path.is_file():
            path.unlink()
    with tempfile.TemporaryDirectory() as temp_dir:
        source = Path(temp_dir) / "cv.yaml"
        content = PUBLIC_CV.read_text(encoding="utf-8")
        if phone:
            content = content.replace(
                "  website:", f"  phone: {json.dumps(phone)}\n  website:", 1
            )
        source.write_text(content, encoding="utf-8")
        command = [
            "uv",
            "run",
            "rendercv",
            "render",
            str(source),
            "--design",
            str(ROOT / "design.yaml"),
            "--locale-catalog",
            str(ROOT / "locale.yaml"),
            "--settings",
            str(ROOT / "settings.yaml"),
            "--output-folder",
            str(OUTPUT_DIR),
        ]
        subprocess.run(command, cwd=ROOT, check=True)
    pages = sorted(OUTPUT_DIR.glob("resume_[0-9]*.png"))
    target = OUTPUT_DIR / "resume.png"
    if len(pages) == 1:
        pages[0].replace(target)
    else:
        target.unlink(missing_ok=True)


if __name__ == "__main__":
    main()
