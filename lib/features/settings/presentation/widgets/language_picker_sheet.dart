import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/app_locale.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

/// Searchable language picker for many locales.
///
/// UI strings for locales other than English and Turkish are AI-generated
/// via `scripts/generate_l10n.py` (Gemini). Turkish is hand-maintained.
class LanguagePickerSheet extends StatefulWidget {
  const LanguagePickerSheet({super.key, required this.current});

  final AppLocale current;

  static Future<AppLocale?> show(BuildContext context, AppLocale current) {
    return showModalBottomSheet<AppLocale>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      builder: (_) => LanguagePickerSheet(current: current),
    );
  }

  @override
  State<LanguagePickerSheet> createState() => _LanguagePickerSheetState();
}

class _LanguagePickerSheetState extends State<LanguagePickerSheet> {
  final _query = TextEditingController();
  String _search = '';

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  Iterable<AppLocale> get _filtered {
    final q = _search.trim().toLowerCase();
    if (q.isEmpty) return AppLocale.values;
    return AppLocale.values.where(
      (loc) =>
          loc.label.toLowerCase().contains(q) ||
          loc.code.toLowerCase().contains(q),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              AppStrings.languageTitle,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _query,
              onChanged: (v) => setState(() => _search = v),
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: _filtered.map((loc) {
                  final selected = loc == widget.current;
                  return ListTile(
                    title: Text(
                      loc.label,
                      style: GoogleFonts.inter(
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Text(
                      loc.code,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                    trailing: selected
                        ? Icon(Icons.check_circle, color: AppColors.primary)
                        : null,
                    onTap: () => Navigator.pop(context, loc),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
