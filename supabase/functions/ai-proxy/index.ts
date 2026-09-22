import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

type Json = Record<string, unknown>;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type, x-device-id",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY") ?? "";
const GEMINI_MODEL = Deno.env.get("GEMINI_MODEL") ?? "gemini-3-flash-preview";
const GEMINI_FALLBACK_MODEL = Deno.env.get("GEMINI_FALLBACK_MODEL") ?? "gemini-2.5-flash";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL") ?? "";
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
const GOOGLE_SERVICE_ACCOUNT_JSON = Deno.env.get("GOOGLE_SERVICE_ACCOUNT_JSON") ?? "";

type Tier = "free" | "pro";

const DAILY_LIMITS_BY_TIER: Record<Tier, Record<string, number>> = {
  free: {
    pantry_scan: 3,
    receipt_scan: 2,
    recipe_from_ingredients: 3,
  },
  pro: {
    pantry_scan: 30,
    receipt_scan: 15,
    recipe_from_ingredients: 30,
  },
};

const COOLDOWN_SECONDS: Record<string, number> = {
  pantry_scan: 10,
  receipt_scan: 10,
  recipe_from_ingredients: 10,
};

const CUISINE_BY_LOCALE: Record<string, string> = {
  en: "American and British everyday home cooking",
  americanBritish: "American and British everyday home cooking",
  tr: "Turkish home cooking",
  turkish: "Turkish home cooking",
  es: "Spanish home cooking",
  spanish: "Spanish home cooking",
  de: "German home cooking",
  german: "German home cooking",
  fr: "French home cooking",
  french: "French home cooking",
  pt: "Portuguese and Brazilian home cooking",
  portugueseBrazilian: "Portuguese and Brazilian home cooking",
  it: "Italian home cooking",
  italian: "Italian home cooking",
  nl: "Dutch home cooking",
  dutch: "Dutch home cooking",
  pl: "Polish home cooking",
  polish: "Polish home cooking",
  ru: "Russian home cooking",
  russian: "Russian home cooking",
  ja: "Japanese home cooking",
  japanese: "Japanese home cooking",
  ko: "Korean home cooking",
  korean: "Korean home cooking",
  zh: "Chinese home cooking",
  chinese: "Chinese home cooking",
  hi: "Indian home cooking",
  indian: "Indian home cooking",
  id: "Indonesian home cooking",
  indonesian: "Indonesian home cooking",
  vi: "Vietnamese home cooking",
  vietnamese: "Vietnamese home cooking",
  ar: "Middle Eastern home cooking",
  middleEastern: "Middle Eastern home cooking",
  uk: "Ukrainian home cooking",
  ukrainian: "Ukrainian home cooking",
  cs: "Czech home cooking",
  czech: "Czech home cooking",
  ro: "Romanian home cooking",
  romanian: "Romanian home cooking",
  sv: "Swedish and Nordic home cooking",
  da: "Danish and Nordic home cooking",
  fi: "Finnish and Nordic home cooking",
  nordic: "Swedish and Nordic home cooking",
  el: "Greek home cooking",
  greek: "Greek home cooking",
  hu: "Hungarian home cooking",
  hungarian: "Hungarian home cooking",
  ms: "Malaysian home cooking",
  malaysian: "Malaysian home cooking",
  th: "Thai home cooking",
  thai: "Thai home cooking",
};

function cuisinePromptBlock(locale: string, cuisineRegion?: unknown): string {
  const regionKey = typeof cuisineRegion === "string"
    ? cuisineRegion.trim().toLowerCase()
    : "";
  const localeKey = (locale || "en").split("-")[0].toLowerCase();
  const style = (regionKey && CUISINE_BY_LOCALE[regionKey]) ??
    CUISINE_BY_LOCALE[localeKey] ??
    CUISINE_BY_LOCALE.en;
  return `Cuisine: ${style}. Prefer authentic home-style dishes from this tradition; avoid generic Western defaults when local dishes fit the ingredients.`;
}

