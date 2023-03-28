-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: municipios
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
-- Table structure for table `comarcas`
--

DROP TABLE IF EXISTS `comarcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comarcas` (
  `cod_com` char(3) NOT NULL,
  `nombre_com` varchar(25) NOT NULL,
  `num_munics` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cod_com`),
  UNIQUE KEY `nombre_com_UNIQUE` (`nombre_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comarcas`
--

LOCK TABLES `comarcas` WRITE;
/*!40000 ALTER TABLE `comarcas` DISABLE KEYS */;
INSERT INTO `comarcas` VALUES ('A-A','Asón-Agüera',0),('BSY','Besaya',0),('CLV','Campoo-Los Valles',0),('COC','Costa Occidental',0),('COR','Costa Oriental',0),('LIE','Liebana',0),('S-N','Saja-Nansa',0),('SAN','Santander',0),('TRA','Trasmiera',0),('VPA','Valles Pasiegos',0);
/*!40000 ALTER TABLE `comarcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concejales`
--

DROP TABLE IF EXISTS `concejales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concejales` (
  `idpers` int(11) NOT NULL,
  `partido` varchar(15) NOT NULL,
  `municipio` smallint(6) NOT NULL,
  PRIMARY KEY (`idpers`),
  KEY `fk_concejajes_municipios1_idx` (`municipio`),
  CONSTRAINT `fk_concejajes_municipios1` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_concejajes_personas1` FOREIGN KEY (`idpers`) REFERENCES `personas` (`idpers`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concejales`
--

LOCK TABLES `concejales` WRITE;
/*!40000 ALTER TABLE `concejales` DISABLE KEYS */;
INSERT INTO `concejales` VALUES (1,'PP',1),(2,'PP',2),(3,'PRC',3),(4,'PRC',4),(5,'PRC',5),(6,'PP',6),(7,'PP',7),(12,'PP',1),(13,'PP',1),(14,'PP',1),(15,'PP',1),(16,'PP',1),(17,'PRC',1),(18,'PRC',1),(19,'PSOE',1),(20,'PSOE',1),(21,'PPLML',1),(28,'PSOE',20);
/*!40000 ALTER TABLE `concejales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incluidos`
--

DROP TABLE IF EXISTS `incluidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incluidos` (
  `municipio` smallint(6) NOT NULL,
  `mancomunidad` char(10) NOT NULL,
  `f_alta` date NOT NULL,
  PRIMARY KEY (`municipio`,`mancomunidad`),
  KEY `fk_municipios_has_mancomunidades_mancomunidades1_idx` (`mancomunidad`),
  KEY `fk_municipios_has_mancomunidades_municipios1_idx` (`municipio`),
  CONSTRAINT `fk_municipios_has_mancomunidades_mancomunidades1` FOREIGN KEY (`mancomunidad`) REFERENCES `mancomunidades` (`reg_manc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipios_has_mancomunidades_municipios1` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incluidos`
--

LOCK TABLES `incluidos` WRITE;
/*!40000 ALTER TABLE `incluidos` DISABLE KEYS */;
INSERT INTO `incluidos` VALUES (12,'0539002','2012-03-12'),(12,'0539016','2010-06-12'),(14,'0539002','2012-03-12'),(14,'0539016','2010-06-12'),(33,'0539016','2010-06-12'),(34,'0539016','2010-06-12'),(41,'0539002','2012-03-12'),(41,'0539016','2010-06-12'),(49,'0539016','2010-06-12'),(53,'0539016','2010-06-12'),(63,'0539016','2010-06-12'),(66,'0539002','2012-03-12'),(66,'0539016','2010-06-12'),(73,'0539016','2010-06-12'),(86,'0539002','2012-03-12'),(86,'0539016','2010-06-12'),(89,'0539016','2010-06-12'),(90,'0539016','2010-06-12'),(91,'0539016','2010-06-12'),(92,'0539016','2010-06-12');
/*!40000 ALTER TABLE `incluidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limites`
--

DROP TABLE IF EXISTS `limites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limites` (
  `municmayor` smallint(6) NOT NULL,
  `municmenor` smallint(6) NOT NULL,
  PRIMARY KEY (`municmayor`,`municmenor`),
  KEY `fk_municmayor_municipios2_idx` (`municmenor`),
  CONSTRAINT `fk_municmayor_municipios1` FOREIGN KEY (`municmayor`) REFERENCES `municipios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_municmayor_municipios2` FOREIGN KEY (`municmenor`) REFERENCES `municipios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limites`
--

LOCK TABLES `limites` WRITE;
/*!40000 ALTER TABLE `limites` DISABLE KEYS */;
INSERT INTO `limites` VALUES (30,2),(4,3),(26,3),(27,3),(6,5),(29,5),(11,6),(4,10),(1,12),(23,13),(17,18),(26,19),(4,22),(26,22),(15,23),(9,24),(1,25),(4,26),(4,27),(6,29),(9,29),(21,30),(9,31),(13,34),(23,34),(9,35),(2,36),(21,36),(30,36),(2,38),(28,40),(28,42),(6,43),(11,43),(7,45),(4,46),(6,47),(23,49),(10,50),(13,50),(13,55),(15,55),(23,55),(27,56),(30,58),(17,59),(1,60),(12,60),(28,62),(28,64),(17,65),(18,65),(14,66),(1,68),(25,68),(26,69),(27,69),(18,70),(1,77),(17,78),(18,78),(27,79),(9,84),(28,84),(23,88),(14,89),(1,90),(12,90),(17,93),(17,94),(15,97);
/*!40000 ALTER TABLE `limites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `municipio` smallint(6) NOT NULL,
  `numero` tinyint(4) NOT NULL,
  `nombre_loc` varchar(30) NOT NULL,
  `habitantes` int(11) NOT NULL,
  PRIMARY KEY (`municipio`,`numero`),
  KEY `fk_localidades_municipios1_idx` (`municipio`),
  CONSTRAINT `fk_localidades_municipios1` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'Cóbreces',601),(1,2,'Busta, La',114),(1,3,'Cigüenza',95),(1,4,'Novales',457),(1,5,'Oreña',843),(1,6,'Rudagüera',372),(1,7,'Toñanes',111),(12,1,'Bustablado',57),(12,2,'Cabezón de la Sal',5285),(12,3,'Cabrojo',150),(12,4,'Carrejo',290),(12,5,'Casar',788),(12,6,'Duña',41),(12,7,'Ontoria',432),(12,8,'Periedo',70),(12,9,'Santibañez',182),(12,10,'Vernejo',549),(12,11,'Virgen de la Peña',77),(13,1,'Aniezo',32),(13,2,'Buyezo',37),(13,3,'Cabariezo',12),(13,4,'Cabezón de Liébana',96),(13,5,'Cahecho',50),(13,6,'Cambarco',34),(13,7,'Frama',161),(13,8,'Lamedo',31),(13,9,'Luriezo',47),(13,10,'Perrozo',59),(13,11,'Piasca',75),(13,12,'San Andrés',36),(13,13,'Torices',27),(14,1,'Carmona',217),(14,2,'Fresneda',21),(14,3,'Renedo',138),(14,4,'Selores',75),(14,5,'Sopeña',256),(14,6,'Terán',191),(14,7,'Valle',176),(14,8,'Viaña',60),(15,1,'Areños',46),(15,2,'Argüébanes',46),(15,3,'Bárcena',17),(15,4,'Beares',5),(15,5,'Besoy',8),(15,6,'Bodia',9),(15,7,'Brez',35),(15,8,'Camaleño',52),(15,9,'Congarna',13),(15,10,'Cosgaya',52),(15,11,'Enterría',2),(15,12,'Espinama',123),(15,13,'La Frecha',34),(15,14,'Fuente De',5),(15,15,'Las Ilces',14),(15,16,'Lon',75),(15,17,'Los Llanos',27),(15,18,'Llaves',32),(15,19,'Mieses',40),(15,20,'Mogrovejo',52),(15,21,'La Molina',20),(15,22,'Pembes',75),(15,23,'Pido',131),(15,24,'Quintana',9),(15,25,'San Pelayo',21),(15,26,'Santo Toribio',1),(15,27,'Sebrango',10),(15,28,'Tanarrio',26),(15,29,'Treviño',9),(15,30,'Turieno',102),(15,31,'Vallejo',7),(23,1,'Aliezo',59),(23,2,'Armaño',28),(23,3,'Bejes',72),(23,4,'Cabañes',47),(23,5,'Castro-Cillorigo',57),(23,6,'Cobeña',14),(23,7,'Colio',63),(23,8,'Lebeña',94),(23,9,'Llayo',2),(23,10,'Ojedo',441),(23,11,'Pendes',56),(23,12,'Pumareña',41),(23,13,'Salarzón',33),(23,14,'San Pedro',22),(23,15,'Trillayo',33),(23,16,'Viñón',44),(23,17,'Tama',64),(23,18,'Esanos',45),(25,1,'Comillas',2374),(25,2,'Rabia, La',14),(25,3,'Rioturbio',43),(25,4,'Rubárcena',37),(25,5,'Ruiseñada',200),(25,6,'Trasvía',180),(33,1,'Bielva',244),(33,2,'Cabanzón',142),(33,3,'Cades',87),(33,4,'Camijanes',100),(33,5,'Casamaría',80),(33,6,'Puente del Arrudo',15),(33,7,'Rábago',52),(34,1,'Burió',22),(34,2,'Cires',45),(34,3,'Lafuente',35),(34,4,'Pumares, Los',55),(34,5,'Quintanilla',105),(34,6,'Río',27),(34,7,'Sobrelapeña',53),(34,8,'Venta Fresnedo',21),(41,1,'Cos',241),(41,2,'Herrera de Ibio',250),(41,3,'Ibio',137),(41,4,'Mazcuerras',335),(41,5,'Riaño de Ibio',157),(41,6,'Sierra de Ibio',148),(41,7,'Villanueva de la Peña',678),(49,1,'Caldas',20),(49,2,'Cicera',69),(49,3,'Hermida, La',94),(49,4,'Linares',76),(49,5,'Navedo',49),(49,6,'Piñeres',53),(49,7,'Roza',19),(50,1,'Avellanedo',18),(50,2,'Barreda',38),(50,3,'Caloca',56),(50,4,'Cueva',25),(50,5,'Lerones',40),(50,6,'Lomeña',48),(50,7,'Obargo',12),(50,8,'Pesaguero',50),(50,9,'Valdeprado',41),(50,10,'Vendejo',32),(50,11,'Parte, La',20),(53,1,'Belmonte',23),(53,2,'Callecedo',15),(53,3,'Cotillos',7),(53,4,'Lombraña',14),(53,5,'Laguna, La',18),(53,6,'Pejanda',16),(53,7,'Puente Pumar',59),(53,8,'Salceda',18),(53,9,'San Mamés',23),(53,10,'Santa Eulalia',11),(53,11,'Tresabuela',28),(53,12,'Uznayo',53),(55,1,'Potes',1500),(55,2,'Rases',11),(60,1,'Barcenaciones',169),(60,2,'Caranceja',270),(60,3,'Cerrazo',480),(60,4,'Golbardo',174),(60,5,'Helguera',535),(60,6,'Puente San Miguel',2867),(60,7,'Quijas',680),(60,8,'Reocín',67),(60,9,'San Esteban',106),(60,10,'Valles',388),(60,11,'Veguilla, La',512),(60,12,'Villapresente',943),(63,1,'Arenas',9),(63,2,'Bárcenas, Las',5),(63,3,'Cabrojo',28),(63,4,'Celis',235),(63,5,'Celucos',73),(63,6,'Cosío',216),(63,7,'Cotera, La',22),(63,8,'Herrería, La',11),(63,9,'Obeso',59),(63,10,'Pedreo',42),(63,11,'Picayos, Los',3),(63,12,'Puentenansa',204),(63,13,'Riclones',117),(63,14,'Rioseco',50),(63,15,'Rozadío',76),(63,16,'San Sebastián de Garabandal',139),(66,1,'Barcenillas',130),(66,2,'Miña, La',70),(66,3,'Ruente',288),(66,4,'Ucieda',497),(68,1,'Casasola',47),(68,2,'Concha',45),(68,3,'Iglesia. La',144),(68,4,'Liandres',84),(68,5,'Pando',139),(68,6,'Ruilobuca',52),(68,7,'Sierra',132),(68,8,'Trasierra',124),(73,1,'Abaño',76),(73,2,'Acebosa, La',153),(73,3,'Barcenal, El',41),(73,4,'Gandarilla',109),(73,5,'Hortigal',44),(73,6,'Llaos, Los',156),(73,7,'Revilla, La',338),(73,8,'San Vicente de la Barquera',3381),(73,9,'Santillán',166),(77,1,'Arroyo',53),(77,2,'Camplengo',233),(77,3,'Herrán',237),(77,4,'Mijares',304),(77,5,'Queveda',562),(77,6,'Santillana del Mar',1021),(77,7,'Ubiarco',218),(77,8,'Vispieres',355),(77,9,'Viveda',1155),(77,10,'Yuso',77),(86,1,'Bárcena Mayor',80),(86,2,'Correpoco',54),(86,3,'Saja',108),(86,4,'Tojo, El',66),(86,5,'Tojos, Los',107),(88,1,'Tresviso',71),(89,1,'Lastra, La',52),(89,2,'Santotís',25),(89,3,'Sarceda',45),(89,4,'Tudanca',90),(90,1,'Canales',74),(90,2,'Cobijón',61),(90,3,'Hayuela, La',185),(90,4,'Llano, El',87),(90,5,'Pumalverde',110),(90,6,'Rodezas',68),(90,7,'Toporias',61),(90,8,'Valoria',44),(90,9,'Virgen, La',138),(91,1,'Abanillas',81),(91,2,'Estrada',21),(91,3,'Helgueras',74),(91,4,'Luey',179),(91,5,'Molleda',187),(91,6,'Muñorrodero',95),(91,7,'Pechón',215),(91,8,'Pesués',376),(91,9,'Portillo',78),(91,10,'Prellezo',212),(91,11,'Prío',85),(91,12,'San Pedro de las Baheras',63),(91,13,'Serdio',184),(91,14,'Unquera',819),(92,1,'Caviedes',250),(92,2,'Labarces',303),(92,3,'Lamadrid',420),(92,4,'Roiz',401),(92,5,'San Vicente del Monte',217),(92,6,'Tejo, El',308),(92,7,'Treceño',511),(97,1,'Bárago',101),(97,2,'Barrio',61),(97,3,'Bores',38),(97,4,'Campollo',68),(97,5,'Dobarganes',31),(97,6,'Enterrias',18),(97,7,'Ledantes',74),(97,8,'Pollayo',13),(97,9,'Porcieda',0),(97,10,'Tollo',36),(97,11,'Toranzo',41),(97,12,'Tudes',38),(97,13,'Vada',18),(97,14,'Valmeo',40),(97,15,'Vega, La',184),(97,16,'Vejo',62),(97,17,'Villaverde',23);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mancomunidades`
--

DROP TABLE IF EXISTS `mancomunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mancomunidades` (
  `reg_manc` char(10) NOT NULL,
  `nombre_manc` varchar(60) NOT NULL,
  `des` text NOT NULL,
  `municipio_sede` smallint(6) DEFAULT NULL,
  `num_sede` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`reg_manc`),
  KEY `fk_mancomunidades_localidades1_idx` (`municipio_sede`,`num_sede`),
  CONSTRAINT `fk_mancomunidades_localidades1` FOREIGN KEY (`municipio_sede`, `num_sede`) REFERENCES `localidades` (`municipio`, `numero`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mancomunidades`
--

LOCK TABLES `mancomunidades` WRITE;
/*!40000 ALTER TABLE `mancomunidades` DISABLE KEYS */;
INSERT INTO `mancomunidades` VALUES ('0539002','Servicios de los Valles del Saja y Corona','Recogida y tratamiento de basuras. Asesoramiento técnico y jurídico. Servicio de extinción de incendios. Promoción turística. Promoción social y empleo. Promoción cultural. Ordenación del territorio y protección del medio ambiente',12,2),('0539016','Saja Nansa','Gestión Desarrollo rural',92,4);
/*!40000 ALTER TABLE `mancomunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id` smallint(6) NOT NULL,
  `cod_mun` char(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `extension` float NOT NULL DEFAULT '0',
  `poblacion` int(11) DEFAULT '0',
  `escudo` varchar(200) DEFAULT NULL,
  `bandera` varchar(200) DEFAULT NULL,
  `comarca` char(3) DEFAULT NULL,
  `num_locs` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cod_mun_UNIQUE` (`cod_mun`),
  KEY `fk_municipios_comarcas1_idx` (`comarca`),
  CONSTRAINT `fk_municipios_comarcas1` FOREIGN KEY (`comarca`) REFERENCES `comarcas` (`cod_com`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'ALF','Alfoz de Lloredo',46.34,0,NULL,NULL,'COC',0),(2,'AMP','Ampuero',32.34,0,NULL,NULL,'A-A',0),(3,'ANI','Anievas',20.9,0,NULL,NULL,'BSY',0),(4,'ARI','Arenas de Iguña',86.82,0,NULL,NULL,'BSY',0),(5,'ARG','Argoños',5.51,0,NULL,NULL,'TRA',0),(6,'ARN','Arnuero',23.66,0,NULL,NULL,'TRA',0),(7,'ARR','Arredondo',46.83,0,NULL,NULL,'A-A',0),(8,'AST','Astillero',6.83,0,NULL,NULL,'SAN',0),(9,'BDC','Bárcena de Cicero',36.63,0,NULL,NULL,'TRA',0),(10,'BPC','Bárcena de Pie de Concha',30.53,0,NULL,NULL,'BSY',0),(11,'BAR','Bareyo',32.44,0,NULL,NULL,'TRA',0),(12,'CBZ','Cabezón de la Sal',33.56,0,NULL,NULL,'S-N',0),(13,'CBL','Cabezón de Liébana',81.43,0,NULL,NULL,'LIE',0),(14,'CAB','Cabuérniga',86.45,0,NULL,NULL,'S-N',0),(15,'CML','Camaleño',161.81,0,NULL,NULL,'LIE',0),(16,'CAM','Camargo',36.58,0,NULL,NULL,'SAN',0),(17,'CDE','Campoo de Enmedio',91.06,0,NULL,NULL,'CLV',0),(18,'CDY','Campoo de Yuso',89.72,0,NULL,NULL,'CLV',0),(19,'CRT','Cartes',19.01,0,NULL,NULL,'BSY',0),(20,'CAS','Castañeda',19.19,0,NULL,NULL,'VPA',0),(21,'CST','Castro Urdiales',96.77,0,NULL,NULL,'COR',0),(22,'CIE','Cieza',44.07,0,NULL,NULL,'BSY',0),(23,'CLL','Cillorigo de Liébana',104.52,0,NULL,NULL,'LIE',0),(24,'COL','Colindres',5.94,0,NULL,NULL,'COR',0),(25,'COM','Comillas',18.61,0,NULL,NULL,'COC',0),(26,'LCB','Corrales de Buelna, Los',45.38,0,NULL,NULL,'BSY',0),(27,'CDT','Corvera de Toranzo',49.48,0,NULL,NULL,'VPA',0),(28,'ENT','Entrambasaguas',43.17,0,NULL,NULL,'TRA',0),(29,'ESC','Escalante',19.11,0,NULL,NULL,'TRA',0),(30,'GUR','Guriezo',74.53,0,NULL,NULL,'A-A',0),(31,'HDC','Hazas de Cesto',21.89,0,NULL,NULL,'TRA',0),(32,'HCS','Hermandad de Campoo de Suso',222.65,0,NULL,NULL,'CLV',0),(33,'HRR','Herrerías',40.34,0,NULL,NULL,'S-N',0),(34,'LAM','Lamasón',71.23,0,NULL,NULL,'S-N',0),(35,'LAR','Laredo',15.71,0,NULL,NULL,'COR',0),(36,'LIE','Liendo',25.96,0,NULL,NULL,'COR',0),(37,'LRG','Liérganes',36.73,0,NULL,NULL,'TRA',0),(38,'LIM','Limpias',10.07,0,NULL,NULL,'A-A',0),(39,'LUE','Luena',90.54,0,NULL,NULL,'VPA',0),(40,'MAC','Marina de Cudeyo',28.37,0,NULL,NULL,'TRA',0),(41,'MAZ','Mazcuerras',55.65,0,NULL,NULL,'S-N',0),(42,'MEC','Medio Cudeyo',26.78,0,NULL,NULL,'TRA',0),(43,'MER','Meruelo',16.37,0,NULL,NULL,'TRA',0),(44,'MIE','Miengo',24.5,0,NULL,NULL,'SAN',0),(45,'MRA','Miera',33.77,0,NULL,NULL,'TRA',0),(46,'MLL','Molledo',71.07,0,NULL,NULL,'BSY',0),(47,'NOJ','Noja',9.2,0,NULL,NULL,'TRA',0),(48,'PEN','Penagos',31.67,0,NULL,NULL,'SAN',0),(49,'PÑR','Peñarrubia',54.28,0,NULL,NULL,'S-N',0),(50,'PSG','Pesaguero',69.99,0,NULL,NULL,'LIE',0),(51,'PSQ','Pesquera',8.93,0,NULL,NULL,'CLV',0),(52,'PIE','Piélagos',88.64,0,NULL,NULL,'SAN',0),(53,'POL','Polaciones',89.77,0,NULL,NULL,'S-N',0),(54,'PLN','Polanco',12.7,0,NULL,NULL,'BSY',0),(55,'PTS','Potes',7.64,0,NULL,NULL,'LIE',0),(56,'PVI','Puente Viesgo',36.14,0,NULL,NULL,'VPA',0),(57,'RAM','Ramales de la Victoria',34.97,0,NULL,NULL,'A-A',0),(58,'RAS','Rasines',42.89,0,NULL,NULL,'A-A',0),(59,'REI','Reinosa',4.12,0,NULL,NULL,'CLV',0),(60,'REO','Reocín',32.09,0,NULL,NULL,'S-N',0),(61,'RMA','Ribamontán al Mar',36.94,0,NULL,NULL,'TRA',0),(62,'RMO','Ribamontán al Monte',42.17,0,NULL,NULL,'TRA',0),(63,'RIO','Rionansa',118.04,0,NULL,NULL,'S-N',0),(64,'RTU','Riotuerto',30.48,0,NULL,NULL,'TRA',0),(65,'RDV','Rozas de Valdearroyo, Las',57.35,0,NULL,NULL,'CLV',0),(66,'RUE','Ruente',65.86,0,NULL,NULL,'S-N',0),(67,'RSG','Ruesga',87.96,0,NULL,NULL,'A-A',0),(68,'RLB','Ruiloba',15.13,0,NULL,NULL,'COC',0),(69,'SFB','San Felices de Buelna',36.24,0,NULL,NULL,'BSY',0),(70,'SMA','San Miguel de Aguayo',35.99,0,NULL,NULL,'CLV',0),(71,'SPR','San Pedro del Romeral',57.44,0,NULL,NULL,'VPA',0),(72,'SRR','San Roque de Riomiera',35.7,0,NULL,NULL,'VPA',0),(73,'SVC','San Vicente de la Barquera',41.04,0,NULL,NULL,'COC',0),(74,'SCB','Santa Cruz de Bezana',17.26,0,NULL,NULL,'SAN',0),(75,'SMC','Santa María de Cayón',48.23,0,NULL,NULL,'VPA',0),(76,'SAN','Santander',34.76,0,NULL,NULL,'SAN',0),(77,'SDM','Santillana del Mar',28.46,0,NULL,NULL,'COC',0),(78,'SDR','Santiurde de Reinosa',30.98,0,NULL,NULL,'CLV',0),(79,'SDT','Santiurde de Toranzo',36.82,0,NULL,NULL,'VPA',0),(80,'STÑ','Santoña',11.53,0,NULL,NULL,'TRA',0),(81,'SAR','Saro',17.82,0,NULL,NULL,'VPA',0),(82,'SEL','Selaya',39.29,0,NULL,NULL,'VPA',0),(83,'SOB','Soba',214.16,0,NULL,NULL,'A-A',0),(84,'SOL','Solórzano',25.5,0,NULL,NULL,'TRA',0),(85,'SUA','Suances',24.56,0,NULL,NULL,'BSY',0),(86,'LTJ','Los Tojos',89.5,0,NULL,NULL,'S-N',0),(87,'TOR','Torrelavega',35.54,0,NULL,NULL,'BSY',0),(88,'TRV','Tresviso',16.23,0,NULL,NULL,'LIE',0),(89,'TUD','Tudanca',52.44,0,NULL,NULL,'S-N',0),(90,'UDS','Udías',19.64,0,NULL,NULL,'COC',0),(91,'VSV','Val de San Vicente',50.86,0,NULL,NULL,'COC',0),(92,'VLD','Valdáliga',97.76,0,NULL,NULL,'COC',0),(93,'VLO','Valdeolea',83.72,0,NULL,NULL,'CLV',0),(94,'VDR','Valdeprado del Rio',89.33,0,NULL,NULL,'CLV',0),(95,'VAL','Valderredible',303.74,0,NULL,NULL,'CLV',0),(96,'VDV','Valle de Villaverde',19.53,0,NULL,NULL,'A-A',0),(97,'VGL','Vega de Liébana',133.21,0,NULL,NULL,'LIE',0),(98,'VDP','Vega de Pas',87.53,0,NULL,NULL,'VPA',0),(99,'VCR','Villacarriedo',50.74,0,NULL,NULL,'VPA',0),(100,'VLL','Villaescusa',28.02,0,NULL,NULL,'SAN',0),(101,'VFF','Villafufre',30.08,0,NULL,NULL,'VPA',0),(102,'VOT','Voto',77.71,0,NULL,NULL,'TRA',0);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personajes` (
  `idpers` int(11) NOT NULL,
  `profesion` varchar(50) NOT NULL,
  `lmunicipio` smallint(6) NOT NULL,
  `loc_numero` tinyint(4) NOT NULL,
  `biografia` text,
  PRIMARY KEY (`idpers`),
  KEY `fk_personajes_localidades1_idx` (`lmunicipio`,`loc_numero`),
  CONSTRAINT `fk_personajes_localidades1` FOREIGN KEY (`lmunicipio`, `loc_numero`) REFERENCES `localidades` (`municipio`, `numero`) ON UPDATE CASCADE,
  CONSTRAINT `fk_personajes_personas` FOREIGN KEY (`idpers`) REFERENCES `personas` (`idpers`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (22,'Conde de Casa Tagle de Trasierra',1,3,'Fue colonizador y destacó por su labor en la formación de pueblos indígenas'),(23,'Ceramista y escultor',1,6,NULL),(24,'Monje cisterciense',1,1,'Se dedicó a la investigación histórica, de las lenguas y las tradiciones populares; llegando a ser muy famoso en toda la comarca de las inmediaciones del monasterio por sus largos desplazamientos en bicicleta.'),(25,'Militar',1,1,' Recibió en tres ocasiones la Gran Cruz de San Fernando. En el año 1868 se le otorgó la Gran Cruz del Mérito Militar por la defensa de Santander.');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `idpers` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `a_nac` smallint(6) DEFAULT NULL,
  `a_fall` int(11) DEFAULT NULL,
  `localidad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idpers`),
  KEY `k_personas_apellidos_nombre` (`apellidos`,`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Enrique','Bretones Palencia',1962,NULL,NULL),(2,'Patricio','Martínez Cedrún',1960,NULL,NULL),(3,'Agustín','Pernía Vaca',1962,NULL,NULL),(4,'Laureano Pablo','Gómez Fernández',1971,NULL,NULL),(5,'Juan José','Barruetabeña Manso',1972,NULL,NULL),(6,'José Manuel','Igual Órtiz',1966,NULL,'Santander'),(7,'Leoncio','Carrascal Ruiz',1962,NULL,'Arredondo'),(12,'Nieves','Díaz Pérez',1967,NULL,'Oreña'),(13,'Emilio','González Sánchez',1965,NULL,NULL),(14,'Milagros','Carmona Fernández',1970,NULL,'Torrelavega'),(15,'José Antonio','Díaz Bueno',1952,NULL,'Cigüenza'),(16,'Mª José','García Abascal',1978,NULL,NULL),(17,'Carmen Elena','Piñera Sánchez',1966,NULL,'Oreña'),(18,'Ainhoa','Gutiérrez Sánchez',1978,NULL,'Santander'),(19,'Fernando','Rodríguez García',1975,NULL,NULL),(20,'Ana María','Herrera Carral',1980,NULL,NULL),(21,'Felipe','Rodríguez del Castillo',1961,NULL,NULL),(22,'Juan Antonio','de Tagle Bracho',1685,1750,NULL),(23,'Pedro','García Abín',1948,1989,NULL),(24,'Patricio','Guerín Bets',1910,2002,NULL),(25,'Juan José','Villegas',1815,1890,NULL),(26,'María Isabel','Fernández Gutiérrez',1968,NULL,'Torrelavega'),(27,'Esther','Merino Portugal',1972,NULL,'Torrelavega'),(28,'Diego','Revuelta Ceballos',1958,NULL,'Santander');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rige`
--

DROP TABLE IF EXISTS `rige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rige` (
  `id_rige` int(11) NOT NULL AUTO_INCREMENT,
  `alcalde` int(11) NOT NULL,
  `municipio` smallint(6) NOT NULL,
  `fini` date NOT NULL,
  `ffin` date DEFAULT NULL,
  `partido` varchar(15) NOT NULL,
  PRIMARY KEY (`id_rige`),
  KEY `fk_alcaldes_has_municipios_municipios1_idx` (`municipio`),
  KEY `fk_alcaldes_has_personas_idx` (`alcalde`),
  CONSTRAINT `fk_alcaldes_has_municipios_municipios1` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alcaldes_has_personas` FOREIGN KEY (`alcalde`) REFERENCES `personas` (`idpers`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rige`
--

LOCK TABLES `rige` WRITE;
/*!40000 ALTER TABLE `rige` DISABLE KEYS */;
INSERT INTO `rige` VALUES (1,1,1,'2015-06-21',NULL,'PP'),(2,7,7,'2015-06-28',NULL,'PRC'),(3,2,2,'2015-06-21',NULL,'PP'),(4,3,3,'2015-06-23',NULL,'PRC'),(5,4,4,'2015-06-28',NULL,'PRC'),(6,5,5,'2015-06-23',NULL,'PP'),(7,6,6,'2015-06-21',NULL,'PP'),(8,26,12,'2007-06-16','2011-06-16','PSOE'),(9,26,12,'2015-05-23',NULL,'PSOE'),(10,27,12,'2011-06-11','2015-05-22','PP'),(12,28,20,'2015-06-13',NULL,'PSOE');
/*!40000 ALTER TABLE `rige` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-06  9:42:37
