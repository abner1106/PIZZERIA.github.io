/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pizzeria
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `especialidades` text DEFAULT NULL,
  `ingredientes` text DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES
(1,1,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(2,2,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(3,3,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(4,4,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(5,5,NULL,'Hamburguesa de Suprema',1,NULL,NULL,120.00,NULL),
(6,6,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(7,7,NULL,'Pizza Familiar 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, pepperoni',NULL,420.00,NULL),
(8,8,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(9,9,NULL,'Pizza Cuadrada',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña, queso1, queso2, queso3, queso4, pepperoni',NULL,420.00,NULL),
(10,10,NULL,'Hamburguesa de Suprema',1,NULL,NULL,120.00,NULL),
(11,11,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(12,11,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(13,12,NULL,'Pizza Grande 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña, queso1, queso2, queso3, queso4, pepperoni',NULL,350.00,NULL),
(15,13,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(16,14,NULL,'Smuttis Caramel',1,NULL,NULL,36.00,NULL),
(17,15,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(18,16,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(19,17,NULL,'Agua de Jamaica',1,NULL,NULL,25.00,NULL),
(20,18,NULL,'Pizza Chica 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, queso1, queso2, queso3, queso4, champiñones',NULL,235.00,NULL),
(21,19,NULL,'Smuttis Caramel',1,NULL,NULL,36.00,NULL),
(22,20,NULL,'Frapé de Oreo',1,NULL,NULL,38.00,NULL),
(23,21,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(24,22,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(25,22,NULL,'Agua Natural (Botella)',2,NULL,NULL,16.00,NULL),
(26,23,NULL,'Sidral Mundet 600ml',1,NULL,NULL,20.00,NULL),
(27,24,NULL,'Pizza Familiar Sola',1,'chorizo, frijoles, jalapeños, cebolla, jitomate',NULL,140.00,NULL),
(28,25,NULL,'Coca-Cola 600ml',1,NULL,NULL,20.00,NULL),
(29,26,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(30,27,NULL,'Pizza Chica 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña, tocino',NULL,230.00,NULL),
(31,28,NULL,'Alitas BBQ (12pz)',1,NULL,NULL,180.00,NULL),
(32,29,NULL,'Hamburguesa Doble Carne',2,NULL,NULL,100.00,NULL),
(33,30,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(34,31,NULL,'Pizza Cuadrada',1,'queso1, queso2, queso3, queso4',NULL,375.00,NULL),
(35,32,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(36,33,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(37,33,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(38,34,NULL,'Hamburguesa de Pollo',2,NULL,NULL,120.00,NULL),
(39,35,NULL,'Cafe Negro',1,NULL,NULL,20.00,NULL),
(40,36,NULL,'Chocomilk',1,NULL,NULL,30.00,NULL),
(41,36,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(42,37,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(43,38,NULL,'Hamburguesa de Lujo',1,NULL,NULL,100.00,NULL),
(44,39,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(45,40,NULL,'Pizza Mediana 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, queso1, queso2, queso3, queso4',NULL,255.00,NULL),
(46,41,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(47,42,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(48,42,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(49,43,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(50,44,NULL,'Pizza Cuadrada',1,'queso1, queso2, queso3, queso4',NULL,375.00,NULL),
(51,45,NULL,'Pizza Chica Sola',1,'chorizo, frijoles, jalapeños, cebolla, jitomate',NULL,120.00,NULL),
(52,45,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(53,46,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(54,46,NULL,'Pizza Mediana Sola',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña',NULL,155.00,NULL),
(55,47,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(56,48,NULL,'Pizza Grande 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña, queso1, queso2, queso3, queso4, pepperoni, pepperoni',NULL,365.00,NULL),
(57,49,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(58,49,NULL,'Coca-Cola 1.5L',1,NULL,NULL,28.00,NULL),
(59,50,NULL,'Pizza Chica Sola',1,'queso1, queso2, queso3, queso4',NULL,125.00,NULL),
(60,51,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(61,52,NULL,'Hamburguesa Doble Carne',2,NULL,NULL,160.00,NULL),
(62,53,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(63,54,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(64,55,NULL,'Coca-Cola 600ml',2,NULL,NULL,20.00,NULL),
(65,55,NULL,'Pizza Mediana 2x1',1,'queso1, queso2, queso3, queso4, pepperoni',NULL,245.00,NULL),
(66,56,NULL,'Sidral Mundet 600ml',1,NULL,NULL,100.00,NULL),
(67,57,NULL,'Hamburguesa de Pollo',1,NULL,NULL,100.00,NULL),
(68,58,NULL,'Pizza Chica 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña',NULL,215.00,NULL),
(70,60,NULL,'Limonada Mineral',1,NULL,NULL,30.00,NULL),
(71,61,NULL,'Pizza Mediana Sola',1,'queso1, queso2, queso3, queso4, pepperoni',NULL,155.00,NULL),
(72,62,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(73,63,NULL,'Hamburguesa Hawaiana',1,NULL,NULL,90.00,NULL),
(74,64,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(75,65,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(76,66,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(77,67,NULL,'Hamburguesa Sencilla',1,NULL,NULL,70.00,NULL),
(78,68,NULL,'Frape Mazapan',1,NULL,NULL,38.00,NULL),
(79,69,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(80,70,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(81,71,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(82,72,NULL,'Pizza Grande Sola',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, jamon, piña',NULL,175.00,NULL),
(83,73,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(84,73,NULL,'Agua de Horchata',1,NULL,NULL,25.00,NULL),
(85,76,NULL,'Mezcalina Jamaica',1,NULL,NULL,36.00,NULL),
(86,77,NULL,'Pizza Cuadrada',1,'chorizo, frijoles, jalapeños, cebolla, jitomate',NULL,370.00,NULL),
(87,78,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,'sfdgfhjk'),
(88,79,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(89,80,NULL,'Pizza Mediana Sola',1,'pepperoni, jamon, carne, tocino',NULL,142.00,NULL),
(90,81,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(91,81,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(92,82,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(93,82,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(94,83,NULL,'Pizza Chica 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, pepperoni, cebolla',NULL,218.00,NULL),
(95,83,NULL,'Hamburguesa Doble Carne',1,NULL,NULL,100.00,NULL),
(96,84,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(97,84,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(98,85,NULL,'Agua de Jamaica',1,NULL,NULL,25.00,NULL),
(99,85,NULL,'Pizza Familiar 2x1',1,'chorizo, frijoles, jalapeños, cebolla, jitomate, tocino',NULL,425.00,NULL),
(100,86,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(101,86,NULL,'Frapé de Oreo',1,NULL,NULL,38.00,NULL),
(102,87,NULL,'Coca-Cola 3L',1,NULL,NULL,38.00,NULL),
(103,87,NULL,'Chocomilk',1,NULL,NULL,22.00,NULL),
(104,88,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(105,88,NULL,'Pizza Grande Sola',1,'chorizo, frijoles, jalapeños, cebolla, jitomate',NULL,160.00,NULL),
(106,88,NULL,'Hamburguesa de Pollo',1,NULL,NULL,120.00,NULL),
(107,89,NULL,'Alitas Mango Habanero (12pz)',1,NULL,NULL,180.00,NULL),
(108,90,NULL,'Hamburguesa de Lujo',1,NULL,NULL,120.00,NULL),
(109,90,NULL,'Agua de Horchata',1,NULL,NULL,25.00,NULL);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('venta','administrativo','recepcionista') DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES
(1,'Empleado Eliminado','administrativo','eliminado','12345'),
(2,'abner','administrativo','abner1','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(3,'abner','venta','abner','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5'),
(4,'pancho','recepcionista','pancho','c111e00dc038b0b7b0f8d40ad6a16f9252a0b298186010e282d12a431a8a9e9a'),
(5,'emmanuel diaz','venta','emmma','a76de8e358269a41ec4fa5d35442d166753749e8ee02de1cc1f31b1d70ce94bd'),
(16,'jualian paz','venta','paz','979caf8bcc8e83b42eedbfd04bfcba38201180c03598b278119640078874fd23'),
(18,'Fermin hernandez','venta','fermin','1e62cf431e39679b64e08bdec70aaeef4d0ae306b4290c63d1b5706681503eb4');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_ingredientes`
--

DROP TABLE IF EXISTS `producto_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_ingredientes` (
  `id_producto` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `producto_ingredientes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `producto_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_ingredientes`
--

LOCK TABLES `producto_ingredientes` WRITE;
/*!40000 ALTER TABLE `producto_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `cantidad_disponible` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Hamburguesa Doble Carne','Hamburguesa Doble Carne',100.00,1,1),
(2,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(3,'Hamburguesa Sencilla','Hamburguesa Sencilla',70.00,1,1),
(4,'Hamburguesa Sencilla','Hamburguesa Sencilla',70.00,1,1),
(5,'Frape Mazapan','Frape Mazapan',38.00,1,1),
(6,'Chocomilk','Chocomilk',22.00,1,1),
(7,'Hamburguesa Doble Carne','Hamburguesa Doble Carne',100.00,1,1),
(8,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(9,'Pizza Grande Sola','Pizza Grande Sola',175.00,1,1),
(10,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(11,'Agua de Horchata','Agua de Horchata',25.00,1,1),
(12,'Mezcalina Jamaica','Mezcalina Jamaica',36.00,1,1),
(13,'Pizza Cuadrada','Pizza Cuadrada',370.00,1,1),
(14,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(15,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(16,'Pizza Mediana Sola','Pizza Mediana Sola',142.00,1,1),
(17,'Chocomilk','Chocomilk',22.00,1,1),
(18,'Hamburguesa de Lujo','Hamburguesa de Lujo',120.00,1,1),
(19,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(20,'Chocomilk','Chocomilk',22.00,1,1),
(21,'Pizza Chica 2x1','Pizza Chica 2x1',218.00,1,1),
(22,'Hamburguesa Doble Carne','Hamburguesa Doble Carne',100.00,1,1),
(23,'Coca-Cola 3L','Coca-Cola 3L',38.00,1,1),
(24,'Coca-Cola 3L','Coca-Cola 3L',38.00,1,1),
(25,'Agua de Jamaica','Agua de Jamaica',25.00,1,1),
(26,'Pizza Familiar 2x1','Pizza Familiar 2x1',425.00,1,1),
(27,'Chocomilk','Chocomilk',22.00,1,1),
(28,'Frapé de Oreo','Frapé de Oreo',38.00,1,1),
(29,'Coca-Cola 3L','Coca-Cola 3L',38.00,1,1),
(30,'Chocomilk','Chocomilk',22.00,1,1),
(31,'Hamburguesa de Lujo','Hamburguesa de Lujo',120.00,1,1),
(32,'Pizza Grande Sola','Pizza Grande Sola',160.00,1,1),
(33,'Hamburguesa de Pollo','Hamburguesa de Pollo',120.00,1,1),
(34,'Alitas Mango Habanero (12pz)','Alitas Mango Habanero (12pz)',180.00,1,1),
(35,'Hamburguesa de Lujo','Hamburguesa de Lujo',120.00,1,1),
(36,'Agua de Horchata','Agua de Horchata',25.00,1,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retiros_caja`
--

DROP TABLE IF EXISTS `retiros_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retiros_caja` (
  `id_retiro` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `motivo` text NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_retiro`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `retiros_caja_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retiros_caja`
--

LOCK TABLES `retiros_caja` WRITE;
/*!40000 ALTER TABLE `retiros_caja` DISABLE KEYS */;
INSERT INTO `retiros_caja` VALUES
(16,1,100.00,'Gasto operativo','2025-10-23 17:23:38');
/*!40000 ALTER TABLE `retiros_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `TIPO_VENTA` enum('local','domicilio') DEFAULT NULL,
  `cliente_nombre` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `detalles` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `metodo_pago` enum('efectivo','tarjeta','transferencia') NOT NULL,
  `concepto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES
(1,1,'local',NULL,NULL,NULL,100.00,NULL,'2025-07-25 17:41:32','efectivo',NULL),
(2,1,'local',NULL,NULL,NULL,100.00,NULL,'2025-07-25 17:50:00','efectivo',NULL),
(3,1,'local',NULL,NULL,NULL,120.00,NULL,'2025-07-25 17:57:34','efectivo',NULL),
(4,1,'local',NULL,NULL,NULL,100.00,NULL,'2025-07-25 18:04:43','efectivo',NULL),
(5,1,'local',NULL,NULL,NULL,120.00,NULL,'2025-07-25 18:08:01','efectivo',NULL),
(6,1,'local','Cliente no identificado',NULL,NULL,70.00,NULL,'2025-07-25 18:49:37','efectivo',NULL),
(7,1,'local','Cliente no identificado',NULL,NULL,420.00,NULL,'2025-07-25 18:59:41','efectivo',NULL),
(8,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-07-25 19:02:00','efectivo',NULL),
(9,1,'local','Cliente no identificado',NULL,NULL,420.00,NULL,'2025-07-25 19:06:23','efectivo',NULL),
(10,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-07-25 19:13:09','efectivo',NULL),
(11,1,'local','Cliente no identificado',NULL,NULL,158.00,NULL,'2025-07-25 21:07:18','efectivo',NULL),
(12,1,'local','Cliente no identificado',NULL,NULL,388.00,NULL,'2025-07-26 13:31:55','efectivo',NULL),
(13,1,'local','Cliente no identificado',NULL,NULL,70.00,NULL,'2025-07-26 15:41:59','efectivo',NULL),
(14,1,'local','Cliente no identificado',NULL,NULL,36.00,NULL,'2025-07-26 15:47:56','efectivo',NULL),
(15,1,'local','Cliente no identificado',NULL,NULL,70.00,NULL,'2025-07-26 15:57:08','transferencia',NULL),
(16,1,'local','Cliente no identificado',NULL,NULL,22.00,NULL,'2025-07-26 16:06:32','transferencia',NULL),
(17,1,'local','Cliente no identificado',NULL,NULL,25.00,NULL,'2025-07-26 16:39:47','transferencia',NULL),
(18,1,'local','Cliente no identificado',NULL,NULL,235.00,NULL,'2025-07-26 16:52:17','efectivo',NULL),
(19,1,'local','Cliente no identificado',NULL,NULL,36.00,NULL,'2025-07-26 17:03:49','efectivo',NULL),
(20,1,'local','Cliente no identificado',NULL,NULL,38.00,NULL,'2025-07-26 17:04:52','efectivo',NULL),
(21,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-07-26 17:06:04','efectivo',NULL),
(22,1,'local','Cliente no identificado',NULL,NULL,152.00,NULL,'2025-07-26 17:19:23','transferencia',NULL),
(23,1,'local','Cliente no identificado',NULL,NULL,20.00,NULL,'2025-07-26 17:20:44','efectivo',NULL),
(24,1,'local','Cliente no identificado',NULL,NULL,140.00,NULL,'2025-07-26 18:14:26','transferencia',NULL),
(25,1,'local','Cliente no identificado',NULL,NULL,20.00,NULL,'2025-07-27 11:02:43','efectivo',NULL),
(26,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-07-27 11:13:09','transferencia',NULL),
(27,1,'local','Cliente no identificado',NULL,NULL,230.00,NULL,'2025-07-27 13:42:53','efectivo',NULL),
(28,1,'local','Cliente no identificado',NULL,NULL,180.00,NULL,'2025-07-27 17:30:22','efectivo',NULL),
(29,1,'local','Cliente no identificado',NULL,NULL,200.00,NULL,'2025-07-29 10:48:04','transferencia',NULL),
(30,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-07-29 19:22:21','transferencia',NULL),
(31,1,'local','Cliente no identificado',NULL,NULL,375.00,NULL,'2025-07-29 19:55:03','efectivo',NULL),
(32,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-07-30 11:51:54','efectivo',NULL),
(33,1,'local','Cliente no identificado',NULL,NULL,158.00,NULL,'2025-08-01 14:25:42','transferencia',NULL),
(34,1,'local','Cliente no identificado',NULL,NULL,240.00,NULL,'2025-08-01 14:39:06','efectivo',NULL),
(35,1,'local','Cliente no identificado',NULL,NULL,20.00,NULL,'2025-08-05 13:47:37','efectivo',NULL),
(36,1,'local','Cliente no identificado',NULL,NULL,130.00,NULL,'2025-08-06 13:06:51','efectivo',NULL),
(37,1,'local','Cliente no identificado',NULL,NULL,22.00,NULL,'2025-08-06 13:15:35','transferencia',NULL),
(38,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-08-06 13:30:39','transferencia',NULL),
(39,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-08-11 14:48:47','efectivo',NULL),
(40,1,'local','Cliente no identificado',NULL,NULL,255.00,NULL,'2025-08-11 18:08:42','transferencia',NULL),
(41,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-08-11 18:13:40','transferencia',NULL),
(42,1,'local','Cliente no identificado',NULL,NULL,158.00,NULL,'2025-08-11 18:37:05','efectivo',NULL),
(43,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-08-12 18:43:05','transferencia',NULL),
(44,1,'local','Cliente no identificado',NULL,NULL,375.00,NULL,'2025-08-18 18:17:12','transferencia',NULL),
(45,1,'local','Cliente no identificado',NULL,NULL,190.00,NULL,'2025-08-26 10:48:09','efectivo',NULL),
(46,1,'local','Cliente no identificado',NULL,NULL,255.00,NULL,'2025-08-26 15:06:41','efectivo',NULL),
(47,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-09-02 10:47:57','efectivo',NULL),
(48,1,'local','Cliente no identificado',NULL,NULL,365.00,NULL,'2025-09-02 10:52:17','transferencia',NULL),
(49,1,'local','Cliente no identificado',NULL,NULL,128.00,NULL,'2025-09-02 11:00:11','efectivo',NULL),
(50,1,'local','Cliente no identificado',NULL,NULL,125.00,NULL,'2025-09-03 09:48:20','efectivo',NULL),
(51,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-09-23 09:37:13','transferencia',NULL),
(52,1,'local','Cliente no identificado',NULL,NULL,320.00,NULL,'2025-09-24 09:39:58','efectivo',NULL),
(53,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-09-29 08:58:00','efectivo',NULL),
(54,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-02 11:21:19','transferencia',NULL),
(55,1,'local','Cliente no identificado',NULL,NULL,285.00,NULL,'2025-10-02 13:29:19','efectivo',NULL),
(56,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-04 17:06:46','transferencia',NULL),
(57,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-07 13:40:55','transferencia',NULL),
(58,1,'local','Cliente no identificado',NULL,NULL,215.00,NULL,'2025-10-08 09:25:09','efectivo',NULL),
(60,1,'local','Cliente no identificado',NULL,NULL,30.00,NULL,'2025-10-09 14:49:23','efectivo',NULL),
(61,1,'local','Cliente no identificado',NULL,NULL,155.00,NULL,'2025-10-09 18:39:09','efectivo',NULL),
(62,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-09 18:40:08','transferencia',NULL),
(63,1,'local','Cliente no identificado',NULL,NULL,90.00,NULL,'2025-10-09 22:46:51','transferencia',NULL),
(64,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-09 23:00:21','transferencia',NULL),
(65,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-10-09 23:00:51','transferencia',NULL),
(66,1,'local','Cliente no identificado',NULL,NULL,70.00,NULL,'2025-10-09 23:03:39','efectivo',NULL),
(67,1,'local','Cliente no identificado',NULL,NULL,70.00,NULL,'2025-10-09 23:04:54','transferencia',NULL),
(68,1,'local','Cliente no identificado',NULL,NULL,38.00,NULL,'2025-10-09 23:28:01','transferencia',NULL),
(69,1,'local','Cliente no identificado',NULL,NULL,22.00,NULL,'2025-10-09 23:29:09','transferencia',NULL),
(70,1,'local','Cliente no identificado',NULL,NULL,100.00,NULL,'2025-10-10 00:04:43','transferencia',NULL),
(71,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-10-10 00:14:35','efectivo',NULL),
(72,1,'local','Cliente no identificado',NULL,NULL,175.00,NULL,'2025-10-10 11:30:08','transferencia',NULL),
(73,1,'local','Cliente no identificado',NULL,NULL,145.00,NULL,'2025-10-15 22:42:37','efectivo',NULL),
(76,1,'local','Cliente no identificado',NULL,NULL,36.00,NULL,'2025-10-16 10:40:53','transferencia',NULL),
(77,1,'local','Cliente no identificado',NULL,NULL,370.00,NULL,'2025-10-16 10:46:30','transferencia',NULL),
(78,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-10-19 18:14:44','transferencia',NULL),
(79,1,'local','Cliente no identificado',NULL,NULL,120.00,NULL,'2025-10-19 18:15:40','transferencia',NULL),
(80,1,'local','Cliente no identificado',NULL,NULL,142.00,NULL,'2025-10-22 23:28:24','efectivo',NULL),
(81,1,'local','Cliente no identificado',NULL,NULL,142.00,NULL,'2025-10-23 17:23:15','efectivo',NULL),
(82,1,'local','Cliente no identificado',NULL,NULL,142.00,NULL,'2025-10-23 17:25:25','efectivo',NULL),
(83,2,'local','Cliente no identificado',NULL,NULL,318.00,NULL,'2025-10-23 17:42:22','transferencia',NULL),
(84,1,'local','Cliente no identificado',NULL,NULL,76.00,NULL,'2025-10-23 17:44:29','transferencia',NULL),
(85,2,'local','Cliente no identificado',NULL,NULL,450.00,NULL,'2025-10-23 17:45:43','efectivo',NULL),
(86,2,'local','Cliente no identificado',NULL,NULL,60.00,NULL,'2025-10-23 17:50:39','transferencia',NULL),
(87,2,'local','Cliente no identificado',NULL,NULL,60.00,NULL,'2025-10-27 11:11:28','efectivo',NULL),
(88,2,'local','Cliente no identificado',NULL,NULL,400.00,NULL,'2025-10-27 11:13:02','efectivo',NULL),
(89,2,'local','Cliente no identificado',NULL,NULL,180.00,NULL,'2025-10-27 11:15:21','transferencia',NULL),
(90,2,'local','Cliente no identificado',NULL,NULL,145.00,NULL,'2025-11-04 13:39:45','efectivo',NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-12 14:54:34
