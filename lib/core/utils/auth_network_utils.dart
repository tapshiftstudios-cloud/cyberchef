/// Detects transport/DNS failures so auth can fall back to offline mode.
bool isAuthNetworkFailure(Object error) {
  final message = error.toString().toLowerCase();
  const markers = [
    'network',
    'socket',
    'failed host lookup',
    'nxdomain',
    'connection',
    'timeout',
    'timed out',
    'unreachable',
    'no address associated',
    'clientexception',
    'handshake',
    'dns',
  ];
  for (final marker in markers) {
    if (message.contains(marker)) return true;
  }
  return false;
}
