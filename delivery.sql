-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2022 a las 22:03:46
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delivery`
--
DROP DATABASE IF EXISTS `delivery`;
CREATE DATABASE IF NOT EXISTS `delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `delivery`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--
-- Creación: 16-06-2022 a las 20:00:53
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE `carrito` (
  `idCarrito` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen_pr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `carrito`:
--   `idUsuario`
--       `login` -> `idUsuario`
--   `idProducto`
--       `productos` -> `idProducto`
--   `imagen_pr`
--       `img_productos` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--
-- Creación: 16-06-2022 a las 18:47:45
--

DROP TABLE IF EXISTS `detallepedido`;
CREATE TABLE `detallepedido` (
  `idDetalle` int(11) NOT NULL,
  `idOrden` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `detallepedido`:
--   `idOrden`
--       `orden` -> `idOrden`
--   `idProducto`
--       `productos` -> `idProducto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img_productos`
--
-- Creación: 16-06-2022 a las 19:56:01
--

DROP TABLE IF EXISTS `img_productos`;
CREATE TABLE `img_productos` (
  `id` int(11) NOT NULL,
  `nombre_img` varchar(100) NOT NULL,
  `imagen` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `img_productos`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--
-- Creación: 16-06-2022 a las 18:47:45
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `idItem` int(3) NOT NULL,
  `Item` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `items`:
--

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`idItem`, `Item`) VALUES
(1, 'tipo de documento'),
(2, 'tipo de unidad'),
(3, 'metodo de pago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--
-- Creación: 16-06-2022 a las 19:49:53
-- Última actualización: 16-06-2022 a las 19:49:53
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `idUsuario` int(100) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `telefono` bigint(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `login`:
--

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`idUsuario`, `correo`, `contraseña`, `telefono`, `nombre`, `apellido`) VALUES
(2, 'julian.john@misena.edu.co', 'sena', 6053222222, 'julian', 'john');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--
-- Creación: 16-06-2022 a las 18:47:45
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `idOrden` int(100) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `metodoPago` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `orden`:
--   `idUsuario`
--       `login` -> `idUsuario`
--   `metodoPago`
--       `subitems` -> `idSubitem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 16-06-2022 a las 19:57:39
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idProducto` int(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo de unidad` int(3) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `productos`:
--   `tipo de unidad`
--       `subitems` -> `idSubitem`
--   `imagen_pro`
--       `img_productos` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subitems`
--
-- Creación: 16-06-2022 a las 18:47:45
-- Última actualización: 16-06-2022 a las 19:50:14
--

DROP TABLE IF EXISTS `subitems`;
CREATE TABLE `subitems` (
  `idSubitem` int(3) NOT NULL,
  `idItem` int(11) NOT NULL,
  `subitem` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `subitems`:
--   `idItem`
--       `items` -> `idItem`
--

--
-- Volcado de datos para la tabla `subitems`
--

INSERT INTO `subitems` (`idSubitem`, `idItem`, `subitem`) VALUES
(4, 2, 'Unidad'),
(9, 3, 'Efectivo'),
(10, 3, 'Tarjeta de credito'),
(13, 3, 'PSE'),
(14, 3, 'Paypal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `imagen_pr` (`imagen_pr`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idOrden` (`idOrden`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `cantidad` (`cantidad`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `img_productos`
--
ALTER TABLE `img_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`idItem`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `metodoPago` (`metodoPago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `tipo de unidad` (`tipo de unidad`),
  ADD KEY `imagen_pro` (`imagen_pro`);

--
-- Indices de la tabla `subitems`
--
ALTER TABLE `subitems`
  ADD PRIMARY KEY (`idSubitem`),
  ADD KEY `idItem` (`idItem`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img_productos`
--
ALTER TABLE `img_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `idItem` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idUsuario` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subitems`
--
ALTER TABLE `subitems`
  MODIFY `idSubitem` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `login` (`idUsuario`),
  ADD CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `carrito_ibfk_4` FOREIGN KEY (`imagen_pr`) REFERENCES `img_productos` (`id`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `orden` (`idOrden`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `login` (`idUsuario`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`metodoPago`) REFERENCES `subitems` (`idSubitem`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`tipo de unidad`) REFERENCES `subitems` (`idSubitem`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`imagen_pro`) REFERENCES `img_productos` (`id`);

--
-- Filtros para la tabla `subitems`
--
ALTER TABLE `subitems`
  ADD CONSTRAINT `subitems_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `items` (`idItem`);


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla carrito
--

--
-- Metadatos para la tabla detallepedido
--

--
-- Metadatos para la tabla img_productos
--

--
-- Metadatos para la tabla items
--

--
-- Metadatos para la tabla login
--

--
-- Metadatos para la tabla orden
--

--
-- Metadatos para la tabla productos
--

--
-- Metadatos para la tabla subitems
--

--
-- Metadatos para la base de datos delivery
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
