-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2020 a las 17:23:08
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursadb`
--
CREATE DATABASE IF NOT EXISTS `cursadb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cursadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo_categoria` enum('Home','Dona') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `nombre_categoria`, `sexo_categoria`) VALUES
(1, 'Alevin (0-6 Anys)', 'Home'),
(2, 'Infantil (7-10 Anys)', 'Home'),
(3, 'Cadete (11-20 Anys)', 'Home'),
(4, 'Juvenil  (21-50 Anys)', 'Home'),
(5, 'Senior  (51-100 Anys)', 'Home'),
(6, 'Alevin (0-6 Anys)', 'Dona'),
(7, 'Infantil (7-10 Anys)', 'Dona'),
(8, 'Cadete (11-20 Anys)', 'Dona'),
(9, 'Juvenil  (21-50 Anys)', 'Dona'),
(10, 'Senior  (51-100 Anys)', 'Dona'),
(11, 'Discapacitat', 'Home'),
(12, 'Discapacitat', 'Dona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cursa`
--

CREATE TABLE `tbl_cursa` (
  `id_cursa` int(11) NOT NULL,
  `nombre_cursa` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_cursa`
--

INSERT INTO `tbl_cursa` (`id_cursa`, `nombre_cursa`, `fecha`) VALUES
(1, 'Cursa Bellvitge', '2021-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inscripcio`
--

CREATE TABLE `tbl_inscripcio` (
  `dorsal_participant` int(11) NOT NULL,
  `id_participant` int(11) NOT NULL,
  `id_cursa` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `isPagado` enum('Si','No') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_inscripcio`
--

INSERT INTO `tbl_inscripcio` (`dorsal_participant`, `id_participant`, `id_cursa`, `id_categoria`, `isPagado`) VALUES
(1, 1, 1, 3, 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_participant`
--

CREATE TABLE `tbl_participant` (
  `id_participant` int(11) NOT NULL,
  `dni_participant` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `nom_participant` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `primer_cognom` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `segon_cognom` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `data_naixement` date NOT NULL,
  `email_participant` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `sexe_participant` varchar(9) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_participant`
--

INSERT INTO `tbl_participant` (`id_participant`, `dni_participant`, `nom_participant`, `primer_cognom`, `segon_cognom`, `data_naixement`, `email_participant`, `sexe_participant`) VALUES
(1, '49189516Z', 'Xavier', 'Jaramillo', 'Vives', '1999-11-17', 'xavijvives@gmail.com', 'Home');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `tbl_cursa`
--
ALTER TABLE `tbl_cursa`
  ADD PRIMARY KEY (`id_cursa`);

--
-- Indices de la tabla `tbl_inscripcio`
--
ALTER TABLE `tbl_inscripcio`
  ADD PRIMARY KEY (`dorsal_participant`),
  ADD KEY `FK_INSCRIPCIO_PARTICIPANT` (`id_participant`),
  ADD KEY `FK_INSCRIPCIO_CURSA` (`id_cursa`),
  ADD KEY `FK_INSCRIPCIO_CATEGORIA` (`id_categoria`);

--
-- Indices de la tabla `tbl_participant`
--
ALTER TABLE `tbl_participant`
  ADD PRIMARY KEY (`id_participant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tbl_cursa`
--
ALTER TABLE `tbl_cursa`
  MODIFY `id_cursa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_inscripcio`
--
ALTER TABLE `tbl_inscripcio`
  MODIFY `dorsal_participant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `tbl_participant`
--
ALTER TABLE `tbl_participant`
  MODIFY `id_participant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_inscripcio`
--
ALTER TABLE `tbl_inscripcio`
  ADD CONSTRAINT `FK_INSCRIPCIO_CATEGORIA` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`),
  ADD CONSTRAINT `FK_INSCRIPCIO_CURSA` FOREIGN KEY (`id_cursa`) REFERENCES `tbl_cursa` (`id_cursa`),
  ADD CONSTRAINT `FK_INSCRIPCIO_PARTICIPANT` FOREIGN KEY (`id_participant`) REFERENCES `tbl_participant` (`id_participant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
