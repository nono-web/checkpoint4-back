const pool = require('../db-config');
const connection = require('../db-config');

const db = pool.promise();

const findAllClubs = () => db.query('SELECT * FROM club');

const findOneClub = (id) => db.query('SELECT * FROM club WHERE id = ?', [id]);


module.exports = {
    findAllClubs,
    findOneClub,
  };