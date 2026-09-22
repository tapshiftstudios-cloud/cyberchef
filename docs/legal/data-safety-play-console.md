# Play Console — Data safety (Veri güvenliği) rehberi

CyberChef için **App content → Data safety** formunu doldururken kullan.

## Genel

| Soru | Yanıt |
|------|--------|
| Veri topluyor musunuz? | **Evet** |
| Veriler şifrelenerek aktarılıyor mu? | **Evet** (HTTPS) |
| Kullanıcı veri silme talep edebilir mi? | **Evet** (e-posta veya uygulama içi) |

## Veri türleri

### Konum
- **Hayır** (GPS kullanılmıyor)

### Kişisel bilgiler
| Tür | Toplanıyor | Paylaşılıyor | Amaç |
|-----|------------|--------------|------|
| E-posta | Evet | Supabase (işlemci) | Hesap, oturum |
| Kullanıcı kimlikleri | Evet | Supabase | Hesap |

### Fotoğraflar ve videolar
| Tür | Toplanıyor | Paylaşılıyor | Amaç |
|-----|------------|--------------|------|
| Fotoğraflar | Evet | Google Gemini (işlem) | AI tarama, tarif |

Not: Fiş fotoğrafları kalıcı saklanmaz; yalnızca ürün listesi kaydedilir.

### Uygulama etkinliği
| Tür | Toplanıyor | Amaç |
|-----|------------|------|
| Uygulama etkileşimleri | Evet (limit sayaçları) | Kötüye kullanım önleme |
| Diğer eylemler | Evet | Tarama geçmişi (isteğe bağlı bulut) |

### Cihaz veya diğer kimlikler
| Tür | Toplanıyor | Paylaşılıyor | Amaç |
|-----|------------|--------------|------|
| Cihaz kimliği | Evet (anonim) | Supabase | AI limit |
| Reklam kimliği | Evet (ücretsiz plan) | Google AdMob | Reklam |

### Finansal bilgiler
- **Hayır** (ödeme Google Play üzerinden; kart bilgisi uygulamaya gelmez)

## Güvenlik uygulamaları

- Veri aktarımında şifreleme: **Evet**
- Kullanıcı veri silme: **Evet** — tapshiftstudios@hotmail.com

## Gizlilik politikası URL

`https://sites.google.com/view/cyberchefprivacy/ana-sayfa`

## Hesap silme URL (Play Console zorunlu)

`https://tuuqhigltzolmxxgozhp.supabase.co/storage/v1/object/public/legal/account-deletion.html`

## Veri silme URL (kısmi silme, hesap silmeden)

`https://tuuqhigltzolmxxgozhp.supabase.co/storage/v1/object/public/legal/data-deletion.html`

## Reklam beyanı

- Uygulama **reklam içerir** (AdMob)
- Pro abonelikte reklam yok

## İçerik derecelendirmesi (IARC)

Tipik yanıtlar (mutfak / alışveriş uygulaması):
- Şiddet: Yok
- Cinsellik: Yok
- Küfür: Yok
- Kontrollü madde: Yok
- Kullanıcı etkileşimi: Hesap oluşturma var
- Konum paylaşımı: Yok
- Dijital satın alma: **Evet** (Pro abonelik)
