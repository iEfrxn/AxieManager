-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dataxie
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `becado`
--

DROP TABLE IF EXISTS `becado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `becado` (
  `id_beca` int(11) NOT NULL,
  `id_persona` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `total_slp` int(11) DEFAULT 0,
  `copas` int(11) DEFAULT 1200,
  `top` int(11) DEFAULT 0,
  KEY `fk_idBeca` (`id_beca`),
  KEY `fk_cedula` (`id_persona`),
  CONSTRAINT `fk_cedula` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cedula`),
  CONSTRAINT `fk_idBeca` FOREIGN KEY (`id_beca`) REFERENCES `ronin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `becado`
--

LOCK TABLES `becado` WRITE;
/*!40000 ALTER TABLE `becado` DISABLE KEYS */;
INSERT INTO `becado` VALUES
(1,'0954943114',0,1200,0);
/*!40000 ALTER TABLE `becado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `cedula` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(125) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(125) COLLATE utf8mb4_spanish_ci NOT NULL,
  `edad` int(2) NOT NULL,
  `nacionalidad` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contacto` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `depo_ronin` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_ingreso` date DEFAULT current_timestamp(),
  `fecha_salida` date DEFAULT NULL,
  `estado` char(1) COLLATE utf8mb4_spanish_ci DEFAULT 'A',
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES
('0954943112','Daniel','Galarza',16,'Ecuatoriana','0997188086','ronin:77e44a4d265c51751b2db841ea665c6e9bb4ec0b','2022-03-20',NULL,'A'),
('0954943114','Efren','Galarza',19,'Ecuatoriana','0997188086','ronin:77e44a4d265c51751b2db841ea665c6e9bb4ec0a','2022-03-20',NULL,'A');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ronin`
--

DROP TABLE IF EXISTS `ronin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ronin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ronin` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `becado` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `total_slp` int(11) DEFAULT 0,
  `fecha_ingreso` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ronin` (`ronin`),
  KEY `fk_becados` (`becado`),
  CONSTRAINT `fk_becados` FOREIGN KEY (`becado`) REFERENCES `persona` (`cedula`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ronin`
--

LOCK TABLES `ronin` WRITE;
/*!40000 ALTER TABLE `ronin` DISABLE KEYS */;
INSERT INTO `ronin` VALUES
(1,'ronin:470513a86b7f4079802523790d9f28428950e67f',NULL,0,'2022-03-20');
/*!40000 ALTER TABLE `ronin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21 16:57:15
