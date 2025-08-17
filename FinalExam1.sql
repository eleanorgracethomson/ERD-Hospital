CREATE DATABASE  IF NOT EXISTS `finalexam1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `finalexam1`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: finalexam1
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `ScheduledTime` datetime NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_appointment_patient_idx` (`Patient_ID`),
  KEY `fk_appointment_doctor1_idx` (`Doctor_ID`),
  CONSTRAINT `fk_appointment_doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (600,10,1,'2016-02-02 09:00:00','Some random pains'),(601,11,1,'2016-02-03 11:01:02','Mornings are tiring'),(602,12,2,'2016-02-03 11:40:02','Can\'t eat'),(603,13,2,'2016-02-04 12:00:00','Not entirely Sure'),(604,14,3,'2016-02-06 01:00:00','Feeling weird'),(605,15,3,'2016-02-06 09:00:00','Back pains'),(606,16,4,'2016-02-07 08:00:02','Fell down on bike'),(607,17,4,'2016-02-07 10:00:01','N/A'),(608,18,5,'2016-02-08 11:00:00','N/A'),(609,19,5,'2016-02-09 11:52:00','N/A'),(610,20,6,'2016-12-02 09:00:00','Regular Check-Up'),(611,21,6,'2016-12-02 09:30:00','N/A'),(612,22,7,'2016-12-02 10:00:00','N/A'),(613,23,7,'2016-12-02 09:00:00','N/A'),(614,24,8,'2016-12-02 09:30:00','Regular Check-Up'),(615,25,8,'2016-12-02 10:00:00','N/A'),(616,26,9,'2016-12-02 12:00:00','Back pains'),(617,27,9,'2016-12-02 13:00:00','Back pains'),(618,28,10,'2016-12-02 09:00:00','N/A'),(619,29,10,'2016-12-02 09:00:00','N/A');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `ID` int(11) NOT NULL,
  `DateDue` datetime NOT NULL,
  `Appointment_ID` int(11) NOT NULL,
  `BillStatus_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_bill_appointment1_idx` (`Appointment_ID`),
  KEY `fk_bill_billstatus1_idx` (`BillStatus_ID`),
  CONSTRAINT `fk_bill_appointment1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_billstatus1` FOREIGN KEY (`BillStatus_ID`) REFERENCES `billstatus` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (500,'2016-03-10 22:00:00',600,301),(501,'2016-03-10 22:00:00',601,301),(502,'2016-03-10 22:00:00',602,301),(503,'2016-03-10 22:00:00',603,301),(504,'2016-03-10 22:00:00',604,301),(505,'2016-03-10 22:00:00',605,301),(506,'2016-03-10 22:00:00',606,301),(507,'2016-03-10 22:00:00',607,301),(508,'2016-03-10 22:00:00',608,301),(509,'2016-03-10 22:00:00',609,301),(510,'2017-05-01 23:00:00',610,302),(511,'2017-05-01 23:00:00',611,302),(512,'2017-05-01 23:00:00',612,302),(513,'2017-05-01 23:00:00',613,302),(514,'2017-05-01 23:00:00',614,302),(515,'2017-05-01 23:00:00',615,302),(516,'2017-05-01 23:00:00',616,302),(517,'2017-05-01 23:00:00',617,302),(518,'2017-05-01 23:00:00',618,302),(519,'2017-05-01 23:00:00',619,302);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_service`
--

