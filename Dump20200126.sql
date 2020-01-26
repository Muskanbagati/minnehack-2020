CREATE DATABASE  IF NOT EXISTS `s_mart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `s_mart`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: s_mart
-- ------------------------------------------------------
-- Server version	5.7.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_web`
--

DROP TABLE IF EXISTS `act_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_web` (
  `link` varchar(2048) NOT NULL,
  `act_id` int(11) NOT NULL,
  `gardening` bit(1) NOT NULL,
  `community` bit(1) NOT NULL,
  `donation` bit(1) NOT NULL,
  `awareness` bit(1) NOT NULL,
  `volunteer` bit(1) NOT NULL,
  `reducing_waste` bit(1) NOT NULL,
  PRIMARY KEY (`act_id`),
  UNIQUE KEY `link_UNIQUE` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_web`
--

LOCK TABLES `act_web` WRITE;
/*!40000 ALTER TABLE `act_web` DISABLE KEYS */;
INSERT INTO `act_web` VALUES ('https://www.urbangardensweb.com/',1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('https://blogs.psychcentral.com/your-mind/2014/09/7-simple-ways-you-can-get-involved-in-your-community/',2,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('https://satruck.org/',3,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),('https://www.activesustainability.com/sustainable-development/what-are-the-sustainable-development-goals/',4,_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0'),('https://www.volunteermatch.org/',5,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),('https://www.activesustainability.com/sustainable-life/food-waste-what-is-it-and-how-to-avoid-it/',6,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '');
/*!40000 ALTER TABLE `act_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `userid` int(11) NOT NULL,
  `street_address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  CONSTRAINT `address-user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Mars Court','Athos','MN','55231'),(2,'278 Gweneth Court','Minneapolis','MN','55236'),(3,'123  Vista Lane','Bloomingto','MN','55311');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_link` varchar(2048) NOT NULL,
  `cost` int(11) NOT NULL,
  `carbon_index` int(32) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_link_UNIQUE` (`product_link`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (10,'https://www.yoox.com/us/12432184FJ/item#dept=yooxygen_women&sts=sr_yooxygen_women80&cod10=12432184FJ&sizeId=&sizeName=',81,10),(20,'https://elborneliving.com/product/technique-dress/',83,10),(30,'https://us.davines.com/collections/shampoo/products/love-shampoo',29,20),(40,'https://www.lovegoodly.com/collections/categories/products/100-pure-cocoa-butter-semi-matte-lipstick-in-cactus-bloom',30,20),(50,'https://packagefreeshop.com/collections/gifts-by-interest/products/dog-shampoo-cedarwood-lavender',7,5),(60,'https://lstnsound.com/collections/bluetooth-headphones',180,30),(70,'https://www.target.com/p/organic-sumatra-mandheling-medium-roast-ground-coffee-10oz-archer-farms-8482/-/A-50566951',7,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cat`
--

DROP TABLE IF EXISTS `product_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cat` (
  `pid` int(11) NOT NULL,
  `fashion` bit(1) NOT NULL,
  `beauty` bit(1) NOT NULL,
  `groceries` bit(1) NOT NULL,
  `tech` bit(1) NOT NULL,
  `household` bit(1) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `pid-product` FOREIGN KEY (`pid`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cat`
--

LOCK TABLES `product_cat` WRITE;
/*!40000 ALTER TABLE `product_cat` DISABLE KEYS */;
INSERT INTO `product_cat` VALUES (10,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(20,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(30,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(40,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(50,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary ''),(60,_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(70,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '');
/*!40000 ALTER TABLE `product_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cause`
--

DROP TABLE IF EXISTS `product_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cause` (
  `pid` int(11) NOT NULL,
  `vegan` bit(1) NOT NULL,
  `cruelty_free` bit(1) NOT NULL,
  `recyclable` bit(1) NOT NULL,
  `biodegradable` bit(1) NOT NULL,
  `local_source` bit(1) NOT NULL,
  `fair_trade` bit(1) NOT NULL,
  `package_less` bit(1) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `cause-product` FOREIGN KEY (`pid`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cause`
--

LOCK TABLES `product_cause` WRITE;
/*!40000 ALTER TABLE `product_cause` DISABLE KEYS */;
INSERT INTO `product_cause` VALUES (10,_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0'),(20,_binary '',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0'),(30,_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0'),(40,_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(50,_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary ''),(60,_binary '',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(70,_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `product_cause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `userid` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone_number` bigint(32) DEFAULT NULL,
  `carbon_print` int(11) NOT NULL DEFAULT '0',
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('thuSwag','thuemail@gmail.com',1,'Thu','Tran','F',6236789221,0,'password'),('aramanath','aramanath@gmail.com',2,'Anushri','Ramanath','F',6246567223,0,'abc123'),('hackerGurl','muskan@gmail.com',3,'Muskan','Bagati','F',678123456,0,'maggie');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_act`
--

DROP TABLE IF EXISTS `user_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_act` (
  `userid` int(11) NOT NULL,
  `gardening` bit(1) NOT NULL,
  `community` bit(1) NOT NULL,
  `donation` bit(1) NOT NULL,
  `awareness` bit(1) NOT NULL,
  `volunteer` bit(1) NOT NULL,
  `reducing_waste` bit(1) NOT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `act-user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_act`
--

LOCK TABLES `user_act` WRITE;
/*!40000 ALTER TABLE `user_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cat`
--

DROP TABLE IF EXISTS `user_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cat` (
  `user_id` int(11) NOT NULL,
  `fashion` bit(1) NOT NULL,
  `beauty` bit(1) NOT NULL,
  `groceries` bit(1) NOT NULL,
  `tech` bit(1) NOT NULL,
  `household` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_cat-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cat`
--

LOCK TABLES `user_cat` WRITE;
/*!40000 ALTER TABLE `user_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cause`
--

DROP TABLE IF EXISTS `user_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cause` (
  `user_id` int(11) NOT NULL,
  `vegan` bit(1) NOT NULL,
  `cruelty_free` bit(1) NOT NULL,
  `recyclable` bit(1) NOT NULL,
  `biodegradable` bit(1) NOT NULL,
  `local_source` bit(1) NOT NULL,
  `fair_trade` bit(1) NOT NULL,
  `package_less` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `cause-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cause`
--

LOCK TABLES `user_cause` WRITE;
/*!40000 ALTER TABLE `user_cause` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cause` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-26  3:01:59
