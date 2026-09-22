"""Generate Play Store phone screenshots (1080x1920, 9:16)."""
from __future__ import annotations

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
OUT_DIR = ROOT / "assets" / "store" / "screenshots"
OUT_DIR.mkdir(parents=True, exist_ok=True)

W, H = 1080, 1920

# Neon theme (app default)
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


def rounded_rect(
    draw: ImageDraw.ImageDraw,
    xy: tuple[int, int, int, int],
    radius: int,
    fill: tuple[int, ...],
    outline: tuple[int, ...] | None = None,
    width: int = 1,
) -> None:
    draw.rounded_rectangle(xy, radius=radius, fill=fill, outline=outline, width=width)


def vertical_gradient(size: tuple[int, int]) -> Image.Image:
    w, h = size
    top = (39, 39, 46)
    bottom = BG
    img = Image.new("RGB", size, BG)
    draw = ImageDraw.Draw(img)
    for y in range(h):
        t = y / max(h - 1, 1)
        color = tuple(int(top[i] * (1 - t) + bottom[i] * t) for i in range(3))
        draw.line([(0, y), (w, y)], fill=color)
    return img


def draw_status_bar(draw: ImageDraw.ImageDraw) -> None:
    draw.rectangle((0, 0, W, 56), fill=BG)
    font = load_font(24)
    draw.text((40, 16), "21:24", font=font, fill=TEXT)
    draw.text((W - 120, 16), "100%", font=font, fill=TEXT)


def draw_app_bar(draw: ImageDraw.ImageDraw, title: str, actions: bool = True) -> None:
    draw.rectangle((0, 56, W, 168), fill=BG)
    draw.text((40, 98), title, font=load_font(44, bold=True), fill=TEXT)
    if actions:
        draw.ellipse((W - 120, 92, W - 72, 140), outline=BORDER, width=2)
        draw.ellipse((W - 64, 92, W - 16, 140), outline=BORDER, width=2)


def draw_nav_bar(draw: ImageDraw.ImageDraw, selected: int) -> None:
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
            draw.ellipse((cx - 6, iy + 6, cx + 6, iy + 18), outline=color, width=2)
        elif i == 1:
            draw.rectangle((cx - 14, iy + 4, cx + 14, iy + 22), outline=color, width=3)
            draw.line([(cx - 14, iy + 10), (cx + 14, iy + 10)], fill=color, width=2)
        else:
            draw.arc((cx - 14, iy + 8, cx - 2, iy + 22), 0, 180, fill=color, width=3)
            draw.line([(cx - 14, iy + 15), (cx - 14, iy + 22)], fill=color, width=3)
            draw.line([(cx - 2, iy + 15), (cx - 2, iy + 22)], fill=color, width=3)
            draw.line([(cx + 2, iy + 12), (cx + 14, iy + 12)], fill=color, width=3)
        draw.text((cx - 52, y0 + 68), label, font=load_font(22), fill=color)


def save(name: str, img: Image.Image) -> Path:
    path = OUT_DIR / name
    img.convert("RGB").save(path, "PNG", optimize=True)
    return path


