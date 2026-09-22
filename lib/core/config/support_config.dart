/// Support contact for in-app feedback.
abstract final class SupportConfig {
  static const String feedbackEmail = 'tapshiftstudios@hotmail.com';

  static Uri feedbackMailto({String? appVersion}) {
    final subject = appVersion == null || appVersion.isEmpty
        ? 'CyberChef feedback'
        : 'CyberChef feedback ($appVersion)';
    return Uri(
      scheme: 'mailto',
      path: feedbackEmail,
      query: _encodeQuery({'subject': subject}),
    );
  }

  static String? _encodeQuery(Map<String, String> params) {
    if (params.isEmpty) return null;
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
