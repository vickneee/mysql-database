let mysql = require('mysql');

let con = mysql.createConnection({
  host: "localhost",
  user: "PieniYritys",
  password: "PieniYritys123,",
  database: "PieniYritys"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
