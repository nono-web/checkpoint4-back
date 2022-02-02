const stadiumRouter = require('express').Router();

const {
    findAllStadiums,
    findOneStadium,
  } = require('../models/stadiumModel');

stadiumRouter.get('/', async (req, res) => {
    try {
      const [result] = await findAllStadiums(req.query);
  
      if (!result.length) {
        return res.status(404).json({ message: 'No stadium found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: `An error occurred: ${err.message}` });
    }
  });

  stadiumRouter.get('/:id', async (req, res) => {
    try {
      const [result] = await findOneStadium(req.params.id);
  
      if (!result) {
        return res.status(404).json({ message: 'No stadium found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).send(`An error occurred: ${err.message}`);
    }
  });

  module.exports = stadiumRouter;
  
