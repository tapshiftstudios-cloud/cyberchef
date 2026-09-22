"""Generate English Play Store screenshots with sample app content (1080x1920)."""
from __future__ import annotations

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
OUT_DIR = ROOT / "assets" / "store" / "screenshots_en"
OUT_DIR.mkdir(parents=True, exist_ok=True)

W, H = 1080, 1920
BG = (28, 28, 34)
SURFACE = (39, 39, 46)
SURFACE_ELEV = (50, 50, 59)
PRIMARY = (2, 150, 94)
PRIMARY_LIGHT = (16, 185, 129)
TEXT = (248, 250, 252)
TEXT_SEC = (180, 188, 200)
TEXT_MUTED = (123, 132, 148)
BORDER = (64, 64, 74)
ERROR = (239, 68, 68)
WARNING = (245, 158, 11)
SUCCESS = PRIMARY


def load_font(size: int, bold: bool = False) -> ImageFont.FreeTypeFont:
    name = "segoeuib.ttf" if bold else "segoeui.ttf"
    path = Path(rf"C:\Windows\Fonts\{name}")
    if path.exists():
        return ImageFont.truetype(str(path), size)
    return ImageFont.load_default()


def rounded_rect(draw, xy, radius, fill, outline=None, width=1):
    draw.rounded_rectangle(xy, radius=radius, fill=fill, outline=outline, width=width)


def gradient(size):
    w, h = size
    img = Image.new("RGB", size, BG)
    d = ImageDraw.Draw(img)
    top, bottom = (39, 39, 46), BG
    for y in range(h):
        t = y / max(h - 1, 1)
        c = tuple(int(top[i] * (1 - t) + bottom[i] * t) for i in range(3))
        d.line([(0, y), (w, y)], fill=c)
    return img


def status_bar(draw):
    draw.rectangle((0, 0, W, 56), fill=BG)
    f = load_font(24)
    draw.text((40, 16), "9:41", font=f, fill=TEXT)
    draw.text((W - 120, 16), "100%", font=f, fill=TEXT)


def app_bar(draw, title):
    draw.rectangle((0, 56, W, 168), fill=BG)
    draw.text((40, 98), title, font=load_font(44, bold=True), fill=TEXT)


def nav_bar(draw, selected):
    y0 = H - 120
    draw.rectangle((0, y0, W, H), fill=SURFACE)
    draw.line([(0, y0), (W, y0)], fill=BORDER, width=2)
    labels = ["Scan", "Freshness", "Shopping"]
    for i, label in enumerate(labels):
        cx = W // 6 + i * (W // 3)
        color = PRIMARY_LIGHT if i == selected else TEXT_MUTED
        if i == selected:
            rounded_rect(draw, (cx - 56, y0 + 10, cx + 56, y0 + 58), 24, (2, 80, 55))
        iy = y0 + 22
        if i == 0:
            draw.rectangle((cx - 14, iy, cx + 14, iy + 20), outline=color, width=3)
        elif i == 1:
            draw.rectangle((cx - 14, iy + 4, cx + 14, iy + 22), outline=color, width=3)
            draw.line([(cx - 14, iy + 10), (cx + 14, iy + 10)], fill=color, width=2)
        else:
            draw.arc((cx - 14, iy + 8, cx - 2, iy + 22), 0, 180, fill=color, width=3)
            draw.line([(cx + 2, iy + 12), (cx + 14, iy + 12)], fill=color, width=3)
        draw.text((cx - 52, y0 + 68), label, font=load_font(22), fill=color)


def save(name, img):
    path = OUT_DIR / name
    img.convert("RGB").save(path, "PNG", optimize=True)
    return path


