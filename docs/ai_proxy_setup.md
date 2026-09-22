# AI Proxy Setup (Supabase Edge Function)

This project now supports routing AI calls through a backend proxy.

## Why

- Keeps `GEMINI_API_KEY` on server side.
- Enables server-side daily limits and cooldowns.
- Makes free/pro monetization enforcement possible.

## Files

- Edge function: `supabase/functions/ai-proxy/index.ts`
- Rate-limit migration: `supabase/migrations/004_ai_usage_guard.sql`
- Flutter proxy adapter: `lib/services/ai_backend_proxy.dart`

## Deploy Steps

1. Apply migrations:

```bash
supabase db push
```

2. Set function secrets:

```bash
supabase secrets set GEMINI_API_KEY=your_key
supabase secrets set GEMINI_MODEL=gemini-3-flash-preview
supabase secrets set GEMINI_FALLBACK_MODEL=gemini-2.0-flash
supabase secrets set GOOGLE_SERVICE_ACCOUNT_JSON='{"type":"service_account",...}'
```

3. Deploy function:

```bash
supabase functions deploy ai-proxy
```

4. Point Flutter app to the proxy:

```bash
flutter run --dart-define=AI_BACKEND_PROXY_URL=https://<project-ref>.supabase.co/functions/v1/ai-proxy
```

Optional static bearer:

```bash
flutter run --dart-define=AI_BACKEND_PROXY_BEARER=your_token
```

To enforce proxy-only mode (recommended for production):

```bash
flutter run \
  --dart-define=AI_BACKEND_PROXY_URL=https://<project-ref>.supabase.co/functions/v1/ai-proxy \
  --dart-define=AI_PROXY_REQUIRED=true
```

## Current Endpoint Contract

The client calls these paths under `AI_BACKEND_PROXY_URL`:

- `POST /analyze-pantry`
- `POST /process-receipt`
- `POST /generate-from-ingredients`
- `POST /translate-recipe`
- `POST /localize-pantry`
- `POST /activate-pro`

Each successful response must be:

```json
{
  "data": { }
}
```

## Usage Guard Behavior

`guard_ai_usage` currently enforces (server-side):

- Pantry scan: `6/day`, `10s` cooldown
- Receipt scan: `3/day`, `10s` cooldown
- Ingredient recipe generation: `6/day`, `10s` cooldown
- Recipe translation: unlimited (no daily cap)
- Pantry localization: unlimited (no daily cap)
- Pantry localization: `3/day`, `5s` cooldown

Adjust these constants in `supabase/functions/ai-proxy/index.ts` as needed.

## Free / Pro tiers

The proxy now reads `public.user_subscription_tiers`:

- `free` (default)
- `pro`

You can promote a user with SQL:

```sql
insert into public.user_subscription_tiers (user_id, tier)
values ('<auth-user-uuid>', 'pro')
on conflict (user_id)
do update set tier = excluded.tier, updated_at = now();
```

Purchase events are recorded in `public.pro_purchase_events`.
When app purchase succeeds, client calls `POST /activate-pro`.
For Android, function verifies purchase using Google Play Developer API
(`purchases.subscriptionsv2.get`) before upgrading tier.

Required request payload for Android:

```json
{
  "source": "iap",
  "platform": "android",
  "productId": "your.pro.subscription.id",
  "packageName": "com.cyberchef.pantry",
  "purchaseToken": "play_purchase_token",
  "purchaseId": "optional-order-id"
}
```

If verification fails, endpoint returns `402 purchase_not_verified` and
does not upgrade the user.
