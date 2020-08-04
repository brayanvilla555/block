-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-08-2020 a las 16:46:40
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'accion'),
(2, 'Rol'),
(3, 'Deportes'),
(4, 'Alindor '),
(5, 'hello'),
(6, 'mecanica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuarios` (`usuario_id`),
  KEY `fc_entradas_categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `usuario_id`, `categoria_id`, `titulo`, `descripcion`, `fecha`) VALUES
(1, 1, 1, 'GTA5', 'REWiev de gta5', '2020-01-23'),
(2, 1, 2, 'LOL', 'REWiev de LOL', '2020-01-23'),
(3, 1, 3, 'Nuejos jugadores de fifa', 'REWiev de fifa2020', '2020-01-23'),
(4, 2, 1, 'ASSASINS', 'REWiev de ASSASING', '2020-01-23'),
(5, 2, 2, 'WOW', 'gfklñgkjsdklgfjhsedjfhsdjnxgbvhvxcbjhdbfuydhcjhdfbvhf<sabhdadsyfbsyf', '2020-01-23'),
(6, 2, 3, ' PES', 'REWiev de PES', '2020-01-23'),
(7, 3, 1, 'CALL OF DYTE', 'REWiev de CALL OF DUTY', '2020-01-23'),
(8, 3, 1, 'FORNITE', 'REWiev de FORNITE', '2020-01-23'),
(9, 3, 3, 'FROMULA 1', 'REWiev de FROMULA 1', '2020-01-23'),
(15, 43, 1, 'miami', 'bdfjhgfsueisahefioewsjifd', '2020-01-28'),
(16, 41, 2, 'csdhjkasjdifs', 'sdfjkesdjfiaes', '2020-01-29'),
(17, 41, 4, 'csdhjkasjdifs587348572385', 'hola mundo', '2020-01-29'),
(18, 41, 3, 'fifa202156789', 'fifa2021', '2020-01-29'),
(19, 41, 6, 'mecanica automotris', 'mkjfbzsjdfjasudfbahwsu', '2020-01-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `fecha`) VALUES
(41, 'Brayan', 'villanueva quispe', 'brayanalexander098@gmail.com', '$2y$10$MKHEYq8oxTmL6fo3SLXLNObIp0n6BC6rwtVF974Sb0QnjXSyv3FNa', '2020-01-27'),
(42, 'brd', 'villanueva quispe', 'VILLA@MAIL.COM', '$2y$10$c7AA6UP96nfUPHuZ3BPg7.PjRLi8ra5.R21YJbdQRhXJ/ZTVvHuOu', '2020-01-27'),
(43, 'cillllla', 'villanueva quispe', 'brayan_quipe@hotmail.com', '$2y$04$89M6ShuOVsOxnjPF0NYy0.4D7XUs6g/5B72.lldLbo4H5Da19c9SW', '2020-01-28'),
(44, 'brayan', 'villa', 'ddd@dd.com', '$2y$04$scimXnYKsIp6RD3ZQ6RXve44C0zMjuNZNUXa2JCBUOwPC9lGqSiDa', '2020-08-04');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fc_entradas_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_entrada_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
