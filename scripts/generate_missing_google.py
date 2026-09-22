"""Generate missing strings_*.dart via Google Translate (deep-translator)."""
from __future__ import annotations

import re
import time
from pathlib import Path

from deep_translator import GoogleTranslator

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "core" / "l10n"
SOURCE = L10N / "strings_en.dart"

MISSING = ["ms", "th"]

STRING_LITERAL = re.compile(
    r"(?P<quote>['\"])(?P<text>(?:\\.|(?!(?P=quote)).)*)(?P=quote)",
    re.DOTALL,
)
SKIP = {
    "CyberChef", "OCR", "AI", "JSON", "AdMob", "Open Food Facts",
    "EAN", "TRY", "Pro", "Neon", "Ocean", "Ember", "Lavender", "Daylight", "Cream",
}


def class_name(code: str) -> str:
    return f"Strings{code[0].upper()}{code[1:]}"


def main() -> None:
    source = SOURCE.read_text(encoding="utf-8")
    unique = list({m.group("text") for m in STRING_LITERAL.finditer(source)})

    for code in MISSING:
        out_path = L10N / f"strings_{code}.dart"
        if out_path.exists():
            head = out_path.read_text(encoding="utf-8")[:500]
            if "Analyzing pantry" not in head:
                print(f"skip {code} (already translated)")
                continue
            print(f"replacing English stub {code}…")
        else:
            print(f"generating {code}…")
        cls = class_name(code)
        mapping: dict[str, str] = {}
        pending = [
            t for t in unique
            if t.strip() and t not in SKIP and not t.startswith("CyberChef")
        ]
        tr = GoogleTranslator(source="en", target=code)
        for i in range(0, len(pending), 40):
            chunk = pending[i : i + 40]
            try:
                res = tr.translate_batch(chunk)
                for s, d in zip(chunk, res):
                    mapping[s] = d or s
            except Exception as exc:
                print(f"  batch error: {exc}")
                for s in chunk:
                    mapping[s] = s
            time.sleep(0.4)

        for s in unique:
            mapping.setdefault(s, s)

        out = source.replace("class StringsEn", f"class {cls}")
        out = out.replace("StringsEn()", f"{cls}()")

        def repl(match: re.Match[str]) -> str:
            quote = match.group("quote")
            text = match.group("text")
            translated = mapping.get(text, text)
            escaped = (
                translated.replace("\\", "\\\\")
                .replace(quote, f"\\{quote}")
                .replace("\n", "\\n")
            )
            return f"{quote}{escaped}{quote}"

        out_path.write_text(STRING_LITERAL.sub(repl, out), encoding="utf-8")
        print(f"  wrote {out_path.name}")

    print("done")


if __name__ == "__main__":
    main()
