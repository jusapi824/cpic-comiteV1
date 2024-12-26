-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2024 a las 23:32:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comite`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL,
  `documento` varchar(11) NOT NULL,
  `correo_electronico` varchar(60) NOT NULL,
  `id_grupo` varchar(20) NOT NULL,
  `jornada` varchar(40) NOT NULL,
  `programa_formacion` varchar(60) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) NOT NULL,
  `usuario_actualiza` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`nombres`, `apellidos`, `celular`, `tipo_documento`, `documento`, `correo_electronico`, `id_grupo`, `jornada`, `programa_formacion`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
('Daniela', 'lopez', '3245678909', 'CC:cedula de ciudadania', '1045678765', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Camilo', 'Lopez', '3112240280', 'CC', '10537896543', 'jhonccuartas@gmail.com', '2613934', 'Noche', 'ANALISIS Y DESARROLLO DE SOFTWARE', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Laura ', 'gutierrez', '3245638909', 'CC:cedula de ciudadania', '111111111', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Camilo', 'soto', '3245675909', 'CC:cedula de ciudadania', '1111113333', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Estefania', 'suarez', '3245678709', 'CC:cedula de ciudadania', '1111332222', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Libia ', 'llano', '3244678909', 'CC:cedula de ciudadania', '4332421222', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Lucila ', 'Cuartas', '3245578909', 'CC:cedula de ciudadania', '7387398', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', ''),
('Gloria ', 'vasquez', '3245578909', 'CC:cedula de ciudadania', '8977468789', 'danyvalenciasoto@gmail.com', '2613934', 'Noche', 'ADSO', 'Activo', '0000-00-00', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comite`
--

