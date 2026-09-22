# Recipe cover images

## V1 (shipped)

- `RecipeImageService` resolves a URL from the recipe **title**.
- Order: explicit `Recipe.imageUrl` → memory cache → SharedPreferences → **TheMealDB** (free) → **Pexels** (optional `PEXELS_API_KEY`) → keyword **Unsplash** fallback.
- No Gemini cost; one HTTP call per new title, then cached on device.

Optional in `.env`:

```env
PEXELS_API_KEY=your_pexels_key
```

## V2 (later)

- Proxy generates `imageUrl` once (Imagen / Gemini image) on recipe detail or favorite.
- Store in Supabase Storage; set `imageUrl` on `Recipe` JSON.
- Pro-only or lazy load to control cost.
