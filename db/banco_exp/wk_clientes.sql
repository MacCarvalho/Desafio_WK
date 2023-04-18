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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `CIDADE` varchar(45) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Mateus','Charqueada','SP'),(2,'Augusto','Charqueada','SP'),(3,'Carvalho','Charqueada','SP'),(4,'Jennifer','Charqueada','SP'),(5,'Priscila','Charqueada','SP'),(6,'Tânia','Campinas','SP'),(7,'Oliver Mário da Cruz','Campinas','SP'),(8,'Paulo César Assis','Mogi das Cruzes','SP'),(9,'Aparecida Marina Liz da Conceição','Guarulhos','SP'),(10,'Sophia Marcela Barbosa','Guarulhos','SP'),(11,'Lavínia Vanessa Daiane Pinto','São Bernardo do Campo','SP'),(12,'Thaís Santana Sobrinho','Limeira','SP'),(13,'Elias Beltrão Domingues','Limeira','SP'),(14,'Nayara Paola Caldeira Filho','Piracicaba','SP'),(15,'Andréa Valente Rios','Piracicaba','SP'),(16,'Eloá de Aguiar Sobrinho','Piracicaba','SP'),(17,'Marília Ariane Vieira Sobrinho','Belo Horizonte','MG'),(18,'Lidiane Deverso Jimenes','Belo Horizonte','MG'),(19,'Miranda Salazar','Belo Horizonte','MG'),(20,'Sophia Delatorre Neto','Belo Horizonte','MG'),(21,'Caroline Deverso Sobrinho','Piracicaba','SP');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
