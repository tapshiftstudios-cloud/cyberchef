# Google Sign-In (Supabase OAuth)

CyberChef uses Supabase `signInWithOAuth` with Google. Configure once in Supabase + Google Cloud.

## 1. Google Cloud Console

1. Open [Google Cloud Console](https://console.cloud.google.com/) → same project as Gemini if possible.
2. **APIs & Services → Credentials → Create OAuth client ID**
3. Type: **Android**
   - Package name: `com.cyberchef.pantry`
   - SHA-1: release keystore fingerprint (`keytool -list -v -keystore android/app/upload-keystore.jks`)
4. Type: **Web application** (required for Supabase)
   - Authorized redirect URI:  
     `https://tuuqhigltzolmxxgozhp.supabase.co/auth/v1/callback`
5. Copy **Web client ID** and **Client secret**.

## 2. Supabase Dashboard

1. **Authentication → Providers → Google** → Enable
2. Paste Web client ID + secret
3. **Authentication → URL Configuration**
   - Site URL: `com.cyberchef.pantry://login-callback`
   - Redirect URLs: `com.cyberchef.pantry://login-callback/**`

## 3. App

Deep link already in `AndroidManifest.xml`:
`com.cyberchef.pantry://login-callback`

User taps **Continue with Google** on auth screen → browser → returns to app.

## Troubleshooting

| Issue | Fix |
|-------|-----|
| redirect_uri_mismatch | Web client redirect must match Supabase callback URL |
| Sign-in opens but no session | Check redirect URL in Supabase matches manifest |
| DEVELOPER_ERROR on Android | Add SHA-1 for upload + debug keystore in Google Cloud |