def scan_pantry():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    app_bar(d, "CyberChef")
    nav_bar(d, 0)

    tabs = ["Fridge", "Receipt", "Barcode"]
    x = 56
    for i, tab in enumerate(tabs):
        fill = PRIMARY if i == 0 else SURFACE_ELEV
        rounded_rect(d, (x, 200, x + 220, 280), 20, fill)
        d.text((x + 36, 228), tab, font=load_font(28), fill=TEXT if i == 0 else TEXT_SEC)
        x += 236

    rounded_rect(d, (40, 320, W - 40, 980), 28, (18, 18, 22), outline=BORDER, width=2)
    d.ellipse((W // 2 - 70, 520, W // 2 + 70, 660), outline=PRIMARY_LIGHT, width=5)
    d.text((W // 2 - 250, 700), "Tap to open camera", font=load_font(30), fill=TEXT_SEC)

    modes = [
        ("Quick scan", "Recipes under 15 min", True),
        ("Rescue", "Use expiring items first", False),
        ("Chef mode", "Gourmet & detailed", False),
    ]
    x = 40
    for title, sub, active in modes:
        rounded_rect(d, (x, 1020, x + 310, 1240), 22, SURFACE, outline=PRIMARY if active else BORDER, width=2)
        d.text((x + 24, 1060), title, font=load_font(28, bold=True), fill=TEXT)
        d.text((x + 24, 1110), sub, font=load_font(22), fill=TEXT_MUTED)
        x += 330

    d.text((40, 1280), "Recent scans", font=load_font(28, bold=True), fill=TEXT_SEC)
    cards = ["Tomato Basil Pasta", "Spinach Omelette"]
    for i, title in enumerate(cards):
        x = 40 + i * 500
        rounded_rect(d, (x, 1330, x + 460, 1520), 20, SURFACE_ELEV, outline=BORDER)
        d.text((x + 24, 1390), title, font=load_font(26, bold=True), fill=TEXT)
        d.text((x + 24, 1440), "Sample scan", font=load_font(22), fill=TEXT_MUTED)
    return save("01_scan_pantry.png", img)


def scan_receipt():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    app_bar(d, "CyberChef")
    nav_bar(d, 0)

    tabs = ["Fridge", "Receipt", "Barcode"]
    x = 56
    for i, tab in enumerate(tabs):
        fill = PRIMARY if i == 1 else SURFACE_ELEV
        rounded_rect(d, (x, 200, x + 220, 280), 20, fill)
        d.text((x + 36, 228), tab, font=load_font(28), fill=TEXT if i == 1 else TEXT_SEC)
        x += 236

    rounded_rect(d, (40, 320, W - 40, 760), 24, SURFACE, outline=BORDER)
    d.text((72, 360), "Receipt scan & freshness tracking", font=load_font(34, bold=True), fill=TEXT)
    d.text((72, 420), "Keep the receipt straight in good light.", font=load_font(26), fill=TEXT_MUTED)
    rounded_rect(d, (120, 500, W - 120, 700), 20, (18, 18, 22), outline=PRIMARY_LIGHT, width=2)
    d.text((W // 2 - 180, 580), "Tap to scan receipt", font=load_font(28), fill=TEXT_SEC)
    return save("02_scan_receipt.png", img)


def freshness():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    nav_bar(d, 1)
    d.text((40, 88), "Freshness", font=load_font(48, bold=True), fill=TEXT)

    rounded_rect(d, (40, 180, W - 40, 420), 28, SURFACE, outline=BORDER)
    stats = [("3", "Critical", ERROR), ("3", "Soon", WARNING), ("2", "Fresh", SUCCESS)]
    for i, (num, label, color) in enumerate(stats):
        x = 72 + i * 300
        d.text((x, 280), num, font=load_font(56, bold=True), fill=color)
        d.text((x, 350), label, font=load_font(24), fill=TEXT_MUTED)

    items = [
        ("Tomato", "Expires in 1 day", ERROR),
        ("Basil", "Expires today", ERROR),
        ("Chicken breast", "Expires in 2 days", WARNING),
        ("Milk", "Expires in 3 days", WARNING),
        ("Spinach", "Expires in 4 days", WARNING),
        ("Eggs", "Expires in 8 days", SUCCESS),
    ]
    y = 450
    for name, days, color in items:
        rounded_rect(d, (40, y, W - 40, y + 110), 18, SURFACE, outline=BORDER)
        d.ellipse((72, y + 40, 96, y + 64), fill=color)
        d.text((120, y + 24), name, font=load_font(30, bold=True), fill=TEXT)
        d.text((120, y + 64), days, font=load_font(22), fill=TEXT_MUTED)
        y += 124
    return save("03_freshness.png", img)


def shopping():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    app_bar(d, "Shopping")
    nav_bar(d, 2)

    rounded_rect(d, (40, 200, W - 120, 280), 20, SURFACE, outline=BORDER)
    d.text((64, 224), "Add missing ingredient…", font=load_font(28), fill=TEXT_MUTED)
    rounded_rect(d, (W - 104, 200, W - 40, 280), 20, PRIMARY)
    d.text((W - 82, 224), "+", font=load_font(36, bold=True), fill=TEXT)

    items = [
        ("Olive oil", False),
        ("Pasta", False),
        ("Garlic", False),
        ("Onion", True),
        ("Canned tomatoes", True),
    ]
    y = 320
    for name, checked in items:
        rounded_rect(d, (40, y, W - 40, y + 96), 18, SURFACE, outline=BORDER)
        box = (64, y + 28, 104, y + 68)
        if checked:
            rounded_rect(d, box, 8, PRIMARY)
            d.text((74, y + 32), "✓", font=load_font(24), fill=TEXT)
        else:
            rounded_rect(d, box, 8, SURFACE_ELEV, outline=BORDER, width=2)
        color = TEXT_MUTED if checked else TEXT
        d.text((128, y + 30), name, font=load_font(32), fill=color)
        y += 112
    return save("04_shopping.png", img)


def recipes():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    d.text((40, 98), "Recipe ideas", font=load_font(44, bold=True), fill=TEXT)
    d.text((40, 170), "Based on items expiring soon", font=load_font(28), fill=TEXT_MUTED)

    data = [
        ("Tomato Basil Pasta", "15 min · Easy · 420 kcal", "Uses tomato, basil, parmesan"),
        ("Shakshuka with Eggs", "25 min · Medium · 310 kcal", "Uses tomato, eggs"),
        ("Chicken Veggie Stir Fry", "20 min · Easy · 380 kcal", "Uses chicken, spinach"),
    ]
    y = 240
    for title, meta, uses in data:
        rounded_rect(d, (40, y, W - 40, y + 280), 24, SURFACE, outline=BORDER)
        rounded_rect(d, (40, y, W - 40, y + 150), 24, SURFACE_ELEV)
        d.text((72, y + 170), title, font=load_font(34, bold=True), fill=TEXT)
        d.text((72, y + 220), meta, font=load_font(24), fill=TEXT_SEC)
        d.text((72, y + 258), uses, font=load_font(22), fill=PRIMARY_LIGHT)
        y += 300
    return save("05_recipes.png", img)


def favorites():
    img = gradient((W, H))
    d = ImageDraw.Draw(img)
    status_bar(d)
    app_bar(d, "Favorites")
    cards = [
        ("Tomato Basil Pasta", "Quick scan · Saved 2 days ago"),
        ("Shakshuka with Eggs", "Rescue mode · Saved 5 days ago"),
        ("Chicken Veggie Stir Fry", "Chef mode · Saved 1 week ago"),
    ]
    y = 200
    for title, meta in cards:
        rounded_rect(d, (40, y, W - 40, y + 200), 22, SURFACE, outline=BORDER)
        rounded_rect(d, (40, y, W - 40, y + 110), 22, (45, 90, 70))
        d.text((72, y + 130), title, font=load_font(32, bold=True), fill=TEXT)
        d.text((72, y + 172), meta, font=load_font(22), fill=TEXT_MUTED)
        y += 220
    return save("06_favorites.png", img)


def main():
    for fn in (scan_pantry, scan_receipt, freshness, shopping, recipes, favorites):
        path = fn()
        print(f"{path.name}: {path.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
