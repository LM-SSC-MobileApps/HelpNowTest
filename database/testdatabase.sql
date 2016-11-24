CREATE DATABASE  IF NOT EXISTS `helpnow` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `helpnow`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `AccountID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(11) DEFAULT NULL,
  `Username` varchar(16) NOT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `MiddleInitial` varchar(10) DEFAULT NULL,
  `Email` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(45) DEFAULT NULL,
  `MobilePhone` varchar(45) DEFAULT NULL,
  `AccountRoleID` int(11) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL,
  `IsHashed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `fk_Account_AccountRole1` (`AccountRoleID`),
  KEY `fk_Account_Address1` (`AddressID`),
  KEY `fk_Account_Organization` (`OrganizationID`),
  CONSTRAINT `fk_Account_AccountRole1` FOREIGN KEY (`AccountRoleID`) REFERENCES `AccountRole` (`AccountRoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Address1` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Organization` FOREIGN KEY (`OrganizationID`) REFERENCES `Organization` (`OrganizationID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,1,'tuser','User','Test',NULL,'test.user@testemail.com','demopassword','2016-11-11 00:00:00',NULL,NULL,1,NULL,1,0),(2,2,'govtest','Tester','Government',NULL,'gov.test@noemailtest1.com','govtest123','2016-11-11 00:00:00',NULL,NULL,2,NULL,1,0);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountRole`
--

DROP TABLE IF EXISTS `AccountRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountRole` (
  `AccountRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AccountRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountRole`
--

LOCK TABLES `AccountRole` WRITE;
/*!40000 ALTER TABLE `AccountRole` DISABLE KEYS */;
INSERT INTO `AccountRole` VALUES (1,'SuperAdmin'),(2,'Admin');
/*!40000 ALTER TABLE `AccountRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `StreetNumber` int(11) DEFAULT NULL,
  `StreetNumberPrefix` varchar(45) DEFAULT NULL,
  `StreetName` varchar(200) DEFAULT NULL,
  `StreetNumberSuffix` varchar(45) DEFAULT NULL,
  `StreetType` varchar(45) DEFAULT NULL,
  `StreetDirection` varchar(45) DEFAULT NULL,
  `AddressType` varchar(45) DEFAULT NULL,
  `AddressTypeID` varchar(45) DEFAULT NULL,
  `MajorMunicipality` varchar(45) DEFAULT NULL,
  `MinorMunicipality` varchar(45) DEFAULT NULL,
  `GoverningDistrict` varchar(45) DEFAULT NULL,
  `PostalArea` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Geo_Code` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,12999,NULL,'Deer Creek Canyon',NULL,'Road',NULL,NULL,NULL,'Littleton',NULL,'CO','80217','United States of America',NULL),(2,NULL,NULL,'Bir Uttam Zaiur Rahman',NULL,'Road',NULL,NULL,NULL,'Dhaka','Elenbari',NULL,'1215','Bangladesh',NULL);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthToken`
--

