const baseRouter = require('./baseRouter');
const stadiumRouter = require('./stadiumRouter');
const clubRouter = require('./clubRouter');
const championshipRouter = require('./championshipRouter');
const footballplayerRouter = require('./footballplayerRouter');

const setupRoutes = (app) => {
  app.use(baseRouter);
  app.use('/stadium', stadiumRouter);
  app.use('/club', clubRouter);
  app.use('/championship', championshipRouter);
  app.use('/footballplayer', footballplayerRouter);
  
};

module.exports = setupRoutes;