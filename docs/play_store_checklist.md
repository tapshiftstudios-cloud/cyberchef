# Play Store yayın checklist — CyberChef

Bu liste **senin yapacağın** işler ile **kod/repo tarafında** yapılacakları ayırır.  
Hedef: kapalı test → açık test → production.

---

## Özet durum (şu an)

| Alan | Durum |
|------|--------|
| Uygulama özellikleri | Büyük ölçüde hazır |
| Paket adı | `com.cyberchef.pantry` |
| Auth + e-posta onayı (yeşil işaret) | Hazır |
| AI proxy + limitler + Pro tier | Hazır (canlı test gerekli) |
| Play’e yükleme | **Henüz değil** (release imza + mağaza paketi eksik) |

---

## A — Senin yapacakların (Play Console & hesaplar)

### 1. Google Play Console

- [ ] Geliştirici hesabı aktif (tek seferlik kayıt ücreti ödendi)
- [ ] Uygulama oluşturuldu: **CyberChef**, paket `com.cyberchef.pantry`
- [ ] **App signing**: Play App Signing açık; upload key oluşturuldu ve güvenli yerde saklandı

### 2. Supabase (Auth & e-posta)

**Authentication → URL Configuration**

| Alan | Değer |
|------|--------|
| Site URL | `com.cyberchef.pantry://login-callback` |
| Redirect URLs | `com.cyberchef.pantry://login-callback/**` |

- [ ] Eski `localhost:3000` Site URL kaldırıldı / güncellendi
- [ ] E-posta onayı test edildi (mail → uygulama açılır, Ayarlar’da yeşil onay)

### 3. Supabase (Production secrets)

- [ ] `GEMINI_API_KEY` sadece Edge Function secret’ta (istemcide yok)
- [ ] `GOOGLE_SERVICE_ACCOUNT_JSON` secret set (Play abonelik doğrulama için)
- [ ] `ai-proxy` function deploy edildi
- [ ] Migration’lar remote’da uygulandı (`004`–`007`)

### 4. Gizlilik & uyumluluk (zorunlu)

- [ ] **Gizlilik politikası** web sayfası yayında (URL Play’e girilecek)
  - Kamera / galeri, AI işleme (Gemini), Supabase, hesap verisi, cihaz ID (limit için)
- [ ] Play **Data safety** formu dolduruldu (fotoğraf, e-posta, tanımlayıcılar, AI)
- [ ] **İçerik derecelendirmesi** anketi tamamlandı
- [ ] Hedef kitle / çocuklar politikası netleştirildi

### 5. Mağaza listesi

- [ ] Uygulama adı (TR + EN store listing isteğe bağlı)
- [ ] Kısa açıklama (80 karakter)
- [ ] Uzun açıklama
- [ ] Ekran görüntüleri: telefon, en az 2 dilde veya İngilizce + Türkçe metinli
- [ ] Feature graphic (1024×500)
- [ ] Yüksek çözünürlüklü ikon (512×512) — launcher ile uyumlu

### 6. Abonelik (Pro) — Play tarafı

- [ ] Abonelik ürünleri oluşturuldu (aylık / yıllık)
- [ ] Product ID’ler `.env` / `--dart-define` ile uygulamadakiyle **birebir aynı**
- [ ] **License testers** eklendi (kendi Gmail hesapların)
- [ ] Test satın alma: satın al → Ayarlar’da **Pro** limitleri / PRO rozeti
- [ ] Service account Play Console’da uygulamaya davetli (abonelik okuma izni)

### 7. Test süreci

- [ ] **Internal testing** track’e ilk AAB yüklendi
- [ ] 12–20 tester, 1–2 hafta geri bildirim
- [ ] **Closed testing** → gerekirse **Open testing** → Production

### 8. Yasal / iş

- [ ] Destek e-postası (Play’de zorunlu alan)
- [ ] İsteğe bağlı: Kullanım şartları URL’si
- [ ] AI kullanımı ve kota metinleri kullanıcıya anlaşılır (uygulama içi + mağaza açıklaması)

---

## B — Kod / repo tarafı (geliştirme)

### Bloker (yayın öncesi şart)

| # | Görev | Durum |
|---|--------|--------|
| B1 | **Release signing** (`android/app/build.gradle.kts` + `key.properties`, debug key kaldır) | Yapılacak |
| B2 | Production build komutu dokümante: `appbundle` + `--dart-define` listesi | Kısmen (README) |
| B3 | Release’te `AI_PROXY_REQUIRED=true`, istemcide `GEMINI_API_KEY` yok | Yapılandırma |
| B4 | Play abonelik **sunucu doğrulama** (purchase token → tier `pro`) tam ve testli | Kısmen |
| B5 | `flutter test` + release smoke test checklist | Mevcut QA doc |

