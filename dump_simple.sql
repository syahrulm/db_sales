CREATE DATABASE  IF NOT EXISTS `travel_management` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travel_management`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: travel_management
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `alias` varchar(6) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`,`country_id`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_city_country1_idx` (`country_id`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
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
  `country_name` varchar(150) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id_UNIQUE` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_m`
--

DROP TABLE IF EXISTS `hotel_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_m` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `hotel_rating` int(11) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  KEY `fk_hotel_m_city1_idx` (`city_id`),
  CONSTRAINT `fk_hotel_m_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_m`
--

LOCK TABLES `hotel_m` WRITE;
/*!40000 ALTER TABLE `hotel_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenerary_arrangement_t`
--

DROP TABLE IF EXISTS `itenerary_arrangement_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary_arrangement_t` (
  `itenerary_id` int(11) NOT NULL,
  `itenerary_collection_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL,
  `sequence_nummber` int(11) NOT NULL,
  PRIMARY KEY (`itenerary_id`,`itenerary_collection_id`,`days`),
  KEY `fk_itenerary_arrangement_t_itenerary_collection_m1_idx` (`itenerary_collection_id`),
  CONSTRAINT `fk_itenerary_arrangement_t_itenerary_m1` FOREIGN KEY (`itenerary_id`) REFERENCES `itenerary_m` (`itenerary_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itenerary_arrangement_t_itenerary_collection_m1` FOREIGN KEY (`itenerary_collection_id`) REFERENCES `itenerary_collection_m` (`itenerary_collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary_arrangement_t`
--

LOCK TABLES `itenerary_arrangement_t` WRITE;
/*!40000 ALTER TABLE `itenerary_arrangement_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `itenerary_arrangement_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenerary_collection_m`
--

DROP TABLE IF EXISTS `itenerary_collection_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary_collection_m` (
  `itenerary_collection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_name` varchar(200) NOT NULL,
  PRIMARY KEY (`itenerary_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary_collection_m`
--

LOCK TABLES `itenerary_collection_m` WRITE;
/*!40000 ALTER TABLE `itenerary_collection_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `itenerary_collection_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenerary_m`
--

DROP TABLE IF EXISTS `itenerary_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itenerary_m` (
  `itenerary_id` int(11) NOT NULL AUTO_INCREMENT,
  `itenerary_name` text NOT NULL,
  `schedule_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`itenerary_id`),
  UNIQUE KEY `itenary_id_UNIQUE` (`itenerary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenerary_m`
--

LOCK TABLES `itenerary_m` WRITE;
/*!40000 ALTER TABLE `itenerary_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `itenerary_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_m`
--

DROP TABLE IF EXISTS `package_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_m` (
  `package_Id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` text,
  `duration_day` int(11) DEFAULT NULL,
  `duration_night` int(11) DEFAULT NULL,
  `package_type_Id` int(11) NOT NULL,
  `itenary_id` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`package_Id`),
  KEY `fk_travel_package_m_package_type_m1_idx` (`package_type_Id`),
  KEY `fk_package_m_itenary_collection_m1_idx` (`itenary_id`),
  CONSTRAINT `fk_travel_package_m_package_type_m1` FOREIGN KEY (`package_type_Id`) REFERENCES `package_type_m` (`package_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_m_itenary_collection_m1` FOREIGN KEY (`itenary_id`) REFERENCES `itenerary_collection_m` (`itenerary_collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_m`
--

LOCK TABLES `package_m` WRITE;
/*!40000 ALTER TABLE `package_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type_m`
--

DROP TABLE IF EXISTS `package_type_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_type_m` (
  `package_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_type` varchar(45) NOT NULL,
  PRIMARY KEY (`package_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type_m`
--

LOCK TABLES `package_type_m` WRITE;
/*!40000 ALTER TABLE `package_type_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_type_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing_package_t`
--

DROP TABLE IF EXISTS `pricing_package_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing_package_t` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `sales_price` decimal(10,2) DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `minimum_participant` int(11) NOT NULL DEFAULT '1',
  `maximum_participant` int(11) NOT NULL DEFAULT '1',
  `stock` int(11) DEFAULT '0',
  `supplier_id` int(11) NOT NULL,
  `available_date_from` datetime NOT NULL,
  `available_date_to` datetime NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`price_id`,`package_id`,`supplier_id`,`hotel_id`),
  KEY `fk_pricing_package_t_travel_package_m1_idx` (`package_id`),
  KEY `fk_pricing_package_t_supplier1_idx` (`supplier_id`),
  KEY `fk_pricing_package_t_hotel_m1_idx` (`hotel_id`),
  CONSTRAINT `fk_pricing_package_t_travel_package_m1` FOREIGN KEY (`package_id`) REFERENCES `package_m` (`package_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_package_t_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_package_t_hotel_m1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_m` (`hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing_package_t`
--

LOCK TABLES `pricing_package_t` WRITE;
/*!40000 ALTER TABLE `pricing_package_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricing_package_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_pricing_date_t`
--

DROP TABLE IF EXISTS `special_pricing_date_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_pricing_date_t` (
  `pricing_date_id` int(11) NOT NULL,
  `base_price_change` decimal(10,2) DEFAULT NULL,
  `sales_price_change` decimal(10,2) DEFAULT NULL,
  `price_id` int(10) unsigned NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pricing_date_id`),
  KEY `fk_pricing_date_pricing_package_t1_idx` (`price_id`),
  CONSTRAINT `fk_pricing_date_pricing_package_t1` FOREIGN KEY (`price_id`) REFERENCES `pricing_package_t` (`price_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_pricing_date_t`
--

LOCK TABLES `special_pricing_date_t` WRITE;
/*!40000 ALTER TABLE `special_pricing_date_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_pricing_date_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `fk_supplier_city1_idx` (`city_id`),
  CONSTRAINT `fk_supplier_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'travel_management'
--

--
-- Dumping routines for database 'travel_management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-10 18:09:24
