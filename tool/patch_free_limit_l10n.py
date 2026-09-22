#!/usr/bin/env python3
"""Update hardcoded free-tier limit numbers in ai*DailyLimitReached strings."""
from __future__ import annotations

import re
from pathlib import Path

L10N = Path(__file__).resolve().parent.parent / "lib" / "core" / "l10n"
SKIP = {
    "strings_en.dart",
    "strings_tr.dart",
    "strings_base.dart",
    "strings_registry.dart",
}


def main() -> None:
    for path in sorted(L10N.glob("strings_*.dart")):
        if path.name in SKIP:
            continue
        text = path.read_text(encoding="utf-8")
        text = re.sub(
            r"(String get aiPantryScanDailyLimitReached =>\s*\n\s*'[^']*)\(6\)",
            r"\1(3)",
            text,
        )
        text = re.sub(
            r"(String get aiReceiptDailyLimitReached =>\s*\n\s*'[^']*)\(3\)",
            r"\1(2)",
            text,
        )
        text = re.sub(
            r"(String get aiRecipeDailyLimitReached =>\s*\n\s*'[^']*)\(6\)",
            r"\1(3)",
            text,
        )
        path.write_text(text, encoding="utf-8")
        print(path.name)


if __name__ == "__main__":
    main()
