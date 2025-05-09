/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ap
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `fileId` varchar(255) NOT NULL,
  `grade_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES
(1,'Nabibigyang Kahulugan Ang Konsepto Ng Tradisyon, Pilosopiya, At Relihiyon','10q7vo5DctA6_vWokurkUcOKNp9PRDNmS',7),
(2,'Konsepto ng Asya','1TsWrq9-xD3vhbNltXO-u-K7is5fZ08pI',7),
(3,'Mga Sinaunang Kabihasnan ng Asya','1sNHEeRCcfYwdhlzn8e3GXiddzu7jj2kS',7),
(4,'Sinaunang Pamumuhay ng mga Asyano (Relihiyon)','1EHQy5GLxdt7pokxvWTgofnUptH1zOlJL',7),
(5,'Imperyong Byzantine','1YntLJMyiJKbWylSJmpFRYTjudm7jz1ND',7),
(6,'Heograpiya ng Daigdig','1YCcD47vpE1nzc0NbeDeonEWQo6NEwyLB',8),
(7,'Pamumuhay ng mga Unang Tao sa Daigdig','1EaMQjFOLzKjyOiiNn-w64RYj6hQJJJaT',8),
(8,'Kabihasnang Mesopotamia','1zTimDPtQ96MmXEKDjECwdYtXQBOM1SrT',8),
(9,'Kabihasnang Minoan','12sXCoAOt6txq7HodclVka1TtWcn4rDrB',8),
(10,'Kabihasnang klasiko ng amerika','1BJw3oZ6fn1s3B_9cSLKk3GeKx8TWN5gC',8),
(11,'Pangangailangan at Kagustuhan','1r8XzkWrRQxJA9fdX8VoPqbpSONIFo0Go',9),
(12,'Kakapusan at kakulangan','1Ua_QuwalAF7Kd2AOg7JaBdhNe7ClssFL',9),
(13,'Demand and Supply','1y143ZZV-0ZMksiBgNcZRc_QS4LLjq282',9),
(14,'Implasyon','1xeMVGk_BoNSAk6xhVhGE8OxPyDFknlMY',9),
(15,'Konsepto ng Pagkonsumo','1bOFNbwKuptLlb4khAPCRnfXCQcW8Ed3_',9),
(16,'Globalisasyon','1AGkQnM9VSXpvCzkYUPohmiknuUvf3Svh',10),
(17,'Climate Change','1CK6wOyfrTueCjkcVHpuoxX3Xds1xyLDi',10),
(18,'Unemployment','1DohUZ1lEAXxuo1PFZoI96yeykT9ZcIY5',10),
(19,'Migrasyon','14sR9fAL6fAP3psaeKaOD-bMft51D6Z2P',10),
(20,'Isyu sa Karapatang Pantao','1beVgqT1_f4jPZsPAfw688L3Ncw8Yyghe',10);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('student','teacher') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'teacher','teacher@gmail.com','123','2025-05-06 09:47:30'),
(2,'student','student1@gmail.com','123','2025-05-06 09:47:30'),
(3,'student','student2@gmail.com','123','2025-05-06 09:47:30'),
(4,'student','student3@gmail.com','123','2025-05-06 09:47:30'),
(5,'student','student4@gmail.com','123','2025-05-06 09:47:30'),
(6,'student','student5@gmail.com','123','2025-05-06 09:47:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-09 19:51:30
