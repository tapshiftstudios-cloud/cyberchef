'use strict';

const { createApp } = require('./app');
const { port, nodeEnv } = require('./config/env');

const app = createApp();

app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`CyberChef Bosch backend listening on http://localhost:${port} (${nodeEnv})`);
  // eslint-disable-next-line no-console
  console.log(`OAuth callback: http://localhost:${port}/bosch/callback`);
});
