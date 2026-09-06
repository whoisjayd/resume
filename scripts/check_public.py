"""Reject phone contact data in the sanitized source and public artifacts."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PUBLIC_SOURCE = ROOT / "cv.yaml"
PUBLIC_OUTPUT = ROOT / "public"
PHONE_KEY = re.compile(rb"(?m)^\s*phone\s*:")
CONTACT_MARKER = re.compile(rb"\bphone\b|(?:^|[^a-z])tel\s*:", re.IGNORECASE)


def main() -> int:
    """Return a failure status when public inputs or outputs contain phone markers."""
    failures: list[str] = []
    source = PUBLIC_SOURCE.read_bytes()
    if PHONE_KEY.search(source):
        failures.append(f"phone key found in {PUBLIC_SOURCE.relative_to(ROOT)}")

    if not PUBLIC_OUTPUT.is_dir():
        failures.append(f"missing {PUBLIC_OUTPUT.relative_to(ROOT)} output directory")
    else:
        for path in sorted(file for file in PUBLIC_OUTPUT.rglob("*") if file.is_file()):
            if CONTACT_MARKER.search(path.read_bytes()):
                failures.append(f"phone marker found in {path.relative_to(ROOT)}")

    if failures:
        print("Public privacy check failed:", file=sys.stderr)
        for failure in failures:
            print(f"- {failure}", file=sys.stderr)
        return 1
    print("Public privacy check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
