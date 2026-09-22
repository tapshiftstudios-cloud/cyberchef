import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/presentation/app_feedback.dart';
import '../../../../services/bosch/bosch_connection_store.dart';
import '../../../../services/bosch/bosch_oauth_api.dart';
import '../../../../services/bosch/bosch_oauth_callback.dart';
import '../bosch_connect_copy.dart';

class BoschOAuthWebViewScreen extends StatefulWidget {
  const BoschOAuthWebViewScreen({
    super.key,
    required this.authorizationUrl,
    required this.expectedState,
    required this.redirectUri,
  });

  final String authorizationUrl;
  final String expectedState;
  final String redirectUri;

  @override
  State<BoschOAuthWebViewScreen> createState() =>
      _BoschOAuthWebViewScreenState();
}

class _BoschOAuthWebViewScreenState extends State<BoschOAuthWebViewScreen> {
  late final WebViewController _controller;
  late final String _redirectUriForExchange;
  final _api = BoschOAuthApi();
  final _store = BoschConnectionStore();
  var _busy = false;
  var _handled = false;

  @override
  void initState() {
    super.initState();
    _redirectUriForExchange = Uri.parse(widget.authorizationUrl)
            .queryParameters['redirect_uri'] ??
        widget.redirectUri;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: _onNavigationRequest,
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
  }

  bool _shouldIntercept(Uri uri) {
    final hasPayload = uri.queryParameters.containsKey('code') ||
        uri.queryParameters.containsKey('error');
    if (!hasPayload) return false;
    if (uri.path.contains('/oauth/authorize')) return false;
    return true;
  }

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    final uri = Uri.tryParse(request.url);
    if (uri == null) return NavigationDecision.navigate;
    if (!_shouldIntercept(uri)) return NavigationDecision.navigate;
    _handleCallback(uri);
    return NavigationDecision.prevent;
  }

  Future<void> _handleCallback(Uri uri) async {
    if (_busy || _handled) return;
    setState(() => _busy = true);
    try {
      final parsed = BoschOAuthCallback.tryParse(uri);
      if (parsed == null) {
        setState(() => _busy = false);
        return;
      }
      _handled = true;
      if (parsed.state != null &&
          parsed.state!.isNotEmpty &&
          parsed.state != widget.expectedState) {
        throw BoschOAuthCallbackException('invalid_state');
      }
      final tokens = await _api.exchangeCode(
        code: parsed.code,
        state: parsed.state ?? widget.expectedState,
        redirectUri: _redirectUriForExchange,
      );
      await _store.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        expiresInSeconds: tokens.expiresInSeconds,
        scope: tokens.scope,
      );
      if (!mounted) return;
      AppFeedback.showInfo(context, BoschConnectCopy.connectSuccess);
      Navigator.of(context).pop(true);
    } on BoschOAuthCallbackException catch (e) {
      if (!mounted) return;
      AppFeedback.showError(context, BoschConnectCopy.oauthError(e.error));
      Navigator.of(context).pop(false);
    } on BoschOAuthApiException catch (e) {
      if (!mounted) return;
      AppFeedback.showError(
        context,
        '${BoschConnectCopy.connectFailed}: ${e.message ?? e.code}',
      );
      Navigator.of(context).pop(false);
    } catch (e) {
      if (!mounted) return;
      AppFeedback.showError(context, '${BoschConnectCopy.connectFailed}: $e');
      Navigator.of(context).pop(false);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BoschConnectCopy.webViewTitle),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_busy)
            const ColoredBox(
              color: Color(0x66000000),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
