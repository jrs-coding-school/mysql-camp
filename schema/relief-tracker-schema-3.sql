CREATE DATABASE  IF NOT EXISTS `relief_tracker` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `relief_tracker`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 0.0.0.0    Database: relief_tracker
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `firstName` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (6,'Ananias','Steve','stevean@duke.edu',1,'843 555-1515'),(7,'Jefferson','Tom','TJ@dentalone.com',1,'843 444-4444'),(8,'Johnson','Gary','gary.johnson1967@gmail.com',1,'843 555 8976'),(9,'Johnston','Wyatt','WyattJ1111@gmail.com',1,'843 222-1212'),(10,'Jones','Judy','judy5555@aol.com',1,'843 555-5555'),(11,'Satterfield','Libby','lsat1972@gmail.com',1,'843 888-8438'),(12,'Smith','Robin','rsmith@jeffersoninsurance.com',1,'843 333-3333'),(18,'Harvey','Steve','steveharvey2222@gmail.com',1,'404 303-1112');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relief`
--

DROP TABLE IF EXISTS `relief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relief` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `organizationID` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `phase` enum('planning','active','completed') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relief`
--

LOCK TABLES `relief` WRITE;
/*!40000 ALTER TABLE `relief` DISABLE KEYS */;
INSERT INTO `relief` VALUES (4,'Haiti 2015','St. Phillips','Provide dental services, education, and supplies to the village of Gros Mangle on the island of La Gonave, Haiti.  Island of La Gonave, Haiti. Home base is located in the main town of Anse - à - Galets at the St.François d’ Assise church and school.','2015-11-01','2015-11-08','completed'),(5,'Haiti 2017','St. Phillips','Provide dental services, education, and supplies to the village of Gros Mangle on the island of La Gonave, Haiti.  Island of La Gonave, Haiti. Home base is located in the main town of Anse - à - Galets at the St.François d’ Assise church and school.','2017-02-01','2017-02-08','planning'),(6,'Hurricane Sandy','Disaster Helpers','Hurrican relief','2012-10-05','2012-10-12','completed');
/*!40000 ALTER TABLE `relief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reliefObjective`
--

DROP TABLE IF EXISTS `reliefObjective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reliefObjective` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reliefID` int(11) unsigned NOT NULL,
  `name` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `type` enum('primary','secondary') COLLATE latin1_general_ci NOT NULL DEFAULT 'primary',
  `successFactor` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IDX_Objective_reliefID` (`reliefID`),
  CONSTRAINT `FK_Objective_Relief` FOREIGN KEY (`reliefID`) REFERENCES `relief` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reliefObjective`
--

LOCK TABLES `reliefObjective` WRITE;
/*!40000 ALTER TABLE `reliefObjective` DISABLE KEYS */;
INSERT INTO `reliefObjective` VALUES (1,5,'Build desks','Build desks',1,'primary',1),(2,5,'Build blackboards','Build blackboards',0,'primary',1);
/*!40000 ALTER TABLE `reliefObjective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reliefTeam`
--

DROP TABLE IF EXISTS `reliefTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reliefTeam` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personID` int(11) unsigned NOT NULL,
  `reliefID` int(11) unsigned NOT NULL,
  `role` enum('Team Leader','Team Member') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UI_reliefTeam_personID_reliefID` (`personID`,`reliefID`),
  KEY `FK_reliefTeam_person_idx` (`personID`),
  KEY `FK_reliefTeam_relief_idx` (`reliefID`),
  CONSTRAINT `FK_reliefTeam_person` FOREIGN KEY (`personID`) REFERENCES `person` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reliefTeam_relief` FOREIGN KEY (`reliefID`) REFERENCES `relief` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reliefTeam`
--

LOCK TABLES `reliefTeam` WRITE;
/*!40000 ALTER TABLE `reliefTeam` DISABLE KEYS */;
INSERT INTO `reliefTeam` VALUES (1,8,5,'Team Leader'),(2,12,5,'Team Leader'),(3,7,5,'Team Member'),(4,6,4,'Team Leader'),(5,12,4,'Team Member'),(6,10,4,'Team Member');
/*!40000 ALTER TABLE `reliefTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vReliefEffort`
--

DROP TABLE IF EXISTS `vReliefEffort`;
/*!50001 DROP VIEW IF EXISTS `vReliefEffort`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vReliefEffort` AS SELECT
 1 AS `reliefID`,
 1 AS `reliefName`,
 1 AS `reliefOrganization`,
 1 AS `reliefDesc`,
 1 AS `reliefStart`,
 1 AS `reliefEnd`,
 1 AS `reliefPhase`,
 1 AS `teamPersonID`,
 1 AS `teamPersonName`,
 1 AS `teamRole`,
 1 AS `objectiveID`,
 1 AS `objectiveName`,
 1 AS `objectiveType`,
 1 AS `objectiveDescription`,
 1 AS `objectiveCompleted`,
 1 AS `objectiveSuccessFactor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vReliefEffortTeam`
--

DROP TABLE IF EXISTS `vReliefEffortTeam`;
/*!50001 DROP VIEW IF EXISTS `vReliefEffortTeam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vReliefEffortTeam` AS SELECT
 1 AS `name`,
 1 AS `role`,
 1 AS `personID`,
 1 AS `reliefID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vReliefEffort`
--

/*!50001 DROP VIEW IF EXISTS `vReliefEffort`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vReliefEffort` AS select `r`.`ID` AS `reliefID`,`r`.`name` AS `reliefName`,`r`.`organizationID` AS `reliefOrganization`,`r`.`description` AS `reliefDesc`,`r`.`start` AS `reliefStart`,`r`.`end` AS `reliefEnd`,`r`.`phase` AS `reliefPhase`,`rt`.`personID` AS `teamPersonID`,concat(`p`.`firstName`,' ',`p`.`lastName`) AS `teamPersonName`,`rt`.`role` AS `teamRole`,`ro`.`ID` AS `objectiveID`,`ro`.`name` AS `objectiveName`,`ro`.`type` AS `objectiveType`,`ro`.`description` AS `objectiveDescription`,`ro`.`completed` AS `objectiveCompleted`,`ro`.`successFactor` AS `objectiveSuccessFactor` from (((`relief` `r` left join `reliefTeam` `rt` on((`rt`.`reliefID` = `r`.`ID`))) left join `reliefObjective` `ro` on((`ro`.`reliefID` = `r`.`ID`))) left join `person` `p` on((`p`.`ID` = `rt`.`personID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vReliefEffortTeam`
--

/*!50001 DROP VIEW IF EXISTS `vReliefEffortTeam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vReliefEffortTeam` AS select concat(`person`.`firstName`,' ',`person`.`lastName`) AS `name`,`reliefTeam`.`role` AS `role`,`person`.`ID` AS `personID`,`reliefTeam`.`reliefID` AS `reliefID` from (`person` join `reliefTeam` on((`reliefTeam`.`personID` = `person`.`ID`))) */;
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

-- Dump completed on 2016-09-01 13:35:23
