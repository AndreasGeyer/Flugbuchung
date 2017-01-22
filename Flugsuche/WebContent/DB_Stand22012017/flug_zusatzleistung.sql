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
-- Table structure for table `zusatzleistung`
--

DROP TABLE IF EXISTS `zusatzleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zusatzleistung` (
  `zusatzleistungid` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(255) DEFAULT NULL,
  `beschreibung` varchar(5000) DEFAULT NULL,
  `preis` decimal(10,2) DEFAULT NULL,
  `fk_flugzeugtyp` int(11) DEFAULT NULL,
  `Art` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`zusatzleistungid`),
  KEY `fk_zusatzleistung_flugzeugtyp` (`fk_flugzeugtyp`),
  CONSTRAINT `fk_zusatzleistung_flugzeugtyp` FOREIGN KEY (`fk_flugzeugtyp`) REFERENCES `flugzeugtyp` (`flugzeugtypid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zusatzleistung`
--

LOCK TABLES `zusatzleistung` WRITE;
/*!40000 ALTER TABLE `zusatzleistung` DISABLE KEYS */;
INSERT INTO `zusatzleistung` VALUES (1,'Reiserücktrittsversicherung','Stornierung;Gepäckverlust; Krankheit',25.02,30,'Versicherung'),(2,'Weißwurst','Mittag;Bayrischerns beste Tradition!',3.99,30,'Essen'),(3,'Vegetarischischer Salat','Mittag; Fleischlos aber trotzdem lecker',8.99,30,'Essen'),(4,'Tiramisu','Dessert;Zuckersüße Speise!',4.99,30,'Essen'),(5,'Wein','Getränk;Für den Genießer!',12.99,31,'Essen'),(6,'Cola','Getränk;Für den Genießer!',2.00,32,'Essen'),(7,'Cola','Getränk;Für den Genießer!',2.00,33,'Essen'),(8,'Cola','Getränk;Für den Genießer!',5.00,35,'Essen'),(9,'Cola','Getränk;Für den Genießer!',1.00,36,'Essen'),(10,'Cola','Getränk;Für den Genießer!',1.00,37,'Essen'),(11,'Cola','Getränk;Für den Genießer!',2.00,38,'Essen'),(12,'Cola','Getränk;Für den Genießer!',3.00,39,'Essen'),(13,'Cola','Getränk;Für den Genießer!',4.00,40,'Essen'),(14,'Cola','Getränk;Für den Genießer!',1.00,41,'Essen'),(15,'Cola','Getränk;Für den Genießer!',2.00,42,'Essen'),(16,'Cola','Getränk;Für den Genießer!',2.50,43,'Essen'),(17,'Cola','Getränk;Für den Genießer!',3.00,44,'Essen'),(18,'Cola','Reinigung;Ldsfsdfsdfsdfsdfsdf',1.75,34,'Essen'),(19,'Premium Verischerung','Uni;Last;Mist;Probleme;',45.08,31,'Versicherung');
/*!40000 ALTER TABLE `zusatzleistung` ENABLE KEYS */;
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
