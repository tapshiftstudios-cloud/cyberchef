#!/usr/bin/env python3
"""Regenerate strings_*.dart from strings_en.dart using the AI cache (UTF-8).

Fixes mojibake caused by PowerShell or other tools writing locale files with
the wrong encoding. Does not call any translation API.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "core" / "l10n"
CACHE_PATH = ROOT / "scripts" / ".l10n_ai_cache.json"
CACHE_PREFIX = "ai"

TARGET_LOCALES = (
    "es",
    "de",
    "fr",
    "pt",
    "it",
    "nl",
    "pl",
    "ru",
    "ja",
    "ko",
    "zh",
    "hi",
    "id",
    "vi",
    "ar",
    "uk",
    "cs",
    "ro",
    "sv",
    "da",
    "fi",
    "el",
    "hu",
    "ms",
    "th",
)

STRING_LITERAL = re.compile(
    r"(?P<quote>['\"])(?P<text>(?:\\.|(?!(?P=quote)).)*)(?P=quote)",
    re.DOTALL,
)
PLACEHOLDER_RE = re.compile(r"\$(\w+)")


def class_name(code: str) -> str:
    return f"Strings{code[0].upper()}{code[1:]}"


def escape_dart_string(text: str, quote: str) -> str:
    return (
        text.replace("\\", "\\\\")
        .replace(quote, f"\\{quote}")
        .replace("\n", "\\n")
    )


def normalize_translation(source: str, translated: str) -> str:
    """Fix AI cache strings where words were glued to Dart placeholders."""
    result = translated
    names = sorted(set(PLACEHOLDER_RE.findall(source)), key=len, reverse=True)
    for name in names:
        token = f"${name}"
        for match in re.finditer(re.escape(token), source):
            after = source[match.end() :]
            if after.startswith(" "):
                result = re.sub(
                    rf"\${re.escape(name)}(?=[^\s$\\])",
                    rf"${name} ",
                    result,
                )
        if token in source and " TRY" in source:
            result = re.sub(r"\$amount\s+\S+", "$amount TRY", result)
    return result


def translate_file(source: str, code: str, cache: dict[str, str]) -> str:
    cls = class_name(code)
    out = source.replace("class StringsEn", f"class {cls}")
    out = out.replace("StringsEn()", f"{cls}()")

    def repl(match: re.Match[str]) -> str:
        quote = match.group("quote")
        text = match.group("text")
        key = f"{CACHE_PREFIX}::{code}::{text}"
        translated = normalize_translation(text, cache.get(key, text))
        escaped = escape_dart_string(translated, quote)
        return f"{quote}{escaped}{quote}"

    return STRING_LITERAL.sub(repl, out)


def main() -> None:
    if not CACHE_PATH.exists():
        print(f"ERROR: cache not found: {CACHE_PATH}", file=sys.stderr)
        sys.exit(1)

    source = (L10N / "strings_en.dart").read_text(encoding="utf-8")
    cache = json.loads(CACHE_PATH.read_text(encoding="utf-8"))

    for code in TARGET_LOCALES:
        translated = translate_file(source, code, cache)
        path = L10N / f"strings_{code}.dart"
        path.write_text(translated, encoding="utf-8")
        print(f"Wrote {path.name}")

    print(f"Done. Regenerated {len(TARGET_LOCALES)} locale file(s) from cache.")


if __name__ == "__main__":
    main()
