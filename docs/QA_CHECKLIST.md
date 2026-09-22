# CyberChef — Manual QA checklist

Use a **physical device** when possible. Run through once in **Türkçe** and once in **English**.

## Environment

- [ ] `.env` has valid `GEMINI_API_KEY`
- [ ] Supabase configured (or explicitly test **offline / guest-only** path)
- [ ] `flutter test` passes locally

## Onboarding & shell

- [ ] First launch: onboarding completes, lands on main tabs
- [ ] Splash shows brand + tagline; no stuck loading
- [ ] Tabs: Scan, Freshness, Shopping — labels match selected language

## Themes (Settings → Appearance)

- [ ] Neon, Ocean, Ember, Lavender — readable text, scan frame visible
- [ ] Daylight, Cream — status bar / nav bar contrast OK
- [ ] Theme persists after app restart

## Locale

- [ ] Switch TR ↔ EN in Settings; all main screens update (not only Settings)
- [ ] Freshness empty states, dialogs, snackbars in correct language
- [ ] Android home widget subtitle matches app language after refresh

## Scan modes (fridge)

- [ ] Quick Scan — recipes tend toward shorter cook times
- [ ] Survival — prompt chips / expiry hint; recipes use listed ingredients
- [ ] Chef Mode — harder recipes ordered first
- [ ] Mode persists after restart
- [ ] Gallery pick works; no duplicate gallery sheet when camera idle
- [ ] Poor image → quality dialog; cancel vs continue

## Receipt

- [ ] Receipt capture → items sheet → add to pantry
- [ ] Airplane mode: capture queues; banner offers process when online
- [ ] Totals / card lines filtered out (no “TOPLAM” in food list)

## Freshness

- [ ] Add manual item; edit quantity / expiry
- [ ] Critical banner when items expire soon
- [ ] Notifications enabled: permission prompt; weekly summary (if applicable)
- [ ] “Cook today” / recipe from ingredients flow completes

## Barcode

- [ ] Scan known product → confirm sheet → pantry entry
- [ ] Unknown barcode — clear message, no crash

## Recipes & favorites

- [ ] Recipe detail: steps, nutrition block when present
- [ ] Favorite toggle; appears on Favorites screen
- [ ] Share sheet opens with recipe text

## Shopping list

- [ ] Add / check off / delete items
- [ ] List survives app restart

## Auth & sync (if Supabase enabled)

- [ ] Sign up / sign in / guest
- [ ] Scan saves to history; Pantry Log opens past scan
- [ ] Sign out does not crash

## Errors (Gemini)

- [ ] Invalid or missing API key — friendly configuration message
- [ ] Airplane mode during scan — network message (not raw exception)
- [ ] (Optional) Force quota / timeout — quota or timeout string in UI

## Crash reporting (optional)

- [ ] `SENTRY_DSN` set → release build sends test event (Sentry dashboard)
- [ ] Debug build does not spam Sentry (events filtered)

## Release build smoke

- [ ] `flutter build apk --release` (or app bundle) succeeds
- [ ] Release APK installs and opens on device
- [ ] No debug banner; API keys not logged to console in release

---

**Sign-off:** Device model __________ · OS version __________ · Date __________ · Tester __________
