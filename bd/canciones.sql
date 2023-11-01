-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2023 a las 20:26:01
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `canciones`
--
CREATE DATABASE IF NOT EXISTS `canciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `canciones`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `idAdmin` bigint(11) NOT NULL,
  `nomAdmin` varchar(60) NOT NULL,
  `passAdmin` int(11) NOT NULL,
  `mailAdmin` varchar(60) NOT NULL,
  `celAdmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`idAdmin`, `nomAdmin`, `passAdmin`, `mailAdmin`, `celAdmin`) VALUES
(1, 'Juan David jimenez', 123, 'juandavid101628@gmal.com', '305276358');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `nomAutor` varchar(60) NOT NULL,
  `passAutor` int(11) NOT NULL,
  `maiAutor` varchar(60) NOT NULL,
  `celAutor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idAutor`, `nomAutor`, `passAutor`, `maiAutor`, `celAutor`) VALUES
(1, 'Juan David jimenez', 123, 'juandavid101628@gmal.com', '305276358'),
(2, 'Julio Vargas', 123, 'misterjulio101628@gmal.com', '3032212'),
(12000, 'Marco Silva', 123, 'marco.silva@sena.edu.co', '3211234568');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `IDcanciones` int(11) NOT NULL,
  `Nomcancion` varchar(60) NOT NULL,
  `IDautor` int(11) NOT NULL,
  `Idgenero` int(11) NOT NULL,
  `cancioapoyadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`IDcanciones`, `Nomcancion`, `IDautor`, `Idgenero`, `cancioapoyadas`) VALUES
(1, 'Los frijoles', 1, 1, 100000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_canciones`
--

CREATE TABLE `tipos_de_canciones` (
  `Idgenero` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_de_canciones`
--

INSERT INTO `tipos_de_canciones` (`Idgenero`, `nombre`) VALUES
(1, 'clásica'),
(2, 'romantica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDusuario` int(11) NOT NULL,
  `nomUsuario` varchar(60) NOT NULL,
  `passUsuario` int(11) NOT NULL,
  `Correo` varchar(60) NOT NULL,
  `celular` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDusuario`, `nomUsuario`, `passUsuario`, `Correo`, `celular`) VALUES
(1, 'Juan David jimenez', 123, 'juandavid101628@gmal.com', 305276358),
(2, 'Julio', 123, 'julio101628@hotmail.com', 30267809);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`IDcanciones`),
  ADD KEY `IDautor` (`IDautor`),
  ADD KEY `Idgenero` (`Idgenero`);

--
-- Indices de la tabla `tipos_de_canciones`
--
ALTER TABLE `tipos_de_canciones`
  ADD PRIMARY KEY (`Idgenero`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `IDcanciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_de_canciones`
--
ALTER TABLE `tipos_de_canciones`
  MODIFY `Idgenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD CONSTRAINT `cancion_ibfk_1` FOREIGN KEY (`IDautor`) REFERENCES `usuario` (`IDusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cancion_ibfk_2` FOREIGN KEY (`Idgenero`) REFERENCES `tipos_de_canciones` (`Idgenero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
