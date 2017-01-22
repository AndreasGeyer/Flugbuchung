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
-- Table structure for table `flughafen`
--

DROP TABLE IF EXISTS `flughafen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flughafen` (
  `flughafenid` int(11) NOT NULL AUTO_INCREMENT,
  `ort` varchar(255) DEFAULT NULL,
  `kuerzel` varchar(5) DEFAULT NULL,
  `zeitzone` decimal(3,1) DEFAULT NULL,
  `land` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flughafenid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flughafen`
--

LOCK TABLES `flughafen` WRITE;
/*!40000 ALTER TABLE `flughafen` DISABLE KEYS */;
INSERT INTO `flughafen` VALUES (1,'Muenchen','MUC',1.0,'Deutschland'),(2,'Paris','HBU',2.0,'Frankreich'),(3,'Madrid','MAD',2.0,'Spanien'),(4,'London','LON',0.0,'Großbritannien'),(5,'New York','JFK',-5.0,'USA'),(6,'Moskau','DME',-3.0,'Russland'),(7,'Wien','MOZ',1.0,'Österreich'),(8,'Dubai','DXB',4.0,'Vereinigte Emirate'),(9,'Los Angeles','LHR',-8.0,'USA'),(10,'Mexico City','MEX',-6.0,'Mexiko'),(11,'Buones Aires','BUA',-3.0,'Argentinien'),(12,'Sau Paulo','GRU',-4.0,'Brasilien'),(13,'Rom','FCO',1.0,'Italien'),(14,'Sidney','SYD',11.0,'Australien'),(15,'Toronto','YYZ',-5.0,'Kanada'),(16,'Amsterdam','AMS',1.0,'Niederlande'),(17,'Antalya','AYT',2.0,'Türkei'),(18,'Atlanta','ATL',-5.0,'USA'),(19,'Bangkok','BKK',7.0,'Thailand'),(20,'Barcelona','BCN',2.0,'Spanien'),(21,'Boston','BOS',-6.0,'USA'),(22,'Charlotte','CLT',-6.0,'USA'),(23,'Chendgdu','CTU',7.0,'China'),(24,'Chicagp','ORD',-6.0,'USA'),(25,'Dallas','DFW',-6.0,'USA'),(26,'Chongquing','CKG',8.0,'China'),(27,'Denver','DEN',-6.0,'USA'),(28,'Detroit','DTW',-7.0,'USA'),(29,'Frankfurt am Main','FRA',1.0,'Italien'),(30,'Guangzhou','CAN',8.0,'China'),(31,'Hongkong','HKG',8.0,'Hongkong'),(32,'Houston','IAH',-6.0,'USA'),(33,'Istanbul','IST',2.0,'Zürkei'),(34,'Jakatar','CGK',7.0,'Indonesien'),(35,'Juala Lumpur','KUL',8.0,'Malaysia'),(36,'Kunkming','KMG',8.0,'China'),(37,'Las Vegas','LAS',-8.0,'USA'),(38,'Manila','MNL',8.0,'Philipinen'),(39,'Melbourne','MEL',11.0,'Australien'),(40,'Miami','MIA',-6.0,'USA'),(41,'Minneapolis','MSP',-6.0,'USA'),(42,'Mumbai','BOM',5.5,'Indien'),(43,'Neu Dheli','DEL',5.5,'Indien'),(44,'Orlando','MCO',-6.0,'USA'),(45,'Peking','PEK',8.0,'China'),(46,'Philadelphia','PHL',-7.0,'USA'),(47,'Phoenix','PHX',-5.0,'USA'),(48,'San Francisco','SFO',-8.0,'USA'),(49,'Seattle','SEA',-7.0,'USA'),(50,'Seoul','ICN',9.0,'Südkorea'),(51,'Shanghai','SHA',8.0,'China'),(52,'Singapur','SIN',8.0,'Singapur'),(53,'Tokyo','HND',9.0,'Japan'),(54,'Zürich','ZRH',1.0,'Schweiz');
/*!40000 ALTER TABLE `flughafen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-22 11:06:18
