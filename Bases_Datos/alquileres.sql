-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: alquileres
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `automoviles`
--

DROP TABLE IF EXISTS `automoviles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automoviles` (
  `matricula` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `kilometros` int(11) NOT NULL,
  `extras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alquilado` tinyint(4) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automoviles`
--

LOCK TABLES `automoviles` WRITE;
/*!40000 ALTER TABLE `automoviles` DISABLE KEYS */;
INSERT INTO `automoviles` VALUES ('1234JMY','Mercedes','Clase C Coupe 170CV','Negro',165.78,22561,'AUT,TS',0),('1678JCN','Ford','Fiesta','Verde',68.64,9500,'AA,EE,CC,RC,ABS',0),('1732JBS','Seat','Leon','Negro',90.06,2500,'TS,SN',0),('1978JNT','Opel','Corsa','Azul',42.70,45876,'',0),('2058JGF','Seat','Leon','Rojo',93.64,9736,'GPS,SN',1),('2123JTB','Renault','Megane','Amarillo',92.65,34323,'TS,SN',1),('3273JGH','Audi','A4','Rojo',124.20,17368,'AUT,GPS,WIFI',1),('3765JSD','Seat','Ibiza','Rojo',70.56,7683,'SN',0),('4387JDD','Citroen','C3','Verde',62.67,23057,'',0),('4738JBJ','Audi','A3','Amarillo',118.76,8008,'GPS,WIFI,SN',0),('5031JHL','BMW','318 i','Azul',116.45,24796,'GPS,WIFI,SN',0),('5573JFS','Seat','Leon SW','Gris',102.63,28500,'AUT,GPS',1),('5678JRZ','Mercedes','Clase C','Blanco',123.65,7659,'AUT,GPS,SN',0),('6761JYM','Renault','Clio','Blanco',53.62,25672,'SN',0),('7839JDR','Ford','Focus','Blanco',87.62,15873,'GPS,SN',1),('7856JLD','BMW','318 TDI','Azul',121.79,35978,'TS,GPS,SN',0),('8795JTK','Mercedes','GLA','Azul',167.87,46980,'AUT,TS,GPS',1);
/*!40000 ALTER TABLE `automoviles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `dni` char(9) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(25) CHARACTER SET utf8 NOT NULL,
  `nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidad` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `carnet` char(2) CHARACTER SET utf8 NOT NULL,
  `fcarnet` date DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('00371569B','Garcia Martin','Beatriz','Avda. Ilustración, 57','Madrid','B','1993-12-05','1974-01-31'),('00445760C','Flores Jorje','Sandra','C/ La Cañada 28','Madrid','B','1996-10-04','1975-06-02'),('00740365D','Lopez Carvajal','Carlos Javier','C/ Salmoral 28','Madrid','D','1995-08-21','1974-12-11'),('02748375F','Rodriguez','Vanessa','C/ Pinto 25','Madrid','B','2006-04-16','1985-08-03'),('03549358G','Poza Rincón','Ismael','C/ Arroyo, 43','Madrid','C1','2003-04-30','1984-01-16'),('07385709H','Cepeda','Fanny','C/ Antonio Gala, 34','Toledo','B','2007-11-05','1984-01-24'),('07834658J','de la Hoz Gomez','Alicia','C/ García Morato, 21','Madrid','B','2007-06-17','1988-01-12'),('08785691K','Dorado','Mariano','Calle Moratalaz, 5a','Madrid','D','2012-11-14','1994-02-14'),('09856064L','Rodriguez','Anais','C/ Alpujarras, 43','Madrid','B','2002-02-12','1981-02-21'),('11223344M','Garcia Garcia','Noelia','C/ Talavera 19','Toledo','B','2002-10-30','1983-03-13'),('13876715C','Bats Corzo','Soraya','C/ Getafe, 5','Cuenca','B','2003-05-12','1985-04-12'),('23503875P','Coria García','Eva','C/ Felipe IV, 12','Madrid','B','2017-02-12','1998-05-26'),('24589635S','Diaz Vera','Antonio','C/ La Habana, 56','Madrid','B','2016-11-18','1997-12-01'),('28759595T','Ruiz Alonso','Ricardo','C/ Hortaleza, 56','Madrid','B','2000-10-13','1978-11-13'),('37409800V','Sanz Lopez','Reyes','C/ Valdeprado, 37','Madrid','B','1994-09-07','1976-07-01'),('43809540X','Montoya','Natalia','C/ Verona, 3','Toledo','B','2006-10-14','1987-09-15'),('58347695Z','Fuentes Rojas','Ana Belén','C/ Leganés, 79','Toledo','C1','2014-09-01','1995-11-17');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos` (
  `numcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `dnicliente` char(9) COLLATE utf8_spanish_ci NOT NULL,
  `fini` date NOT NULL,
  `ffin` date DEFAULT NULL,
  `kini` int(11) NOT NULL,
  `kfin` int(11) DEFAULT NULL,
  PRIMARY KEY (`numcontrato`),
  KEY `fk_contrato_auto` (`matricula`),
  KEY `fk_contrato_cliente` (`dnicliente`),
  CONSTRAINT `fk_contrato_auto` FOREIGN KEY (`matricula`) REFERENCES `automoviles` (`matricula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`dnicliente`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,'1234JMY','08785691K','2017-12-12','2017-12-19',22200,22561),(2,'7856JLD','07385709H','2017-12-13','2017-12-16',6500,7500),(3,'5573JFS','37409800V','2017-12-15','2017-12-20',26250,28500),(4,'3273JGH','03549358G','2017-12-15','2017-12-22',15380,16250),(5,'3765JSD','58347695Z','2017-12-19','2017-12-24',6850,7683),(6,'1678JCN','24589635S','2017-12-22','2017-12-30',32650,35978),(7,'6761JYM','00371569B','2017-12-24','2017-12-30',21500,25672),(8,'1978JNT','13876715C','2017-12-25','2017-12-26',45650,45876),(9,'2058JGF','09856064L','2017-12-27','2017-12-30',8150,9736),(10,'3273JGH','07834658J','2017-12-27','2018-01-02',16250,17386),(11,'4387JDD','08785691K','2018-01-05','2018-01-09',17386,23057),(12,'8795JTK','00740365D','2018-01-06','2018-01-10',44850,46980),(13,'5678JRZ','58347695Z','2018-01-06','2018-01-08',7500,7659),(14,'5031JHL','23503875P','2018-01-08','2018-01-11',24050,24796),(15,'4738JBJ','02748375F','2018-01-08','2018-01-12',7965,8008),(18,'2058JGf','07385709H','2018-01-08',NULL,9736,NULL),(19,'3273JGH','00740365D','2018-01-09',NULL,17368,NULL),(20,'2123JTB','03549358G','2018-01-09',NULL,34323,NULL),(21,'8795JTK','07834658J','2018-01-10',NULL,46980,NULL);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos2`
--

DROP TABLE IF EXISTS `contratos2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos2` (
  `numcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `dnicliente` char(9) COLLATE utf8_spanish_ci NOT NULL,
  `fini` date NOT NULL,
  `ffin` date DEFAULT NULL,
  `kini` int(11) NOT NULL,
  `kfin` int(11) DEFAULT NULL,
  PRIMARY KEY (`numcontrato`),
  KEY `k_matricula` (`matricula`),
  KEY `k_dni` (`dnicliente`),
  CONSTRAINT `fk_contrato2_automovil` FOREIGN KEY (`matricula`) REFERENCES `automoviles` (`matricula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato2_cliente` FOREIGN KEY (`dnicliente`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos2`
--

LOCK TABLES `contratos2` WRITE;
/*!40000 ALTER TABLE `contratos2` DISABLE KEYS */;
INSERT INTO `contratos2` VALUES (1,'5031JHL','07385709H','2016-12-22','2016-12-25',7260,7500),(2,'7839JDR','00740365D','2017-01-01','2017-01-03',15150,15873),(3,'1978JNT','00740365D','2017-01-01','2017-01-10',18000,18905);
/*!40000 ALTER TABLE `contratos2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-20  7:59:45