def screenshot_scan() -> Path:
    img = vertical_gradient((W, H))
    draw = ImageDraw.Draw(img)
    draw_status_bar(draw)
    draw_app_bar(draw, "CyberChef")
    draw_nav_bar(draw, 0)

    # Camera preview area
    rounded_rect(draw, (40, 200, W - 40, 920), 28, (18, 18, 22), outline=BORDER, width=2)
    draw.text((W // 2 - 180, 480), "Receipt · Barcode · Pantry", font=load_font(30), fill=TEXT_SEC)

    # Mode chips
    modes = ["Receipt", "Barcode", "Pantry", "Survival"]
    x = 56
    for i, mode in enumerate(modes):
        fill = PRIMARY if i == 0 else SURFACE_ELEV
        tw = 180
        rounded_rect(draw, (x, 960, x + tw, 1020), 20, fill)
        draw.text((x + 24, 972), mode, font=load_font(24), fill=TEXT if i == 0 else TEXT_SEC)
        x += tw + 16

    # Hint card
    rounded_rect(draw, (40, 1060, W - 40, 1280), 24, SURFACE, outline=BORDER, width=1)
    draw.text((72, 1100), "Point at your receipt", font=load_font(34, bold=True), fill=TEXT)
    draw.text((72, 1158), "AI reads items and expiry dates automatically", font=load_font(26), fill=TEXT_MUTED)

    # Recent scans strip
    draw.text((40, 1320), "Recent scans", font=load_font(28, bold=True), fill=TEXT_SEC)
    for i in range(3):
        x = 40 + i * 220
        rounded_rect(draw, (x, 1370, x + 190, 1580), 20, SURFACE_ELEV, outline=BORDER, width=1)
        draw.text((x + 50, 1450), f"Scan {i + 1}", font=load_font(24), fill=TEXT_MUTED)

    # Shutter button
    draw.ellipse((W // 2 - 56, H - 280, W // 2 + 56, H - 168), outline=PRIMARY_LIGHT, width=6)
    draw.ellipse((W // 2 - 40, H - 264, W // 2 + 40, H - 184), fill=PRIMARY)

    return save("01_scan_receipt.png", img)


def draw_freshness_item(
    draw: ImageDraw.ImageDraw,
    y: int,
    name: str,
    days: str,
    urgency: str,
) -> None:
    colors = {"critical": ERROR, "warning": WARNING, "safe": SUCCESS}
    dot = colors.get(urgency, TEXT_MUTED)
    rounded_rect(draw, (40, y, W - 40, y + 120), 20, SURFACE, outline=BORDER, width=1)
    draw.ellipse((72, y + 44, 96, y + 68), fill=dot)
    draw.text((120, y + 28), name, font=load_font(32, bold=True), fill=TEXT)
    draw.text((120, y + 72), days, font=load_font(24), fill=TEXT_MUTED)
    badge = urgency.capitalize()
    badge_bg = tuple(max(0, c - 40) for c in dot)
    rounded_rect(draw, (W - 200, y + 38, W - 72, y + 82), 16, badge_bg)
    draw.text((W - 178, y + 46), badge, font=load_font(22), fill=dot)


def screenshot_freshness() -> Path:
    img = vertical_gradient((W, H))
    draw = ImageDraw.Draw(img)
    draw_status_bar(draw)
    draw_nav_bar(draw, 1)

    draw.text((40, 88), "Freshness", font=load_font(48, bold=True), fill=TEXT)

    # Bento summary
    rounded_rect(draw, (40, 180, W - 40, 420), 28, SURFACE, outline=BORDER, width=1)
    draw.text((72, 220), "This week", font=load_font(28), fill=TEXT_SEC)
    stats = [("3", "Critical", ERROR), ("5", "Soon", WARNING), ("12", "Fresh", SUCCESS)]
    for i, (num, label, color) in enumerate(stats):
        x = 72 + i * 300
        draw.text((x, 280), num, font=load_font(56, bold=True), fill=color)
        draw.text((x, 350), label, font=load_font(24), fill=TEXT_MUTED)

    # Filter chips
    filters = ["All", "Critical", "Warning", "Safe"]
    x = 40
    for i, f in enumerate(filters):
        fill = PRIMARY if i == 0 else SURFACE_ELEV
        rounded_rect(draw, (x, 450, x + 140, 510), 20, fill)
        draw.text((x + 28, 462), f, font=load_font(24), fill=TEXT if i == 0 else TEXT_SEC)
        x += 156

    items = [
        ("Tomato", "Expires in 1 day", "critical"),
        ("Milk", "Expires in 3 days", "warning"),
        ("Eggs", "Expires in 8 days", "safe"),
        ("Chicken breast", "Expires in 2 days", "warning"),
        ("Basil", "Expires today", "critical"),
    ]
    y = 540
    for name, days, urgency in items:
        draw_freshness_item(draw, y, name, days, urgency)
        y += 136

    return save("02_freshness_tracking.png", img)


def screenshot_shopping() -> Path:
    img = vertical_gradient((W, H))
    draw = ImageDraw.Draw(img)
    draw_status_bar(draw)
    draw_app_bar(draw, "Shopping")
    draw_nav_bar(draw, 2)

    # Input row
    rounded_rect(draw, (40, 200, W - 120, 280), 20, SURFACE, outline=BORDER, width=1)
    draw.text((64, 224), "Add item…", font=load_font(28), fill=TEXT_MUTED)
    rounded_rect(draw, (W - 104, 200, W - 40, 280), 20, PRIMARY)
    draw.text((W - 82, 224), "+", font=load_font(36, bold=True), fill=TEXT)

    items = [
        ("Tomatoes", False),
        ("Olive oil", False),
        ("Pasta", False),
        ("Garlic", True),
        ("Parmesan", True),
    ]
    y = 320
    for name, checked in items:
        rounded_rect(draw, (40, y, W - 40, y + 96), 18, SURFACE, outline=BORDER, width=1)
        box = (64, y + 28, 104, y + 68)
        if checked:
            rounded_rect(draw, box, 8, PRIMARY)
            draw.text((74, y + 32), "✓", font=load_font(24), fill=TEXT)
        else:
            rounded_rect(draw, box, 8, SURFACE_ELEV, outline=BORDER, width=2)
        color = TEXT_MUTED if checked else TEXT
        draw.text((128, y + 30), name, font=load_font(32), fill=color)
        y += 112

    draw.text((40, y + 20), "Done", font=load_font(26, bold=True), fill=TEXT_MUTED)
    return save("03_shopping_list.png", img)


def screenshot_recipes() -> Path:
    img = vertical_gradient((W, H))
    draw = ImageDraw.Draw(img)
    draw_status_bar(draw)
    draw.rectangle((0, 56, W, 168), fill=BG)
    draw.text((40, 98), "Recipe ideas", font=load_font(44, bold=True), fill=TEXT)
    draw.text((40, 200), "Based on items expiring soon", font=load_font(28), fill=TEXT_MUTED)

    recipes = [
        ("Tomato Basil Pasta", "15 min · Easy · 4 servings", "Uses tomato, basil"),
        ("Shakshuka", "25 min · Medium · 2 servings", "Uses tomato, eggs"),
        ("Chicken Stir Fry", "20 min · Easy · 3 servings", "Uses chicken, garlic"),
    ]
    y = 280
    for title, meta, uses in recipes:
        rounded_rect(draw, (40, y, W - 40, y + 260), 24, SURFACE, outline=BORDER, width=1)
        rounded_rect(draw, (40, y, W - 40, y + 140), 24, SURFACE_ELEV)
        draw.text((72, y + 160), title, font=load_font(34, bold=True), fill=TEXT)
        draw.text((72, y + 210), meta, font=load_font(24), fill=TEXT_SEC)
        draw.text((72, y + 248), uses, font=load_font(22), fill=PRIMARY_LIGHT)
        y += 290

    rounded_rect(draw, (40, H - 260, W - 40, H - 160), 24, PRIMARY)
    draw.text((W // 2 - 200, H - 228), "Get AI recipe suggestions", font=load_font(30, bold=True), fill=TEXT)

    return save("04_ai_recipes.png", img)


def screenshot_barcode() -> Path:
    img = vertical_gradient((W, H))
    draw = ImageDraw.Draw(img)
    draw_status_bar(draw)
    draw_app_bar(draw, "CyberChef")
    draw_nav_bar(draw, 0)

    rounded_rect(draw, (40, 200, W - 40, 780), 28, (12, 12, 16), outline=PRIMARY_LIGHT, width=3)
    # Barcode lines
    x = 120
    while x < W - 120:
        w = 4 if x % 11 else 8
        h = 280 + (x % 5) * 20
        draw.rectangle((x, 420, x + w, 420 + h), fill=TEXT)
        x += w + 3

    draw.text((W // 2 - 220, 820), "Scan product barcode", font=load_font(34, bold=True), fill=TEXT)
    draw.text((W // 2 - 280, 880), "Add to pantry with expiry tracking", font=load_font(26), fill=TEXT_MUTED)

    rounded_rect(draw, (40, 980, W - 40, 1180), 24, SURFACE, outline=BORDER, width=1)
    draw.text((72, 1020), "Detected: Organic Milk 1L", font=load_font(32, bold=True), fill=TEXT)
    draw.text((72, 1078), "Expiry: Jun 2, 2026 · Dairy", font=load_font(26), fill=TEXT_SEC)
    draw.text((72, 1128), "Tap to add to Freshness list", font=load_font(24), fill=PRIMARY_LIGHT)

    return save("05_barcode_scan.png", img)


def main() -> None:
    paths = [
        screenshot_scan(),
        screenshot_freshness(),
        screenshot_shopping(),
        screenshot_recipes(),
        screenshot_barcode(),
    ]
    for p in paths:
        im = Image.open(p)
        assert im.size == (W, H), f"{p.name} wrong size {im.size}"
        assert im.size[0] / im.size[1] == pytest_ratio(), f"{p.name} not 9:16"
        print(f"{p.name}: {im.size[0]}x{im.size[1]} ({p.stat().st_size // 1024} KB)")


def pytest_ratio() -> float:
    return 9 / 16


if __name__ == "__main__":
    main()
