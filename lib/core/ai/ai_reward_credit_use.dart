/// Bir sonraki AI isteğinde ödüllü reklam kredisinin kullanılacağını işaretler.
final class AiRewardCreditUse {
  static bool _pending = false;

  static void markPending() => _pending = true;

  static bool takePending() {
    if (!_pending) return false;
    _pending = false;
    return true;
  }
}
