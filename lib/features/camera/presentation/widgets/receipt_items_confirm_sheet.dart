import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../../pantry/domain/models/pantry_item.dart';
import '../../../pantry/domain/models/receipt_analysis_result.dart';

Future<List<PantryItem>?> showReceiptItemsConfirmSheet(
  BuildContext context, {
  required ReceiptAnalysisResult result,
}) async {
  return Navigator.of(context).push<List<PantryItem>>(
    MaterialPageRoute<List<PantryItem>>(
      fullscreenDialog: true,
      builder: (context) => ReceiptItemsConfirmScreen(result: result),
    ),
  );
}

class ReceiptItemsConfirmScreen extends StatefulWidget {
  const ReceiptItemsConfirmScreen({super.key, required this.result});

  final ReceiptAnalysisResult result;

  @override
  State<ReceiptItemsConfirmScreen> createState() =>
      _ReceiptItemsConfirmScreenState();
}

class _ReceiptItemsConfirmScreenState extends State<ReceiptItemsConfirmScreen> {
  late List<ReceiptLineItem> _items;
  late DateTime _purchaseDate;
  String? _storeName;
  final Set<int> _reviewedLowConfidence = {};

  @override
  void initState() {
    super.initState();
    _items = widget.result.items.map((e) => e.copyWith(selected: true)).toList();
    _purchaseDate = widget.result.purchaseDate ?? DateTime.now();
    _storeName = widget.result.storeName;
  }

  Future<void> _pickPurchaseDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _purchaseDate = picked);
  }

  Future<void> _editItem(int index) async {
    final item = _items[index];
    final nameCtrl = TextEditingController(text: item.cleanName);
    final qtyCtrl = TextEditingController(text: item.quantity);
    final daysCtrl =
        TextEditingController(text: '${item.estimatedExpiryDays}');
    final catCtrl = TextEditingController(text: item.category);

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          20 + MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.receiptEditItem,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: AppStrings.receiptFieldProductName,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: qtyCtrl,
              decoration: InputDecoration(
                labelText: AppStrings.receiptFieldQuantity,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: catCtrl,
              decoration: InputDecoration(
                labelText: AppStrings.receiptFieldCategory,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: daysCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppStrings.receiptExpiryDaysLabel,
              ),
            ),
            const SizedBox(height: 16),
            AppTheme.neonButton(
              label: AppStrings.receiptEditSave,
              icon: Icons.check,
              onPressed: () => Navigator.pop(ctx, true),
            ),
          ],
        ),
      ),
    );

    if (saved == true && mounted) {
      setState(() {
        _reviewedLowConfidence.add(index);
        _items[index] = item.copyWith(
          cleanName: nameCtrl.text.trim().isEmpty
              ? item.cleanName
              : nameCtrl.text.trim(),
          quantity: qtyCtrl.text.trim(),
          category: catCtrl.text.trim(),
          estimatedExpiryDays:
              int.tryParse(daysCtrl.text.trim()) ?? item.estimatedExpiryDays,
        );
      });
    }
    nameCtrl.dispose();
    qtyCtrl.dispose();
    daysCtrl.dispose();
    catCtrl.dispose();
  }

  bool _pendingLowConfidenceReview() {
    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (item.selected &&
          item.isLowConfidence &&
          !_reviewedLowConfidence.contains(i)) {
        return true;
      }
    }
    return false;
  }

  void _confirm() {
    final selected = _items.where((e) => e.selected).toList();
    if (selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.receiptSelectOne)),
      );
      return;
    }
    if (_pendingLowConfidenceReview()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.receiptLowConfidenceBlock)),
      );
      return;
    }
    final pantryItems = selected
        .map(
          (e) => e.toPantryItem(
            purchaseDate: _purchaseDate,
            storeName: _storeName,
          ),
        )
        .toList();
    Navigator.of(context).pop(pantryItems);
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = _items.where((e) => e.selected).length;
    final dateLabel =
        '${_purchaseDate.day}.${_purchaseDate.month}.${_purchaseDate.year}';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.receiptConfirmTitle,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: NeonDecorations.card(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_storeName != null && _storeName!.isNotEmpty)
                      Text(
                        _storeName!,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _pickPurchaseDate,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            '${AppStrings.receiptPurchaseDate}: $dateLabel',
                            style: GoogleFonts.inter(fontSize: 13),
                          ),
                          const Spacer(),
                          Text(
                            AppStrings.receiptTapToEdit,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppStrings.receiptConfirmSubtitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => setState(() {
                        _items[index] = item.copyWith(
                          selected: !item.selected,
                        );
                      }),
                      onLongPress: () => _editItem(index),
                      borderRadius:
                          BorderRadius.circular(NeonDecorations.cardRadius),
                      child: Ink(
                        decoration: NeonDecorations.card(
                          accent: item.selected
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                item.selected
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: item.selected
                                    ? AppColors.primary
                                    : AppColors.textMuted,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.cleanName,
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        if (item.isLowConfidence)
                                          Icon(
                                            Icons.warning_amber,
                                            size: 18,
                                            color: Color(0xFFE8B339),
                                          ),
                                        IconButton(
                                          icon: Icon(Icons.edit_outlined,
                                              size: 18),
                                          onPressed: () => _editItem(index),
                                          color: AppColors.textMuted,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      item.rawName,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Wrap(
                                      spacing: 6,
                                      children: [
                                        _Tag(item.category),
                                        _Tag(item.quantity),
                                        _Tag(
                                          AppStrings.expiryApprox(
                                            item.estimatedExpiryDays,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: AppTheme.neonButton(
                label: '${AppStrings.receiptConfirmSave} ($selectedCount)',
                icon: Icons.check,
                onPressed: _confirm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: NeonDecorations.button(filled: true),
      child: Text(
        label,
        style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}

