# CyberChef — Bosch Home Connect OAuth backend

Express.js service for the **OAuth2 Authorization Code** flow against the [Home Connect API](https://api-docs.home-connect.com/).

Used by the Flutter app **Smart home (beta)** settings (debug / internal builds only when `BOSCH_BACKEND_URL` is set).

## Setup

1. Register an app at [developer.home-connect.com](https://developer.home-connect.com) (simulator: [simulator.home-connect.com](https://simulator.home-connect.com)).
2. Copy `.env.example` → `.env` and fill `BOSCH_CLIENT_ID` / `BOSCH_CLIENT_SECRET`.
3. Set **Redirect URI** in the portal to match `BOSCH_REDIRECT_URI` exactly (e.g. `http://127.0.0.1:3000/bosch/callback`).
4. Enable scopes in the portal scope matrix to match `BOSCH_OAUTH_SCOPE`.

```bash
cd backend
npm install
npm run dev
```

Server listens on `http://localhost:3000` (binds all interfaces — reachable on LAN for physical phones).

## OAuth scopes (important)

| Scope | Typical use |
|--------|-------------|
| `IdentifyAppliance` | List paired appliances (required baseline) |
| `FridgeFreezer-Monitor` | Read fridge status (simulator / dev) |
| `FridgeFreezer-Images` | **Fridge camera** `GET …/images` — often requires partner approval in the developer portal |

`FridgeFreezer-Monitor` alone is **not** enough for camera images. If the token lacks `FridgeFreezer-Images`, the app falls back to **pick a photo from gallery** (simulator demo) and runs the same AI pantry scan.

Default in `.env.example`:

```env
BOSCH_OAUTH_SCOPE=IdentifyAppliance FridgeFreezer-Monitor
```

After changing scopes: user must **Disconnect → Connect** in the app to obtain a new token.

## Endpoints

| Method | Path | Purpose |
|--------|------|---------|
| GET | `/health` | Liveness |
| GET | `/bosch/redirect-uri` | Registered redirect URI (portal check) |
| GET | `/bosch/auth-url` | `{ authorizationUrl, state, redirectUri, requestedScope }` for Flutter WebView |
| GET | `/bosch/authorize` | Redirect browser to Home Connect login (manual test) |
| GET | `/bosch/callback` | OAuth redirect landing (HTML only; app uses POST `/bosch/exchange`) |
| POST | `/bosch/exchange` | `{ code, state, redirectUri }` → tokens + `scope` |
| POST | `/bosch/refresh` | `{ refreshToken }` → new access token |

## Flutter app

1. Root `.env`: `BOSCH_BACKEND_URL=http://YOUR_PC_LAN_IP:3000` (optional `BOSCH_API_HOST=https://simulator.home-connect.com`).
2. Build with env injected, e.g. `flutter build apk --debug --dart-define-from-file=.env`.
3. PC backend running; phone on same Wi‑Fi. Emulator: `http://10.0.2.2:3000`.
4. **Settings → Smart home (beta)** → Connect Bosch fridge → Update pantry from fridge.

**Play Store / release builds:** do **not** set `BOSCH_BACKEND_URL` — the Smart home section stays hidden. This backend is for local dev and beta demos, not end-user production hosting.

## Manual test (browser)

1. Open `http://localhost:3000/bosch/authorize`
2. Log in and grant access.
3. Callback page confirms success; use the app WebView flow for token exchange.

## Security

- Never commit `backend/.env` (client secret).
- Do not expose this server on the public internet without TLS and hardening.

## Later (not in beta A)

- Deploy backend with HTTPS redirect URI for production Home Connect.
- Store refresh tokens per user in Supabase.
- Auto-merge detected pantry items after fridge scan.
