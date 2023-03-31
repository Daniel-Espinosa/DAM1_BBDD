-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: concursomusica
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
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `numCancion` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` int(11) NOT NULL,
  `duracion` time NOT NULL,
  `titulo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `total_votos` int(11) DEFAULT '0',
  PRIMARY KEY (`numCancion`),
  KEY `fk_cancion_grupo` (`grupo`),
  CONSTRAINT `fk_cancion_grupo` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`codgrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,1,'00:03:56','Cancion de cuna',0),(2,1,'00:02:57','Cientos y cientos',0),(3,1,'00:02:28','Un sueño',0),(4,1,'00:03:32','Jovenes',0),(5,2,'00:02:44','No gires',0),(6,2,'00:03:42','Calor',0),(7,2,'00:03:37','Ritual',0),(8,2,'00:02:39','Radioactivo',0),(9,5,'00:05:07',' La mujer de verde',0),(10,5,'00:04:01','Qué bien',0),(11,5,'00:03:53','Copacabana',0),(12,5,'00:04:47','Pequeña Gran Revolución',0),(13,3,'00:04:06','Distintos',0),(14,3,'00:04:21','Mejor opción',0),(15,3,'00:03:55','Atraco',0),(16,3,'00:04:27','Un espectro más',0),(17,9,'00:03:10','Accederas',0),(18,7,'00:03:58','Qué electricidad',0),(19,7,'00:03:29','Perseide',0),(20,7,'00:03:42','Groenlandia',0),(21,7,'00:03:47','Monteperdido',0),(22,4,'00:04:06','Ballet Mental',0),(23,4,'00:04:23','Aquitania',0),(24,4,'00:03:34','Te deslizas',0),(25,4,'00:03:53','Tursitas Heridos',0),(26,10,'00:04:30','Rincón exquisito',0),(27,10,'00:04:53','Primera Vez',0),(28,10,'00:05:02','Nivel Inexperto',0),(29,10,'00:06:03','Más Suerte',0),(30,6,'00:05:40','Zona vip',0),(31,6,'00:06:20','Diferentes',0),(32,6,'00:07:30','Tu primero',0),(33,11,'00:02:47','Oso Panda',0),(34,13,'00:03:29','Emborracharme',0),(35,13,'00:03:34','Mi Realidad',0),(36,15,'00:03:32','Palos y piedras',0),(37,15,'00:06:45','Bien por ti',0),(38,14,'00:02:27','Cigarettes',0),(39,14,'00:05:08','Just Like A Wall',0),(40,18,'00:03:12','Autocritica',0),(41,18,'00:03:22','Salvese quien Pueda',0),(42,18,'00:04:01','Copenhague',0),(43,18,'00:02:36','Al Respirar',0),(44,12,'00:04:23','El hombre bolígrafo',0),(45,12,'00:04:36','Polaroid',0),(46,12,'00:03:52','Aspiradora Espacial',0),(47,11,'00:02:46','La chica Vampira',0),(48,17,'00:04:40','Deli',0),(49,17,'00:03:50','Real Love',0),(50,17,'00:04:33','Stay Close',0),(51,17,'00:04:27','Seasun',0),(52,13,'00:05:12','Evolucion',0),(53,13,'00:04:01','El Tiempo Pasará',0),(54,16,'00:02:23','Bailando',0),(55,16,'00:03:41','Todo nos parece una mierda',0),(56,19,'00:04:17','Luz Artificial',0),(57,19,'00:06:33','Melodrama',0),(58,19,'00:03:11','Que Vienen',0),(59,20,'00:04:18','How to Turn Rivers into Alluminium Foil',0),(60,20,'00:04:01','8:24',0),(61,20,'00:05:23','Clouds Factory',0),(62,21,'00:03:15','Hallo',0),(63,21,'00:03:25','Con mi voz',0),(64,22,'00:03:42','El mundo se va a acabar',0),(65,22,'00:03:21','Titubeas',0);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentes`
--

