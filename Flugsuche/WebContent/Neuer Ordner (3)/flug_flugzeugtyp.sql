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
-- Table structure for table `flugzeugtyp`
--

DROP TABLE IF EXISTS `flugzeugtyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flugzeugtyp` (
  `flugzeugtypid` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(255) DEFAULT NULL,
  `anzahlSitzplaetzeFirstClass` int(11) DEFAULT NULL,
  `anzahlSitzplaetzeEconomy` int(11) DEFAULT NULL,
  `fk_flugzeuggesellschaft` int(11) DEFAULT NULL,
  PRIMARY KEY (`flugzeugtypid`),
  KEY `fk_flugzeugtyp_flugzeuggesellschaft` (`fk_flugzeuggesellschaft`),
  CONSTRAINT `fk_flugzeugtyp_flugzeuggesellschaft` FOREIGN KEY (`fk_flugzeuggesellschaft`) REFERENCES `fluggesellschaft` (`fluggesellschaftid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flugzeugtyp`
--

LOCK TABLES `flugzeugtyp` WRITE;
/*!40000 ALTER TABLE `flugzeugtyp` DISABLE KEYS */;
INSERT INTO `flugzeugtyp` VALUES (30,'A310',10,30,1),(31,'A310',10,30,2),(32,'A310',10,30,3),(33,'A310',10,30,4),(34,'A310',10,30,5),(35,'A310',10,30,6),(36,'A310',10,30,7),(37,'A310',10,30,8),(38,'A310',10,30,9),(39,'A310',10,30,10),(40,'A310',10,30,11),(41,'s',10,30,12),(42,'s',10,30,13),(43,'s',4,5,14),(44,'f',44,43,15);
/*!40000 ALTER TABLE `flugzeugtyp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-23  0:54:33