const RECEIPT_STORES: Record<string, string> = {
  turkish: "Turkish supermarkets (Migros, BİM, A101, Şok, CarrefourSA, Metro, Hakmar)",
  italian: "Italian supermarkets (Conad, Esselunga, Coop, Lidl, Eurospin, Carrefour, Pam)",
  german: "German supermarkets (Aldi, Lidl, Rewe, Edeka, Kaufland, Netto, Penny)",
  french: "French supermarkets (Carrefour, Leclerc, Auchan, Intermarché, Monoprix, Lidl)",
  spanish: "Spanish supermarkets (Mercadona, Carrefour, Lidl, Dia, Eroski, Alcampo)",
  portugueseBrazilian: "Portuguese and Brazilian stores (Continente, Pingo Doce, Pão de Açúcar, Assaí)",
  dutch: "Dutch supermarkets (Albert Heijn, Jumbo, Lidl, Aldi, Plus, Dirk)",
  polish: "Polish supermarkets (Biedronka, Lidl, Kaufland, Auchan, Carrefour, Żabka)",
  russian: "Russian supermarkets (Пятёрочка, Магнит, Лента, Перекрёсток, Ашан)",
  japanese: "Japanese supermarkets (Aeon, Ito-Yokado, Life, Seiyu, Lawson)",
  korean: "Korean supermarkets (E-Mart, Lotte Mart, Homeplus, GS25, CU)",
  chinese: "Chinese supermarkets (Hema/Freshippo, Yonghui, Walmart, Sam's Club)",
  indian: "Indian supermarkets (Big Bazaar, Reliance Fresh, DMart, More)",
  indonesian: "Indonesian supermarkets (Indomaret, Alfamart, Hypermart, Transmart)",
  vietnamese: "Vietnamese supermarkets (WinMart, Co.opmart, Bach Hoa Xanh, Big C)",
  middleEastern: "Middle Eastern grocery chains (Carrefour, Lulu, Spinneys, Danube)",
  ukrainian: "Ukrainian supermarkets (АТБ, Сільпо, Novus, Metro, Varus)",
  czech: "Czech supermarkets (Albert, Lidl, Kaufland, Penny, Tesco, Billa)",
  romanian: "Romanian supermarkets (Kaufland, Lidl, Carrefour, Mega Image, Penny)",
  nordic: "Nordic supermarkets (ICA, Coop, Willys, Rema 1000, K-Market, S-Market)",
  greek: "Greek supermarkets (Sklavenitis, AB Vassilopoulos, Lidl, Masoutis)",
  hungarian: "Hungarian supermarkets (Tesco, Lidl, Spar, Auchan, Penny, Coop)",
  malaysian: "Malaysian supermarkets (Tesco, Giant, Aeon, 99 Speedmart, KK Mart)",
  thai: "Thai supermarkets (7-Eleven grocery, Lotus's, Big C, Makro, Tops)",
  americanBritish: "US/UK grocery stores (Walmart, Kroger, Target, Tesco, Sainsbury's, Aldi, Costco)",
};

const RECEIPT_LANG: Record<string, string> = {
  en: "English", tr: "Turkish", it: "Italian", de: "German", fr: "French",
  es: "Spanish", pt: "Portuguese", nl: "Dutch", pl: "Polish", ru: "Russian",
  ja: "Japanese", ko: "Korean", zh: "Chinese", hi: "Hindi", id: "Indonesian",
  vi: "Vietnamese", ar: "Arabic", uk: "Ukrainian", cs: "Czech", ro: "Romanian",
  sv: "Swedish", da: "Danish", fi: "Finnish", el: "Greek", hu: "Hungarian",
  ms: "Malay", th: "Thai",
};

function receiptPromptBlock(cuisineRegion?: unknown, locale?: unknown): string {
  const regionKey = typeof cuisineRegion === "string"
    ? cuisineRegion.trim().toLowerCase()
    : "turkish";
  const localeKey = typeof locale === "string"
    ? locale.split("-")[0].toLowerCase()
    : "en";
  const stores = RECEIPT_STORES[regionKey] ?? RECEIPT_STORES.turkish;
  const lang = RECEIPT_LANG[localeKey] ?? "English";
  return `You are an expert receipt OCR assistant for ${stores}.
Return ONLY valid JSON:
{
  "receipt_detected": boolean,
  "purchase_date": "YYYY-MM-DD or null",
  "store_name": "string or null",
  "items": [{
    "raw_name": "text from receipt",
    "clean_name": "natural ${lang} product name",
    "quantity": "string",
    "category": "Dairy | Meat | Vegetable | Bakery | Beverage | Frozen | Pantry | Other",
    "estimated_expiry_days": number,
    "confidence": number,
    "line_price": number or null
  }]
}
line_price: numeric line total printed next to the product (local currency, number only). Omit or null if not visible.
Parse local date formats. Skip tax, payment, totals, bags. Food/grocery lines only.`;
}

function getDailyLimit(tier: Tier, action: string): number {
  return DAILY_LIMITS_BY_TIER[tier][action] ?? DAILY_LIMITS_BY_TIER.free[action] ?? 1;
}

const supabaseAdmin = SUPABASE_URL && SUPABASE_SERVICE_ROLE_KEY
  ? createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
      auth: { persistSession: false },
    })
  : null;

function jsonResponse(status: number, body: Json) {
  return new Response(JSON.stringify(body), {
    status,
    headers: {
      ...corsHeaders,
      "Content-Type": "application/json",
    },
  });
}

function parseBearer(req: Request): string | null {
  const auth = req.headers.get("authorization");
  if (!auth) return null;
  const parts = auth.split(" ");
  if (parts.length !== 2) return null;
  if (parts[0].toLowerCase() !== "bearer") return null;
  return parts[1];
}

