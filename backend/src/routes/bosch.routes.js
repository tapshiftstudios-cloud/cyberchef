'use strict';

const express = require('express');
const {
  buildAuthorizationUrl,
  consumeAuthorizationState,
  exchangeAuthorizationCodeWithFallback,
  refreshAccessToken,
} = require('../bosch/oauth');

const router = express.Router();

async function completeAuthorization(code, state, res, next, redirectUri) {
  try {
    if (!code || typeof code !== 'string') {
      res.status(400).json({ ok: false, error: 'missing_code' });
      return;
    }

    if (!consumeAuthorizationState(typeof state === 'string' ? state : undefined)) {
      res.status(400).json({
        ok: false,
        error: 'invalid_state',
        hint: 'Start OAuth from GET /bosch/auth-url on this server.',
      });
      return;
    }

    const tokens = await exchangeAuthorizationCodeWithFallback(code, redirectUri);

    res.json({
      ok: true,
      tokenType: tokens.token_type,
      expiresIn: tokens.expires_in,
      accessToken: tokens.access_token,
      refreshToken: tokens.refresh_token,
      idToken: tokens.id_token,
      scope: tokens.scope,
    });
  } catch (err) {
    if (err.oauthError) {
      res.status(400).json({
        ok: false,
        error: err.oauthError,
        errorDescription: err.oauthDescription ?? err.message,
      });
      return;
    }
    next(err);
  }
}

/**
 * GET /bosch/auth-url
 * Flutter WebView / deep link: fetch URL JSON instead of server redirect.
 */
router.get('/redirect-uri', (_req, res) => {
  const { bosch } = require('../config/env');
  res.json({
    redirectUri: bosch.redirectUri,
    hint: 'Register this exact value in the Home Connect developer portal for your Client ID.',
  });
});

router.get('/auth-url', (_req, res) => {
  const { bosch } = require('../config/env');
  if (
    !bosch.clientId ||
    bosch.clientId.includes('REPLACE_WITH') ||
    bosch.clientId === 'pending-from-developer-portal'
  ) {
    res.status(503).json({
      ok: false,
      error: 'bosch_client_id_not_configured',
      hint: 'Set BOSCH_CLIENT_ID in backend/.env after Home Connect developer portal access.',
    });
    return;
  }
  const { url, state } = buildAuthorizationUrl();
  res.json({
    authorizationUrl: url,
    state,
    redirectUri: bosch.redirectUri,
    requestedScope: bosch.scope,
  });
});

/**
 * GET /bosch/authorize
 * Browser test: redirect straight to Home Connect login.
 */
router.get('/authorize', (_req, res) => {
  const { url } = buildAuthorizationUrl();
  res.redirect(url);
});

/**
 * GET /bosch/callback
 * OAuth redirect target — exchanges `code` for tokens.
 */
router.get('/callback', (req, res) => {
  const { error, error_description: errorDescription } = req.query;

  if (error) {
    res
      .status(400)
      .type('html')
      .send(
        `<html><body style="font-family:sans-serif;padding:16px">` +
          `<p><strong>Home Connect OAuth error</strong></p>` +
          `<p>${String(error)}</p>` +
          `<p>${errorDescription ? String(errorDescription) : ''}</p>` +
          `<p>Return to CyberChef and tap Connect again.</p></body></html>`,
      );
    return;
  }

  // Mobile app uses POST /bosch/exchange — avoid token exchange here (redirect mismatch).
  res
    .status(200)
    .type('html')
    .send(
      '<html><body style="font-family:sans-serif;padding:16px">' +
        '<p>Authorization received. You can close this page and return to the CyberChef app.</p>' +
        '</body></html>',
    );
});

/**
 * POST /bosch/exchange
 * Mobile WebView: app intercepts redirect and sends `{ code, state, redirectUri }` JSON.
 */
router.post('/exchange', async (req, res, next) => {
  const { code, state, redirectUri } = req.body ?? {};
  await completeAuthorization(code, state, res, next, redirectUri);
});

router.post('/refresh', async (req, res, next) => {
  try {
    const refreshToken = req.body?.refreshToken;
    if (!refreshToken || typeof refreshToken !== 'string') {
      res.status(400).json({ ok: false, error: 'missing_refresh_token' });
      return;
    }
    const tokens = await refreshAccessToken(refreshToken);
    res.json({
      ok: true,
      tokenType: tokens.token_type,
      expiresIn: tokens.expires_in,
      accessToken: tokens.access_token,
      refreshToken: tokens.refresh_token,
      idToken: tokens.id_token,
      scope: tokens.scope,
    });
  } catch (err) {
    if (err.oauthError) {
      res.status(400).json({
        ok: false,
        error: err.oauthError,
        errorDescription: err.oauthDescription ?? err.message,
      });
      return;
    }
    next(err);
  }
});

module.exports = router;
