import config from '../config.js';
import express from 'express';
import mysql from 'mysql';
import path, { dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const port = process.env.PORT;
const con = mysql.createConnection({
    ...config,
    multipleStatements: true
});

con.connect((err) => {
    if (err) {
        console.log('Error connecting to db');
        return;
    }
    console.log('Connection established');
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/static'));

app.use((req, res, next) => {
    console.log(`${req.method} from ${req.hostname} for ${req.url}`);
    next();
});

app.get('/', (req, res) => {
    res.sendFile("index.html");
});

app.get('/venues', (req, res) => {
    con.query(`SELECT name FROM venue`, (err, venues, fields) => {
        if(err) throw(err);
        res.send(venues);
    });
});

app.post('/matches', (req, res) => {
    const data = req.body;
    console.log(data);
    con.query(`SELECT p1.forename, p2.forename, date_played, court_number  FROM played_match inner join player p1 on played_match.p1_email=p1.email inner join player p2 on played_match.p2_email=p2.email where played_match.venue_name=?`, data.venue, (error, matches, fields) => {
        if(error) res.send({error});
        res.send({matches: matches});
    });
});

app.post('/player', (req, res) => {
    const data = req.body;
    console.log(data);
    con.query(`INSERT INTO player SET ?`, data.player, (error, matches, fields) => {
        if(error) res.send({error});
        res.send({ player: data.player });
    });
});

app.post('/player_phone', (req, res) => {
    const data = req.body;
    console.log(data);
    con.query(`INSERT INTO player_phone SET ?`, data.player_phone, (error, matches, fields) => {
        if(error) res.send({error});
        res.send({ player_phone: data.player_phone });
    });
});

app.listen(port, () => {
    console.log(`Listening at ${port}`);
});
