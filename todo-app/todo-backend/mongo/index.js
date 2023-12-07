const mongoose = require('mongoose')
const Todo = require('./models/Todo')
const { MONGO_URL } = require('../util/config')
if (MONGO_URL && !mongoose.connection.readyState) mongoose.connect(MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
  console.log(`Mongoose connection ${MONGO_URL}`)
}).catch(err => console.log('failed to connect to Mongoose'))


module.exports = {
  Todo
}
