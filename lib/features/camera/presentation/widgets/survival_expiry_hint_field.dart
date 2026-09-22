import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/scan_mode.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../pantry/domain/models/pantry_item.dart';
import '../../../pantry/presentation/providers/pantry_items_provider.dart';
import '../providers/camera_scan_providers.dart';
import '../../../../core/theme/neon_decorations.dart';

class SurvivalExpiryHintField extends ConsumerStatefulWidget {
  const SurvivalExpiryHintField({super.key});

  @override
  ConsumerState<SurvivalExpiryHintField> createState() =>
      _SurvivalExpiryHintFieldState();
}

class _SurvivalExpiryHintFieldState
    extends ConsumerState<SurvivalExpiryHintField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _appendFromPantry(List<PantryItem> urgent) {
    if (urgent.isEmpty) return;
    final names = urgent.map((e) => e.cleanName).toSet().toList();
    final existing = _controller.text
        .split(RegExp(r'[,;]'))
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toSet();
    final toAdd =
        names.where((n) => !existing.contains(n.toLowerCase())).toList();
    if (toAdd.isEmpty) return;

    final merged = [
      ..._controller.text
          .split(RegExp(r'[,;]'))
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty),
      ...toAdd,
    ].join(', ');

    _controller.text = merged;
    ref.read(survivalExpiryHintProvider.notifier).state = merged;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    final hintValue = ref.watch(survivalExpiryHintProvider);
    if (!_focusNode.hasFocus && _controller.text != hintValue) {
      _controller.text = hintValue;
    }
    ref.listen(selectedScanModeProvider, (previous, next) {
      if (next != ScanMode.survival && _controller.text.isNotEmpty) {
        _controller.clear();
        ref.read(survivalExpiryHintProvider.notifier).state = '';
      }
    });

    final pantry = ref.watch(pantryItemsProvider).valueOrNull ?? [];
    final urgent = pantry
        .where((e) => !e.isConsumed)
        .where(
          (e) =>
              e.urgency == FreshnessUrgency.critical ||
              e.urgency == FreshnessUrgency.warning,
        )
        .toList();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: NeonDecorations.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                size: 18,
                color: AppColors.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  AppStrings.survivalHintTitle,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (urgent.isNotEmpty)
                TextButton(
                  onPressed: () => _appendFromPantry(urgent),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.secondary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppStrings.survivalHintAddFromPantry,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.survivalHintOptional,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
          if (urgent.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: urgent.take(8).map((item) {
                return ActionChip(
                  label: Text(
                    item.cleanName,
                    style: GoogleFonts.inter(fontSize: 11),
                  ),
                  backgroundColor: AppColors.background,
                  side: BorderSide(color: AppColors.border),
                  onPressed: () => _appendFromPantry([item]),
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 10),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            maxLines: 2,
            minLines: 1,
            textInputAction: TextInputAction.done,
            scrollPadding: const EdgeInsets.only(bottom: 220),
            onTap: () => _focusNode.requestFocus(),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              ref.read(survivalExpiryHintProvider.notifier).state = value;
            },
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: AppStrings.survivalHintPlaceholder,
              hintStyle: GoogleFonts.inter(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
              filled: true,
              fillColor: AppColors.background,
              suffixIcon: _controller.text.trim().isEmpty
                  ? null
                  : IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: AppColors.textMuted,
                      ),
                      onPressed: () {
                        _controller.clear();
                        ref.read(survivalExpiryHintProvider.notifier).state = '';
                        setState(() {});
                      },
                    ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

