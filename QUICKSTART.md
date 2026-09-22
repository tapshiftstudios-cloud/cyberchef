# CyberChef — Hızlı başlangıç (Windows)

## Otomatik kurulum (tek komut)

PowerShell’i **Yönetici olmadan** açın:

```powershell
cd D:\CyberChef\cyberchef_flutter
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\setup_windows.ps1
```

Bu script:
1. Flutter SDK’yı `D:\flutter` konumuna indirir / açar (~1.8 GB, internet hızına bağlı)
2. PATH’e ekler
3. `flutter create` + `flutter pub get` çalıştırır

Ardından izinleri ekleyin:

```powershell
.\scripts\apply_permissions.ps1
```

## Cursor

1. **File → Open Folder** → `D:\CyberChef\cyberchef_flutter`
2. Extensions: **Flutter** + **Dart** yükleyin
3. `.env` dosyasını doldurun (`.env.example` kopyası)

## API anahtarları

| Değişken | Nereden |
|----------|---------|
| `GEMINI_API_KEY` | [Google AI Studio](https://aistudio.google.com/apikey) |
| `SUPABASE_URL` | Supabase → Settings → API |
| `SUPABASE_ANON_KEY` | Aynı sayfa |

Supabase SQL (bir kez): `supabase/migrations/001_pantry_scans.sql`  
Auth: Email + **Anonymous** açık.

## Çalıştırma

Yeni terminal (PATH için):

```powershell
cd D:\CyberChef\cyberchef_flutter
flutter devices
flutter run
```

Fiziksel telefon önerilir (kamera).

## Sorun giderme

| Sorun | Çözüm |
|-------|--------|
| `flutter` tanınmıyor | Terminali kapat/aç; `D:\flutter\bin` PATH’te mi kontrol et |
| Android lisansları | `flutter doctor --android-licenses` → `y` |
| İndirme yarım kaldı | `D:\flutter_sdk.zip` sil, `setup_windows.ps1` tekrar |
