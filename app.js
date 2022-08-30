const express = require('express');
const app = express();

app.get('/', (req, res) => {
  console.log('Hello world received a request.');

  const target = process.env.TARGET || 'World';
  res.send(`Hello ${target}!`);
});

app.get('/echo', (req, res) => {
  res.send(`Hello ${target}!`);
});

const port = process.env.PORT || 8080;
module.exports = app.listen(port, () => {
  console.log('Hello world listening on port', port);
});
