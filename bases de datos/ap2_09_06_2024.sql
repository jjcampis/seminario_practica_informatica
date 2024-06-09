-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2024 a las 01:16:58
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
-- Estructura de tabla para la tabla `alumnos_cursos`
--

CREATE TABLE `alumnos_cursos` (
  `idalumnos_cursos` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  `cursos_idcursos` int(11) NOT NULL,
  `ciclos_lectivos_idCiclo` int(11) NOT NULL,
  `fecha_asociacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos_cursos`
--

INSERT INTO `alumnos_cursos` (`idalumnos_cursos`, `alumno`, `cursos_idcursos`, `ciclos_lectivos_idCiclo`, `fecha_asociacion`) VALUES
(1, 1, 1, 1, '2024-06-09 20:59:41'),
(2, 2, 1, 1, '2024-06-09 21:18:07'),
(3, 2, 2, 1, '2024-06-09 21:18:54'),
(4, 2, 1, 1, '2024-06-09 21:19:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `idAsistencia` int(11) NOT NULL,
  `idPreceptor` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Presente','Tardanza','Ausente') NOT NULL,
  `alumno_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`idAsistencia`, `idPreceptor`, `fecha`, `fecha_hora`, `estado`, `alumno_curso`) VALUES
(5, 1, '2024-06-09', '2024-06-09 16:46:57', 'Ausente', 1),
(6, 1, '2024-06-09', '2024-06-09 16:46:57', 'Ausente', 4);

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
(1, 2024, '2024-01-01', '2024-02-03');

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
(1, '1', 'A'),
(2, '2', 'A');

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
(1, 'Romina', 'Perez', '1111', '123456', 'romina@ejemplo.com', 'av. falsa 123'),
(2, 'Pedro', 'Gonzalez', '2222', '654654', 'pedro@ejemplo.com', 'av. falsa 124'),
(3, 'Juan', 'Campis', '3333', '8787', 'juan@ejemplo.com', 'av. falsa 125'),
(4, 'Pablo', 'Gomez', '4444', '9898', 'pablo@ejemplo.com', 'av. falsa 126'),
(5, 'Marcelo', 'Benitez', '5555', '7878', 'marcelo@ejemplo.com', 'av. falsa 127');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_roles`
--

CREATE TABLE `per_roles` (
  `id_per_rol` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fecha_asociacion_rol` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `per_roles`
--

INSERT INTO `per_roles` (`id_per_rol`, `idPersona`, `idRol`, `fecha_asociacion_rol`) VALUES
(1, 3, 1, '2024-06-09 15:59:34'),
(2, 5, 1, '2024-06-09 15:59:34');

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
(1, 'Estudiante'),
(2, 'Preceptor'),
(3, 'Directivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `idTutor` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD PRIMARY KEY (`idalumnos_cursos`,`alumno`,`cursos_idcursos`,`ciclos_lectivos_idCiclo`),
  ADD KEY `fk_personas_has_cursos_cursos1_idx` (`cursos_idcursos`),
  ADD KEY `fk_personas_has_cursos_ciclos_lectivos1_idx` (`ciclos_lectivos_idCiclo`),
  ADD KEY `fk_alumnos_cursos_per_roles1_idx` (`alumno`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`idAsistencia`,`idPreceptor`,`alumno_curso`),
  ADD UNIQUE KEY `fecha_UNIQUE` (`fecha`,`alumno_curso`),
  ADD KEY `fk_asistencias_alumnos_cursos1_idx` (`alumno_curso`),
  ADD KEY `fk_asistencias_per_roles1_idx` (`idPreceptor`);

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
  ADD PRIMARY KEY (`idinstituciones`,`Director`),
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
  ADD PRIMARY KEY (`id_per_rol`,`idPersona`,`idRol`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `persona_roles_ibfk_1` (`idPersona`);

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
-- AUTO_INCREMENT de la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  MODIFY `idalumnos_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ciclos_lectivos`
--
ALTER TABLE `ciclos_lectivos`
  MODIFY `idCiclo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `idinstituciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `per_roles`
--
ALTER TABLE `per_roles`
  MODIFY `id_per_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reservas_aula`
--
ALTER TABLE `reservas_aula`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos_cursos`
--
ALTER TABLE `alumnos_cursos`
  ADD CONSTRAINT `fk_alumnos_cursos_per_roles1` FOREIGN KEY (`alumno`) REFERENCES `per_roles` (`id_per_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_has_cursos_ciclos_lectivos1` FOREIGN KEY (`ciclos_lectivos_idCiclo`) REFERENCES `ciclos_lectivos` (`idCiclo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_has_cursos_cursos1` FOREIGN KEY (`cursos_idcursos`) REFERENCES `cursos` (`idcursos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `fk_asistencias_alumnos_cursos1` FOREIGN KEY (`alumno_curso`) REFERENCES `alumnos_cursos` (`idalumnos_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asistencias_per_roles1` FOREIGN KEY (`idPreceptor`) REFERENCES `per_roles` (`id_per_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD CONSTRAINT `fk_instituciones_per_roles1` FOREIGN KEY (`Director`) REFERENCES `per_roles` (`id_per_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