CREATE TABLE `comite` (
  `id_comite` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `lugar` varchar(60) NOT NULL,
  `observacion` varchar(300) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `fecha_creacion` int(11) NOT NULL,
  `fecha_actualizacion` int(11) NOT NULL,
  `usuario_crea` varchar(60) NOT NULL,
  `usuario_actualiza` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comite`
--

INSERT INTO `comite` (`id_comite`, `fecha_inicio`, `fecha_fin`, `lugar`, `observacion`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
(49, '2024-12-12', '2024-12-12', 'Sistemas 2', 'Comite academico', 'Programado', 0, 0, '', ''),
(50, '2024-12-12', '2024-12-13', 'Sistemas 2', 'Comite estudiantil', 'Programado', 0, 0, '', ''),
(51, '2024-12-12', '2024-12-13', 'Sistemas 2', 'Comite estudiantil', 'Programado', 0, 0, '', ''),
(52, '2024-12-12', '2024-12-12', 'bIBLIOTECA', 'Comite Academico', 'Programado', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comite_informe`
--

CREATE TABLE `comite_informe` (
  `id` int(20) NOT NULL,
  `id_comite` int(11) NOT NULL,
  `id_informe` int(100) NOT NULL,
  `fecha_asignación` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comite_informe`
--

INSERT INTO `comite_informe` (`id`, `id_comite`, `id_informe`, `fecha_asignación`) VALUES
(108, 49, 82, '0000-00-00 00:00:00'),
(109, 50, 83, '0000-00-00 00:00:00'),
(110, 51, 83, '0000-00-00 00:00:00'),
(111, 52, 84, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE `informe` (
  `id` int(11) NOT NULL,
  `fecha_informe` datetime NOT NULL,
  `documento_aprendiz` varchar(100) NOT NULL,
  `nombre_aprendiz` varchar(255) NOT NULL,
  `correo_aprendiz` varchar(255) NOT NULL,
  `programa_formacion` varchar(255) NOT NULL,
  `id_grupo` varchar(100) NOT NULL,
  `reporte` text NOT NULL,
  `documento_instructor` varchar(20) NOT NULL,
  `nombre_instructor` varchar(255) NOT NULL,
  `correo_instructor` varchar(255) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_crea` varchar(45) NOT NULL,
  `usuario_actualiza` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informe`
--

INSERT INTO `informe` (`id`, `fecha_informe`, `documento_aprendiz`, `nombre_aprendiz`, `correo_aprendiz`, `programa_formacion`, `id_grupo`, `reporte`, `documento_instructor`, `nombre_instructor`, `correo_instructor`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
(82, '2024-12-11 13:10:00', '10537896543', 'Camilo Lopez', 'jhonccuartas@gmail.com', 'ANALISIS Y DESARROLLO DE SOFTWARE', '2613935', 'No aprobó la competencia de derechos humanos, el aprendiz no participo en actividades relacionadas con la competencia ni se acogió a realizar un trabajo adicional para su recuperación', '1053839467', 'Maria Valencia ', 'danyvalenciasoto@gmail.com', 'Agendado', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(83, '2024-12-11 15:19:00', '10537896543', 'Camilo Lopez', 'jhonccuartas@gmail.com', 'ANALISIS Y DESARROLLO DE SOFTWARE', '2613934', 'No aprobo matematicas', '1053839467', 'Maria Valencia ', 'danyvalenciasoto@gmail.com', 'Agendado', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(84, '2024-12-11 17:31:00', '10537896543', 'Camilo Lopez', 'jhonccuartas@gmail.com', 'ANALISIS Y DESARROLLO DE SOFTWARE', '2613934', 'No aprueba la competencia de matematicas', '1053839467', 'Maria Valencia ', 'danyvalenciasoto@gmail.com', 'Agendado', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `documento` varchar(20) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `celular` int(45) NOT NULL,
  `correo_electronico` varchar(60) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_creacion` int(11) NOT NULL,
  `fecha_actualizacion` int(11) NOT NULL,
  `usuario_crea` varchar(60) NOT NULL,
  `usuario_actualiza` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`documento`, `nombres`, `apellidos`, `celular`, `correo_electronico`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
('1053839467', 'Maria', 'Valencia ', 2147483647, 'danyvalenciasoto@gmail.com', 'Activo', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `user_id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`user_id`, `usuario`, `token`, `created_at`, `expires_at`) VALUES
(31, 'usuario4', '639a06e19da3a2f12d692c425a70d212a90a94ae19b5fa4e0601fcd45eeab264833883226d8fc69a6db2d9de53fa379b38a9', '2024-12-11 13:18:15', '2024-12-11 20:30:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `perfil` varchar(50) NOT NULL,
  `lectura` tinyint(1) DEFAULT 0,
  `escritura` tinyint(1) DEFAULT 0,
  `administracion` tinyint(1) DEFAULT 0,
  `detalles` text DEFAULT NULL,
  `permisos` int(11) DEFAULT 0,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`, `lectura`, `escritura`, `administracion`, `detalles`, `permisos`, `estado`) VALUES
(1, 'Administrador', 1, 0, 0, NULL, 0, 1),
(2, 'Instructor', 1, 1, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo_electronico` varchar(60) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) NOT NULL,
  `usuario_actualiza` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `contrasenia`, `nombres`, `apellidos`, `correo_electronico`, `id_perfil`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
(4, 'usuario4', '$2y$10$nxBACOS5r/YpcWM4ys6F9ebI/CzCwBOQ2Cocdj8Q961Cbckq3.G7i', 'María', 'Rodríguez', 'danyvalenciasoto@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', ''),
(25, 'prueba', '$2y$10$iO3nf86dhmQDdyRYgmkLKOS.fLAT3PbXMLqh25WPEMIRiwg0qQmaa', 'prueba', 'Lopez', 'carlos@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', ''),
(26, 'admin', '$2y$10$wvF3jjV.20/hVSBBRWv.ROqFvMkCrxoUqu9egfdp2hd7pB8jGQmo2', 'Laura', 'Victoria', 'danyvalenciasoto@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`documento`);

--
-- Indices de la tabla `comite`
--
ALTER TABLE `comite`
  ADD PRIMARY KEY (`id_comite`);

--
-- Indices de la tabla `comite_informe`
--
ALTER TABLE `comite_informe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_informe_id` (`id_informe`),
  ADD KEY `fk_comite_id` (`id_comite`);

--
-- Indices de la tabla `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`documento`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comite`
--
ALTER TABLE `comite`
  MODIFY `id_comite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `comite_informe`
--
ALTER TABLE `comite_informe`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `informe`
--
ALTER TABLE `informe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comite_informe`
--
ALTER TABLE `comite_informe`
  ADD CONSTRAINT `fk_comite_id` FOREIGN KEY (`id_comite`) REFERENCES `comite` (`id_comite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_informe_id` FOREIGN KEY (`id_informe`) REFERENCES `informe` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
