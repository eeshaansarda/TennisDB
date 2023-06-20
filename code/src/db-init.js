import fs from 'fs';
import config from '../config.js';
import mysql from 'mysql';
import path, { dirname } from 'path';
import { fileURLToPath } from 'url';
import { parse } from 'csv-parse';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

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

const initcommands = fs.readFileSync(path.join(__dirname, './database/db.sql')).toString();
con.query(initcommands,  (err, result) => {
    if (err) throw err;
    if(result) console.log("Database initialised");
});
//const viewcommands = fs.readFileSync(path.join(__dirname, './database/views.sql')).toString();
//con.query(viewcommands,  (err, result) => {
    //if (err) throw err;
    //if(result) console.log("Views added");
//});

readSampleDataAndInsert();

function csvToArray(path, linesRemove) {
    const data = fs.readFileSync(path, 'utf-8').split('\n');
    data.splice(0, linesRemove);
    return data.map(row => row.trim().split(','));
}

function readSampleDataAndInsert() {
    const people = [];
    const people_phone = [];
    const venues = [];
    const courts = [];
    const match_played = [];
    const set_played = [];

    // people and phone
    let data = csvToArray(path.join(__dirname, '../data/people.csv'), 1);
    for(let row of data) {
        if(row.length < 5) continue;
        const date = row[3].split('/');
        const dbDate = date[2].concat('/', date[1], '/',date[0]);
        const entry = {
            email: row[4],
            forename: row[0],
            middlenames: row[1],
            surname: row[2],
            date_of_birth: dbDate,
        };
        people.push(entry);
        // phone numbers
        let phone_numbers = [];
        if(row.length === 8) {
            phone_numbers.push(row[5], row[6]);
        } else phone_numbers.push(row[5]);

        // split into type
        Array.prototype.forEach.call(phone_numbers, number => {
            let temp = number.split('(');
            if(phone_numbers.length > 1) temp[0] = temp[0].substring(1);
            if(temp[1]) temp[1] = temp[1].slice(0,-1) // removes the ) character from the end
            if(temp[1].slice(-1) == ')') temp[1] = temp[1].slice(0,-1) // removes the ) character from the end
            const secondEntry = {
                email: row[4], phone_number: temp[0].trim(), phone_type: temp[1]
            };
            people_phone.push(secondEntry); // player_phone table
        });
    }
    console.log("people loaded");
    addDataToTable("player", people);
    addDataToTable("player_phone", people_phone);

    // venue
    data = csvToArray(path.join(__dirname, '../data/venue.csv'), 6);
    for(let row of data) {
        if(row.length < 2) continue;
        const [first, ...rest] = row;
        const entry = {
            name: first,
            address: rest.join(',')
        };
        venues.push(entry);
    }
    addDataToTable("venue", venues);
    console.log("venues loaded");

    // courts
    data = csvToArray(path.join(__dirname, '../data/courts.csv'), 1);
    for(let row of data) {
        if(row.length < 2) continue;
        const entry = {
            venue_name: row[0],
            number: row[1],
            surface: row[2].toLowerCase()
        }
        courts.push(entry)
    }
    addDataToTable("court", courts);
    console.log("courts loaded")

    // matches played and sets played
    data = csvToArray(path.join(__dirname, '../data/matches_played.csv'), 6);
    for(let i = 0; i < data.length; i++) {
        let row = data[i];
        if(row.length < 10) continue;
        con.query(`SELECT email, forename FROM player WHERE forename='${row[0]}' or forename='${row[1]}'`, (err, players, fields) => {
            if(err) throw(err);
            //console.log('players', players);
            const date = row[10].split('/');
            const dbDate = date[2].concat('/', date[1], '/',date[0]);
            const entry = {
                id: i+1,
                p1_email: players[0].forename == row[0] ? players[0].email : players[1].email,
                p2_email: players[1].forename == row[1] ? players[1].email : players[0].email,
                date_played: dbDate,
                court_number: row[9],
                venue_name: row[8]
            }
            //console.log(entry);
            match_played.push(entry);
            //played_set entry
            const set1 = {
                match_id: i+1,
                set_number: 1,
                p1_games_won: parseInt(row[2]),
                p2_games_won: parseInt(row[3])
            };
            const set2 = {
                match_id: i+1,
                set_number: 2,
                p1_games_won: parseInt(row[4]),
                p2_games_won: parseInt(row[5])
            };
            if(row[6] === "-") row[6] = 0;
            if(row[7] === "-") row[7] = 0;
            const set3 = {
                match_id: i+1,
                set_number: 3,
                p1_games_won: parseInt(row[6]),
                p2_games_won: parseInt(row[7])
            };
            set_played.push(set1, set2, set3);
            if(i === data.length - 2) {
                //console.log(match_played, set_played);
                addDataToTable("played_match", match_played);
                addDataToTable("played_set", set_played);
                console.log("matches played loaded");
                con.end((err) => {
                    if (err) console.log('Error disconnecting from Db')
                    else console.log("Disconnected successfully")
                });

            }
        });
    }
}

function addDataToTable(tableName, array) {
    let insertStatement = `INSERT INTO ${tableName} SET ?;`;
    array.forEach(row => {
        con.query(insertStatement, row, (err, result) => {
            if(err) throw err;
            console.log(insertStatement);
            console.log(`row added to ${tableName} table`);
        });
    });
}
