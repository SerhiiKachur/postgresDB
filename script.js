const {Client} = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'not_rozetka'
}

const client = new Client(config);

start();
async function start(){
  await client.connect();
 
//  створення таблиці через JavaScript
//  const result = await client.query(`
//  CREATE TABLE scripted_table(
//   id SERIAL PRIMARY KEY
//  )
//  `);

  const result = await client.query(`
  INSERT INTO scripted_table VALUES
  (1),(2),(3) RETURNING *;
  `)
  console.log(result);
  await client.end();
}