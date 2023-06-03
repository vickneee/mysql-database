const http = require('http')
const qs = require('querystring');
const mf = require('./MyFunctions.js');
const mysql = require('mysql');
const con = mysql.createConnection({
    host: "127.0.0.1",
    user: "PieniYritys",
    password: "PieniYritys123,",
    database: "PieniYritys",
    charset: "utf8mb4" // Charset correction
});
con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
});
const hostname = 'localhost';
const port = 8500;
let sql = "";
let QueryResult = "";

function reqListener(req, res) {
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
    const url = req.url;
    const method = req.method;
    if (url === '/') {
        sql = ""
        QueryResult = ""
        res.write(mf.CreateHTML(sql));
        return res.end();
    }
    if (url === '/Query' && method === 'POST') {
        let body = [];
        req.on('data', (chunk) => {
            body.push(chunk);
        });
        req.on('end', () => {
            body = Buffer.concat(body).toString();
            console.log(body)
            const post = qs.parse(body);
            sql = post.Sql;
            //console.log(sql)
            con.query(sql, function (err, result) {
                if (err) {
                    let message = 'Jotain ongelmia sql lauseessa';
                    message = sql + '\n' + message;
                    res.write(mf.CreateHTML(message));
                    return res.end();
                }
                res.write(mf.CreateHTML(sql));
                res.write(mf.CreateTable(result));
                return res.end();
            });
        });
    }
}

const server = http.createServer(reqListener);
server.listen(port, hostname, () => {
    console.log(`Server running at https://${hostname}:${port}/`);
});
