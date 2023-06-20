-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: es299_p2
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `court`
--

DROP TABLE IF EXISTS `court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `court` (
  `number` int(11) NOT NULL,
  `venue_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `surface` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`number`,`venue_name`),
  KEY `venue_name` (`venue_name`),
  CONSTRAINT `court_ibfk_1` FOREIGN KEY (`venue_name`) REFERENCES `venue` (`name`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`surface` in ('grass','clay','hardcourt'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `court`
--

LOCK TABLES `court` WRITE;
/*!40000 ALTER TABLE `court` DISABLE KEYS */;
INSERT INTO `court` VALUES (1,'East Sands Leisure Centre','hardcourt'),(1,'Forthill Lawn Tennis Club','clay'),(1,'University Sports Centre','hardcourt'),(1,'Waterstone Crook Sports Centre','grass'),(2,'East Sands Leisure Centre','hardcourt'),(2,'Forthill Lawn Tennis Club','clay'),(2,'University Sports Centre','hardcourt'),(2,'Waterstone Crook Sports Centre','grass'),(3,'University Sports Centre','hardcourt'),(3,'Waterstone Crook Sports Centre','hardcourt'),(4,'Waterstone Crook Sports Centre','hardcourt');
/*!40000 ALTER TABLE `court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_match`
--

DROP TABLE IF EXISTS `played_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p1_email` varchar(100) COLLATE utf8_bin NOT NULL,
  `p2_email` varchar(100) COLLATE utf8_bin NOT NULL,
  `date_played` date NOT NULL,
  `court_number` int(11) NOT NULL,
  `venue_name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p1_email` (`p1_email`),
  KEY `p2_email` (`p2_email`),
  KEY `court_number` (`court_number`),
  KEY `venue_name` (`venue_name`),
  CONSTRAINT `played_match_ibfk_1` FOREIGN KEY (`p1_email`) REFERENCES `player` (`email`),
  CONSTRAINT `played_match_ibfk_2` FOREIGN KEY (`p2_email`) REFERENCES `player` (`email`),
  CONSTRAINT `played_match_ibfk_3` FOREIGN KEY (`court_number`) REFERENCES `court` (`number`),
  CONSTRAINT `played_match_ibfk_4` FOREIGN KEY (`venue_name`) REFERENCES `venue` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_match`
--

LOCK TABLES `played_match` WRITE;
/*!40000 ALTER TABLE `played_match` DISABLE KEYS */;
INSERT INTO `played_match` VALUES (1,'jwh@hotmail.com','tabitha.stacey@gmail.com','2018-04-05',1,'University Sports Centre'),(2,'louis.payne@gmail.com','final_fantasy_freak1993@hotmail.com','2018-04-11',3,'University Sports Centre'),(3,'jwh@hotmail.com','sylvia.hathaway@gmail.com','2018-04-17',1,'University Sports Centre'),(4,'louis.payne@gmail.com','jwh@hotmail.com','2018-05-07',3,'University Sports Centre'),(5,'tabitha.stacey@gmail.com','final_fantasy_freak1993@hotmail.com','2018-05-23',2,'Forthill Lawn Tennis Club'),(6,'sylvia.hathaway@gmail.com','tabitha.stacey@gmail.com','2018-05-25',2,'Waterstone Crook Sports Centre'),(7,'louis.payne@gmail.com','tabitha.stacey@gmail.com','2018-05-28',1,'University Sports Centre'),(8,'final_fantasy_freak1993@hotmail.com','sylvia.hathaway@gmail.com','2018-06-13',1,'University Sports Centre'),(9,'jwh@hotmail.com','final_fantasy_freak1993@hotmail.com','2018-06-21',1,'University Sports Centre'),(10,'sylvia.hathaway@gmail.com','louis.payne@gmail.com','2018-07-09',3,'University Sports Centre'),(11,'srrogers@yahoo.co.uk','tasha.marsden@gmail.com','2018-09-30',1,'Waterstone Crook Sports Centre'),(12,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2018-10-28',2,'Forthill Lawn Tennis Club'),(13,'srrogers@yahoo.co.uk','u_marsden@gmail.com','2018-11-02',1,'Waterstone Crook Sports Centre'),(14,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2018-11-04',4,'Waterstone Crook Sports Centre'),(15,'tasha.marsden@gmail.com','u_marsden@gmail.com','2018-11-06',2,'Forthill Lawn Tennis Club'),(16,'gary_the_man@yahoo.co.uk','srrogers@yahoo.co.uk','2018-11-09',2,'Waterstone Crook Sports Centre'),(17,'tabitha.stacey@gmail.com','butch@xyz.club','2019-04-11',1,'University Sports Centre'),(18,'butch@xyz.club','final_fantasy_freak1993@hotmail.com','2019-04-12',1,'University Sports Centre'),(19,'sylvia.hathaway@gmail.com','butch@xyz.club','2019-04-16',3,'University Sports Centre'),(20,'gary_the_man@yahoo.co.uk','tabitha.stacey@gmail.com','2019-04-19',1,'University Sports Centre'),(21,'jwh@hotmail.com','sylvia.hathaway@gmail.com','2019-04-24',2,'Waterstone Crook Sports Centre'),(22,'gary_the_man@yahoo.co.uk','final_fantasy_freak1993@hotmail.com','2019-04-30',2,'Waterstone Crook Sports Centre'),(23,'sylvia.hathaway@gmail.com','final_fantasy_freak1993@hotmail.com','2019-05-03',4,'Waterstone Crook Sports Centre'),(24,'tabitha.stacey@gmail.com','final_fantasy_freak1993@hotmail.com','2019-05-13',3,'University Sports Centre'),(25,'jwh@hotmail.com','final_fantasy_freak1993@hotmail.com','2019-05-21',3,'University Sports Centre'),(26,'gary_the_man@yahoo.co.uk','sylvia.hathaway@gmail.com','2019-06-06',4,'Waterstone Crook Sports Centre'),(27,'tabitha.stacey@gmail.com','sylvia.hathaway@gmail.com','2019-06-28',1,'University Sports Centre'),(28,'jwh@hotmail.com','tabitha.stacey@gmail.com','2019-07-15',2,'Waterstone Crook Sports Centre'),(29,'jwh@hotmail.com','gary_the_man@yahoo.co.uk','2019-07-17',1,'University Sports Centre'),(30,'jwh@hotmail.com','butch@xyz.club','2019-07-22',1,'University Sports Centre'),(31,'gary_the_man@yahoo.co.uk','butch@xyz.club','2019-07-26',1,'University Sports Centre'),(32,'tasha.marsden@gmail.com','u_marsden@gmail.com','2019-09-27',2,'Waterstone Crook Sports Centre'),(33,'srrogers@yahoo.co.uk','u_marsden@gmail.com','2019-09-29',2,'Waterstone Crook Sports Centre'),(34,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2019-09-29',4,'Waterstone Crook Sports Centre'),(35,'srrogers@yahoo.co.uk','tasha.marsden@gmail.com','2019-10-02',1,'Forthill Lawn Tennis Club'),(36,'gary_the_man@yahoo.co.uk','srrogers@yahoo.co.uk','2019-10-09',1,'Waterstone Crook Sports Centre'),(37,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2019-10-30',3,'University Sports Centre'),(38,'tabitha.stacey@gmail.com','butch@xyz.club','2020-05-05',1,'Waterstone Crook Sports Centre'),(39,'butch@xyz.club','sylvia.hathaway@gmail.com','2020-05-15',2,'Waterstone Crook Sports Centre'),(40,'gary_the_man@yahoo.co.uk','sylvia.hathaway@gmail.com','2020-05-26',1,'East Sands Leisure Centre'),(41,'tabitha.stacey@gmail.com','sylvia.hathaway@gmail.com','2020-05-28',1,'East Sands Leisure Centre'),(42,'tabitha.stacey@gmail.com','gary_the_man@yahoo.co.uk','2020-07-03',2,'East Sands Leisure Centre'),(43,'butch@xyz.club','gary_the_man@yahoo.co.uk','2020-07-06',3,'University Sports Centre'),(44,'tasha.marsden@gmail.com','u_marsden@gmail.com','2020-10-02',1,'Waterstone Crook Sports Centre'),(45,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2020-10-09',2,'Waterstone Crook Sports Centre'),(46,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2020-11-05',1,'Forthill Lawn Tennis Club');
/*!40000 ALTER TABLE `played_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_set`
--

DROP TABLE IF EXISTS `played_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_set` (
  `match_id` int(11) NOT NULL,
  `set_number` int(11) NOT NULL,
  `p1_games_won` int(11) DEFAULT NULL,
  `p2_games_won` int(11) DEFAULT NULL,
  PRIMARY KEY (`match_id`,`set_number`),
  CONSTRAINT `played_set_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `played_match` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`set_number` > 0 and `set_number` <= 3),
  CONSTRAINT `CONSTRAINT_2` CHECK (`p1_games_won` >= 0 and `p2_games_won` >= 0),
  CONSTRAINT `CONSTRAINT_3` CHECK (`p1_games_won` = 6 and `p2_games_won` < 5 or `p2_games_won` = 6 and `p1_games_won` < 5 or `p1_games_won` = 7 and (`p2_games_won` = 5 or `p2_games_won` = 6) or `p2_games_won` = 7 and (`p1_games_won` = 5 or `p1_games_won` = 6) or `set_number` = 3 and `p1_games_won` = 0 and `p2_games_won` = 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_set`
--

LOCK TABLES `played_set` WRITE;
/*!40000 ALTER TABLE `played_set` DISABLE KEYS */;
INSERT INTO `played_set` VALUES (1,1,7,6),(1,2,1,6),(1,3,6,3),(2,1,6,4),(2,2,6,0),(2,3,0,0),(3,1,2,6),(3,2,7,6),(3,3,6,0),(4,1,0,6),(4,2,6,7),(4,3,0,0),(5,1,6,4),(5,2,3,6),(5,3,3,6),(6,1,3,6),(6,2,1,6),(6,3,0,0),(7,1,6,4),(7,2,2,6),(7,3,5,7),(8,1,5,7),(8,2,0,6),(8,3,0,0),(9,1,6,0),(9,2,6,3),(9,3,0,0),(10,1,6,0),(10,2,5,7),(10,3,6,7),(11,1,6,7),(11,2,2,6),(11,3,0,0),(12,1,0,6),(12,2,6,3),(12,3,3,6),(13,1,7,5),(13,2,6,3),(13,3,0,0),(14,1,6,4),(14,2,6,7),(14,3,6,2),(15,1,3,6),(15,2,0,6),(15,3,0,0),(16,1,0,6),(16,2,6,1),(16,3,3,6),(17,1,4,6),(17,2,6,3),(17,3,4,6),(18,1,6,7),(18,2,6,4),(18,3,6,1),(19,1,0,6),(19,2,0,6),(19,3,0,0),(20,1,7,5),(20,2,6,4),(20,3,0,0),(21,1,0,6),(21,2,1,6),(21,3,0,0),(22,1,5,7),(22,2,6,0),(22,3,6,2),(23,1,5,7),(23,2,7,5),(23,3,7,5),(24,1,6,7),(24,2,6,1),(24,3,4,6),(25,1,6,7),(25,2,0,6),(25,3,0,0),(26,1,6,4),(26,2,3,6),(26,3,6,3),(27,1,4,6),(27,2,3,6),(27,3,0,0),(28,1,2,6),(28,2,4,6),(28,3,0,0),(29,1,6,3),(29,2,3,6),(29,3,6,4),(30,1,6,3),(30,2,2,6),(30,3,6,7),(31,1,3,6),(31,2,2,6),(31,3,0,0),(32,1,6,2),(32,2,6,4),(32,3,0,0),(33,1,6,4),(33,2,5,7),(33,3,0,6),(34,1,4,6),(34,2,6,3),(34,3,5,7),(35,1,6,0),(35,2,0,6),(35,3,4,6),(36,1,6,0),(36,2,1,6),(36,3,7,6),(37,1,6,4),(37,2,6,2),(37,3,0,0),(38,1,4,6),(38,2,2,6),(38,3,0,0),(39,1,6,4),(39,2,5,7),(39,3,6,7),(40,1,6,0),(40,2,6,3),(40,3,0,0),(41,1,6,4),(41,2,6,4),(41,3,0,0),(42,1,3,6),(42,2,7,6),(42,3,6,0),(43,1,7,6),(43,2,6,7),(43,3,4,6),(44,1,6,2),(44,2,6,7),(44,3,4,6),(45,1,7,6),(45,2,7,6),(45,3,0,0),(46,1,6,4),(46,2,6,7),(46,3,6,3);
/*!40000 ALTER TABLE `played_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `forename` varchar(100) COLLATE utf8_bin NOT NULL,
  `middlenames` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(100) COLLATE utf8_bin NOT NULL,
  `date_of_birth` date NOT NULL,
  `elo` int(11) DEFAULT 1000,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('butch@xyz.club','Jamie','Eugene Korey','Butcher','1985-09-21',1000),('final_fantasy_freak1993@hotmail.com','Kirsten','Aileen Louise','Jackman','1993-10-28',1000),('gary_the_man@yahoo.co.uk','Gary','Carl','Marsden','1985-10-12',1000),('jwh@hotmail.com','Jeremy','Wardell','Huddleston','1991-02-13',1000),('leighton.buzzard@gmail.com','Leighton','Alan','Buzzard','1980-05-17',1000),('louis.payne@gmail.com','Louis','Kennard','Payne','2000-05-31',1000),('mad_maddy@gmail.com','Madeleine','','Daubney','1991-03-08',1000),('srrogers@yahoo.co.uk','Sue','Rosemary','Rogers','1965-07-30',1000),('sylvia.hathaway@gmail.com','Sylvia','Loraine','Hathaway','2004-01-02',1000),('tabitha.stacey@gmail.com','Tabitha','','Stacey','2005-09-10',1000),('tasha.marsden@gmail.com','Natasha','Joy Bernardette Louise','Marsden','1960-04-28',1000),('u_marsden@gmail.com','Ulysses','','Marsden','1977-05-07',1000);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_phone`
--

DROP TABLE IF EXISTS `player_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_phone` (
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`phone_number`,`email`),
  KEY `email` (`email`),
  CONSTRAINT `player_phone_ibfk_1` FOREIGN KEY (`email`) REFERENCES `player` (`email`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`phone_number`  not like '%[^0-9]%'),
  CONSTRAINT `CONSTRAINT_2` CHECK (`phone_type` in ('home','mobile','work'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_phone`
--

LOCK TABLES `player_phone` WRITE;
/*!40000 ALTER TABLE `player_phone` DISABLE KEYS */;
INSERT INTO `player_phone` VALUES ('mad_maddy@gmail.com','0115 496 0961','work'),('leighton.buzzard@gmail.com','0117 496 0714','home'),('jwh@hotmail.com','0131 496 0470','home'),('u_marsden@gmail.com','0131 496 0745','home'),('leighton.buzzard@gmail.com','0131 496 0962','work'),('gary_the_man@yahoo.co.uk','0151 496 0777','home'),('mad_maddy@gmail.com','020 7946 0501','home'),('louis.payne@gmail.com','07700 900654','mobile'),('final_fantasy_freak1993@hotmail.com','07700 900909','mobile'),('sylvia.hathaway@gmail.com','07700 900939','mobile'),('srrogers@yahoo.co.uk','07700 900949','mobile'),('tasha.marsden@gmail.com','078 8934 4229','mobile'),('tabitha.stacey@gmail.com','07837 585417','mobile'),('butch@xyz.club','079 6943 8448','mobile');
/*!40000 ALTER TABLE `player_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('East Sands Leisure Centre','\"2 St Mary St, St Andrews KY16 8LH\"'),('Forthill Lawn Tennis Club','\"20 Forthill Road, Broughty Ferry, Dundee DD5 3SR\"'),('University Sports Centre','\"9 St Leonard�s Rd, St Andrews KY16 9DY\"'),('Waterstone Crook Sports Centre','\"69 Kirk Rd, Newport-on-Tay DD6 8HY\"');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_contact_details`
--

DROP TABLE IF EXISTS `view_contact_details`;
/*!50001 DROP VIEW IF EXISTS `view_contact_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_contact_details` (
  `Full name` tinyint NOT NULL,
  `Email address` tinyint NOT NULL,
  `Phone number(s)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_grass_courts`
--

DROP TABLE IF EXISTS `view_grass_courts`;
/*!50001 DROP VIEW IF EXISTS `view_grass_courts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_grass_courts` (
  `number` tinyint NOT NULL,
  `venue_name` tinyint NOT NULL,
  `address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_win_count`
--

DROP TABLE IF EXISTS `view_win_count`;
/*!50001 DROP VIEW IF EXISTS `view_win_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_win_count` (
  `email` tinyint NOT NULL,
  `elo` tinyint NOT NULL,
  `Number of matches won` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'es299_p2'
--
/*!50003 DROP FUNCTION IF EXISTS `winner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`es299`@`%` FUNCTION `winner`(match_id int) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_bin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_add_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`es299`@`%` PROCEDURE `proc_add_match`(
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
    SELECT 'before match_id';
    SET match_id = LAST_INSERT_ID();
    SELECT 'match_id';
    SELECT match_id;
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_contact_details`
--

/*!50001 DROP TABLE IF EXISTS `view_contact_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_contact_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`es299`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contact_details` AS select concat_ws(' ',`player`.`forename`,`player`.`middlenames`,`player`.`surname`) AS `Full name`,`player`.`email` AS `Email address`,group_concat(`player_phone`.`phone_number` separator ',') AS `Phone number(s)` from (`player` join `player_phone`) where `player`.`email` = `player_phone`.`email` group by `player`.`email` order by `player`.`surname`,'Full name',`player`.`email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_grass_courts`
--

/*!50001 DROP TABLE IF EXISTS `view_grass_courts`*/;
/*!50001 DROP VIEW IF EXISTS `view_grass_courts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`es299`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_grass_courts` AS select `court`.`number` AS `number`,`court`.`venue_name` AS `venue_name`,`venue`.`address` AS `address` from (`venue` join `court`) where `venue`.`name` = `court`.`venue_name` and `court`.`surface` = 'grass' order by `venue`.`name`,`court`.`number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_win_count`
--

/*!50001 DROP TABLE IF EXISTS `view_win_count`*/;
/*!50001 DROP VIEW IF EXISTS `view_win_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`es299`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_win_count` AS select `player`.`email` AS `email`,`player`.`elo` AS `elo`,count(0) AS `Number of matches won` from (`player` join `played_match`) where `player`.`email` = `winner`(`played_match`.`id`) group by `player`.`email` order by `player`.`elo` desc,`player`.`email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12  7:56:00
