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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(45) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_role_idx` (`role_id`),
  CONSTRAINT `pk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2','hoang','2020-11-11','0123111239','hoang1@gmail.com','28 Nguyen Tri Phuong','https://duhochfc.vn/ckfinder/userfiles/images/nguoi-dep-han-quoc-somi.jpg',1,'hoang1','2022-12-27 00:00:00','2023-01-11 15:46:00'),('US1673230059','Mỹ Phước','2015-02-21','0988777544','phuoc@gmail.com','Enim animi et numqu','https://static2.yan.vn/YanNews/2167221/201901/nhung-hot-boy-dinh-dam-ngay-ay-gio-ra-sao-32d28f47.jpg',2,'phuoc','2023-01-09 09:07:39','2023-01-10 09:09:54'),('US1673230571','Mari Moore az a','1981-02-15','0977454102','zecuqisu@mailinator.com','Sit eiusa','https://images.headlines.pw/topnews-2017/imgs/c2/2f/c22f8573ce560782c95bda1229b8b05d.jpg',1,'Pa$$w0rd!!!!','2023-01-09 09:16:11','2023-01-17 09:33:29'),('US1673230871','MacKensie az','2003-09-10','0988444555','fohatiw@mailinator.com','Laudantium aliquam ','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-09 09:21:11','2023-01-13 08:35:52'),('US1673232082','Ethan Langley az','1989-11-22','0977458933','siwuxuqo@mailinator.com','Sit quam eaque commo','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-09 09:41:22','2023-01-13 08:35:59'),('US1673318549','Shafira Davenport','2015-10-05','0977118423','jemusida@mailinator.com','Reprehenderit volupt','image\\a.jpg',2,'Pa$$w0rd!','2023-01-10 09:42:29','2023-01-12 14:42:16'),('US1673515559','Beck Kaufman','1978-01-14','0988123432','semu@mailinator.com','Enim rerum dolor cup','image\\b.jpg',2,'Pa$$w0rd!','2023-01-12 16:25:59',NULL),('US1673516265','Beck Lancaster','1996-06-03','0977545723','dilafuty@mailinator.com','Excepteur eius sunt ','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-12 16:37:45',NULL),('US1673573188','Shelley Blackburn az','1987-09-25','0988454777','becuxas@mailinator.com','Velit in amet dese','image\\b.jpg',2,'Pa$$w0rd!','2023-01-13 08:26:28','2023-01-13 08:36:07'),('US1673573887','Miranda Vargas','1999-09-28','0988333112','buzubo@mailinator.com','Voluptatum nihil a r','https://bedental.vn/wp-content/uploads/2022/11/hot-girl_8-683x1024.jpg',1,'Corporis cumque culp','2023-01-13 08:38:07',NULL),('US1673574003','Raymond Hartman','1972-04-03','0987545454','hifu@mailinator.com','Aliqua Aut eius in ','Debitis doloribus an',1,'Culpa aliqua Atque ','2023-01-13 08:40:03',NULL),('US1673574017','Jordan Haynes','1981-08-12','+1 (516) 228-7273','xusixi@mailinator.com','In dolorem et asperi','Reprehenderit blandi',2,'Est ea quo quae dolo','2023-01-13 08:40:17',NULL),('US1673574105','Brenden Coleman','1976-11-24','+1 (141) 202-9807','jaliqiruky@mailinator.com','Tempora qui voluptat','Quis illum maxime r',1,'Error voluptatibus q','2023-01-13 08:41:45',NULL),('US1673574156','Chaim Mccall','1979-07-27','+1 (423) 752-9415','sykaholasa@mailinator.com','Unde dolore est sit ','Velit illum delect',2,'Elit nulla incidunt','2023-01-13 08:42:36',NULL),('US1673574181','Barrett Rosario','2023-02-08','+1 (823) 485-5147','budiripa@mailinator.com','Eius tempore qui de','Eius magna pariatur',2,'Mollit perspiciatis','2023-01-13 08:43:10',NULL),('US1673757646','Eden Cochran','2007-04-19','0999888444','ryfaq@mailinator.com','Quis distinctio Ull','image\\a.jpg',2,'Pa$$w0rd!','2023-01-15 11:40:46',NULL),('US1673757955','Chava Ramirez','2019-03-21','0988434111','zypifi@mailinator.com','Architecto ullamco p','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 11:45:55',NULL),('US1673758147','Jessica Bell','2023-07-09','0999888545','poxin@mailinator.com','Qui impedit corpori','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 11:49:07',NULL),('US1673758174','Rose Bird','2000-05-05','0999777555','rubas@mailinator.com','Est temporibus id vo','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 11:49:34',NULL),('US1673758790','Shana Glenn','2020-01-20','0999434888','vojaqoten@mailinator.com','Et eos asperiores an','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 11:59:50',NULL),('US1673759101','Troy Padilla','1974-09-01','0988549536','towuge@mailinator.com','Inventore omnis vero','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 12:05:01',NULL),('US1673759386','Isaac Church','1995-09-20','0988999944','sohagu@mailinator.com','Aut minima doloremqu','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-15 12:09:46',NULL),('US1673851163','Melodie Tanner','1999-02-18','0988444111','syqemysyj@mailinator.com','Recusandae Ipsum du','image\\a.jpg',2,'Pa$$w0rd!','2023-01-16 13:39:23',NULL),('US1673851687','Jason Slater','1988-05-05','0999888343','hakosog@mailinator.com','Ut id sit ut delec','image\\avatar.jpg',2,'Pa$$w0rd!','2023-01-16 13:48:07',NULL),('US1673852177','Alexis Prestona','1988-12-12','0989344999','jikebuavofa@mailinator.com','Eum sint animi itaq','https://kenh14cdn.com/2016/hot-girl-boc-lua-kiem-bon-tien-nho-kinh-doanh-thoi-trang-hinh-6-1464720012315.jpg',2,'Tempor occaecat atqu','2023-01-16 13:56:17','2023-01-16 14:16:59'),('US1673879621','Leila Guerrero','2015-07-01','0988419238','zicezi@mailinator.com','Consequuntur veritat','image\\c.jpg',2,'Pa$$w0rd!','2023-01-16 21:33:41',NULL),('US1673919890','Kim Potts','1985-10-10','0988111982','aaazidyr@mailinator.com','In eos exercitation ','https://kenh14cdn.com/2018/3/12/284280581890450050349032121771310886420480n-15208532051191014300699.jpg',2,'Vitae perspiciatis ','2023-01-17 08:44:50','2023-01-17 08:45:17'),('US1673922499','Kimberley Chandler','2018-08-08','0999881822','tawyjejufu@mailinator.com','Veniam voluptatem u','image\\c.jpg',2,'Pa$$w0rd!','2023-01-17 09:28:19',NULL),('US1673922828','Guy Wright','1983-12-26','0999777343','zytawotilu@mailinator.com','In tenetur voluptas ','https://camlo5.com/data/2022/01/chan-dung-em-be.jpg',1,'Est quos et ut omnis','2023-01-17 09:33:48',NULL);
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

-- Dump completed on 2023-01-17 10:00:45
