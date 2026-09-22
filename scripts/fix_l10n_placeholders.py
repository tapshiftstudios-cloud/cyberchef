#!/usr/bin/env python3
"""Fix merged Dart interpolation placeholders inside string literals."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "core" / "l10n"

PARAMS = sorted(
    {
        "count",
        "amount",
        "kg",
        "minutes",
        "seconds",
        "days",
        "name",
        "names",
        "critical",
        "warning",
        "remaining",
        "time24",
        "ingredients",
        "recipes",
        "extra",
        "code",
        "date",
        "money",
        "version",
    },
    key=len,
    reverse=True,
)

STRING_LITERAL = re.compile(
    r"(?P<quote>['\"])(?P<text>(?:\\.|(?!(?P=quote)).)*)(?P=quote)",
    re.DOTALL,
)


def fix_literal_text(text: str) -> str:
    protected: list[str] = []

    def protect(token: str) -> str:
        protected.append(token)
        return f"\0P{len(protected) - 1}\0"

    for token in ("$names", "$extra"):
        text = text.replace(token, protect(token))

    for param in PARAMS:
        if param in {"names", "extra"}:
            continue
        text = re.sub(
            rf"\${param}([A-Za-zÀ-ÿĀ-ž])",
            rf"${param} \1",
            text,
        )
    text = re.sub(r"([^\s:])(\$)", r"\1 \2", text)

    for index, token in enumerate(protected):
        text = text.replace(f"\0P{index}\0", token)
    return text


def fix_content(content: str) -> str:
    content = content.replace(
        "String notificationCriticalBody(String $name s, String extra)",
        "String notificationCriticalBody(String names, String extra)",
    )

    def repl(match: re.Match[str]) -> str:
        quote = match.group("quote")
        text = match.group("text")
        fixed = fix_literal_text(text)
        return f"{quote}{fixed}{quote}"

    return STRING_LITERAL.sub(repl, content)


def main() -> None:
    for path in sorted(L10N.glob("strings_*.dart")):
        if path.name in {"strings_en.dart", "strings_tr.dart"}:
            continue
        original = path.read_text(encoding="utf-8")
        fixed = fix_content(original)
        if fixed != original:
            path.write_text(fixed, encoding="utf-8")
            print(f"fixed {path.name}")


if __name__ == "__main__":
    main()
