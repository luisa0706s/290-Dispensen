/* *******************************************************************************************
* Autor: T. Kavazov, L. Siebert, 1/2024
* *******************************************************************************************
* Beschreibung:
* Express-Server, um CRUD-Operationen vom Browser entgegen zunehmen an der DB durchzuführen
* *******************************************************************************************
* Hinweise
* npm install node
* npm init -y
* npm install mysql
* npm install body-parser
* npm install express
** ***************************************************************************************** */

/* express konfigurieren */
const mysql = require("mysql");
const express = require('express');
var app = express();
const path = require('path');
const bodyParser = require('body-parser');

/* port 3002 konfigurieren */
const port = 3002;

app.use(bodyParser.json());

const config = {
    host: 'localhost',
    database: 'DispensenDB',
    user: "appAdmin",
    password: 'appAdminPW'
}

const connection = mysql.createConnection(config)

/* Ausgabe für Datenbank-Connection */
connection.connect(function(err) {
    if (err) throw err;
    console.log('Connected to MySQL database:', connection.config.database);
   /*
    var sqlstmt = 'SELECT * from user';
    // Das SQL-Statement wird vorbereitetet
    connection.query(sqlstmt, function (err, result) {
        if (err) throw err;
        // console.log('Data from MySQL:');
        //console.log(result); //
    });
    */
});

/* Ausgabe für Port */
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

/* Ausgabe der ganzen Tabelle Eintraege */
app.get('/SQL/tables.sql', (req, res) => {
    connection.query('SELECT * FROM Eintraege', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});

/* Ausgabe bestimmter Datensatz der Tabelle Eintraege */
app.get('/Eintraege/:id', (req, res) => {
    connection.query('SELECT * FROM Eintraege WHERE id = ?', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});

/* Ausgabe DELETE bestimmter Datensatz der Tabelle Eintraege */
app.delete('/Eintraege/:id', (req, res) => {
    connection.query(' DELETE FROM Eintraege WHERE id = ? ', [req.params.id], (err, rows, fields) => {
        if (!err) {
            res.send('Delete operation was successful')
            // res.send(rows)
        } else {
            console.log(err);
        }

    })
});



app.get('/eintraege', (req, res) => {
    connection.query('SELECT * FROM ' +
        'eintraege', [req.params.id], (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.send(rows);
        } else {
            console.log(err);
        }

    })
});