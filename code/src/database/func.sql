DELIMITER $$
create function winner(match_id int) returns varchar(100)
begin
    DECLARE pwinner varchar(100);
    SELECT
        CASE WHEN count(*) >= 2
            THEN played_match.p1_email
            ElSE played_match.p2_email
        END INTO pwinner
        FROM played_set, played_match
        WHERE played_set.match_id = played_match.id
            AND played_match.id = match_id
            AND played_set.p1_games_won > played_set.p2_games_won;
    return pwinner;
end $$
DELIMITER ;


DELIMITER $$
create procedure proc_add_match(
       in p1_email varchar(100),
       in p2_email varchar(100),
       in date_played date,
       in venue_name varchar(100),
       in court_number int,
       in p1_score_1 int,
       in p2_score_1 int,
       in p1_score_2 int,
       in p2_score_2 int,
       in p1_score_3 int,
       in p2_score_3 int
       )
begin
    DECLARE match_id int;
    DECLARE loser_email varchar(100);
    DECLARE w_elo int;
    DECLARE l_elo int;
    INSERT INTO
           played_match(p1_email, p2_email, date_played, court_number, venue_name)
           VALUES (p1_email, p2_email, date_played, court_number, venue_name);
    SET match_id = LAST_INSERT_ID();
    INSERT INTO played_set(match_id, set_number, p1_games_won, p2_games_won)
           VALUES (match_id, 1, p1_score_1, p2_score_1),
                  (match_id, 2, p1_score_2, p2_score_2),
                  (match_id, 3, p1_score_3, p2_score_3);
    SET loser_email = (SELECT CASE
        WHEN p1_email != winner(match_id) THEN p1_email
        ELSE p2_email
    END);
    SET w_elo = (SELECT elo FROM player WHERE email=winner(match_id));
    SET l_elo = (SELECT elo FROM player WHERE email=loser_email);
    UPDATE player SET elo=(elo+(40*(1-1/(1+10^((l_elo-w_elo)/400))))) WHERE email=winner(match_id);
    UPDATE player SET elo=(elo-(40*(1-1/(1+10^((l_elo-w_elo)/400))))) WHERE email=loser_email;
end $$
DELIMITER ;
