-- 2.1
CREATE VIEW view_grass_courts AS
    SELECT number, venue_name, address
    FROM venue, court
    WHERE venue.name = court.venue_name
          AND court.surface='grass'
    ORDER BY venue.name asc, court.number;

-- 2.2
CREATE VIEW view_win_count AS
    SELECT email, elo, count(*) AS 'Number of matches won'
    FROM player, played_match
    WHERE player.email=winner(played_match.id)
    GROUP BY email
    ORDER BY elo desc, email;

-- 2.3
CREATE VIEW view_contact_details AS
    SELECT CONCAT_WS(' ', forename, middlenames, surname) AS 'Full name',
        player.email AS 'Email address',
        GROUP_CONCAT( phone_number ) AS 'Phone number(s)'
    FROM player, player_phone
    WHERE player.email=player_phone.email
    GROUP BY player.email
    ORDER BY surname, 'Full name', player.email;
