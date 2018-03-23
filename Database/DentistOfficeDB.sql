-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: DentistOfficeDB
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `Appointments`
--

DROP TABLE IF EXISTS `Appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointments` (
  `apptDateTime` varchar(20) NOT NULL,
  `patId` varchar(10) NOT NULL,
  `dentId` varchar(10) DEFAULT NULL,
  `procCode` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointments`
--

LOCK TABLES `Appointments` WRITE;
/*!40000 ALTER TABLE `Appointments` DISABLE KEYS */;
INSERT INTO `Appointments` VALUES ('May 1, 2018, 9am','A900','D201','P321'),('May 2, 2018, 1pm','A901','D201','P114'),('May 1, 2018, 1pm','A902','D202','P114'),('May 1, 2018, 9am','A903','D203','P114'),('May 2, 2018, 11am','A904','D203','P114'),('May 1, 2018, 3pm','A905','D203','P650'),('May 3, 2018, 1pm','A906','D201','P790'),('May 3, 2018, 4pm','A907','D202','P122'),('May 3, 2018, 11am','A908','D202','P122'),('May 3, 2018, 3pm','A909','D201','P910'),('May 1, 2018, 11am','A910','D202','P114');
/*!40000 ALTER TABLE `Appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dentists`
--

DROP TABLE IF EXISTS `Dentists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dentists` (
  `id` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `office` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dentists`
--

LOCK TABLES `Dentists` WRITE;
/*!40000 ALTER TABLE `Dentists` DISABLE KEYS */;
INSERT INTO `Dentists` VALUES ('D201','frank','Frank','Martin','fm@gmail.com','539'),('D202','12345','Susan','Cassidy','scass@yahoo.com','540'),('D203','99999','Jerry','York','jyork@hotmail.com','550'),('D204','9999','Wayne','Patterson','wpatt@gmail.com','552');
/*!40000 ALTER TABLE `Dentists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `patId` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `insCo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES ('A900','1234','Jimmy','Hawkins','Marietta','jhawk@yahoo.com','Cigna'),('A901','9999','Bill','Smith','Acworth','bsmith@gmail.com','Aetna'),('A902','8888','Teri','Smart','Atlanta','tsm@yahoo.com','Blue Cross'),('A903','7777','James','Roy','Acworth','jamesroy@yahoo.com\n','Blue Cross'),('A904','5555','Mary','Wilson','Roswell','mwil@yahoo.com','Cigna'),('A905','1111','Faith','Adams','Roswell','faith@god.com','Aetna'),('A906','1111','Jerry','Jones','Dallas','jj@cowboys.com','Cigna'),('A907','9090','Carrie','Slater','Marietta','cstl@gmail.com','Blue Cross'),('A908','9898','Sara','Jefferson','Dallas','sjeff@gmail.com','Aetna'),('A909','1234','Debbie','Johnson','Marietta','djohn@yahoo.com','Cigna'),('A910','1111','Martha','Stewart','Marietta','mstw@gmail.com','Aetna'),('A911','4555','John','Franco','Kennesaw','jfran@hotmail.com','Cigna');
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procedures`
--

DROP TABLE IF EXISTS `Procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Procedures` (
  `procCode` varchar(4) NOT NULL,
  `procName` varchar(30) NOT NULL,
  `procDesc` varchar(60) NOT NULL,
  `cost` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`procCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procedures`
--

LOCK TABLES `Procedures` WRITE;
/*!40000 ALTER TABLE `Procedures` DISABLE KEYS */;
INSERT INTO `Procedures` VALUES ('P114','Cleaning/Exam','Teeth Cleaning and a Dentist Exam',99.99),('P119','Xrays','Take xrays of all teeth',320.00),('P122','Whitening','Teeth Whitening',129.99),('P321','Cavity','Fill Cavity',319.00),('P650','Top Dentures','Add top dentures',1950.00),('P660','Bottom Dentures','Add bottom dentures',1950.00),('P780','Crown','Putting a crown on a bad tooth',795.00),('P790','Root Canal','Replace a bad tooth with a new tooth',1019.00);
/*!40000 ALTER TABLE `Procedures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20 10:08:46