### Önemli (ilk sürüm kalitesi)

| # | Görev | Durum |
|---|--------|--------|
| B6 | Gizlilik metni uygulama içi (`Settings → Privacy`) mağaza politikasıyla uyumlu | Metin var, URL eşleşmeli |
| B7 | Pro ürün yoksa / mağaza kapalıysa Upgrade butonunda anlamlı mesaj | Kısmen |
| B8 | Sentry `SENTRY_DSN` release build’de | Opsiyonel env |
| B9 | Version `versionCode` / `versionName` artış süreci | `pubspec.yaml` 1.0.0+1 |
| B10 | ProGuard / R8 release (gerekirse) | Varsayılan Flutter |

### İsteğe bağlı (sonraki sürüm)

- [ ] Restore purchases butonu
- [ ] Abonelik iptal / yönetim deep link (Play abonelikler sayfası)
- [ ] RTDN (Real-time developer notifications) ile otomatik tier düşürme

---

## C — Production build örneği

Yerel `.env` veya CI secret’larından (örnek):

```bash
flutter build appbundle --release \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON_KEY=... \
  --dart-define=AI_BACKEND_PROXY_URL=https://<project>.supabase.co/functions/v1/ai-proxy \
  --dart-define=AI_PROXY_REQUIRED=true \
  --dart-define=IAP_PRO_MONTHLY_ID=... \
  --dart-define=IAP_PRO_YEARLY_ID=... \
  --dart-define=SENTRY_DSN=...
```

**İstemciye koyma:** `GEMINI_API_KEY`

Çıktı: `build/app/outputs/bundle/release/app-release.aab` → Play Console → Testing → Internal testing → Create release.

---

## D — Önerilen sıra (2–4 hafta)

### Hafta 1 — Teknik kapanış
1. B1 Release signing (sen: upload key, ben: gradle)
2. B3 Production env doğrulama
3. Supabase URL + secrets kontrol (A2, A3)
4. İlk **internal** AAB yükleme (A7)

### Hafta 2 — Mağaza & uyumluluk
1. Gizlilik URL + Data safety (A4)
2. Mağaza görselleri ve metinler (A5)
3. Kapalı test geri bildirimleri

### Hafta 3 — Pro (istersen aynı sürümde)
1. Play abonelik ürünleri (A6)
2. B4 Sunucu doğrulama canlı test
3. Pro limitleri uçtan uca test

### Hafta 4 — Production
1. Son QA (`docs/QA_CHECKLIST.md` TR + EN)
2. Production track’e promote
3. Kademeli yayın (%10 → %50 → %100)

---

## E — “Soft launch” alternatifi (daha güvenli)

İlk production sürümünde:
- Pro satın alma butonu gizli veya “Yakında”
- Sadece Free limitler + AI proxy zorunlu
- 1–2 hafta maliyet ve stabilite izleme
- Sonra Pro’yu aç

---

## Hızlı kontrol — yayınlamadan önce son 10 madde

1. [ ] AAB release imzalı (debug değil)
2. [ ] Paket adı Play ile aynı: `com.cyberchef.pantry`
3. [ ] Gizlilik politikası URL canlı
4. [ ] Data safety gönderildi
5. [ ] AI sadece proxy üzerinden (key sunucuda)
6. [ ] E-posta onay linki uygulamayı açıyor
7. [ ] TR + EN ana ekranlar test edildi
8. [ ] Kamera / bildirim izinleri kullanıcıya açıklanıyor
9. [ ] En az bir internal test cihazında release build kuruldu
10. [ ] Destek e-postası Play’de girildi

---

## Sen / ben — kim ne yapar?

| Konu | Kim |
|------|-----|
| Play Console, görseller, gizlilik URL, tester listesi | **Sen** |
| Upload keystore oluşturma | **Sen** (şifreleri sakla) |
| `build.gradle.kts` signing, CI, proxy-only release config | **Kod (ben)** |
| Play purchase server verify iyileştirme | **Kod (ben)** |
| Supabase dashboard tıklamaları, secret paste | **Sen** |
| QA cihazında test | **İkiniz** |

İlk kod adımı önerisi: **B1 Release signing** + **B4 Play doğrulama** bitir, sonra ilk AAB’yi internal track’e yükle.
