CREATE DATABASE  IF NOT EXISTS `db_sales` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_sales`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_sales
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Temporary view structure for view `activity_pricing_view`
--

DROP TABLE IF EXISTS `activity_pricing_view`;
/*!50001 DROP VIEW IF EXISTS `activity_pricing_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activity_pricing_view` AS SELECT 
 1 AS `pricing_id`,
 1 AS `package_scheme_id`,
 1 AS `package_scheme_name`,
 1 AS `package_name`,
 1 AS `package_type_name`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `base_price`,
 1 AS `sales_price`,
 1 AS `supplier_id`,
 1 AS `minimum_participant`,
 1 AS `maximum_participant`,
 1 AS `itenerary_collection_id`,
 1 AS `description`,
 1 AS `valid_date_from`,
 1 AS `valid_date_to`,
 1 AS `number_days`,
 1 AS `number_night`,
 1 AS `special_base_price`,
 1 AS `special_sales_prize`,
 1 AS `special_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `timezone` int(11) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`,`country_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  KEY `fk_city_country1_idx` (`country_id`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'denpasar','dps',8,1),(2,'uluwatu',NULL,8,1),(3,'pecatu',NULL,8,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id_UNIQUE` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'indonesia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `star_rating` int(11) NOT NULL,
  `tourism_place_id` int(11) NOT NULL,
  KEY `fk_hotel_tourism_place1_idx` (`tourism_place_id`),
  CONSTRAINT `fk_hotel_tourism_place1` FOREIGN KEY (`tourism_place_id`) REFERENCES `tourism_place` (`tourism_place_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (3,2),(4,3);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room`
--

DROP TABLE IF EXISTS `hotel_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_room` (
  `room_id` int(11) NOT NULL,
  `number_room` int(11) DEFAULT NULL,
  `room_type_id` int(11) NOT NULL,
  `tourism_place_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`,`room_type_id`,`tourism_place_id`),
  KEY `fk_hotel_room_hotel_room_type1_idx` (`room_type_id`),
  KEY `fk_hotel_room_hotel1_idx` (`tourism_place_id`),
  CONSTRAINT `fk_hotel_room_hotel1` FOREIGN KEY (`tourism_place_id`) REFERENCES `hotel` (`tourism_place_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_room_hotel_room_type1` FOREIGN KEY (`room_type_id`) REFERENCES `hotel_room_type` (`room_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room`
--

LOCK TABLES `hotel_room` WRITE;
/*!40000 ALTER TABLE `hotel_room` DISABLE KEYS */;
INSERT INTO `hotel_room` VALUES (1,123,3,2),(2,12,1,2),(3,11,2,2),(4,23,5,3),(5,20,4,3);
/*!40000 ALTER TABLE `hotel_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room_type`
--

DROP TABLE IF EXISTS `hotel_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_room_type` (
  `room_type_id` int(11) NOT NULL,
  `room_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room_type`
--

LOCK TABLES `hotel_room_type` WRITE;
/*!40000 ALTER TABLE `hotel_room_type` DISABLE KEYS */;
INSERT INTO `hotel_room_type` VALUES (1,'presidential suite'),(2,'vvip'),(3,'economi'),(4,'family suite'),(5,'private room');
/*!40000 ALTER TABLE `hotel_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_stay_detail`
--

DROP TABLE IF EXISTS `hotel_stay_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_stay_detail` (
  `stay_detail_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` varchar(45) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `package_scheme_id` int(11) NOT NULL,
  PRIMARY KEY (`stay_detail_id`,`room_id`),
  KEY `fk_hotel_stay_detail_hotel_room1_idx` (`room_id`),
  KEY `fk_hotel_stay_detail_package_scheme1_idx` (`package_scheme_id`),
  CONSTRAINT `fk_hotel_stay_detail_hotel_room1` FOREIGN KEY (`room_id`) REFERENCES `hotel_room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_stay_detail_package_scheme1` FOREIGN KEY (`package_scheme_id`) REFERENCES `package_scheme` (`package_scheme_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_stay_detail`
--

LOCK TABLES `hotel_stay_detail` WRITE;
/*!40000 ALTER TABLE `hotel_stay_detail` DISABLE KEYS */;
INSERT INTO `hotel_stay_detail` VALUES (1,'2015-02-05 00:00:00','2015-02-09',3,1),(2,'2015-02-05 00:00:00','2015-02-09',2,1),(3,'2015-02-05 00:00:00','2015-02-09',1,1),(4,'2015-02-05 00:00:00','2015-02-09',4,2),(5,'2015-02-05 00:00:00','2015-02-09',5,2);
/*!40000 ALTER TABLE `hotel_stay_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hotel_view`
--

DROP TABLE IF EXISTS `hotel_view`;
/*!50001 DROP VIEW IF EXISTS `hotel_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `hotel_view` AS SELECT 
 1 AS `number_room`,
 1 AS `room_type_id`,
 1 AS `room_id`,
 1 AS `room_type`,
 1 AS `star_rating`,
 1 AS `place_name`,
 1 AS `address`,
 1 AS `city_id`,
 1 AS `city_name`,
 1 AS `timezone`,
 1 AS `alias`,
 1 AS `country_id`,
 1 AS `country_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `itenerary`
--

DROP TABLE IF EXISTS `itenerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary` (
  `itenerary_id` int(11) NOT NULL AUTO_INCREMENT,
  `itenerary_name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`itenerary_id`),
  UNIQUE KEY `itenary_id_UNIQUE` (`itenerary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary`
--

LOCK TABLES `itenerary` WRITE;
/*!40000 ALTER TABLE `itenerary` DISABLE KEYS */;
INSERT INTO `itenerary` VALUES (1,'dijemput dihotel','asdsad'),(2,'balik ke hotel','sadasf'),(3,'makan dihotel','asf'),(4,'istirahat dihotel','safsa'),(5,'mandi pagi','sadasf');
/*!40000 ALTER TABLE `itenerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenerary_collection`
--

DROP TABLE IF EXISTS `itenerary_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary_collection` (
  `itenerary_collection_id` int(11) NOT NULL,
  `collection_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itenerary_collection_id`),
  UNIQUE KEY `collection_name_UNIQUE` (`collection_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary_collection`
--

LOCK TABLES `itenerary_collection` WRITE;
/*!40000 ALTER TABLE `itenerary_collection` DISABLE KEYS */;
INSERT INTO `itenerary_collection` VALUES (1,'kuta itenerary'),(2,'kuta itenerary2');
/*!40000 ALTER TABLE `itenerary_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenerary_detail`
--

DROP TABLE IF EXISTS `itenerary_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary_detail` (
  `itenerary_id` int(11) NOT NULL,
  `itenerary_collection_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `tourism_place_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`itenerary_id`,`itenerary_collection_id`,`sequence`,`day`),
  KEY `fk_itenary_detail_itenary1_idx` (`itenerary_id`),
  KEY `fk_itenary_detail_itenary_collection1_idx` (`itenerary_collection_id`),
  KEY `fk_itenary_detail_tourism_place1_idx` (`tourism_place_id`),
  CONSTRAINT `fk_itenary_detail_itenary1` FOREIGN KEY (`itenerary_id`) REFERENCES `itenerary` (`itenerary_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itenary_detail_itenary_collection1` FOREIGN KEY (`itenerary_collection_id`) REFERENCES `itenerary_collection` (`itenerary_collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itenary_detail_tourism_place1` FOREIGN KEY (`tourism_place_id`) REFERENCES `tourism_place` (`tourism_place_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary_detail`
--

LOCK TABLES `itenerary_detail` WRITE;
/*!40000 ALTER TABLE `itenerary_detail` DISABLE KEYS */;
INSERT INTO `itenerary_detail` VALUES (1,1,1,1,2,'2015-02-02 00:00:00','2015-02-02 00:00:00'),(2,1,2,1,2,'2015-02-02 00:00:00','2015-02-02 00:00:00'),(3,1,1,2,2,'2015-02-02 00:00:00','2015-02-02 00:00:00'),(4,1,2,2,1,'2015-02-02 00:00:00','2015-02-02 00:00:00');
/*!40000 ALTER TABLE `itenerary_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `itenerary_view`
--

DROP TABLE IF EXISTS `itenerary_view`;
/*!50001 DROP VIEW IF EXISTS `itenerary_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itenerary_view` AS SELECT 
 1 AS `itenerary_id`,
 1 AS `itenerary_collection_id`,
 1 AS `sequence`,
 1 AS `day`,
 1 AS `itenerary_name`,
 1 AS `description`,
 1 AS `tourism_place_id`,
 1 AS `place_name`,
 1 AS `city_id`,
 1 AS `city_name`,
 1 AS `alias`,
 1 AS `timezone`,
 1 AS `country_id`,
 1 AS `country_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(150) NOT NULL,
  `description` text,
  `package_type_id` int(11) NOT NULL,
  PRIMARY KEY (`package_id`),
  UNIQUE KEY `package_id_UNIQUE` (`package_id`),
  UNIQUE KEY `package_name_UNIQUE` (`package_name`),
  KEY `fk_package_package_type1_idx` (`package_type_id`),
  CONSTRAINT `fk_package_package_type1` FOREIGN KEY (`package_type_id`) REFERENCES `package_type` (`package_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'Paket tour Bali 3 Hari 2 Malam','Paket tour Bali 3 Hari 2 Malam',1),(2,' Paket Diving di Bali',' Paket Diving di Bali',2);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_pricing`
--

DROP TABLE IF EXISTS `package_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_pricing` (
  `pricing_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `minimum_participant` int(11) NOT NULL DEFAULT '1',
  `maximum_participant` int(11) NOT NULL DEFAULT '1',
  `itenerary_collection_id` int(11) DEFAULT NULL,
  `description` text,
  `valid_date_from` datetime NOT NULL,
  `valid_date_to` datetime NOT NULL,
  `package_scheme_id` int(11) NOT NULL,
  `number_days` int(11) DEFAULT NULL,
  `number_night` int(11) DEFAULT NULL,
  PRIMARY KEY (`pricing_id`,`package_scheme_id`),
  UNIQUE KEY `pricing_id_UNIQUE` (`pricing_id`),
  KEY `fk_pricing_supplier1_idx` (`supplier_id`),
  KEY `fk_pricing_itenary_collection1_idx` (`itenerary_collection_id`),
  KEY `fk_package_pricing_package_scheme1_idx` (`package_scheme_id`),
  CONSTRAINT `fk_package_pricing_package_scheme1` FOREIGN KEY (`package_scheme_id`) REFERENCES `package_scheme` (`package_scheme_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_itenary_collection1` FOREIGN KEY (`itenerary_collection_id`) REFERENCES `itenerary_collection` (`itenerary_collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_pricing`
--

LOCK TABLES `package_pricing` WRITE;
/*!40000 ALTER TABLE `package_pricing` DISABLE KEYS */;
INSERT INTO `package_pricing` VALUES (1,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,1,2,4,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',1,3,2),(2,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,2,2,4,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',2,3,2),(3,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,1,3,8,2,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',1,3,2),(4,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,2,3,8,2,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',2,3,2),(5,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,1,5,10,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',1,3,2),(6,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,2,5,10,2,'  ','2014-12-05 00:00:00','2015-02-05 00:00:00',2,3,2),(7,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,1,1,1,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',1,3,2),(8,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,2,1,1,2,'  ','2014-12-05 00:00:00','2015-02-05 00:00:00',2,3,2),(9,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,1,1,1,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',1,3,2),(10,'2015-02-05 00:00:00','2015-02-09 00:00:00',1000000.00,900000.00,2,1,1,2,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',2,3,2),(11,'2015-02-05 00:00:00','2015-02-06 00:00:00',1000000.00,900000.00,1,1,1,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',4,1,0),(12,'2015-02-05 00:00:00','2015-02-06 00:00:00',1000000.00,900000.00,2,1,1,2,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',5,1,0),(13,'2015-02-05 00:00:00','2015-02-06 00:00:00',1000000.00,900000.00,1,1,1,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',3,1,0),(14,'2015-02-05 00:00:00','2015-02-06 00:00:00',1000000.00,900000.00,2,1,1,2,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',4,1,0),(15,'2015-02-05 00:00:00','2015-02-06 00:00:00',1000000.00,900000.00,1,1,1,1,' ','2014-12-05 00:00:00','2015-02-05 00:00:00',5,1,0);
/*!40000 ALTER TABLE `package_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_scheme`
--

DROP TABLE IF EXISTS `package_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_scheme` (
  `package_scheme_id` int(11) NOT NULL,
  `package_scheme_name` varchar(150) DEFAULT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`package_scheme_id`,`package_id`),
  KEY `fk_package_scheme_package1_idx` (`package_id`),
  CONSTRAINT `fk_package_scheme_package1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_scheme`
--

LOCK TABLES `package_scheme` WRITE;
/*!40000 ALTER TABLE `package_scheme` DISABLE KEYS */;
INSERT INTO `package_scheme` VALUES (1,'tour bali bintang 3',1),(2,'tour bali bintang 4',1),(3,'paket activity a',2),(4,'paket activity b',2),(5,'paket activity c',2);
/*!40000 ALTER TABLE `package_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_type` (
  `package_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_type_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`package_type_id`),
  UNIQUE KEY `package_type_id_UNIQUE` (`package_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'tour'),(2,'activity');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_price_date`
--

DROP TABLE IF EXISTS `special_price_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_price_date` (
  `pricing_id` int(11) NOT NULL,
  `special_base_price` decimal(10,2) NOT NULL,
  `special_sales_prize` decimal(10,2) NOT NULL,
  `special_date` datetime NOT NULL,
  PRIMARY KEY (`pricing_id`,`special_date`),
  KEY `fk_special_price_date_pricing1_idx` (`pricing_id`),
  CONSTRAINT `fk_special_price_date_pricing1` FOREIGN KEY (`pricing_id`) REFERENCES `package_pricing` (`pricing_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_price_date`
--

LOCK TABLES `special_price_date` WRITE;
/*!40000 ALTER TABLE `special_price_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_price_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`,`city_id`),
  KEY `fk_supplier_city1_idx` (`city_id`),
  CONSTRAINT `fk_supplier_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'sup01','coba',1),(2,'sup02','coba2',2);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tour_pricing_view`
--

DROP TABLE IF EXISTS `tour_pricing_view`;
/*!50001 DROP VIEW IF EXISTS `tour_pricing_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tour_pricing_view` AS SELECT 
 1 AS `pricing_id`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `base_price`,
 1 AS `sales_price`,
 1 AS `supplier_id`,
 1 AS `minimum_participant`,
 1 AS `maximum_participant`,
 1 AS `itenerary_collection_id`,
 1 AS `description`,
 1 AS `valid_date_from`,
 1 AS `valid_date_to`,
 1 AS `number_days`,
 1 AS `number_night`,
 1 AS `package_scheme_name`,
 1 AS `package_id`,
 1 AS `package_name`,
 1 AS `package_type_id`,
 1 AS `package_type_name`,
 1 AS `star_rating`,
 1 AS `place_name`,
 1 AS `address`,
 1 AS `city_name`,
 1 AS `country_name`,
 1 AS `room_type`,
 1 AS `start_date_room`,
 1 AS `end_date_room`,
 1 AS `special_base_price`,
 1 AS `special_sales_prize`,
 1 AS `special_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tourism_place`
--

DROP TABLE IF EXISTS `tourism_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourism_place` (
  `tourism_place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(45) NOT NULL,
  `city_id` int(11) NOT NULL,
  `place_type_id` int(11) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`tourism_place_id`,`place_type_id`),
  UNIQUE KEY `tourism_place_id_UNIQUE` (`tourism_place_id`),
  KEY `fk_tourism_place_city1_idx` (`city_id`),
  KEY `fk_tourism_place_tourism_place_type1_idx` (`place_type_id`),
  CONSTRAINT `fk_tourism_place_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tourism_place_tourism_place_type1` FOREIGN KEY (`place_type_id`) REFERENCES `tourism_place_type` (`place_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourism_place`
--

LOCK TABLES `tourism_place` WRITE;
/*!40000 ALTER TABLE `tourism_place` DISABLE KEYS */;
INSERT INTO `tourism_place` VALUES (1,'kuta beach',1,2,'sdsar'),(2,'kuta beach hotel',1,2,'sdsar'),(3,'grand kuta beach hotel',1,2,'dfdsf');
/*!40000 ALTER TABLE `tourism_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourism_place_type`
--

DROP TABLE IF EXISTS `tourism_place_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourism_place_type` (
  `place_type_id` int(11) NOT NULL,
  `place_type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`place_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourism_place_type`
--

LOCK TABLES `tourism_place_type` WRITE;
/*!40000 ALTER TABLE `tourism_place_type` DISABLE KEYS */;
INSERT INTO `tourism_place_type` VALUES (1,'hotel'),(2,'beach'),(3,'museum'),(4,'temple');
/*!40000 ALTER TABLE `tourism_place_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_sales'
--

--
-- Final view structure for view `activity_pricing_view`
--

/*!50001 DROP VIEW IF EXISTS `activity_pricing_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.2.2` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_pricing_view` AS select `pp`.`pricing_id` AS `pricing_id`,`ps`.`package_scheme_id` AS `package_scheme_id`,`ps`.`package_scheme_name` AS `package_scheme_name`,`pkg`.`package_name` AS `package_name`,`pt`.`package_type_name` AS `package_type_name`,`pp`.`start_time` AS `start_time`,`pp`.`end_time` AS `end_time`,`pp`.`base_price` AS `base_price`,`pp`.`sales_price` AS `sales_price`,`pp`.`supplier_id` AS `supplier_id`,`pp`.`minimum_participant` AS `minimum_participant`,`pp`.`maximum_participant` AS `maximum_participant`,`pp`.`itenerary_collection_id` AS `itenerary_collection_id`,`pp`.`description` AS `description`,`pp`.`valid_date_from` AS `valid_date_from`,`pp`.`valid_date_to` AS `valid_date_to`,`pp`.`number_days` AS `number_days`,`pp`.`number_night` AS `number_night`,`spd`.`special_base_price` AS `special_base_price`,`spd`.`special_sales_prize` AS `special_sales_prize`,`spd`.`special_date` AS `special_date` from ((((`package_scheme` `ps` left join `package` `pkg` on((`ps`.`package_id` = `pkg`.`package_id`))) left join `package_type` `pt` on((`pkg`.`package_type_id` = `pt`.`package_type_id`))) left join `package_pricing` `pp` on((`ps`.`package_scheme_id` = `pp`.`package_scheme_id`))) left join `special_price_date` `spd` on((`pp`.`pricing_id` = `spd`.`pricing_id`))) where (`pt`.`package_type_name` = 'activity') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hotel_view`
--

/*!50001 DROP VIEW IF EXISTS `hotel_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.2.2` SQL SECURITY DEFINER */
/*!50001 VIEW `hotel_view` AS select `hr`.`number_room` AS `number_room`,`hrt`.`room_type_id` AS `room_type_id`,`hr`.`room_id` AS `room_id`,`hrt`.`room_type` AS `room_type`,`ht`.`star_rating` AS `star_rating`,`tp`.`place_name` AS `place_name`,`tp`.`address` AS `address`,`tp`.`city_id` AS `city_id`,`ct`.`city_name` AS `city_name`,`ct`.`timezone` AS `timezone`,`ct`.`alias` AS `alias`,`ct`.`country_id` AS `country_id`,`cnt`.`country_name` AS `country_name` from (((((`hotel_room` `hr` left join `hotel_room_type` `hrt` on((`hr`.`room_type_id` = `hrt`.`room_type_id`))) left join `hotel` `ht` on((`hr`.`tourism_place_id` = `ht`.`tourism_place_id`))) left join `tourism_place` `tp` on((`ht`.`tourism_place_id` = `tp`.`tourism_place_id`))) left join `city` `ct` on((`tp`.`city_id` = `ct`.`city_id`))) left join `country` `cnt` on((`ct`.`country_id` = `cnt`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `itenerary_view`
--

/*!50001 DROP VIEW IF EXISTS `itenerary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.2.2` SQL SECURITY DEFINER */
/*!50001 VIEW `itenerary_view` AS select `itd`.`itenerary_id` AS `itenerary_id`,`itc`.`itenerary_collection_id` AS `itenerary_collection_id`,`itd`.`sequence` AS `sequence`,`itd`.`day` AS `day`,`itn`.`itenerary_name` AS `itenerary_name`,`itn`.`description` AS `description`,`itd`.`tourism_place_id` AS `tourism_place_id`,`tpl`.`place_name` AS `place_name`,`tpl`.`city_id` AS `city_id`,`ct`.`city_name` AS `city_name`,`ct`.`alias` AS `alias`,`ct`.`timezone` AS `timezone`,`ct`.`country_id` AS `country_id`,`cnt`.`country_name` AS `country_name` from (((((`itenerary_detail` `itd` left join `itenerary` `itn` on((`itd`.`itenerary_id` = `itn`.`itenerary_id`))) left join `itenerary_collection` `itc` on((`itd`.`itenerary_collection_id` = `itc`.`itenerary_collection_id`))) left join `tourism_place` `tpl` on((`itd`.`tourism_place_id` = `tpl`.`tourism_place_id`))) left join `city` `ct` on((`tpl`.`city_id` = `ct`.`city_id`))) left join `country` `cnt` on((`ct`.`country_id` = `cnt`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tour_pricing_view`
--

/*!50001 DROP VIEW IF EXISTS `tour_pricing_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.2.2` SQL SECURITY DEFINER */
/*!50001 VIEW `tour_pricing_view` AS select `pp`.`pricing_id` AS `pricing_id`,`pp`.`start_time` AS `start_time`,`pp`.`end_time` AS `end_time`,`pp`.`base_price` AS `base_price`,`pp`.`sales_price` AS `sales_price`,`pp`.`supplier_id` AS `supplier_id`,`pp`.`minimum_participant` AS `minimum_participant`,`pp`.`maximum_participant` AS `maximum_participant`,`pp`.`itenerary_collection_id` AS `itenerary_collection_id`,`pp`.`description` AS `description`,`pp`.`valid_date_from` AS `valid_date_from`,`pp`.`valid_date_to` AS `valid_date_to`,`pp`.`number_days` AS `number_days`,`pp`.`number_night` AS `number_night`,`ps`.`package_scheme_name` AS `package_scheme_name`,`ps`.`package_id` AS `package_id`,`pkg`.`package_name` AS `package_name`,`pkg`.`package_type_id` AS `package_type_id`,`pty`.`package_type_name` AS `package_type_name`,`hv`.`star_rating` AS `star_rating`,`hv`.`place_name` AS `place_name`,`hv`.`address` AS `address`,`hv`.`city_name` AS `city_name`,`hv`.`country_name` AS `country_name`,`hv`.`room_type` AS `room_type`,`htd`.`start_date` AS `start_date_room`,`htd`.`end_date` AS `end_date_room`,`spd`.`special_base_price` AS `special_base_price`,`spd`.`special_sales_prize` AS `special_sales_prize`,`spd`.`special_date` AS `special_date` from ((((((`hotel_stay_detail` `htd` left join `hotel_view` `hv` on((`htd`.`room_id` = `hv`.`room_id`))) left join `package_scheme` `ps` on((`htd`.`package_scheme_id` = `ps`.`package_scheme_id`))) left join `package` `pkg` on((`ps`.`package_id` = `pkg`.`package_id`))) left join `package_type` `pty` on((`pkg`.`package_type_id` = `pty`.`package_type_id`))) left join `package_pricing` `pp` on((`ps`.`package_scheme_id` = `pp`.`package_scheme_id`))) left join `special_price_date` `spd` on((`pp`.`pricing_id` = `spd`.`pricing_id`))) where (`pty`.`package_type_name` = 'tour') */;
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

-- Dump completed on 2016-02-10 16:15:15