DROP TABLE IF EXISTS `bill_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_service` (
  `Bill_ID` int(11) NOT NULL,
  `Service_ID` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Bill_ID`,`Service_ID`),
  KEY `fk_bill_service_bill1_idx` (`Bill_ID`),
  KEY `fk_bill_service_service1_idx` (`Service_ID`),
  CONSTRAINT `fk_bill_service_bill1` FOREIGN KEY (`Bill_ID`) REFERENCES `bill` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_service_service1` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_service`
--

LOCK TABLES `bill_service` WRITE;
/*!40000 ALTER TABLE `bill_service` DISABLE KEYS */;
INSERT INTO `bill_service` VALUES (500,301,500.00),(500,306,25.00),(501,301,500.00),(501,306,25.00),(502,302,100.00),(502,306,25.00),(503,303,500.00),(503,306,25.00),(504,304,100.00),(504,307,75.00),(505,301,500.00),(505,307,75.00),(506,302,100.00),(506,307,75.00),(507,303,500.00),(507,306,25.00),(508,303,500.00),(508,306,25.00),(509,303,500.00),(509,307,75.00),(510,301,500.00),(510,306,25.00),(511,302,100.00),(511,307,75.00),(512,303,500.00),(512,306,25.00),(513,304,100.00),(513,307,75.00),(514,301,500.00),(514,306,25.00),(515,302,100.00),(515,306,25.00),(516,303,500.00),(516,306,25.00),(517,304,100.00),(517,307,75.00),(518,303,500.00),(518,307,75.00),(519,304,100.00),(519,307,75.00);
/*!40000 ALTER TABLE `bill_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billstatus`
--

DROP TABLE IF EXISTS `billstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billstatus` (
  `ID` int(11) NOT NULL,
  `BillStatus` char(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billstatus`
--

LOCK TABLES `billstatus` WRITE;
/*!40000 ALTER TABLE `billstatus` DISABLE KEYS */;
INSERT INTO `billstatus` VALUES (301,'Paid'),(302,'Un-Paid');
/*!40000 ALTER TABLE `billstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `FirstName` char(15) NOT NULL,
  `LastName` char(15) NOT NULL,
  `StreetAddress` char(45) DEFAULT NULL,
  `City` char(30) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `PhoneNumber` char(10) DEFAULT NULL,
  `EmailAddress` char(30) DEFAULT NULL,
  `Salary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Bobby','Mills','1234 loo Dr.','Dallas','TX','75248','7778889999','hello@you.com',40000),(2,'Judge','Judy','9090 Tiller Rd.','Portland','OR','97201','9993332222','goodbye@hi.com',50000),(3,'KING','POPO','8672 Runner Dr.','Austin','TX','73301','1112229898','whatchuwant@bruh.com',100000),(4,'Dylan','Lirs','4729 Downthestreet','San Antonio','TX','78201','2215440909','overthere@who.com',90000),(5,'Bigh','Pool','1122 Luie Dr.','College Station','TX','77840','9084758877','wesuck@tam.com',1000),(6,'Lady','Gaga','123 Clovis Rd','Lubbock','TX','79415','8888881234','xyz@xyz.com',30000),(7,'Mariah','Gaga','123 Frankford Rd','Lubbock','TX','79409','8888881234','xyz@xyz.com',60000),(8,'George','Jungle','1000 Forest Street','Fairbanks','AK','90021','8888881234','xyz@xyz.com',50000),(9,'Peter','Griffin','123 Railroad Rd','Fairbanks','AK','90021','8888881234','xyz@xyz.com',70000),(10,'Stewie','Griffin','123 Chicago Ave','College Station','TX','77840','8888881234','xyz@xyz.com',100000);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `ID` int(11) NOT NULL,
  `CompanyName` char(50) NOT NULL,
  `StreetAddress` char(45) DEFAULT NULL,
  `City` char(30) DEFAULT NULL,
  `State` char(30) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `PhoneNumber` char(10) NOT NULL,
  `EmailAddress` char(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (100,'Blue Cross','9000 Ineedhelp Dr.','Dallas','TX','75248','9119118899','bluecross@wehelp.com'),(101,'Aetna','1111 Wearebetter Rd.','Autin','TX','73301','9887882569','Aetna@woop.com'),(102,'GivingLife','0909 Emptyheart Rd.','San Antonio','TX','78201','6666666666','Darkside@below.com'),(103,'Humana','1212 5th Ave.','New York','NY','90989','111111111','info@humana.com');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `FirstName` char(15) NOT NULL,
  `LastName` char(15) NOT NULL,
  `Insurance_ID` int(11) DEFAULT NULL,
  `PolicyNumber` char(20) DEFAULT NULL,
  `HasMedicare` char(1) NOT NULL,
  `HasMedicaid` char(1) DEFAULT NULL,
  `StreetAddress` char(30) DEFAULT NULL,
  `StreetAddress2` char(30) DEFAULT NULL,
  `City` char(30) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `PhoneNumber` char(10) DEFAULT NULL,
  `EmailAddress` char(30) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_patient_insurance1_idx` (`Insurance_ID`),
  CONSTRAINT `fk_patient_insurance1` FOREIGN KEY (`Insurance_ID`) REFERENCES `insurance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (10,'Guitar','Man',100,'12565','0','1','8897 Water Rd.',NULL,'Dallas','TX','75248',NULL,NULL,'1995-02-02'),(11,'Kirby','Pink',100,'33256','1','1','7777 Triple Woop Dr.',NULL,'Dallas','TX','75248',NULL,NULL,'1980-03-19'),(12,'Captain','Falcon',100,'35988','1','0','8798 Yoyo Wa.',NULL,'Dallas','TX','75248',NULL,NULL,'1977-11-02'),(13,'Mountain','Climbers',100,'66999','0','0','2365 Whereami St.',NULL,'Dallas','TX','75248',NULL,NULL,'1990-06-26'),(14,'Lucario','Poke',100,'22569','1','1','3369 Howdy Dr.',NULL,'Dallas','TX','75248',NULL,NULL,'1991-06-03'),(15,'ZeroSuit','Samus',100,'11457','0','1','2225 lololol St.',NULL,'Dallas','TX','75248',NULL,NULL,'1997-05-15'),(16,'Hero','Hero',100,'66784','0','1','3698 lololol St.',NULL,'Dallas','TX','75248',NULL,NULL,'1999-03-29'),(17,'Pika','CHUCHUUUUUU',100,'22456','1','0','1142 CoolStuff Dr.',NULL,'Dallas','TX','75248',NULL,NULL,'1989-08-09'),(18,'WhoDat','There',100,'11112','1','0','4545 Herewego St.',NULL,'Dallas','TX','75248',NULL,NULL,'1990-12-07'),(19,'Tooe','Oldee',100,'22454','1','0','Mumu St.',NULL,'Dallas','TX','75248',NULL,NULL,'1900-11-01'),(20,'Cheryl','Elton',NULL,'112345678','1','1','123 Hoover Ave',NULL,'Columbus','OH','66666',NULL,NULL,'1991-01-26'),(21,'Bob','Dylan',101,'112345678','1','1','911 School of Rock Ave',NULL,'Beverly Hills','CA','56666',NULL,NULL,'1961-01-26'),(22,'Cheryl','Rawborn',101,'112345677','1','1','123 Memory Lane ave',NULL,'Seattle','WA','46666',NULL,NULL,'1981-01-26'),(23,'Bob','Rawborn',101,'112345677','0','0','123 University ave',NULL,'Lubbock','TX','79409',NULL,NULL,'2001-01-26'),(24,'Elvis','Presley',101,'112345677','0','0','123 Christmas Lane ave',NULL,'Lubbock','TX','79409',NULL,NULL,'1988-01-26'),(25,'Victor','Osborne',101,'112345677','0','0','123 Memory Lane ave',NULL,'Seattle','WA','46666',NULL,NULL,'1981-01-26'),(26,'Bruce','Osborne',NULL,'112345677','1','0','123 Memory Lane ave',NULL,'Houston','TX','77379',NULL,NULL,'1981-01-26'),(27,'Jenniffer','Aniston',101,'112345677','0','1','123 Memory Lane ave',NULL,'Seattle','WA','46666',NULL,NULL,'1981-01-26'),(28,'Victor','Osborne',101,'112345677','0','0','123 Memory Lane ave',NULL,'Seattle','WA','46666',NULL,NULL,'1981-01-26'),(29,'Bratt','Pitty',101,'112345677','0','0','123 Memory Lane ave',NULL,'Seattle','WA','46666',NULL,NULL,'1981-01-26');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `ID` int(11) NOT NULL,
  `Bill_ID` int(11) NOT NULL,
  `AmountPaid` decimal(10,2) NOT NULL,
  `DatePaid` datetime NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Insurance_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_payment_bill1_idx` (`Bill_ID`),
  KEY `fk_payment_patient1_idx` (`Patient_ID`),
  KEY `fk_payment_insurance1_idx` (`Insurance_ID`),
  CONSTRAINT `fk_payment_bill1` FOREIGN KEY (`Bill_ID`) REFERENCES `bill` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_insurance1` FOREIGN KEY (`Insurance_ID`) REFERENCES `insurance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (701,501,600.00,'2016-03-10 20:00:00',11,100),(702,502,90.00,'2016-03-10 20:00:00',12,100),(703,503,100.00,'2016-03-10 20:00:00',13,100),(704,504,500.00,'2016-03-10 20:00:00',14,100),(705,505,600.00,'2016-03-10 20:00:00',15,100),(706,506,750.00,'2016-03-10 20:00:00',16,100),(707,507,630.00,'2016-03-10 20:00:00',17,100),(708,508,90.00,'2016-03-10 20:00:00',18,100),(709,509,110.00,'2016-03-10 20:00:00',19,100),(711,511,600.00,'2017-03-10 20:00:00',21,101),(712,512,90.00,'2017-03-10 20:00:00',22,101),(713,513,100.00,'2017-03-10 20:00:00',23,101),(714,514,500.00,'2017-03-10 20:00:00',24,101),(715,515,600.00,'2017-03-10 20:00:00',25,101),(717,517,630.00,'2017-03-10 20:00:00',27,101),(718,518,90.00,'2017-03-10 20:00:00',28,101),(719,519,110.00,'2017-03-10 20:00:00',29,101);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `ID` int(11) NOT NULL,
  `Name` char(30) NOT NULL,
  `Description` char(45) NOT NULL,
  `CurrentCharge` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (301,'X-Ray','N/A',500.00),(302,'A1C test','Diabetic test',100.00),(303,'X-Ray','N/A',500.00),(304,'Cholestrol test','Blood test',100.00),(305,'WBC Count','N/A',60.00),(306,'Short Visit','Short Visit',25.00),(307,'Extended Visit','Extended Visit',75.00);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 20:38:09
