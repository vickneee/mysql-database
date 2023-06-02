let mysql = require('mysql');

let con = mysql.createConnection({
  host: "localhost",
  user: "PieniYritys",
  password: "PieniYritys123,",
  database: "Pieniyritys"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM Tyontekija", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
  console.log("Connected");
});
