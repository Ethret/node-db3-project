const db = require('../data/db-config.js');

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes').where({ id }).first();
}

function findSteps(id) {
  return db('steps as st')
    .join('schemes as u', 'u.id', 'p.user_id')
    .select('p.id', 'u.username', 'p.contets')
    .where({ user_id });
}

function add(schemeData) {
  return db('schemes').insert(schemeData);
}

function update(changes, id) {
  return db('schemes').update(changes);
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  // update,
  // remove
};
