# CyberChef — Telefonda baştan sona test listesi

Fiziksel cihazda (USB veya kablosuz debug) uygulamayı sıfırdan dolaşmak için örnek senaryo.  
**İki tur önerilir:** önce **Türkçe**, sonra **Ayarlar → Dil → English**.

**Cihaz:** _______________ · **Android:** _______________ · **Tarih:** _______________

---

## 0. Hazırlık (PC + telefon)

- [ ] Telefonda geliştirici seçenekleri + USB hata ayıklama açık
- [ ] `.env` içinde geçerli `GEMINI_API_KEY` var (AI özellikleri için)
- [ ] İsteğe bağlı: `SUPABASE_URL` + `SUPABASE_ANON_KEY` (bulut / giriş)
- [ ] Test için hazır: 1 buzdolabı fotoğrafı, 1 fiş fotoğrafı, 1 market ürünü barkodu
- [ ] İnternet açık (Wi‑Fi veya mobil veri)
- [ ] Bildirim izni vermeye hazır ol

**Temiz başlangıç (isteğe bağlı):** Ayarlar → Yerel veriyi sil → uygulamayı kapat/aç.

---

## 1. İlk açılış ve genel kabuk

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 1.1 | Uygulamayı ilk kez aç | Splash: logo, CyberChef, tagline, yükleme; takılı kalmaz | |
| 1.2 | Onboarding varsa tamamla | Ana ekrana geçer | |
| 1.3 | Alt sekmeler | **Tarama** · **Tazelik** · **Alışveriş** görünür, metinler doğru dilde | |
| 1.4 | Arka plan | Biraz aydınlık gradient; kartlar okunaklı (çok karanlık değil) | |
| 1.5 | Uygulamayı kapat → tekrar aç | Son tema/dil korunur | |

---

## 2. Ayarlar (⚙️ Tarama sekmesi sağ üst)

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 2.1 | **Görünüm** → 6 tema dene (Neon, Ocean, Ember, Lavender, Daylight, Cream) | Renkler değişir, metin kontrastı bozulmaz | |
| 2.2 | **Dil** TR ↔ EN | Tüm sekmeler ve diyaloglar güncellenir | |
| 2.3 | **Diyet** (ör. vejetaryen) seç | Kaydedilir | |
| 2.4 | **Tazelik bildirimleri** aç | İzin isteği gelir, kabul edilir | |
| 2.5 | **Günlük hatırlatma saati** değiştir (ör. 18:30) | Saat kaydedilir, alt yazı güncellenir | |
| 2.6 | Bildirimleri kapat → aç | Çökme yok | |
| 2.7 | Favoriler / Pantry geçmişi / Tazelik envanter linkleri | İlgili ekran açılır | |

---

## 3. Tarama sekmesi — Buzdolabı

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 3.1 | Mod: **Hızlı Tarama** | Mod bilgi sheet’i açılır/kapanır | |
| 3.2 | Mod: **Kurtarma** + (varsa) SKT ipucu alanı | Chip / ipucu çalışır | |
| 3.3 | Mod: **Şef Modu** | Seçim kalır | |
| 3.4 | Kamera ile net buzdolabı fotoğrafı çek | Onay sheet → analiz → tarif listesi | |
| 3.5 | Galeriden fotoğraf seç | Aynı akış; çift galeri penceresi açılmaz | |
| 3.6 | Bulanık/karanlık fotoğraf | Kalite uyarısı; iptal veya devam | |
| 3.7 | Tarif kartına dokun | Detay: malzemeler, adımlar, besin (varsa) | |
| 3.8 | Favoriye ekle | Ayarlar → Favoriler’de görünür | |
| 3.9 | Paylaş | Sistem paylaşım sheet’i açılır | |
| 3.10 | Son taramalar şeridi | Geçmiş kayıt görünür (Supabase varsa bulutta da) | |

**Mod doğrulama (gözle):** Hızlı → kısa süreli tarifler üstte; Şef → zor tarifler öne.

---

## 4. Tarama sekmesi — Fiş

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 4.1 | Üstten **Fiş** moduna geç | Fiş ipuçları görünür | |
| 4.2 | Fiş fotoğrafı çek / seç | Ürün listesi sheet; TOPLAM/Kart satırları yok | |
| 4.3 | Birkaç ürün seç → pantry’e ekle | Başarı mesajı; Tazelik’te ürünler | |
| 4.4 | **Uçak modu** aç → fiş çek | Kuyruğa alınır; banner görünür | |
| 4.5 | İnterneti aç → kuyruktan işle | OCR tamamlanır | |

