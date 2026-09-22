import 'package:home_widget/home_widget.dart';

import '../core/l10n/app_strings.dart';
import '../features/pantry/domain/models/pantry_item.dart';

/// Android ana ekran widget verisi (home_widget).
abstract final class PantryWidgetService {
  static const _criticalKey = 'critical_count';
  static const _warningKey = 'warning_count';
  static const _titleKey = 'widget_title';
  static const _countsKey = 'widget_counts';

  static Future<void> updateFromItems(List<PantryItem> items) async {
    final critical =
        items.where((e) => e.urgency == FreshnessUrgency.critical).length;
    final warning =
        items.where((e) => e.urgency == FreshnessUrgency.warning).length;

    await HomeWidget.saveWidgetData<int>(_criticalKey, critical);
    await HomeWidget.saveWidgetData<int>(_warningKey, warning);
    await HomeWidget.saveWidgetData<String>(
      _titleKey,
      critical > 0
          ? AppStrings.widgetFreshnessCritical(critical)
          : AppStrings.widgetFreshnessGood,
    );
    await HomeWidget.saveWidgetData<String>(
      _countsKey,
      AppStrings.widgetCountsSummary(critical, warning),
    );
    await _pushUpdate();
  }

  /// Dil değişince kayıtlı sayıları yeni metinlerle yeniler.
  static Future<void> refreshLabelsFromStoredCounts() async {
    final critical =
        await HomeWidget.getWidgetData<int>(_criticalKey, defaultValue: 0) ?? 0;
    final warning =
        await HomeWidget.getWidgetData<int>(_warningKey, defaultValue: 0) ?? 0;
    await HomeWidget.saveWidgetData<String>(
      _titleKey,
      critical > 0
          ? AppStrings.widgetFreshnessCritical(critical)
          : AppStrings.widgetFreshnessGood,
    );
    await HomeWidget.saveWidgetData<String>(
      _countsKey,
      AppStrings.widgetCountsSummary(critical, warning),
    );
    await _pushUpdate();
  }

  static Future<void> _pushUpdate() => HomeWidget.updateWidget(
        name: 'PantryWidgetProvider',
        androidName: 'PantryWidgetProvider',
      );
}
