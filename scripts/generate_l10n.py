#!/usr/bin/env python3
"""Generate translated strings_*.dart files from strings_en.dart using Gemini.

Usage
-----
From the project root (with a virtualenv optional):

    python scripts/generate_l10n.py

Single locale:

    python scripts/generate_l10n.py --locale de

Regenerate even when cache hits:

    python scripts/generate_l10n.py --force

Bootstrap from prior Google-translate cache (no API; interim only):

    python scripts/generate_l10n.py --seed-from-legacy --cache-only

Full AI retranslation (requires Gemini quota or deployed ai-proxy):

    python scripts/generate_l10n.py --force

Environment (read from process env or project ``.env``)
-------------------------------------------------------
GEMINI_API_KEY
    Required for direct Gemini calls (same key as the Flutter app dev setup).

GEMINI_MODEL
    Optional. Default: ``gemini-3-flash-preview`` (matches [AiService.defaultModelId]).

GEMINI_FALLBACK_MODEL
    Optional. Default: ``gemini-2.0-flash`` (used on model-unavailable errors).

AI_BACKEND_PROXY_URL
    Optional — preferred when set (uses ai-proxy ``/generate-json-prompt``, no app
    usage quota). Pass ``--direct`` to force GEMINI_API_KEY instead.

AI_BACKEND_PROXY_BEARER / SUPABASE_ANON_KEY
    Auth headers for the proxy (anon key required for Supabase edge functions).

Notes
-----
- ``strings_tr.dart`` is never overwritten (hand-maintained Turkish).
- Translations are cached in ``scripts/.l10n_ai_cache.json`` (ai::locale::source text).
- UI strings for locales other than EN/TR are AI-generated; review critical copy.
- Expect Gemini quota/rate limits on full runs (~23 locales × batched calls).
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "core" / "l10n"
CACHE_PATH = ROOT / "scripts" / ".l10n_ai_cache.json"
LEGACY_CACHE_PATH = ROOT / "scripts" / ".l10n_cache.json"
CACHE_PREFIX = "ai"
ENV_PATH = ROOT / ".env"

DEFAULT_MODEL = "gemini-3-flash-preview"
FALLBACK_MODEL = "gemini-2.0-flash"
BATCH_SIZE = 20
REQUEST_TIMEOUT_SEC = 120
MAX_ATTEMPTS = 3

TARGET_LOCALES: dict[str, str] = {
    "es": "Spanish",
    "de": "German",
    "fr": "French",
    "pt": "Portuguese",
    "it": "Italian",
    "nl": "Dutch",
    "pl": "Polish",
    "ru": "Russian",
    "ja": "Japanese",
    "ko": "Korean",
    "zh": "Simplified Chinese",
    "hi": "Hindi",
    "id": "Indonesian",
    "vi": "Vietnamese",
    "ar": "Arabic",
    "uk": "Ukrainian",
    "cs": "Czech",
    "ro": "Romanian",
    "sv": "Swedish",
    "da": "Danish",
    "fi": "Finnish",
    "el": "Greek",
    "hu": "Hungarian",
    "ms": "Malay",
    "th": "Thai",
}

SKIP_EXACT = {
    "CyberChef",
    "OCR",
    "AI",
    "JSON",
    "AdMob",
    "Open Food Facts",
    "EAN",
    "TRY",
    "Pro",
    "Neon",
    "Ocean",
    "Ember",
    "Lavender",
    "Daylight",
    "Cream",
}

DO_NOT_TRANSLATE_IN_TEXT = (
    "CyberChef",
    "OCR",
    "JSON",
    "AdMob",
    "Open Food Facts",
    "EAN",
    "TRY",
)

STRING_LITERAL = re.compile(
    r"(?P<quote>['\"])(?P<text>(?:\\.|(?!(?P=quote)).)*)(?P=quote)",
    re.DOTALL,
)

PLACEHOLDER_RE = re.compile(
    r"\$(?:count|name|version|kg|amount|minutes|seconds|names|extra|code|date)\b"
)


def load_dotenv() -> None:
    if not ENV_PATH.exists():
        return
    for raw in ENV_PATH.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, _, value = line.partition("=")
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        os.environ.setdefault(key, value)


def load_cache() -> dict[str, str]:
    if CACHE_PATH.exists():
        return json.loads(CACHE_PATH.read_text(encoding="utf-8"))
    return {}


def save_cache(cache: dict[str, str]) -> None:
    CACHE_PATH.write_text(
        json.dumps(cache, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )


def seed_from_legacy(cache: dict[str, str]) -> int:
    """Import prior ``.l10n_cache.json`` entries into the AI cache (no API calls)."""
    if not LEGACY_CACHE_PATH.exists():
        return 0
    legacy = json.loads(LEGACY_CACHE_PATH.read_text(encoding="utf-8"))
    added = 0
    for key, value in legacy.items():
        if "::" not in key:
            continue
        loc_part, text = key.split("::", 1)
        if loc_part == "zh-CN":
            code = "zh"
        elif loc_part in TARGET_LOCALES:
            code = loc_part
        else:
            continue
        ai_key = f"{CACHE_PREFIX}::{code}::{text}"
        if ai_key not in cache:
            cache[ai_key] = value
            added += 1
    return added


def should_skip(text: str) -> bool:
    stripped = text.strip()
    if not stripped:
        return True
    if stripped in SKIP_EXACT:
        return True
    if stripped.startswith("CyberChef"):
        return True
    return False


def extract_placeholders(text: str) -> list[str]:
    return PLACEHOLDER_RE.findall(text)


def placeholders_ok(source: str, translated: str) -> bool:
    return extract_placeholders(source) == extract_placeholders(translated)


def class_name(code: str) -> str:
    if code == "zh":
        return "StringsZh"
    return f"Strings{code[0].upper()}{code[1:]}"


class AiBackend:
    """Direct Gemini API or Supabase ai-proxy."""

    def __init__(
        self,
        *,
        api_key: str | None = None,
        proxy_url: str | None = None,
        proxy_bearer: str | None = None,
        supabase_anon_key: str | None = None,
    ) -> None:
        self.api_key = (api_key or "").strip() or None
        self.proxy_url = (proxy_url or "").strip().rstrip("/") or None
        self.proxy_bearer = (proxy_bearer or "").strip() or None
        self.supabase_anon_key = (supabase_anon_key or "").strip() or None
        self._direct_api_key = self.api_key
        self._proxy_fallback_logged = False
        if not self.api_key and not self.proxy_url:
            raise ValueError("GEMINI_API_KEY or AI_BACKEND_PROXY_URL required")

    @property
    def uses_proxy(self) -> bool:
        return self.proxy_url is not None and self.api_key is None

    def generate(
        self,
        *,
        model: str,
        prompt: str,
        temperature: float = 0.1,
    ) -> str:
        if self.proxy_url:
            try:
                return self._generate_via_proxy(
                    model=model,
                    prompt=prompt,
                    temperature=temperature,
                )
            except urllib.error.HTTPError as e:
                if e.code == 404 and self._direct_api_key:
                    if not self._proxy_fallback_logged:
                        print(
                            "  ai-proxy /generate-json-prompt not deployed; "
                            "using direct Gemini API…",
                            file=sys.stderr,
                        )
                        self._proxy_fallback_logged = True
                elif self._direct_api_key:
                    if not self._proxy_fallback_logged:
                        print(
                            f"  proxy HTTP {e.code}; using direct Gemini API…",
                            file=sys.stderr,
                        )
                        self._proxy_fallback_logged = True
                else:
                    raise
            except RuntimeError as e:
                if self._direct_api_key:
                    if not self._proxy_fallback_logged:
                        print(
                            f"  proxy error ({e}); using direct Gemini API…",
                            file=sys.stderr,
                        )
                        self._proxy_fallback_logged = True
                else:
                    raise
        if self._direct_api_key:
            return self._generate_direct(
                api_key=self._direct_api_key,
                model=model,
                prompt=prompt,
                temperature=temperature,
            )
        raise RuntimeError("No Gemini backend available")

    @staticmethod
    def _extract_gemini_text(payload: dict) -> str:
        candidates = payload.get("candidates") or []
        if not candidates:
            raise RuntimeError(f"Gemini empty response: {payload!r}")
        parts = (candidates[0].get("content") or {}).get("parts") or []
        text = "".join(
            p.get("text", "") for p in parts if isinstance(p.get("text"), str)
        ).strip()
        if not text:
            raise RuntimeError("Gemini returned no text")
        return text

    @staticmethod
    def _generate_direct(
        *,
        api_key: str,
        model: str,
        prompt: str,
        temperature: float,
    ) -> str:
        url = (
            f"https://generativelanguage.googleapis.com/v1beta/models/"
            f"{model}:generateContent?key={api_key}"
        )
        body = {
            "contents": [{"parts": [{"text": prompt}]}],
            "generationConfig": {
                "responseMimeType": "application/json",
                "temperature": temperature,
            },
        }
        req = urllib.request.Request(
            url,
            data=json.dumps(body).encode("utf-8"),
            headers={"Content-Type": "application/json"},
            method="POST",
        )
        with urllib.request.urlopen(req, timeout=REQUEST_TIMEOUT_SEC) as resp:
            payload = json.loads(resp.read().decode("utf-8"))
        return AiBackend._extract_gemini_text(payload)

    def _generate_via_proxy(
        self,
        *,
        model: str,
        prompt: str,
        temperature: float,
    ) -> str:
        assert self.proxy_url
        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json",
        }
        if self.supabase_anon_key:
            headers["apikey"] = self.supabase_anon_key
            if not self.proxy_bearer:
                headers["Authorization"] = f"Bearer {self.supabase_anon_key}"
        if self.proxy_bearer:
            headers["Authorization"] = f"Bearer {self.proxy_bearer}"

        body = {
            "_route": "/generate-json-prompt",
            "prompt": prompt,
            "model": model,
            "temperature": temperature,
        }
        req = urllib.request.Request(
            self.proxy_url,
            data=json.dumps(body).encode("utf-8"),
            headers=headers,
            method="POST",
        )
        with urllib.request.urlopen(req, timeout=REQUEST_TIMEOUT_SEC) as resp:
            payload = json.loads(resp.read().decode("utf-8"))

        data = payload.get("data")
        if isinstance(data, dict):
            text = data.get("text")
            if isinstance(text, str) and text.strip():
                return text.strip()
            if "candidates" in data:
                return self._extract_gemini_text(data)

        if "candidates" in payload:
            return self._extract_gemini_text(payload)

        error = payload.get("error") or payload.get("message")
        raise RuntimeError(f"Proxy error: {error or payload!r}")


def parse_json_response(raw: str) -> dict:
    text = raw.strip()
    if text.startswith("```"):
        text = re.sub(r"^```(?:json)?\s*", "", text)
        text = re.sub(r"\s*```$", "", text)
    return json.loads(text)


def build_prompt(*, language: str, items: list[dict[str, str]]) -> str:
    glossary = ", ".join(DO_NOT_TRANSLATE_IN_TEXT)
    return f"""You are a mobile app UI localization assistant.
