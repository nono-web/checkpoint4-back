const connection = require('../db-config');

const db = connection.promise();

const findAllChampionships = () => db.query('SELECT * FROM championship');

const findOneChampionship = (id) => db.query('SELECT * FROM championship WHERE id = ?', [id]);

module.exports = {
    findAllChampionships,
    findOneChampionship,
  };