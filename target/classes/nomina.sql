CREATE DATABASE  IF NOT EXISTS `nomina` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nomina`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nomina
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos` (
  `idConcepto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `impuesto` double NOT NULL,
  `tipo` tinytext NOT NULL,
  PRIMARY KEY (`idConcepto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` VALUES (1,'Sal Base',0,'C'),(3,'Cotizacion Comunitaria',11,'D'),(4,'Horas Extras',0,'C');
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestoscomunes`
--

DROP TABLE IF EXISTS `impuestoscomunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impuestoscomunes` (
  `idImpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `descImpuesto` varchar(25) NOT NULL,
  `impPercentual` double NOT NULL,
  PRIMARY KEY (`idImpuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestoscomunes`
--

LOCK TABLES `impuestoscomunes` WRITE;
/*!40000 ALTER TABLE `impuestoscomunes` DISABLE KEYS */;
INSERT INTO `impuestoscomunes` VALUES (995,'Cotizacion Cont Comu',4.7),(996,'Cotizacion Formación',0.1),(997,'Cotización Desempleo',1.6);
/*!40000 ALTER TABLE `impuestoscomunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irpf`
--

DROP TABLE IF EXISTS `irpf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irpf` (
  `idIrpf` int(11) NOT NULL AUTO_INCREMENT,
  `de` double NOT NULL,
  `hasta` double NOT NULL,
  `percentual` double NOT NULL,
  PRIMARY KEY (`idIrpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irpf`
--

LOCK TABLES `irpf` WRITE;
/*!40000 ALTER TABLE `irpf` DISABLE KEYS */;
INSERT INTO `irpf` VALUES (1,0,12450,19),(2,12451,20200,24),(3,20201,35200,30),(4,35201,60000,37),(5,60001,9999999999,45);
/*!40000 ALTER TABLE `irpf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meses`
--

DROP TABLE IF EXISTS `meses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meses` (
  `idMes` int(11) NOT NULL AUTO_INCREMENT,
  `DescMes` varchar(25) NOT NULL,
  PRIMARY KEY (`idMes`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meses`
--

LOCK TABLES `meses` WRITE;
/*!40000 ALTER TABLE `meses` DISABLE KEYS */;
INSERT INTO `meses` VALUES (1,'Enero'),(2,'Febrero'),(3,'Marzo'),(5,'Mayo'),(6,'junio'),(7,'Julio'),(8,'Agosto'),(9,'Septembre'),(10,'Octubre'),(11,'Noviembre'),(12,'Diciembre');
/*!40000 ALTER TABLE `meses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominas`
--

DROP TABLE IF EXISTS `nominas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominas` (
  `idNomina` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `mes` int(5) NOT NULL,
  `idConcepto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idNomina`),
  KEY `fk_Nomina_Usu` (`idUsuario`),
  KEY `fk_Nomina_Concepto` (`idConcepto`),
  CONSTRAINT `fk_NominaConcepto` FOREIGN KEY (`idConcepto`) REFERENCES `conceptos` (`idConcepto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_NominaUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominas`
--

LOCK TABLES `nominas` WRITE;
/*!40000 ALTER TABLE `nominas` DISABLE KEYS */;
INSERT INTO `nominas` VALUES (2,100,3,1,3),(4,1222,1,1,4),(6,1000,2,1,3),(7,300,1,4,4),(8,500,1,4,4),(9,3800,2,1,1),(11,1800,3,1,5),(12,1,1,1,9);
/*!40000 ALTER TABLE `nominas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominasref`
--

DROP TABLE IF EXISTS `nominasref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominasref` (
  `idNominaRef` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `mes` int(5) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idNominaRef`),
  KEY `fk_Nomina_NominaRef` (`idUsuario`),
  CONSTRAINT `fk-Nomina_Ref` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominasref`
--

LOCK TABLES `nominasref` WRITE;
/*!40000 ALTER TABLE `nominasref` DISABLE KEYS */;
INSERT INTO `nominasref` VALUES (1,4,2,3),(2,1222,2,1),(3,1222,1,4),(4,1222,1,4),(5,1000,2,3),(6,3800,2,1),(7,1800,3,5),(8,1,1,9);
/*!40000 ALTER TABLE `nominasref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tipo` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'q','bGF3rkrXD+ntj0qkJuOWSQ==','Uilili','',2),(2,'admin','5oz1wYqTflCzetPKUWdGTA==','Admin','a@a.com',1),(3,'a','bGF3rkrXD+ntj0qkJuOWSQ==','Ray','b@b.com',2),(4,'admin','p1L7TerTCRlqVJvcg8Q86WeQOS0h0enAZPGUU7cEk2U=','Abraham','a@a.com',1),(5,'admin','p1L7TerTCRlqVJvcg8Q86WeQOS0h0enAZPGUU7cEk2U=','Lincon','a@a.com',1),(7,'q','bGF3rkrXD+ntj0qkJuOWSQ==','ruano','ruano@ruano.com',1),(9,'jav','X5FrdbUVb3d5tO15j837ryaeZ0gAJJ6VoW/8JRF+zJ0=','javier javier','jav@javi.com',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nomina'
--

--
-- Dumping routines for database 'nomina'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-09 11:49:43
