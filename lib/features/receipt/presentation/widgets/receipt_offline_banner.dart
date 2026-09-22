import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../providers/receipt_queue_provider.dart';

typedef ReceiptQueueProcess = Future<void> Function(File imageFile, String id);

class ReceiptOfflineBanner extends ConsumerWidget {
  const ReceiptOfflineBanner({
    super.key,
    required this.onProcessEntry,
  });

  final ReceiptQueueProcess onProcessEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.watch(receiptQueueProvider);
    if (queue.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: NeonDecorations.card(accent: AppColors.primary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.receiptQueueTitle(queue.length),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            ...queue.take(3).map(
                  (e) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      AppStrings.receiptQueueItem(
                        e.createdAt.day,
                        e.createdAt.month,
                        e.createdAt.hour,
                        e.createdAt.minute,
                      ),
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                    trailing: TextButton(
                      onPressed: () async {
                        final file =
                            await ref.read(receiptQueueProvider.notifier).imageFile(e.id);
                        if (file != null) {
                          await onProcessEntry(file, e.id);
                        }
                      },
                      child: Text(AppStrings.receiptQueueProcess),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