async function resolveActorId(req: Request): Promise<string> {
  const deviceId = req.headers.get("x-device-id")?.trim();
  if (deviceId) return `device:${deviceId}`;

  const bearer = parseBearer(req);
  if (!bearer || !supabaseAdmin) return "anonymous";

  const { data, error } = await supabaseAdmin.auth.getUser(bearer);
  if (error || !data.user) return "anonymous";
  return `user:${data.user.id}`;
}

async function resolveUserId(req: Request): Promise<string | null> {
  const bearer = parseBearer(req);
  if (!bearer || !supabaseAdmin) return null;
  const { data, error } = await supabaseAdmin.auth.getUser(bearer);
  if (error || !data.user) return null;
  return data.user.id;
}

async function requireUserId(req: Request): Promise<string | null> {
  const userId = await resolveUserId(req);
  if (!userId) return null;
  return userId;
}

async function resolveTier(req: Request): Promise<Tier> {
  if (!supabaseAdmin) return "free";
  const userId = await resolveUserId(req);
  if (!userId) return "free";

  const { data } = await supabaseAdmin
    .from("user_subscription_tiers")
    .select("tier")
    .eq("user_id", userId)
    .maybeSingle();

  const tier = data?.tier;
  return tier === "pro" ? "pro" : "free";
}

async function enforceUsage(
  req: Request,
  action: string,
  payload?: Json,
): Promise<Response | null> {
  if (!supabaseAdmin) return null;

  const actorId = await resolveActorId(req);
  const tier = await resolveTier(req);
  const actionDailyLimit = getDailyLimit(tier, action);
  const cooldown = COOLDOWN_SECONDS[action] ?? 0;
  const useRewardCredit = payload?.["useRewardCredit"] === true;

  const { data, error } = await supabaseAdmin.rpc("guard_ai_usage", {
    p_actor_id: actorId,
    p_action: action,
    p_daily_limit: actionDailyLimit,
    p_cooldown_seconds: cooldown,
    p_use_reward_credit: useRewardCredit,
  });

  if (error || !Array.isArray(data) || data.length === 0) {
    return jsonResponse(500, {
      error: "usage_guard_failed",
      message: "Rate-limit guard failed.",
    });
  }

  const row = data[0] as {
    allowed: boolean;
    reason: string;
    wait_seconds: number;
    remaining: number;
  };

  if (row.allowed) return null;

  if (row.reason === "cooldown") {
    return jsonResponse(429, {
      error: "cooldown",
      message: `Please wait ${row.wait_seconds} second(s).`,
      waitSeconds: row.wait_seconds,
      remaining: row.remaining,
    });
  }

  if (row.reason === "daily_limit") {
    return jsonResponse(429, {
      error: "daily_limit",
      message: "Daily limit reached. Try again tomorrow.",
      remaining: 0,
    });
  }

  return jsonResponse(429, {
    error: "blocked",
    message: "Request blocked.",
  });
}

async function rollbackUsage(req: Request, action: string): Promise<void> {
  if (!supabaseAdmin) return;
  const actorId = await resolveActorId(req);
  await supabaseAdmin.rpc("rollback_ai_usage", {
    p_actor_id: actorId,
    p_action: action,
  });
}

async function getUsageStatus(req: Request): Promise<Json> {
  const actorId = await resolveActorId(req);
  const tier = await resolveTier(req);
  const todayIso = new Date().toISOString().slice(0, 10);
  const resetAt = new Date();
  resetAt.setUTCHours(24, 0, 0, 0);

  if (!supabaseAdmin) {
    return {
      tier,
      pantryRemaining: getDailyLimit(tier, "pantry_scan"),
      receiptRemaining: getDailyLimit(tier, "receipt_scan"),
      recipeRemaining: getDailyLimit(tier, "recipe_from_ingredients"),
      cooldownSeconds: 0,
      resetAt: resetAt.toISOString(),
    };
  }

  const { data } = await supabaseAdmin
    .from("ai_usage_guard")
    .select("action,count,last_used_at")
    .eq("usage_date", todayIso)
    .eq("actor_id", actorId);

  const rows = Array.isArray(data) ? data as Array<{ action: string; count: number; last_used_at: string | null }> : [];
  const byAction = new Map(rows.map((r) => [r.action, r]));

  const remaining = (action: string) => {
    const used = byAction.get(action)?.count ?? 0;
    return Math.max(getDailyLimit(tier, action) - used, 0);
  };

  const cooldownRemaining = (action: string) => {
    const row = byAction.get(action);
    if (!row?.last_used_at) return 0;
    const elapsed = Math.floor((Date.now() - new Date(row.last_used_at).getTime()) / 1000);
    const left = (COOLDOWN_SECONDS[action] ?? 0) - elapsed;
    return Math.max(left, 0);
  };

  const cooldownSeconds = Math.max(
    cooldownRemaining("pantry_scan"),
    cooldownRemaining("receipt_scan"),
    cooldownRemaining("recipe_from_ingredients"),
  );

  return {
    tier,
    pantryRemaining: remaining("pantry_scan"),
    receiptRemaining: remaining("receipt_scan"),
    recipeRemaining: remaining("recipe_from_ingredients"),
    cooldownSeconds,
    resetAt: resetAt.toISOString(),
  };
}

