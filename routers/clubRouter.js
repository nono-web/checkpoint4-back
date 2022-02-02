const clubRouter = require('express').Router();

const {
    findAllClubs,
    findOneClub,
  } = require('../models/clubModel');


clubRouter.get('/', async (req, res) => {
    try {
      const [result] = await findAllClubs(req.query);
  
      if (!result.length) {
        return res.status(404).json({ message: 'No Club found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: `An error occurred: ${err.message}` });
    }
  });

 clubRouter.get('/:id', async (req, res) => {
    try {
      const [result] = await findOneClub(req.params.id);
  
      if (!result) {
        return res.status(404).json({ message: 'No club found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).send(`An error occurred: ${err.message}`);
    }
  });

  module.exports = clubRouter;