-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: moviers
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie` (
  `영화번호` int(11) NOT NULL,
  `영화명` varchar(45) NOT NULL,
  `연출` float DEFAULT NULL,
  `연기` float DEFAULT NULL,
  `스토리` float DEFAULT NULL,
  `영상미` float DEFAULT NULL,
  `OST` float DEFAULT NULL,
  `평점` float DEFAULT NULL,
  PRIMARY KEY (`영화번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviegenre`
--

DROP TABLE IF EXISTS `moviegenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moviegenre` (
  `번호` int(11) NOT NULL,
  `영화번호` int(11) NOT NULL,
  `장르1` varchar(45) DEFAULT NULL,
  `장르2` varchar(45) DEFAULT NULL,
  `장르3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`번호`),
  KEY `fk_MovieGenre_Movie1_idx` (`영화번호`),
  CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`영화번호`) REFERENCES `movie` (`영화번호`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviegenre`
--

LOCK TABLES `moviegenre` WRITE;
/*!40000 ALTER TABLE `moviegenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviegenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recommendation` (
  `추천번호` int(11) NOT NULL,
  `회원아이디` varchar(15) NOT NULL,
  `영화번호` int(11) NOT NULL,
  PRIMARY KEY (`추천번호`),
  KEY `fk_Recommendation_User_idx` (`회원아이디`),
  KEY `fk_Recommendation_Moive1_idx` (`영화번호`),
  CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`회원아이디`) REFERENCES `user` (`회원아이디`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`영화번호`) REFERENCES `movie` (`영화번호`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `회원아이디` varchar(15) NOT NULL,
  `비밀번호` varchar(15) NOT NULL,
  `이름` varchar(45) NOT NULL,
  `나이` int(11) NOT NULL,
  `성별` varchar(45) NOT NULL,
  PRIMARY KEY (`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('bb','bb','bb',22,'M');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergenre`
--

DROP TABLE IF EXISTS `usergenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usergenre` (
  `번호` int(11) NOT NULL,
  `회원아이디` varchar(15) NOT NULL,
  `장르1` varchar(45) DEFAULT NULL,
  `장르2` varchar(45) DEFAULT NULL,
  `장르3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`번호`),
  KEY `fk_UserGenre_User1_idx` (`회원아이디`),
  CONSTRAINT `usergenre_ibfk_1` FOREIGN KEY (`회원아이디`) REFERENCES `user` (`회원아이디`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergenre`
--

LOCK TABLES `usergenre` WRITE;
/*!40000 ALTER TABLE `usergenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchingpoint`
--

DROP TABLE IF EXISTS `watchingpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `watchingpoint` (
  `번호` int(11) NOT NULL,
  `회원아이디` varchar(15) NOT NULL,
  `관람포인트1` varchar(45) NOT NULL,
  `관람포인트2` varchar(45) NOT NULL,
  `관람포인트3` varchar(45) NOT NULL,
  PRIMARY KEY (`번호`),
  KEY `fk_WatchingPoint_User1_idx` (`회원아이디`),
  CONSTRAINT `watchingpoint_ibfk_1` FOREIGN KEY (`회원아이디`) REFERENCES `user` (`회원아이디`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchingpoint`
--

LOCK TABLES `watchingpoint` WRITE;
/*!40000 ALTER TABLE `watchingpoint` DISABLE KEYS */;
INSERT INTO `watchingpoint` VALUES (3,'bb','스토리');
/*!40000 ALTER TABLE `watchingpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'moviers'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 19:46:42
