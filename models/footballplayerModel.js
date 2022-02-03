const connection = require('../db-config');

const db = connection.promise();

const findAllPlayers = () => db.query('SELECT * FROM footballplayer');

const findOnePlayer = (id) => db.query('SELECT * FROM footballplayer WHERE id = ?', [id]);

const postPlayers = (
  { firstname,
    lastname,
    age,
    img,
    height,
    weight,
    number,
    post,
    clubId,}
  ) => {
   return  db.query(
      'INSERT INTO footballplayer (firstname, lastname, age, img, height, weight, number, post, clubId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        firstname,
        lastname,
        age,
        img,
        height,
        weight,
        number,
        post,
        clubId,
      ],
    );
  };

  const putPlayer = (validPlayer, id) => db.query('UPDATE footballplayer SET ? WHERE id = ?', [validPlayer, id]);

const deletePlayer = (id) => db.query('DELETE FROM footballplayer WHERE id = ?', [id]);



module.exports = {
    findAllPlayers,
    findOnePlayer,
    postPlayers,
    putPlayer,
    deletePlayer,
  };