import '../enums/cuisine_region.dart';

/// Gemini tarif üretim promptları için yerel mutfak kuralları.
abstract final class AiCuisinePrompts {
  static String cuisineStyle(CuisineRegion region) => switch (region) {
        CuisineRegion.americanBritish =>
          'American and British everyday home cooking',
        CuisineRegion.turkish => 'Turkish home cooking',
        CuisineRegion.spanish => 'Spanish home cooking',
        CuisineRegion.german => 'German home cooking',
        CuisineRegion.french => 'French home cooking',
        CuisineRegion.portugueseBrazilian =>
          'Portuguese and Brazilian home cooking',
        CuisineRegion.italian => 'Italian home cooking',
        CuisineRegion.dutch => 'Dutch home cooking',
        CuisineRegion.polish => 'Polish home cooking',
        CuisineRegion.russian => 'Russian home cooking',
        CuisineRegion.japanese => 'Japanese home cooking',
        CuisineRegion.korean => 'Korean home cooking',
        CuisineRegion.chinese => 'Chinese home cooking',
        CuisineRegion.indian => 'Indian home cooking',
        CuisineRegion.indonesian => 'Indonesian home cooking',
        CuisineRegion.vietnamese => 'Vietnamese home cooking',
        CuisineRegion.middleEastern => 'Middle Eastern home cooking',
        CuisineRegion.ukrainian => 'Ukrainian home cooking',
        CuisineRegion.czech => 'Czech home cooking',
        CuisineRegion.romanian => 'Romanian home cooking',
        CuisineRegion.nordic => 'Swedish and Nordic home cooking',
        CuisineRegion.greek => 'Greek home cooking',
        CuisineRegion.hungarian => 'Hungarian home cooking',
        CuisineRegion.malaysian => 'Malaysian home cooking',
        CuisineRegion.thai => 'Thai home cooking',
      };

  static String _examples(CuisineRegion region) => switch (region) {
        CuisineRegion.americanBritish =>
          'e.g. sheet-pan chicken, pasta bake, tuna salad, scrambled eggs',
        CuisineRegion.turkish =>
          'e.g. menemen, mercimek çorbası, karnıyarık, tavuk sote, pilav',
        CuisineRegion.spanish =>
          'e.g. tortilla española, gazpacho, paella-style rice, albóndigas',
        CuisineRegion.german =>
          'e.g. Kartoffelsuppe, Spätzle, Eintopf, Bratkartoffeln mit Ei',
        CuisineRegion.french =>
          'e.g. omelette, ratatouille, quiche, soupe à l\'oignon, salade composée',
        CuisineRegion.portugueseBrazilian =>
          'e.g. caldo verde, bacalhau-style prep, feijão, arroz de frango',
        CuisineRegion.italian =>
          'e.g. pasta aglio e olio, risotto, frittata, minestrone, caprese salad',
        CuisineRegion.dutch =>
          'e.g. stamppot, erwtensoep, uitsmijter, hutspot',
        CuisineRegion.polish =>
          'e.g. żurek-style soup, pierogi filling bowl, bigos-inspired skillet',
        CuisineRegion.russian =>
          'e.g. borscht-style soup, grechka bowl, syrniki, shchi',
        CuisineRegion.japanese =>
          'e.g. donburi, miso soup, tamagoyaki, yakisoba, ochazuke',
        CuisineRegion.korean =>
          'e.g. bibimbap, kimchi jjigae, gyeran-mari, doenjang soup',
        CuisineRegion.chinese =>
          'e.g. fried rice, tomato egg stir-fry, congee, mapo-style tofu',
        CuisineRegion.indian =>
          'e.g. dal, sabzi, khichdi, paratha filling, pulao',
        CuisineRegion.indonesian =>
          'e.g. nasi goreng, tumis sayur, soto-style soup, tempeh stir-fry',
        CuisineRegion.vietnamese =>
          'e.g. phở-style bowl, bún stir-fry, canh rau, thịt xào',
        CuisineRegion.middleEastern =>
          'e.g. shakshuka, lentil soup, rice with vermicelli, fattoush-style salad',
        CuisineRegion.ukrainian =>
          'e.g. borscht, varenyky filling bowl, deruny, kapusniak',
        CuisineRegion.czech =>
          'e.g. bramborák-style prep, guláš, knedlíky side, česnečka',
        CuisineRegion.romanian =>
          'e.g. mămăligă bowl, ciorbă, sarmale-style cabbage rolls',
        CuisineRegion.nordic =>
          'e.g. pytt i panna, ärtsoppa-style pea soup, lax bowl',
        CuisineRegion.greek =>
          'e.g. gemista-style stuffed veg, fasolada, spanakopita-style pie',
        CuisineRegion.hungarian =>
          'e.g. lecsó, gulyás-style soup, túrós csusza, rántott sajt',
        CuisineRegion.malaysian =>
          'e.g. nasi lemak-style plate, sambal telur, sayur lodeh',
        CuisineRegion.thai =>
          'e.g. pad krapow-style stir-fry, tom yum soup, kai jeow, fried rice',
      };

  static String cuisinePromptBlock(CuisineRegion region) {
    final style = cuisineStyle(region);
    final examples = _examples(region);
    return '''

CUISINE & REGIONAL STYLE (required):
- Target cuisine: $style.
- Prefer dishes families actually cook at home in this culinary tradition.
- Use ingredient combinations, techniques, and meal types typical of this cuisine.
- Recipe titles should sound naturally local — not generic Western defaults unless ingredients truly fit nothing else.
- Inspiration examples (do not copy blindly; adapt to visible ingredients): $examples.
- If ingredients fit multiple traditions, still lean toward $style first.
''';
  }
}
