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
-- Table structure for table `sitzplatz`
--

DROP TABLE IF EXISTS `sitzplatz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitzplatz` (
  `sitzplatzid` int(11) NOT NULL,
  `istFirstClass` tinyint(1) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `fk_flug` int(11) NOT NULL,
  PRIMARY KEY (`fk_flug`,`sitzplatzid`),
  CONSTRAINT `fk_sitzplatz_flug` FOREIGN KEY (`fk_flug`) REFERENCES `flug` (`flugid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitzplatz`
--

LOCK TABLES `sitzplatz` WRITE;
/*!40000 ALTER TABLE `sitzplatz` DISABLE KEYS */;
INSERT INTO `sitzplatz` VALUES (1,1,'ff',5),(0,0,'FF',1042),(0,0,'FF',1058),(0,0,'FF',1059),(0,0,NULL,1066),(0,0,NULL,1225),(0,0,'FF',1874),(0,1,'ff',1878),(0,0,NULL,1955),(0,0,NULL,2134),(0,0,'FF',2824),(0,0,'FF',2909),(0,0,'FF',69196),(0,1,'FF',143136),(0,0,'ff',143214),(0,0,'FF',143242),(0,1,'FF',349584);
/*!40000 ALTER TABLE `sitzplatz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-22 11:06:17