---

## 5. Tarama sekmesi — Barkod

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 5.1 | **Barkod** modu | Kamera / tarama paneli | |
| 5.2 | Bilinen ürün barkodu | Onay sheet → isim/kategori → ekle | |
| 5.3 | Bilinmeyen barkod | Anlaşılır hata; çökme yok | |

---

## 6. Tazelik sekmesi

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 6.1 | **Tasarruf paneli** (üstte) | Kurtarılan / kg / tahmini kazanç; boşsa ipucu | |
| 6.2 | Panele dokun | Tasarruf analitiği: grafik, son kurtarılanlar | |
| 6.3 | Bento: Kritik / Uyarı / Güvenli | Ürünler doğru kutuda | |
| 6.4 | Yakın SKT’li ürüne dokun → **Yemek yapıldı** | Onay → listeden düşer; tasarruf snackbar (kurtarma sayıldıysa) | |
| 6.5 | Listede sağa kaydır (swipe) | Tüketildi işaretlenir | |
| 6.6 | **Bu ürünlerle tarif öner** | AI tarifleri açılır | |
| 6.7 | **Bugün pişir** | Uygun ürünlerle akış | |
| 6.8 | Filtre: kritik / kategori / arama | Liste doğru filtrelenir | |
| 6.9 | Takvim görünümü | Tarihler mantıklı | |
| 6.10 | Birleşik pantry (hub ikonu) | Tüm envanter görünümü | |

---

## 7. Alışveriş sekmesi

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 7.1 | Yeni madde ekle | Listede görünür | |
| 7.2 | Tamamla / sil | Durum güncellenir | |
| 7.3 | Uygulamayı kapat → aç | Liste duruyor | |

---

## 8. Hata ve kenar durumları

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 8.1 | `.env` anahtarı yokken tarif iste | “Servis kullanılamıyor” benzeri mesaj (ham exception değil) | |
| 8.2 | Tarama sırasında uçak modu | Ağ / zaman aşımı mesajı (TR veya EN) | |
| 8.3 | Arka plandan dön | State bozulmaz, çökme yok | |
| 8.4 | Sistem geri tuşu | Mantıklı ekran geçişi | |
| 8.5 | Düşük pil / ekran kilidi sonrası | Uygulama açılır | |

---

## 9. Supabase (yapılandırdıysan)

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 9.1 | Kayıt / giriş / misafir | Auth ekranı akışı | |
| 9.2 | Buzdolabı taraması | Pantry Log’da kayıt | |
| 9.3 | Tazelik ürünü tüket | Senkron hatası snackbar’da anlaşılır (varsa) | |
| 9.4 | Çıkış yap | Çökme yok | |

---

## 10. Widget ve bildirimler (Android)

| # | Adım | Beklenen | ✓ |
|---|------|----------|---|
| 10.1 | Ana ekrana CyberChef widget ekle | Sayılar / alt yazı uygulama diliyle uyumlu | |
| 10.2 | Kritik ürün ekle | (İzin varsa) gün içinde kritik bildirim veya ertesi gün tekrar dene | |
| 10.3 | Ayarladığın saatte | Günlük hatırlatma gelir (ertesi gün kontrol) | |

---

## 11. Performans ve his

- [ ] Splash ~3–4 sn civarı, takılma yok  
- [ ] Tarama analizi sırasında loading overlay  
- [ ] Kaydırma akıcı (Tazelik listesi, tarifler)  
- [ ] Klavye formlarda alanı kapatmıyor  

---

## 12. Hızlı regresyon (günlük build sonrası)

1. Aç → Tarama → 1 buzdolabı fotoğrafı → tarif gör  
2. Tazelik → 1 ürün **Yemek yapıldı** → tasarruf paneli artar  
3. Ayarlar → tema + dil değiştir → geri dön, metinler doğru  
4. Alışveriş → 1 madde ekle  

---

## Not alanı

| Sorun | Ekran | Adımlar | Önem |
|-------|-------|---------|------|
| | | | Düşük / Orta / Yüksek |

---

**Özet skor:** _____ / _____ madde tamam · **Genel:** ☐ Yayınlanabilir ☐ Küçük düzeltme ☐ Bloker var
