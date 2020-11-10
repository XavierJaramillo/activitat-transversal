-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2020 a las 15:17:42
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
CREATE DATABASE cursadb;
USE cursadb;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(255) NOT NULL,
  `nombre_categoria` enum('Alevin','Infantil','Cadete','Juvenil','Senior','Discapacitat') COLLATE utf8_spanish2_ci NOT NULL,
  `rango_edad` enum('0-6 Anys','7-10 Anys','11-20 Anys','21-50 Anys','51-100 Anys') COLLATE utf8_spanish2_ci NOT NULL,
  `sexo_categoria` enum('Home','Dona') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cursa`
--

CREATE TABLE `tbl_cursa` (
  `id_cursa` int(255) NOT NULL,
  `dorsal_participant` int(255) NOT NULL,
  `isPagado` tinyint(1) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inscripcio`
--

CREATE TABLE `tbl_inscripcio` (
  `id_inscripcio` int(255) NOT NULL,
  `id_participant` int(255) NOT NULL,
  `id_cursa` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_participant`
--

CREATE TABLE `tbl_participant` (
  `id_participant` int(255) NOT NULL,
  `data_naixement` date NOT NULL,
  `sexe` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `dorsal_participant` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `id_categoria` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
  ADD PRIMARY KEY (`id_inscripcio`),
  ADD UNIQUE KEY `FK_INSCRIPCIO_CURSA` (`id_cursa`),
  ADD UNIQUE KEY `FK_INSCRIPCIO_PARTICIPANT` (`id_participant`);

--
-- Indices de la tabla `tbl_participant`
--
ALTER TABLE `tbl_participant`
  ADD PRIMARY KEY (`id_participant`),
  ADD UNIQUE KEY `FK_PARTICIPANT_INSCRIPCIO` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_cursa`
--
ALTER TABLE `tbl_cursa`
  MODIFY `id_cursa` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_inscripcio`
--
ALTER TABLE `tbl_inscripcio`
  MODIFY `id_inscripcio` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_participant`
--
ALTER TABLE `tbl_participant`
  MODIFY `id_participant` int(255) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_cursa`
--
ALTER TABLE `tbl_cursa`
  ADD CONSTRAINT `tbl_cursa_ibfk_1` FOREIGN KEY (`id_cursa`) REFERENCES `tbl_inscripcio` (`id_cursa`);

--
-- Filtros para la tabla `tbl_inscripcio`
--
ALTER TABLE `tbl_inscripcio`
  ADD CONSTRAINT `tbl_inscripcio_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `tbl_participant` (`id_participant`);

--
-- Filtros para la tabla `tbl_participant`
--
ALTER TABLE `tbl_participant`
  ADD CONSTRAINT `tbl_participant_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
