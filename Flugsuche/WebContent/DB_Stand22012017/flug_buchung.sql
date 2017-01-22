-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: flug
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `buchung`
--

DROP TABLE IF EXISTS `buchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buchung` (
  `buchungid` int(11) NOT NULL AUTO_INCREMENT,
  `zeitstempel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_kunde` int(11) DEFAULT NULL,
  `Zahlungsart` varchar(45) DEFAULT NULL,
  `Zahlungsnummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`buchungid`),
  KEY `fk_buchung_nutzer` (`fk_kunde`),
  CONSTRAINT `fk_buchung_nutzer` FOREIGN KEY (`fk_kunde`) REFERENCES `kunde` (`kundeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buchung`
--

LOCK TABLES `buchung` WRITE;
/*!40000 ALTER TABLE `buchung` DISABLE KEYS */;
INSERT INTO `buchung` VALUES (3,'2017-01-07 15:53:16',1,NULL,NULL),(4,'2017-01-10 22:12:25',1,NULL,NULL),(5,'2017-01-07 15:53:16',1,'ss2','SSS'),(8,'2017-01-15 23:00:00',1,NULL,NULL),(9,'2017-01-15 23:00:00',1,NULL,NULL),(10,'2017-01-15 23:00:00',1,NULL,NULL),(11,'2017-01-15 23:00:00',1,NULL,NULL),(12,'2017-01-15 23:00:00',1,NULL,NULL),(13,'2017-01-15 23:00:00',1,NULL,NULL),(14,'2017-01-15 23:00:00',1,NULL,NULL),(15,'2017-01-15 23:00:00',1,NULL,NULL),(16,'2017-01-15 23:00:00',1,NULL,NULL),(17,'2017-01-15 23:00:00',1,NULL,NULL),(18,'2017-01-15 23:00:00',1,NULL,NULL),(19,'2017-01-15 23:00:00',1,NULL,NULL),(20,'2017-01-15 23:00:00',1,NULL,NULL),(21,'2017-01-15 23:00:00',1,NULL,NULL),(22,'2017-01-15 23:00:00',2,NULL,NULL),(23,'2017-01-15 23:00:00',2,'Lastschrift','DE12345123451234512345_33333333'),(24,'2017-01-15 23:00:00',2,'Lastschrift','DE12345123451234512345_12345678'),(25,'2017-01-15 23:00:00',2,'Kreditkarte','1234567891234_123'),(26,'2017-01-15 23:00:00',2,'Kreditkarte','1234567891234_123'),(27,'2017-01-15 23:00:00',2,'Kreditkarte','1234567891234_222'),(28,'2017-01-15 23:00:00',2,'Lastschrift','DE12345123451234512345_12345678'),(29,'2017-01-15 23:00:00',2,'Lastschrift','DE12345123451234512345_12345678'),(30,'2017-01-15 23:00:00',2,'Lastschrift','DE12345123451234512345_12345678'),(31,'2017-01-15 23:00:00',2,'Kreditkarte','1234567891234_111'),(32,'2017-01-19 23:00:00',1,'Lastschrift','DE12345123451234512345_12345678'),(33,'2017-01-20 00:31:43',1,'Lastschrift','DE12345123451234512345_12345678'),(34,'2017-01-21 15:12:38',1,'Kreditkarte','123456789101112_123'),(35,'2017-01-21 15:21:28',1,'Kreditkarte','123456789101112_123'),(36,'2017-01-21 15:22:34',1,'Kreditkarte','123456789101112_555'),(37,'2017-01-21 15:27:43',1,'Kreditkarte','123456789101112_123'),(38,'2017-01-21 15:30:37',1,'Kreditkarte','123456789101112_124'),(39,'2017-01-21 15:39:01',1,'Kreditkarte','123456789101112_412'),(40,'2017-01-21 15:39:42',1,'Kreditkarte','123456789101112_412'),(41,'2017-01-21 19:05:47',1,'Kreditkarte','12345678912200_444'),(42,'2017-01-21 19:51:50',1,'Lastschrift','DE12345123451234512345_12345678'),(43,'2017-01-22 02:52:00',1,'Lastschrift','DE12345123451234512345_12345784'),(44,'2017-01-22 02:54:34',1,'Lastschrift','DE12345123451234512345_12345784'),(45,'2017-01-22 02:55:26',1,'Lastschrift','DE12345123451234512345_12345678'),(46,'2017-01-22 03:29:59',1,'Kreditkarte','1234567891011_123'),(47,'2017-01-22 03:31:59',1,'Lastschrift','DE12345123451234512345_12345789');
/*!40000 ALTER TABLE `buchung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-22 11:06:16
