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
-- Dumping data for table `ambulancia`
--

LOCK TABLES `ambulancia` WRITE;
/*!40000 ALTER TABLE `ambulancia` DISABLE KEYS */;
INSERT INTO `ambulancia` VALUES (1,'PEUGEOT','ACD546'),(2,'MERCEDES','JFW879'),(3,'RANGER','ASD578'),(4,'FORD','KOL134'),(5,'PALIO','ACK551');
/*!40000 ALTER TABLE `ambulancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'Hospital Roca','Avenida Montevideo 168',1122556688,'hospRoca@Outlook.com'),(2,'Hospital Flores','Avenida Los Pasos 115',35489967,'hospFlores@Outlook.com'),(3,'Hospital Cuidados Graves','Avenida Hidalgo 487',1145779368,'hospCuidadosGraves@Outlook.com'),(4,'Hospital Jose San Martin','Triunbirato 500',1144751986,'hospJoseSanMartin@Outlook.com'),(5,'Hospital Duran','Vera 100',1144778844,'hospDuran@Outlook.com');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,210211,1,4568,1),(2,16554,2,5544,2),(3,211123,1,4896,3),(4,225546,2,4892,4),(5,245689,1,4875,5);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Traumatologia'),(2,'Kinesiologia'),(3,'Odontologia'),(4,'Oftalmologia'),(5,'Urologia');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'Lomas','Atencion Kinesiologo',10000,'2023-02-06'),(2,2,'Paternal','Atencion Odontologia',30000,'2023-03-22'),(3,3,'Avellaneda','Traslado Ambulancia',50000,'2023-04-30'),(4,1,'Puerto Madero','Traslado Ambulancia',50000,'2023-11-22'),(5,2,'Avellaneda','Atencion Odontologica ',80000,'2023-07-11');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,1,1,1,1,1,1),(2,2,2,2,2,2,2),(3,3,3,3,3,3,3),(4,4,4,4,4,4,4),(5,5,5,5,5,5,5);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `obra_social`
--

LOCK TABLES `obra_social` WRITE;
/*!40000 ALTER TABLE `obra_social` DISABLE KEYS */;
INSERT INTO `obra_social` VALUES (1,'PARTICULAR'),(2,'OSDE'),(3,'PAMI'),(4,'GALENO'),(5,'DOSUBA');
/*!40000 ALTER TABLE `obra_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Sebastian','Meister',1144668899,1,'Sebastian@hotmail.com','1989-05-01'),(2,'Fabian','De la Madrid',115512345,2,'Fabian@hotmail.com','1870-06-02'),(3,'German','Garmendia',1165887700,3,'Sebastian@hotmail.com','1877-07-03'),(4,'Natalia','Corro',1100002211,4,'Fernanda@hotmail.com','1866-08-04'),(5,'Lucas','Vasconi',1545779012,5,'Lucas@hotmail.com','1997-11-20');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (16554,'Fermin','Alonso',1165489688,'Combatientes 11','Fermin@gmail.com'),(154689,'Lucas','Perez',1145889672,'Berutti 10','LucaS@gmail.com'),(210211,'Agustin','Lopez',1164656465,'Av Corrientes 1154','Agustin@gmail.com'),(211123,'Ignacio','Liz',1534887799,'Av Cordoba 1654','Ignacio@gmail.com'),(214589,'Karina','Gil',1177589685,'Pasteur 200','Karina@gmail.com'),(215546,'Natalia','Franchini',1156874963,'Cordoba 110','Natalia@gmail.com'),(225546,'Alberto','Osman',1155554326,'Los toros 1144','Alberto@gmail.com'),(245689,'Jose','Lito',1133665566,'Anchorena 66','Jose@gmail.com'),(249865,'Ramiro','Fernandez',1133102546,'Uriburu 1110','Ramiro@gmail.com'),(265893,'Alejandra','Franco',1187956482,'Honduras 100','Alejandra@gmail.com');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,1,-33445548,'Adrian Gonzales',1135684711),(2,2,-33551558,'Alan Varela',1544661100),(3,3,-33554451,'Nicolas Orsini',1589898966),(4,4,-33464464,'Oscar Romero',1122337788),(5,5,-54666627,'Dario Benedetto',1165889925);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
INSERT INTO `recepcionista` VALUES (1,154689,'Atencion al publico'),(2,249865,'Archivo'),(3,215546,'Calendario Medico'),(4,265893,'Liempieza'),(5,214589,'Jefa de personal');
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,1,'2023-01-20 11:00:00',1564),(2,2,2,'2023-02-20 12:00:00',1100),(3,3,3,'2023-03-20 15:00:00',0),(4,4,4,'2023-04-20 17:00:00',1500),(5,5,5,'2023-05-20 10:00:00',2000);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_factura`
--

LOCK TABLES `tipo_factura` WRITE;
/*!40000 ALTER TABLE `tipo_factura` DISABLE KEYS */;
INSERT INTO `tipo_factura` VALUES (1,'Factura C'),(2,'Factura A'),(3,'Factura B');
/*!40000 ALTER TABLE `tipo_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_matricula`
--

LOCK TABLES `tipo_matricula` WRITE;
/*!40000 ALTER TABLE `tipo_matricula` DISABLE KEYS */;
INSERT INTO `tipo_matricula` VALUES (1,'Nacional'),(2,'Provincial');
/*!40000 ALTER TABLE `tipo_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_reserva`
--

LOCK TABLES `tipo_reserva` WRITE;
/*!40000 ALTER TABLE `tipo_reserva` DISABLE KEYS */;
INSERT INTO `tipo_reserva` VALUES (1,'Turno programado para Operacion'),(2,'Turno programado por urgencia'),(3,'Turno programado por ingreso a un nuevo trabajo'),(4,'Turno programado por examen medico'),(5,'Turno programado por control');
/*!40000 ALTER TABLE `tipo_reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 20:39:22