Translate English UI strings into natural {language} for a food/pantry app.

Return ONLY valid JSON with this exact shape:
{{
  "translations": [
    {{"id": "0", "text": "translated string"}},
    ...
  ]
}}

Rules:
- Translate every item to fluent, concise {language} suitable for mobile UI.
- Keep the same "id" for each item; include every id from the input.
- Preserve Dart interpolation placeholders EXACTLY: $count, $name, $version, $kg, $amount, $minutes, $seconds, $names, $extra, $code, $date (including the $ prefix).
- Do not translate or alter these tokens anywhere in the string: {glossary}.
- Keep brand/theme names unchanged when they are product labels: CyberChef, Neon, Ocean, Ember, Lavender, Daylight, Cream, Pro.
- Keep ellipsis (…) and leading/trailing spaces if present in the source.
- Use culturally natural phrasing, not word-for-word English.

INPUT JSON:
{json.dumps({"items": items}, ensure_ascii=False)}
"""


def translate_batch_ai(
    texts: list[str],
    *,
    language: str,
    backend: AiBackend,
    model: str,
    fallback_model: str,
) -> dict[str, str]:
    if len(texts) == 1:
        return _translate_batch_once(
            texts,
            language=language,
            backend=backend,
            model=model,
            fallback_model=fallback_model,
        )
    try:
        return _translate_batch_once(
            texts,
            language=language,
            backend=backend,
            model=model,
            fallback_model=fallback_model,
        )
    except RuntimeError:
        mid = len(texts) // 2
        left = translate_batch_ai(
            texts[:mid],
            language=language,
            backend=backend,
            model=model,
            fallback_model=fallback_model,
        )
        right = translate_batch_ai(
            texts[mid:],
            language=language,
            backend=backend,
            model=model,
            fallback_model=fallback_model,
        )
        return {**left, **right}


def _translate_batch_once(
    texts: list[str],
    *,
    language: str,
    backend: AiBackend,
    model: str,
    fallback_model: str,
) -> dict[str, str]:
    items = [{"id": str(i), "text": t} for i, t in enumerate(texts)]
    prompt = build_prompt(language=language, items=items)
    models = [model]
    if fallback_model and fallback_model != model:
        models.append(fallback_model)

    last_error: Exception | None = None
    for attempt_model in models:
        for attempt in range(MAX_ATTEMPTS):
            try:
                raw = backend.generate(
                    model=attempt_model,
                    prompt=prompt,
                )
                parsed = parse_json_response(raw)
                rows = parsed.get("translations") or parsed.get("items")
                if not isinstance(rows, list):
                    raise ValueError("missing translations array")
                out: dict[str, str] = {}
                for row in rows:
                    idx = int(row["id"])
                    out[texts[idx]] = row["text"]
                if len(out) != len(texts):
                    missing = [t for t in texts if t not in out]
                    raise ValueError(f"missing {len(missing)} translations")
                for src, dst in out.items():
                    if not placeholders_ok(src, dst):
                        raise ValueError(
                            f"placeholder mismatch: {src!r} -> {dst!r}"
                        )
                return out
            except urllib.error.HTTPError as e:
                last_error = e
                if e.code in (429, 503):
                    retry_after = e.headers.get("Retry-After")
                    wait = int(retry_after) if retry_after and retry_after.isdigit() else min(
                        90, 5 * (2**attempt)
                    )
                    print(f"  rate limited ({e.code}), waiting {wait}s…")
                    time.sleep(wait)
                    continue
                if e.code == 404 and attempt_model != models[-1]:
                    break
                raise
            except Exception as e:
                last_error = e
                time.sleep(min(30, 3 * (attempt + 1)))
        if last_error and attempt_model != models[-1]:
            print(f"  retrying with fallback model {fallback_model}…")
            continue
    raise RuntimeError(f"Gemini translation failed: {last_error}") from last_error


def translate_unique(
    texts: list[str],
    *,
    locale_code: str,
    language: str,
    cache: dict[str, str],
    backend: AiBackend,
    model: str,
    fallback_model: str,
    force: bool,
    cache_only: bool = False,
) -> dict[str, str]:
    out: dict[str, str] = {}
    pending: list[str] = []

    def cache_key(text: str) -> str:
        return f"{CACHE_PREFIX}::{locale_code}::{text}"

    for text in texts:
        key = cache_key(text)
        if not force and key in cache:
            out[text] = cache[key]
        elif should_skip(text):
            out[text] = text
            cache[key] = text
        else:
            pending.append(text)

    total_batches = (len(pending) + BATCH_SIZE - 1) // BATCH_SIZE or 0
    if cache_only:
        for src in pending:
            out[src] = src
            cache[cache_key(src)] = src
        save_cache(cache)
        return out

    for i in range(0, len(pending), BATCH_SIZE):
        chunk = pending[i : i + BATCH_SIZE]
        batch_no = i // BATCH_SIZE + 1
        print(f"  AI batch {batch_no}/{total_batches} ({len(chunk)} strings)", flush=True)
        try:
            translated = translate_batch_ai(
                chunk,
                language=language,
                backend=backend,
                model=model,
                fallback_model=fallback_model,
            )
        except RuntimeError as e:
            print(f"  WARNING: AI batch failed ({e}); keeping English for this batch.")
            translated = {src: src for src in chunk}
        for src, dst in translated.items():
            key = cache_key(src)
            value = dst if dst else src
            out[src] = value
            cache[key] = value
        save_cache(cache)
        time.sleep(1.2)

    return out


def translate_file(
    source: str,
    code: str,
    language: str,
    cache: dict[str, str],
    *,
    backend: AiBackend,
    model: str,
    fallback_model: str,
    force: bool,
    cache_only: bool = False,
) -> str:
    cls = class_name(code)
    out = source.replace("class StringsEn", f"class {cls}")
    out = out.replace("StringsEn()", f"{cls}()")

    unique = list({m.group("text") for m in STRING_LITERAL.finditer(source)})
    mapping = translate_unique(
        unique,
        locale_code=code,
        language=language,
        cache=cache,
        backend=backend,
        model=model,
        fallback_model=fallback_model,
        force=force,
        cache_only=cache_only,
    )

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

    return STRING_LITERAL.sub(repl, out)


def write_registry() -> None:
    imports = [
        "import '../enums/app_locale.dart';",
        "import 'strings_base.dart';",
        "import 'strings_en.dart';",
        "import 'strings_tr.dart';",
    ]
    cases = [
        "    AppLocale.en => const StringsEn(),",
        "    AppLocale.tr => const StringsTr(),",
    ]
    for code in TARGET_LOCALES:
        cls = class_name(code)
        imports.append(f"import 'strings_{code}.dart';")
        cases.append(f"    AppLocale.{code} => const {cls}(),")

    content = "\n".join(imports) + "\n\n"
    content += "StringsBase stringsForLocale(AppLocale locale) {\n"
    content += "  return switch (locale) {\n"
    content += "\n".join(cases) + "\n"
    content += "  };\n"
    content += "}\n"
    (L10N / "strings_registry.dart").write_text(content, encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate AI-translated l10n Dart files.")
    parser.add_argument(
        "--locale",
        action="append",
        dest="locales",
        metavar="CODE",
        help="Only generate this locale (repeatable). Default: all TARGET_LOCALES.",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Ignore cache and re-translate all strings.",
    )
    parser.add_argument(
        "--direct",
        action="store_true",
        help="Call Gemini REST API directly (default: use AI_BACKEND_PROXY_URL when set).",
    )
    parser.add_argument(
        "--seed-from-legacy",
        action="store_true",
        help="Import scripts/.l10n_cache.json into the AI cache before translating.",
    )
    parser.add_argument(
        "--cache-only",
        action="store_true",
        help="Do not call Gemini; use cache (and English for missing strings).",
    )
    return parser.parse_args()


def main() -> None:
    load_dotenv()
    args = parse_args()

    api_key = os.environ.get("GEMINI_API_KEY", "").strip()
    proxy_url = os.environ.get("AI_BACKEND_PROXY_URL", "").strip()
    proxy_bearer = os.environ.get("AI_BACKEND_PROXY_BEARER", "").strip()
    supabase_anon = os.environ.get("SUPABASE_ANON_KEY", "").strip()

    if not api_key and not proxy_url:
        print(
            "ERROR: set GEMINI_API_KEY or AI_BACKEND_PROXY_URL in environment or .env.",
            file=sys.stderr,
        )
        sys.exit(1)

    use_proxy = bool(proxy_url) and not args.direct

    try:
        backend = AiBackend(
            api_key=api_key or None,
            proxy_url=proxy_url if use_proxy else None,
            proxy_bearer=proxy_bearer or None,
            supabase_anon_key=supabase_anon or None,
        )
    except ValueError as e:
        print(f"ERROR: {e}", file=sys.stderr)
        sys.exit(1)

    model = os.environ.get("GEMINI_MODEL", DEFAULT_MODEL).strip() or DEFAULT_MODEL
    fallback = (
        os.environ.get("GEMINI_FALLBACK_MODEL", FALLBACK_MODEL).strip()
        or FALLBACK_MODEL
    )

    locales = TARGET_LOCALES
    if args.locales:
        unknown = [c for c in args.locales if c not in TARGET_LOCALES]
        if unknown:
            print(f"ERROR: unknown locale(s): {', '.join(unknown)}", file=sys.stderr)
            sys.exit(1)
        locales = {c: TARGET_LOCALES[c] for c in args.locales}

    source = (L10N / "strings_en.dart").read_text(encoding="utf-8")
    cache = load_cache()
    if args.seed_from_legacy:
        added = seed_from_legacy(cache)
        save_cache(cache)
        print(f"Seeded {added} entries from legacy cache into {CACHE_PATH.name}.")

    mode = (
        f"proxy {proxy_url} (direct fallback)"
        if backend.proxy_url and backend.api_key
        else ("direct Gemini API" if backend.api_key else f"proxy {proxy_url}")
    )
    print(f"Using {mode}, model: {model} (fallback: {fallback})")
    for code, language in locales.items():
        print(f"Generating strings_{code}.dart ({language}) …", flush=True)
        translated = translate_file(
            source,
            code,
            language,
            cache,
            backend=backend,
            model=model,
            fallback_model=fallback,
            force=args.force,
            cache_only=args.cache_only,
        )
        (L10N / f"strings_{code}.dart").write_text(translated, encoding="utf-8")
        save_cache(cache)

    write_registry()
    print(f"Done. {len(locales)} locale(s) + strings_registry.dart.")


if __name__ == "__main__":
    main()