function resolveRequestPath(req: Request, payload: Json): string {
  const fromBody = payload["_route"];
  if (typeof fromBody === "string" && fromBody.trim().length > 0) {
    const raw = fromBody.trim();
    const withoutAiPrefix = raw.startsWith("/ai/") ? raw.slice(4) : raw.startsWith("ai/") ? raw.slice(3) : raw;
    return withoutAiPrefix.startsWith("/") ? withoutAiPrefix : `/${withoutAiPrefix}`;
  }

  const url = new URL(req.url);
  const segments = url.pathname.split("/").filter(Boolean);
  const fnIndex = segments.indexOf("ai-proxy");
  if (fnIndex >= 0 && fnIndex < segments.length - 1) {
    const rest = segments.slice(fnIndex + 1).join("/");
    const withoutAiPrefix = rest.startsWith("ai/") ? rest.slice(3) : rest;
    return withoutAiPrefix.startsWith("/") ? withoutAiPrefix : `/${withoutAiPrefix}`;
  }

  const stripped = url.pathname.replace(/^\/functions\/v1\/ai-proxy\/?/, "");
  if (!stripped) return "/";
  const withoutAiPrefix = stripped.startsWith("ai/") ? stripped.slice(3) : stripped.startsWith("/ai/") ? stripped.slice(4) : stripped;
  return withoutAiPrefix.startsWith("/") ? withoutAiPrefix : `/${withoutAiPrefix}`;
}

type GeminiResult = {
  json: Json | null;
  quotaExceeded: boolean;
  message: string | null;
};

