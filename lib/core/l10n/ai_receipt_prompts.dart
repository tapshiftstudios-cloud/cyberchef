import '../enums/app_locale.dart';
import '../enums/cuisine_region.dart';
import 'ai_locale_prompts.dart';

/// Bölgeye göre fiş OCR prompt parçaları.
abstract final class AiReceiptPrompts {
  static String build({
    required CuisineRegion region,
    required AppLocale locale,
  }) {
    final lang = AiLocalePrompts.languageName(locale);
    final stores = _storeChains(region);
    final dates = _dateFormats(region);
    final skip = _skipTerms(region);
    final abbrev = _abbrevHint(region);
    final qty = _quantityExamples(region);

    return '''
You are an expert receipt OCR and grocery intelligence assistant for $stores.

Analyze the shopping receipt image. Extract every food/grocery line item visible.

RULES:
1. Output ONLY valid JSON matching this exact schema (no markdown, no commentary):
{
  "receipt_detected": true,
  "purchase_date": "YYYY-MM-DD if visible on receipt, else null",
  "store_name": "Store name if visible, else null",
  "items": [
    {
      "raw_name": "Strictly the text printed on the receipt",
      "clean_name": "Human-readable product name in natural $lang",
      "quantity": "e.g. $qty",
      "category": "Dairy | Meat | Vegetable | Bakery | Beverage | Frozen | Pantry | Other",
      "estimated_expiry_days": 10,
      "confidence": 0.92,
      "line_price": 45.90
    }
  ]
}

Note: line_price is the line total printed on the receipt (number only, local currency). Omit or null if not visible.

2. receipt_detected must be false if the image is not a grocery/store receipt.
3. purchase_date: parse common local formats ($dates) into YYYY-MM-DD.
4. clean_name must be natural $lang for shoppers in this region (expand abbreviations).
5. confidence: 0.0–1.0 how sure you are this line is a food product with correct clean_name.
6. estimated_expiry_days (no expiry on receipt — predict from category):
   - Fresh raw chicken/meat/fish: 2-4
   - Milk, yogurt: 5-8
   - Soft cheese, deli: 5-10
   - Leafy vegetables, berries: 3-7
   - Bread, bakery: 3-5
   - Eggs: 14-21
   - Potatoes, onions: 21-60
   - Frozen: 90-180
   - Canned/dry: 180-365
7. Skip non-product lines: $skip, bags, discounts, loyalty points, payment, totals, change.
8. line_price: numeric line total when printed next to the product; skip for weight-only deli lines without price.
9. $abbrev
''';
  }

