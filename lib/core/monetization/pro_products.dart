import '../config/app_env.dart';

abstract final class ProProducts {
  static Set<String> ids() {
    final monthly = AppEnv.value('IAP_PRO_MONTHLY_ID');
    final yearly = AppEnv.value('IAP_PRO_YEARLY_ID');
    final ids = <String>{};
    if (monthly != null && monthly.trim().isNotEmpty) ids.add(monthly.trim());
    if (yearly != null && yearly.trim().isNotEmpty) ids.add(yearly.trim());
    return ids;
  }
}
