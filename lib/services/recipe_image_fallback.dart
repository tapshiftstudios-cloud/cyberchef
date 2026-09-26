/// Keyword-based stock URLs when API lookup misses (no API cost).
abstract final class RecipeImageFallback {
  static String urlForTitle(String rawTitle) {
    final t = rawTitle.toLowerCase();
    if (_any(t, const ['chicken', 'tavuk', 'meat', 'et', 'kebap'])) {
      return 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['soup', 'corba', 'çorba'])) {
      return 'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['pasta', 'makarna', 'noodle'])) {
      return 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['salad', 'salata'])) {
      return 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['rice', 'pilav', 'bowl'])) {
      return 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['karnabahar', 'cauliflower', 'mücver', 'mucver'])) {
      return 'https://images.unsplash.com/photo-1584270354949-c26b0d66b80d?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['pırasa', 'pirasa', 'leek'])) {
      return 'https://images.unsplash.com/photo-1518977954372-dbb0712bfcb0?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['sütlaç', 'sutlac', 'pudding'])) {
      return 'https://images.unsplash.com/photo-1570197788417-0e82375a93ae?auto=format&fit=crop&w=800&q=75';
    }
    if (_any(t, const ['dessert', 'cake', 'tatli', 'tatlı'])) {
      return 'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=75';
    }
    return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=75';
  }

  static bool _any(String text, List<String> words) {
    for (final w in words) {
      if (text.contains(w)) return true;
    }
    return false;
  }
}
