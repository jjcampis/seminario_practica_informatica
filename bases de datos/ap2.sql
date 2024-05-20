-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 04:38:16
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
-- Base de datos: `ap2`
--
CREATE DATABASE IF NOT EXISTS `ap2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ap2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `idAsistencia` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idPreceptor` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Presente','Tardanza','Ausente') NOT NULL,
  `idCiclo` int(11) NOT NULL,
  `cursos_idcursos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`idAsistencia`, `idAlumno`, `idPreceptor`, `fecha`, `estado`, `idCiclo`, `cursos_idcursos`) VALUES
(1, 3, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(2, 35, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(3, 36, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(4, 37, 2, '2024-05-01 08:00:00', 'Tardanza', 1, 1),
(5, 38, 2, '2024-05-01 08:00:00', 'Ausente', 1, 1),
(6, 39, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(7, 40, 2, '2024-05-01 08:00:00', 'Tardanza', 1, 1),
(8, 41, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(9, 42, 2, '2024-05-01 08:00:00', 'Ausente', 1, 1),
(10, 43, 2, '2024-05-01 08:00:00', 'Presente', 1, 1),
(11, 35, 2, '2024-05-18 23:16:25', 'Ausente', 1, 1),
(12, 35, 2, '2024-05-17 23:16:25', 'Tardanza', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos_lectivos`
--

CREATE TABLE `ciclos_lectivos` (
  `idCiclo` int(11) NOT NULL,
  `ciclo` int(4) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciclos_lectivos`
--

INSERT INTO `ciclos_lectivos` (`idCiclo`, `ciclo`, `fechaInicio`, `fechaFin`) VALUES
(1, 2024, '2024-03-01', '2024-12-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idcursos` int(11) NOT NULL,
  `curso` varchar(45) NOT NULL,
  `division` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idcursos`, `curso`, `division`) VALUES
(1, '1ro', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones`
--

CREATE TABLE `instituciones` (
  `idinstituciones` int(11) NOT NULL,
  `institucion` varchar(100) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `CUE` int(20) NOT NULL,
  `CUISE` int(6) NOT NULL,
  `Director` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instituciones`
--

INSERT INTO `instituciones` (`idinstituciones`, `institucion`, `Direccion`, `Telefono`, `CUE`, `CUISE`, `Director`) VALUES
(1, 'Santa María', 'Avenida Principal 123', '555-1234', 123456, 654321, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `domicilio` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `domicilio`) VALUES
(1, 'Juan', 'Perez', '12345678', '123456789', 'juan.perez@example.com', 'Calle Falsa 123'),
(2, 'Ana', 'Gomez', '87654321', '987654321', 'ana.gomez@example.com', 'Avenida Siempre Viva 742'),
(3, 'Carlos', 'Lopez', '11223344', '1122334455', 'carlos.lopez@example.com', 'Pasaje Sin Nombre 456'),
(4, 'Maria', 'Garcia', '44332211', '5544332211', 'maria.garcia@example.com', 'Boulevard del Sol 789'),
(35, 'Ana', 'Martinez', '22334455', '2233445566', 'ana.martinez@example.com', 'Calle del Rio 123'),
(36, 'Luis', 'Gonzalez', '33445566', '3344556677', 'luis.gonzalez@example.com', 'Avenida del Sol 456'),
(37, 'Maria', 'Fernandez', '44556677', '4455667788', 'maria.fernandez@example.com', 'Boulevard Verde 789'),
(38, 'Juan', 'Ramirez', '55667788', '5566778899', 'juan.ramirez@example.com', 'Calle Luna 101'),
(39, 'Sofia', 'Torres', '66778899', '6677889900', 'sofia.torres@example.com', 'Calle Estrella 202'),
(40, 'Miguel', 'Hernandez', '77889900', '7788990011', 'miguel.hernandez@example.com', 'Avenida Azul 303'),
(41, 'Laura', 'Diaz', '88990011', '8899001122', 'laura.diaz@example.com', 'Pasaje Amarillo 404'),
(42, 'Carlos', 'Suarez', '99001122', '9900112233', 'carlos.suarez@example.com', 'Calle Roja 505'),
(43, 'Paula', 'Lopez', '10011223', '1001122344', 'paula.lopez@example.com', 'Boulevard Blanco 606');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_roles`
--

CREATE TABLE `per_roles` (
  `idPersona` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `per_roles`
--

INSERT INTO `per_roles` (`idPersona`, `idRol`) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 4),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_aula`
--

CREATE TABLE `reservas_aula` (
  `idReserva` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas_aula`
--

INSERT INTO `reservas_aula` (`idReserva`, `idProfesor`, `fecha`, `horaInicio`, `horaFin`) VALUES
(1, 1, '2024-05-01', '08:00:00', '10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `Rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `Rol`) VALUES
(1, 'Alumno'),
(2, 'Preceptor'),
(3, 'Profesor'),
(4, 'Director');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `idTutor` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`idTutor`, `idAlumno`) VALUES
(1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`idAsistencia`,`cursos_idcursos`,`idAlumno`,`idPreceptor`,`idCiclo`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idPreceptor` (`idPreceptor`),
  ADD KEY `idCiclo` (`idCiclo`),
  ADD KEY `fk_asistencias_cursos1_idx` (`cursos_idcursos`);

--
-- Indices de la tabla `ciclos_lectivos`
--
ALTER TABLE `ciclos_lectivos`
  ADD PRIMARY KEY (`idCiclo`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcursos`);

--
-- Indices de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD PRIMARY KEY (`idinstituciones`),
  ADD KEY `fk_instituciones_per_roles1_idx` (`Director`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indices de la tabla `per_roles`
--
ALTER TABLE `per_roles`
  ADD PRIMARY KEY (`idPersona`,`idRol`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `reservas_aula`
--
ALTER TABLE `reservas_aula`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idProfesor` (`idProfesor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`idTutor`,`idAlumno`),
  ADD KEY `idAlumno` (`idAlumno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ciclos_lectivos`
--
ALTER TABLE `ciclos_lectivos`
  MODIFY `idCiclo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `idinstituciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `reservas_aula`
--
ALTER TABLE `reservas_aula`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`idPreceptor`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencias_ibfk_3` FOREIGN KEY (`idCiclo`) REFERENCES `ciclos_lectivos` (`idCiclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_asistencias_cursos1` FOREIGN KEY (`cursos_idcursos`) REFERENCES `cursos` (`idcursos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD CONSTRAINT `fk_instituciones_per_roles1` FOREIGN KEY (`Director`) REFERENCES `per_roles` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `per_roles`
--
ALTER TABLE `per_roles`
  ADD CONSTRAINT `persona_roles_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_roles_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas_aula`
--
ALTER TABLE `reservas_aula`
  ADD CONSTRAINT `reservas_aula_ibfk_1` FOREIGN KEY (`idProfesor`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`idTutor`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutores_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `personas` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
