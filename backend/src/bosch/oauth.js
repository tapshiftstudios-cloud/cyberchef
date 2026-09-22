'use strict';

const axios = require('axios');
const crypto = require('crypto');
const { bosch } = require('../config/env');

/** @type {Map<string, { createdAt: number }>} */
const pendingStates = new Map();

const STATE_TTL_MS = 10 * 60 * 1000;

function purgeExpiredStates() {
  const now = Date.now();
  for (const [state, meta] of pendingStates.entries()) {
    if (now - meta.createdAt > STATE_TTL_MS) {
      pendingStates.delete(state);
    }
  }
}

/**
 * Builds the Home Connect authorization URL (OAuth2 Authorization Code).
 * @param {{ state?: string }} [options]
 * @returns {{ url: string, state: string }}
 */
function buildAuthorizationUrl(options = {}) {
  purgeExpiredStates();
  const state = options.state ?? crypto.randomBytes(24).toString('hex');
  pendingStates.set(state, { createdAt: Date.now() });

  const params = new URLSearchParams({
    response_type: 'code',
    client_id: bosch.clientId,
    redirect_uri: bosch.redirectUri,
    scope: bosch.scope,
    state,
  });

  return {
    url: `${bosch.authorizeUrl}?${params.toString()}`,
    state,
  };
}

/**
 * Validates CSRF `state` returned on the callback (optional but recommended).
 * @param {string | undefined} state
 * @returns {boolean}
 */
function consumeAuthorizationState(state) {
  if (!state) return false;
  purgeExpiredStates();
  const ok = pendingStates.has(state);
  if (ok) pendingStates.delete(state);
  return ok;
}

/**
 * Exchanges an authorization code for access + refresh tokens.
 * @param {string} code
 * @returns {Promise<{ access_token: string, refresh_token?: string, expires_in?: number, token_type?: string, id_token?: string }>}
 */
async function exchangeAuthorizationCode(code, redirectUriOverride) {
  const redirect_uri = (redirectUriOverride && String(redirectUriOverride).trim()) || bosch.redirectUri;
  const body = new URLSearchParams({
    grant_type: 'authorization_code',
    code,
    client_id: bosch.clientId,
    redirect_uri,
  });
  if (bosch.clientSecret) {
    body.set('client_secret', bosch.clientSecret);
  }

  const { data } = await axios.post(bosch.tokenUrl, body.toString(), {
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    validateStatus: (status) => status < 500,
  });

  if (!data?.access_token) {
    const detail =
      typeof data === 'object' && data !== null ? JSON.stringify(data) : String(data);
    const err = new Error(
      (typeof data === 'object' && data?.error_description) ||
        `Token exchange failed: ${detail}`,
    );
    err.statusCode = 400;
    err.oauthError = typeof data === 'object' ? data?.error : undefined;
    err.oauthDescription =
      typeof data === 'object' ? data?.error_description : undefined;
    throw err;
  }

  return data;
}

function redirectUriVariants(uri) {
  const trimmed = String(uri).trim();
  const variants = [trimmed];
  if (trimmed.endsWith('/')) {
    variants.push(trimmed.slice(0, -1));
  } else {
    variants.push(`${trimmed}/`);
  }
  return [...new Set(variants)];
}

async function exchangeAuthorizationCodeWithFallback(code, redirectUriOverride) {
  const primary =
    (redirectUriOverride && String(redirectUriOverride).trim()) || bosch.redirectUri;
  const variants = redirectUriVariants(primary);
  let lastErr;
  for (const redirectUri of variants) {
    try {
      return await exchangeAuthorizationCode(code, redirectUri);
    } catch (err) {
      lastErr = err;
      if (err.oauthError !== 'invalid_client') throw err;
    }
  }
  throw lastErr;
}

/**
 * Refreshes an access token (24h lifetime on Home Connect).
 * @param {string} refreshToken
 * @returns {Promise<{ access_token: string, refresh_token?: string, expires_in?: number, token_type?: string, id_token?: string }>}
 */
async function refreshAccessToken(refreshToken) {
  const body = new URLSearchParams({
    grant_type: 'refresh_token',
    refresh_token: refreshToken,
  });
  if (bosch.clientSecret) {
    body.set('client_secret', bosch.clientSecret);
  }

  const { data } = await axios.post(bosch.tokenUrl, body.toString(), {
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    validateStatus: (status) => status < 500,
  });

  if (!data?.access_token) {
    const detail =
      typeof data === 'object' && data !== null ? JSON.stringify(data) : String(data);
    const err = new Error(
      (typeof data === 'object' && data?.error_description) ||
        `Token refresh failed: ${detail}`,
    );
    err.statusCode = 400;
    err.oauthError = typeof data === 'object' ? data?.error : undefined;
    err.oauthDescription =
      typeof data === 'object' ? data?.error_description : undefined;
    throw err;
  }

  return data;
}

module.exports = {
  buildAuthorizationUrl,
  consumeAuthorizationState,
  exchangeAuthorizationCode,
  exchangeAuthorizationCodeWithFallback,
  refreshAccessToken,
};
