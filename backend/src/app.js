'use strict';

const express = require('express');
const boschRoutes = require('./routes/bosch.routes');

function createApp() {
  const app = express();
  app.use(express.json());

  app.get('/health', (_req, res) => {
    res.json({ ok: true, service: 'cyberchef-bosch-backend' });
  });

  app.use('/bosch', boschRoutes);

  app.use((err, _req, res, _next) => {
    const status = err.statusCode && Number.isInteger(err.statusCode) ? err.statusCode : 500;
    if (process.env.NODE_ENV !== 'production') {
      // eslint-disable-next-line no-console
      console.error(err);
    }
    res.status(status).json({
      ok: false,
      error: status === 500 ? 'internal_error' : 'upstream_error',
      message: err.message,
    });
  });

  return app;
}

module.exports = { createApp };
