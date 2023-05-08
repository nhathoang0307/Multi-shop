-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: productcase
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` varchar(45) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CU1673229190','Adrienne Carney','wyxode@mailinator.com',85,'Minus laboris volupt','2023-01-09 08:53:10',NULL),('CU1673229228','Kermit Bolton','zogiquzyj@mailinator.com',82,'Numquam sunt sapien','2023-01-09 08:53:48',NULL),('CU1673229995','Amelia Espinoza','gukapipyw@mailinator.com',53,'Delectus magni dolo','2023-01-09 09:06:35',NULL),('CU1673230073','Jaquelyn Dixon','zukywewuty@mailinator.com',4,'Ullam do necessitati','2023-01-09 09:07:53',NULL),('CU1673230360','Aladdin Koch','makyravuv@mailinator.com',24,'Enim odio eaque aute','2023-01-09 09:12:40',NULL),('CU1673230490','Ina Ballard','jilolulyh@mailinator.com',40,'Pariatur Nulla repe','2023-01-09 09:14:50',NULL),('CU1673230536','Ray Mcmillan','cudycax@mailinator.com',59,'Doloribus ex debitis','2023-01-09 09:15:36',NULL),('CU1673230578','Emma Taylor','qekeq@mailinator.com',100,'Elit error eu aut c','2023-01-09 09:16:18',NULL),('CU1673230877','Lana Cooper','gacyd@mailinator.com',50,'Saepe est ea perspi','2023-01-09 09:21:17',NULL),('CU1673231673','Kameko James','vynoc@mailinator.com',57,'Nihil voluptatem Mo','2023-01-09 09:34:33',NULL),('CU1673232002','Judah Benson','lujawow@mailinator.com',15,'Ut incidunt recusan','2023-01-08 09:40:02',NULL),('CU1673232088','Britanni Myers','zefifo@mailinator.com',100,'Qui nisi voluptatem ','2023-01-07 09:41:28',NULL),('CU1673233685','Virginia Patterson','qecocu@mailinator.com',72,'Fugiat enim sunt et','2023-01-07 10:08:05',NULL),('CU1673247115','Kane Wynn','vosed@mailinator.com',14,'Nulla ut nulla dolor','2023-01-07 13:51:55',NULL),('CU1673315704','Haviva Porter','nasewuhaz@mailinator.com',10,'Modi ipsa ut nostru','2023-01-10 08:55:04',NULL),('CU1673318223','Elmo Pratt','beratynor@mailinator.com',5,'Sunt quisquam occaec','2023-01-10 09:37:03',NULL),('CU1673318581','Galvin Newton','woxih@mailinator.com',35,'Quas reprehenderit ','2023-01-10 09:43:01',NULL),('CU1673362641','Daria Banks','tuwokelu@mailinator.com',988123123,'Porro sunt laudantiu','2023-01-10 21:57:21',NULL),('CU1673362756','Rooney Coleman','dilavaxyt@mailinator.com',911999111,'Neque est aliquid mo','2023-01-10 21:59:16',NULL),('CU1673363243','Andrew Stark','leginofaz@mailinator.com',988123123,'Sint aut expedita du','2023-01-10 22:07:23',NULL),('CU1673399719','Orla Booth','hasatyhofa@mailinator.com',977433451,'Blanditiis cillum au','2023-01-11 08:15:19',NULL),('CU1673406755','Karyn Hubbard','mylatufibo@mailinator.com',977434112,'Quas ut iste omnis p','2023-01-11 10:12:35',NULL),('CU1673413377','Orson Wolf','weqydyxad@mailinator.com',988111345,'Irure ullamco consec','2023-01-11 12:02:57',NULL),('CU1673420089','Ursula Sutton','qydacazyhe@mailinator.com',988111222,'Ut quas aliqua Mini','2023-01-11 13:54:49',NULL),('CU1673516333','Ursula Kemp','hesa@mailinator.com',977181232,'Ducimus aperiam vel','2023-01-12 16:38:53',NULL),('CU1673516434','Gillian Griffith','gezejol@mailinator.com',977184232,'In minus vel aliquid','2023-01-12 16:40:34',NULL),('CU1673572976','Anthony Harrell','nadezajasu@mailinator.com',988777333,'Nihil ea voluptate e','2023-01-13 08:22:56',NULL),('CU1673751409','Richard Hartman','gywo@mailinator.com',988411423,'Rerum at id officii','2023-01-15 09:56:49',NULL),('CU1673761130','Jescie Bonner','jofefahax@mailinator.com',999888764,'Ea inventore aute re','2023-01-15 12:38:50',NULL),('CU1673783781','Jolie Jacobs','qemerosa@mailinator.com',988444545,'Atque veritatis simi','2023-01-15 18:56:21',NULL),('CU1673852096','Nash Lowe','micahulohy@mailinator.com',999888999,'Accusamus ea est in ','2023-01-16 13:54:56',NULL),('CU1673853181','Amery Brock','xexihu@mailinator.com',988128441,'Tempore minus eaque','2023-01-16 14:13:01',NULL),('CU1673853283','Laurel Frost','qelawinij@mailinator.com',988474141,'Fugiat totam nesciu','2023-01-16 14:14:43',NULL),('CU1673879675','Amal Perkins','feganyr@mailinator.com',988419123,'Non vitae quia rerum','2023-01-16 21:34:35',NULL),('CU1673922391','Celeste Sears','molus@mailinator.com',988999877,'Unde proident volup','2023-01-17 09:26:31',NULL),('CU1673922589','Sloane Salas','poworo@mailinator.com',999888474,'Aut omnis ut earum d','2023-01-17 09:29:49',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 10:00:45
