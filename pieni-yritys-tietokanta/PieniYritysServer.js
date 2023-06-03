const mysql = require('mysql');

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'PieniYritys',
    password: 'PieniYritys123,',
    database: 'PieniYritys'
});

function executeQuery(sql) {
    return new Promise((resolve, reject) => {
            connection.query(sql, function (err, result) {
                if (err) {
                    reject(err);
                } else {
                    result.forEach((row) => {
                        // Convert spvm to date format (YYYY-MM-DD)
                        const spvmDate = new Date(row.spvm);
                        row.spvm = spvmDate.toISOString().split('T')[0];
                    });
                    resolve(result);
                }
            });
        }
    );
}

async function logData() {
    const sql = 'SELECT tnro, enimi, snimi, spvm, sp FROM Tyontekija';
    try {
        const result = await executeQuery(sql);
        console.log('Query Result:');
        console.log(result);
        console.log('Query Result (JSON format):');
        console.log(JSON.stringify(result));
        console.log('Query Result (JavaScript object):');
        console.log(result);
        console.log('Query Result (Table format):');
        console.table(result);
    } catch (error) {
        console.error('Error executing query:', error);
    } finally {
        connection.end();
    }
}

// Connect to the MySQL database
connection.connect(function (error) {
    if (error) {
        console.error('Error connecting to the database:', error);
    } else {
        console.log('Connected to the database!');
        // Log the results
        logData();
    }
});