  static String _storeChains(CuisineRegion region) => switch (region) {
        CuisineRegion.turkish =>
          'Turkish supermarkets (Migros, BİM, A101, Şok, CarrefourSA, Metro, Hakmar)',
        CuisineRegion.italian =>
          'Italian supermarkets (Conad, Esselunga, Coop, Lidl, Eurospin, Carrefour, Pam)',
        CuisineRegion.german =>
          'German supermarkets (Aldi, Lidl, Rewe, Edeka, Kaufland, Netto, Penny)',
        CuisineRegion.french =>
          'French supermarkets (Carrefour, Leclerc, Auchan, Intermarché, Monoprix, Lidl)',
        CuisineRegion.spanish =>
          'Spanish supermarkets (Mercadona, Carrefour, Lidl, Dia, Eroski, Alcampo)',
        CuisineRegion.portugueseBrazilian =>
          'Portuguese and Brazilian stores (Continente, Pingo Doce, Pão de Açúcar, Assaí, Carrefour)',
        CuisineRegion.dutch =>
          'Dutch supermarkets (Albert Heijn, Jumbo, Lidl, Aldi, Plus, Dirk)',
        CuisineRegion.polish =>
          'Polish supermarkets (Biedronka, Lidl, Kaufland, Auchan, Carrefour, Żabka)',
        CuisineRegion.russian =>
          'Russian supermarkets (Пятёрочка, Магнит, Лента, Перекрёсток, Ашан)',
        CuisineRegion.japanese =>
          'Japanese supermarkets (Aeon, Ito-Yokado, Life, Seiyu, Lawson, FamilyMart grocery)',
        CuisineRegion.korean =>
          'Korean supermarkets (E-Mart, Lotte Mart, Homeplus, GS25, CU grocery)',
        CuisineRegion.chinese =>
          'Chinese supermarkets (Hema/Freshippo, Yonghui, Walmart, Sam\'s Club, local markets)',
        CuisineRegion.indian =>
          'Indian supermarkets (Big Bazaar, Reliance Fresh, DMart, More, local kirana)',
        CuisineRegion.indonesian =>
          'Indonesian supermarkets (Indomaret, Alfamart, Hypermart, Transmart, Carrefour)',
        CuisineRegion.vietnamese =>
          'Vietnamese supermarkets (WinMart, Co.opmart, Bach Hoa Xanh, Big C, Circle K grocery)',
        CuisineRegion.middleEastern =>
          'Middle Eastern grocery chains (Carrefour, Lulu, Spinneys, Danube, local souq markets)',
        CuisineRegion.ukrainian =>
          'Ukrainian supermarkets (АТБ, Сільпо, Novus, Metro, Varus)',
        CuisineRegion.czech =>
          'Czech supermarkets (Albert, Lidl, Kaufland, Penny, Tesco, Billa)',
        CuisineRegion.romanian =>
          'Romanian supermarkets (Kaufland, Lidl, Carrefour, Mega Image, Penny)',
        CuisineRegion.nordic =>
          'Nordic supermarkets (ICA, Coop, Willys, Rema 1000, K-Market, S-Market)',
        CuisineRegion.greek =>
          'Greek supermarkets (Sklavenitis, AB Vassilopoulos, Lidl, Masoutis)',
        CuisineRegion.hungarian =>
          'Hungarian supermarkets (Tesco, Lidl, Spar, Auchan, Penny, Coop)',
        CuisineRegion.malaysian =>
          'Malaysian supermarkets (Tesco, Giant, Aeon, 99 Speedmart, KK Mart)',
        CuisineRegion.thai =>
          'Thai supermarkets (7-Eleven grocery, Lotus\'s, Big C, Makro, Tops)',
        CuisineRegion.americanBritish =>
          'US/UK grocery stores (Walmart, Kroger, Target, Tesco, Sainsbury\'s, Aldi, Costco)',
      };

  static String _dateFormats(CuisineRegion region) => switch (region) {
        CuisineRegion.turkish || CuisineRegion.german => 'DD.MM.YYYY, DD/MM/YY',
        CuisineRegion.americanBritish => 'MM/DD/YYYY, DD/MM/YYYY',
        CuisineRegion.japanese || CuisineRegion.korean || CuisineRegion.chinese =>
          'YYYY/MM/DD, YYYY-MM-DD, YY/MM/DD',
        _ => 'DD/MM/YYYY, DD.MM.YYYY, DD-MM-YY',
      };

  static String _skipTerms(CuisineRegion region) => switch (region) {
        CuisineRegion.turkish => 'KDV, POS, loyalty, bag fees',
        CuisineRegion.german => 'MwSt, USt, Pfand, Pfandguthaben',
        CuisineRegion.french => 'TVA, rendu monnaie',
        CuisineRegion.spanish || CuisineRegion.portugueseBrazilian => 'IVA, cambio',
        CuisineRegion.italian => 'IVA, resto',
        CuisineRegion.polish => 'VAT, PTU',
        CuisineRegion.japanese => '消費税, お釣り',
        _ => 'VAT, GST, tax, change due, subtotal',
      };

  static String _quantityExamples(CuisineRegion region) => switch (region) {
        CuisineRegion.turkish => '500g or 1 adet',
        CuisineRegion.americanBritish => '1 lb or 12 oz',
        CuisineRegion.japanese || CuisineRegion.korean => '1個 or 500g',
        _ => '500g or 1 pc',
      };

  static String _abbrevHint(CuisineRegion region) => switch (region) {
        CuisineRegion.turkish =>
          'Expand Turkish receipt abbreviations in clean_name (YYMZ → yogurt, BNDR → bandır/banana context).',
        CuisineRegion.german =>
          'Expand German abbreviations (H-Milch, Bio, TK for Tiefkühl/frozen).',
        CuisineRegion.french =>
          'Expand French abbreviations (YAOURT, FRT legumes, 1L, 500G).',
        CuisineRegion.italian =>
          'Expand Italian abbreviations (YOG, PARM, GR 500, LAT).',
        CuisineRegion.spanish =>
          'Expand Spanish abbreviations (YOGUR, PAN, BIF).',
        _ =>
          'Expand common local receipt abbreviations into full product names in clean_name.',
      };
}
