-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: bento
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Table structure for table `Coupon`
--

DROP TABLE IF EXISTS `Coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coupon` (
  `pk_Coupon` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `type_off` enum('percent','amount') DEFAULT 'amount',
  `give_amount` decimal(5,2) DEFAULT NULL,
  `get_amount` decimal(5,2) DEFAULT NULL,
  `type` enum('give','give-get') DEFAULT 'give',
  `is_expired` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pk_Coupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coupon`
--

LOCK TABLES `Coupon` WRITE;
/*!40000 ALTER TABLE `Coupon` DISABLE KEYS */;
INSERT INTO `Coupon` VALUES ('1121113370998kkk7','2015-03-12 22:08:05','2015-03-12 22:30:34',NULL,'amount',12.00,NULL,'give',0),('test_vincent','2015-03-18 20:06:00','2015-03-18 20:44:56',NULL,'amount',5.00,NULL,'give',0),('test_vincent_expired','2015-03-18 20:48:29','2015-03-18 20:52:30',NULL,'amount',5.00,NULL,'give',1);
/*!40000 ALTER TABLE `Coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CouponRedemption`
--

DROP TABLE IF EXISTS `CouponRedemption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CouponRedemption` (
  `pk_CouponRedemption` int(11) NOT NULL AUTO_INCREMENT,
  `fk_User` int(11) DEFAULT NULL,
  `fk_Coupon` varchar(25) DEFAULT NULL,
  `fk_Order` int(11) DEFAULT NULL,
  `fk_CouponWaiting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Coupon','UserCoupon') DEFAULT 'Coupon',
  PRIMARY KEY (`pk_CouponRedemption`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CouponRedemption`
--

LOCK TABLES `CouponRedemption` WRITE;
/*!40000 ALTER TABLE `CouponRedemption` DISABLE KEYS */;
INSERT INTO `CouponRedemption` VALUES (40,1,'1121113370998kkk7',NULL,NULL,'2015-08-17 20:45:09',NULL,'Coupon'),(41,1,'VINCENT2',NULL,NULL,'2015-08-17 20:45:09',NULL,'UserCoupon'),(47,2,'1121113370998kkk7',NULL,NULL,'2015-08-17 20:45:09',NULL,'Coupon'),(48,2,'VINCENT2',NULL,NULL,'2015-08-17 20:45:09',NULL,'UserCoupon');
/*!40000 ALTER TABLE `CouponRedemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CouponRequest`
--

DROP TABLE IF EXISTS `CouponRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CouponRequest` (
  `pk_CouponRequest` int(11) NOT NULL AUTO_INCREMENT,
  `fk_User` int(11) DEFAULT NULL,
  `reason` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_CouponRequest`),
  KEY `index2` (`fk_User`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CouponRequest`
--

LOCK TABLES `CouponRequest` WRITE;
/*!40000 ALTER TABLE `CouponRequest` DISABLE KEYS */;
INSERT INTO `CouponRequest` VALUES (1,7,'sold out','me@me.com','2015-01-24 05:31:01','2015-01-24 05:31:01'),(2,7,'sold out','me@me.com','2015-01-24 05:31:15','2015-01-24 05:31:15'),(3,NULL,'sold out','me@me.com','2015-01-24 05:32:52','2015-01-24 05:32:52'),(4,NULL,'sold out','me@me.com','2015-01-27 04:19:46','2015-01-27 04:19:46'),(5,NULL,'sold out','me@me.com','2015-02-10 11:51:36','2015-02-10 11:51:36'),(6,NULL,'sold out','me@me.com','2015-02-10 11:52:21','2015-02-10 11:52:21'),(7,6,'sold out','me@me.com','2015-02-10 11:53:49','2015-02-10 11:53:49'),(8,6,'sold out','me@me.com','2015-02-10 11:55:30','2015-02-10 11:55:30'),(9,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:27:20','2015-02-12 10:27:20'),(10,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:30:03','2015-02-12 10:30:03'),(11,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:31:00','2015-02-12 10:31:00'),(12,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:31:00','2015-02-12 10:31:00'),(13,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:32:44','2015-02-12 10:32:44'),(14,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 10:32:44','2015-02-12 10:32:44'),(15,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:22:47','2015-02-12 11:22:47'),(16,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:22:47','2015-02-12 11:22:47'),(17,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:36:39','2015-02-12 11:36:39'),(18,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:36:39','2015-02-12 11:36:39'),(19,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:37:45','2015-02-12 11:37:45'),(20,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-12 11:37:45','2015-02-12 11:37:45'),(21,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 00:19:13','2015-02-13 00:19:13'),(22,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 00:19:13','2015-02-13 00:19:13'),(23,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:29:48','2015-02-13 07:29:48'),(24,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:29:48','2015-02-13 07:29:48'),(25,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:48:48','2015-02-13 07:48:48'),(26,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:48:48','2015-02-13 07:48:48'),(27,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:48:53','2015-02-13 07:48:53'),(28,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:48:53','2015-02-13 07:48:53'),(29,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:53:22','2015-02-13 07:53:22'),(30,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:53:22','2015-02-13 07:53:22'),(31,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:55:28','2015-02-13 07:55:28'),(32,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:55:28','2015-02-13 07:55:28'),(33,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:57:36','2015-02-13 07:57:36'),(34,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 07:57:36','2015-02-13 07:57:36'),(35,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:56:59','2015-02-13 08:56:59'),(36,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:56:59','2015-02-13 08:56:59'),(37,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:58:22','2015-02-13 08:58:22'),(38,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:58:22','2015-02-13 08:58:22'),(39,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:59:37','2015-02-13 08:59:37'),(40,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 08:59:37','2015-02-13 08:59:37'),(41,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:07:54','2015-02-13 09:07:54'),(42,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:07:54','2015-02-13 09:07:54'),(43,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:12:12','2015-02-13 09:12:12'),(44,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:12:12','2015-02-13 09:12:12'),(45,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:26:28','2015-02-13 09:26:28'),(46,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:26:28','2015-02-13 09:26:28'),(47,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:26:45','2015-02-13 09:26:45'),(48,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:26:45','2015-02-13 09:26:45'),(49,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:41:49','2015-02-13 09:41:49'),(50,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:41:49','2015-02-13 09:41:49'),(51,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:49:04','2015-02-13 09:49:04'),(52,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:49:04','2015-02-13 09:49:04'),(53,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:51:31','2015-02-13 09:51:31'),(54,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:51:31','2015-02-13 09:51:31'),(55,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:51:44','2015-02-13 09:51:44'),(56,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:51:44','2015-02-13 09:51:44'),(57,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:56:05','2015-02-13 09:56:05'),(58,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:56:05','2015-02-13 09:56:05'),(59,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:56:36','2015-02-13 09:56:36'),(60,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 09:56:37','2015-02-13 09:56:37'),(61,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 10:09:51','2015-02-13 10:09:51'),(62,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 10:09:51','2015-02-13 10:09:51'),(63,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 10:13:04','2015-02-13 10:13:04'),(64,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-13 10:13:04','2015-02-13 10:13:04'),(65,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-14 06:04:42','2015-02-14 06:04:42'),(66,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-14 06:04:42','2015-02-14 06:04:42'),(67,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-14 11:52:49','2015-02-14 11:52:49'),(68,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-14 11:52:49','2015-02-14 11:52:49'),(69,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:46:33','2015-02-16 01:46:33'),(70,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:46:33','2015-02-16 01:46:33'),(71,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:54:39','2015-02-16 01:54:39'),(72,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:54:39','2015-02-16 01:54:39'),(73,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:55:04','2015-02-16 01:55:04'),(74,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 01:55:04','2015-02-16 01:55:04'),(75,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 02:24:44','2015-02-16 02:24:44'),(76,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-16 02:24:44','2015-02-16 02:24:44'),(77,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:52:09','2015-02-18 04:52:09'),(78,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:52:09','2015-02-18 04:52:09'),(79,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:53:15','2015-02-18 04:53:15'),(80,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:53:15','2015-02-18 04:53:15'),(81,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:54:38','2015-02-18 04:54:38'),(82,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:54:38','2015-02-18 04:54:38'),(83,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:56:58','2015-02-18 04:56:58'),(84,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:56:58','2015-02-18 04:56:58'),(85,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:57:26','2015-02-18 04:57:26'),(86,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:57:26','2015-02-18 04:57:26'),(87,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:57:58','2015-02-18 04:57:58'),(88,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 04:57:58','2015-02-18 04:57:58'),(89,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 05:23:53','2015-02-18 05:23:53'),(90,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 05:23:53','2015-02-18 05:23:53'),(91,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 05:28:39','2015-02-18 05:28:39'),(92,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-18 05:28:39','2015-02-18 05:28:39'),(93,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-19 06:14:20','2015-02-19 06:14:20'),(94,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-19 06:14:20','2015-02-19 06:14:20'),(95,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-19 06:17:31','2015-02-19 06:17:31'),(96,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-19 06:17:31','2015-02-19 06:17:31'),(97,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:45:26','2015-02-22 03:45:26'),(98,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:45:26','2015-02-22 03:45:26'),(99,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:49:02','2015-02-22 03:49:02'),(100,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:49:02','2015-02-22 03:49:02'),(101,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:49:28','2015-02-22 03:49:28'),(102,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-22 03:49:28','2015-02-22 03:49:28'),(103,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-23 16:23:23','2015-02-23 16:23:23'),(104,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-23 16:23:23','2015-02-23 16:23:23'),(105,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-23 16:25:15','2015-02-23 16:25:15'),(106,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-23 16:25:15','2015-02-23 16:25:15'),(107,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:24:34','2015-02-27 02:24:34'),(108,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:24:34','2015-02-27 02:24:34'),(109,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:25:41','2015-02-27 02:25:41'),(110,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:25:41','2015-02-27 02:25:41'),(111,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:30:19','2015-02-27 02:30:19'),(112,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:30:19','2015-02-27 02:30:19'),(113,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:30:56','2015-02-27 02:30:56'),(114,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 02:30:56','2015-02-27 02:30:56'),(115,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 08:05:26','2015-02-27 08:05:26'),(116,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 08:05:27','2015-02-27 08:05:27'),(117,6,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 14:57:08','2015-02-27 14:57:08'),(118,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-02-27 14:57:08','2015-02-27 14:57:08'),(119,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-01 01:27:15','2015-03-01 01:27:15'),(120,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-01 01:27:15','2015-03-01 01:27:15'),(121,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-07 07:32:20','2015-03-07 07:32:20'),(122,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-07 07:32:20','2015-03-07 07:32:20'),(123,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-13 06:37:09','2015-03-13 06:37:09'),(124,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-13 06:37:09','2015-03-13 06:37:09'),(125,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-13 06:39:24','2015-03-13 06:39:24'),(126,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-13 06:39:24','2015-03-13 06:39:24'),(127,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:38:04','2015-03-14 04:38:04'),(128,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:38:04','2015-03-14 04:38:04'),(129,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:45:54','2015-03-14 04:45:54'),(130,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:45:54','2015-03-14 04:45:54'),(131,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:48:42','2015-03-14 04:48:42'),(132,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:48:43','2015-03-14 04:48:43'),(133,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:51:00','2015-03-14 04:51:00'),(134,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-14 04:51:00','2015-03-14 04:51:00'),(135,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-17 05:08:48','2015-03-17 05:08:48'),(136,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-17 05:08:48','2015-03-17 05:08:48'),(137,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:47:06','2015-03-19 03:47:06'),(138,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:47:06','2015-03-19 03:47:06'),(139,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:48:33','2015-03-19 03:48:33'),(140,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:48:33','2015-03-19 03:48:33'),(141,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:49:21','2015-03-19 03:49:21'),(142,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:49:21','2015-03-19 03:49:21'),(143,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:51:28','2015-03-19 03:51:28'),(144,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:51:28','2015-03-19 03:51:28'),(145,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:52:20','2015-03-19 03:52:20'),(146,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:52:20','2015-03-19 03:52:20'),(147,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:53:01','2015-03-19 03:53:01'),(148,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:53:01','2015-03-19 03:53:01'),(149,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:58:05','2015-03-19 03:58:05'),(150,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:58:05','2015-03-19 03:58:05'),(151,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:59:07','2015-03-19 03:59:07'),(152,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 03:59:07','2015-03-19 03:59:07'),(153,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:20:34','2015-03-19 04:20:34'),(154,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:20:34','2015-03-19 04:20:34'),(155,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:23:06','2015-03-19 04:23:06'),(156,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:23:06','2015-03-19 04:23:06'),(157,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:24:24','2015-03-19 04:24:24'),(158,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 04:24:24','2015-03-19 04:24:24'),(159,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:09:36','2015-03-19 05:09:36'),(160,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:09:36','2015-03-19 05:09:36'),(161,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:13:29','2015-03-19 05:13:29'),(162,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:13:29','2015-03-19 05:13:29'),(163,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:13:49','2015-03-19 05:13:49'),(164,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-19 05:13:49','2015-03-19 05:13:49'),(165,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:45:52','2015-03-31 01:45:52'),(166,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:45:52','2015-03-31 01:45:52'),(167,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:55:28','2015-03-31 01:55:28'),(168,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:55:28','2015-03-31 01:55:28'),(169,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:57:42','2015-03-31 01:57:42'),(170,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:57:42','2015-03-31 01:57:42'),(171,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:59:13','2015-03-31 01:59:13'),(172,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 01:59:13','2015-03-31 01:59:13'),(173,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 02:03:56','2015-03-31 02:03:56'),(174,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 02:03:56','2015-03-31 02:03:56'),(175,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 02:06:49','2015-03-31 02:06:49'),(176,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 02:06:49','2015-03-31 02:06:49'),(177,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:44:09','2015-03-31 08:44:09'),(178,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:44:09','2015-03-31 08:44:09'),(179,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:44:54','2015-03-31 08:44:54'),(180,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:44:54','2015-03-31 08:44:54'),(181,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:50:10','2015-03-31 08:50:10'),(182,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 08:50:10','2015-03-31 08:50:10'),(183,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 09:24:49','2015-03-31 09:24:49'),(184,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 09:24:49','2015-03-31 09:24:49'),(185,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 11:12:45','2015-03-31 11:12:45'),(186,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 11:12:45','2015-03-31 11:12:45'),(187,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:33:23','2015-03-31 13:33:23'),(188,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:33:24','2015-03-31 13:33:24'),(189,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:33:59','2015-03-31 13:33:59'),(190,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:33:59','2015-03-31 13:33:59'),(191,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:34:51','2015-03-31 13:34:51'),(192,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:34:51','2015-03-31 13:34:51'),(193,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:35:58','2015-03-31 13:35:58'),(194,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:35:58','2015-03-31 13:35:58'),(195,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:38:17','2015-03-31 13:38:17'),(196,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 13:38:17','2015-03-31 13:38:17'),(197,6,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 15:00:28','2015-03-31 15:00:28'),(198,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-03-31 15:00:28','2015-03-31 15:00:28'),(199,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:01:19','2015-04-01 03:01:19'),(200,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:01:19','2015-04-01 03:01:19'),(201,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:08:14','2015-04-01 03:08:14'),(202,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:08:14','2015-04-01 03:08:14'),(203,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:09:19','2015-04-01 03:09:19'),(204,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:09:19','2015-04-01 03:09:19'),(205,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:35:41','2015-04-01 03:35:41'),(206,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:35:41','2015-04-01 03:35:41'),(207,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:38:19','2015-04-01 03:38:19'),(208,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:38:19','2015-04-01 03:38:19'),(209,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:39:36','2015-04-01 03:39:36'),(210,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-01 03:39:36','2015-04-01 03:39:36'),(211,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:09:40','2015-04-03 03:09:40'),(212,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:09:40','2015-04-03 03:09:40'),(213,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:11:03','2015-04-03 03:11:03'),(214,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:11:03','2015-04-03 03:11:03'),(215,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:12:10','2015-04-03 03:12:10'),(216,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:12:10','2015-04-03 03:12:10'),(217,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:39:50','2015-04-03 03:39:50'),(218,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 03:39:50','2015-04-03 03:39:50'),(219,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 04:03:47','2015-04-03 04:03:47'),(220,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 04:03:47','2015-04-03 04:03:47'),(221,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 04:09:22','2015-04-03 04:09:22'),(222,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-03 04:09:22','2015-04-03 04:09:22'),(223,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 06:42:49','2015-04-04 06:42:49'),(224,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 06:43:41','2015-04-04 06:43:41'),(225,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 06:43:41','2015-04-04 06:43:41'),(226,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 06:44:28','2015-04-04 06:44:28'),(227,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 06:44:28','2015-04-04 06:44:28'),(228,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 07:06:49','2015-04-04 07:06:49'),(229,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 07:06:49','2015-04-04 07:06:49'),(230,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 07:53:44','2015-04-04 07:53:44'),(231,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-04 07:53:44','2015-04-04 07:53:44'),(232,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-07 15:25:11','2015-04-07 15:25:11'),(233,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-07 15:25:11','2015-04-07 15:25:11'),(234,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:31:34','2015-04-09 12:31:34'),(235,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:31:34','2015-04-09 12:31:34'),(236,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:49:39','2015-04-09 12:49:39'),(237,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:49:39','2015-04-09 12:49:39'),(238,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:55:25','2015-04-09 12:55:25'),(239,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 12:55:25','2015-04-09 12:55:25'),(240,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:04:59','2015-04-09 13:04:59'),(241,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:04:59','2015-04-09 13:04:59'),(242,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:07:23','2015-04-09 13:07:23'),(243,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:07:24','2015-04-09 13:07:24'),(244,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:15:02','2015-04-09 13:15:02'),(245,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:15:02','2015-04-09 13:15:02'),(246,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:17:45','2015-04-09 13:17:45'),(247,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:17:46','2015-04-09 13:17:46'),(248,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:19:13','2015-04-09 13:19:13'),(249,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:19:13','2015-04-09 13:19:13'),(250,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:26:28','2015-04-09 13:26:28'),(251,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-09 13:26:28','2015-04-09 13:26:28'),(252,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:46:53','2015-04-10 05:46:53'),(253,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:46:53','2015-04-10 05:46:53'),(254,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:47:37','2015-04-10 05:47:37'),(255,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:47:37','2015-04-10 05:47:37'),(256,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:49:30','2015-04-10 05:49:30'),(257,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:49:30','2015-04-10 05:49:30'),(258,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:50:45','2015-04-10 05:50:45'),(259,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:50:45','2015-04-10 05:50:45'),(260,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:52:34','2015-04-10 05:52:34'),(261,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 05:52:34','2015-04-10 05:52:34'),(262,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:29:09','2015-04-10 08:29:09'),(263,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:29:09','2015-04-10 08:29:09'),(264,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:30:15','2015-04-10 08:30:15'),(265,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:30:15','2015-04-10 08:30:15'),(266,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:31:25','2015-04-10 08:31:25'),(267,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:31:25','2015-04-10 08:31:25'),(268,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:32:12','2015-04-10 08:32:12'),(269,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:32:12','2015-04-10 08:32:12'),(270,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:37:00','2015-04-10 08:37:00'),(271,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:37:00','2015-04-10 08:37:00'),(272,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:39:27','2015-04-10 08:39:27'),(273,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-10 08:39:27','2015-04-10 08:39:27'),(274,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-11 01:45:13','2015-04-11 01:45:13'),(275,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-11 01:45:13','2015-04-11 01:45:13'),(276,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 06:57:10','2015-04-15 06:57:10'),(277,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 06:57:10','2015-04-15 06:57:10'),(278,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 06:58:28','2015-04-15 06:58:28'),(279,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 06:58:28','2015-04-15 06:58:28'),(280,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:22:33','2015-04-15 11:22:33'),(281,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:22:33','2015-04-15 11:22:33'),(282,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:24:18','2015-04-15 11:24:18'),(283,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:24:18','2015-04-15 11:24:18'),(284,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:24:59','2015-04-15 11:24:59'),(285,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:24:59','2015-04-15 11:24:59'),(286,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:26:37','2015-04-15 11:26:37'),(287,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:26:37','2015-04-15 11:26:37'),(288,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:27:24','2015-04-15 11:27:24'),(289,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:27:24','2015-04-15 11:27:24'),(290,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:48:20','2015-04-15 11:48:20'),(291,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-15 11:48:20','2015-04-15 11:48:20'),(292,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-16 05:36:39','2015-04-16 05:36:39'),(293,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-16 05:36:39','2015-04-16 05:36:39'),(294,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-16 05:50:46','2015-04-16 05:50:46'),(295,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-16 05:50:46','2015-04-16 05:50:46'),(296,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:18:50','2015-04-17 05:18:50'),(297,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:18:50','2015-04-17 05:18:50'),(298,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:20:59','2015-04-17 05:20:59'),(299,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:20:59','2015-04-17 05:20:59'),(300,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:25:16','2015-04-17 05:25:16'),(301,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-17 05:25:16','2015-04-17 05:25:16'),(302,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 07:47:14','2015-04-18 07:47:14'),(303,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 07:47:14','2015-04-18 07:47:14'),(304,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 08:03:17','2015-04-18 08:03:17'),(305,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 08:03:17','2015-04-18 08:03:17'),(306,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 08:07:50','2015-04-18 08:07:50'),(307,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-18 08:07:51','2015-04-18 08:07:51'),(308,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-21 08:52:26','2015-04-21 08:52:26'),(309,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-21 08:52:26','2015-04-21 08:52:26'),(310,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:20:26','2015-04-22 03:20:26'),(311,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:20:26','2015-04-22 03:20:26'),(312,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:24:09','2015-04-22 03:24:09'),(313,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:24:09','2015-04-22 03:24:09'),(314,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:30:37','2015-04-22 03:30:37'),(315,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:30:37','2015-04-22 03:30:37'),(316,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:54:46','2015-04-22 03:54:46'),(317,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 03:54:46','2015-04-22 03:54:46'),(318,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 04:49:22','2015-04-22 04:49:22'),(319,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 04:49:22','2015-04-22 04:49:22'),(320,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:30:31','2015-04-22 05:30:31'),(321,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:30:31','2015-04-22 05:30:31'),(322,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:53:18','2015-04-22 05:53:18'),(323,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:53:18','2015-04-22 05:53:18'),(324,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:54:07','2015-04-22 05:54:07'),(325,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:54:07','2015-04-22 05:54:07'),(326,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:55:54','2015-04-22 05:55:54'),(327,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:55:54','2015-04-22 05:55:54'),(328,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:57:05','2015-04-22 05:57:05'),(329,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 05:57:05','2015-04-22 05:57:05'),(330,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 06:07:04','2015-04-22 06:07:04'),(331,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 06:07:05','2015-04-22 06:07:05'),(332,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:13:50','2015-04-22 07:13:50'),(333,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:13:50','2015-04-22 07:13:50'),(334,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:19:45','2015-04-22 07:19:45'),(335,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:19:45','2015-04-22 07:19:45'),(336,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:26:18','2015-04-22 07:26:18'),(337,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-22 07:26:18','2015-04-22 07:26:18'),(338,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:49:03','2015-04-25 06:49:03'),(339,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:49:03','2015-04-25 06:49:03'),(340,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:50:06','2015-04-25 06:50:06'),(341,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:50:06','2015-04-25 06:50:06'),(342,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:53:04','2015-04-25 06:53:04'),(343,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:53:04','2015-04-25 06:53:04'),(344,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:57:21','2015-04-25 06:57:21'),(345,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 06:57:21','2015-04-25 06:57:21'),(346,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 07:23:01','2015-04-25 07:23:01'),(347,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 07:23:01','2015-04-25 07:23:01'),(348,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 08:02:26','2015-04-25 08:02:26'),(349,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-25 08:02:26','2015-04-25 08:02:26'),(350,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-28 11:01:01','2015-04-28 11:01:01'),(351,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-28 11:01:01','2015-04-28 11:01:01'),(352,6,'outside of delivery zone','vcardillo@gmail.com','2015-04-29 06:30:35','2015-04-29 06:30:35'),(353,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-04-29 06:30:35','2015-04-29 06:30:35'),(354,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 04:11:11','2015-05-05 04:11:11'),(355,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 04:11:11','2015-05-05 04:11:11'),(356,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 05:31:02','2015-05-05 05:31:02'),(357,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 05:31:02','2015-05-05 05:31:02'),(358,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:45:37','2015-05-05 08:45:37'),(359,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:45:37','2015-05-05 08:45:37'),(360,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:47:54','2015-05-05 08:47:54'),(361,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:47:54','2015-05-05 08:47:54'),(362,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:48:31','2015-05-05 08:48:31'),(363,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 08:48:32','2015-05-05 08:48:32'),(364,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:02:06','2015-05-05 09:02:06'),(365,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:02:06','2015-05-05 09:02:06'),(366,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:02:30','2015-05-05 09:02:30'),(367,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:02:30','2015-05-05 09:02:30'),(368,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:04:03','2015-05-05 09:04:03'),(369,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:04:03','2015-05-05 09:04:03'),(370,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:11:45','2015-05-05 09:11:45'),(371,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:11:45','2015-05-05 09:11:45'),(372,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:16:01','2015-05-05 09:16:01'),(373,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 09:16:01','2015-05-05 09:16:01'),(374,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 10:15:04','2015-05-05 10:15:04'),(375,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 10:15:04','2015-05-05 10:15:04'),(376,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 10:15:27','2015-05-05 10:15:27'),(377,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-05 10:15:27','2015-05-05 10:15:27'),(378,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 06:33:07','2015-05-07 06:33:07'),(379,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 06:33:07','2015-05-07 06:33:07'),(380,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 06:34:42','2015-05-07 06:34:42'),(381,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 06:34:42','2015-05-07 06:34:42'),(382,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 08:32:29','2015-05-07 08:32:29'),(383,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 08:32:29','2015-05-07 08:32:29'),(384,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 09:18:39','2015-05-07 09:18:39'),(385,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-07 09:18:39','2015-05-07 09:18:39'),(386,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-09 05:02:03','2015-05-09 05:02:03'),(387,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-09 05:02:03','2015-05-09 05:02:03'),(388,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-09 05:33:01','2015-05-09 05:33:01'),(389,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-09 05:33:01','2015-05-09 05:33:01'),(390,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 00:59:13','2015-05-12 00:59:13'),(391,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 00:59:13','2015-05-12 00:59:13'),(392,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 01:24:20','2015-05-12 01:24:20'),(393,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 01:24:20','2015-05-12 01:24:20'),(394,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-11 22:38:55','2015-05-11 22:38:55'),(395,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-11 22:38:55','2015-05-11 22:38:55'),(396,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-11 23:13:49','2015-05-11 23:13:49'),(397,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-11 23:13:49','2015-05-11 23:13:49'),(398,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 03:02:23','2015-05-12 03:02:23'),(399,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 03:02:23','2015-05-12 03:02:23'),(400,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 03:04:26','2015-05-12 03:04:26'),(401,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-12 03:04:26','2015-05-12 03:04:26'),(402,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-15 02:28:51','2015-05-15 02:28:51'),(403,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-15 02:28:51','2015-05-15 02:28:51'),(404,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-15 02:30:15','2015-05-15 02:30:15'),(405,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-15 02:30:15','2015-05-15 02:30:15'),(406,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-24 22:52:37','2015-05-24 22:52:37'),(407,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-24 22:52:37','2015-05-24 22:52:37'),(408,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:04:19','2015-05-26 23:04:19'),(409,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:04:19','2015-05-26 23:04:19'),(410,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:28:11','2015-05-26 23:28:11'),(411,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:28:11','2015-05-26 23:28:11'),(412,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:29:00','2015-05-26 23:29:00'),(413,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:29:00','2015-05-26 23:29:00'),(414,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:29:36','2015-05-26 23:29:36'),(415,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-26 23:29:36','2015-05-26 23:29:36'),(416,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-27 06:07:44','2015-05-27 06:07:44'),(417,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-27 06:07:44','2015-05-27 06:07:44'),(418,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-27 18:10:49','2015-05-27 18:10:49'),(419,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-27 18:10:49','2015-05-27 18:10:49'),(420,6,'outside of delivery zone','vcardillo@gmail.com','2015-05-28 23:43:14','2015-05-28 23:43:14'),(421,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-05-28 23:43:14','2015-05-28 23:43:14'),(422,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-02 21:58:28','2015-06-02 21:58:28'),(423,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-02 21:58:28','2015-06-02 21:58:28'),(424,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:38:52','2015-06-15 20:38:52'),(425,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:38:52','2015-06-15 20:38:52'),(426,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:44:17','2015-06-15 20:44:17'),(427,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:44:17','2015-06-15 20:44:17'),(428,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:58:21','2015-06-15 20:58:21'),(429,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 20:58:21','2015-06-15 20:58:21'),(430,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 21:54:09','2015-06-15 21:54:09'),(431,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 21:54:09','2015-06-15 21:54:09'),(432,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 22:39:39','2015-06-15 22:39:39'),(433,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-15 22:39:39','2015-06-15 22:39:39'),(434,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:07:00','2015-06-20 21:07:00'),(435,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:07:00','2015-06-20 21:07:00'),(436,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:08:55','2015-06-20 21:08:55'),(437,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:08:55','2015-06-20 21:08:55'),(438,6,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:12:44','2015-06-20 21:12:44'),(439,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-06-20 21:12:44','2015-06-20 21:12:44'),(440,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 20:51:15','2015-07-20 20:51:15'),(441,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 20:51:15','2015-07-20 20:51:15'),(442,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:54:58','2015-07-20 21:54:58'),(443,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:54:58','2015-07-20 21:54:58'),(444,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:57:04','2015-07-20 21:57:04'),(445,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:57:05','2015-07-20 21:57:05'),(446,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:58:12','2015-07-20 21:58:12'),(447,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 21:58:12','2015-07-20 21:58:12'),(448,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:11:44','2015-07-20 22:11:44'),(449,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:11:44','2015-07-20 22:11:44'),(450,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:17:00','2015-07-20 22:17:00'),(451,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:17:00','2015-07-20 22:17:00'),(452,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:22:50','2015-07-20 22:22:50'),(453,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:22:51','2015-07-20 22:22:51'),(454,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:36:00','2015-07-20 22:36:00'),(455,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-20 22:36:00','2015-07-20 22:36:00'),(456,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-22 22:40:27','2015-07-22 22:40:27'),(457,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-22 22:40:27','2015-07-22 22:40:27'),(458,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-22 22:44:19','2015-07-22 22:44:19'),(459,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-22 22:44:19','2015-07-22 22:44:19'),(460,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:02:19','2015-07-23 23:02:19'),(461,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:02:19','2015-07-23 23:02:19'),(462,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:22:11','2015-07-23 23:22:11'),(463,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:22:11','2015-07-23 23:22:11'),(464,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:24:30','2015-07-23 23:24:30'),(465,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:24:30','2015-07-23 23:24:30'),(466,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:30:41','2015-07-23 23:30:41'),(467,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:30:41','2015-07-23 23:30:41'),(468,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:54:12','2015-07-23 23:54:12'),(469,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-23 23:54:12','2015-07-23 23:54:12'),(470,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-30 00:26:57','2015-07-30 00:26:57'),(471,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-30 00:26:57','2015-07-30 00:26:57'),(472,6,'outside of delivery zone','vcardillo@gmail.com','2015-07-30 17:42:14','2015-07-30 17:42:14'),(473,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-07-30 17:42:14','2015-07-30 17:42:14'),(474,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:20:27','2015-08-12 19:20:27'),(475,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:20:27','2015-08-12 19:20:27'),(476,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:48:29','2015-08-12 19:48:29'),(477,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:48:29','2015-08-12 19:48:29'),(478,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:53:05','2015-08-12 19:53:05'),(479,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 19:53:05','2015-08-12 19:53:05'),(480,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 20:16:30','2015-08-12 20:16:30'),(481,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 20:16:30','2015-08-12 20:16:30'),(482,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 20:34:17','2015-08-12 20:34:17'),(483,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-12 20:34:17','2015-08-12 20:34:17'),(484,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 18:53:47','2015-08-14 18:53:47'),(485,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 18:53:47','2015-08-14 18:53:47'),(486,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 19:02:24','2015-08-14 19:02:24'),(487,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 19:02:24','2015-08-14 19:02:24'),(488,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 22:36:14','2015-08-14 22:36:14'),(489,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 22:36:14','2015-08-14 22:36:14'),(490,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 23:19:22','2015-08-14 23:19:22'),(491,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 23:19:22','2015-08-14 23:19:22'),(492,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 23:19:30','2015-08-14 23:19:30'),(493,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-14 23:19:30','2015-08-14 23:19:30'),(494,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:46:26','2015-08-15 00:46:26'),(495,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:46:26','2015-08-15 00:46:26'),(496,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:48:50','2015-08-15 00:48:50'),(497,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:48:50','2015-08-15 00:48:50'),(498,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:51:50','2015-08-15 00:51:50'),(499,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:51:50','2015-08-15 00:51:50'),(500,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:56:34','2015-08-15 00:56:34'),(501,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:56:34','2015-08-15 00:56:34'),(502,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:58:34','2015-08-15 00:58:34'),(503,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-15 00:58:34','2015-08-15 00:58:34'),(504,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 18:56:01','2015-08-17 18:56:01'),(505,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 18:56:01','2015-08-17 18:56:01'),(506,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:19:15','2015-08-17 20:19:15'),(507,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:19:15','2015-08-17 20:19:15'),(508,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:38:20','2015-08-17 20:38:20'),(509,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:38:20','2015-08-17 20:38:20'),(510,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:52:59','2015-08-17 20:52:59'),(511,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 20:52:59','2015-08-17 20:52:59'),(512,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:26:22','2015-08-17 21:26:22'),(513,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:26:22','2015-08-17 21:26:22'),(514,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:32:36','2015-08-17 21:32:36'),(515,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:32:36','2015-08-17 21:32:36'),(516,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:36:22','2015-08-17 21:36:22'),(517,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:36:22','2015-08-17 21:36:22'),(518,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:39:48','2015-08-17 21:39:48'),(519,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 21:39:48','2015-08-17 21:39:48'),(520,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 23:15:28','2015-08-17 23:15:28'),(521,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-17 23:15:28','2015-08-17 23:15:28'),(522,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 20:18:27','2015-08-26 20:18:27'),(523,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 20:18:27','2015-08-26 20:18:27'),(524,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 20:21:38','2015-08-26 20:21:38'),(525,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 20:21:38','2015-08-26 20:21:38'),(526,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 21:02:39','2015-08-26 21:02:39'),(527,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 21:02:39','2015-08-26 21:02:39'),(528,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 22:38:32','2015-08-26 22:38:32'),(529,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-26 22:38:32','2015-08-26 22:38:32'),(530,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:02:09','2015-08-27 21:02:09'),(531,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:02:09','2015-08-27 21:02:09'),(532,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:02:39','2015-08-27 21:02:39'),(533,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:02:39','2015-08-27 21:02:39'),(534,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:37:24','2015-08-27 21:37:24'),(535,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:37:24','2015-08-27 21:37:24'),(536,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:54:52','2015-08-27 21:54:52'),(537,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-27 21:54:52','2015-08-27 21:54:52'),(538,6,'outside of delivery zone','vcardillo@gmail.com','2015-08-28 01:14:29','2015-08-28 01:14:29'),(539,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-08-28 01:14:29','2015-08-28 01:14:29'),(540,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-01 23:26:33','2015-09-01 23:26:33'),(541,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-01 23:26:33','2015-09-01 23:26:33'),(542,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 01:32:17','2015-09-02 01:32:17'),(543,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 01:32:17','2015-09-02 01:32:17'),(544,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 19:10:54','2015-09-02 19:10:54'),(545,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 19:10:54','2015-09-02 19:10:54'),(546,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 19:13:07','2015-09-02 19:13:07'),(547,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 19:13:07','2015-09-02 19:13:07'),(548,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 20:32:45','2015-09-02 20:32:45'),(549,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-02 20:32:45','2015-09-02 20:32:45'),(550,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-10 18:54:12','2015-09-10 18:54:12'),(551,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-10 18:54:12','2015-09-10 18:54:12'),(552,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-10 18:54:48','2015-09-10 18:54:48'),(553,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-10 18:54:48','2015-09-10 18:54:48'),(554,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:37:17','2015-09-15 19:37:17'),(555,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:37:17','2015-09-15 19:37:17'),(556,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:37:39','2015-09-15 19:37:39'),(557,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:37:39','2015-09-15 19:37:39'),(558,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:54:57','2015-09-15 19:54:57'),(559,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-15 19:54:57','2015-09-15 19:54:57'),(560,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:03:44','2015-09-17 03:03:44'),(561,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:03:44','2015-09-17 03:03:44'),(562,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:07:53','2015-09-17 03:07:53'),(563,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:07:53','2015-09-17 03:07:53'),(564,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:08:58','2015-09-17 03:08:58'),(565,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 03:08:59','2015-09-17 03:08:59'),(566,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 21:45:48','2015-09-17 21:45:48'),(567,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-17 21:45:48','2015-09-17 21:45:48'),(568,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-22 00:45:52','2015-09-22 00:45:52'),(569,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-22 00:45:52','2015-09-22 00:45:52'),(570,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:09:10','2015-09-23 19:09:10'),(571,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:09:10','2015-09-23 19:09:10'),(572,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:11:14','2015-09-23 19:11:14'),(573,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:11:14','2015-09-23 19:11:14'),(574,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:50:41','2015-09-23 19:50:41'),(575,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 19:50:41','2015-09-23 19:50:41'),(576,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 22:48:39','2015-09-23 22:48:39'),(577,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 22:48:39','2015-09-23 22:48:39'),(578,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 22:56:34','2015-09-23 22:56:34'),(579,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 22:56:34','2015-09-23 22:56:34'),(580,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:03:52','2015-09-23 23:03:52'),(581,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:03:52','2015-09-23 23:03:52'),(582,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:05:08','2015-09-23 23:05:08'),(583,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:05:08','2015-09-23 23:05:08'),(584,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:14:40','2015-09-23 23:14:40'),(585,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:14:40','2015-09-23 23:14:40'),(586,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:18:04','2015-09-23 23:18:04'),(587,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:18:04','2015-09-23 23:18:04'),(588,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:20:07','2015-09-23 23:20:07'),(589,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:20:07','2015-09-23 23:20:07'),(590,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:55:45','2015-09-23 23:55:45'),(591,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:55:45','2015-09-23 23:55:45'),(592,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:56:48','2015-09-23 23:56:48'),(593,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-23 23:56:48','2015-09-23 23:56:48'),(594,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:02:56','2015-09-24 00:02:56'),(595,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:02:57','2015-09-24 00:02:57'),(596,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:04:40','2015-09-24 00:04:40'),(597,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:04:40','2015-09-24 00:04:40'),(598,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:12:32','2015-09-24 00:12:32'),(599,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:12:32','2015-09-24 00:12:32'),(600,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:13:18','2015-09-24 00:13:18'),(601,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:13:18','2015-09-24 00:13:18'),(602,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:19:15','2015-09-24 00:19:15'),(603,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:19:15','2015-09-24 00:19:15'),(604,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:58:23','2015-09-24 00:58:23'),(605,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 00:58:23','2015-09-24 00:58:23'),(606,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:10:54','2015-09-24 01:10:54'),(607,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:10:54','2015-09-24 01:10:54'),(608,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:12:10','2015-09-24 01:12:10'),(609,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:12:10','2015-09-24 01:12:10'),(610,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:14:36','2015-09-24 01:14:36'),(611,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:14:36','2015-09-24 01:14:36'),(612,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:26:48','2015-09-24 01:26:48'),(613,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:26:48','2015-09-24 01:26:48'),(614,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:36:38','2015-09-24 01:36:38'),(615,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:36:38','2015-09-24 01:36:38'),(616,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:55:14','2015-09-24 01:55:14'),(617,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:55:14','2015-09-24 01:55:14'),(618,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:59:55','2015-09-24 01:59:55'),(619,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 01:59:55','2015-09-24 01:59:55'),(620,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 02:10:09','2015-09-24 02:10:09'),(621,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 02:10:09','2015-09-24 02:10:09'),(622,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 02:12:07','2015-09-24 02:12:07'),(623,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-24 02:12:07','2015-09-24 02:12:07'),(624,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:03:04','2015-09-25 02:03:04'),(625,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:03:04','2015-09-25 02:03:04'),(626,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:34:48','2015-09-25 02:34:48'),(627,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:34:48','2015-09-25 02:34:48'),(628,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:36:56','2015-09-25 02:36:56'),(629,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 02:36:56','2015-09-25 02:36:56'),(630,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:49:57','2015-09-25 03:49:57'),(631,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:49:57','2015-09-25 03:49:57'),(632,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:54:17','2015-09-25 03:54:17'),(633,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:54:17','2015-09-25 03:54:17'),(634,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:56:07','2015-09-25 03:56:07'),(635,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:56:07','2015-09-25 03:56:07'),(636,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:56:53','2015-09-25 03:56:53'),(637,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 03:56:53','2015-09-25 03:56:53'),(638,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 04:27:40','2015-09-25 04:27:40'),(639,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 04:27:40','2015-09-25 04:27:40'),(640,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 19:55:33','2015-09-25 19:55:33'),(641,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 19:55:33','2015-09-25 19:55:33'),(642,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 19:57:31','2015-09-25 19:57:31'),(643,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 19:57:31','2015-09-25 19:57:31'),(644,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 20:42:14','2015-09-25 20:42:14'),(645,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 20:42:14','2015-09-25 20:42:14'),(646,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:25:27','2015-09-25 23:25:27'),(647,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:25:27','2015-09-25 23:25:27'),(648,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:30:28','2015-09-25 23:30:28'),(649,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:30:28','2015-09-25 23:30:28'),(650,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:31:51','2015-09-25 23:31:51'),(651,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:31:51','2015-09-25 23:31:51'),(652,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:37:52','2015-09-25 23:37:52'),(653,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-25 23:37:52','2015-09-25 23:37:52'),(654,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-28 19:23:59','2015-09-28 19:23:59'),(655,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-28 19:23:59','2015-09-28 19:23:59'),(656,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-30 19:33:47','2015-09-30 19:33:47'),(657,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-30 19:33:47','2015-09-30 19:33:47'),(658,6,'outside of delivery zone','vcardillo@gmail.com','2015-09-30 19:35:43','2015-09-30 19:35:43'),(659,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-09-30 19:35:43','2015-09-30 19:35:43'),(660,6,'outside of delivery zone','vcardillo@gmail.com','2015-10-02 04:27:08','2015-10-02 04:27:08'),(661,NULL,'outside of delivery zone','vcardillo@gmail.com','2015-10-02 04:27:08','2015-10-02 04:27:08');
/*!40000 ALTER TABLE `CouponRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CouponUserHash`
--

DROP TABLE IF EXISTS `CouponUserHash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CouponUserHash` (
  `pk_CouponUserHash` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_CouponUserHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CouponUserHash`
--

LOCK TABLES `CouponUserHash` WRITE;
/*!40000 ALTER TABLE `CouponUserHash` DISABLE KEYS */;
INSERT INTO `CouponUserHash` VALUES ('JASON',4,'2015-04-01 03:37:29','2015-04-03 22:53:18'),('JIMMY',5,'2015-04-01 03:37:30','2015-04-03 22:53:18'),('JIMMYWIMBL',4,'2015-04-01 03:37:30','2015-04-03 22:53:18'),('JOHN',12,'2015-04-01 03:37:30','2015-09-28 21:10:53'),('JOHNJ',224,'2015-04-01 03:37:30','2015-10-02 04:27:38'),('TESTJOHNJ',1,'2015-04-04 06:25:39','2015-04-04 06:25:39'),('VINCENT',6,'2015-04-01 03:37:30','2015-04-03 22:53:18'),('VINCENTT1',4,'2015-04-01 03:37:30','2015-04-03 22:53:18'),('VINCENTT2',4,'2015-04-01 03:37:30','2015-04-03 22:53:18'),('VINCENTT3',4,'2015-04-01 03:37:30','2015-04-03 22:53:18');
/*!40000 ALTER TABLE `CouponUserHash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CouponWaiting`
--

DROP TABLE IF EXISTS `CouponWaiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CouponWaiting` (
  `pk_CouponWaiting` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Coupon` int(11) DEFAULT NULL,
  `user_from` varchar(45) DEFAULT NULL,
  `user_to` varchar(45) DEFAULT NULL,
  `expires` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk_CouponWaiting`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CouponWaiting`
--

LOCK TABLES `CouponWaiting` WRITE;
/*!40000 ALTER TABLE `CouponWaiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `CouponWaiting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerBentoBox`
--

DROP TABLE IF EXISTS `CustomerBentoBox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerBentoBox` (
  `pk_CustomerBentoBox` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_main` int(11) DEFAULT NULL,
  `fk_side1` int(11) DEFAULT NULL,
  `fk_side2` int(11) DEFAULT NULL,
  `fk_side3` int(11) DEFAULT NULL,
  `fk_side4` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_CustomerBentoBox`),
  KEY `fk_Order_idx` (`fk_Order`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is used for *customer* defined bento boxes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerBentoBox`
--

LOCK TABLES `CustomerBentoBox` WRITE;
/*!40000 ALTER TABLE `CustomerBentoBox` DISABLE KEYS */;
INSERT INTO `CustomerBentoBox` VALUES (1,1,'2015-10-02 04:27:10','2015-10-02 04:27:10',1,2,NULL,NULL,NULL),(2,1,'2015-10-02 04:27:10','2015-10-02 04:27:10',1,2,NULL,NULL,NULL),(3,2,'2015-10-02 04:27:14','2015-10-02 04:27:14',1,2,NULL,NULL,NULL),(4,3,'2015-10-02 04:27:17','2015-10-02 04:27:17',1,2,NULL,NULL,NULL),(5,4,'2015-10-02 04:27:19','2015-10-02 04:27:19',1,2,NULL,NULL,NULL),(6,5,'2015-10-02 04:27:22','2015-10-02 04:27:22',1,2,NULL,NULL,NULL),(7,6,'2015-10-02 04:27:26','2015-10-02 04:27:26',1,2,NULL,NULL,NULL),(8,7,'2015-10-02 04:27:28','2015-10-02 04:27:28',1,2,NULL,NULL,NULL),(9,8,'2015-10-02 04:27:30','2015-10-02 04:27:30',1,2,NULL,NULL,NULL),(10,9,'2015-10-02 04:27:34','2015-10-02 04:27:34',1,2,NULL,NULL,NULL),(11,9,'2015-10-02 04:27:34','2015-10-02 04:27:34',1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `CustomerBentoBox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dish` (
  `pk_Dish` int(11) NOT NULL AUTO_INCREMENT,
  `parent_pk_Dish` int(11) DEFAULT NULL COMMENT 'Used if copied.',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('main','side') DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `label` varchar(20) DEFAULT NULL,
  `temp` enum('hot','cold') DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `email_image1` varchar(255) DEFAULT NULL,
  `max_per_order` tinyint(4) DEFAULT NULL,
  `i_notes` text COMMENT 'Internal notes.',
  PRIMARY KEY (`pk_Dish`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Dish: An individual item that would go onto a plate.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
INSERT INTO `Dish` VALUES (1,NULL,'2015-01-08 20:14:58','2015-04-18 01:00:00','\"Eggplant\"','ep','Delicous eggplant','side',NULL,'A','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,2,NULL),(2,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Kimchi','kc','Delicious kimchi','side',NULL,'B','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,2,NULL),(3,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Noodles','nd','Delicious noodles','side',NULL,'C','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(4,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Rice','rc','Delicious rice','side',NULL,'D','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,2,NULL),(5,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Udon','ud','Delicious udon','side',NULL,'E','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,2,NULL),(6,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Broccoli','br','Delicious broccoli','side',NULL,'F','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,2,NULL),(7,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Crab','cr','Delicious crab','main',NULL,'G','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(8,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Salmon','sl','Delicious salmon','main',NULL,'H','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(9,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Tuna','tn','Delicious tuna','main',NULL,'I','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(10,NULL,'2015-01-08 20:27:35','2015-03-30 18:04:43','Chicken','cx','Delicious chicken','main',NULL,'J','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,7,'notes'),(11,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Beef','bf','Delicious beef','main',NULL,'K','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(12,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Sweet Sour Kidney Beans','sskb','Delicious kidney beans','side',NULL,'L','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(13,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Chicken Dumplings','cd','Delicious dumplings','side',NULL,'M','hot','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,99,'some notes'),(14,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','California Roll','cr','Delicious cali roll','side',NULL,'N','cold','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(15,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Tuna Roll','tr','Delicious tuna roll','side',NULL,'O','cold','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(16,NULL,'2015-01-08 20:27:35','2015-02-15 07:29:43','Salmon Roll','sr','Delicious salmon roll','side',NULL,'P','cold','https://d1pztqdeuocb8t.cloudfront.net/sample.png',NULL,NULL,NULL),(18,NULL,'2015-02-10 04:40:54','2015-04-06 23:17:20','Avocado Roll','ar','','main',NULL,'Q','hot','http://cdn.bentonow.com/menu/022315/Avocado+roll.JPG','http://cdn.bentonow.com/menu/022315/avocado-tuna-salad680x450.jpg',99,'notes'),(19,NULL,'2015-03-31 01:08:47','2015-03-31 01:08:47','AAA1',NULL,'DESC1','main',NULL,'label1','cold','',NULL,42,'notes1');
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Driver` (
  `pk_Driver` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `notes` text,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `mobile_phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `on_shift` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pk_Driver`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (1,'2015-01-22 20:17:49','2015-09-30 19:34:12',NULL,'notes','Vincent','Cardillo','585-502-8462','vincent@bentonow.com',1),(2,'2015-01-22 20:18:12','2015-09-29 08:13:39',NULL,NULL,'Alberto','Demantis','555-123-5678','john@smith.com',1),(3,'2015-02-13 23:29:11','2015-09-29 08:13:39',NULL,NULL,'Nicholas','Saavedra','925-917-1229','nicholasjamessaavedra@yahoo.com',1),(4,'2015-02-13 23:29:11','2015-09-25 04:21:23',NULL,NULL,'Alex',NULL,NULL,NULL,0),(5,'2015-02-13 23:29:11','2015-09-29 08:13:26',NULL,NULL,'Jim',NULL,NULL,NULL,0),(6,'2015-03-27 02:36:14','2015-08-17 23:09:40',NULL,'Notes','Richard','Wong','Phone','Email',0),(7,'2015-03-27 02:36:56','2015-09-29 08:13:26',NULL,'Notes\r\nNotes2\r\nwoop\r\nwoop\r\nde do\r\n  and such\r\nf\r\nwea\r\nfa\r\nf\r\nwef\r\newf\r\nf\r\nwef','Alice','Lombard','Phone','Email',0);
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DriverInventory`
--

DROP TABLE IF EXISTS `DriverInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DriverInventory` (
  `pk_DriverInventory` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Driver` int(11) DEFAULT NULL,
  `fk_item` int(11) DEFAULT NULL,
  `item_type` enum('Dish') DEFAULT 'Dish',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `qty` int(11) DEFAULT '0',
  `change_reason` enum('init','admin_update','order_assignment') DEFAULT 'init',
  PRIMARY KEY (`pk_DriverInventory`),
  UNIQUE KEY `uq_item` (`fk_Driver`,`fk_item`,`item_type`),
  KEY `index2` (`fk_Driver`),
  KEY `index3` (`fk_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This driver, with this inventory, at this time. A data point. This should be graph-able.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DriverInventory`
--

LOCK TABLES `DriverInventory` WRITE;
/*!40000 ALTER TABLE `DriverInventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `DriverInventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bento`@`localhost`*/ /*!50003 TRIGGER `DriverInventoryLog` BEFORE UPDATE ON `DriverInventory` FOR EACH ROW

BEGIN  

INSERT INTO `DriverInventoryLog` 
select  NULL, t.* 
from `DriverInventory` t where pk_DriverInventory = OLD.pk_DriverInventory;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bento`@`localhost`*/ /*!50003 TRIGGER `DriverInventoryLog_BEFORE_DELETE`
 BEFORE DELETE ON `DriverInventory` FOR EACH ROW

BEGIN  

INSERT INTO `DriverInventoryLog` 
select  NULL, t.* 
from `DriverInventory` t where pk_DriverInventory = OLD.pk_DriverInventory;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DriverInventoryLog`
--

DROP TABLE IF EXISTS `DriverInventoryLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DriverInventoryLog` (
  `pk_DriverInventoryLog` int(11) NOT NULL AUTO_INCREMENT,
  `pk_DriverInventory` int(11) DEFAULT NULL,
  `fk_Driver` int(11) DEFAULT NULL,
  `fk_item` int(11) DEFAULT NULL,
  `item_type` enum('Dish') DEFAULT 'Dish',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `qty` int(11) DEFAULT NULL,
  `change_reason` varchar(100) DEFAULT 'init',
  PRIMARY KEY (`pk_DriverInventoryLog`),
  KEY `index2` (`fk_Driver`),
  KEY `index3` (`fk_item`),
  KEY `index4` (`pk_DriverInventory`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='This driver, with this inventory, at this time. A data point. This should be graph-able.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DriverInventoryLog`
--

LOCK TABLES `DriverInventoryLog` WRITE;
/*!40000 ALTER TABLE `DriverInventoryLog` DISABLE KEYS */;
INSERT INTO `DriverInventoryLog` VALUES (4,7,2,7,'Dish','2015-10-02 04:21:44',NULL,1,'init'),(5,8,2,8,'Dish','2015-10-02 04:21:44',NULL,1,'init'),(6,6,2,10,'Dish','2015-10-02 04:21:44',NULL,1,'init'),(7,1,1,10,'Dish','2015-10-02 04:21:38',NULL,5,'init'),(8,2,1,7,'Dish','2015-10-02 04:21:38',NULL,5,'init'),(9,3,1,8,'Dish','2015-10-02 04:21:38',NULL,5,'init'),(10,12,3,10,'Dish','2015-10-02 04:26:07',NULL,1,'init'),(11,13,3,7,'Dish','2015-10-02 04:26:07',NULL,1,'init'),(12,14,3,8,'Dish','2015-10-02 04:26:13',NULL,1,'init'),(13,12,3,10,'Dish','2015-10-02 04:26:07','2015-10-02 04:26:17',0,'init'),(14,2,1,7,'Dish','2015-10-02 04:21:38','2015-10-02 04:22:28',6,'init'),(15,3,1,8,'Dish','2015-10-02 04:21:38','2015-10-02 04:22:28',6,'init'),(16,3,1,8,'Dish','2015-10-02 04:27:38',NULL,22,'init'),(17,5,2,7,'Dish','2015-10-02 04:27:38',NULL,2,'init'),(18,6,2,8,'Dish','2015-10-02 04:27:38',NULL,10,'init'),(19,4,2,10,'Dish','2015-10-02 04:27:38',NULL,1,'init'),(20,5,2,7,'Dish','2015-10-02 04:27:38',NULL,6,'init'),(21,6,2,8,'Dish','2015-10-02 04:27:38',NULL,9,'init'),(22,4,2,10,'Dish','2015-10-02 04:27:38',NULL,3,'init'),(23,8,3,7,'Dish','2015-10-02 04:27:38',NULL,8,'init'),(24,9,3,8,'Dish','2015-10-02 04:27:38',NULL,12,'init'),(25,7,3,10,'Dish','2015-10-02 04:27:38',NULL,4,'init'),(26,1,1,10,'Dish','2015-10-02 04:27:38',NULL,5,'init'),(27,2,1,7,'Dish','2015-10-02 04:27:38',NULL,10,'init'),(28,3,1,8,'Dish','2015-10-02 04:27:38',NULL,15,'init');
/*!40000 ALTER TABLE `DriverInventoryLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LiveInventory`
--

DROP TABLE IF EXISTS `LiveInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LiveInventory` (
  `pk_LiveInventory` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_item` int(11) DEFAULT NULL,
  `item_type` enum('Dish') COLLATE utf8_unicode_ci DEFAULT 'Dish',
  `qty` smallint(6) unsigned DEFAULT '0',
  `change_reason` enum('init','delivery','admin_update') COLLATE utf8_unicode_ci DEFAULT 'init',
  `qty_saved` smallint(6) unsigned DEFAULT '0',
  `sold_out` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pk_LiveInventory`),
  UNIQUE KEY `idx_fk_item` (`fk_item`,`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LiveInventory`
--

LOCK TABLES `LiveInventory` WRITE;
/*!40000 ALTER TABLE `LiveInventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `LiveInventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealType`
--

DROP TABLE IF EXISTS `MealType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealType` (
  `pk_MealType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  PRIMARY KEY (`pk_MealType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealType`
--

LOCK TABLES `MealType` WRITE;
/*!40000 ALTER TABLE `MealType` DISABLE KEYS */;
INSERT INTO `MealType` VALUES (1,'brunch',1,NULL),(2,'lunch',2,'11:30:00'),(3,'dinner',3,'16:30:00');
/*!40000 ALTER TABLE `MealType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `pk_Menu` int(11) NOT NULL AUTO_INCREMENT,
  `parent_pk_Menu` int(11) DEFAULT NULL COMMENT 'Used if you copy a menu.',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `for_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `i_notes` text COMMENT 'Internal notes.',
  `bgimg` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `menu_type` enum('fixed','custom') DEFAULT 'custom',
  `fk_MealType` int(11) DEFAULT '3',
  PRIMARY KEY (`pk_Menu`),
  UNIQUE KEY `Menu_Type` (`for_date`,`fk_MealType`),
  KEY `fk_Menu_1_idx` (`parent_pk_Menu`),
  CONSTRAINT `fk_Menu_1` FOREIGN KEY (`parent_pk_Menu`) REFERENCES `Menu` (`pk_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='All new Menus and Dishes will default to "draft mode" (unpublished).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,NULL,'2015-01-20 23:55:46','2015-05-05 02:01:16','2014-01-27','[TEST] Menu','my notes','https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'custom',3),(2,NULL,'2015-01-08 20:59:13',NULL,'2015-01-07','Bad Menu!!','Bad Notes!',NULL,1,'custom',3),(3,NULL,'2015-01-28 04:47:30','2015-05-05 02:01:16','2014-01-08','[TEST] Another Menu','','/foo.jpg',1,'custom',3),(4,NULL,'2015-01-28 05:19:32','2015-06-15 20:52:44','2015-06-15','Some Dinner Menu','','https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'custom',3),(5,NULL,'2015-01-28 17:28:19','2015-05-06 23:10:37','2015-05-06','Some Lunch Menu','','https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'fixed',2),(6,NULL,'2015-01-28 17:28:19','2015-05-05 02:01:16','2014-05-09','[TEST] 9th dinner','','https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'custom',3),(7,NULL,'2015-01-28 17:28:19','2015-05-05 02:13:41','2014-05-04','[TEST] 4th dinner','','https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'custom',3),(8,NULL,'2015-01-28 17:28:19','2015-05-06 22:46:09','2014-05-09','[TEST] 9th lunch',NULL,'https://d1pztqdeuocb8t.cloudfront.net/first_background.png',1,'fixed',2),(14,NULL,'2015-02-13 03:54:48','2015-05-06 22:46:09','2014-05-04','[TEST] 4th lunch','internal notes','/test-img.jpg',1,'fixed',2),(15,NULL,'2015-05-05 21:59:10','2015-06-04 03:52:04','2015-07-01','','','na',1,'custom',3),(16,NULL,'2015-05-05 21:59:57','2015-10-02 04:20:09','2015-10-01','','','none.jpg',1,'fixed',2),(17,NULL,'2015-05-07 09:15:20','2015-05-07 06:15:30','2015-07-11','some name','','none.jpg',1,'fixed',2);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu_Item`
--

DROP TABLE IF EXISTS `Menu_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu_Item` (
  `pk_Menu_Item` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Menu` int(11) DEFAULT NULL,
  `fk_item` int(11) DEFAULT NULL,
  `item_type` enum('Dish','BentoBox') DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_Menu_Item`),
  KEY `fk_Menu_Item_1_idx` (`fk_Menu`),
  CONSTRAINT `fk_Menu_Item_1` FOREIGN KEY (`fk_Menu`) REFERENCES `Menu` (`pk_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu_Item`
--

LOCK TABLES `Menu_Item` WRITE;
/*!40000 ALTER TABLE `Menu_Item` DISABLE KEYS */;
INSERT INTO `Menu_Item` VALUES (1,2,1,'Dish','2015-01-08 20:33:53','2015-01-08 21:05:12'),(10,2,1,'Dish','2015-01-08 21:00:53',NULL),(11,2,4,'Dish','2015-01-08 21:00:53',NULL),(44,8,1,'Dish','2015-01-08 20:33:53','2015-01-08 21:05:43'),(45,8,3,'Dish','2015-01-08 20:33:53',NULL),(46,8,4,'Dish','2015-01-08 20:33:53',NULL),(47,8,5,'Dish','2015-01-08 20:33:53',NULL),(48,8,6,'Dish','2015-01-08 20:33:53',NULL),(49,8,9,'Dish','2015-01-08 20:33:53',NULL),(50,8,10,'Dish','2015-01-08 20:33:53',NULL),(51,8,11,'Dish','2015-01-08 20:33:53','2015-01-08 20:37:38'),(83,6,11,NULL,'2015-02-12 23:49:34',NULL),(84,6,10,NULL,'2015-02-12 23:49:34',NULL),(85,6,9,NULL,'2015-02-12 23:49:34',NULL),(86,6,6,NULL,'2015-02-12 23:49:34',NULL),(87,6,1,NULL,'2015-02-12 23:49:34',NULL),(88,6,3,NULL,'2015-02-12 23:49:34',NULL),(89,6,4,NULL,'2015-02-12 23:49:34',NULL),(90,6,5,NULL,'2015-02-12 23:49:34',NULL),(99,5,11,NULL,'2015-02-13 00:10:27',NULL),(100,5,10,NULL,'2015-02-13 00:10:27',NULL),(101,5,9,NULL,'2015-02-13 00:10:27',NULL),(102,5,6,NULL,'2015-02-13 00:10:27',NULL),(103,5,1,NULL,'2015-02-13 00:10:27',NULL),(104,5,3,NULL,'2015-02-13 00:10:27',NULL),(105,5,4,NULL,'2015-02-13 00:10:27',NULL),(106,5,5,NULL,'2015-02-13 00:10:27',NULL),(264,1,11,NULL,'2015-02-21 19:44:23',NULL),(265,1,10,NULL,'2015-02-21 19:44:23',NULL),(266,1,9,NULL,'2015-02-21 19:44:23',NULL),(267,1,6,NULL,'2015-02-21 19:44:23',NULL),(268,1,1,NULL,'2015-02-21 19:44:23',NULL),(269,1,3,NULL,'2015-02-21 19:44:23',NULL),(270,1,4,NULL,'2015-02-21 19:44:23',NULL),(271,1,5,NULL,'2015-02-21 19:44:23',NULL),(513,14,18,NULL,'2015-05-04 21:35:09',NULL),(514,14,11,NULL,'2015-05-04 21:35:09',NULL),(515,14,10,NULL,'2015-05-04 21:35:09',NULL),(516,14,7,NULL,'2015-05-04 21:35:09',NULL),(517,14,8,NULL,'2015-05-04 21:35:09',NULL),(518,14,9,NULL,'2015-05-04 21:35:09',NULL),(519,14,1,NULL,'2015-05-04 21:35:09',NULL),(520,14,6,NULL,'2015-05-04 21:35:09',NULL),(521,14,14,NULL,'2015-05-04 21:35:09',NULL),(522,14,13,NULL,'2015-05-04 21:35:09',NULL),(523,14,2,NULL,'2015-05-04 21:35:09',NULL),(524,14,3,NULL,'2015-05-04 21:35:09',NULL),(525,14,4,NULL,'2015-05-04 21:35:09',NULL),(526,14,16,NULL,'2015-05-04 21:35:09',NULL),(527,14,12,NULL,'2015-05-04 21:35:09',NULL),(528,14,15,NULL,'2015-05-04 21:35:09',NULL),(529,14,5,NULL,'2015-05-04 21:35:09',NULL),(540,7,18,NULL,'2015-05-05 00:10:28',NULL),(541,7,11,NULL,'2015-05-05 00:10:28',NULL),(542,7,10,NULL,'2015-05-05 00:10:28',NULL),(543,7,9,NULL,'2015-05-05 00:10:28',NULL),(544,7,1,NULL,'2015-05-05 00:10:28',NULL),(545,7,6,NULL,'2015-05-05 00:10:28',NULL),(546,7,2,NULL,'2015-05-05 00:10:28',NULL),(547,7,3,NULL,'2015-05-05 00:10:28',NULL),(548,7,4,NULL,'2015-05-05 00:10:28',NULL),(549,7,5,NULL,'2015-05-05 00:10:28',NULL),(577,17,18,NULL,'2015-05-07 06:15:30',NULL),(578,17,11,NULL,'2015-05-07 06:15:30',NULL),(615,4,18,NULL,'2015-06-15 20:52:44',NULL),(616,4,11,NULL,'2015-06-15 20:52:44',NULL),(617,4,10,NULL,'2015-06-15 20:52:44',NULL),(618,4,7,NULL,'2015-06-15 20:52:44',NULL),(619,4,8,NULL,'2015-06-15 20:52:44',NULL),(620,4,9,NULL,'2015-06-15 20:52:44',NULL),(621,4,1,NULL,'2015-06-15 20:52:44',NULL),(622,4,6,NULL,'2015-06-15 20:52:44',NULL),(623,4,14,NULL,'2015-06-15 20:52:44',NULL),(624,4,13,NULL,'2015-06-15 20:52:44',NULL),(625,4,3,NULL,'2015-06-15 20:52:44',NULL),(626,4,4,NULL,'2015-06-15 20:52:44',NULL),(627,4,5,NULL,'2015-06-15 20:52:44',NULL),(735,16,10,NULL,'2015-10-02 04:20:09',NULL),(736,16,7,NULL,'2015-10-02 04:20:09',NULL),(737,16,8,NULL,'2015-10-02 04:20:09',NULL),(738,16,9,NULL,'2015-10-02 04:20:09',NULL),(739,16,1,NULL,'2015-10-02 04:20:09',NULL),(740,16,6,NULL,'2015-10-02 04:20:09',NULL),(741,16,14,NULL,'2015-10-02 04:20:09',NULL),(742,16,13,NULL,'2015-10-02 04:20:09',NULL),(743,16,2,NULL,'2015-10-02 04:20:09',NULL),(744,16,3,NULL,'2015-10-02 04:20:09',NULL);
/*!40000 ALTER TABLE `Menu_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `pk_Order` int(11) NOT NULL AUTO_INCREMENT,
  `fk_User` int(11) DEFAULT NULL,
  `fk_Coupon` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pre_coupon_total` decimal(7,2) DEFAULT NULL,
  `coupon_discount` decimal(7,2) DEFAULT '0.00',
  `notes_for_driver` text,
  `amount` decimal(7,2) DEFAULT NULL,
  `tax` decimal(7,2) DEFAULT NULL,
  `tip` decimal(7,2) DEFAULT NULL,
  `stripe_charge_id` varchar(64) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `long` varchar(45) DEFAULT NULL,
  `fk_PendingOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_Order`),
  KEY `fk_Order_1_idx` (`fk_User`),
  KEY `fk_Order_2_idx` (`fk_Coupon`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,6,NULL,'2015-10-02 04:27:10','2015-10-02 04:27:10',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8UEmZcPNENoG9tJSaeAC','1111','Kearny st.','San Francisco','CA','94133','37.798220','-122.405606',2),(2,6,NULL,'2015-10-02 04:27:14','2015-10-02 04:27:14',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8XEmZcPNENoGIjuhjiTS','1111998883','Kearny st.','San Francisco','CA','94199','37.798220','-122.405606',3),(3,6,NULL,'2015-10-02 04:27:17','2015-10-02 04:27:17',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8aEmZcPNENoGEs0b7dUJ','1111998883','Kearny st.','San Francisco','CA','94199','9937.798220','-99122.405606',4),(4,6,NULL,'2015-10-02 04:27:19','2015-10-02 04:27:19',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8cEmZcPNENoGuNCrmEMQ','','Kearny st.','','CA','94199','37.798220','-122.405606',5),(5,6,NULL,'2015-10-02 04:27:22','2015-10-02 04:27:22',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8fEmZcPNENoGGSDGjuzG','706','Buchanan Street','San Francisco','CA','94102','37.798220','-122.405606',6),(6,2,NULL,'2015-10-02 04:27:26','2015-10-02 04:27:26',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8iEmZcPNENoGcwjS79pi','1111','Kearny st.','San Francisco','CA','94133','37.798220','-122.405606',7),(7,6,NULL,'2015-10-02 04:27:28','2015-10-02 04:27:28',NULL,0.00,NULL,0.00,1.37,2.00,NULL,'1111','Kearny st.','San Francisco','CA','94133','37.798220','-122.405606',8),(8,4,NULL,'2015-10-02 04:27:30','2015-10-02 04:27:30',NULL,0.00,NULL,0.00,1.37,2.00,NULL,'1111','Kearny st.','San Francisco','CA','94133','37.798220','-122.405606',9),(9,6,'1121113370998kkk7','2015-10-02 04:27:34','2015-10-02 04:27:34',NULL,0.00,NULL,15.37,1.37,2.00,'ch_16rL8sEmZcPNENoGhdn479i0','1111','Kearny st.','San Francisco','CA','94133','37.798220','-122.405606',10);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bento`@`localhost`*/ /*!50003 TRIGGER `OrderLog` BEFORE UPDATE ON `Order` FOR EACH ROW

BEGIN  

INSERT INTO `OrderLog` 
select  NULL, t.* 
from `Order` t where pk_Order = OLD.pk_Order;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OrderLog`
--

DROP TABLE IF EXISTS `OrderLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLog` (
  `pk_OrderEvent` int(11) NOT NULL AUTO_INCREMENT,
  `pk_Order` int(11) DEFAULT NULL,
  `fk_User` int(11) DEFAULT NULL,
  `fk_Coupon` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pre_coupon_total` decimal(7,2) DEFAULT NULL,
  `coupon_discount` decimal(7,2) DEFAULT '0.00',
  `notes_for_driver` text,
  `amount` decimal(7,2) DEFAULT NULL,
  `tax` decimal(7,2) DEFAULT NULL,
  `tip` decimal(7,2) DEFAULT NULL,
  `stripe_charge_id` varchar(64) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `long` varchar(45) DEFAULT NULL,
  `fk_PendingOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_OrderEvent`),
  KEY `fk_Order_1_idx` (`fk_User`),
  KEY `fk_Order_2_idx` (`fk_Coupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLog`
--

LOCK TABLES `OrderLog` WRITE;
/*!40000 ALTER TABLE `OrderLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `pk_OrderStatus` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Order` int(11) DEFAULT NULL,
  `fk_Driver` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Open','En Route','Delivered','Cancelled') COLLATE utf8_unicode_ci DEFAULT 'Open',
  `trak_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trak_error_payload` text COLLATE utf8_unicode_ci,
  `trak_error_response` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`pk_OrderStatus`),
  UNIQUE KEY `idx_fk_Order` (`fk_Order`),
  KEY `idx_fk_Driver` (`fk_Driver`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES (1,1,NULL,'2015-10-02 04:27:10','2015-10-02 04:27:12','Open','200',NULL,NULL),(2,2,NULL,'2015-10-02 04:27:14','2015-10-02 04:27:15','Open','200',NULL,NULL),(3,3,NULL,'2015-10-02 04:27:17','2015-10-02 04:27:17','Open','Exception',NULL,NULL),(4,4,NULL,'2015-10-02 04:27:19','2015-10-02 04:27:20','Open','200',NULL,NULL),(5,5,NULL,'2015-10-02 04:27:22','2015-10-02 04:27:23','Open','200',NULL,NULL),(6,6,NULL,'2015-10-02 04:27:26','2015-10-02 04:27:27','Open','200',NULL,NULL),(7,7,NULL,'2015-10-02 04:27:28','2015-10-02 04:27:30','Open','200',NULL,NULL),(8,8,NULL,'2015-10-02 04:27:30','2015-10-02 04:27:32','Open','200',NULL,NULL),(9,9,NULL,'2015-10-02 04:27:34','2015-10-02 04:27:36','Open','200',NULL,NULL);
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bento`@`localhost`*/ /*!50003 TRIGGER `OrderStatusLog` BEFORE UPDATE ON `OrderStatus` FOR EACH ROW

BEGIN  

INSERT INTO `OrderStatusLog` 
select  NULL, t.* 
from `OrderStatus` t where pk_OrderStatus = OLD.pk_OrderStatus;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OrderStatusLog`
--

DROP TABLE IF EXISTS `OrderStatusLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatusLog` (
  `pk_OrderStatusLog` int(11) NOT NULL AUTO_INCREMENT,
  `pk_OrderStatus` int(11) DEFAULT NULL,
  `fk_Order` int(11) DEFAULT NULL,
  `fk_Driver` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Open','En Route','Delivered','Cancelled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `trak_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trak_error_payload` text COLLATE utf8_unicode_ci,
  `trak_error_response` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`pk_OrderStatusLog`),
  KEY `index2` (`fk_Order`),
  KEY `index3` (`fk_Driver`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatusLog`
--

LOCK TABLES `OrderStatusLog` WRITE;
/*!40000 ALTER TABLE `OrderStatusLog` DISABLE KEYS */;
INSERT INTO `OrderStatusLog` VALUES (1,1,1,NULL,'2015-10-02 04:27:10','2015-10-02 04:27:10','Open',NULL,NULL,NULL),(2,2,2,NULL,'2015-10-02 04:27:14','2015-10-02 04:27:14','Open',NULL,NULL,NULL),(3,3,3,NULL,'2015-10-02 04:27:17','2015-10-02 04:27:17','Open',NULL,NULL,NULL),(4,4,4,NULL,'2015-10-02 04:27:19','2015-10-02 04:27:19','Open',NULL,NULL,NULL),(5,5,5,NULL,'2015-10-02 04:27:22','2015-10-02 04:27:22','Open',NULL,NULL,NULL),(6,6,6,NULL,'2015-10-02 04:27:26','2015-10-02 04:27:26','Open',NULL,NULL,NULL),(7,7,7,NULL,'2015-10-02 04:27:28','2015-10-02 04:27:28','Open',NULL,NULL,NULL),(8,8,8,NULL,'2015-10-02 04:27:30','2015-10-02 04:27:30','Open',NULL,NULL,NULL),(9,9,9,NULL,'2015-10-02 04:27:34','2015-10-02 04:27:34','Open',NULL,NULL,NULL);
/*!40000 ALTER TABLE `OrderStatusLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PendingOrder`
--

DROP TABLE IF EXISTS `PendingOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PendingOrder` (
  `pk_PendingOrder` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fk_User` int(11) DEFAULT NULL,
  `fk_Order` int(11) DEFAULT NULL,
  `order_json` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`pk_PendingOrder`),
  KEY `idx_fk_User` (`fk_User`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PendingOrder`
--

LOCK TABLES `PendingOrder` WRITE;
/*!40000 ALTER TABLE `PendingOrder` DISABLE KEYS */;
INSERT INTO `PendingOrder` VALUES (1,'2015-10-02 04:27:09','2015-10-02 04:27:09',NULL,1,NULL,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":\"badToken!\"}}'),(2,'2015-10-02 04:27:10','2015-10-02 04:27:10','2015-10-02 04:27:10',6,1,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]},{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(3,'2015-10-02 04:27:13','2015-10-02 04:27:14','2015-10-02 04:27:14',6,2,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111998883\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94199\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(4,'2015-10-02 04:27:16','2015-10-02 04:27:17','2015-10-02 04:27:17',6,3,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111998883\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94199\"},\"coords\":{\"lat\":\"9937.798220\",\"long\":\"-99122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(5,'2015-10-02 04:27:18','2015-10-02 04:27:19','2015-10-02 04:27:19',6,4,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\",\"name\":\"Soba Noodles with \\\"Chick\'n\\\"\"},{\"id\":2,\"type\":\"side1\",\"name\":\"Soba Noodles with \\\"Chick\'n\\\"\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"\",\"street\":\"Kearny st.\",\"city\":\"\",\"state\":\"CA\",\"zip\":\"94199\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(6,'2015-10-02 04:27:21','2015-10-02 04:27:22','2015-10-02 04:27:22',6,5,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"706\",\"street\":\"Buchanan Street\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94102\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(7,'2015-10-02 04:27:24','2015-10-02 04:27:26','2015-10-02 04:27:26',2,6,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null}}'),(8,'2015-10-02 04:27:28','2015-10-02 04:27:28','2015-10-02 04:27:28',6,7,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"000\"},\"Stripe\":{\"stripeToken\":null}}'),(9,'2015-10-02 04:27:30','2015-10-02 04:27:30','2015-10-02 04:27:30',4,8,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"000\"},\"Stripe\":{\"stripeToken\":null}}'),(10,'2015-10-02 04:27:33','2015-10-02 04:27:34','2015-10-02 04:27:34',6,9,'{\"OrderItems\":[{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]},{\"item_type\":\"CustomerBentoBox\",\"items\":[{\"id\":1,\"type\":\"main\"},{\"id\":2,\"type\":\"side1\"}]}],\"OrderDetails\":{\"address\":{\"number\":\"1111\",\"street\":\"Kearny st.\",\"city\":\"San Francisco\",\"state\":\"CA\",\"zip\":\"94133\"},\"coords\":{\"lat\":\"37.798220\",\"long\":\"-122.405606\"},\"tax_cents\":137,\"tip_cents\":200,\"total_cents\":\"1537\"},\"Stripe\":{\"stripeToken\":null},\"CouponCode\":\"1121113370998kkk7\"}');
/*!40000 ALTER TABLE `PendingOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `pk_User` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_test` tinyint(1) DEFAULT '0',
  `is_admin` tinyint(1) DEFAULT '0',
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL COMMENT 'Token for *our* API.',
  `reg_type` enum('auth','Facebook') DEFAULT 'auth',
  `fb_id` varchar(255) DEFAULT NULL,
  `fb_token` text,
  `fb_profile_pic` varchar(255) DEFAULT NULL,
  `fb_age_range` varchar(45) DEFAULT NULL,
  `fb_gender` varchar(45) DEFAULT NULL,
  `stripe_customer_obj` text,
  `coupon_code` varchar(45) DEFAULT NULL,
  `is_top_customer` tinyint(1) DEFAULT '0',
  `has_ordered` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pk_User`),
  UNIQUE KEY `api_token_UNIQUE` (`api_token`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `coupon_code_UNIQUE` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'2015-01-13 22:44:46','2015-09-28 20:19:37',NULL,'jason+0@bentonow.com',1,1,'Jason','Demant','585-502-7890',NULL,NULL,'456','auth',NULL,NULL,NULL,NULL,NULL,'Tjs=','JASON1',0,1),(2,'2015-01-13 22:44:46','2015-09-02 01:32:12',NULL,'vincent+0@bentonow.com',1,1,'Vincent','Cardillo','585-502-7891','$2y$10$3jxRzEMlfyyzVWinhCNEh.QD.p/k9AZMPSQuf7TpSl7L1JW8mc0UC',NULL,'00123','auth',NULL,NULL,NULL,NULL,NULL,'TzoxNToiU3RyaXBlX0N1c3RvbWVyIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToxNDp7czoyOiJpZCI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjtzOjY6Im9iamVjdCI7czo4OiJjdXN0b21lciI7czo3OiJjcmVhdGVkIjtpOjE0MjIzMzY1ODU7czo4OiJsaXZlbW9kZSI7YjowO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjIxOiJ2Y2FyZGlsbG8rMkBnbWFpbC5jb20iO3M6NToiZW1haWwiO047czoxMDoiZGVsaW5xdWVudCI7YjowO3M6ODoibWV0YWRhdGEiO086MjE6IlN0cmlwZV9BdHRhY2hlZE9iamVjdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6MDp7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMzoic3Vic2NyaXB0aW9ucyI7TzoxMToiU3RyaXBlX0xpc3QiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjU6e3M6Njoib2JqZWN0IjtzOjQ6Imxpc3QiO3M6MTE6InRvdGFsX2NvdW50IjtpOjA7czo4OiJoYXNfbW9yZSI7YjowO3M6MzoidXJsIjtzOjQ2OiIvdjEvY3VzdG9tZXJzL2N1c181YWRCaENYcUtvb0N1ZC9zdWJzY3JpcHRpb25zIjtzOjQ6ImRhdGEiO2E6MDp7fX1zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fXM6ODoiZGlzY291bnQiO047czoxNToiYWNjb3VudF9iYWxhbmNlIjtpOjA7czo4OiJjdXJyZW5jeSI7TjtzOjU6ImNhcmRzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6Mzg6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL2NhcmRzIjtzOjQ6ImRhdGEiO2E6MTp7aTowO086MTE6IlN0cmlwZV9DYXJkIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToyMTp7czoyOiJpZCI7czoyOToiY2FyZF8xNVBSdW1FbVpjUE5FTm9HQkUxMFhuNjgiO3M6Njoib2JqZWN0IjtzOjQ6ImNhcmQiO3M6NToibGFzdDQiO3M6NDoiNDI0MiI7czo1OiJicmFuZCI7czo0OiJWaXNhIjtzOjc6ImZ1bmRpbmciO3M6NjoiY3JlZGl0IjtzOjk6ImV4cF9tb250aCI7aTo4O3M6ODoiZXhwX3llYXIiO2k6MjAxNjtzOjExOiJmaW5nZXJwcmludCI7czoxNjoiMTdxNVlnM1o5SklTUWlWZCI7czo3OiJjb3VudHJ5IjtzOjI6IlVTIjtzOjQ6Im5hbWUiO047czoxMzoiYWRkcmVzc19saW5lMSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUyIjtOO3M6MTI6ImFkZHJlc3NfY2l0eSI7TjtzOjEzOiJhZGRyZXNzX3N0YXRlIjtOO3M6MTE6ImFkZHJlc3NfemlwIjtOO3M6MTU6ImFkZHJlc3NfY291bnRyeSI7TjtzOjk6ImN2Y19jaGVjayI7TjtzOjE5OiJhZGRyZXNzX2xpbmUxX2NoZWNrIjtOO3M6MTc6ImFkZHJlc3NfemlwX2NoZWNrIjtOO3M6MTM6ImR5bmFtaWNfbGFzdDQiO047czo4OiJjdXN0b21lciI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjt9czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX19fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMjoiZGVmYXVsdF9jYXJkIjtzOjI5OiJjYXJkXzE1UFJ1bUVtWmNQTkVOb0dCRTEwWG42OCI7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319','VINCENT1',0,1),(4,'2015-01-16 19:33:35','2015-07-23 21:47:14',NULL,'vcardillo+0@gmail.com',1,0,'Vincent','Cardillo','585-502-7892',NULL,NULL,'789','auth',NULL,NULL,NULL,NULL,NULL,NULL,'VINCENT2',0,1),(5,'2015-01-16 19:33:35','2015-07-23 21:47:14',NULL,'vcardillo+1@gmail.com',1,0,'Vincent T1','Test 1','585-502-7893',NULL,NULL,'102212','auth',NULL,NULL,NULL,NULL,NULL,NULL,'VINCENTT11',0,1),(6,'2015-01-16 19:35:23','2015-10-02 04:27:38',NULL,'vcardillo+2@gmail.com',1,0,'Vincent T2','Test 2','585-502-7804',NULL,NULL,'123','auth','someid2',NULL,NULL,NULL,NULL,'TzoxNToiU3RyaXBlX0N1c3RvbWVyIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToxNDp7czoyOiJpZCI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjtzOjY6Im9iamVjdCI7czo4OiJjdXN0b21lciI7czo3OiJjcmVhdGVkIjtpOjE0MjIzMzY1ODU7czo4OiJsaXZlbW9kZSI7YjowO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjIxOiJ2Y2FyZGlsbG8rMkBnbWFpbC5jb20iO3M6NToiZW1haWwiO047czoxMDoiZGVsaW5xdWVudCI7YjowO3M6ODoibWV0YWRhdGEiO086MjE6IlN0cmlwZV9BdHRhY2hlZE9iamVjdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6MDp7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMzoic3Vic2NyaXB0aW9ucyI7TzoxMToiU3RyaXBlX0xpc3QiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjU6e3M6Njoib2JqZWN0IjtzOjQ6Imxpc3QiO3M6MTE6InRvdGFsX2NvdW50IjtpOjA7czo4OiJoYXNfbW9yZSI7YjowO3M6MzoidXJsIjtzOjQ2OiIvdjEvY3VzdG9tZXJzL2N1c181YWRCaENYcUtvb0N1ZC9zdWJzY3JpcHRpb25zIjtzOjQ6ImRhdGEiO2E6MDp7fX1zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fXM6ODoiZGlzY291bnQiO047czoxNToiYWNjb3VudF9iYWxhbmNlIjtpOjA7czo4OiJjdXJyZW5jeSI7TjtzOjU6ImNhcmRzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6Mzg6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL2NhcmRzIjtzOjQ6ImRhdGEiO2E6MTp7aTowO086MTE6IlN0cmlwZV9DYXJkIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToyMTp7czoyOiJpZCI7czoyOToiY2FyZF8xNVBSdW1FbVpjUE5FTm9HQkUxMFhuNjgiO3M6Njoib2JqZWN0IjtzOjQ6ImNhcmQiO3M6NToibGFzdDQiO3M6NDoiNDI0MiI7czo1OiJicmFuZCI7czo0OiJWaXNhIjtzOjc6ImZ1bmRpbmciO3M6NjoiY3JlZGl0IjtzOjk6ImV4cF9tb250aCI7aTo4O3M6ODoiZXhwX3llYXIiO2k6MjAxNjtzOjExOiJmaW5nZXJwcmludCI7czoxNjoiMTdxNVlnM1o5SklTUWlWZCI7czo3OiJjb3VudHJ5IjtzOjI6IlVTIjtzOjQ6Im5hbWUiO047czoxMzoiYWRkcmVzc19saW5lMSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUyIjtOO3M6MTI6ImFkZHJlc3NfY2l0eSI7TjtzOjEzOiJhZGRyZXNzX3N0YXRlIjtOO3M6MTE6ImFkZHJlc3NfemlwIjtOO3M6MTU6ImFkZHJlc3NfY291bnRyeSI7TjtzOjk6ImN2Y19jaGVjayI7TjtzOjE5OiJhZGRyZXNzX2xpbmUxX2NoZWNrIjtOO3M6MTc6ImFkZHJlc3NfemlwX2NoZWNrIjtOO3M6MTM6ImR5bmFtaWNfbGFzdDQiO047czo4OiJjdXN0b21lciI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjt9czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX19fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMjoiZGVmYXVsdF9jYXJkIjtzOjI5OiJjYXJkXzE1UFJ1bUVtWmNQTkVOb0dCRTEwWG42OCI7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319','VINCENTT21',1,1),(7,'2015-01-16 19:37:05','2015-07-23 21:47:14',NULL,'vcardillo+nullpass@gmail.com',1,0,'Vincent T3','Test 3','585-502-7895',NULL,NULL,'08764','auth',NULL,NULL,NULL,NULL,NULL,NULL,'VINCENTT31',0,1),(8,'2015-01-20 09:19:21','2015-07-23 21:47:14',NULL,'vincent+2@bentonow.com',1,0,'John J.','Smith','415-123-5678',NULL,NULL,'$2y$10$btg4HRn1o7f4VqOq8EuIjuiRGW.KTgpDVyFE9jNL8s22N2Kq5Yyli','auth',NULL,NULL,NULL,NULL,NULL,NULL,'JOHNJ1',0,1),(9,'2015-01-20 09:19:41','2015-09-28 21:10:54',NULL,'vincent+3@bentonow.com',1,0,'John J.','Smith','585-123-7889',NULL,NULL,'$2y$10$71q7rLoNK5EGl0ADcO5kq.m2/W/PoHKcDXlZ99FxEhtz4tf3cMKae','Facebook','10101199060609965','eyJpdiI6ImFYY3lJeFdUeU5ianVTSytrVEZnR1E9PSIsInZhbHVlIjoiNVJSQ2JVWjJ6Y3c1MVZTNDBrNVc1VTFmUlBQOW5Mc09sK1ZJbXhtVkpheDBWdEZrblJhcEN2cDVLY054Z3I4SEFPa1JjQTdKVXR0cit5Vkx5dmd6VVFFMDNcLzlFTUxXcm1XQmxxRWxCalNMNThjdnhkenVOb2RBUkhIc0tSN29ibUpZbUgxVE9RblUwRjVybDZReWpONFFHa1hadTBcL0hGSXJQRjg0UDE2VUV1Z290QUsrV3RwNmRKQTROeVprU0FrUXFYSGt5S0pIbndxa0p1c2lENUh5T1BWbEZyWm1ka3hWeTY2eGVsMlZnSndwSEpcL3NabURzRDZ4cm53TlJDdWZzeDlkK1Jmem1VVkxadk9uQWVYYTVtTENKUXVWdzc2M3dYblpPYTdvS0dWeHNQUjM2WjZ0S29OT0RlbEdMa1ciLCJtYWMiOiI2NWVhNWQwODYyMzA2NWI1NWZmOGNkOTkwY2M3N2JjNjI3NWQ2NjQ3MjlmYTMzZmU5NGE3YzM3YjRlY2E1MDRmIn0=',NULL,NULL,NULL,NULL,'JOHNJ2',0,1),(10,'2015-01-20 09:32:52','2015-10-02 04:27:37',NULL,'vincent+4@bentonow.com',1,0,'John','Smith','555-123-4567',NULL,NULL,'$2y$10$Fl.lV3V.5HtPEFM426dUMunXY6KW4DQ.BrNBkMP44NuvWOMnMgi56','Facebook','10101199060609965','eyJpdiI6InRFQkN0MFkzcE82RUxkOUVHQWtlNmc9PSIsInZhbHVlIjoiQVZUbXRpT2NUQUFHckM4VTY3K2hoWTllRGhmVlhRdThhQklydWRsbzVhUT0iLCJtYWMiOiJkNDViYmUzZmJlN2JkNDU4YWYzYjExYTA1ZTRjM2U2ODUyZmY0ZTJiNGJhYjY3Y2I4ODM2OGQ4MTY1ZWQ4Mzg4In0=','http://profilepic.jpg',NULL,NULL,NULL,'JOHN1',0,1),(11,'2015-01-20 09:50:55','2015-10-02 04:27:38',NULL,'vincent+5@bentonow.com',1,0,'John J.','Smith','555-123-4567','$2y$10$dWJQlVhpayAwAPyCvsCeBuNowVwvwbduUBI/lXRnAc2uS83v2jJx2',NULL,'$2y$10$KP55bkv3dVkW1OOzI0UGtOr6082UuGmBGDk9iy3WwUZzj6onQOXpO','auth',NULL,NULL,NULL,NULL,NULL,'TzoxNToiU3RyaXBlX0N1c3RvbWVyIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToxNDp7czoyOiJpZCI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjtzOjY6Im9iamVjdCI7czo4OiJjdXN0b21lciI7czo3OiJjcmVhdGVkIjtpOjE0MjIzMzY1ODU7czo4OiJsaXZlbW9kZSI7YjowO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjIxOiJ2Y2FyZGlsbG8rMkBnbWFpbC5jb20iO3M6NToiZW1haWwiO047czoxMDoiZGVsaW5xdWVudCI7YjowO3M6ODoibWV0YWRhdGEiO086MjE6IlN0cmlwZV9BdHRhY2hlZE9iamVjdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6MDp7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMzoic3Vic2NyaXB0aW9ucyI7TzoxMToiU3RyaXBlX0xpc3QiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjU6e3M6Njoib2JqZWN0IjtzOjQ6Imxpc3QiO3M6MTE6InRvdGFsX2NvdW50IjtpOjA7czo4OiJoYXNfbW9yZSI7YjowO3M6MzoidXJsIjtzOjQ2OiIvdjEvY3VzdG9tZXJzL2N1c181YWRCaENYcUtvb0N1ZC9zdWJzY3JpcHRpb25zIjtzOjQ6ImRhdGEiO2E6MDp7fX1zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fXM6ODoiZGlzY291bnQiO047czoxNToiYWNjb3VudF9iYWxhbmNlIjtpOjA7czo4OiJjdXJyZW5jeSI7TjtzOjU6ImNhcmRzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6Mzg6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL2NhcmRzIjtzOjQ6ImRhdGEiO2E6MTp7aTowO086MTE6IlN0cmlwZV9DYXJkIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToyMTp7czoyOiJpZCI7czoyOToiY2FyZF8xNVBSdW1FbVpjUE5FTm9HQkUxMFhuNjgiO3M6Njoib2JqZWN0IjtzOjQ6ImNhcmQiO3M6NToibGFzdDQiO3M6NDoiNDI0MiI7czo1OiJicmFuZCI7czo0OiJWaXNhIjtzOjc6ImZ1bmRpbmciO3M6NjoiY3JlZGl0IjtzOjk6ImV4cF9tb250aCI7aTo4O3M6ODoiZXhwX3llYXIiO2k6MjAxNjtzOjExOiJmaW5nZXJwcmludCI7czoxNjoiMTdxNVlnM1o5SklTUWlWZCI7czo3OiJjb3VudHJ5IjtzOjI6IlVTIjtzOjQ6Im5hbWUiO047czoxMzoiYWRkcmVzc19saW5lMSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUyIjtOO3M6MTI6ImFkZHJlc3NfY2l0eSI7TjtzOjEzOiJhZGRyZXNzX3N0YXRlIjtOO3M6MTE6ImFkZHJlc3NfemlwIjtOO3M6MTU6ImFkZHJlc3NfY291bnRyeSI7TjtzOjk6ImN2Y19jaGVjayI7TjtzOjE5OiJhZGRyZXNzX2xpbmUxX2NoZWNrIjtOO3M6MTc6ImFkZHJlc3NfemlwX2NoZWNrIjtOO3M6MTM6ImR5bmFtaWNfbGFzdDQiO047czo4OiJjdXN0b21lciI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjt9czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX19fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMjoiZGVmYXVsdF9jYXJkIjtzOjI5OiJjYXJkXzE1UFJ1bUVtWmNQTkVOb0dCRTEwWG42OCI7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319','JOHNJ3',0,1),(56,'2015-01-20 09:32:52','2015-10-02 04:27:37',NULL,'vincent+6@bentonow.com',1,0,'John','Smith','555-123-4567',NULL,NULL,'$2y$10$gz5vx/G6dJpkApVAVdQaC.qdbkUhiOsN1obfKymVsbznLusPCJEyW','Facebook','10101199060609965','eyJpdiI6InRFQkN0MFkzcE82RUxkOUVHQWtlNmc9PSIsInZhbHVlIjoiQVZUbXRpT2NUQUFHckM4VTY3K2hoWTllRGhmVlhRdThhQklydWRsbzVhUT0iLCJtYWMiOiJkNDViYmUzZmJlN2JkNDU4YWYzYjExYTA1ZTRjM2U2ODUyZmY0ZTJiNGJhYjY3Y2I4ODM2OGQ4MTY1ZWQ4Mzg4In0=','http://profilepic.jpg',NULL,NULL,'TzoxNToiU3RyaXBlX0N1c3RvbWVyIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToxNDp7czoyOiJpZCI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjtzOjY6Im9iamVjdCI7czo4OiJjdXN0b21lciI7czo3OiJjcmVhdGVkIjtpOjE0MjIzMzY1ODU7czo4OiJsaXZlbW9kZSI7YjowO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjIxOiJ2Y2FyZGlsbG8rMkBnbWFpbC5jb20iO3M6NToiZW1haWwiO047czoxMDoiZGVsaW5xdWVudCI7YjowO3M6ODoibWV0YWRhdGEiO086MjE6IlN0cmlwZV9BdHRhY2hlZE9iamVjdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6MDp7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMzoic3Vic2NyaXB0aW9ucyI7TzoxMToiU3RyaXBlX0xpc3QiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjU6e3M6Njoib2JqZWN0IjtzOjQ6Imxpc3QiO3M6MTE6InRvdGFsX2NvdW50IjtpOjA7czo4OiJoYXNfbW9yZSI7YjowO3M6MzoidXJsIjtzOjQ2OiIvdjEvY3VzdG9tZXJzL2N1c181YWRCaENYcUtvb0N1ZC9zdWJzY3JpcHRpb25zIjtzOjQ6ImRhdGEiO2E6MDp7fX1zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fXM6ODoiZGlzY291bnQiO047czoxNToiYWNjb3VudF9iYWxhbmNlIjtpOjA7czo4OiJjdXJyZW5jeSI7TjtzOjU6ImNhcmRzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6Mzg6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL2NhcmRzIjtzOjQ6ImRhdGEiO2E6MTp7aTowO086MTE6IlN0cmlwZV9DYXJkIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToyMTp7czoyOiJpZCI7czoyOToiY2FyZF8xNVBSdW1FbVpjUE5FTm9HQkUxMFhuNjgiO3M6Njoib2JqZWN0IjtzOjQ6ImNhcmQiO3M6NToibGFzdDQiO3M6NDoiNDI0MiI7czo1OiJicmFuZCI7czo0OiJWaXNhIjtzOjc6ImZ1bmRpbmciO3M6NjoiY3JlZGl0IjtzOjk6ImV4cF9tb250aCI7aTo4O3M6ODoiZXhwX3llYXIiO2k6MjAxNjtzOjExOiJmaW5nZXJwcmludCI7czoxNjoiMTdxNVlnM1o5SklTUWlWZCI7czo3OiJjb3VudHJ5IjtzOjI6IlVTIjtzOjQ6Im5hbWUiO047czoxMzoiYWRkcmVzc19saW5lMSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUyIjtOO3M6MTI6ImFkZHJlc3NfY2l0eSI7TjtzOjEzOiJhZGRyZXNzX3N0YXRlIjtOO3M6MTE6ImFkZHJlc3NfemlwIjtOO3M6MTU6ImFkZHJlc3NfY291bnRyeSI7TjtzOjk6ImN2Y19jaGVjayI7TjtzOjE5OiJhZGRyZXNzX2xpbmUxX2NoZWNrIjtOO3M6MTc6ImFkZHJlc3NfemlwX2NoZWNrIjtOO3M6MTM6ImR5bmFtaWNfbGFzdDQiO047czo4OiJjdXN0b21lciI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjt9czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX19fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMjoiZGVmYXVsdF9jYXJkIjtzOjI5OiJjYXJkXzE1UFJ1bUVtWmNQTkVOb0dCRTEwWG42OCI7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319','JOHN2',0,1),(63,'2015-02-26 22:07:13','2015-07-23 21:47:14',NULL,'vincent+7@bentonow.com',1,0,'Vincent','C',NULL,NULL,NULL,'123.1','auth',NULL,NULL,NULL,NULL,NULL,'TzoxNToiU3RyaXBlX0N1c3RvbWVyIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToxNjp7czoyOiJpZCI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjtzOjY6Im9iamVjdCI7czo4OiJjdXN0b21lciI7czo3OiJjcmVhdGVkIjtpOjE0MjIzMzY1ODU7czo4OiJsaXZlbW9kZSI7YjowO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjIxOiJ2Y2FyZGlsbG8rMkBnbWFpbC5jb20iO3M6NToiZW1haWwiO047czoxMDoiZGVsaW5xdWVudCI7YjowO3M6ODoibWV0YWRhdGEiO086MjE6IlN0cmlwZV9BdHRhY2hlZE9iamVjdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6MDp7fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMzoic3Vic2NyaXB0aW9ucyI7TzoxMToiU3RyaXBlX0xpc3QiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjU6e3M6Njoib2JqZWN0IjtzOjQ6Imxpc3QiO3M6MTE6InRvdGFsX2NvdW50IjtpOjA7czo4OiJoYXNfbW9yZSI7YjowO3M6MzoidXJsIjtzOjQ2OiIvdjEvY3VzdG9tZXJzL2N1c181YWRCaENYcUtvb0N1ZC9zdWJzY3JpcHRpb25zIjtzOjQ6ImRhdGEiO2E6MDp7fX1zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fXM6ODoiZGlzY291bnQiO047czoxNToiYWNjb3VudF9iYWxhbmNlIjtpOjA7czo4OiJjdXJyZW5jeSI7TjtzOjU6ImNhcmRzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6Mzg6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL2NhcmRzIjtzOjQ6ImRhdGEiO2E6MTp7aTowO086MTE6IlN0cmlwZV9DYXJkIjo1OntzOjEwOiIAKgBfYXBpS2V5IjtzOjMyOiJza190ZXN0X0dLZFZFY1p5YVgxSmhyNzd4MVdLOVNJdyI7czoxMDoiACoAX3ZhbHVlcyI7YToyMTp7czoyOiJpZCI7czoyOToiY2FyZF8xNWFhQ3pFbVpjUE5FTm9HZENTcXphMXciO3M6Njoib2JqZWN0IjtzOjQ6ImNhcmQiO3M6NToibGFzdDQiO3M6NDoiNDI0MiI7czo1OiJicmFuZCI7czo0OiJWaXNhIjtzOjc6ImZ1bmRpbmciO3M6NjoiY3JlZGl0IjtzOjk6ImV4cF9tb250aCI7aTo4O3M6ODoiZXhwX3llYXIiO2k6MjAxNjtzOjExOiJmaW5nZXJwcmludCI7czoxNjoiMTdxNVlnM1o5SklTUWlWZCI7czo3OiJjb3VudHJ5IjtzOjI6IlVTIjtzOjQ6Im5hbWUiO047czoxMzoiYWRkcmVzc19saW5lMSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUyIjtOO3M6MTI6ImFkZHJlc3NfY2l0eSI7TjtzOjEzOiJhZGRyZXNzX3N0YXRlIjtOO3M6MTE6ImFkZHJlc3NfemlwIjtOO3M6MTU6ImFkZHJlc3NfY291bnRyeSI7TjtzOjk6ImN2Y19jaGVjayI7TjtzOjE5OiJhZGRyZXNzX2xpbmUxX2NoZWNrIjtOO3M6MTc6ImFkZHJlc3NfemlwX2NoZWNrIjtOO3M6MTM6ImR5bmFtaWNfbGFzdDQiO047czo4OiJjdXN0b21lciI7czoxODoiY3VzXzVhZEJoQ1hxS29vQ3VkIjt9czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX19fXM6MTc6IgAqAF91bnNhdmVkVmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfdHJhbnNpZW50VmFsdWVzIjtPOjE1OiJTdHJpcGVfVXRpbF9TZXQiOjE6e3M6MjI6IgBTdHJpcGVfVXRpbF9TZXQAX2VsdHMiO2E6MDp7fX1zOjE5OiIAKgBfcmV0cmlldmVPcHRpb25zIjthOjA6e319czoxMjoiZGVmYXVsdF9jYXJkIjtzOjI5OiJjYXJkXzE1YWFDekVtWmNQTkVOb0dkQ1NxemExdyI7czo3OiJzb3VyY2VzIjtPOjExOiJTdHJpcGVfTGlzdCI6NTp7czoxMDoiACoAX2FwaUtleSI7czozMjoic2tfdGVzdF9HS2RWRWNaeWFYMUpocjc3eDFXSzlTSXciO3M6MTA6IgAqAF92YWx1ZXMiO2E6NTp7czo2OiJvYmplY3QiO3M6NDoibGlzdCI7czoxMToidG90YWxfY291bnQiO2k6MTtzOjg6Imhhc19tb3JlIjtiOjA7czozOiJ1cmwiO3M6NDA6Ii92MS9jdXN0b21lcnMvY3VzXzVhZEJoQ1hxS29vQ3VkL3NvdXJjZXMiO3M6NDoiZGF0YSI7YToxOntpOjA7TzoxMToiU3RyaXBlX0NhcmQiOjU6e3M6MTA6IgAqAF9hcGlLZXkiO3M6MzI6InNrX3Rlc3RfR0tkVkVjWnlhWDFKaHI3N3gxV0s5U0l3IjtzOjEwOiIAKgBfdmFsdWVzIjthOjIxOntzOjI6ImlkIjtzOjI5OiJjYXJkXzE1YWFDekVtWmNQTkVOb0dkQ1NxemExdyI7czo2OiJvYmplY3QiO3M6NDoiY2FyZCI7czo1OiJsYXN0NCI7czo0OiI0MjQyIjtzOjU6ImJyYW5kIjtzOjQ6IlZpc2EiO3M6NzoiZnVuZGluZyI7czo2OiJjcmVkaXQiO3M6OToiZXhwX21vbnRoIjtpOjg7czo4OiJleHBfeWVhciI7aToyMDE2O3M6MTE6ImZpbmdlcnByaW50IjtzOjE2OiIxN3E1WWczWjlKSVNRaVZkIjtzOjc6ImNvdW50cnkiO3M6MjoiVVMiO3M6NDoibmFtZSI7TjtzOjEzOiJhZGRyZXNzX2xpbmUxIjtOO3M6MTM6ImFkZHJlc3NfbGluZTIiO047czoxMjoiYWRkcmVzc19jaXR5IjtOO3M6MTM6ImFkZHJlc3Nfc3RhdGUiO047czoxMToiYWRkcmVzc196aXAiO047czoxNToiYWRkcmVzc19jb3VudHJ5IjtOO3M6OToiY3ZjX2NoZWNrIjtOO3M6MTk6ImFkZHJlc3NfbGluZTFfY2hlY2siO047czoxNzoiYWRkcmVzc196aXBfY2hlY2siO047czoxMzoiZHluYW1pY19sYXN0NCI7TjtzOjg6ImN1c3RvbWVyIjtzOjE4OiJjdXNfNWFkQmhDWHFLb29DdWQiO31zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fX19czoxNzoiACoAX3Vuc2F2ZWRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF90cmFuc2llbnRWYWx1ZXMiO086MTU6IlN0cmlwZV9VdGlsX1NldCI6MTp7czoyMjoiAFN0cmlwZV9VdGlsX1NldABfZWx0cyI7YTowOnt9fXM6MTk6IgAqAF9yZXRyaWV2ZU9wdGlvbnMiO2E6MDp7fX1zOjE0OiJkZWZhdWx0X3NvdXJjZSI7czoyOToiY2FyZF8xNWFhQ3pFbVpjUE5FTm9HZENTcXphMXciO31zOjE3OiIAKgBfdW5zYXZlZFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3RyYW5zaWVudFZhbHVlcyI7TzoxNToiU3RyaXBlX1V0aWxfU2V0IjoxOntzOjIyOiIAU3RyaXBlX1V0aWxfU2V0AF9lbHRzIjthOjA6e319czoxOToiACoAX3JldHJpZXZlT3B0aW9ucyI7YTowOnt9fQ==','VINCENT3',0,1),(64,'2015-03-24 04:23:40','2015-07-23 22:38:19',NULL,'vincent+10@bentonow.com',0,0,'John J.','Smith','555-123-4567','$2y$10$E//DcZ2Wm6w2q4ki/oF7heUBcNqhgKycnmPKgAKKRXvgIETznFzoS',NULL,'$2y$10$zp5JOF/eLIbSCkHTZmxK6.gYPTeLpY/VjpXPEGPhKJR6kuEb6.e8K','auth',NULL,NULL,NULL,NULL,NULL,NULL,'JOHNJ4',0,0),(65,'2015-03-24 04:24:01','2015-07-23 22:38:19',NULL,'vincent+11@bentonow.com',0,0,'Jimmy','','555-123-4567','$2y$10$z91GnafKvxWWPDnYdEHWFeoHEVJ4ada7hqfGr.cMD57Of/58Cu1h6',NULL,'$2y$10$QkiaQ4rngfZTPCIASKnnKeohluwlxHUyEVsg5t7JlDiowDDbkhA4q','auth',NULL,NULL,NULL,NULL,NULL,NULL,'JIMMY1',0,0),(66,'2015-03-24 04:38:48','2015-07-23 22:38:19',NULL,'vincent+12@bentonow.com',0,0,'Jimmy Wimbles','','555-123-4567','$2y$10$0KgAAIZ4dJ8Il3VANDUHwuuWS6LZILJgZT0AcnNDTIrQTr8sI7k.2',NULL,'$2y$10$pTS5TEJy/Wyu1BR9vpMWxOsdSOx17azf47si4uq033nu36AphTcX2','auth',NULL,NULL,NULL,NULL,NULL,NULL,'JIMMYWIMBL1',0,0),(67,'2015-03-24 04:39:12','2015-07-23 22:38:19',NULL,'vincent+13@bentonow.com',0,0,'Jimmy','Wimbles','555-123-4567','$2y$10$vzX2I2de9Wl8LkpiYj8SMeYtKsepMRjKQthNKHvzab773yvVRW06S',NULL,'$2y$10$WvKOF9KHFcGKm7W7ba5raOA0AgZfOpgB4gQHllFLWiuLVljcTr48.','auth',NULL,NULL,NULL,NULL,NULL,NULL,'JIMMY2',0,0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_User`
--

DROP TABLE IF EXISTS `admin_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_User` (
  `pk_admin_User` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pk_admin_User`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_User`
--

LOCK TABLES `admin_User` WRITE;
/*!40000 ALTER TABLE `admin_User` DISABLE KEYS */;
INSERT INTO `admin_User` VALUES (1,'vcardillo','$2y$10$i1g54eZ0UkFYnlqNaIfaLuQc5G47BRQIwN0PBmyL/LESCv9T7Mshy','Vincent'),(2,'testuser','$2y$10$S6BPbdJ/B7LIuWHN6xZQMuFiyXjdxyDk/.Wf3UAhduduPA10HopRO','Test User (mypass)'),(3,'jason','$2y$10$Yd9g7Xo/izOGlP3iE.9BI./hqI7W7fhhzX9VzjmlEaKmQbVhjp/RK','Jason');
/*!40000 ALTER TABLE `admin_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ios_copy`
--

DROP TABLE IF EXISTS `admin_ios_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ios_copy` (
  `pk_admin_ios_copy` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pk_admin_ios_copy`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ios_copy`
--

LOCK TABLES `admin_ios_copy` WRITE;
/*!40000 ALTER TABLE `admin_ios_copy` DISABLE KEYS */;
INSERT INTO `admin_ios_copy` VALUES (1,'about-button','\"GET STARTED\"','text'),(2,'about-item-0','Build your Bento for only $X!','text'),(3,'about-item-1','Choose your main dish.','text'),(4,'about-item-2','Pick your 4 side dishes.','text'),(5,'about-item-3','\'Enter your address. Done.\'','text'),(6,'about-logo','\'bento-about-logo.png\'','image'),(7,'build-add-button','\'ADD ANOTHER BENTO\'','text'),(8,'build-button-1','\'CONTINUE\'','text'),(9,'build-button-2','\'FINALIZE ORDER\'','text'),(10,'build-main','\'+ MAIN DISH\'','text'),(11,'build-main-add-button-1','\'ADD TO BENTO\'','text'),(12,'build-main-add-button-2','\'IN YOUR BENTO\'','text'),(13,'build-main-title','\'Choose Main Dish\'','text'),(14,'build-not-complete-confirmation-1','\'No\'','text'),(15,'build-not-complete-confirmation-2','\'Yes\'','text'),(16,'build-not-complete-text','\'You didn\'t finish your Bento. Should we finish it for you?\'','text'),(17,'build-side-1','\'+ SIDE\'','text'),(18,'build-side-2','\'+ SIDE\'','text'),(19,'build-side-3','\'+ SIDE\'','text'),(20,'build-side-4','\'+ SIDE\'','text'),(21,'build-side-add-button-1','\'ADD TO BENTO\'','text'),(22,'build-side-add-button-2','\'IN YOUR BENTO\'','text'),(23,'build-side-title-1','\'Choose Side Dish\'','text'),(24,'build-side-title-2','\'Choose Side Dish\'','text'),(25,'build-side-title-3','\'Choose Side Dish\'','text'),(26,'build-side-title-4','\'Choose Side Dish\'','text'),(27,'build-title','\'Build Your Bento\'','text'),(28,'closed-button','\'SUBMIT\'','text'),(29,'closed-confirmation-button','\'OK\'','text'),(30,'closed-confirmation-text','\'Thanks! We\'ll let you know when we\'re open.\'','text'),(31,'closed-input-text','\'Enter your email\'','text'),(32,'closed-privacy-policy-link','\'Privacy Policy\'','text'),(33,'closed-terms-link','\'Terms & Conditions\'','text'),(34,'closed-text','\'We\'re open Monday through Thursday 5pm-9pm. Input your email below to get an email reminder when we open.\'','text'),(35,'closed-title','We\'re currently closed!','text'),(36,'complete-add-another','\'ADD ANOTHER BENTO\'','text'),(37,'complete-add-promo','\'ADD PROMO\'','text'),(38,'complete-button','\'LET\'S EAT!\'','text'),(39,'complete-done','\'DONE\'','text'),(40,'complete-edit','\'DELETE\'','text'),(41,'complete-enter-address','\'Enter Address\'','text'),(42,'complete-enter-credit-card','\'Enter Credit Card\'','text'),(43,'complete-promo-button','\'ADD PROMO CODE\'','text'),(44,'complete-promo-cancel','\'CANCEL\'','text'),(45,'complete-promo-discount','\'Promo Discount\'','text'),(46,'complete-promo-input-text','\'Your promo code\'','text'),(47,'complete-promo-invalid-button','\'OK\'','text'),(48,'complete-promo-invalid-text','\'Please try again or use a different code.\'','text'),(49,'complete-promo-invalid-title','\'Invalid Promo Code\'','text'),(50,'complete-remove','\'REMOVE\'','text'),(51,'complete-remove-all-confirmation-1','\'No\'','text'),(52,'complete-remove-all-confirmation-2','\'Yes\'','text'),(53,'complete-remove-all-text','\'Are you sure you want to remove your Bento?\'','text'),(54,'complete-tax','\'Tax\'','text'),(55,'complete-tip','\'Delivery Tip\'','text'),(56,'complete-title','\'Summary\'','text'),(57,'complete-total','\'Total\'','text'),(58,'completed-button','\'BUILD ANOTHER BENTO\'','text'),(59,'completed-image','\'completed-image.png\'','image'),(60,'completed-questions-link','\'Questions or Concerns?\'','text'),(61,'completed-text','\'We\'ll send you text message updates as your delivery heads your way.\'','text'),(62,'completed-title','\'Order Confirmed!\'','text'),(63,'contact-us-button','\'SEND\'','text'),(64,'contact-us-text','\'During open hours we respond in minutes.\'','text'),(65,'contact-us-title','\'Contact Us\'','text'),(66,'credit-card-button','\'CONTINUE TO SUMMARY\'','text'),(67,'credit-card-text','\'A single Bento is only...\'','text'),(68,'credit-card-title','\'Enter Credit Card\'','text'),(69,'delivery-address-button','\'SEARCH\'','text'),(70,'delivery-address-title','\'Delivery Location\'','text'),(71,'delivery-agree','\'I agree to meet my driver curbside.\'','text'),(72,'delivery-agree-confirmation-1','\'Cancel\'','text'),(73,'delivery-agree-confirmation-2','\'I Agree\'','text'),(74,'delivery-agree-message','\'To keep deliveries fast, our driver will meet you at the curb.\'','text'),(75,'delivery-button','\'CONTINUE\'','text'),(76,'delivery-enter-address','\'Enter your delivery address\'','text'),(77,'delivery-title','\'Delivery Location\'','text'),(78,'faq-body','\'http://cdn.bentonow.com/faq.html\'','url'),(79,'faq-button','\'BACK\'','text'),(80,'faq-contact-us-text','\'Questions? Email or call 415.997.9999.\'','text'),(81,'faq-title','\'FAQ\'','text'),(82,'launch-logo','\'bento-launch-logo.png\'','image'),(83,'launch-slogan','\'Healthy Asian Food Delivered in Minutes.\'','text'),(84,'out-of-area-button','\'SEND FREE BENTO COUPON\'','text'),(85,'out-of-area-image','\'delivery-location\'','image'),(86,'out-of-area-input-text','\'Enter your email for a free coupon\'','text'),(87,'out-of-area-middle-title','\'Bummer!\'','text'),(88,'out-of-area-text','\'We don\'t deliver there yet! Available locations are highlighted above. Enter your email below and we\'ll buy you a free Bento when we come to your area.\'','text'),(89,'out-of-area-title','\'Delivery Location\'','text'),(90,'phone-confirmation-button','\'DONE\'','text'),(91,'phone-confirmation-explanation','\'We need your phone number to give you updates on your delivery.\'','text'),(92,'phone-confirmation-privacy-policy-link','\'Privacy Policy\'','text'),(93,'phone-confirmation-terms-link','\'Terms & Conditions\'','text'),(94,'phone-confirmation-title','\'Enter Phone Number\'','text'),(95,'price','12','number'),(96,'privacy-policy-body','\'http://cdn.bentonow.com/legal/privacy-policy.htm\'','url'),(97,'privacy-policy-button','\'BACK\'','text'),(98,'privacy-policy-contact-us-text','\'Questions? Email or call 415.997.9909.\'','text'),(99,'privacy-policy-title','\'Privacy Policy\'','text'),(100,'sign-in-button','\'SIGN IN\'','text'),(101,'sign-in-middle-text','\'OR\'','text'),(102,'sign-in-sign-up-link','\'Sign up\'','text'),(103,'sign-in-sign-up-text','\'Don\'t have an account yet? %.\'','text'),(104,'sign-in-title','\'Sign In\'','text'),(105,'sign-up-button','\'SIGN UP\'','text'),(106,'sign-up-middle-text','\'OR\'','text'),(107,'sign-up-privacy-policy-link','\'Privacy Policy\'','text'),(108,'sign-up-sign-in-link','\'Sign in\'','text'),(109,'sign-up-sign-in-text','\'Already have an account? %.\'','text'),(110,'sign-up-terms-link','\'Terms & Conditions\'','text'),(111,'sign-up-title','\'Sign Up\'','text'),(112,'sold-out-button','\'SEND BENTO COUPON\'','text'),(113,'sold-out-confirmation-button','\'OK\'','text'),(114,'sold-out-confirmation-text','\'Thanks! Your coupon is on its way.\'','text'),(115,'sold-out-input-text','\'Enter your email for a free coupon\'','text'),(116,'sold-out-privacy-policy-link','\'Privacy Policy\'','text'),(117,'sold-out-terms-link','\'Terms & Conditions\'','text'),(118,'sold-out-text','\'We\'re open Monday thru Thursday 5pm-9pm. To make it up, enter your email below and we\'ll send you a 10% coupon off your next order.\'','text'),(119,'sold-out-title','\'Oh no, we sold out!\'','text'),(120,'terms-conditions-body','\'http://cdn.bentonow.com/legal/terms.htm\'','url'),(121,'terms-conditions-button','\'BACK\'','text'),(122,'terms-conditions-contact-us-text','\'Questions? Email or call 415.997.9909.\'','text'),(123,'terms-conditions-title','Terms & Conditions','text'),(124,'title-logo','bento-title-logo.png','image'),(125,'contact-email','\'help@bentonow.com\'','text'),(126,'tax_percent','\'8.75\'','text'),(127,'delivery-agree-error','\'Please tap the checkbox to confirm curbside delivery.\'','text'),(128,'forgot_password_url','https://api.bentonow.com/user/forgotpassword','url'),(129,'closed-sneak-preview-button','See today\'s menu','text'),(130,'closed-main-add-button','Add at 5pm','text'),(131,'closed-sides-add-button','Add at 5pm','text'),(132,'sale_price','12','number'),(133,'closed-text-latenight','See you tomorrow!','text'),(134,'open-line1','Open Monday - Friday','text'),(135,'open-line2','11:00am - 10:00pm','text');
/*!40000 ALTER TABLE `admin_ios_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_User`
--

DROP TABLE IF EXISTS `api_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_User` (
  `pk_api_User` int(11) NOT NULL AUTO_INCREMENT,
  `api_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pk_api_User`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_User`
--

LOCK TABLES `api_User` WRITE;
/*!40000 ALTER TABLE `api_User` DISABLE KEYS */;
INSERT INTO `api_User` VALUES (1,'seva_kjHgbmAq*7@#5_%KLbH','$5y$10$Ldvko.Fby1IhGHl16njuLOIbWlwz9TvMbBjqrph/lJuYIQxqTMyuG.86','seva safris','seva@safris.com'),(2,'vc','123',NULL,NULL);
/*!40000 ALTER TABLE `api_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2015_01_13_014144_create_session_table',1),('2015_03_07_000743_create_password_reminders_table',2),('2015_08_27_192336_create_failed_jobs_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reminders`
--

DROP TABLE IF EXISTS `password_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reminders`
--

LOCK TABLES `password_reminders` WRITE;
/*!40000 ALTER TABLE `password_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('9585f9b88b2fc4397ef1befaaba2ebde8f49343b','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUGdRamFkcjczWGNpQW5NRnJvRmc0bElKZnd1SVZ5MFlOcTZkcmtlMCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE1OiJpc0FkbWluTG9nZ2VkSW4iO2I6MTtzOjk6ImFkbWluVXNlciI7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMzoicGtfYWRtaW5fVXNlciI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjk6InZjYXJkaWxsbyI7czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEwJGkxZzU0ZVowVWtGWW5scU5hSWZhTHVRYzVHNDdCUlFJd04wUEJteUwvTEVTQ3Y5VDdNc2h5IjtzOjQ6Im5hbWUiO3M6NzoiVmluY2VudCI7fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDQzNzU5OTg4O3M6MToiYyI7aToxNDQzNzU5NTU3O3M6MToibCI7czoxOiIwIjt9fQ==',1443759988);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `public` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('buffer_minutes','60',NULL,1),('delivery_price','1.00',NULL,1),('fk_MealType_mode','2','2015-09-25 04:22:36',0),('geofence_order_radius_meters','100',NULL,1),('price','12',NULL,1),('sale_price','12',NULL,1),('serviceArea_dinner','-122.44983680000001,37.8095806,0.0 -122.44335350000001,37.77783170000001,0.0 -122.43567470000002,37.7460824,0.0 -122.37636569999998,37.7490008,0.0 -122.37928390000002,37.78611430000001,0.0 -122.40348819999998,37.8135812,0.0 -122.44983680000001,37.8095806,0.0','2015-05-04 22:05:11',1),('serviceArea_dinner_map','https://a.tiles.mapbox.com/v4/vincent-bentonow-com.m26hh48o/page.html?access_token=pk.eyJ1IjoidmluY2VudC1iZW50b25vdy1jb20iLCJhIjoiV0p2al9qNCJ9.cKufaBUS30xSk7wXxmGuDg#13/37.7806/-122.4180',NULL,1),('serviceArea_lunch','-122.44983680000001,37.8095806,0.0 -122.44335350000001,37.77783170000001,0.0 -122.43567470000002,37.7460824,0.0 -122.37636569999998,37.7490008,0.0 -122.37928390000002,37.78611430000001,0.0 -122.40348819999998,37.8135812,0.0 -122.44983680000001,37.8095806,0.0','2015-05-04 22:05:11',1),('serviceArea_lunch_map','https://a.tiles.mapbox.com/v4/vincent-bentonow-com.m26hh48o/page.html?access_token=pk.eyJ1IjoidmluY2VudC1iZW50b25vdy1jb20iLCJhIjoiV0p2al9qNCJ9.cKufaBUS30xSk7wXxmGuDg#13/37.7806/-122.4180',NULL,1),('status','open','2015-10-02 04:27:28',1),('tax_percent','8.75',NULL,1),('tzName','America/Los_Angeles','2015-05-04 22:05:11',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bento'
--

--
-- Dumping routines for database 'bento'
--
/*!50003 DROP PROCEDURE IF EXISTS `Report_OrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bento`@`%` PROCEDURE `Report_OrderDetails`(IN startDate date, IN endDate date)
BEGIN

DECLARE bDone INT;

DECLARE var1 INT;		-- pk_Box
DECLARE var2 INT;		-- pk_Order
DECLARE var3 timestamp;	-- created_at
DECLARE var4 timestamp;	-- updated_at
DECLARE var5 INT;		-- fk_Main
DECLARE var6 INT;		-- fk_Side1
DECLARE var7 INT;		-- fk_Side2
DECLARE var8 INT;		-- fk_Side3
DECLARE var9 INT;		-- fk_Side4


DECLARE curs CURSOR FOR  
	SELECT * 
    FROM CustomerBentoBox cbb 
    WHERE 
		# Convert from local timestamp to UTC, since that's what the DB and servers store time in
		cbb.created_at >= CONVERT_TZ(CONCAT(startDate, ' 00:00:00'),'America/Los_Angeles','UTC') AND 
        cbb.created_at <= CONVERT_TZ(CONCAT(endDate, ' 23:59:59'),'America/Los_Angeles','UTC')
	;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

DROP TEMPORARY TABLE IF EXISTS tblResults;
CREATE TEMPORARY TABLE tblResults (
	`pk_BentoBox` int,
	`pk_Order` int,
	`UTC_created_at` timestamp,
    `UTC_created_date` date,
    `UTC_created_time` time,
    `Pacific_created_time` timestamp,
	`pk_Dish` int,
	`Dish Type` varchar(25),
    `Dish Name` varchar(60),
	`pk_User` int
);

OPEN curs;

SET bDone = 0;
do_stuff: LOOP

	FETCH curs INTO var1, var2, var3, var4, var5, var6, var7, var8, var9;
    
	IF bDone = 1 THEN -- exit cond. 
	  LEAVE do_stuff;
	END IF;

    #IF whatever_filtering_desired
	  -- here for whatever_transformation_may_be_desired
	INSERT INTO tblResults VALUES (var1, var2, var3, DATE(var3), TIME(var3), CONVERT_TZ(var3,'UTC','America/Los_Angeles'), var5, 
		(select `type` from Dish where pk_Dish = var5), (select `name` from Dish where pk_Dish = var5), (select fk_User from `Order` where pk_Order = var2));
    INSERT INTO tblResults VALUES (var1, var2, var3, DATE(var3), TIME(var3), CONVERT_TZ(var3,'UTC','America/Los_Angeles'), var6, 
		(select `type` from Dish where pk_Dish = var6), (select `name` from Dish where pk_Dish = var6), (select fk_User from `Order` where pk_Order = var2));
	INSERT INTO tblResults VALUES (var1, var2, var3, DATE(var3), TIME(var3), CONVERT_TZ(var3,'UTC','America/Los_Angeles'), var7, 
		(select `type` from Dish where pk_Dish = var7), (select `name` from Dish where pk_Dish = var7), (select fk_User from `Order` where pk_Order = var2));
	INSERT INTO tblResults VALUES (var1, var2, var3, DATE(var3), TIME(var3), CONVERT_TZ(var3,'UTC','America/Los_Angeles'), var8, 
		(select `type` from Dish where pk_Dish = var8), (select `name` from Dish where pk_Dish = var8), (select fk_User from `Order` where pk_Order = var2));
	INSERT INTO tblResults VALUES (var1, var2, var3, DATE(var3), TIME(var3), CONVERT_TZ(var3,'UTC','America/Los_Angeles'), var9, 
		(select `type` from Dish where pk_Dish = var9), (select `name` from Dish where pk_Dish = var9), (select fk_User from `Order` where pk_Order = var2));
    #END IF;
END LOOP do_stuff;

CLOSE curs;

SELECT * FROM tblResults;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-06 18:57:50
