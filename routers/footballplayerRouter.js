const footballplayerRouter = require('express').Router();
const Joi = require('joi');

const {
    findAllPlayers,
    findOnePlayer,
    postPlayers,
    putPlayer,
    deletePlayer,
  } = require('../models/footballplayerModel');

  const playerValidation = Joi.object({
    firstname: Joi.string().max(100).required(),
    lastname: Joi.string().max(100).required(),
    age: Joi.string().max(200).required(),
    img: Joi.string().max(355).required(),
    height: Joi.number().required(),
    weight: Joi.number().required(),
    number: Joi.string().required(),
    post: Joi.string().required(),
    clubId: Joi.number(),
  });
  
  const playerUpdate = Joi.object({
    firstname: Joi.string().max(100),
    lastname: Joi.string().max(100),
    age: Joi.string().max(200),
    img: Joi.string().max(355),
    height: Joi.number(),
    weight: Joi.number(),
    number: Joi.string(),
    post: Joi.string(),
  });

footballplayerRouter.get('/', async (req, res) => {
    try {
      const [result] = await findAllPlayers(req.query);
  
      if (!result.length) {
        return res.status(404).json({ message: 'No Player found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: `An error occurred: ${err.message}` });
    }
  });

footballplayerRouter.get('/:id', async (req, res) => {
    try {
      const [result] = await findOnePlayer(req.params.id);
  
      if (!result) {
        return res.status(404).json({ message: 'No player found' });
      }
      return res.json(result);
    } catch (err) {
      console.log(err);
      return res.status(500).send(`An error occurred: ${err.message}`);
    }
  });

footballplayerRouter.post('/', async (req, res) => {
    const { error, value: validPlayer } = playerValidation.validate(req.body);
    if (error) {
      return res.status(422).json({ message: 'Invalid data', error });
    }
  
    try {
      const [result] = await postPlayers(validPlayer);
      console.log(result);
      return res.status(201).json({ id: result.insertId, ...validPlayer });
    } catch (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error saving the player' });
    }
  });


footballplayerRouter.put('/:id', async (req, res) => {
    const { error, value: validPlayer } = playerUpdate.validate(req.body);
    const { id } = req.params;
  
    if (error) {
      return res.status(422).json({ message: 'Invalid data', error });
    }
    try {
      await putPlayer(validPlayer, id);
      return res.status(201).json({ id, ...validPlayer });
    } catch (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error saving the Player' });
    }
  });

  footballplayerRouter.delete('/:id', async (req, res) => {
    const { id } = req.params;
  
    try {
      const [idResult] = await findOnePlayer(id);
      if (!idResult.length) {
        return res.json({ message: `Player number ${id} doesn't exist` });
      }
      await deletePlayer(id);
      return res.status(200).json({ message: `🎉 Player ${id} deleted!` });
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: `Error deleting player ${id}` });
    }
  });

  module.exports = footballplayerRouter;