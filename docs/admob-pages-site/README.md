# AdMob `app-ads.txt` (GitHub Pages root)

AdMob crawls **`https://tapshiftstudios-cloud.github.io/app-ads.txt`** (domain root), not `/cyberchef/app-ads.txt`.

Publish once:

```powershell
gh auth login
cd D:\CyberChef\cyberchef_flutter
powershell -ExecutionPolicy Bypass -File .\tool\publish_admob_pages_root.ps1
```

Then in **Play Console → Store listing**, set **Website** to `https://tapshiftstudios-cloud.github.io` and in AdMob click **Güncellemeleri kontrol edin**.
