-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 03-02-2023 a las 21:55:06
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE IF NOT EXISTS `cita` (
  `Cod_cita` decimal(10,0) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Cod_paciente` decimal(10,0) DEFAULT NULL,
  `CCod_med_cita` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Cod_cita`),
  KEY `Cod_paciente` (`Cod_paciente`),
  KEY `CCod_med_cita` (`CCod_med_cita`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`Cod_cita`, `Fecha`, `Hora`, `Cod_paciente`, `CCod_med_cita`) VALUES
('1', '2022-02-02', '08:10:00', '1010', '10'),
('2', '2022-02-02', '08:25:00', '1020', '10'),
('3', '2022-02-02', '13:54:00', '1030', '10'),
('4', '2022-02-03', '08:05:00', '1050', '1020'),
('5', '2022-02-03', '10:08:00', '1040', '1020'),
('6', '2022-02-07', '11:06:00', '1050', '10'),
('10', '2023-01-20', '08:48:00', '1010', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
CREATE TABLE IF NOT EXISTS `consultorio` (
  `Ccodigo` decimal(10,0) NOT NULL,
  `Descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Ccodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`Ccodigo`, `Descripcion`) VALUES
('1', 'CONSULTORIO1'),
('2', 'CONSULTORIO2'),
('3', 'CONSULTORIO3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE IF NOT EXISTS `especialidad` (
  `Cod_especialidad` decimal(10,0) NOT NULL,
  `Descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_especialidad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`Cod_especialidad`, `Descripcion`) VALUES
('1', 'GENERAL'),
('2', 'INTERNISTA'),
('3', 'RADIOLOGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE IF NOT EXISTS `horario` (
  `Cod_horario` decimal(10,0) NOT NULL,
  `dias` int(11) DEFAULT NULL,
  `Hora_entrada` time DEFAULT NULL,
  `Hora_salida` time DEFAULT NULL,
  PRIMARY KEY (`Cod_horario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`Cod_horario`, `dias`, `Hora_entrada`, `Hora_salida`) VALUES
('1', 7, '08:00:00', '18:00:00'),
('2', 7, '08:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `Cod_medico` decimal(10,0) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Cod_especialidad` decimal(10,0) DEFAULT NULL,
  `Cod_horario` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Cod_medico`),
  KEY `Cod_especialidad` (`Cod_especialidad`),
  KEY `Cod_horario` (`Cod_horario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`Cod_medico`, `Correo`, `Cod_especialidad`, `Cod_horario`) VALUES
('1047372', 'luis@gmail.com', '1', '1'),
('1010', 'luis@gmail.com', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_cita`
--

DROP TABLE IF EXISTS `medico_cita`;
CREATE TABLE IF NOT EXISTS `medico_cita` (
  `Cod_med_cita` decimal(10,0) NOT NULL,
  `Cod_medico` decimal(10,0) DEFAULT NULL,
  `Cod_consultorio` decimal(10,0) DEFAULT NULL,
  `Cod_turno` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Cod_med_cita`),
  KEY `Cod_medico` (`Cod_medico`),
  KEY `Cod_consultorio` (`Cod_consultorio`),
  KEY `Cod_turno` (`Cod_turno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medico_cita`
--

INSERT INTO `medico_cita` (`Cod_med_cita`, `Cod_medico`, `Cod_consultorio`, `Cod_turno`) VALUES
('10', '1047372', '1', '1'),
('1020', '1010', '2', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `Codigo` decimal(10,0) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `eps` varchar(50) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`Codigo`, `nombre`, `eps`, `telefono`) VALUES
('1010', 'carlos domingues perez', 'salud total', '6965894'),
('1020', 'andrea martinez torres', 'nueva eps', '4523658'),
('1030', 'ana maria velez', 'salud total', '5236526'),
('1040', 'Jesus villar santos', 'mutual ser', '5426352'),
('1050', 'Rosana Del Carmen Reyes', 'Mutual Ser', '4589658');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` decimal(10,0) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `telefono` decimal(10,0) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `Nombre`, `Apellido`, `telefono`, `Direccion`) VALUES
('1047372', 'luis', 'Cardenas', '6352632', 'Cartagena'),
('1047373', 'Rosana', 'Reyes', '6524895', 'Cartagena'),
('1047374', 'Raxana', 'Mendoza', '6378156', 'Mathes'),
('1047375', 'Viviana', 'Navaro', '6365963', 'San juan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

DROP TABLE IF EXISTS `turno`;
CREATE TABLE IF NOT EXISTS `turno` (
  `Tcodigo` decimal(10,0) NOT NULL,
  `Descripcion` varchar(30) DEFAULT NULL,
  `Hora_inicial` time DEFAULT NULL,
  `Hora_final` time DEFAULT NULL,
  PRIMARY KEY (`Tcodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`Tcodigo`, `Descripcion`, `Hora_inicial`, `Hora_final`) VALUES
('1', 'completa', '08:00:00', '18:00:00'),
('2', 'medio tiempo', '08:00:41', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`) VALUES
(21, 'operador', 'e10adc3949ba59abbe56e057f20f883e', 'luis cardenas'),
(22, 'administrador', '848ffd503f98d2368d47abceb4821465', 'gabriel castro'),
(23, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'rosana reyes'),
(24, 'san juan', '827ccb0eea8a706c4c34a16891f84e7b', 'german castro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

DROP TABLE IF EXISTS `visitante`;
CREATE TABLE IF NOT EXISTS `visitante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sede` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`id`, `nombre`, `sede`, `time`) VALUES
(45422208, 'german castro', '1', '2023-02-03 17:29:09'),
(45444879, 'viviana navarro de castro', '1', '2023-02-03 17:58:27'),
(1047327995, 'luis eduardo cardenas garcia', '3', '2023-02-03 21:54:36'),
(1048758425, 'carlos garcia reyes', '2', '2023-02-03 21:54:11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
