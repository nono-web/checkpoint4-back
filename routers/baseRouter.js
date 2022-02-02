const baseRouter = require('express').Router();

baseRouter.get('/', (req, res) => {
  res.send('Coucou');
});

module.exports = baseRouter;