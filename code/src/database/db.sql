DROP TABLE IF EXISTS played_set;
DROP TABLE IF EXISTS played_match;
DROP TABLE IF EXISTS court;
DROP TABLE IF EXISTS venue;
DROP TABLE IF EXISTS player_phone;
DROP TABLE IF EXISTS player;

CREATE TABLE player (
    email           varchar(100),
    forename        varchar(100) NOT NULL,
    middlenames     varchar(100) DEFAULT NULL,
    surname         varchar(100) NOT NULL,
    date_of_birth   date         NOT NULL,
    elo             int          DEFAULT 1000,

    PRIMARY KEY (email)
);

CREATE TABLE player_phone (
    email           varchar(100),
    phone_number    varchar(20),
    phone_type      varchar(10),

    PRIMARY KEY (phone_number, email),
    FOREIGN KEY (email) REFERENCES player (email)
        ON DELETE CASCADE,
    CHECK (phone_number not like '%[^0-9]%'),
    CHECK (phone_type in ('home', 'mobile', 'work'))
);

CREATE TABLE venue (
    name        varchar(100),
    address     varchar(200)    NOT NULL,

    PRIMARY KEY (name)
);

CREATE TABLE court (
    number        int,
    venue_name    varchar(100)  NOT NULL,
    surface       varchar(15),

    PRIMARY KEY (number, venue_name),
    FOREIGN KEY (venue_name) REFERENCES venue (name),
    CHECK (surface in ('grass', 'clay', 'hardcourt'))
);

CREATE TABLE played_match (
    id              int             AUTO_INCREMENT,
    p1_email        varchar(100)    NOT NULL,
    p2_email        varchar(100)    NOT NULL,
    date_played     date            NOT NULL,
    court_number    int             NOT NULL,
    venue_name      varchar(100)    NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (p1_email)           REFERENCES player (email),
    FOREIGN KEY (p2_email)           REFERENCES player (email),
    FOREIGN KEY (court_number)       REFERENCES court (number),
    FOREIGN KEY (venue_name)         REFERENCES venue (name)
);

CREATE TABLE played_set (
    match_id        int,
    set_number      int,
    p1_games_won    int,
    p2_games_won    int,

    PRIMARY KEY (match_id, set_number),
    FOREIGN KEY (match_id) REFERENCES played_match (id)
        ON DELETE CASCADE,
    CHECK (set_number > 0 and set_number <= 3),
    CHECK (p1_games_won >= 0 and p2_games_won >= 0),
    CHECK ((p1_games_won = 6 and p2_games_won < 5)
          or (p2_games_won = 6 and p1_games_won < 5)
          or (p1_games_won = 7 and (p2_games_won = 5 or p2_games_won = 6))
          or (p2_games_won = 7 and (p1_games_won = 5 or p1_games_won = 6))
          or (set_number = 3 and p1_games_won = 0 and p2_games_won = 0)
    )
);