async function geminiGenerate(
  model: string,
  contents: unknown[],
  generationConfig?: Json,
): Promise<GeminiResult> {
  if (!GEMINI_API_KEY) {
    return { json: null, quotaExceeded: false, message: "missing_gemini_key" };
  }
  const res = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${GEMINI_API_KEY}`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        contents,
        ...(generationConfig ? { generationConfig } : {}),
      }),
    },
  );

  if (!res.ok) {
    const text = await res.text();
    let message: string | null = text;
    let quotaExceeded = res.status === 429;
    try {
      const parsed = JSON.parse(text) as Json;
      const err = parsed["error"] as Json | undefined;
      const errMessage = err?.["message"];
      if (typeof errMessage === "string") {
        message = errMessage;
        const lower = errMessage.toLowerCase();
        if (
          lower.includes("credit") ||
          lower.includes("quota") ||
          lower.includes("resource_exhausted") ||
          lower.includes("billing")
        ) {
          quotaExceeded = true;
        }
      }
    } catch (_) {
      // keep raw text
    }
    return { json: null, quotaExceeded, message };
  }
  const json = await res.json();
  if (!json || typeof json !== "object") {
    return { json: null, quotaExceeded: false, message: "invalid_gemini_response" };
  }
  return { json: json as Json, quotaExceeded: false, message: null };
}

function extractText(json: Json): string | null {
  const candidates = json["candidates"];
  if (!Array.isArray(candidates) || candidates.length === 0) return null;
  const first = candidates[0] as Json;
  const content = first["content"] as Json | undefined;
  if (!content) return null;
  const parts = content["parts"];
  if (!Array.isArray(parts) || parts.length === 0) return null;
  const text = (parts[0] as Json)["text"];
  return typeof text === "string" ? text : null;
}

function parseLooseJson(text: string): Json | null {
  const trimmed = text.trim();
  try {
    return JSON.parse(trimmed);
  } catch (_) {
    const start = trimmed.indexOf("{");
    const end = trimmed.lastIndexOf("}");
    if (start >= 0 && end > start) {
      try {
        return JSON.parse(trimmed.slice(start, end + 1));
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}

async function runGeminiJsonPrompt(prompt: string): Promise<GeminiResult> {
  const response = await geminiGenerate(
    GEMINI_MODEL,
    [{ parts: [{ text: prompt }] }],
    { responseMimeType: "application/json", temperature: 0.2 },
  );
  const finalResponse = response.json
    ? response
    : response.quotaExceeded
    ? response
    : await geminiGenerate(
      GEMINI_FALLBACK_MODEL,
      [{ parts: [{ text: prompt }] }],
      { responseMimeType: "application/json", temperature: 0.2 },
    );
  return finalResponse;
}

function geminiFailureResponse(result: GeminiResult): Response {
  if (result.quotaExceeded) {
    return jsonResponse(429, {
      error: "gemini_quota_exceeded",
      message: result.message ??
        "Gemini API quota exceeded. Add billing credits in Google AI Studio.",
    });
  }
  return jsonResponse(502, {
    error: "gemini_failed",
    message: result.message ?? "AI model request failed.",
  });
}

function requireObject(value: unknown): Json | null {
  if (!value || typeof value !== "object" || Array.isArray(value)) return null;
  return value as Json;
}

function toJsonString(value: unknown): string {
  try {
    return JSON.stringify(value);
  } catch (_) {
    return "";
  }
}

function base64UrlEncode(bytes: Uint8Array): string {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}

function utf8(text: string): Uint8Array {
  return new TextEncoder().encode(text);
}

function pemToArrayBuffer(pem: string): ArrayBuffer {
  const body = pem
    .replace("-----BEGIN PRIVATE KEY-----", "")
    .replace("-----END PRIVATE KEY-----", "")
    .replace(/\s+/g, "");
  const binary = atob(body);
  const bytes = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) bytes[i] = binary.charCodeAt(i);
  return bytes.buffer;
}

async function createGoogleAccessToken(scope: string): Promise<string | null> {
  if (!GOOGLE_SERVICE_ACCOUNT_JSON) return null;
  const serviceAccount = JSON.parse(GOOGLE_SERVICE_ACCOUNT_JSON) as Json;
  const clientEmail = typeof serviceAccount["client_email"] === "string"
    ? serviceAccount["client_email"]
    : "";
  const privateKeyRaw = typeof serviceAccount["private_key"] === "string"
    ? serviceAccount["private_key"]
    : "";
  if (!clientEmail || !privateKeyRaw) return null;
  const privateKey = privateKeyRaw.replace(/\\n/g, "\n");

  const now = Math.floor(Date.now() / 1000);
  const header = { alg: "RS256", typ: "JWT" };
  const payload = {
    iss: clientEmail,
    scope,
    aud: "https://oauth2.googleapis.com/token",
    iat: now,
    exp: now + 3600,
  };
  const encodedHeader = base64UrlEncode(utf8(toJsonString(header)));
  const encodedPayload = base64UrlEncode(utf8(toJsonString(payload)));
  const signingInput = `${encodedHeader}.${encodedPayload}`;

  const key = await crypto.subtle.importKey(
    "pkcs8",
    pemToArrayBuffer(privateKey),
    {
      name: "RSASSA-PKCS1-v1_5",
      hash: "SHA-256",
    },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign(
    "RSASSA-PKCS1-v1_5",
    key,
    utf8(signingInput),
  );
  const jwt = `${signingInput}.${base64UrlEncode(new Uint8Array(signature))}`;

  const tokenRes = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: jwt,
    }),
  });
  if (!tokenRes.ok) return null;
  const tokenJson = await tokenRes.json().catch(() => null);
  if (!tokenJson || typeof tokenJson !== "object") return null;
  const accessToken = (tokenJson as Json)["access_token"];
  return typeof accessToken === "string" && accessToken.trim().length > 0
    ? accessToken.trim()
    : null;
}

type AndroidVerificationResult = {
  ok: boolean;
  status: string;
  providerResponse?: Json;
};

async function verifyAndroidSubscription(input: {
  packageName: string;
  productId: string;
  purchaseToken: string;
}): Promise<AndroidVerificationResult> {
  const accessToken = await createGoogleAccessToken(
    "https://www.googleapis.com/auth/androidpublisher",
  );
  if (!accessToken) {
    return { ok: false, status: "google_auth_unavailable" };
  }

  const verifyUrl =
    `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${encodeURIComponent(input.packageName)}/purchases/subscriptionsv2/tokens/${encodeURIComponent(input.purchaseToken)}`;
  const res = await fetch(verifyUrl, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${accessToken}`,
      Accept: "application/json",
    },
  });
  const payload = await res.json().catch(() => null);
  const providerResponse = requireObject(payload) ?? {};
  if (!res.ok) {
    return {
      ok: false,
      status: "google_verify_http_error",
      providerResponse,
    };
  }

  const subscriptionState = providerResponse["subscriptionState"];
  const activeStates = new Set([
    "SUBSCRIPTION_STATE_ACTIVE",
    "SUBSCRIPTION_STATE_IN_GRACE_PERIOD",
  ]);
  if (typeof subscriptionState !== "string" || !activeStates.has(subscriptionState)) {
    return {
      ok: false,
      status: "subscription_inactive",
      providerResponse,
    };
  }

  const lineItems = Array.isArray(providerResponse["lineItems"])
    ? providerResponse["lineItems"] as Array<Json>
    : [];
  const item = lineItems.find((line) => line["productId"] === input.productId);
  if (!item) {
    return {
      ok: false,
      status: "product_mismatch",
      providerResponse,
    };
  }
  const expiryTime = item["expiryTime"];
  if (typeof expiryTime === "string") {
    const expiresAt = new Date(expiryTime).getTime();
    if (Number.isFinite(expiresAt) && expiresAt <= Date.now()) {
      return {
        ok: false,
        status: "subscription_expired",
        providerResponse,
      };
    }
  }

  return { ok: true, status: "verified", providerResponse };
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return jsonResponse(405, { error: "method_not_allowed" });
  }

  if (!GEMINI_API_KEY) {
    return jsonResponse(503, {
      error: "gemini_key_missing",
      message: "Server is missing GEMINI_API_KEY.",
    });
  }

  const body = await req.json().catch(() => null);
  const payload = requireObject(body);
  if (!payload) {
    return jsonResponse(400, { error: "invalid_json" });
  }

  const path = resolveRequestPath(req, payload);
  delete payload["_route"];

  if (path === "/usage-status") {
    const data = await getUsageStatus(req);
    return jsonResponse(200, { data });
  }

  if (path === "/claim-reward-credit") {
    if (!supabaseAdmin) {
      return jsonResponse(503, { error: "supabase_unavailable" });
    }
    const tier = await resolveTier(req);
    if (tier === "pro") {
      return jsonResponse(403, {
        error: "pro_no_ads",
        message: "Pro users do not need rewarded credits.",
      });
    }
    const actionRaw = payload["action"];
    const allowedActions = new Set([
      "pantry_scan",
      "receipt_scan",
      "recipe_from_ingredients",
    ]);
    if (typeof actionRaw !== "string" || !allowedActions.has(actionRaw)) {
      return jsonResponse(400, { error: "invalid_action" });
    }
    const actorId = await resolveActorId(req);
    const { data, error } = await supabaseAdmin.rpc("grant_ai_reward_credit", {
      p_actor_id: actorId,
      p_action: actionRaw,
      p_max_daily_earned: 3,
    });
    if (error || !Array.isArray(data) || data.length === 0) {
      return jsonResponse(500, {
        error: "reward_grant_failed",
        message: error?.message ?? "Could not grant reward credit.",
      });
    }
    const row = data[0] as {
      granted: boolean;
      reason: string;
      credits_remaining: number;
    };
    return jsonResponse(200, {
      data: {
        granted: row.granted,
        reason: row.reason,
        creditsRemaining: row.credits_remaining,
      },
    });
  }

  if (path === "/activate-pro") {
    if (!supabaseAdmin) {
      return jsonResponse(503, { error: "supabase_unavailable" });
    }
    const bearer = parseBearer(req);
    if (!bearer || !supabaseAdmin) {
      return jsonResponse(401, { error: "unauthorized" });
    }
    const { data: authData, error: authError } = await supabaseAdmin.auth.getUser(bearer);
    if (authError || !authData.user) {
      return jsonResponse(401, { error: "unauthorized" });
    }
    if (authData.user.is_anonymous) {
      return jsonResponse(403, {
        error: "registered_account_required",
        message: "Email account required before Pro activation.",
      });
    }
    const userId = authData.user.id;

    const source = payload["source"];
    const platform = payload["platform"];
    const productId = payload["productId"];
    const packageName = payload["packageName"];
    const purchaseToken = payload["purchaseToken"];
    const purchaseId = payload["purchaseId"];
    if (typeof source !== "string" || source.trim().length === 0) {
      return jsonResponse(400, { error: "source_required" });
    }
    if (typeof productId !== "string" || productId.trim().length === 0) {
      return jsonResponse(400, { error: "product_id_required" });
    }
    if (typeof platform !== "string" || platform.trim().length === 0) {
      return jsonResponse(400, { error: "platform_required" });
    }

    let verificationStatus = "not_verified";
    let providerResponse: Json | undefined;
    const platformValue = platform.trim().toLowerCase();
    if (platformValue === "android") {
      if (
        typeof packageName !== "string" || packageName.trim().length === 0 ||
        typeof purchaseToken !== "string" || purchaseToken.trim().length === 0
      ) {
        return jsonResponse(400, { error: "android_verification_fields_required" });
      }
      const verify = await verifyAndroidSubscription({
        packageName: packageName.trim(),
        productId: productId.trim(),
        purchaseToken: purchaseToken.trim(),
      });
      verificationStatus = verify.status;
      providerResponse = verify.providerResponse;
      if (!verify.ok) {
        await supabaseAdmin.from("pro_purchase_events").insert({
          user_id: userId,
          source: source.trim(),
          product_id: productId.trim(),
          purchase_id: typeof purchaseId === "string" && purchaseId.trim().length > 0
            ? purchaseId.trim()
            : null,
          platform: platformValue,
          package_name: packageName.trim(),
          verification_status: verificationStatus,
          provider_response: providerResponse ?? {},
          verified_at: new Date().toISOString(),
        });
        return jsonResponse(402, {
          error: "purchase_not_verified",
          verificationStatus,
        });
      }
    } else {
      return jsonResponse(400, {
        error: "unsupported_platform",
        message: "Only android verification is currently supported.",
      });
    }

    const eventInsert = {
      user_id: userId,
      source: source.trim(),
      product_id: productId.trim(),
      purchase_id: typeof purchaseId === "string" && purchaseId.trim().length > 0
        ? purchaseId.trim()
        : null,
      platform: platformValue,
      package_name: typeof packageName === "string" ? packageName.trim() : null,
      verification_status: verificationStatus,
      provider_response: providerResponse ?? {},
      verified_at: new Date().toISOString(),
    };
    const { error: eventError } = await supabaseAdmin
      .from("pro_purchase_events")
      .upsert(eventInsert, { onConflict: "source,purchase_id" });
    if (eventError) {
      return jsonResponse(500, {
        error: "purchase_event_failed",
        message: eventError.message,
      });
    }

    const { error: tierError } = await supabaseAdmin
      .from("user_subscription_tiers")
      .upsert({
        user_id: userId,
        tier: "pro",
        updated_at: new Date().toISOString(),
      }, { onConflict: "user_id" });
    if (tierError) {
      return jsonResponse(500, {
        error: "tier_update_failed",
        message: tierError.message,
      });
    }

    return jsonResponse(200, {
      data: {
        tier: "pro",
        upgraded: true,
      },
    });
  }

  if (path === "/analyze-pantry") {
    const blocked = await enforceUsage(req, "pantry_scan", payload);
    if (blocked) return blocked;

    const imageBase64 = payload["imageBase64"];
    const mode = payload["mode"] ?? "quick";
    const diet = payload["diet"] ?? "none";
    const locale = payload["locale"] ?? "tr";
    const cuisineRegion = payload["cuisineRegion"];
    const hint = payload["survivalExpiryHint"];
    if (typeof imageBase64 !== "string" || imageBase64.trim().length === 0) {
      return jsonResponse(400, { error: "image_required" });
    }

    const prompt =
      `Return ONLY valid JSON with schema { "ingredients": string[], "recipes": [{ "title": string, "cookTime": string, "difficulty": string, "instructions": string[], "nutrition": { "calories": number, "protein_g": number, "carbs_g": number, "fat_g": number, "servings": number } }] }.
Analyze a fridge/pantry image and produce exactly 3 recipes.
Locale: ${locale}
${cuisinePromptBlock(String(locale), cuisineRegion)}
Mode: ${mode}
Diet: ${diet}
${typeof hint === "string" && hint.trim().length > 0 ? `Priority ingredients: ${hint}` : ""}`;

    const response = await geminiGenerate(
      GEMINI_MODEL,
      [{
        parts: [
          { text: prompt },
          { inline_data: { mime_type: "image/jpeg", data: imageBase64 } },
        ],
      }],
      { responseMimeType: "application/json", temperature: 0.25 },
    );
    const finalResponse = response.json
      ? response
      : response.quotaExceeded
      ? response
      : await geminiGenerate(
        GEMINI_FALLBACK_MODEL,
        [{
          parts: [
            { text: prompt },
            { inline_data: { mime_type: "image/jpeg", data: imageBase64 } },
          ],
        }],
        { responseMimeType: "application/json", temperature: 0.25 },
      );

    if (!finalResponse.json) {
      await rollbackUsage(req, "pantry_scan");
      return geminiFailureResponse(finalResponse);
    }
    const text = extractText(finalResponse.json);
    const json = text ? parseLooseJson(text) : null;
    if (!json) {
      await rollbackUsage(req, "pantry_scan");
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: json });
  }

  if (path === "/process-receipt") {
    const blocked = await enforceUsage(req, "receipt_scan", payload);
    if (blocked) return blocked;

    const imageBase64 = payload["imageBase64"];
    const cuisineRegion = payload["cuisineRegion"];
    const locale = payload["locale"] ?? "tr";
    if (typeof imageBase64 !== "string" || imageBase64.trim().length === 0) {
      return jsonResponse(400, { error: "image_required" });
    }

    const prompt = receiptPromptBlock(cuisineRegion, locale);

    const response = await geminiGenerate(
      GEMINI_MODEL,
      [{
        parts: [
          { text: prompt },
          { inline_data: { mime_type: "image/jpeg", data: imageBase64 } },
        ],
      }],
      { responseMimeType: "application/json", temperature: 0.15 },
    );
    const finalResponse = response.json
      ? response
      : response.quotaExceeded
      ? response
      : await geminiGenerate(
        GEMINI_FALLBACK_MODEL,
        [{
          parts: [
            { text: prompt },
            { inline_data: { mime_type: "image/jpeg", data: imageBase64 } },
          ],
        }],
        { responseMimeType: "application/json", temperature: 0.15 },
      );

    if (!finalResponse.json) {
      await rollbackUsage(req, "receipt_scan");
      return geminiFailureResponse(finalResponse);
    }
    const receiptText = extractText(finalResponse.json);
    const receiptJson = receiptText ? parseLooseJson(receiptText) : null;
    if (!receiptJson) {
      await rollbackUsage(req, "receipt_scan");
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: receiptJson });
  }

  if (path === "/generate-from-ingredients") {
    const blocked = await enforceUsage(req, "recipe_from_ingredients", payload);
    if (blocked) return blocked;

    const ingredients = payload["ingredients"];
    const mode = payload["mode"] ?? "survival";
    const diet = payload["diet"] ?? "none";
    const locale = payload["locale"] ?? "tr";
    const cuisineRegion = payload["cuisineRegion"];
    if (!Array.isArray(ingredients) || ingredients.length === 0) {
      return jsonResponse(400, { error: "ingredients_required" });
    }

    const recipePrompt =
      `Return ONLY valid JSON with schema { "ingredients": string[], "recipes": [{ "title": string, "cookTime": string, "difficulty": string, "instructions": string[], "nutrition": { "calories": number, "protein_g": number, "carbs_g": number, "fat_g": number, "servings": number } }] }.
Generate exactly 3 recipes from these ingredients: ${ingredients.join(", ")}
Locale: ${locale}
${cuisinePromptBlock(String(locale), cuisineRegion)}
Mode: ${mode}
Diet: ${diet}`;

    const recipeResult = await runGeminiJsonPrompt(recipePrompt);
    if (!recipeResult.json) {
      await rollbackUsage(req, "recipe_from_ingredients");
      return geminiFailureResponse(recipeResult);
    }
    const text = extractText(recipeResult.json);
    const recipeJson = text ? parseLooseJson(text) : null;
    if (!recipeJson) {
      await rollbackUsage(req, "recipe_from_ingredients");
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: recipeJson });
  }

  if (path === "/translate-recipe") {
    const recipe = payload["recipe"];
    const targetLocale = payload["targetLocale"] ?? "tr";
    const recipeObj = requireObject(recipe);
    if (!recipeObj) return jsonResponse(400, { error: "recipe_required" });

    const translatePrompt =
      `Return ONLY valid JSON for the translated recipe with same schema.
Target locale: ${targetLocale}
Recipe JSON:
${JSON.stringify(recipeObj)}`;

    const translateResult = await runGeminiJsonPrompt(translatePrompt);
    if (!translateResult.json) {
      return geminiFailureResponse(translateResult);
    }
    const translateText = extractText(translateResult.json);
    const translatedJson = translateText ? parseLooseJson(translateText) : null;
    if (!translatedJson) {
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: translatedJson });
  }

  if (path === "/localize-pantry") {
    const result = payload["result"];
    const targetLocale = payload["targetLocale"] ?? "tr";
    const resultObj = requireObject(result);
    if (!resultObj) return jsonResponse(400, { error: "result_required" });

    const localizePrompt =
      `Return ONLY valid JSON for full localized pantry result with same schema.
Target locale: ${targetLocale}
Input JSON:
${JSON.stringify(resultObj)}`;

    const localizeResult = await runGeminiJsonPrompt(localizePrompt);
    if (!localizeResult.json) {
      return geminiFailureResponse(localizeResult);
    }
    const localizeText = extractText(localizeResult.json);
    const localizedJson = localizeText ? parseLooseJson(localizeText) : null;
    if (!localizedJson) {
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: localizedJson });
  }

  // Dev tooling (e.g. scripts/generate_l10n.py) — no usage quota.
  if (path === "/generate-json-prompt") {
    const promptRaw = payload["prompt"];
    if (typeof promptRaw !== "string" || !promptRaw.trim()) {
      return jsonResponse(400, { error: "prompt_required" });
    }
    const model = typeof payload["model"] === "string" && payload["model"].trim()
      ? payload["model"].trim()
      : GEMINI_MODEL;
    const temperature = typeof payload["temperature"] === "number"
      ? payload["temperature"]
      : 0.1;
    let result = await geminiGenerate(
      model,
      [{ parts: [{ text: promptRaw }] }],
      { responseMimeType: "application/json", temperature },
    );
    if (!result.json && !result.quotaExceeded && model !== GEMINI_FALLBACK_MODEL) {
      result = await geminiGenerate(
        GEMINI_FALLBACK_MODEL,
        [{ parts: [{ text: promptRaw }] }],
        { responseMimeType: "application/json", temperature },
      );
    }
    if (!result.json) {
      return geminiFailureResponse(result);
    }
    const text = extractText(result.json);
    if (!text) {
      return jsonResponse(502, { error: "invalid_model_response" });
    }
    return jsonResponse(200, { data: { text } });
  }

  return jsonResponse(404, { error: "not_found" });
});
