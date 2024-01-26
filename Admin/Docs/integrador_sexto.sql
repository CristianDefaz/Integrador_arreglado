-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-01-2024 a las 01:47:20
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `integrador_sexto`
--
CREATE DATABASE IF NOT EXISTS `integrador_sexto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `integrador_sexto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

DROP TABLE IF EXISTS `carrito_compras`;
CREATE TABLE `carrito_compras` (
  `carritoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `ProductoID` int(11) DEFAULT NULL,
  `carrito_cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `carrito_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `carrito_compras`:
--   `ClienteID`
--       `clientes` -> `ClienteID`
--   `ProductoID`
--       `productos` -> `ProductoID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `categorias`:
--

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CategoriaID`, `Nombre`, `Descripcion`, `Estado`) VALUES
(1, 'RAM', 'DDR3,DDR4,DDR5', ''),
(2, 'Procesadores', 'dsd', ''),
(3, 'Tarjetas Graficas', 'sdsd', ''),
(4, 'Almacenamiento', 'dasd', ''),
(5, 'Motherboard', 'asd', ''),
(6, 'Gabienetes', 'asd', ''),
(7, 'Fuente de poder', 'asd', ''),
(8, 'Ventiladores y disipadores', 'asd', ''),
(10, 'case', 'asd', 'No_Publicar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `clientes`:
--

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Correo`, `Contrasena`, `Nombre`, `Ciudad`, `Pais`, `Direccion`, `Telefono`) VALUES
(1, 'ks@g.com', '123', 'kevin sanchez', 'Riobamba', 'Ecuador', 'Velazco y orozco', '099282312');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordendetalle`
--

DROP TABLE IF EXISTS `ordendetalle`;
CREATE TABLE `ordendetalle` (
  `OrdenDetalleID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `OrdenID` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `ordendetalle`:
--   `OrdenID`
--       `ordenes` -> `OrdenID`
--   `ProductoID`
--       `productos` -> `ProductoID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
CREATE TABLE `ordenes` (
  `OrdenID` int(11) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL COMMENT 'Este se calcula Orden detalle con precio y cantidad',
  `FormaEnvio` varchar(100) NOT NULL,
  `DireccionEnvio` varchar(100) NOT NULL,
  `FechaOrden` datetime NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `ordenes`:
--   `ClienteID`
--       `clientes` -> `ClienteID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabrasia`
--

DROP TABLE IF EXISTS `palabrasia`;
CREATE TABLE `palabrasia` (
  `codigo` int(11) NOT NULL,
  `palabras` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `palabrasia`:
--

--
-- Volcado de datos para la tabla `palabrasia`
--

INSERT INTO `palabrasia` (`codigo`, `palabras`) VALUES
(1, 'RAM'),
(2, 'ram'),
(3, 'computadora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `ProductoID` int(11) NOT NULL COMMENT 'ID TABLA',
  `CodigoReferencia` varchar(20) NOT NULL COMMENT 'CODIGO_REFERENCIA_PRODUCTOS',
  `Nombre` varchar(100) NOT NULL COMMENT 'NOMBRE_PRODCUTO',
  `Precio` decimal(10,2) NOT NULL COMMENT 'PRECIO_PRODUCTO',
  `Descripcion` text NOT NULL COMMENT 'DESCRIPCION_PRODUCTO',
  `Imagen` text NOT NULL COMMENT 'IMAGEN_PRODUCTO',
  `CategoriaID` int(11) NOT NULL COMMENT 'CATEGORIA_PRODUCTO',
  `FechaIngreso` datetime NOT NULL COMMENT 'FECHA_QUE_INGRESO_PRODCUCTO',
  `Stock` int(11) NOT NULL COMMENT 'CANTIDAD_PRODUCTO',
  `Iva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `productos`:
--   `CategoriaID`
--       `categorias` -> `CategoriaID`
--

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoID`, `CodigoReferencia`, `Nombre`, `Precio`, `Descripcion`, `Imagen`, `CategoriaID`, `FechaIngreso`, `Stock`, `Iva`) VALUES
(23, '444', 'RAM DDR3 4 GB', 200.00, 'ninguno', '../../Public/assets/images/products1261210.png', 1, '2024-01-27 21:21:00', 18, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productospago`
--

DROP TABLE IF EXISTS `productospago`;
CREATE TABLE `productospago` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `productospago`:
--   `ClienteID`
--       `clientes` -> `ClienteID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `UsuarioId` int(11) NOT NULL,
  `Cedula` varchar(17) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Telefono` varchar(17) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Contrasenia` text NOT NULL,
  `Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- RELACIONES PARA LA TABLA `usuarios`:
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsuarioId`, `Cedula`, `Nombres`, `Apellidos`, `Telefono`, `Correo`, `Contrasenia`, `Rol`) VALUES
(1, '2300035421', 'Jhonny ', 'Miranda', '023791167', 'm@g.com', '202cb962ac59075b964b07152d234b70', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`carritoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoriaID`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  ADD PRIMARY KEY (`OrdenDetalleID`),
  ADD KEY `ProductoID` (`ProductoID`),
  ADD KEY `OrdenID` (`OrdenID`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`OrdenID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `palabrasia`
--
ALTER TABLE `palabrasia`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoID`),
  ADD UNIQUE KEY `CodigoReferencia` (`CodigoReferencia`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Indices de la tabla `productospago`
--
ALTER TABLE `productospago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  MODIFY `carritoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  MODIFY `OrdenDetalleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `OrdenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `palabrasia`
--
ALTER TABLE `palabrasia`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID TABLA', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productospago`
--
ALTER TABLE `productospago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  ADD CONSTRAINT `carrito_compras_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`);

--
-- Filtros para la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  ADD CONSTRAINT `ordendetalle_ibfk_1` FOREIGN KEY (`OrdenID`) REFERENCES `ordenes` (`OrdenID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordendetalle_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productospago`
--
ALTER TABLE `productospago`
  ADD CONSTRAINT `productospago_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
