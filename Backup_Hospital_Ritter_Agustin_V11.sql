/* Se procedió a generar un BACKUP de DATOS únicamente, se hizo un DATA ONLY.
Se realizo sobre todas las tablas del proyecto.
Se agrego la opción de creación de schema.
Las tablas son: ambulancia, ambulancia_vista, consultorio, datos_doctor,datos_recepcionistas,doctor,especialidad, factura, hospital,obra_social, obra_social_cargadas, paciente, personal, personal_vista,proveedor,proveedor_vista, 
recepcionista, recepcionista_vista,reserva, tipo_Factura, tipo_matricula, tipo_Reserva, */



CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
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
-- Table structure for table `ambulancia`
--

DROP TABLE IF EXISTS `ambulancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambulancia` (
  `Id_Ambulancia` int NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(100) DEFAULT NULL,
  `Patente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Ambulancia`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulancia`
--

LOCK TABLES `ambulancia` WRITE;
/*!40000 ALTER TABLE `ambulancia` DISABLE KEYS */;
INSERT INTO `ambulancia` VALUES (1,'PEUGEOT','ACD546'),(2,'MERCEDES','JFW879'),(3,'RANGER','ASD578'),(4,'FORD','KOL134'),(5,'PALIO','ACK551');
/*!40000 ALTER TABLE `ambulancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ambulancia_vista`
--

DROP TABLE IF EXISTS `ambulancia_vista`;
/*!50001 DROP VIEW IF EXISTS `ambulancia_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ambulancia_vista` AS SELECT 
 1 AS `Modelo`,
 1 AS `Patente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `Id_Consultorio` int NOT NULL AUTO_INCREMENT,
  `Nombre_Consultorio` varchar(100) DEFAULT NULL,
  `Domicilio_Consultorio` varchar(100) DEFAULT NULL,
  `Telefono_Consultorio` int DEFAULT NULL,
  `Mail_Consultorio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Consultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'Hospital Roca','Avenida Montevideo 168',1122556688,'hospRoca@Outlook.com'),(2,'Hospital Flores','Avenida Los Pasos 115',35489967,'hospFlores@Outlook.com'),(3,'Hospital Cuidados Graves','Avenida Hidalgo 487',1145779368,'hospCuidadosGraves@Outlook.com'),(4,'Hospital Jose San Martin','Triunbirato 500',1144751986,'hospJoseSanMartin@Outlook.com'),(5,'Hospital Duran','Vera 100',1144778844,'hospDuran@Outlook.com');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datos_doctor`
--

DROP TABLE IF EXISTS `datos_doctor`;
/*!50001 DROP VIEW IF EXISTS `datos_doctor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_doctor` AS SELECT 
 1 AS `Id_Doctor`,
 1 AS `Legajo`,
 1 AS `Matricula`,
 1 AS `Tipo_Matricula`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `datos_recepcionistas`
--

DROP TABLE IF EXISTS `datos_recepcionistas`;
/*!50001 DROP VIEW IF EXISTS `datos_recepcionistas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_recepcionistas` AS SELECT 
 1 AS `Legajo`,
 1 AS `Nombre_Personal`,
 1 AS `Apellido_Personal`,
 1 AS `Rol_Designado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `Id_Doctor` int NOT NULL AUTO_INCREMENT,
  `Legajo` int DEFAULT NULL,
  `Id_Tipo_Matricula` int DEFAULT NULL,
  `Matricula` int DEFAULT NULL,
  `Id_Especialidad` int DEFAULT NULL,
  PRIMARY KEY (`Id_Doctor`),
  KEY `Legajo` (`Legajo`),
  KEY `Id_Tipo_Matricula` (`Id_Tipo_Matricula`),
  KEY `Id_Especialidad` (`Id_Especialidad`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Legajo`) REFERENCES `personal` (`Legajo`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`Id_Tipo_Matricula`) REFERENCES `tipo_matricula` (`Id_Tipo_Matricula`),
  CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`Id_Especialidad`) REFERENCES `especialidad` (`Id_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,210211,1,4568,1),(2,16554,2,5544,2),(3,211123,1,4896,3),(4,225546,2,4892,4),(5,245689,1,4875,5);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `Id_Especialidad` int NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Traumatologia'),(2,'Kinesiologia'),(3,'Odontologia'),(4,'Oftalmologia'),(5,'Urologia');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `Id_Factura` int NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Factura` int DEFAULT NULL,
  `Sucursal` varchar(100) DEFAULT NULL,
  `Detalle_Factura` varchar(100) DEFAULT NULL,
  `Importe_Factura` decimal(10,0) DEFAULT NULL,
  `Fecha_Factura` date DEFAULT NULL,
  PRIMARY KEY (`Id_Factura`),
  KEY `Id_Tipo_Factura` (`Id_Tipo_Factura`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Id_Tipo_Factura`) REFERENCES `tipo_factura` (`Id_Tipo_Factura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'Lomas','Atencion Kinesiologo',10000,'2023-02-06'),(2,2,'Paternal','Atencion Odontologia',30000,'2023-03-22'),(3,3,'Avellaneda','Traslado Ambulancia',50000,'2023-04-30'),(4,1,'Puerto Madero','Traslado Ambulancia',50000,'2023-11-22'),(5,2,'Avellaneda','Atencion Odontologica ',80000,'2023-07-11');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `Id_Hospital` int NOT NULL AUTO_INCREMENT,
  `Id_Consultorio` int DEFAULT NULL,
  `Id_Proveedor` int DEFAULT NULL,
  `Id_Paciente` int DEFAULT NULL,
  `Id_Doctor` int DEFAULT NULL,
  `Id_Recepcionista` int DEFAULT NULL,
  `Id_Ambulancia` int DEFAULT NULL,
  PRIMARY KEY (`Id_Hospital`),
  KEY `Id_Consultorio` (`Id_Consultorio`),
  KEY `Id_Proveedor` (`Id_Proveedor`),
  KEY `Id_Paciente` (`Id_Paciente`),
  KEY `Id_Doctor` (`Id_Doctor`),
  KEY `Id_Recepcionista` (`Id_Recepcionista`),
  KEY `Id_Ambulancia` (`Id_Ambulancia`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Id_Consultorio`) REFERENCES `consultorio` (`Id_Consultorio`),
  CONSTRAINT `hospital_ibfk_2` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`),
  CONSTRAINT `hospital_ibfk_3` FOREIGN KEY (`Id_Paciente`) REFERENCES `paciente` (`Id_Paciente`),
  CONSTRAINT `hospital_ibfk_4` FOREIGN KEY (`Id_Doctor`) REFERENCES `doctor` (`Id_Doctor`),
  CONSTRAINT `hospital_ibfk_5` FOREIGN KEY (`Id_Recepcionista`) REFERENCES `recepcionista` (`Id_Recepcionista`),
  CONSTRAINT `hospital_ibfk_6` FOREIGN KEY (`Id_Ambulancia`) REFERENCES `ambulancia` (`Id_Ambulancia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,1,1,1,1,1,1),(2,2,2,2,2,2,2),(3,3,3,3,3,3,3),(4,4,4,4,4,4,4),(5,5,5,5,5,5,5);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra_social`
--

DROP TABLE IF EXISTS `obra_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra_social` (
  `Id_Obra_Social` int NOT NULL AUTO_INCREMENT,
  `Tipo_Obra_Social` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Obra_Social`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra_social`
--

LOCK TABLES `obra_social` WRITE;
/*!40000 ALTER TABLE `obra_social` DISABLE KEYS */;
INSERT INTO `obra_social` VALUES (1,'PARTICULAR'),(2,'OSDE'),(3,'PAMI'),(4,'GALENO'),(5,'DOSUBA');
/*!40000 ALTER TABLE `obra_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `obra_social_cargadas`
--

DROP TABLE IF EXISTS `obra_social_cargadas`;
/*!50001 DROP VIEW IF EXISTS `obra_social_cargadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `obra_social_cargadas` AS SELECT 
 1 AS `Id_Obra_Social`,
 1 AS `Tipo_Obra_Social`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `Id_Paciente` int NOT NULL AUTO_INCREMENT,
  `Nombre_Paciente` varchar(100) DEFAULT NULL,
  `Apellido_Paciente` varchar(100) DEFAULT NULL,
  `Telefono_Paciente` int DEFAULT NULL,
  `Id_Obra_Social` int DEFAULT NULL,
  `Mail_Paciente` varchar(100) DEFAULT NULL,
  `Fecha_Nacimiento_Paciente` date DEFAULT NULL,
  PRIMARY KEY (`Id_Paciente`),
  KEY `Id_Obra_Social` (`Id_Obra_Social`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`Id_Obra_Social`) REFERENCES `obra_social` (`Id_Obra_Social`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Sebastian','Meister',1144668899,1,'Sebastian@hotmail.com','1989-05-01'),(2,'Fabian','De la Madrid',115512345,2,'Fabian@hotmail.com','1870-06-02'),(3,'German','Garmendia',1165887700,3,'Sebastian@hotmail.com','1877-07-03'),(4,'Natalia','Corro',1100002211,4,'Fernanda@hotmail.com','1866-08-04'),(5,'Lucas','Vasconi',1545779012,5,'Lucas@hotmail.com','1997-11-20');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Paciente_Insert` AFTER INSERT ON `paciente` FOR EACH ROW begin 
	insert into trigger_paciente (Nombre_Paciente, Apellido_Paciente,accion,Id_Paciente, fecha,usuario) values (new.Nombre_Paciente, New.Apellido_Paciente,"insert",new.Id_Paciente, now(), system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Paciente_Eliminacion` BEFORE DELETE ON `paciente` FOR EACH ROW begin
		insert into trigger_paciente(Nombre_Paciente, Apellido_Paciente,accion,Id_Paciente, fecha,usuario) values (null, null,"delete",null, now(), system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `Legajo` int NOT NULL,
  `Nombre_Personal` varchar(100) DEFAULT NULL,
  `Apellido_Personal` varchar(100) DEFAULT NULL,
  `Telefono_Personal` int DEFAULT NULL,
  `Domicilio_Personal` varchar(100) DEFAULT NULL,
  `Mail_Personal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (16554,'Fermin','Alonso',1165489688,'Combatientes 11','Fermin@gmail.com'),(154689,'Lucas','Perez',1145889672,'Berutti 10','LucaS@gmail.com'),(210211,'Agustin','Lopez',1164656465,'Av Corrientes 1154','Agustin@gmail.com'),(211123,'Ignacio','Liz',1534887799,'Av Cordoba 1654','Ignacio@gmail.com'),(214589,'Karina','Gil',1177589685,'Pasteur 200','Karina@gmail.com'),(215546,'Natalia','Franchini',1156874963,'Cordoba 110','Natalia@gmail.com'),(225546,'Alberto','Osman',1155554326,'Los toros 1144','Alberto@gmail.com'),(245689,'Jose','Lito',1133665566,'Anchorena 66','Jose@gmail.com'),(249865,'Ramiro','Fernandez',1133102546,'Uriburu 1110','Ramiro@gmail.com'),(265893,'Alejandra','Franco',1187956482,'Honduras 100','Alejandra@gmail.com');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Personal_Insert` AFTER INSERT ON `personal` FOR EACH ROW begin 
	insert into trigger_personal (Nombre_Personal, Apellido_Personal,accion,Legajo, fecha,usuario) values (new.Nombre_Personal, New.Apellido_Personal,"insert",new.Legajo, now(), system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Personal_Eliminacion` BEFORE DELETE ON `personal` FOR EACH ROW begin
		insert into trigger_personal (Nombre_Personal, Apellido_Personal, accion, Legajo, fecha,usuario) values (null, null, "delete", null, now(), system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `personal_vista`
--

DROP TABLE IF EXISTS `personal_vista`;
/*!50001 DROP VIEW IF EXISTS `personal_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personal_vista` AS SELECT 
 1 AS `Legajo`,
 1 AS `Apellido_Personal`,
 1 AS `Nombre_Personal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Id_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Id_Factura` int DEFAULT NULL,
  `Cuit_Proveedor` int DEFAULT NULL,
  `Nombre_Proveedor` varchar(100) DEFAULT NULL,
  `Telefono_Proveedor` int DEFAULT NULL,
  PRIMARY KEY (`Id_Proveedor`),
  KEY `Id_Factura` (`Id_Factura`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`Id_Factura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,1,-33445548,'Adrian Gonzales',1135684711),(2,2,-33551558,'Alan Varela',1544661100),(3,3,-33554451,'Nicolas Orsini',1589898966),(4,4,-33464464,'Oscar Romero',1122337788),(5,5,-54666627,'Dario Benedetto',1165889925);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `proveedor_vista`
--

DROP TABLE IF EXISTS `proveedor_vista`;
/*!50001 DROP VIEW IF EXISTS `proveedor_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proveedor_vista` AS SELECT 
 1 AS `Id_Proveedor`,
 1 AS `Nombre_Proveedor`,
 1 AS `Cuit_Proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recepcionista`
--

DROP TABLE IF EXISTS `recepcionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionista` (
  `Id_Recepcionista` int NOT NULL AUTO_INCREMENT,
  `Legajo` int DEFAULT NULL,
  `Rol_Designado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Recepcionista`),
  KEY `Legajo` (`Legajo`),
  CONSTRAINT `recepcionista_ibfk_1` FOREIGN KEY (`Legajo`) REFERENCES `personal` (`Legajo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
INSERT INTO `recepcionista` VALUES (1,154689,'Atencion al publico'),(2,249865,'Archivo'),(3,215546,'Calendario Medico'),(4,265893,'Liempieza'),(5,214589,'Jefa de personal');
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recepcionista_vista`
--

DROP TABLE IF EXISTS `recepcionista_vista`;
/*!50001 DROP VIEW IF EXISTS `recepcionista_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recepcionista_vista` AS SELECT 
 1 AS `Legajo`,
 1 AS `Rol_Designado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `Id_Reserva` int NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Reserva` int DEFAULT NULL,
  `Id_Recepcionista` int DEFAULT NULL,
  `Hora_Reserva` datetime DEFAULT NULL,
  `Pago_Reserva` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Id_Reserva`),
  KEY `Id_Recepcionista` (`Id_Recepcionista`),
  KEY `Id_Tipo_Reserva` (`Id_Tipo_Reserva`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Id_Recepcionista`) REFERENCES `recepcionista` (`Id_Recepcionista`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`Id_Tipo_Reserva`) REFERENCES `tipo_reserva` (`Id_Tipo_Reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,1,'2023-01-20 11:00:00',1564),(2,2,2,'2023-02-20 12:00:00',1100),(3,3,3,'2023-03-20 15:00:00',0),(4,4,4,'2023-04-20 17:00:00',1500),(5,5,5,'2023-05-20 10:00:00',2000);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_factura`
--

DROP TABLE IF EXISTS `tipo_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_factura` (
  `Id_Tipo_Factura` int NOT NULL AUTO_INCREMENT,
  `Tipo_Factura` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_Factura`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_factura`
--

LOCK TABLES `tipo_factura` WRITE;
/*!40000 ALTER TABLE `tipo_factura` DISABLE KEYS */;
INSERT INTO `tipo_factura` VALUES (1,'Factura C'),(2,'Factura A'),(3,'Factura B');
/*!40000 ALTER TABLE `tipo_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_matricula`
--

DROP TABLE IF EXISTS `tipo_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_matricula` (
  `Id_Tipo_Matricula` int NOT NULL AUTO_INCREMENT,
  `Tipo_Matricula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_matricula`
--

LOCK TABLES `tipo_matricula` WRITE;
/*!40000 ALTER TABLE `tipo_matricula` DISABLE KEYS */;
INSERT INTO `tipo_matricula` VALUES (1,'Nacional'),(2,'Provincial');
/*!40000 ALTER TABLE `tipo_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_reserva`
--

DROP TABLE IF EXISTS `tipo_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_reserva` (
  `Id_Tipo_Reserva` int NOT NULL AUTO_INCREMENT,
  `Descripcion_Reserva` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_Reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_reserva`
--

LOCK TABLES `tipo_reserva` WRITE;
/*!40000 ALTER TABLE `tipo_reserva` DISABLE KEYS */;
INSERT INTO `tipo_reserva` VALUES (1,'Turno programado para Operacion'),(2,'Turno programado por urgencia'),(3,'Turno programado por ingreso a un nuevo trabajo'),(4,'Turno programado por examen medico'),(5,'Turno programado por control');
/*!40000 ALTER TABLE `tipo_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--
/*!50003 DROP FUNCTION IF EXISTS `Bienvenida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Bienvenida`(Nombre_Paciente varchar(100), Apellido_Paciente varchar(100), Mail_Paciente varchar(100)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
		DECLARE Nombre_Completo varchar (100);
        set Nombre_Completo = concat(Nombre_Paciente, " ", Apellido_Paciente);
        if Mail_Paciente is NOT NULL then
        Return concat ("FUE AGENDADO CON EXITO SEÑOR/A: ", Nombre_Completo);
        ELSE
        Return "Usted no tiene registrado el coreo";
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Juntar_Nombres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Juntar_Nombres`(Nombre_Personal VARCHAR(100), Apellido_Personal VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    declare Nombre_Completo VARCHAR(100);
    set Nombre_Completo = Concat(Nombre_Personal, " ", Apellido_Personal);
    return Nombre_Completo ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ingresar_Ambulancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ingresar_Ambulancia`(
in modelo varchar(100), 
in patente varchar(100))
BEGIN

        insert into ambulancia (Modelo, Patente) value (modelo, patente);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordenar_columnas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_columnas`(in campo varchar(100), orden varchar(100))
BEGIN

			if (campo = "nombre") then
				 if (orden = "Ascendente") then
					select Nombre_Consultorio from hospital.consultorio order by Nombre_Consultorio asc;
					else
					select Nombre_Consultorio from hospital.consultorio order by Nombre_Consultorio desc;
				
                end if;
			end if;
			if (campo = "domicilio") then 
				 if (orden="Ascendente") then
					select Domicilio_Consultorio from hospital.consultorio  order by Domicilio_Consultorio asc;
				else 
					select Domicilio_Consultorio from hospital.consultorio order by Domicilio_Consultorio desc;
					
                end if;
			end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ambulancia_vista`
--

/*!50001 DROP VIEW IF EXISTS `ambulancia_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ambulancia_vista` AS select `ambulancia`.`Modelo` AS `Modelo`,`ambulancia`.`Patente` AS `Patente` from `ambulancia` order by `ambulancia`.`Patente` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_doctor`
--

/*!50001 DROP VIEW IF EXISTS `datos_doctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_doctor` AS select `d`.`Id_Doctor` AS `Id_Doctor`,`d`.`Legajo` AS `Legajo`,`d`.`Matricula` AS `Matricula`,`e`.`Tipo_Matricula` AS `Tipo_Matricula` from (`doctor` `d` join `tipo_matricula` `e` on((`d`.`Id_Tipo_Matricula` = `e`.`Id_Tipo_Matricula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_recepcionistas`
--

/*!50001 DROP VIEW IF EXISTS `datos_recepcionistas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_recepcionistas` AS select `p`.`Legajo` AS `Legajo`,`p`.`Nombre_Personal` AS `Nombre_Personal`,`p`.`Apellido_Personal` AS `Apellido_Personal`,`r`.`Rol_Designado` AS `Rol_Designado` from (`personal` `p` join `recepcionista` `r` on((`p`.`Legajo` = `r`.`Legajo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `obra_social_cargadas`
--

/*!50001 DROP VIEW IF EXISTS `obra_social_cargadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `obra_social_cargadas` AS select `obra_social`.`Id_Obra_Social` AS `Id_Obra_Social`,`obra_social`.`Tipo_Obra_Social` AS `Tipo_Obra_Social` from `obra_social` order by `obra_social`.`Id_Obra_Social` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_vista`
--

/*!50001 DROP VIEW IF EXISTS `personal_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_vista` AS select `personal`.`Legajo` AS `Legajo`,`personal`.`Apellido_Personal` AS `Apellido_Personal`,`personal`.`Nombre_Personal` AS `Nombre_Personal` from `personal` order by `personal`.`Legajo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proveedor_vista`
--

/*!50001 DROP VIEW IF EXISTS `proveedor_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proveedor_vista` AS select `proveedor`.`Id_Proveedor` AS `Id_Proveedor`,`proveedor`.`Nombre_Proveedor` AS `Nombre_Proveedor`,`proveedor`.`Cuit_Proveedor` AS `Cuit_Proveedor` from `proveedor` order by `proveedor`.`Nombre_Proveedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recepcionista_vista`
--

/*!50001 DROP VIEW IF EXISTS `recepcionista_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recepcionista_vista` AS select `recepcionista`.`Legajo` AS `Legajo`,`recepcionista`.`Rol_Designado` AS `Rol_Designado` from `recepcionista` order by `recepcionista`.`Legajo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 20:31:32
