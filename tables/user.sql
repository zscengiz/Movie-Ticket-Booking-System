-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: mtbs
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin@gmail.com','','admin',1),(2,NULL,'zs@zs.com','zs','zs',2),(3,NULL,'zsc@zsc.com','zsc','zsc',2),(4,NULL,'test@test.com','test','test',2),(5,NULL,'testt@testt.com','testt','testt',2),(6,NULL,'melda@melda.com','zs','melda',2),(7,NULL,'sude@sude.com','sude','sude',2),(8,NULL,'alperencode@gmail.com','alperen','alperen',2),(9,NULL,'a@a.com','ahmet','$2a$10$Y7BlmGBul9nMxsz.d0VKEu4zagiq/2LPAQUCWm3JHfb9hbFUW77ym',2),(10,NULL,'zsaknclksanc+^@com','şğsl///---..,,,\"','$2a$10$HUD/xzN4UScB6TKLK9z.tewRfzy7baZOG924lOhffHqKXEMXKor0i',2),(11,NULL,'aa@gmail.com','şğsl///---..,,,\"','$2a$10$2IDjmXa3BYjwyBeeOyok.eb9xeelF1P0cFVbUH3qKTZAEVJt4lEIO',2),(12,NULL,'a@gmail.com','şğsl///---..,,,\"','$2a$10$OWPIM.4O1w8nOb8C7FGHR.uSiJ3K.ICln/S1mW7LZGsubTvxCHBNu',2),(13,NULL,'sude@gmail.com','sudeşğ-\"\"\"','$2a$10$6eZfzAIV3GoR233feW59R.5SmJSfSGxGFWNaVHhyre9jTxQ6GnyJi',2),(14,NULL,'s@s.com','sude','$2a$10$Fg3NY1TkOn7EthTbQt7N8.sTpNLs8LZl5vqfRqwfV38eQI572tNZi',2),(15,NULL,'z@z.com','z','$2a$10$p1hG4Ubm6CDgel6zoJ8GneyuORKFwQ4mtyXYL1yD2KObjhG4wbRzW',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 23:17:15
