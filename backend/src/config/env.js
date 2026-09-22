'use strict';

require('dotenv').config();

function required(name) {
  const value = process.env[name]?.trim();
  if (!value) {
    throw new Error(`Missing required environment variable: ${name}`);
  }
  return value;
}

function optional(name, fallback = undefined) {
  const value = process.env[name]?.trim();
  return value && value.length > 0 ? value : fallback;
}

const apiHost = optional('BOSCH_API_HOST', 'https://simulator.home-connect.com').replace(
  /\/$/,
  '',
);

module.exports = {
  port: Number(optional('PORT', '3000')),
  nodeEnv: optional('NODE_ENV', 'development'),
  bosch: {
    apiHost,
    clientId: optional('BOSCH_CLIENT_ID', 'REPLACE_WITH_DEVELOPER_PORTAL_CLIENT_ID'),
    clientSecret: optional('BOSCH_CLIENT_SECRET', ''),
    redirectUri: required('BOSCH_REDIRECT_URI'),
    scope: optional('BOSCH_OAUTH_SCOPE', 'IdentifyAppliance FridgeFreezer'),
    authorizeUrl: `${apiHost}/security/oauth/authorize`,
    tokenUrl: `${apiHost}/security/oauth/token`,
  },
};
