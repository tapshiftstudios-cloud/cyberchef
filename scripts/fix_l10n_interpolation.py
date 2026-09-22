"""Fix broken Dart interpolations in generated strings_*.dart files."""
from __future__ import annotations

import re
from pathlib import Path

L10N = Path(__file__).resolve().parent.parent / "lib" / "core" / "l10n"
EN = (L10N / "strings_en.dart").read_text(encoding="utf-8")


def extract_methods(source: str) -> dict[str, str]:
    methods: dict[str, str] = {}
    for m in re.finditer(
        r"String\s+(?:get\s+(\w+)|(\w+)\([^)]*\))\s*=>\s*(.+?);",
        source,
        re.DOTALL,
    ):
        name = m.group(1) or m.group(2)
        methods[name] = m.group(3).strip()
    return methods


def fix_interpolation(en_body: str, loc_body: str) -> str:
    loc_body = loc_body.replace("\\n", "\n")

    brace_expected = re.findall(r"\$\{([^}]+)\}", en_body)
    if brace_expected:
        parts = re.split(r"\$\{[^}]+\}", loc_body)
        if len(parts) == len(brace_expected) + 1:
            rebuilt: list[str] = []
            for i, part in enumerate(parts):
                rebuilt.append(part)
                if i < len(brace_expected):
                    rebuilt.append("${" + brace_expected[i] + "}")
            loc_body = "".join(rebuilt)

    dollar_expected = re.findall(r"\$\w+", en_body)
    if dollar_expected:
        out: list[str] = []
        i = 0
        var_i = 0
        while i < len(loc_body):
            if loc_body[i] == "$" and i + 1 < len(loc_body) and loc_body[i + 1] != "{":
                if var_i < len(dollar_expected):
                    out.append(dollar_expected[var_i])
                    var_i += 1
                    i += 1
                    while i < len(loc_body) and (loc_body[i].isalnum() or loc_body[i] == "_"):
                        i += 1
                    continue
            out.append(loc_body[i])
            i += 1
        loc_body = "".join(out)

    return loc_body


def fix_file(path: Path, en_methods: dict[str, str]) -> bool:
    text = path.read_text(encoding="utf-8")
    original = text

    for name, en_body in en_methods.items():
        if "$" not in en_body:
            continue
        pattern = re.compile(
            rf"(String\s+(?:get\s+{re.escape(name)}|{re.escape(name)}\([^)]*\))\s*=>\s*)(.+?);",
            re.DOTALL,
        )
        match = pattern.search(text)
        if not match:
            continue
        loc_body = match.group(2).strip()
        fixed_body = fix_interpolation(en_body, loc_body)
        if fixed_body != loc_body:
            text = text[: match.start(2)] + fixed_body + text[match.end(2) :]

    if text != original:
        path.write_text(text, encoding="utf-8")
        return True
    return False


def main() -> None:
    en_methods = extract_methods(EN)
    changed = 0
    for path in sorted(L10N.glob("strings_*.dart")):
        if path.name in {"strings_en.dart", "strings_base.dart"}:
            continue
        if fix_file(path, en_methods):
            print(f"fixed {path.name}")
            changed += 1
    print(f"done ({changed} files)")


if __name__ == "__main__":
    main()
