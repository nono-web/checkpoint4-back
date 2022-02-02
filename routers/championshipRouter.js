const championshipRouter = require('express').Router();

const {
    findAllChampionships,
    findOneChampionship,
  } = require('../models/championshipModel');

  championshipRouter.get('/', async (req, res) => {
    try {
      const [result] = await findAllChampionships(req.query);
  
      if (!result.length) {
        return res.status(404).json({ message: 'No Club found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: `An error occurred: ${err.message}` });
    }
  });

  championshipRouter.get('/:id', async (req, res) => {
    try {
      const [result] = await findOneChampionship(req.params.id);
  
      if (!result) {
        return res.status(404).json({ message: 'No championship found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).send(`An error occurred: ${err.message}`);
    }
  });

  module.exports = championshipRouter;
  
