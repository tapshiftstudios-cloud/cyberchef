# Supabase setup for CyberChef

## 1. Create a project

1. Go to [supabase.com](https://supabase.com) and create a new project.
2. Copy **Project URL** and **anon public** key from **Settings → API**.

## 2. Configure the app

Add to `cyberchef_flutter/.env`:

```
SUPABASE_URL=https://xxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOi...
GEMINI_API_KEY=...
```

## 3. Run database migrations

In Supabase Dashboard → **SQL** → **New query**, run **in order**:

| File | Purpose |
|------|---------|
| `supabase/migrations/001_pantry_scans.sql` | Buzdolabı tarama geçmişi |
| `supabase/migrations/002_pantry_items.sql` | Fiş / tazelik ürünleri |
| `supabase/migrations/003_pantry_items_extend.sql` | Mağaza, güven skoru, `consumed_at` |

## 4. Enable authentication providers

**Authentication → Providers**

| Provider | Setting |
|----------|---------|
| **Email** | Enabled |
| **Anonymous** | Optional (guest) |

Optional: disable **Confirm email** for faster dev testing.

## 4b. Email confirmation redirect (mobile)

If confirmation links open `localhost:3000` in the phone browser, fix Supabase URL settings:

**Authentication → URL Configuration**

| Field | Value |
|-------|--------|
| **Site URL** | `com.cyberchef.pantry://login-callback` |
| **Redirect URLs** | `com.cyberchef.pantry://login-callback/**` |

Add both URLs to the allow list. The app registers this deep link on Android/iOS and passes it on sign-up (`emailRedirectTo`).

After tapping **Confirm email** in the inbox, the phone should open **CyberChef** (not a blank localhost page).

## 5. Test the flow

1. `flutter pub get`
2. `flutter run` on a device
3. Sign in or continue as guest
4. **Buzdolabı tara** → recipes → pantry history (if signed in)
5. **Fiş tara** → confirm items → **Tazelik Paneli**
6. Settings → sync freshness / enable notifications

## Tables

### `pantry_scans`

| Column | Type | Description |
|--------|------|-------------|
| `id` | uuid | Primary key |
| `user_id` | uuid | Owner |
| `mode` | text | `quickScan`, `survival`, `chefMode` |
| `ingredients` | jsonb | Detected items |
| `recipes` | jsonb | 3 AI recipes |
| `created_at` | timestamptz | Scan time |

### `pantry_items`

| Column | Type | Description |
|--------|------|-------------|
| `id` | uuid | Primary key |
| `user_id` | uuid | Owner |
| `clean_name` | text | Display name |
| `category` | text | Food category |
| `purchase_date` | timestamptz | From receipt or scan day |
| `estimated_expiry_days` | int | AI shelf-life estimate |
| `is_consumed` | bool | Marked used |
| `raw_name` | text | Receipt line (optional) |
| `quantity` | text | e.g. 500g |
| `store_name` | text | Market (optional) |
| `confidence` | real | OCR confidence 0–1 |
| `consumed_at` | timestamptz | When marked consumed |
| `created_at` | timestamptz | Row created |
