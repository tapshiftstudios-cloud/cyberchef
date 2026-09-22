# CyberChef — Smart Pantry & AI Recipe Architect

Flutter app for **fridge scanning**, **receipt OCR**, **freshness tracking**, and **AI recipes** powered by Google Gemini. Supports **Turkish and English**, **six themes**, and optional **Supabase** sync.

## Features

| Area | What it does |
|------|----------------|
| **Fridge scan** | Camera or gallery → Gemini vision → ingredients + 3 recipes |
| **Scan modes** | Quick Scan (fast meals), Survival (use expiring items), Chef Mode (harder recipes) |
| **Receipt OCR** | Photograph a receipt → line items with expiry estimates; offline queue when offline |
| **Freshness** | Pantry items with urgency, calendar, “cook today”, notifications |
| **Barcode** | Scan product barcode → Open Food Facts lookup → add to pantry |
| **Recipes** | Detail view, nutrition estimate, favorites, share |
| **Shopping list** | Local list synced with pantry workflow |
| **Diet filters** | Vegetarian, vegan, gluten-free, low-carb, etc. applied to AI prompts |
| **Auth (optional)** | Email sign-in/up, guest mode, cloud scan history via Supabase |
| **Home widget** | Android pantry summary (counts from app locale) |
| **Crash reporting** | Optional [Sentry](https://sentry.io) via `SENTRY_DSN` |

### Themes

Six variants in **Settings → Appearance**: Neon, Ocean, Ember, Lavender (dark) and Daylight, Cream (light).

### Localization

- **27 languages** — in-app language switch; strings live under `lib/core/l10n/`.
- **Turkish** (`strings_tr.dart`) is hand-maintained; **English** is the source (`strings_en.dart`).
- Other locales are generated with **Gemini** via `python scripts/generate_l10n.py` (requires `GEMINI_API_KEY` in `.env`). See the script header for options and limits.

## Project layout

```
lib/
├── app_bootstrap.dart          # Shared startup (optional dotenv fallback, locale, theme)
├── main.dart
├── core/
│   ├── crash/                  # Optional Sentry
│   ├── enums/                  # Scan mode, theme, locale, diet
│   ├── l10n/                   # TR / EN strings
│   ├── scan/                   # Mode prompts, recipe post-processing
│   ├── storage/                # SharedPreferences (locale, theme, mode, diet)
│   └── theme/
├── features/
│   ├── app/                    # Splash, launcher, main shell (tabs)
│   ├── auth/                   # Supabase auth gate
│   ├── barcode/
│   ├── camera/                 # Scan UI, modes, receipt capture
│   ├── freshness/
│   ├── favorites/
│   ├── onboarding/
│   ├── pantry/
│   ├── receipt/
│   ├── recipes/
│   ├── settings/
│   └── shopping/
└── services/
    ├── ai_service.dart         # Gemini multimodal + JSON pipeline
    ├── gemini_*_prompt_builder.dart
    ├── gemini_error_mapper.dart
    └── freshness_notification_service.dart, pantry_widget_service.dart

test/                           # Unit & widget tests (see Testing)
docs/                           # Supabase, permissions
supabase/migrations/            # SQL for cloud pantry
```

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.16+** (project tested on Flutter 3.44 / Dart 3.12)
- Android Studio and/or Xcode for device builds
- Physical device recommended for camera and barcode
- **Gemini API key** (required for AI features)
- **Supabase** project (optional — auth + cloud history)
- **Sentry DSN** (optional — crash reports in release)

## Setup

1. Clone or open this folder:

   ```bash
   cd cyberchef_flutter
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

   On Windows, if `flutter` is not in PATH, use the full path to your SDK, for example:

   ```powershell
   D:\flutter_sdk\flutter\bin\flutter.bat pub get
   ```

3. Configure secrets with `--dart-define` (recommended):

   ```bash
   flutter run \
     --dart-define=GEMINI_API_KEY=your_key \
     --dart-define=SUPABASE_URL=your_url \
     --dart-define=SUPABASE_ANON_KEY=your_anon_key \
     --dart-define=SENTRY_DSN=your_sentry_dsn
   ```

   For convenience, you can keep values in `.env` and run:

   ```bash
   flutter run --dart-define-from-file=.env
   ```

   | Variable | Required | Purpose |
   |----------|----------|---------|
   | `GEMINI_API_KEY` | **Yes** (for AI) | [Google AI Studio](https://aistudio.google.com/apikey) |
   | `SUPABASE_URL` | No | Cloud auth & pantry sync |
   | `SUPABASE_ANON_KEY` | No | Supabase anon key |
   | `SENTRY_DSN` | No | Crash reporting (release builds; debug events are dropped) |
   | `AI_BACKEND_PROXY_URL` | No | Base URL for AI proxy (recommended in production) |
   | `AI_BACKEND_PROXY_BEARER` | No | Optional static bearer token for proxy |
   | `AI_PROXY_REQUIRED` | No | `true` to disable direct Gemini fallback and require proxy |
   | `IAP_PRO_MONTHLY_ID` | No | Play/App Store product ID for monthly Pro subscription |
   | `IAP_PRO_YEARLY_ID` | No | Play/App Store product ID for yearly Pro subscription |

   See [docs/supabase_setup.md](docs/supabase_setup.md) for migrations `001`–`003` and auth providers.

4. Run on a device or emulator:

   ```bash
   flutter run
   ```

5. **(Optional)** App icon code generation after changing `assets/icon/app_icon.png`:

   ```bash
   dart run flutter_launcher_icons
   ```

## Testing

```bash
flutter test
```

Coverage highlights:

- Scan mode recipe sorting (`RecipeModeProcessor`)
- Gemini JSON parsing, receipt line filtering
- Locale/date formatting (TR/EN)
- Theme & preferences persistence
- `PantryAnalysisResult` JSON round-trip
- Gemini error mapping (quota, timeout, network)
- Splash widget smoke test

CI or fresh clones without `.env` still run tests; AI calls are not executed in unit tests.

## AI pipeline

- **Primary model:** `gemini-3-flash-preview`
- **Fallback:** `gemini-2.0-flash` when the preview model is unavailable
- Images resized to **640×640** (receipts keep aspect ratio)
- Mode-specific prompts → JSON (`ingredients`, `recipes` with optional `nutrition`)
- User-facing errors: quota, timeout, network, parse, recognition (TR/EN)

Core recipe prompt logic is centralized in `lib/core/scan/scan_mode_prompts.dart` (do not duplicate mode rules in one-off prompts).

## Android home widget

After changing locale or pantry counts, the app updates widget data from Dart; the Kotlin provider reads stored strings (not hardcoded Turkish). Rebuild the app after widget code changes.

## Documentation

- [docs/supabase_setup.md](docs/supabase_setup.md) — database, RLS, auth
- [docs/ai_proxy_setup.md](docs/ai_proxy_setup.md) — server-side AI proxy + limits
- [docs/platform_permissions.md](docs/platform_permissions.md) — camera, notifications
- [docs/QA_CHECKLIST.md](docs/QA_CHECKLIST.md) — manual device QA before release

## Release checklist (summary)

Before Play Store:

1. Run `flutter test` and manual QA on a real device (both locales, light/dark themes, offline receipt queue).
2. Configure release signing (replace debug signing in `android/app/build.gradle.kts`).
3. Set `SENTRY_DSN` for production crash visibility.
4. Privacy policy URL, store listing, screenshots (TR + EN).
5. Run Supabase migrations `002` / `003` if using cloud pantry features.

## Parent repo note

The parent `CyberChef` folder may also contain a Unity project. **This Flutter app is the mobile pantry client** and can be developed independently. See [INTEGRATION.md](../INTEGRATION.md) if present for cross-project notes.

## License

Private / unpublished unless otherwise specified by the repository owner.