DROP TABLE IF EXISTS `AuthToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthToken` (
  `AuthTokenID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(1000) NOT NULL,
  `redirectUri` varchar(250) DEFAULT NULL,
  `Username` varchar(250) DEFAULT NULL,
  `APIKey` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`AuthTokenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthToken`
--

LOCK TABLES `AuthToken` WRITE;
/*!40000 ALTER TABLE `AuthToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blockage`
--

DROP TABLE IF EXISTS `Blockage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blockage` (
  `BlockageID` int(11) NOT NULL AUTO_INCREMENT,
  `BlockageSourceID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `LAT` varchar(45) NOT NULL,
  `LONG` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `ImageURL` varchar(2000) DEFAULT NULL,
  `CatID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BlockageID`),
  KEY `fk_Blockage_Event1` (`EventID`),
  KEY `fk_Blockage_BlockageSource1` (`BlockageSourceID`),
  CONSTRAINT `fk_Blockage_BlockageSource1` FOREIGN KEY (`BlockageSourceID`) REFERENCES `BlockageSource` (`BlockageSourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Blockage_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blockage`
--

LOCK TABLES `Blockage` WRITE;
/*!40000 ALTER TABLE `Blockage` DISABLE KEYS */;
INSERT INTO `Blockage` VALUES (1,1,1,'23.710','90.40','Road Block 1',NULL,NULL),(2,1,1,'23.709','90.39','Road Block 2',NULL,NULL),(3,1,1,'23.713','90.38','Road Block 3',NULL,NULL),(4,1,1,'23.715','90.42','Bridge Out 1',NULL,NULL),(5,1,1,'23.711','90.37','Bridge Out 2',NULL,NULL),(6,1,1,'23.709','90.36','Bridge Out 3',NULL,NULL),(7,1,1,'23.712','90.40','Bridge Out 4',NULL,NULL),(8,1,0,'23.710','90.40','Inactive Event Blockage 1',NULL,NULL),(9,1,0,'23.711','90.41','Inactive Event Blockage 2',NULL,NULL),(10,1,0,'23.712','90.42','Inactive Event Blockage 3',NULL,NULL),(11,1,0,'23.713','90.43','Inactive Event Blockage 4',NULL,NULL),(12,1,1,'23.709','90.402','Test Bridge Out',NULL,NULL);
/*!40000 ALTER TABLE `Blockage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlockageSource`
--

DROP TABLE IF EXISTS `BlockageSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlockageSource` (
  `BlockageSourceID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BlockageSourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlockageSource`
--

LOCK TABLES `BlockageSource` WRITE;
/*!40000 ALTER TABLE `BlockageSource` DISABLE KEYS */;
INSERT INTO `BlockageSource` VALUES (1,'HelpNow'),(2,'Tomnod');
/*!40000 ALTER TABLE `BlockageSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `EventTypeID` int(11) DEFAULT NULL,
  `OrganizationID` int(11) DEFAULT NULL,
  `Summary` varchar(45) DEFAULT NULL,
  `Notes` varchar(2000) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Keywords` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `fk_Event_Organization` (`OrganizationID`),
  KEY `fk_Event_EventType` (`EventTypeID`),
  CONSTRAINT `fk_Event_EventType` FOREIGN KEY (`EventTypeID`) REFERENCES `EventType` (`EventTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Organization` FOREIGN KEY (`OrganizationID`) REFERENCES `Organization` (`OrganizationID`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (1,1,1,'Dhaka, Bangladesh',NULL,1,'2016-11-11 00:00:00','#HelpNow, #DhakaFlood'),(2,2,4,'Port Moresby, Papua New Guinea',NULL,1,'2016-11-11 00:00:00','#HelpNow, #PortMoresbyCrisis'),(3,3,4,'Tacna, Peru',NULL,1,'2016-11-11 00:00:00','#HelpNow, #PeruCrisis');
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventLocation`
--

DROP TABLE IF EXISTS `EventLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventLocation` (
  `EventLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `LAT` varchar(45) DEFAULT NULL,
  `LONG` varchar(45) DEFAULT NULL,
  `Radius` int(11) DEFAULT NULL,
  PRIMARY KEY (`EventLocationID`),
  KEY `fk_EventLocation_Event1` (`EventID`),
  CONSTRAINT `fk_EventLocation_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventLocation`
--

LOCK TABLES `EventLocation` WRITE;
/*!40000 ALTER TABLE `EventLocation` DISABLE KEYS */;
INSERT INTO `EventLocation` VALUES (1,1,'Dhaka, Bangladesh','23.713','90.39',542),(2,2,'Port Moresby, Papua New Guinea','-9.46','147.18',1024),(3,3,'Tacna, Peru','-18.04','-70.174',860);
/*!40000 ALTER TABLE `EventLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventType`
--

DROP TABLE IF EXISTS `EventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventType` (
  `EventTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EventTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventType`
--

LOCK TABLES `EventType` WRITE;
/*!40000 ALTER TABLE `EventType` DISABLE KEYS */;
INSERT INTO `EventType` VALUES (1,'Flood'),(2,'Tsunami'),(3,'Earthquake'),(4,'Hurricane'),(5,'Typhoon');
/*!40000 ALTER TABLE `EventType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InviteRequest`
--

DROP TABLE IF EXISTS `InviteRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InviteRequest` (
  `InviteRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `InviteID` char(40) NOT NULL DEFAULT 'temp',
  `OrganizationID` int(11) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InviteRequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InviteRequest`
--

LOCK TABLES `InviteRequest` WRITE;
/*!40000 ALTER TABLE `InviteRequest` DISABLE KEYS */;
INSERT INTO `InviteRequest` VALUES (1,'272e338b-a828-11e6-9b49-06a16191fa45',1,'Paul','Smith','paulsmith@notrealemail.org','2016-11-11 00:00:00');
/*!40000 ALTER TABLE `InviteRequest` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`helpnowtest`@`%`*/ /*!50003 TRIGGER 
	`helpnow`.`InviteRequest_GUID` 
BEFORE INSERT ON 
	`InviteRequest` 
FOR EACH ROW
	BEGIN
		SET new.InviteID = uuid();
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MapLayer`
--

DROP TABLE IF EXISTS `MapLayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MapLayer` (
  `MapLayerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `MapLayerTypeID` int(11) NOT NULL,
  `OrganizationID` int(11) NOT NULL,
  `ImageryURL` varchar(240) DEFAULT NULL,
  `MaxZoomLevel` int(11) DEFAULT NULL,
  `MinZoomLevel` int(11) DEFAULT NULL,
  `AttributionText` varchar(500) NOT NULL,
  `EventID` int(11) DEFAULT NULL,
  `IsEsri` tinyint(1) DEFAULT '0',
  `IsTSM` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MapLayerID`),
  KEY `fk_MapLayer_MapLayerType1` (`MapLayerTypeID`),
  KEY `fk_MapLayer_Event1` (`EventID`),
  KEY `fk_MapLayer_Organization1` (`OrganizationID`),
  CONSTRAINT `fk_MapLayer_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MapLayer_MapLayerType1` FOREIGN KEY (`MapLayerTypeID`) REFERENCES `MapLayerType` (`MapLayerTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MapLayer_Organization1` FOREIGN KEY (`OrganizationID`) REFERENCES `Organization` (`OrganizationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MapLayer`
--

LOCK TABLES `MapLayer` WRITE;
/*!40000 ALTER TABLE `MapLayer` DISABLE KEYS */;
INSERT INTO `MapLayer` VALUES (1,'Base Open Street Maps',1,1,'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',18,2,'Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"http://mapbox.com\">Mapbox</a>',NULL,0,0),(2,'Bangladesh (DG)',2,1,'http://www.helpnowmap.com/bangladeshdg/{z}/{x}/{y}.png',19,11,'(c) <a href=\"http://www.digitalglobe.com/\">DigitalGlobe</a>',1,0,0),(3,'Bangladesh',2,1,'http://www.helpnowmap.com/bangladesh/{z}/{x}/{y}.png',12,6,'(c) <a href=\"http://www.dmcii.com/\">DMC International Imaging</a>',1,0,1),(4,'Nepal (DG)',2,1,'http://www.helpnowmap.com/nepal/{z}/{x}/{y}.png',19,11,'(c) <a href=\"http://www.digitalglobe.com/\">DigitalGlobe</a>',1,0,0);
/*!40000 ALTER TABLE `MapLayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MapLayerType`
--

DROP TABLE IF EXISTS `MapLayerType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MapLayerType` (
  `MapLayerTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MapLayerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MapLayerType`
--

LOCK TABLES `MapLayerType` WRITE;
/*!40000 ALTER TABLE `MapLayerType` DISABLE KEYS */;
INSERT INTO `MapLayerType` VALUES (1,'Base Map'),(2,'Map Overlay');
/*!40000 ALTER TABLE `MapLayerType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `OrganizationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1000) NOT NULL,
  `OrganizationTypeID` int(11) NOT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `PrimaryPOC` int(11) DEFAULT NULL,
  `SecondaryPOC` int(11) DEFAULT NULL,
  `APISecret` varchar(250) DEFAULT NULL,
  `APIKey` char(40) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Active` tinyint(1) NOT NULL,
  `IsHashed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrganizationID`),
  UNIQUE KEY `APIKey_UNIQUE` (`APIKey`),
  UNIQUE KEY `APISecret_UNIQUE` (`APISecret`),
  KEY `fk_Organization_Address` (`AddressID`),
  KEY `fk_Organization_PrimaryPOC_Account` (`PrimaryPOC`),
  KEY `fk_Organization_SecondaryPOC_Account` (`SecondaryPOC`),
  KEY `fk_Organization_OrganizationType` (`OrganizationTypeID`),
  CONSTRAINT `fk_Organization_Address` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organization_OrganizationType` FOREIGN KEY (`OrganizationTypeID`) REFERENCES `OrganizationType` (`OrganizationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organization_PrimaryPOC_Account` FOREIGN KEY (`PrimaryPOC`) REFERENCES `Account` (`AccountID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organization_SecondaryPOC_Account` FOREIGN KEY (`SecondaryPOC`) REFERENCES `Account` (`AccountID`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,'HelpNow',3,NULL,NULL,NULL,'apitestsecret','12345678-1234-1234-1234-123456789012','2016-11-11 16:01:28',1,0),(2,'City of Dhaka',1,2,1,2,NULL,'1b5a7110-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:29',1,0),(3,'USAID',2,1,3,6,NULL,'1b73ea9e-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:29',1,0),(4,'EuropeAid',2,1,4,3,NULL,'1b8d817e-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:29',1,0),(5,'City of Papua',1,1,5,4,NULL,'1ba6e489-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:29',1,0),(6,'AusAid',2,1,6,9,NULL,'1bc08d94-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:29',1,0),(7,'DFID',2,1,7,8,NULL,'1bd9f8e5-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:30',1,0),(8,'UNICEF',2,1,8,7,NULL,'1bf3f90a-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:30',1,0),(9,'Government of Bangladesh',2,2,9,6,NULL,'1c0d849b-a828-11e6-9b49-06a16191fa45','2016-11-11 16:01:30',1,0);
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`helpnowtest`@`%`*/ /*!50003 TRIGGER 
	`helpnow`.`Organization_APIKey` 
BEFORE INSERT ON 
	`Organization` 
FOR EACH ROW
	BEGIN
		SET new.APIKey = uuid();
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OrganizationRegulations`
--

DROP TABLE IF EXISTS `OrganizationRegulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationRegulations` (
  `OrganizationRegulationsID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(11) DEFAULT NULL,
  `Summary` varchar(100) DEFAULT NULL,
  `Narrative` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`OrganizationRegulationsID`),
  KEY `fk_OrganizationRegs_Organization1` (`OrganizationID`),
  CONSTRAINT `fk_OrganizationRegs_Organization1` FOREIGN KEY (`OrganizationID`) REFERENCES `Organization` (`OrganizationID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationRegulations`
--

LOCK TABLES `OrganizationRegulations` WRITE;
/*!40000 ALTER TABLE `OrganizationRegulations` DISABLE KEYS */;
INSERT INTO `OrganizationRegulations` VALUES (1,1,'Policy A.1.2.3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac finibus neque, eu porttitor elit. Vivamus convallis euismod turpis, eu ultrices mauris fermentum vitae. In dictum elit nec enim pretium, nec efficitur erat porttitor. Nam fermentum libero nec facilisis ornare. Curabitur vestibulum nisl sit amet ornare elementum. Vivamus facilisis metus ut feugiat suscipit. Nunc iaculis ligula eu enim ultricies laoreet. '),(2,1,'Policy B.1.2.4','Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla porttitor accumsan tincidunt. Curabitur aliquet quam id dui posuere blandit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.'),(3,1,'Regulation R.A-2','Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla quis lorem ut libero malesuada feugiat. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Donec sollicitudin molestie malesuada. Pellentesque in ipsum id orci porta dapibus.'),(4,2,'Policy Regulation S.AT-2','Porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla quis lorem ut libero malesuada feugiat. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Donec sollicitudin molestie malesuada. Pellentesque in ipsum id orci porta dapibus.');
/*!40000 ALTER TABLE `OrganizationRegulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationType`
--

DROP TABLE IF EXISTS `OrganizationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationType` (
  `OrganizationTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrganizationTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationType`
--

LOCK TABLES `OrganizationType` WRITE;
/*!40000 ALTER TABLE `OrganizationType` DISABLE KEYS */;
INSERT INTO `OrganizationType` VALUES (1,'Government'),(2,'NGO'),(3,'App');
/*!40000 ALTER TABLE `OrganizationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestState`
--

DROP TABLE IF EXISTS `RequestState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestState` (
  `RequestStateID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RequestStateID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestState`
--

LOCK TABLES `RequestState` WRITE;
/*!40000 ALTER TABLE `RequestState` DISABLE KEYS */;
INSERT INTO `RequestState` VALUES (1,'Active'),(2,'Resolved');
/*!40000 ALTER TABLE `RequestState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestUrgency`
--

DROP TABLE IF EXISTS `RequestUrgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestUrgency` (
  `RequestUrgencyID` int(11) NOT NULL AUTO_INCREMENT,
  `Level` int(11) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`RequestUrgencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestUrgency`
--

LOCK TABLES `RequestUrgency` WRITE;
/*!40000 ALTER TABLE `RequestUrgency` DISABLE KEYS */;
INSERT INTO `RequestUrgency` VALUES (1,1,'Low'),(2,2,'Medium'),(3,3,'High'),(4,4,'Critical'),(5,5,'Immediate Danger');
/*!40000 ALTER TABLE `RequestUrgency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceLocation`
--

DROP TABLE IF EXISTS `ResourceLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceLocation` (
  `ResourceLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(11) NOT NULL,
  `ResourceLocationTypeID` int(11) NOT NULL,
  `EventID` int(11) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `LAT` float(10,6) NOT NULL,
  `LONG` float(10,6) NOT NULL,
  `PrimaryPOCName` varchar(45) DEFAULT NULL,
  `PrimaryPOCPhone` varchar(45) DEFAULT NULL,
  `SecondaryPOCName` varchar(45) DEFAULT NULL,
  `SecondaryPOCPhone` varchar(45) DEFAULT NULL,
  `ResourceLocationStatusID` int(11) NOT NULL,
  PRIMARY KEY (`ResourceLocationID`),
  KEY `fk_ResourceLocation_ResourceLocationType` (`ResourceLocationTypeID`),
  KEY `fk_ResourceLocation_Organization1` (`OrganizationID`),
  KEY `fk_ResourceLocation_Event1` (`EventID`),
  KEY `fk_ResourceLocation_ResourceLocationStatus1` (`ResourceLocationStatusID`),
  CONSTRAINT `fk_ResourceLocation_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocation_Organization1` FOREIGN KEY (`OrganizationID`) REFERENCES `Organization` (`OrganizationID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocation_ResourceLocationStatus1` FOREIGN KEY (`ResourceLocationStatusID`) REFERENCES `ResourceLocationStatus` (`ResourceLocationStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocation_ResourceLocationType` FOREIGN KEY (`ResourceLocationTypeID`) REFERENCES `ResourceLocationType` (`ResourceLocationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceLocation`
--

LOCK TABLES `ResourceLocation` WRITE;
/*!40000 ALTER TABLE `ResourceLocation` DISABLE KEYS */;
INSERT INTO `ResourceLocation` VALUES (1,1,1,1,'Distribution Center A','Note 1',23.719999,90.400002,'Jon Smith','1-458-555-4685','Alex Kirk','1-444-555-8675',1),(2,1,2,1,'Deployment A','Note 2',23.700001,90.400002,'Madison Schwartz','1-497-555-4685','Alex McDonald','1-444-555-9875',2),(3,2,1,1,'Distribution Center B','Note 3',23.750000,90.459999,'Emannuel Lacky','1-561-555-4685','Adrienne Rocky','1-444-555-5309',1),(4,3,1,1,'Distribution Center C','Note 4',23.690001,90.410004,'Nolan Helton','1-789-555-2342','Matt Collins','1-303-555-5309',1),(5,4,1,1,'Distribution Center D','Note 5',23.718000,90.355003,'April Sanders','1-852-555-6278','Roger Helsmith','1-210-555-3598',1),(6,1,2,1,'Deployment First Aid','Note 6',23.719999,90.360001,'Joe Thomas','1-458-555-4685','Tim Cambpell','1-510-555-9875',1),(7,2,2,1,'Deployment Water',NULL,23.719999,90.360001,'Samantha Johnson','1-685-555-4485','Coby Hatton','1-720-555-4488',1),(8,4,1,1,'First Aid Distribution Center ','Note 7',23.719000,90.374001,'Miguel Ramirez','1-458-555-4685','Sally Thompson','1-444-555-9875',1),(9,3,1,1,'Distribution Center E','Note 8',23.764999,90.398003,'Matt Doer Reed','1-458-555-4685','Adrienne Helms Major','1-444-555-9875',1),(10,3,1,1,'Distribution Center F',NULL,23.767000,90.410004,'Brad Smith','1-458-555-4685','Michael Lau','1-444-555-9875',1),(11,2,2,NULL,'Deployment Food',NULL,23.780001,90.430000,'Stephanie Coleman','1-458-555-4685','Debbie Serot','1-444-555-9875',1),(12,4,1,NULL,'Distribution Center G','Note 9',23.730000,90.364998,'Randy McClellan','1-458-555-4685','Mary Harris','1-444-555-9875',1),(13,2,2,1,'Test Description','Test Note',23.737000,90.396004,'Test POC Name','Test POC Phone',NULL,NULL,2),(14,2,2,1,NULL,NULL,23.766001,90.300003,NULL,NULL,NULL,NULL,2),(15,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(16,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(17,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(18,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(19,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(20,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(21,2,2,1,'Test Description','Test Note',23.778000,90.300003,'Test POC Name','Test POC Phone',NULL,NULL,2),(22,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(23,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(24,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(25,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(26,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(27,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(28,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(29,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(30,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(31,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(32,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(33,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(34,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(35,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(36,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(37,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2),(38,2,2,1,'Test Description','Test Note',23.729000,90.390999,'Test POC Name','Test POC Phone',NULL,NULL,2);
/*!40000 ALTER TABLE `ResourceLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceLocationInventory`
--

DROP TABLE IF EXISTS `ResourceLocationInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceLocationInventory` (
  `ResourceLocationInventoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceLocationID` int(11) NOT NULL,
  `ResourceTypeID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ResourceTypeUnitOfMeasureID` int(11) NOT NULL,
  `SourceLocationID` int(11) DEFAULT NULL,
  `ResourceSubtypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ResourceLocationInventoryID`),
  UNIQUE KEY `ResourceLocationInventoryID_UNIQUE` (`ResourceLocationInventoryID`),
  KEY `fk_ResourceLocationInventory_ResourceLocation` (`ResourceLocationID`),
  KEY `fk_ResourceLocationInventory_ResourceType` (`ResourceTypeID`),
  KEY `fk_ResourceLocationInventory_ResourceTypeUnitOfMeasure` (`ResourceTypeUnitOfMeasureID`),
  KEY `fk_ResourceLocationInventory_ResourceLocation1` (`SourceLocationID`),
  KEY `fk_ResourceLocationInventory_ResourceSubtype1` (`ResourceSubtypeID`),
  CONSTRAINT `fk_ResourceLocationInventory_ResourceLocation` FOREIGN KEY (`ResourceLocationID`) REFERENCES `ResourceLocation` (`ResourceLocationID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocationInventory_ResourceLocation1` FOREIGN KEY (`SourceLocationID`) REFERENCES `ResourceLocation` (`ResourceLocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocationInventory_ResourceSubtype1` FOREIGN KEY (`ResourceSubtypeID`) REFERENCES `ResourceSubtype` (`ResourceSubtypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocationInventory_ResourceType` FOREIGN KEY (`ResourceTypeID`) REFERENCES `ResourceType` (`ResourceTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocationInventory_ResourceTypeUnitOfMeasure` FOREIGN KEY (`ResourceTypeUnitOfMeasureID`) REFERENCES `ResourceTypeUnitOfMeasure` (`ResourceTypeUnitOfMeasureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceLocationInventory`
--

LOCK TABLES `ResourceLocationInventory` WRITE;
/*!40000 ALTER TABLE `ResourceLocationInventory` DISABLE KEYS */;
INSERT INTO `ResourceLocationInventory` VALUES (1,1,1,1000,4,NULL,NULL),(2,1,2,1000,5,NULL,NULL),(3,1,3,2,10,NULL,NULL),(4,2,1,10000,2,NULL,NULL),(5,2,4,3,12,NULL,NULL),(6,2,4,1,13,NULL,NULL),(8,8,5,100,14,NULL,NULL),(9,3,1,1000,4,NULL,NULL),(10,3,2,1000,5,NULL,NULL),(11,3,3,2,10,NULL,NULL),(12,4,1,10000,2,NULL,NULL),(13,4,4,3,12,NULL,NULL),(14,4,4,1,13,NULL,NULL),(15,5,1,10000,4,NULL,NULL),(16,5,5,1,14,NULL,NULL),(17,5,1,1000,4,NULL,NULL),(18,9,2,1000,5,NULL,NULL),(19,9,3,2,10,NULL,NULL),(20,9,1,10000,2,NULL,NULL),(21,10,4,3,12,NULL,NULL),(22,10,4,1,13,NULL,NULL),(23,10,1,10000,4,NULL,NULL),(24,10,5,1,14,NULL,NULL);
/*!40000 ALTER TABLE `ResourceLocationInventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceLocationStatus`
--

DROP TABLE IF EXISTS `ResourceLocationStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceLocationStatus` (
  `ResourceLocationStatusID` int(11) NOT NULL,
  `Status` varchar(60) NOT NULL,
  PRIMARY KEY (`ResourceLocationStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceLocationStatus`
--

LOCK TABLES `ResourceLocationStatus` WRITE;
/*!40000 ALTER TABLE `ResourceLocationStatus` DISABLE KEYS */;
INSERT INTO `ResourceLocationStatus` VALUES (1,'Planned'),(2,'Active');
/*!40000 ALTER TABLE `ResourceLocationStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceLocationTransport`
--

DROP TABLE IF EXISTS `ResourceLocationTransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceLocationTransport` (
  `ResourceLocationTransportID` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceLocationID` int(11) NOT NULL,
  `TransportTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ResourceLocationTransportID`),
  KEY `fk_ResourceLocationTransport_TransportType` (`TransportTypeID`),
  KEY `fk_ResourceLocationTransport_ResourceLocation` (`ResourceLocationID`),
  CONSTRAINT `fk_ResourceLocationTransport_ResourceLocation` FOREIGN KEY (`ResourceLocationID`) REFERENCES `ResourceLocation` (`ResourceLocationID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceLocationTransport_TransportType` FOREIGN KEY (`TransportTypeID`) REFERENCES `TransportType` (`TransportTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceLocationTransport`
--

LOCK TABLES `ResourceLocationTransport` WRITE;
/*!40000 ALTER TABLE `ResourceLocationTransport` DISABLE KEYS */;
INSERT INTO `ResourceLocationTransport` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,2),(6,4,1),(7,4,2),(8,5,2),(9,5,3),(10,6,1),(11,6,2),(12,6,3),(13,7,2),(14,8,1),(15,8,2);
/*!40000 ALTER TABLE `ResourceLocationTransport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceLocationType`
--

DROP TABLE IF EXISTS `ResourceLocationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceLocationType` (
  `ResourceLocationTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(60) NOT NULL,
  PRIMARY KEY (`ResourceLocationTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceLocationType`
--

LOCK TABLES `ResourceLocationType` WRITE;
/*!40000 ALTER TABLE `ResourceLocationType` DISABLE KEYS */;
INSERT INTO `ResourceLocationType` VALUES (1,'Distribution Center'),(2,'Deployment');
/*!40000 ALTER TABLE `ResourceLocationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceRequest`
--

DROP TABLE IF EXISTS `ResourceRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceRequest` (
  `ResourceRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) NOT NULL,
  `RequestStateID` int(11) NOT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ResourceTypeID` int(11) NOT NULL,
  `LAT` float(10,6) NOT NULL,
  `LONG` float(10,6) NOT NULL,
  `RequestUrgencyID` int(11) NOT NULL,
  `AreaSize` decimal(6,2) DEFAULT NULL,
  `UnitOfMeasure` varchar(45) DEFAULT NULL,
  `RequestorName` varchar(65) DEFAULT NULL,
  `RequestorPhone` varchar(45) DEFAULT NULL,
  `RequestorEmail` varchar(65) DEFAULT NULL,
  `RequestorUpdatePref` tinyint(1) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ResourceRequestID`),
  KEY `fk_ResourceRequest_Event1` (`EventID`),
  KEY `fk_ResourceRequest_ResourceType1` (`ResourceTypeID`),
  KEY `fk_ResourceRequest_RequestUrgency1` (`RequestUrgencyID`),
  KEY `fk_ResourceRequest_RequestState` (`RequestStateID`),
  CONSTRAINT `fk_ResourceRequest_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceRequest_RequestState` FOREIGN KEY (`RequestStateID`) REFERENCES `RequestState` (`RequestStateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceRequest_RequestUrgency1` FOREIGN KEY (`RequestUrgencyID`) REFERENCES `RequestUrgency` (`RequestUrgencyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceRequest_ResourceType1` FOREIGN KEY (`ResourceTypeID`) REFERENCES `ResourceType` (`ResourceTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceRequest`
--

LOCK TABLES `ResourceRequest` WRITE;
/*!40000 ALTER TABLE `ResourceRequest` DISABLE KEYS */;
INSERT INTO `ResourceRequest` VALUES (1,1,1,'Reported via Twitter',15,4,23.791792,90.472694,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:52'),(2,1,1,'Please help!',12,4,23.721071,90.483055,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:52'),(3,1,1,'Reported via Facebook',6,4,23.787848,90.309883,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:52'),(4,1,1,'Reported via Twitter',14,4,23.879280,90.389755,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:52'),(5,1,1,'Reported via Twitter',6,8,23.826931,90.271606,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(6,1,1,'Please help!',12,4,23.827663,90.512100,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(7,1,1,'Reported via Facebook',3,8,23.814739,90.462936,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(8,1,1,'Please help!',12,8,23.721165,90.500648,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(9,1,1,'Reported via Twitter',9,8,23.806755,90.504425,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(10,1,1,'Reported via Facebook',16,4,23.756842,90.478264,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(11,1,1,'Please help!',8,4,23.733105,90.308945,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(12,1,1,'Reported via Twitter',1,8,23.855291,90.453384,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(13,1,1,'Please help!',4,4,23.829300,90.439835,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(14,1,1,'Reported via Facebook',7,4,23.713737,90.555946,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:53'),(15,1,1,'Please help!',6,8,23.721401,90.296448,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:54'),(16,1,1,'Please help!',11,1,23.750097,90.779053,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:54'),(17,1,1,'Reported via Twitter',16,4,23.776089,90.475960,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:54'),(18,1,1,'Reported via Twitter',9,8,23.733341,90.346893,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:54'),(19,1,1,'Reported via Facebook',11,4,23.652431,90.386414,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:54'),(20,1,1,'Please help!',16,4,23.739725,90.472618,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(21,1,1,'Reported via Facebook',15,4,23.863165,90.305939,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(22,1,1,'Please help!',9,4,23.814692,90.488518,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(23,1,1,'Reported via Facebook',17,8,23.812777,90.466309,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(24,1,1,'Reported via Facebook',5,8,23.756775,90.471909,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(25,1,1,'Reported via Facebook',10,4,23.710133,90.346268,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(26,1,1,'Reported via Twitter',12,4,23.822418,90.509361,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:55'),(27,1,1,'Reported via Facebook',9,4,23.769419,90.461060,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(28,1,1,'Reported via Facebook',15,8,23.855700,90.447319,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(29,1,1,'Please help!',13,4,23.828602,90.455788,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(30,1,1,'Reported via Twitter',16,4,23.786539,90.290901,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(31,1,1,'Reported via Twitter',9,4,23.747053,90.288475,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(32,1,1,'Please help!',5,4,23.717916,90.502579,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(33,1,1,'Please help!',12,8,23.797009,90.328926,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(34,1,1,'Reported via Facebook',18,1,23.787760,90.678955,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(35,1,1,'Reported via Twitter',10,4,23.819305,90.493797,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(36,1,1,'Reported via Twitter',4,8,23.756035,90.307014,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(37,1,1,'Please help!',15,8,23.726221,90.547432,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:56'),(38,1,1,'Reported via Facebook',10,4,23.751499,90.499565,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(39,1,1,'Reported via Facebook',14,4,23.809299,90.486206,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(40,1,1,'Please help!',2,4,23.961903,90.373314,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(41,1,1,'Please help!',13,8,23.804745,90.487015,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(42,1,1,'Reported via Twitter',13,8,23.726452,90.498230,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(43,1,1,'Reported via Facebook',5,1,23.632284,90.268585,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:57'),(44,1,1,'Reported via Facebook',13,4,23.700468,90.316452,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(45,1,1,'Please help!',5,4,23.637194,90.246193,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(46,1,1,'Reported via Twitter',6,4,23.777575,90.469398,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(47,1,1,'Reported via Facebook',9,8,23.675623,90.230347,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(48,1,1,'Reported via Twitter',0,4,23.781456,90.487938,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(49,1,1,'Please help!',18,8,23.837748,90.443169,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(50,1,1,'Reported via Twitter',12,4,23.845947,90.441017,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(51,1,1,'Please help!',11,4,23.759754,90.282150,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(52,1,1,'Reported via Facebook',17,4,23.684296,90.550285,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(53,1,1,'Reported via Twitter',9,8,23.769335,90.331406,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(54,1,1,'Reported via Twitter',17,1,23.848446,90.462753,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(55,1,1,'Reported via Twitter',2,1,23.973124,90.834892,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:58'),(56,1,1,'Please help!',10,4,23.805983,90.538109,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(57,1,1,'Please help!',5,4,23.757904,90.272263,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(58,1,1,'Please help!',9,8,23.823523,90.311325,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(59,1,1,'Please help!',0,4,23.729462,90.468498,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(60,1,1,'Reported via Twitter',14,4,23.793833,90.489906,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(61,1,1,'Reported via Twitter',18,4,23.836014,90.302551,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(62,1,1,'Reported via Twitter',3,4,23.697010,90.524612,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(63,1,1,'Reported via Facebook',18,1,23.858255,90.525894,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(64,1,1,'Reported via Facebook',2,8,23.741339,90.505859,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(65,1,1,'Reported via Facebook',15,8,23.788708,90.485703,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:09:59'),(66,1,1,'Reported via Twitter',10,8,23.689257,90.522209,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(67,1,1,'Reported via Twitter',12,1,23.837805,90.462814,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(68,1,1,'Reported via Twitter',12,1,23.761333,90.802277,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(69,1,1,'Reported via Facebook',15,4,23.740797,90.331810,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(70,1,1,'Please help!',10,4,23.752441,90.476120,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(71,1,1,'Please help!',16,8,23.840408,90.464104,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(72,1,1,'Please help!',15,4,23.830429,90.447594,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(73,1,1,'Reported via Facebook',20,4,23.747820,90.318581,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(74,1,1,'Please help!',3,1,23.726938,90.296104,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(75,1,1,'Reported via Facebook',11,1,23.645351,90.433556,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(76,1,1,'Reported via Facebook',4,2,23.845291,90.471031,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(77,1,1,'Please help!',17,2,23.675901,90.402435,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(78,1,1,'Reported via Twitter',7,4,23.690058,90.533089,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:00'),(79,1,1,'Reported via Twitter',19,2,23.723200,90.232346,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(80,1,1,'Reported via Facebook',17,8,23.762886,90.303055,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(81,1,1,'Reported via Facebook',11,1,23.830458,90.465851,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(82,1,1,'Reported via Facebook',11,4,23.789333,90.476028,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(83,1,1,'Reported via Twitter',19,4,23.605724,90.389397,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(84,1,1,'Reported via Facebook',15,8,23.633801,90.307999,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(85,1,1,'Reported via Twitter',0,1,23.837385,90.448982,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(86,1,1,'Please help!',7,1,23.384186,90.156090,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(87,1,1,'Reported via Facebook',2,1,23.604008,90.507820,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(88,1,1,'Reported via Facebook',7,4,23.725470,90.502823,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(89,1,1,'Please help!',1,4,23.976826,90.338486,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(90,1,1,'Please help!',10,4,23.805614,90.471085,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(91,1,1,'Reported via Twitter',10,2,23.746630,90.476204,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:01'),(92,1,1,'Please help!',18,1,23.758070,90.313759,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(93,1,1,'Please help!',11,1,23.638491,90.438568,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(94,1,1,'Reported via Twitter',1,8,23.809282,90.481720,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(95,1,1,'Please help!',17,4,23.828928,90.516678,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(96,1,1,'Please help!',8,8,23.726826,90.494522,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(97,1,1,'Reported via Facebook',15,4,23.745592,90.343376,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(98,1,1,'Reported via Facebook',9,1,23.853840,90.464012,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(99,1,1,'Reported via Twitter',18,1,23.804205,90.537193,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(100,1,1,'Please help!',9,4,23.836260,90.265541,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(101,1,1,'Reported via Facebook',17,4,23.765566,90.487320,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(102,1,1,'Please help!',5,1,23.789810,90.486893,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(103,1,1,'Reported via Twitter',10,1,23.776688,90.476974,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(104,1,1,'Reported via Twitter',13,1,23.782476,90.470345,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(105,1,1,'Please help!',14,1,23.771236,90.459335,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(106,1,1,'Reported via Twitter',8,1,23.712334,90.507820,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:02'),(107,1,1,'Reported via Twitter',1,1,23.574183,90.268364,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(108,1,1,'Reported via Twitter',11,2,23.619963,90.445793,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(109,1,1,'Reported via Facebook',20,2,23.663403,90.422050,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(110,1,1,'Reported via Facebook',19,2,23.878172,90.415779,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(111,1,1,'Reported via Twitter',17,8,23.809998,90.302742,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(112,1,1,'Please help!',8,8,23.841225,90.451637,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(113,1,1,'Please help!',12,4,23.833008,90.446762,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(114,1,1,'Reported via Twitter',8,4,23.766994,90.290306,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(115,1,1,'Please help!',2,4,23.805939,90.592453,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(116,1,1,'Reported via Facebook',5,1,23.659855,90.250160,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(117,1,1,'Please help!',15,2,23.828766,90.469910,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(118,1,1,'Reported via Facebook',15,1,23.643864,90.446373,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(119,1,1,'Please help!',7,1,23.718975,90.285973,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(120,1,1,'Please help!',8,8,23.722588,90.513908,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(121,1,1,'Reported via Facebook',15,8,23.768326,90.336403,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(122,1,1,'Please help!',5,1,23.637421,90.435173,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(123,1,1,'Reported via Twitter',10,4,23.677752,90.540627,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(124,1,1,'Reported via Twitter',3,1,23.751289,90.478188,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(125,1,1,'Reported via Facebook',15,1,23.722712,90.404930,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(126,1,1,'Reported via Twitter',9,1,23.708509,90.501839,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(127,1,1,'Reported via Facebook',5,2,23.801138,90.466400,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(128,1,1,'Please help!',18,2,23.784229,90.446503,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:03'),(129,1,1,'Please help!',13,1,23.841110,90.445671,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(130,1,1,'Reported via Facebook',10,1,23.849592,90.534332,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(131,1,1,'Reported via Facebook',17,1,23.777216,90.464684,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(132,1,1,'Reported via Twitter',12,2,23.687031,90.425652,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(133,1,1,'Reported via Facebook',6,1,23.801947,90.479233,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(134,1,1,'Reported via Facebook',11,4,23.832907,90.359543,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(135,1,1,'Please help!',4,1,23.790253,90.463402,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(136,1,1,'Reported via Facebook',4,2,23.737713,90.477234,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(137,1,1,'Please help!',1,1,23.709398,90.517036,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(138,1,1,'Reported via Twitter',15,1,23.652611,90.216026,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(139,1,1,'Reported via Twitter',3,2,23.655119,90.309555,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(140,1,1,'Reported via Facebook',3,4,23.765900,90.467880,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(141,1,1,'Reported via Twitter',4,4,23.705179,90.340927,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(142,1,1,'Reported via Twitter',5,8,23.711447,90.201210,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(143,1,1,'Please help!',6,1,23.815248,90.722153,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(144,1,1,'Please help!',19,1,23.604486,90.503113,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(145,1,1,'Please help!',5,1,23.743614,90.302910,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(146,1,1,'Please help!',9,2,23.765848,90.465973,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(147,1,1,'Reported via Facebook',4,2,23.765879,90.306030,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(148,1,1,'Reported via Twitter',14,1,23.639595,90.407501,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:04'),(149,1,1,'Please help!',2,1,23.745325,90.496193,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(150,1,1,'Reported via Facebook',5,1,23.692465,90.414207,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(151,1,1,'Reported via Facebook',15,1,23.668468,90.509033,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(152,1,1,'Please help!',10,1,23.778625,90.472557,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(153,1,1,'Reported via Facebook',16,1,23.848232,90.446983,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(154,1,1,'Please help!',15,1,23.818718,90.465752,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(155,1,1,'Please help!',18,1,23.770809,90.475624,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(156,1,1,'Reported via Twitter',4,1,23.803635,90.485649,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(157,1,1,'Reported via Twitter',3,2,23.680319,90.424553,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(158,1,1,'Reported via Facebook',19,2,23.848965,90.404976,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(159,1,1,'Reported via Facebook',8,1,23.791412,90.445488,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(160,1,1,'Please help!',19,4,23.869394,90.460571,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(161,1,1,'Reported via Twitter',17,4,23.750357,90.325409,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(162,1,1,'Reported via Twitter',14,1,23.636084,90.232407,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(163,1,1,'Reported via Twitter',6,2,23.823223,90.491356,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(164,1,1,'Please help!',14,1,23.735741,90.508301,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(165,1,1,'Please help!',16,1,23.697294,90.331917,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(166,1,1,'Reported via Facebook',5,1,23.809067,90.552383,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(167,1,1,'Please help!',4,2,23.783121,90.473480,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(168,1,1,'Reported via Twitter',15,2,23.690331,90.498940,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(169,1,1,'Please help!',15,8,23.754501,90.318375,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(170,1,1,'Reported via Twitter',9,1,23.488037,89.973862,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:05'),(171,1,1,'Reported via Facebook',11,4,23.689974,90.510216,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(172,1,1,'Reported via Twitter',7,1,23.694208,90.447266,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(173,1,1,'Reported via Twitter',10,4,23.798063,90.237190,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(174,1,1,'Please help!',16,1,23.725855,90.299156,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(175,1,1,'Please help!',20,2,23.789751,90.464622,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(176,1,1,'Please help!',7,1,23.680243,90.412003,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(177,1,1,'Reported via Facebook',14,1,23.744064,90.499504,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(178,1,1,'Reported via Facebook',14,1,23.650461,90.367081,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(179,1,1,'Reported via Facebook',2,2,23.664207,90.408455,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(180,1,1,'Please help!',11,1,23.690609,90.534248,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(181,1,1,'Reported via Facebook',15,4,23.846382,90.465286,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(182,1,1,'Reported via Facebook',4,8,23.756090,90.275024,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(183,1,1,'Reported via Twitter',6,1,23.850281,90.451996,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(184,1,1,'Reported via Twitter',9,2,23.731102,90.490326,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(185,1,1,'Reported via Twitter',7,1,23.852768,90.481514,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(186,1,1,'Reported via Twitter',17,1,23.774714,90.483894,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(187,1,1,'Reported via Twitter',19,4,23.713533,90.589249,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(188,1,1,'Please help!',4,1,23.809771,90.465248,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(189,1,1,'Please help!',6,1,23.787119,90.444992,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(190,1,1,'Reported via Twitter',15,1,23.764116,90.298264,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(191,1,1,'Reported via Facebook',12,1,23.881655,90.454414,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(192,1,1,'Reported via Twitter',8,2,23.836664,90.459358,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(193,1,1,'Please help!',20,2,23.690409,90.513504,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(194,1,1,'Reported via Twitter',12,2,23.721701,90.300682,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:06'),(195,1,1,'Reported via Twitter',7,2,23.625156,90.334732,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(196,1,1,'Reported via Facebook',19,2,23.729729,90.551155,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(197,1,1,'Please help!',12,1,23.617182,90.351761,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(198,1,1,'Reported via Twitter',10,1,23.708494,90.487984,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(199,1,1,'Reported via Twitter',18,8,23.734751,90.533684,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(200,1,1,'Reported via Facebook',16,1,23.712538,90.356697,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(201,1,1,'Reported via Twitter',3,1,23.752184,90.581902,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(202,1,1,'Reported via Twitter',12,2,23.776134,90.467346,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(203,1,1,'Reported via Facebook',5,2,23.777586,90.447563,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(204,1,1,'Reported via Facebook',6,1,23.676102,90.520119,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(205,1,1,'Reported via Twitter',17,1,23.454000,90.009460,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(206,1,1,'Please help!',16,1,23.787786,90.479752,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(207,1,1,'Reported via Twitter',12,1,23.766785,90.301018,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(208,1,1,'Reported via Facebook',2,1,23.672884,90.410233,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(209,1,1,'Reported via Twitter',6,2,23.717644,90.371140,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(210,1,1,'Reported via Twitter',16,1,23.652880,90.386917,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(211,1,1,'Reported via Facebook',2,1,23.756565,90.475456,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(212,1,1,'Reported via Twitter',15,2,23.647949,90.426781,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(213,1,1,'Please help!',4,2,23.846844,90.471062,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(214,1,1,'Reported via Twitter',2,2,23.600058,90.211243,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(215,1,1,'Reported via Twitter',15,1,23.735390,90.450661,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(216,1,1,'Reported via Twitter',1,1,23.669641,90.548447,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:07'),(217,1,1,'Reported via Facebook',17,2,23.746820,90.464615,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(218,1,1,'Reported via Facebook',4,2,23.708363,90.486824,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(219,1,1,'Please help!',15,1,23.832232,90.461723,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(220,1,1,'Please help!',15,4,23.762789,90.443993,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(221,1,1,'Please help!',11,4,23.761650,90.227737,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(222,1,1,'Reported via Twitter',17,1,23.845278,90.509460,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(223,1,1,'Reported via Twitter',15,8,23.633566,90.362579,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(224,1,1,'Please help!',3,2,23.802773,90.528076,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(225,1,1,'Reported via Facebook',9,1,23.779455,90.474968,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(226,1,1,'Reported via Twitter',16,1,23.793154,90.480232,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(227,1,1,'Reported via Twitter',13,1,23.772362,90.454849,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(228,1,1,'Reported via Twitter',10,2,23.766108,90.298828,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(229,1,1,'Reported via Twitter',9,1,23.782234,90.307625,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(230,1,1,'Please help!',13,1,23.890608,90.309898,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(231,1,1,'Reported via Twitter',18,4,23.678810,90.501053,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(232,1,1,'Reported via Facebook',9,2,23.608471,90.466042,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(233,1,1,'Reported via Twitter',1,1,23.673119,90.330009,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(234,1,1,'Reported via Facebook',18,1,23.724802,90.486412,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(235,1,1,'Please help!',18,2,23.788698,90.485771,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(236,1,1,'Reported via Facebook',16,1,23.727175,90.333931,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(237,1,1,'Reported via Twitter',2,1,23.740189,90.570145,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(238,1,1,'Please help!',7,1,23.620861,90.443871,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(239,1,1,'Please help!',12,4,23.980669,90.353279,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(240,1,1,'Reported via Facebook',19,1,23.761063,90.286354,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:08'),(241,1,1,'Reported via Twitter',17,2,23.748604,90.484375,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(242,1,1,'Please help!',13,1,23.718910,90.401703,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(243,1,1,'Reported via Facebook',15,1,23.533951,90.861244,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(244,1,1,'Please help!',20,1,23.737722,90.465561,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(245,1,1,'Reported via Twitter',12,4,23.786766,90.494781,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(246,1,1,'Reported via Twitter',16,1,23.685787,90.420120,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(247,1,1,'Please help!',1,2,23.830931,90.453644,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(248,1,1,'Reported via Facebook',1,2,23.705992,90.516457,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(249,1,1,'Reported via Twitter',11,1,23.692930,90.533142,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(250,1,1,'Reported via Facebook',2,2,23.764635,90.288788,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(251,1,1,'Reported via Twitter',9,1,23.738688,90.444839,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(252,1,1,'Please help!',9,2,23.744505,90.333359,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(253,1,1,'Reported via Twitter',17,1,23.847807,90.461899,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(254,1,1,'Reported via Facebook',11,4,23.780777,90.334457,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(255,1,1,'Please help!',6,1,23.809958,90.511993,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(256,1,1,'Reported via Facebook',0,1,23.771786,90.481140,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(257,1,1,'Reported via Twitter',5,1,23.812328,90.487709,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(258,1,1,'Reported via Twitter',18,2,23.765137,90.473427,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(259,1,1,'Please help!',1,1,23.794989,90.468399,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(260,1,1,'Reported via Facebook',11,1,23.783026,90.475212,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(261,1,1,'Please help!',10,1,23.811272,90.304832,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(262,1,1,'Reported via Facebook',18,1,23.976137,90.489227,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:09'),(263,1,1,'Please help!',5,1,23.806633,90.365494,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(264,1,1,'Please help!',16,2,23.738482,90.333153,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(265,1,1,'Reported via Twitter',19,4,23.755014,90.481293,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(266,1,1,'Please help!',1,1,23.625608,90.258095,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(267,1,1,'Reported via Facebook',18,2,23.640371,90.444099,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(268,1,1,'Please help!',7,1,23.707188,90.481583,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(269,1,1,'Reported via Twitter',8,2,23.641212,90.431335,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(270,1,1,'Reported via Facebook',18,1,23.746054,90.353973,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(271,1,1,'Please help!',18,1,23.762255,90.564056,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(272,1,1,'Reported via Facebook',3,1,23.627134,90.479149,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(273,1,1,'Please help!',17,2,23.840040,90.455421,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(274,1,1,'Reported via Facebook',6,2,23.787132,90.476105,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(275,1,1,'Reported via Twitter',18,1,23.741179,90.338097,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(276,1,1,'Reported via Facebook',14,2,23.747169,90.455833,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(277,1,1,'Reported via Facebook',8,1,23.692854,90.434998,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(278,1,1,'Please help!',4,2,23.710901,90.506805,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(279,1,1,'Please help!',11,1,23.289389,90.387299,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(280,1,1,'Reported via Twitter',9,1,23.730370,90.467072,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(281,1,1,'Reported via Facebook',16,8,23.784241,90.598183,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(282,1,1,'Reported via Twitter',8,2,23.700014,90.541718,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(283,1,1,'Reported via Facebook',11,1,23.659855,90.416824,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(284,1,1,'Reported via Facebook',20,2,23.865547,90.530098,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(285,1,1,'Please help!',9,1,23.682863,90.504906,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(286,1,1,'Please help!',17,2,23.779093,90.459389,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(287,1,1,'Reported via Twitter',2,1,23.859655,90.487694,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:10'),(288,1,1,'Please help!',5,1,23.747374,90.462746,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(289,1,1,'Please help!',17,4,23.711100,90.541542,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(290,1,1,'Reported via Facebook',11,1,23.841774,90.449951,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(291,1,1,'Please help!',5,2,23.627785,90.512413,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(292,1,1,'Reported via Facebook',19,1,23.760687,90.486221,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(293,1,1,'Please help!',9,2,23.678574,90.379578,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(294,1,1,'Reported via Twitter',2,1,23.801928,90.472404,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(295,1,1,'Reported via Twitter',5,1,23.784477,90.464706,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(296,1,1,'Reported via Facebook',8,2,23.808094,90.471298,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(297,1,1,'Reported via Facebook',16,1,23.824471,90.321205,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(298,1,1,'Please help!',2,2,23.702642,90.363960,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(299,1,1,'Reported via Facebook',5,4,23.908880,90.382904,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(300,1,1,'Reported via Twitter',8,1,23.913666,90.338707,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(301,1,1,'Reported via Facebook',16,1,23.876801,90.294716,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(302,1,1,'Reported via Twitter',12,1,23.727224,90.373451,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(303,1,1,'Reported via Twitter',11,4,23.713705,90.196396,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(304,1,1,'Please help!',11,2,23.741598,90.472229,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(305,1,1,'Reported via Facebook',11,1,23.719000,90.491890,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(306,1,1,'Reported via Facebook',19,1,23.707726,90.336586,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(307,1,1,'Reported via Facebook',6,2,23.848089,90.444710,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(308,1,1,'Reported via Twitter',6,2,23.707916,90.550713,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(309,1,1,'Reported via Facebook',2,8,23.621450,90.256393,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(310,1,1,'Reported via Facebook',11,1,23.784098,90.559372,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(311,1,1,'Reported via Twitter',18,2,23.734661,90.300270,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:11'),(312,1,1,'Please help!',17,1,23.616430,90.553772,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(313,1,1,'Please help!',11,2,23.756643,90.328819,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(314,1,1,'Reported via Twitter',20,2,23.724892,90.296661,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(315,1,1,'Reported via Facebook',8,1,23.707821,90.376144,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(316,1,1,'Please help!',13,2,23.871746,90.514626,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(317,1,1,'Please help!',18,1,23.817312,90.499435,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(318,1,1,'Reported via Facebook',7,1,23.754637,90.295387,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(319,1,1,'Reported via Facebook',9,1,23.375153,90.243141,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(320,1,1,'Reported via Twitter',0,1,23.748671,90.474281,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(321,1,1,'Reported via Facebook',1,2,23.772629,90.480179,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(322,1,1,'Reported via Facebook',5,1,23.778830,90.474472,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(323,1,1,'Please help!',7,1,23.668364,90.407204,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(324,1,1,'Reported via Twitter',15,1,23.869783,90.465538,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(325,1,1,'Please help!',1,1,23.670013,90.519234,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(326,1,1,'Reported via Facebook',14,2,23.705481,90.357712,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(327,1,1,'Reported via Facebook',9,1,23.751547,90.450485,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(328,1,1,'Reported via Twitter',18,1,23.755451,90.470352,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(329,1,1,'Reported via Facebook',14,2,23.674341,90.421677,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(330,1,1,'Reported via Twitter',14,4,23.847734,90.467018,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(331,1,1,'Reported via Facebook',14,1,23.798473,90.313499,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(332,1,1,'Reported via Facebook',7,1,23.798948,90.488304,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:12'),(333,1,1,'Please help!',12,2,23.824350,90.451851,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(334,1,1,'Reported via Facebook',5,1,23.782484,90.438751,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(335,1,1,'Reported via Facebook',11,2,23.736473,90.468208,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(336,1,1,'Reported via Facebook',8,1,23.980190,90.316109,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(337,1,1,'Please help!',11,4,23.807331,90.289848,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(338,1,1,'Reported via Twitter',2,1,23.887665,90.322845,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(339,1,1,'Reported via Twitter',20,1,23.693092,90.235069,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(340,1,1,'Reported via Facebook',7,2,23.730711,90.498260,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(341,1,1,'Reported via Twitter',13,1,23.720797,90.489410,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(342,1,1,'Reported via Twitter',1,2,23.811989,90.535713,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(343,1,1,'Reported via Twitter',8,1,23.697046,90.332695,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(344,1,1,'Reported via Facebook',14,4,23.751120,90.532906,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(345,1,1,'Reported via Twitter',16,1,23.810486,90.578735,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(346,1,1,'Please help!',2,1,23.697845,90.539314,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(347,1,1,'Please help!',6,1,23.645222,90.344971,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(348,1,1,'Reported via Facebook',8,4,23.670918,90.536964,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(349,1,1,'Reported via Twitter',0,2,23.630697,90.467201,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(350,1,1,'Reported via Twitter',16,2,23.613659,90.562340,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(351,1,1,'Reported via Facebook',5,1,23.812775,90.462547,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(352,1,1,'Reported via Twitter',10,1,23.306906,90.610466,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(353,1,1,'Reported via Facebook',5,1,23.764238,90.295578,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(354,1,1,'Reported via Facebook',16,2,23.809193,90.484612,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(355,1,1,'Reported via Facebook',20,1,23.745142,90.480545,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:13'),(356,1,1,'Reported via Facebook',8,4,23.909752,90.361183,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(357,1,1,'Reported via Facebook',10,1,23.750711,90.386444,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(358,1,1,'Reported via Facebook',7,1,23.843256,90.486687,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(359,1,1,'Reported via Twitter',7,1,23.778147,90.482162,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(360,1,1,'Reported via Twitter',12,1,23.737923,90.460831,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(361,1,1,'Reported via Facebook',19,1,23.688982,90.504333,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(362,1,1,'Please help!',0,8,23.825876,90.569046,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(363,1,1,'Reported via Twitter',17,1,23.657034,90.427940,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(364,1,1,'Reported via Facebook',8,2,23.758276,90.592346,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(365,1,1,'Reported via Facebook',8,2,23.689859,90.527168,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(366,1,1,'Please help!',20,2,23.786018,90.436333,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(367,1,1,'Please help!',6,1,23.833227,90.291840,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(368,1,1,'Please help!',14,2,23.842052,90.450821,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(369,1,1,'Reported via Facebook',2,2,23.745575,90.285950,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(370,1,1,'Please help!',20,1,23.790092,90.464401,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(371,1,1,'Reported via Twitter',9,2,23.665157,90.218903,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(372,1,1,'Please help!',3,1,23.814688,90.377426,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(373,1,1,'Reported via Twitter',12,2,23.703762,90.398201,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(374,1,1,'Please help!',19,1,23.811382,90.356262,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(375,1,1,'Please help!',2,1,23.778622,90.470284,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(376,1,1,'Reported via Facebook',12,1,23.722542,90.307510,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(377,1,1,'Reported via Facebook',18,2,23.779285,90.461884,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:14'),(378,1,1,'Reported via Facebook',9,2,23.628630,90.281586,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(379,1,1,'Reported via Twitter',9,1,23.713730,90.339371,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(380,1,1,'Reported via Twitter',9,1,23.710995,90.495827,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(381,1,1,'Reported via Twitter',10,1,23.719885,90.554230,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(382,1,1,'Reported via Facebook',17,1,23.720345,90.376755,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(383,1,1,'Please help!',12,4,23.663513,90.263664,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(384,1,1,'Reported via Twitter',1,2,23.738234,90.361641,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(385,1,1,'Reported via Twitter',2,1,23.838755,90.468338,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(386,1,1,'Reported via Twitter',9,1,23.751234,90.912048,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(387,1,1,'Please help!',12,8,23.654942,90.293823,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(388,1,1,'Reported via Facebook',6,1,23.698944,90.490707,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(389,1,1,'Please help!',8,1,23.739157,90.281570,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(390,1,1,'Reported via Twitter',13,1,23.727350,90.487823,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(391,1,1,'Reported via Facebook',13,2,23.943050,90.377357,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(392,1,1,'Reported via Facebook',14,1,23.666122,90.345779,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(393,1,1,'Reported via Facebook',13,2,23.731838,90.457817,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(394,1,1,'Please help!',18,2,23.765902,90.308533,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(395,1,1,'Reported via Facebook',4,1,23.835009,90.482079,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(396,1,1,'Please help!',14,2,23.814840,90.494507,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(397,1,1,'Reported via Twitter',18,1,23.738586,90.451012,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(398,1,1,'Reported via Facebook',15,1,23.711433,90.521400,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(399,1,1,'Reported via Facebook',18,1,23.779856,90.477654,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(400,1,1,'Reported via Facebook',10,2,23.732044,90.491081,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(401,1,1,'Reported via Twitter',3,1,23.831427,90.302452,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(402,1,1,'Reported via Facebook',20,2,23.805239,90.512283,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:15'),(403,1,1,'Reported via Facebook',1,2,23.891867,90.357468,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(404,1,1,'Reported via Facebook',5,1,23.807175,90.485466,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(405,1,1,'Reported via Facebook',1,4,23.665228,90.540611,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(406,1,1,'Reported via Twitter',9,1,23.845575,90.411415,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(407,1,1,'Reported via Twitter',3,2,23.681196,90.506218,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(408,1,1,'Reported via Twitter',14,1,23.853703,90.362312,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(409,1,1,'Reported via Twitter',9,4,23.794050,90.484947,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(410,1,1,'Please help!',12,1,23.770050,90.449440,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(411,1,1,'Reported via Facebook',5,1,23.669170,90.215820,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(412,1,1,'Reported via Facebook',6,4,23.819510,90.315247,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(413,1,1,'Please help!',14,1,23.711832,90.530380,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(414,1,1,'Reported via Twitter',2,1,23.729794,90.362083,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(415,1,1,'Please help!',4,1,23.713793,90.375076,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(416,1,1,'Reported via Facebook',19,1,23.732569,90.496979,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(417,1,1,'Reported via Twitter',17,4,23.753805,90.253822,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(418,1,1,'Please help!',4,1,23.853069,90.509590,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(419,1,1,'Reported via Twitter',12,1,23.417627,90.506325,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(420,1,1,'Reported via Facebook',17,1,23.630995,90.522308,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(421,1,1,'Reported via Twitter',16,1,23.718046,90.301247,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(422,1,1,'Please help!',1,2,23.693459,90.549919,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(423,1,1,'Please help!',11,4,23.773966,90.490997,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(424,1,1,'Please help!',11,1,23.737968,90.465179,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(425,1,1,'Please help!',14,2,23.852318,90.450348,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(426,1,1,'Reported via Facebook',19,1,23.681545,90.213554,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:16'),(427,1,1,'Reported via Twitter',3,2,23.721672,90.314575,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(428,1,1,'Reported via Facebook',3,1,23.826839,90.501633,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(429,1,1,'Reported via Twitter',6,2,23.642971,90.225021,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(430,1,1,'Reported via Twitter',2,2,23.667610,90.493019,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(431,1,1,'Please help!',17,1,23.704245,90.524361,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(432,1,1,'Reported via Facebook',1,1,23.756054,90.448959,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(433,1,1,'Reported via Facebook',4,1,23.792850,90.282661,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(434,1,1,'Please help!',3,1,23.978027,90.429764,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(435,1,1,'Please help!',18,1,23.855297,90.301285,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(436,1,1,'Reported via Twitter',19,2,23.727884,90.323959,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(437,1,1,'Please help!',15,8,23.758665,90.511757,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(438,1,1,'Reported via Twitter',3,1,23.741663,90.206688,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(439,1,1,'Reported via Twitter',4,2,23.707584,90.570763,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(440,1,1,'Reported via Facebook',15,1,23.775148,90.450241,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(441,1,1,'Please help!',5,1,23.742964,90.540771,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(442,1,1,'Reported via Twitter',7,1,23.694517,90.341705,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(443,1,1,'Reported via Facebook',1,2,23.792339,90.457062,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(444,1,1,'Please help!',4,1,23.696045,90.351692,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(445,1,1,'Reported via Twitter',4,2,23.886097,90.410652,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(446,1,1,'Reported via Twitter',10,2,23.736959,90.460266,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(447,1,1,'Reported via Facebook',11,1,23.869713,90.481232,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(448,1,1,'Reported via Facebook',14,1,24.100851,90.576157,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:17'),(449,1,1,'Please help!',14,1,23.639383,90.548744,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(450,1,1,'Please help!',13,2,23.702873,90.394531,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(451,1,1,'Please help!',12,1,23.725739,90.314178,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(452,1,1,'Please help!',5,2,23.716454,90.513588,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(453,1,1,'Reported via Twitter',9,1,23.638371,90.245552,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(454,1,1,'Reported via Facebook',0,2,23.807693,90.523972,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(455,1,1,'Reported via Twitter',10,2,23.742020,90.264542,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(456,1,1,'Reported via Facebook',15,1,23.800205,90.456383,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(457,1,1,'Reported via Twitter',17,1,23.694841,90.532661,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(458,1,1,'Please help!',9,4,23.716654,90.325623,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(459,1,1,'Please help!',2,1,23.749956,90.468414,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(460,1,1,'Please help!',8,2,23.626911,90.563477,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(461,1,1,'Reported via Facebook',17,1,23.810799,90.295998,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(462,1,1,'Please help!',17,8,23.601515,90.305527,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(463,1,1,'Reported via Facebook',19,4,23.868994,90.462135,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(464,1,1,'Reported via Facebook',8,1,23.875296,90.351242,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(465,1,1,'Reported via Facebook',8,1,23.864798,90.315285,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(466,1,1,'Reported via Facebook',3,1,23.625526,90.321739,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(467,1,1,'Reported via Facebook',5,1,23.797550,90.464035,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(468,1,1,'Reported via Facebook',0,2,23.816593,90.491890,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:18'),(469,1,1,'Please help!',19,1,23.709854,90.341293,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(470,1,1,'Please help!',10,2,23.835135,90.322548,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(471,1,1,'Please help!',13,1,23.721956,90.591286,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(472,1,1,'Reported via Facebook',3,1,23.687674,90.369972,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(473,1,1,'Reported via Facebook',17,2,23.685608,90.539474,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(474,1,1,'Reported via Facebook',15,1,23.219830,90.237350,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(475,1,1,'Reported via Twitter',2,1,23.647091,90.448372,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(476,1,1,'Please help!',17,1,23.815504,90.516243,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(477,1,1,'Reported via Facebook',18,2,23.767517,90.308037,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(478,1,1,'Reported via Facebook',12,2,23.884405,90.322861,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(479,1,1,'Reported via Facebook',4,1,23.769245,90.289467,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(480,1,1,'Please help!',4,2,23.703939,90.332329,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(481,1,1,'Reported via Twitter',10,1,23.646097,90.224915,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(482,1,1,'Please help!',16,4,23.836378,90.466225,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(483,1,1,'Please help!',18,1,23.792007,90.526276,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(484,1,1,'Please help!',16,1,23.685406,90.532959,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(485,1,1,'Reported via Facebook',18,1,23.735126,90.462440,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(486,1,1,'Please help!',18,1,23.809015,90.315170,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(487,1,1,'Please help!',7,4,23.766315,90.329491,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(488,1,1,'Reported via Facebook',2,1,23.815853,90.363007,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:19'),(489,1,1,'Reported via Facebook',2,1,23.811171,90.490440,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(490,1,1,'Reported via Twitter',17,1,23.718493,90.308128,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(491,1,1,'Reported via Twitter',17,2,23.863050,90.395782,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(492,1,1,'Reported via Twitter',11,4,23.807413,90.558372,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(493,1,1,'Reported via Twitter',16,1,23.794720,90.464966,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(494,1,1,'Reported via Facebook',1,1,23.733076,90.543602,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(495,1,1,'Reported via Facebook',15,1,23.736147,90.360649,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(496,1,1,'Please help!',12,2,23.596312,90.412537,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(497,1,1,'Please help!',17,1,23.604221,90.558578,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(498,1,1,'Reported via Twitter',13,1,23.616201,90.883812,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(499,1,1,'Please help!',3,2,23.844404,90.493713,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(500,1,1,'Please help!',3,1,23.826534,90.506676,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(501,1,1,'Reported via Twitter',10,1,23.763521,90.309235,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(502,1,1,'Reported via Facebook',13,1,23.597466,90.359100,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(503,1,1,'Reported via Facebook',18,8,23.809917,90.602989,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(504,1,1,'Reported via Twitter',8,2,23.616499,90.446968,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(505,1,1,'Reported via Twitter',16,1,23.683779,90.527802,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(506,1,1,'Please help!',4,2,23.771944,90.545944,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(507,1,1,'Reported via Facebook',12,4,23.887360,90.481186,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:20'),(508,1,1,'Reported via Facebook',8,1,23.754213,90.450462,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(509,1,1,'Reported via Facebook',17,1,23.803274,90.309479,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(510,1,1,'Please help!',5,1,23.824886,90.351692,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(511,1,1,'Reported via Facebook',18,1,23.974627,90.356926,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(512,1,1,'Reported via Facebook',4,2,23.678423,90.386505,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(513,1,1,'Reported via Twitter',3,1,23.646406,90.220222,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(514,1,1,'Reported via Facebook',8,1,23.801266,90.455132,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(515,1,1,'Please help!',8,2,23.712509,90.538574,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(516,1,1,'Please help!',1,1,23.776808,90.514877,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(517,1,1,'Reported via Facebook',5,2,23.647417,90.259613,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(518,1,1,'Reported via Twitter',11,4,23.651140,90.244476,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(519,1,1,'Reported via Twitter',4,2,23.594479,90.241859,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(520,1,1,'Please help!',13,1,23.695776,90.433678,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(521,1,1,'Please help!',14,1,23.698732,90.525017,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(522,1,1,'Reported via Twitter',15,1,23.534250,90.332550,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(523,1,1,'Please help!',1,1,23.818535,90.497177,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(524,1,1,'Reported via Facebook',16,8,23.689022,90.239578,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(525,1,1,'Reported via Twitter',16,1,23.725695,90.306633,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(526,1,1,'Please help!',14,1,23.581940,90.374870,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:21'),(527,1,1,'Please help!',1,1,23.685051,90.515099,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(528,1,1,'Please help!',10,2,23.806795,90.518639,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(529,1,1,'Reported via Twitter',8,2,23.777996,90.243256,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(530,1,1,'Reported via Facebook',15,1,23.821686,90.271080,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(531,1,1,'Reported via Twitter',13,2,23.905912,90.315948,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(532,1,1,'Reported via Facebook',10,1,23.872433,90.313805,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(533,1,1,'Reported via Twitter',10,1,23.958416,90.483109,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(534,1,1,'Reported via Twitter',20,1,23.604668,90.384018,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(535,1,1,'Reported via Twitter',16,2,23.850971,90.290565,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(536,1,1,'Reported via Facebook',18,1,23.784170,90.467934,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(537,1,1,'Please help!',12,2,23.801537,90.544441,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(538,1,1,'Reported via Twitter',0,5,23.912451,90.364105,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(539,1,1,'Reported via Facebook',10,3,23.824341,90.286003,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(540,1,1,'Reported via Facebook',14,1,23.792765,90.501068,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(541,1,1,'Reported via Twitter',0,1,23.644527,90.407181,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:22'),(542,1,1,'Please help!',19,1,23.636087,90.483536,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(543,1,1,'Reported via Twitter',7,2,23.621809,90.514534,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(544,1,1,'Reported via Facebook',9,1,23.802017,90.526779,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(545,1,1,'Please help!',9,4,23.813656,90.336746,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(546,1,1,'Please help!',11,4,23.898432,90.416580,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(547,1,1,'Reported via Facebook',2,1,23.731937,90.314453,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(548,1,1,'Reported via Twitter',17,1,23.712597,90.358154,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(549,1,1,'Please help!',3,4,23.723104,90.574928,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(550,1,1,'Please help!',18,1,23.693844,90.544632,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(551,1,1,'Reported via Twitter',5,1,23.769907,90.281219,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(552,1,1,'Reported via Facebook',12,1,23.841496,90.338066,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(553,1,1,'Reported via Facebook',19,2,23.640390,90.451691,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(554,1,1,'Please help!',16,2,23.689251,90.513725,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(555,1,1,'Please help!',19,1,23.817427,90.422920,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(556,1,1,'Reported via Twitter',14,3,23.701258,90.228966,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(557,1,1,'Reported via Facebook',2,5,23.785069,90.336159,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(558,1,1,'Please help!',12,1,23.652582,90.296371,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(559,1,1,'Reported via Facebook',13,2,23.578272,90.388687,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:23'),(560,1,1,'Reported via Facebook',14,8,23.783716,90.563972,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(561,1,1,'Please help!',15,3,23.798977,90.320786,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(562,1,1,'Reported via Facebook',8,5,23.789347,90.288979,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(563,1,1,'Reported via Facebook',1,1,23.786068,90.486069,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(564,1,1,'Reported via Twitter',17,2,23.769081,90.504837,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(565,1,1,'Please help!',0,1,23.642189,90.461273,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(566,1,1,'Reported via Twitter',15,1,23.865446,90.531654,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(567,1,1,'Reported via Facebook',2,1,23.684950,90.325424,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(568,1,1,'Please help!',10,2,23.906607,90.416649,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(569,1,1,'Please help!',18,2,23.659405,90.320679,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(570,1,1,'Please help!',18,4,23.665253,90.218102,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(571,1,1,'Reported via Twitter',6,1,23.802082,90.254051,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:24'),(572,1,1,'Please help!',6,1,23.849125,90.397667,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(573,1,1,'Reported via Twitter',12,3,23.795734,90.330238,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(574,1,1,'Please help!',10,1,23.884794,90.353355,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(575,1,1,'Reported via Twitter',3,1,23.615919,90.203453,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(576,1,1,'Please help!',0,8,23.732269,90.293770,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(577,1,1,'Please help!',8,5,23.718628,90.263237,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(578,1,1,'Reported via Facebook',17,3,23.771015,90.291489,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(579,1,1,'Please help!',8,5,23.793600,90.262787,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(580,1,1,'Please help!',10,2,23.699589,90.528656,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(581,1,1,'Reported via Twitter',10,1,23.754431,90.558380,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(582,1,1,'Please help!',16,4,23.943983,90.489182,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(583,1,1,'Please help!',19,2,23.797329,90.523972,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(584,1,1,'Reported via Facebook',19,2,23.827314,90.283401,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(585,1,1,'Reported via Facebook',11,1,23.710651,90.496254,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(586,1,1,'Please help!',0,1,23.834066,90.469925,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(587,1,1,'Reported via Twitter',20,1,23.613895,90.347046,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(588,1,1,'Please help!',6,2,23.817047,90.331955,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(589,1,1,'Reported via Twitter',5,2,23.697092,90.527557,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:25'),(590,1,1,'Please help!',20,1,23.807430,90.252678,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(591,1,1,'Please help!',12,2,23.750801,90.311340,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(592,1,1,'Reported via Facebook',1,3,23.700230,90.327972,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(593,1,1,'Reported via Twitter',1,1,23.936787,90.346458,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(594,1,1,'Reported via Facebook',16,1,23.896328,90.350014,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(595,1,1,'Please help!',12,1,23.675495,90.220985,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(596,1,1,'Please help!',12,5,23.702875,90.238853,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(597,1,1,'Reported via Twitter',19,3,23.822712,90.369751,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(598,1,1,'Please help!',8,5,23.891975,90.368782,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(599,1,1,'Please help!',4,1,23.772060,90.520020,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(600,1,1,'Please help!',11,1,23.675299,90.477753,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(601,1,1,'Reported via Twitter',5,2,23.650059,90.446335,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:26'),(602,1,1,'Reported via Facebook',9,1,23.804733,90.504570,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(603,1,1,'Reported via Twitter',2,1,23.592398,90.205353,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(604,1,1,'Please help!',18,2,23.823435,90.453857,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(605,1,1,'Reported via Twitter',9,1,23.767693,90.250122,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(606,1,1,'Reported via Facebook',5,2,23.763439,90.493851,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(607,1,1,'Reported via Twitter',8,3,23.801128,90.274040,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(608,1,1,'Reported via Twitter',9,1,23.890162,90.315079,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(609,1,1,'Reported via Twitter',8,2,23.696882,90.461304,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(610,1,1,'Please help!',15,1,23.868547,90.353889,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(611,1,1,'Reported via Facebook',16,5,23.781069,90.228485,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(612,1,1,'Reported via Facebook',17,3,23.835716,90.412209,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(613,1,1,'Reported via Twitter',1,3,23.699671,90.478279,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(614,1,1,'Please help!',8,5,23.742914,90.456192,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(615,1,1,'Reported via Twitter',19,5,23.940506,90.290878,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(616,1,1,'Reported via Twitter',14,1,23.678829,90.229431,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:27'),(617,1,1,'Reported via Twitter',10,1,23.811619,90.497787,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(618,1,1,'Reported via Facebook',4,1,23.676638,90.465805,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(619,1,1,'Please help!',1,2,23.672077,90.549858,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(620,1,1,'Reported via Facebook',18,2,23.646643,90.225571,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(621,1,1,'Reported via Facebook',10,1,23.810633,90.524048,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(622,1,1,'Reported via Facebook',10,1,23.717434,90.296875,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(623,1,1,'Reported via Twitter',10,2,23.586435,90.222382,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(624,1,1,'Reported via Facebook',6,1,23.776752,90.284393,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(625,1,1,'Reported via Facebook',19,2,23.872143,90.460358,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(626,1,1,'Reported via Twitter',17,5,23.894279,90.390282,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(627,1,1,'Please help!',7,2,23.795874,90.267708,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(628,1,1,'Reported via Twitter',17,3,23.762014,90.267349,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(629,1,1,'Please help!',10,3,23.877626,90.413910,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(630,1,1,'Reported via Twitter',1,1,23.810884,90.357109,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:28'),(631,1,1,'Please help!',17,1,23.810436,90.302841,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(632,1,1,'Reported via Twitter',8,5,23.751591,90.268410,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(633,1,1,'Reported via Facebook',6,3,23.832287,90.281242,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(634,1,1,'Reported via Twitter',1,3,23.712009,90.506783,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(635,1,1,'Reported via Twitter',5,5,23.630651,90.443642,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(636,1,1,'Reported via Facebook',8,2,23.838898,90.366135,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(637,1,1,'Reported via Twitter',14,1,23.741903,90.268440,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(638,1,1,'Reported via Facebook',1,1,23.750460,90.538116,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(639,1,1,'Reported via Twitter',3,5,23.763123,90.313927,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(640,1,1,'Please help!',18,2,23.803392,90.368744,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(641,1,1,'Reported via Facebook',0,1,23.641291,90.543083,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(642,1,1,'Reported via Twitter',10,1,23.805037,90.530846,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(643,1,1,'Reported via Facebook',20,1,23.714375,90.305328,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(644,1,1,'Reported via Twitter',4,3,23.703140,90.303185,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(645,1,1,'Reported via Facebook',16,5,23.667187,90.387016,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(646,1,1,'Reported via Facebook',11,2,23.613718,90.562210,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:29'),(647,1,1,'Reported via Facebook',19,1,23.790218,90.295570,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(648,1,1,'Reported via Facebook',17,5,23.775633,90.437874,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(649,1,1,'Please help!',8,3,23.756933,90.454453,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(650,1,1,'Reported via Twitter',1,3,23.702419,90.244339,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(651,1,1,'Please help!',1,1,23.856365,90.289925,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(652,1,1,'Reported via Twitter',1,5,23.799507,90.268951,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(653,1,1,'Reported via Facebook',9,1,23.930191,90.491882,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(654,1,1,'Reported via Facebook',0,3,23.850351,90.289101,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(655,1,1,'Reported via Twitter',16,3,23.705700,90.489754,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(656,1,1,'Reported via Facebook',4,5,23.764669,90.528709,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(657,1,1,'Please help!',16,1,23.608225,90.287605,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(658,1,1,'Reported via Twitter',8,5,23.809635,90.322495,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(659,1,1,'Please help!',7,1,23.717205,90.506721,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(660,1,1,'Reported via Facebook',3,1,23.678602,90.552628,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(661,1,1,'Please help!',13,2,23.639355,90.327049,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(662,1,1,'Reported via Facebook',6,2,23.749504,90.552361,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(663,1,1,'Reported via Twitter',12,1,23.797634,90.507866,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:30'),(664,1,1,'Please help!',5,1,23.646463,90.384293,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(665,1,1,'Reported via Facebook',17,5,23.663729,90.334038,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(666,1,1,'Reported via Facebook',19,3,23.627775,90.324577,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(667,1,1,'Reported via Twitter',15,1,23.797884,90.322372,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(668,1,1,'Reported via Twitter',0,5,23.887144,90.437912,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(669,1,1,'Reported via Facebook',13,3,23.802071,90.335152,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(670,1,1,'Reported via Facebook',10,3,23.918543,90.373940,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(671,1,1,'Please help!',9,1,23.860697,90.309464,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(672,1,1,'Please help!',12,2,23.630598,90.330452,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(673,1,1,'Reported via Facebook',1,1,23.947260,90.478912,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(674,1,1,'Please help!',13,3,23.944456,90.408424,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(675,1,1,'Please help!',0,3,23.716867,90.464615,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(676,1,1,'Please help!',17,5,23.725967,90.278061,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(677,1,1,'Reported via Twitter',19,2,23.906675,90.481995,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(678,1,1,'Please help!',19,1,23.747766,90.329353,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(679,1,1,'Reported via Facebook',10,5,23.797310,90.530266,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(680,1,1,'Reported via Facebook',11,1,23.712893,90.590347,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(681,1,1,'Reported via Twitter',14,5,23.922432,90.255638,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:31'),(682,1,1,'Please help!',12,2,23.817900,90.488670,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(683,1,1,'Reported via Facebook',12,2,23.774080,90.317406,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(684,1,1,'Reported via Facebook',15,1,23.655840,90.447624,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(685,1,1,'Please help!',1,2,23.670626,90.472084,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(686,1,1,'Reported via Facebook',15,1,23.824492,90.473480,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(687,1,1,'Reported via Twitter',5,1,23.709078,90.379494,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(688,1,1,'Reported via Twitter',2,5,23.735252,90.318329,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(689,1,1,'Reported via Facebook',18,3,23.724632,90.301178,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(690,1,1,'Please help!',5,2,23.853041,90.303329,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(691,1,1,'Reported via Twitter',1,1,23.812696,90.288635,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(692,1,1,'Reported via Twitter',6,5,23.763748,90.539246,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(693,1,1,'Reported via Twitter',12,3,23.788387,90.308899,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(694,1,1,'Please help!',19,3,23.799059,90.516693,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(695,1,1,'Please help!',19,1,23.864021,90.340675,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(696,1,1,'Please help!',19,1,23.815380,90.474014,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(697,1,1,'Please help!',19,3,23.789337,90.578751,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(698,1,1,'Reported via Twitter',19,3,23.869265,90.430290,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(699,1,1,'Reported via Twitter',2,5,23.769920,90.247025,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:32'),(700,1,1,'Reported via Facebook',7,2,23.614323,90.270638,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(701,1,1,'Reported via Twitter',5,5,23.633913,90.404510,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(702,1,1,'Reported via Twitter',6,1,23.745348,90.246979,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(703,1,1,'Reported via Facebook',8,5,23.945604,90.348518,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(704,1,1,'Please help!',6,1,23.637556,90.499435,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(705,1,1,'Reported via Twitter',6,1,23.809769,90.473419,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(706,1,1,'Reported via Twitter',17,1,23.652172,90.272614,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(707,1,1,'Reported via Facebook',3,5,23.738430,90.370102,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(708,1,1,'Reported via Twitter',7,3,23.679482,90.374947,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(709,1,1,'Please help!',9,5,23.878212,90.433792,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(710,1,1,'Reported via Facebook',2,3,23.894844,90.429703,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(711,1,1,'Reported via Facebook',4,3,23.708755,90.258293,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:33'),(712,1,1,'Reported via Twitter',11,1,23.857122,90.331482,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(713,1,1,'Please help!',11,1,23.938114,90.413673,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(714,1,1,'Reported via Twitter',14,2,23.823982,90.548241,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(715,1,1,'Reported via Twitter',5,3,23.607386,90.512451,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(716,1,1,'Reported via Facebook',7,2,23.835974,90.358955,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(717,1,1,'Reported via Twitter',13,3,23.904078,90.420326,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(718,1,1,'Reported via Twitter',2,5,23.768917,90.218391,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(719,1,1,'Reported via Facebook',7,5,23.756929,90.560219,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(720,1,1,'Reported via Facebook',0,1,23.681786,90.201080,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(721,1,1,'Please help!',18,5,23.943941,90.406845,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(722,1,1,'Reported via Facebook',9,2,23.682955,90.474701,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(723,1,1,'Please help!',19,1,23.710629,90.512123,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(724,1,1,'Please help!',3,1,23.861332,90.536850,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(725,1,1,'Reported via Facebook',20,1,23.691893,90.265892,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(726,1,1,'Reported via Facebook',11,5,23.718868,90.381531,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(727,1,1,'Reported via Facebook',8,3,23.680920,90.363220,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:34'),(728,1,1,'Reported via Twitter',16,5,23.887371,90.361107,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(729,1,1,'Reported via Facebook',15,3,23.803198,90.316551,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(730,1,1,'Please help!',5,3,23.828587,90.544617,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(731,1,1,'Reported via Twitter',7,1,23.882029,90.372093,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(732,1,1,'Reported via Facebook',10,2,23.873180,90.533516,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(733,1,1,'Please help!',19,1,23.904041,90.350372,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(734,1,1,'Reported via Twitter',12,2,23.731295,90.323212,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(735,1,1,'Please help!',16,2,23.772818,90.245842,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(736,1,1,'Reported via Facebook',20,3,23.794779,90.420815,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(737,1,1,'Reported via Facebook',10,3,23.934580,90.316216,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(738,1,1,'Please help!',17,5,23.717087,90.311020,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(739,1,1,'Reported via Facebook',14,5,23.677752,90.422920,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(740,1,1,'Reported via Facebook',0,1,23.654707,90.235191,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(741,1,1,'Reported via Facebook',11,5,23.918266,90.265160,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(742,1,1,'Reported via Twitter',1,2,23.888039,90.371132,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:35'),(743,1,1,'Please help!',12,1,23.809982,90.530067,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(744,1,1,'Please help!',14,1,23.669928,90.272690,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(745,1,1,'Please help!',18,5,23.718077,90.355110,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(746,1,1,'Reported via Facebook',19,3,23.685698,90.370270,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(747,1,1,'Please help!',18,3,23.800251,90.235466,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(748,1,1,'Reported via Twitter',5,2,23.825985,90.370911,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(749,1,1,'Reported via Twitter',3,5,23.874975,90.433525,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(750,1,1,'Please help!',13,1,23.898516,90.496002,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(751,1,1,'Please help!',8,3,23.772058,90.391647,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(752,1,1,'Reported via Twitter',17,2,23.630775,90.527748,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(753,1,1,'Please help!',17,3,23.644716,90.565887,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(754,1,1,'Please help!',10,5,23.739576,90.251167,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(755,1,1,'Reported via Facebook',15,3,23.796707,90.265968,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(756,1,1,'Reported via Facebook',18,5,23.725149,90.401711,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:36'),(757,1,1,'Reported via Facebook',19,5,23.858366,90.382385,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(758,1,1,'Please help!',4,1,23.605322,90.361572,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(759,1,1,'Please help!',9,1,23.830759,90.504868,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(760,1,1,'Reported via Facebook',16,2,23.823547,90.573898,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(761,1,1,'Reported via Facebook',18,5,23.633242,90.320648,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(762,1,1,'Please help!',13,3,23.647055,90.328255,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(763,1,1,'Reported via Facebook',16,2,23.675287,90.385750,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(764,1,1,'Reported via Twitter',9,3,23.799753,90.302727,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(765,1,1,'Please help!',14,5,23.853271,90.502808,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(766,1,1,'Reported via Twitter',16,1,23.869453,90.382256,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(767,1,1,'Reported via Twitter',15,3,23.801258,90.443573,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:37'),(768,1,1,'Please help!',10,3,23.680700,90.458824,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(769,1,1,'Reported via Twitter',10,5,23.686493,90.337044,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(770,1,1,'Please help!',16,3,23.924145,90.388527,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(771,1,1,'Reported via Facebook',13,5,23.665800,90.586830,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(772,1,1,'Please help!',12,5,23.899893,90.351646,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(773,1,1,'Reported via Twitter',10,1,23.661728,90.340027,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(774,1,1,'Reported via Twitter',5,5,23.721222,90.315788,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(775,1,1,'Reported via Facebook',3,3,23.791714,90.281799,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:38'),(776,1,1,'Reported via Facebook',20,3,23.643118,90.315521,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(777,1,1,'Reported via Facebook',18,5,23.736994,90.529396,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(778,1,1,'Please help!',10,1,23.971155,90.342262,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(779,1,1,'Reported via Twitter',13,3,23.861200,90.461090,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(780,1,1,'Reported via Twitter',4,3,23.781696,90.510994,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(781,1,1,'Please help!',19,2,23.867411,90.328468,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(782,1,1,'Please help!',3,5,23.704885,90.238434,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(783,1,1,'Reported via Twitter',0,3,23.792553,90.343292,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(784,1,1,'Please help!',18,5,23.641775,90.587563,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(785,1,1,'Please help!',15,5,23.882650,90.281822,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(786,1,1,'Reported via Facebook',14,1,23.740091,90.208511,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(787,1,1,'Please help!',11,2,23.754248,90.361465,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(788,1,1,'Please help!',16,5,23.682487,90.329353,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:39'),(789,1,1,'Reported via Facebook',7,3,23.773939,90.322037,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(790,1,1,'Reported via Facebook',9,5,23.882742,90.518471,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(791,1,1,'Reported via Facebook',10,3,23.740536,90.331749,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(792,1,1,'Reported via Facebook',10,3,23.850788,90.506310,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(793,1,1,'Please help!',19,3,23.741598,90.427383,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(794,1,1,'Reported via Facebook',18,3,23.783625,90.327766,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(795,1,1,'Please help!',19,5,23.712074,90.469803,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(796,1,1,'Reported via Twitter',9,5,23.761694,90.258186,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(797,1,1,'Please help!',4,5,23.949608,90.401924,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:40'),(798,1,1,'Reported via Facebook',5,1,23.701242,90.356621,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(799,1,1,'Reported via Facebook',9,5,23.664091,90.372398,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(800,1,1,'Reported via Twitter',8,3,23.722658,90.305046,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(801,1,1,'Reported via Facebook',9,5,23.819906,90.499344,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(802,1,1,'Please help!',10,3,23.687824,90.409340,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(803,1,1,'Reported via Twitter',17,3,23.816919,90.542313,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(804,1,1,'Reported via Facebook',1,3,23.711025,90.537842,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(805,1,1,'Reported via Twitter',16,3,23.910612,90.322617,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(806,1,1,'Please help!',11,5,23.643328,90.574280,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:41'),(807,1,1,'Reported via Facebook',4,5,23.741190,90.334831,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(808,1,1,'Reported via Twitter',8,5,23.785866,90.278748,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(809,1,1,'Reported via Facebook',13,1,23.679203,90.389503,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(810,1,1,'Please help!',15,5,23.633377,90.301399,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(811,1,1,'Reported via Facebook',12,3,23.711271,90.310455,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(812,1,1,'Reported via Facebook',11,5,23.812012,90.447296,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(813,1,1,'Reported via Facebook',17,3,23.669577,90.381775,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:42'),(814,1,1,'Reported via Facebook',11,3,23.748623,90.491982,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(815,1,1,'Please help!',2,3,23.664936,90.420067,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(816,1,1,'Reported via Facebook',9,3,23.866472,90.322258,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(817,1,1,'Please help!',20,5,23.919699,90.303864,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(818,1,1,'Reported via Twitter',17,5,23.622292,90.441177,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(819,1,1,'Reported via Facebook',6,1,23.598293,90.201477,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(820,1,1,'Reported via Facebook',14,5,23.642912,90.380646,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(821,1,1,'Please help!',14,3,23.687027,90.233818,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:43'),(822,1,1,'Reported via Twitter',1,5,23.840261,90.458046,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(823,1,1,'Reported via Facebook',19,3,23.645746,90.414528,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(824,1,1,'Please help!',6,3,23.699541,90.485832,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(825,1,1,'Reported via Facebook',7,3,23.724977,90.423637,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(826,1,1,'Reported via Twitter',11,3,23.930267,90.263802,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(827,1,1,'Reported via Facebook',11,5,23.828588,90.262337,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(828,1,1,'Reported via Facebook',1,5,23.607830,90.516205,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(829,1,1,'Reported via Facebook',11,1,23.750673,90.251450,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:44'),(830,1,1,'Please help!',6,5,23.661964,90.402847,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(831,1,1,'Reported via Twitter',20,3,23.710548,90.303375,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(832,1,1,'Please help!',10,5,23.915194,90.513184,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(833,1,1,'Reported via Facebook',6,3,23.631109,90.337967,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(834,1,1,'Reported via Facebook',1,3,23.917442,90.368431,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(835,1,1,'Reported via Facebook',20,3,23.761684,90.420616,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(836,1,1,'Please help!',13,3,23.942526,90.306374,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(837,1,1,'Reported via Facebook',5,5,23.854380,90.405663,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:45'),(838,1,1,'Reported via Facebook',8,5,23.736271,90.554390,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(839,1,1,'Reported via Twitter',7,5,23.653818,90.296150,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(840,1,1,'Reported via Facebook',7,3,23.767881,90.224815,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(841,1,1,'Please help!',14,5,23.857220,90.408203,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(842,1,1,'Reported via Facebook',17,3,23.719250,90.316544,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(843,1,1,'Reported via Twitter',19,3,23.930866,90.367462,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(844,1,1,'Please help!',17,3,23.646238,90.450867,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(845,1,1,'Reported via Facebook',5,3,23.731243,90.410278,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:46'),(846,1,1,'Reported via Facebook',12,5,23.946894,90.405556,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(847,1,1,'Reported via Facebook',10,5,23.733276,90.394096,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(848,1,1,'Reported via Facebook',19,3,23.727671,90.330063,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(849,1,1,'Reported via Facebook',13,5,23.642647,90.384186,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(850,1,1,'Reported via Facebook',17,5,23.790646,90.441002,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(851,1,1,'Reported via Twitter',17,3,23.624647,90.383453,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:47'),(852,1,1,'Reported via Twitter',18,3,23.875589,90.237816,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:48'),(853,1,1,'Reported via Twitter',20,3,23.865927,90.511864,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:48'),(854,1,1,'Reported via Facebook',4,3,23.667931,90.528191,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:48'),(855,1,1,'Reported via Facebook',11,5,23.653351,90.424240,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:48'),(856,1,1,'Reported via Twitter',6,5,23.737873,90.388451,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(857,1,1,'Reported via Twitter',2,3,23.748543,90.316566,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(858,1,1,'Reported via Twitter',6,3,23.825237,90.441132,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(859,1,1,'Reported via Facebook',18,3,23.909044,90.336159,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(860,1,1,'Reported via Twitter',11,3,23.683327,90.426270,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(861,1,1,'Please help!',3,5,23.732016,90.531494,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:49'),(862,1,1,'Please help!',9,5,23.745758,90.393723,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:50'),(863,1,1,'Reported via Facebook',3,3,23.697323,90.359383,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:50'),(864,1,1,'Reported via Twitter',1,3,23.765360,90.310020,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:50'),(865,1,1,'Reported via Twitter',6,3,23.759428,90.457329,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:50'),(866,1,1,'Reported via Twitter',11,3,23.766535,90.489120,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:50'),(867,1,1,'Reported via Twitter',14,5,23.708185,90.473221,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:51'),(868,1,1,'Reported via Twitter',17,5,23.724224,90.426270,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:51'),(869,1,1,'Reported via Facebook',2,3,23.668140,90.346138,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:51'),(870,1,1,'Please help!',9,3,23.951546,90.251625,5,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:52'),(871,1,1,'Please help!',19,3,23.906088,90.483994,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:52'),(872,1,1,'Please help!',4,3,23.803005,90.564651,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:52'),(873,1,1,'Reported via Twitter',18,5,23.729187,90.491310,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:52'),(874,1,1,'Reported via Twitter',16,5,23.854015,90.537537,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:53'),(875,1,1,'Reported via Twitter',15,3,23.655045,90.385674,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:53'),(876,1,1,'Reported via Twitter',4,3,23.893669,90.313721,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:53'),(877,1,1,'Reported via Twitter',18,3,23.877598,90.485718,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:53'),(878,1,1,'Reported via Facebook',11,3,23.617050,90.489090,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:53'),(879,1,1,'Please help!',2,3,23.629993,90.392502,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:54'),(880,1,1,'Please help!',4,3,23.917704,90.411118,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:54'),(881,1,1,'Reported via Facebook',19,3,23.790834,90.457466,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:54'),(882,1,1,'Please help!',17,3,23.811588,90.497795,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:54'),(883,1,1,'Please help!',5,3,23.810524,90.410568,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:55'),(884,1,1,'Reported via Twitter',15,3,23.616678,90.573547,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:56'),(885,1,1,'Please help!',6,3,23.806818,90.394775,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:56'),(886,1,1,'Reported via Facebook',17,3,23.929192,90.403107,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:57'),(887,1,1,'Reported via Facebook',9,3,23.683538,90.590927,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:57'),(888,1,1,'Reported via Facebook',1,3,23.874138,90.526039,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:57'),(889,1,1,'Reported via Facebook',10,3,23.869696,90.249634,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:58'),(890,1,1,'Reported via Twitter',14,3,23.802620,90.510834,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:58'),(891,1,1,'Reported via Twitter',12,3,23.705063,90.521912,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:59'),(892,1,1,'Reported via Twitter',0,3,23.873283,90.401131,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:10:59'),(893,1,1,'Reported via Facebook',11,3,23.832609,90.378616,4,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:00'),(894,1,1,'Please help!',2,3,23.792906,90.418121,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:00'),(895,1,1,'Please help!',5,3,23.784313,90.513527,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:01'),(896,1,1,'Please help!',13,3,23.608202,90.416481,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:01'),(897,1,1,'Please help!',3,3,23.891216,90.424416,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:02'),(898,1,1,'Reported via Facebook',10,3,23.800085,90.482887,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:02'),(899,1,1,'Reported via Facebook',8,3,23.719536,90.404083,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:04'),(900,1,1,'Reported via Facebook',12,3,23.741489,90.462456,3,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:04'),(901,1,1,'Reported via Facebook',4,3,23.671371,90.495178,2,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:05'),(902,1,1,'Please help!',2,3,23.877741,90.453148,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:05'),(903,1,1,'Reported via Facebook',11,3,23.755404,90.526375,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-11 18:11:06');
/*!40000 ALTER TABLE `ResourceRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceResponse`
--

DROP TABLE IF EXISTS `ResourceResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceResponse` (
  `ResourceResponseID` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceRequestID` int(11) DEFAULT NULL,
  `ResponseStateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ResourceResponseID`),
  KEY `fk_ResourceResponse_ResourceRequest1` (`ResourceRequestID`),
  KEY `fk_ResourceResponse_ResponseState` (`ResponseStateID`),
  CONSTRAINT `fk_ResourceResponse_ResourceRequest1` FOREIGN KEY (`ResourceRequestID`) REFERENCES `ResourceRequest` (`ResourceRequestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceResponse_ResponseState` FOREIGN KEY (`ResponseStateID`) REFERENCES `ResponseState` (`ResponseStateID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceResponse`
--

LOCK TABLES `ResourceResponse` WRITE;
/*!40000 ALTER TABLE `ResourceResponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResourceResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceSubtype`
--

DROP TABLE IF EXISTS `ResourceSubtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceSubtype` (
  `ResourceSubtypeID` int(11) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `ResourceTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ResourceSubtypeID`),
  KEY `fk_ResourceSubtype_ResourceType1` (`ResourceTypeID`),
  CONSTRAINT `fk_ResourceSubtype_ResourceType1` FOREIGN KEY (`ResourceTypeID`) REFERENCES `ResourceType` (`ResourceTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceSubtype`
--

LOCK TABLES `ResourceSubtype` WRITE;
/*!40000 ALTER TABLE `ResourceSubtype` DISABLE KEYS */;
INSERT INTO `ResourceSubtype` VALUES (1,'Potable',1),(2,'Non-potable',1);
/*!40000 ALTER TABLE `ResourceSubtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceType`
--

DROP TABLE IF EXISTS `ResourceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceType` (
  `ResourceTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ResourceTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceType`
--

LOCK TABLES `ResourceType` WRITE;
/*!40000 ALTER TABLE `ResourceType` DISABLE KEYS */;
INSERT INTO `ResourceType` VALUES (1,'Water'),(2,'Food'),(3,'Shelter'),(4,'First Aid'),(5,'Clothing'),(6,'Medicine'),(7,'Evacuation'),(8,'Rescue');
/*!40000 ALTER TABLE `ResourceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceTypeUnitOfMeasure`
--

DROP TABLE IF EXISTS `ResourceTypeUnitOfMeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceTypeUnitOfMeasure` (
  `ResourceTypeUnitOfMeasureID` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceTypeID` int(11) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`ResourceTypeUnitOfMeasureID`),
  KEY `fk_ResourceType_ResourceTypeUnitOfMeasure` (`ResourceTypeID`),
  CONSTRAINT `fk_ResourceType_ResourceTypeUnitOfMeasure` FOREIGN KEY (`ResourceTypeID`) REFERENCES `ResourceType` (`ResourceTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceTypeUnitOfMeasure`
--

LOCK TABLES `ResourceTypeUnitOfMeasure` WRITE;
/*!40000 ALTER TABLE `ResourceTypeUnitOfMeasure` DISABLE KEYS */;
INSERT INTO `ResourceTypeUnitOfMeasure` VALUES (1,2,'Liters'),(2,2,'Bottles'),(3,2,'Ounces'),(4,2,'Gallons'),(5,1,'MREs'),(6,1,'Bushel'),(7,1,'Meal'),(8,1,'Bag'),(9,3,'Uncovered'),(10,3,'Covered'),(11,3,'No Heat'),(12,4,'Station'),(13,4,'ER'),(14,5,'Coats'),(15,5,'Shoes'),(16,5,'General'),(17,6,'OTC'),(18,6,'Pain Mgmt'),(19,6,'Viral'),(20,8,'Team');
/*!40000 ALTER TABLE `ResourceTypeUnitOfMeasure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResponseState`
--

DROP TABLE IF EXISTS `ResponseState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResponseState` (
  `ResponseStateID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ResponseStateID`),
  CONSTRAINT `fk_ResponseState_ResourceResponse1` FOREIGN KEY (`ResponseStateID`) REFERENCES `ResourceResponse` (`ResponseStateID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResponseState`
--

LOCK TABLES `ResponseState` WRITE;
/*!40000 ALTER TABLE `ResponseState` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResponseState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocialMedia`
--

DROP TABLE IF EXISTS `SocialMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialMedia` (
  `SocialMediaID` int(11) NOT NULL AUTO_INCREMENT,
  `LastRecordedID` varchar(45) NOT NULL,
  PRIMARY KEY (`SocialMediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocialMedia`
--

LOCK TABLES `SocialMedia` WRITE;
/*!40000 ALTER TABLE `SocialMedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `SocialMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransportType`
--

DROP TABLE IF EXISTS `TransportType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransportType` (
  `TransportTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`TransportTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransportType`
--

LOCK TABLES `TransportType` WRITE;
/*!40000 ALTER TABLE `TransportType` DISABLE KEYS */;
INSERT INTO `TransportType` VALUES (1,'Air'),(2,'Ground'),(3,'Water');
/*!40000 ALTER TABLE `TransportType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'helpnow'
--

--
-- Dumping routines for database 'helpnow'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24 15:56:58