DROP TABLE IF EXISTS `componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentes` (
  `idComp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `alias` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `funcion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `grupo` int(11) NOT NULL,
  PRIMARY KEY (`idComp`),
  KEY `fk_componente_grupo` (`grupo`),
  CONSTRAINT `fk_componente_grupo` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`codgrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` VALUES (1,'Javi','Fernandez',NULL,'Voz principal,piano,guitarra',4),(2,'Jordi ','Navarro',NULL,'Guitarra y electronica',4),(3,'Guille','Mostaza',NULL,'Cantante y guitarra',6),(4,'Santi ','Capote',NULL,'Bajo',6),(5,'Gorka ','Dresbaj',NULL,'Guitarra y Electronica',4),(6,'José ','Tejedor ',NULL,'Bajo',4),(7,'Sel ',' Lee',NULL,'Bateria',4),(8,'Javier','Valencia',NULL,'Voz',3),(9,'Jesús','Gutiérrez',NULL,'Bajo',3),(10,'Jaime','Gutiérrez',NULL,'Bateria',3),(11,'Manu','Jurado',NULL,'Teclado',3),(12,'Enrique','Sanchís','Bubby','Guitarra',3),(14,'Fran','Gomez',NULL,'Voz',9),(33,'Alejandro ','Méndez',NULL,'Guitarra',13),(39,'Sean','Frutos',NULL,'Cantante',10),(40,'Jorge','Guirao',NULL,'Guitarra',10),(41,'Javier','Vox','Javi','Guitarra y teclado',10),(42,'Fernando','Robles','Nando','Bajo',10),(43,'Francisco','Guirao','Fran','Batería',10),(44,'Óscar','Ferrer',NULL,'Vocalista',2),(45,'Aarön','Sáez',NULL,'Guitarra y teclados',2),(46,'Vicente','Llescas',NULL,'Guitarra',2),(52,'Antonio','Lomas',NULL,'Percusión',13),(53,'Miguel ','López',NULL,'Bajo Electrico',13),(54,'Alfredo','Nuñez',NULL,'Batería',13),(55,'Mikel','Izal',NULL,'Voz',5),(56,'Alejandro','Jordá',NULL,'Bateria',5),(57,'Emanuel','Perez',NULL,'Bajo eléctrico',5),(58,'Alberto','Perez',NULL,'Guitarra',5),(59,'Ivan','Mella',NULL,'Teclado',5),(60,'Amancay','Gaztañaga',NULL,'Voz',12),(61,'Eñaut','Gaztañaga',NULL,'Voz y guitarra',12),(62,'Raúl','Olaizola',NULL,'Bajo',12),(64,'Antonio','Diniz',NULL,'Batería',12),(65,'Alejandro','Orbegozo',NULL,'Sintetizadores',12),(66,'Michael','Martin',NULL,'Guitarra',13),(67,'Antonio','Lopez',NULL,'Guitarra',13),(70,'Arbona','Orero','Adria','Cantante',11),(71,'Fandos','Berenguer','Julia','Cantante',11),(72,'Huerta','Plaza','Oscar','Guitarra',11),(73,'Montoya','Barbera','Sonia','Bajo',11),(80,'Chuso','Ruiz','Chusi','Guitarra y coros',9),(81,'Rafa','Val',NULL,'Cantante',15),(82,'Jess ','Fabric',NULL,'Bajo',15),(83,'Alberto ','Cantúa',NULL,'Guitarra',15),(84,'Fernando ','Campillo',NULL,'Bateria',15),(88,'Oliver','Ruiz',NULL,'Bateria',9),(89,'Lourdes','Hernandez','Russian Red','Cantante, Guitarra',14),(90,'Juan Pedro','Marti','pucho','Voz',18),(91,'Igor ','Escudero',NULL,'Guitarra',17),(92,'Guillermo','Astrain',NULL,'Bateria',17),(93,'Unai','Lazcano',NULL,'Bajo',17),(94,'Ekhi','Lopetegui',NULL,'Cantante',17),(95,'David','Garcia','El Indio','Bateria Coros',18),(96,'Alvaro','Baglietto',NULL,'Bajo',18),(97,'Jorge','Gonzalez',NULL,'Percusion',18),(98,'Guillermo','Galvan',NULL,'Guitarra',18),(99,'Carlos ','Sadness',NULL,NULL,7),(101,'Manolo','Martínez','Lolo','voz, guitarra y teclados',16),(102,'Genís','Segarra','Sega','teclados, sintetizadores ',16),(103,'Victor','Cabezuelo',NULL,'Voz',20),(104,'Carlos ','Campos',NULL,'Guitarra',20),(105,'Julia','Martín',NULL,'Batería ',20),(106,'Sara','Oliveira',NULL,'Bajo',20),(107,'Alexander','Rusev',NULL,'Vocalista',19),(108,'Fab','Diaz',NULL,'Bajista',19),(109,'Edu','Argumosa',NULL,'Guitarrista',19),(110,'Deiv','Karanets',NULL,'Bateria',19),(111,'María','Blanco',NULL,'Voz-Guitarra',21),(112,'Txarlie','Solano',NULL,'Bajo-Teclados-Coro',21),(113,'César','Uña',NULL,'Batería',21),(114,'Mar','Álvarez',NULL,'Cantante',22),(115,'Alicia','Álvarez',NULL,'Bateria',22);
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `codgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estilo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `esgrupo` tinyint(1) NOT NULL DEFAULT '1',
  `annoGrab` int(4) DEFAULT NULL,
  `fechaEstreno` date DEFAULT NULL,
  `compania` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codgrupo`),
  KEY `indice_localidad_grupo` (`localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Correos','Guipúzcoa','Indie',1,2009,'2009-01-01','Neo Music Box'),(2,'Varry Brava','Murcia','Pop',1,2005,'2009-02-21','Hook Management'),(3,'FULL','Sevilla','Indie',1,2003,'2009-11-28','Warner Music Spain'),(4,'Cyan','Barcelona','Pop/rock',1,2008,'2008-12-01','BMG'),(5,'IZAL','Madrid','Indie',1,2010,'2015-03-26','Hook Ediciones Musicales'),(6,'Ellos','Madrid','Indie',1,2002,'2002-04-27','Subterfuge records'),(7,'Carlos Sadness','Barcelona','Pop',0,2011,'2011-03-05','Sony Music'),(9,'The noises','Madrid','prock',1,2010,'2010-02-14','Warner Music'),(10,'Second','Murcia','Indie rock',1,2000,'1997-01-27','DRO Atlantic'),(11,'Papa topo','Mallorca','Indie rock',1,2008,'2008-06-23','Elefant records'),(12,'Grises','Guipúzcoa','Indie',1,2009,'2009-10-15','Origami Records'),(13,'Lori Meyers','Loja','Indie',1,2004,'2004-02-15','Universal Music'),(14,'Russian Red','Madrid','Indie Pop',0,2008,'2008-06-20',' Fernando Vacas'),(15,'Viva Suecia','Murcia','Indie',1,2014,'2013-01-01','Paco Román '),(16,'Astrud','Barcelona','Pop',1,1999,'1999-11-20',NULL),(17,'Delorean','País Vasco','Indie pop',1,2000,'2001-09-27','Sony Music'),(18,'Vetusta Morla','Madrid','Indie-Rock',1,2000,'2000-03-02','Pequeño Salto Mortal'),(19,'Kitai','Madrid','Indie',1,2011,'2011-12-02','Remnant Light Studio'),(20,'Rufus T. Firefly','Madrid','Rock alternativo',1,2006,'2006-05-07','Lago naranja records'),(21,'Mäbu','Bilbao','Pop-Rock-Indie-Folk',1,2009,'2010-06-01','Warner Music Group'),(22,'Pauline en la Playa','Asturias','Pop',1,1997,'1997-08-05','Subterfuge Records');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `user` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fechanac` date DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('02Ana','123','Ana','García Herrero','1999-02-06'),('02Elsa','123','Elsa','Frutos Núñez','1989-02-23'),('02Eva','123','Eva','Alvarez Martinez','1991-08-04'),('02Pedro','123','Pedro','Pancorvo Hidalgo','1996-03-03'),('03ez','lol','Francisco','Freire Alonso','1993-07-25'),('03lemon','lol','Arturo','Abrines salas','1993-07-25'),('03pz','lol','Sean','Matthews','1993-07-25'),('03squeezy','lol','Sonia','Rey Ortega','1993-07-25'),('04CarlosLa','1234','Carlos','Labra Mora','1996-02-10'),('05User1','usuario@1','Lourdes ','Hernández González','1995-11-20'),('05User2','usuario@1','Carla','Anton Martinez','1996-12-09'),('05User3','usuario@1','Jonathan','Leon Suárez','1996-03-05'),('05User4','usuario@1','Alfredo','Marco Roura','1993-08-30'),('10agallas','buu','Ágata','Cortés Valverde','1997-01-08'),('10asdffgh','asdfghj','Asumta','Serra Muntaner','1992-12-12'),('10elchupacabras','olabb','Yolanda','Martínez Fernández','1992-12-12'),('10messy10','barÇa','Laura','Gómez Cuenca','1990-01-15'),('10qwert','qwert','Esteban','Rodríguez Santiago','0192-12-12'),('11Epami','EPA','María','Labrador Revuelta','2016-01-12'),('11Eustaquio','aaa','Eustaquio','García García','1990-01-08'),('11Fernando','bbb','Fernando','Fernández Huidobro','1997-01-09'),('11Jorge','jorge','Jorge','Diez Gil','1996-01-07'),('13Antonio','1234','Antonio','Fernandez Montes','1992-05-05'),('13Carlota','4567','Carlota','Revuelta Herrero','1994-05-05'),('13Concepcion','Conchi','Concepcion','Cano Higuera','1980-05-18'),('13Lucia','Cyanide','Lucia','Calderón García','1993-05-25'),('16Ana','vijsje6','Ana Patricia','Fernandez González','1999-05-12'),('16Carlos','hola123','Carlos','Labrador Amieva','1996-07-08'),('16Victor','kiakarens2016','Victor','Bolado Suárez','1996-01-09'),('16Yeray','yer96','Yeray','Peña Sisniega','1996-09-11'),('17Campillo','usuario','Fernando ','Campillo Jiménez','1990-07-25'),('17Cantua','usuario','Alberto ','Cantúa Vitienes','1990-12-12'),('17Fabric','usuario','Joshua','Benítez Díaz','1990-03-11'),('17Val','usuario','Rafael','Val Mora','1990-05-03'),('18Dana','9876','Diana','Marín Lavín','1996-02-01'),('18Gama','9876','Gema','López Villegas','1982-09-09'),('18Rana','9876','Raquel','Martín Alba','1988-04-04'),('18Wala','9876','Guillermo','Ruíz Antolín','1992-03-03'),('19Carls','1234','Carla','Bueno Martinez','1996-09-12'),('19Fresh','1234','Alfredo','Ortega Fernández','1993-08-28'),('19Joni','1234','Jonathan','Moreno Lorenzo','1996-03-05'),('19Toñin','1234','Antonio','Gracia Saiz','1992-04-05'),('20Alberto','123abc','Alberto','Martínez Crespo','1997-07-16'),('20Ana','654321','Ana','Ruiz Abascal','1989-01-02'),('20Juan','abc123','Juan','Rodríguez Ortiz','1995-08-28'),('20Luis','123456','Luis','López Cobo','1990-12-08'),('21Arm','qwerty','Armando','Blanco Diego','1868-02-26'),('21booom','qwerty','Blanca','Morales Alonso','1600-02-01'),('21Byron','qwerty','Byron','Ortiz Martín','1995-07-16'),('21meko','qwerty','Marta','Saiz Álvarez','1900-02-03'),('22Adolf','tengohambre','Adolfo','Dìez Cobo','1945-07-19'),('22Eustaquio','nosemas','Sara','Sainz Hernández','1995-02-18'),('22Hans','soymuyfeo','Andrea','Jiménez Blanco','1962-10-02'),('22Santa','feliznavidad','Santiago','Peña Diego','1990-04-02'),('24Boom','222','Elena','Crespo Abascal','1989-02-14'),('24Leia','999','Maria','Lavín Herrero','1999-05-12'),('24Mary','333','Marta','Herrera Castillo','1998-01-27'),('24Pam','666','Pamela','Muñoz Vega','1982-08-11'),('25Victor','1234','Victor','Revuelta Puente','1989-03-01'),('26Fer','111','Fernando','Sierra Torre','1992-05-08'),('26luc','222','Lucas','Cuesta Santamaría','1856-03-07'),('26Mart','333','Marta','Ibáñez Iglesias','1863-04-07'),('26Pe','000','Pilar','San Emeterio Calderón','1996-03-15'),('27Daniel','123456','Daniel','Tresgallo Ceballos','1990-04-12'),('27flynn','jajaxd','Cristina','Cano Trueba','1981-06-24'),('27potter','mago','Harry','Bolado Arce','1980-07-31'),('27scott','ola','Alejandro','Moreno Merino','1994-08-17'),('28Adela','aabbcc','Adela','Campo Pelayo','1994-04-30'),('28Esther','abcd','Esther','Diaz Perez','1990-02-23'),('28Raul','zzz','Raul','Perez Prieto','1997-02-19'),('28Roberto','1234','Roberto','Diaz Quintana','1993-02-12'),('29David','1234','David','Barquín Becerra','0194-03-12'),('30Rodrigo','abc','Rodrigo','Ramos Cuevas','1992-01-25'),('31juasRodrigo','juasjuas','Ramón','Calvo Maza','1994-09-17');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votos` (
  `usuario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `cancion` int(11) NOT NULL,
  PRIMARY KEY (`usuario`,`fecha`),
  KEY `fk_voto_cancion` (`cancion`),
  CONSTRAINT `fk_voto_cancion` FOREIGN KEY (`cancion`) REFERENCES `canciones` (`numCancion`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_voto_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
INSERT INTO `votos` VALUES ('11Eustaquio','2018-01-07',1),('17Cantua','2017-12-28',1),('26Fer','2017-12-27',1),('27Daniel','2018-01-03',1),('02Ana','2018-01-05',2),('20Alberto','2018-01-07',2),('26Fer','2017-12-28',2),('05User2','2017-12-28',3),('11Epami','2018-01-06',3),('19Carls','2017-12-27',3),('26Fer','2017-12-29',3),('16Victor','2018-01-06',4),('21Byron','2018-01-07',4),('25Victor','2018-01-07',4),('02Eva','2018-01-07',5),('16Ana','2018-01-20',5),('16Victor','2018-01-05',5),('20Ana','2018-01-08',5),('22Eustaquio','2018-01-04',6),('20Luis','2017-12-27',7),('22Adolf','2018-01-07',7),('11Eustaquio','2018-01-05',8),('16Carlos','2018-01-06',9),('05User1','2017-12-28',10),('16Carlos','2018-01-07',10),('26luc','2017-11-29',10),('02Eva','2017-12-29',12),('16Carlos','2017-12-27',12),('18Dana','2017-12-27',12),('19Fresh','2017-12-29',13),('20Alberto','2018-01-05',14),('02Elsa','2018-01-01',15),('11Epami','2018-01-04',15),('13Lucia','2018-01-07',15),('17Fabric','2018-01-03',15),('20Ana','2018-01-09',15),('26luc','2017-12-03',15),('21Byron','2017-11-21',16),('26Pe','2017-12-03',16),('17Fabric','2018-01-04',18),('18Gama','2017-12-31',18),('21Byron','2017-12-19',18),('02Elsa','2017-12-31',19),('27flynn','2018-01-02',19),('02Eva','2017-12-30',20),('11Eustaquio','2018-01-04',20),('17Val','2018-01-06',20),('18Wala','2018-01-02',20),('20Alberto','2018-01-06',20),('18Rana','2017-12-31',22),('28Adela','2017-12-27',22),('28Raul','2017-12-25',22),('13Concepcion','2018-01-10',23),('28Adela','2018-01-25',23),('21meko','2017-12-08',24),('28Adela','2018-01-10',24),('28Esther','2017-12-29',24),('03ez','2017-11-20',25),('03lemon','2017-12-20',25),('03pz','2017-12-20',25),('05User1','2017-12-29',25),('17Val','2018-01-05',25),('19Fresh','2017-12-28',25),('22Hans','2017-12-28',25),('28Esther','2017-12-27',25),('22Eustaquio','2017-12-27',26),('27Daniel','2018-01-02',26),('13Lucia','2018-01-13',27),('17Val','2018-01-07',30),('24Boom','2018-01-07',30),('24Mary','2018-01-07',30),('21Byron','2017-12-27',31),('21Byron','2018-01-03',31),('24Leia','2017-12-28',31),('24Boom','2017-12-07',32),('27Daniel','2018-01-04',33),('29David','2018-01-07',33),('27flynn','2018-01-03',34),('13Lucia','2018-01-04',35),('13Concepcion','2018-01-03',36),('05User1','2018-01-07',38),('05User3','2017-12-10',38),('05User2','2017-12-27',39),('27Daniel','2018-01-05',42),('19Toñin','2017-12-27',43),('22Adolf','2018-01-05',45),('19Fresh','2017-12-27',50),('11Epami','2018-01-05',54),('11Epami','2018-01-07',55),('19Toñin','2017-12-28',56),('22Adolf','2018-01-02',61),('13Carlota','2018-01-01',62);
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08  0:13:34
