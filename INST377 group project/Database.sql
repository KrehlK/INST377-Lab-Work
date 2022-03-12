CREATE DATABASE  IF NOT EXISTS `Dining_Hall_Tracker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Dining_Hall_Tracker`;
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 54.196.33.144    Database: Dining_Hall_Tracker
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `dietary_restrictions`
--

DROP TABLE IF EXISTS `dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietary_restrictions` (
  `restriction_id` int(11) NOT NULL,
  `restriction_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`restriction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietary_restrictions`
--

LOCK TABLES `dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `dietary_restrictions` DISABLE KEYS */;
INSERT INTO `dietary_restrictions` VALUES (1,'vegan'),(2,'vegetarian'),(3,'halal'),(4,'contains milk'),(5,'contains eggs'),(6,'contain soy'),(7,'contains wheat'),(8,'contains tree nuts'),(9,'contains fish');
/*!40000 ALTER TABLE `dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dining_hall`
--

DROP TABLE IF EXISTS `dining_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_hall` (
  `hall_id` int(11) NOT NULL,
  `hall_name` varchar(45) DEFAULT NULL,
  `hall_address` varchar(45) DEFAULT NULL,
  `hall_lat` decimal(10,8) DEFAULT NULL,
  `hall_long` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dining_hall`
--

LOCK TABLES `dining_hall` WRITE;
/*!40000 ALTER TABLE `dining_hall` DISABLE KEYS */;
INSERT INTO `dining_hall` VALUES (1,'The Diner','4121 Farm Dr, College Park, MD 20742',38.99232230,-76.94669450),(2,'South Campus Dining Hall','7093 Preinkert Dr, College Park, MD 20740',38.98317000,-76.94486200),(3,'251 North Dining Hall','3951 Denton Service Ln, College Park, MD 2074',38.993240,-76.94931000);
/*!40000 ALTER TABLE `dining_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall_hours`
--

DROP TABLE IF EXISTS `hall_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall_hours` (
  `hall_hours_id` int(11) NOT NULL,
  `day` varchar(45) DEFAULT NULL,
  `schedule_id` varchar(45) NOT NULL,
  `hall_id` int(11) NOT NULL,
  PRIMARY KEY (`hall_hours_id`),
  KEY `fk_Hall_Hours_Hall_Schedule1_idx` (`schedule_id`),
  KEY `fk_Hall_Hours_Dining_Hall1_idx` (`hall_id`),
  CONSTRAINT `fk_Hall_Hours_Dining_Hall1` FOREIGN KEY (`hall_id`) REFERENCES `dining_hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hall_Hours_Hall_Schedule1` FOREIGN KEY (`schedule_id`) REFERENCES `hall_schedule` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall_hours`
--

LOCK TABLES `hall_hours` WRITE;
/*!40000 ALTER TABLE `hall_hours` DISABLE KEYS */;
INSERT INTO `hall_hours` VALUES (1,'monday','2',2),(2,'tuesday','2',2),(3,'wednesday','2',2),(4,'thursday','2',2),(5,'friday','3',2),(6,'saturday','5',2),(7,'sunday','4',2),(8,'monday','2',1),(9,'tuesday','2',1),(10,'wednesday','2',1),(11,'thursday','2',1),(12,'friday','3',1),(13,'saturday','5',1),(14,'sunday','4',1),(15,'monday','1',3),(16,'tuesday','1',3),(17,'wednesday','1',3),(18,'thursday','1',3),(19,'friday','1',3),(20,'saturday','1',3),(21,'sunday','6',3);
/*!40000 ALTER TABLE `hall_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall_schedule`
--

DROP TABLE IF EXISTS `hall_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall_schedule` (
  `schedule_id` varchar(45) NOT NULL,
  `hours` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall_schedule`
--

LOCK TABLES `hall_schedule` WRITE;
/*!40000 ALTER TABLE `hall_schedule` DISABLE KEYS */;
INSERT INTO `hall_schedule` VALUES ('',''),('1','\"11:00am-8:30pm\"'),('2','\"7:00am-12:00pm\"'),('3','\"7:00am-10:00pm\"'),('4','\"10:00am-12:00pm\"'),('5','\"10:00am-10:00pm\"'),('6','\"closed\"');
/*!40000 ALTER TABLE `hall_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macros`
--

DROP TABLE IF EXISTS `macros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macros` (
  `macro_id` int(11) NOT NULL,
  `calories` double DEFAULT NULL,
  `serving_size` double DEFAULT NULL,
  `cholesterol` int(11) unsigned DEFAULT NULL,
  `sodium` double DEFAULT NULL,
  `carbs` double DEFAULT NULL,
  `protein` double unsigned DEFAULT NULL,
  `meal_id` int(11) NOT NULL,
  `fat` double DEFAULT NULL,
  PRIMARY KEY (`macro_id`),
  UNIQUE KEY `macro_id_UNIQUE` (`macro_id`),
  KEY `fk_Macros_Meals1_idx` (`meal_id`),
  CONSTRAINT `fk_Macros_Meals1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macros`
--

LOCK TABLES `macros` WRITE;
/*!40000 ALTER TABLE `macros` DISABLE KEYS */;
INSERT INTO `macros` VALUES (1,218,20,544,206,1,17,1,16),(2,371,1,0,209,10,5,2,10),(3,430,1,30,111,15,4,3,15),(4,213,1,2,9,32,9,4,23),(5,222,1,0,99,44,13,5,48),(6,231,1,0,1,32,34,6,21),(7,125,1,33,9,34,3,7,39),(8,290,1,34,10,23,6,8,35),(9,233,6,35,0.712,19,14,9,11),(10,374,6,58,1.109,22,66,10,29),(11,742,1,114,1.393,60,38,11,41),(12,330,1,111,0.752,1,27,12,24),(13,785,7,393,1342,72,16,13,48),(14,350,1,0,0.075,45,5,14,15),(15,242,2,45,998,0,15,15,21),(16,100,1,0,0,26,1,16,0),(17,38,1,0,0,9,1,17,0),(18,90,4,0,132,19,3,18,1),(19,231,4,0,591,12,22,19,11),(20,103,4,0,82,18,3,20,2),(21,126,4,0,15,26,3,21,1),(22,211,1,0,482,25,13,22,7),(23,165,4,0,402,26,8,23,5),(24,101,6,0,1310,23,1,24,1),(25,87,6,0,944,17,4,25,1),(26,291,1,2,605,43,10,26,4.6),(27,583,1,63,1772,47,33,27,29),(28,151,3,53,194,7,12,28,8),(29,127,3,0,81,22,9,29,0),(30,343,1,68,623,25,20,30,20),(31,224,6,60,401,14,14,31,14),(32,72,2,23,384,5,11,32,1),(33,172,1,111,439,2,25,33,7),(34,227,2,0,0.55,49,8,34,0),(35,147,3,1,0.052,1,19,35,7),(36,94,1,25,0.457,5,5,36,7),(37,136,1,50,0.482,4,14,37,7),(38,341,4,18,2.16,58,7,38,6),(39,168,1,40,0.826,0,10,39,14),(40,278,1,73,0.444,1,18,40,23),(41,13,2,0,0.045,2,2,41,0),(42,313,1,0,0.676,53,9,42,8),(43,543,1,71,1.036,55,33,43,22),(44,175,1,20,0.333,14,13,44,9),(45,276,1,42,0.646,16,17,45,18),(46,345,5,70,30,10,3,46,34);
/*!40000 ALTER TABLE `macros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_restrictions`
--

DROP TABLE IF EXISTS `meal_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_restrictions` (
  `﻿meal_id` int(11) DEFAULT NULL,
  `restriction_id` int(11) DEFAULT NULL,
  KEY `meal_id_idx` (`﻿meal_id`),
  KEY `restriction_id_idx` (`restriction_id`),
  CONSTRAINT `meal_id` FOREIGN KEY (`﻿meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `restriction_id` FOREIGN KEY (`restriction_id`) REFERENCES `dietary_restrictions` (`restriction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_restrictions`
--

LOCK TABLES `meal_restrictions` WRITE;
/*!40000 ALTER TABLE `meal_restrictions` DISABLE KEYS */;
INSERT INTO `meal_restrictions` VALUES (1,5),(1,6),(1,2),(13,4),(13,5),(13,2),(13,7),(14,2),(14,4),(14,5),(14,7),(14,6),(16,1),(16,2),(17,1),(17,2),(18,1),(18,2),(19,1),(19,2),(19,7),(20,1),(20,2),(21,1),(21,2),(21,6),(22,1),(22,2),(22,6),(22,7),(23,1),(23,2),(23,7),(24,1),(24,2),(24,6),(24,7),(25,7),(25,6),(25,5),(25,2),(25,4),(26,7),(26,2),(26,4),(27,6),(27,7),(27,4),(27,5),(28,4),(28,6),(28,7),(28,9),(29,1),(29,2),(30,2),(30,4),(30,6),(30,7),(31,2),(31,5),(31,4),(31,7),(31,6),(31,3),(32,9),(32,6),(32,7),(33,3),(33,4),(34,1),(34,2),(34,7),(36,4),(36,7),(36,6),(36,2),(37,4),(37,6),(38,7),(38,6),(38,9),(39,6),(40,4),(41,1),(41,2),(42,7),(42,6),(42,1),(42,2),(43,4),(43,7),(44,2),(44,4),(44,5),(44,7),(44,6),(45,4),(45,5),(45,7),(45,6),(46,6),(46,4);
/*!40000 ALTER TABLE `meal_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(60) DEFAULT NULL,
  `meal_category` varchar(45) CHARACTER SET cp1251 DEFAULT NULL,
  PRIMARY KEY (`meal_id`),
  UNIQUE KEY `meal_id_UNIQUE` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'Scrambled Eggs','B'),(2,'French Toast','B'),(3,'Pancakes','B'),(4,'Pork Sausage Link','B'),(5,'Vegan Pancake','B'),(6,'Pepperoni Pizza','L'),(7,'Bowtie Pasta Chicken Peas Mushrooms Herb Oil','L'),(8,'Teriyaki Chicken','L'),(9,'Beef Chili with Beans','L'),(10,'Broccoli Cheddar Cheese Soup','L'),(11,'Buffalo Chicken Quesadilla','D'),(12,'Rotisserie Lemon Pepper Chicken','D'),(13,'Waffles','B'),(14,'Donuts','B'),(15,'Bacon','B'),(16,'Pears','B'),(17,'Peaches Whole','B'),(18,'Roasted Chickpea and Sweet Potatoes','B'),(19,'Apple Sage Sausage with Spinach and Peppers','B'),(20,'Garlic Roasted Tomatoes & Potatoes','B'),(21,'Cinnamon Berry Quinoa','B'),(22,'Chicken Breakfast Tacos','B'),(23,'Blueberry Banana French Toast','B'),(24,'10 Vegetable Soup','L'),(25,'Minestrone Soup','L'),(26,'Fajita Spiced Mushroom Onion Pepper Wrap','L'),(27,'Buffalo Chicken Wrap','L'),(28,'Baked Alfredo Cod Shrimp Casserole','L'),(29,'Roasted Red Pepper Tarragon Lentils','D'),(30,'Cheddar Grilled Cheese Sandwich','D'),(31,'Spicy Peruvian Creamed Chicken','D'),(32,'Ginger Soy Seared Cod','D'),(33,'Grilled Rosemary Thyme Chicken','D'),(34,'Sourdough Bread','L'),(35,'Italian Roast Beef','L'),(36,'Vegetable Shawarma Lavash','L'),(37,'Chicken Shawarma Lavash','L'),(38,'Shanghai Beef','L'),(39,'Grilled Hot Dog','D'),(40,'Cheeseburger with American Cheese','D'),(41,'Spinach','D'),(42,'Plain Tortilla 12','D'),(43,'Philly Beef Steak and Provolone','D'),(44,'Cheese Pizza','D'),(45,'Italian Sausage Pizza','D'),(46,'Spaghetti and Meatballs','D');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals_locations`
--

DROP TABLE IF EXISTS `meals_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals_locations` (
  `hall_id` int(11) NOT NULL,
  `meal_id` int(11) NOT NULL,
  KEY `fk_Dining Hall_has_Meals_Meals1_idx` (`meal_id`),
  KEY `fk_Dining Hall_has_Meals_Dining Hall1_idx` (`hall_id`),
  CONSTRAINT `fk_Dining Hall_has_Meals_Dining Hall1` FOREIGN KEY (`hall_id`) REFERENCES `dining_hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dining Hall_has_Meals_Meals1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals_locations`
--

LOCK TABLES `meals_locations` WRITE;
/*!40000 ALTER TABLE `meals_locations` DISABLE KEYS */;
INSERT INTO `meals_locations` VALUES (1,1),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,28),(1,29),(1,30),(1,31),(1,33),(1,36),(1,37),(1,38),(1,39),(1,41),(1,42),(1,44),(1,45),(1,46),(2,1),(2,9),(2,10),(2,13),(2,14),(2,15),(2,18),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,39),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(3,2),(3,11),(3,19),(3,20),(3,21),(3,23),(3,26),(3,27),(3,30),(3,31),(3,32),(3,34),(3,35),(3,36),(3,37),(3,39),(3,40),(3,41),(3,42),(3,44),(3,45),(3,46);
/*!40000 ALTER TABLE `meals_locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 23:30:54