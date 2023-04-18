-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: wk
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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `PRECO` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Computador',4500),(2,'Micro-ondas Midea MRA_2 prata 20L 127V',750),(3,'Fone de ouvido on-ear JBL',250),(4,'Torneira de cozinha monocomando Pingoo.Casa Gourmet Munim cromado',420),(5,'Kit Cuba Pia Aço Inox Gourmet Carajás Cozinha E Acessórios',353.33),(6,'Batida De Pedra Preto 900ml',29.9),(7,'Kit 6 Folha Lixa Seco Automotiva Grão 320 400 600 Norton',26.9),(8,'Massa Plastica Automotiva Para Reparo De Lataria Parachoque',22.7),(9,'Placa De Gesso Acartonado 120x180',23.5),(10,'3d Gesso Art Revestimento Alto Relevo ',65),(11,'Forma 3d F423 Abs 2 Mm Gesso Cimenticio 3d Ripado 120x30 Cm',150),(12,'Forma 3d Pisante Amadeirado Abs 2 Cm 131x29 Cm',195),(13,'Forma 3d Abs 2 Mm Gesso Cimenticio 3d F309 30,5x51 Cm Pedra',70),(14,'8 Formas Abs 2 Mm Virgem Gesso Cimenticio 3d Tijolinho',65),(15,'Serra Circular Mesa Bancada 250mm 1800w Gysb1800 Hammer',1166.55),(16,'Serra De Esquadria E Bancada 8 Pol. 1200w Schulz',1067),(17,'Saco De Gesso Em Pó Branco Secagem Rápida 5kg Juntalider',29.58),(18,'Kit 10kg Gesso Urso Polar Não Toxico Antigo Gesso Rápido',83.22),(19,'Alicate Amperimetro Digital Com Bolsa1000a Ac Thompson 881 ',82.13),(20,'Escada de alumínio tesoura Mor 5101',135.22);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-20 20:06:50
