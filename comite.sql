-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: sena_cpic-comitev1-mysql:3306
-- Generation Time: Apr 01, 2025 at 02:55 AM
-- Server version: 8.4.4
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sena`
--

-- --------------------------------------------------------

--
-- Table structure for table `aprendiz`
--

CREATE TABLE `aprendiz` (
  `nombres` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `celular` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_documento` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `documento` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `id_grupo` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jornada` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `programa_formacion` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_actualiza` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comite`
--

CREATE TABLE `comite` (
  `id_comite` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `lugar` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `observacion` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_actualiza` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comite_informe`
--

CREATE TABLE `comite_informe` (
  `id` int NOT NULL,
  `id_comite` int NOT NULL,
  `id_informe` int NOT NULL,
  `fecha_asignación` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informe`
--

CREATE TABLE `informe` (
  `id` int NOT NULL,
  `fecha_informe` datetime NOT NULL,
  `documento_aprendiz` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_aprendiz` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `correo_aprendiz` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `programa_formacion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_grupo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `reporte` text COLLATE utf8mb4_general_ci NOT NULL,
  `documento_instructor` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_instructor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `correo_instructor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `usuario_crea` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_actualiza` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `documento` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nombres` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_actualiza` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `user_id` int NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`user_id`, `usuario`, `token`, `created_at`, `expires_at`) VALUES
(31, 'usuario4', '639a06e19da3a2f12d692c425a70d212a90a94ae19b5fa4e0601fcd45eeab264833883226d8fc69a6db2d9de53fa379b38a9', '2024-12-11 13:18:15', '2024-12-11 20:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE `perfil` (
  `id` int NOT NULL,
  `perfil` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lectura` tinyint(1) DEFAULT '0',
  `escritura` tinyint(1) DEFAULT '0',
  `administracion` tinyint(1) DEFAULT '0',
  `detalles` text COLLATE utf8mb4_general_ci,
  `permisos` int DEFAULT '0',
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`, `lectura`, `escritura`, `administracion`, `detalles`, `permisos`, `estado`) VALUES
(1, 'Administrador', 1, 0, 0, NULL, 0, 1),
(2, 'Instructor', 1, 1, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasenia` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `id_perfil` int NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_crea` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_actualiza` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `contrasenia`, `nombres`, `apellidos`, `correo_electronico`, `id_perfil`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `usuario_crea`, `usuario_actualiza`) VALUES
(4, 'usuario4', '$2y$10$nxBACOS5r/YpcWM4ys6F9ebI/CzCwBOQ2Cocdj8Q961Cbckq3.G7i', 'María', 'Rodríguez', 'danyvalenciasoto@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', ''),
(25, 'prueba', '$2y$10$iO3nf86dhmQDdyRYgmkLKOS.fLAT3PbXMLqh25WPEMIRiwg0qQmaa', 'prueba', 'Lopez', 'carlos@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', ''),
(26, 'admin', '$2y$10$wvF3jjV.20/hVSBBRWv.ROqFvMkCrxoUqu9egfdp2hd7pB8jGQmo2', 'Laura', 'Victoria', 'danyvalenciasoto@gmail.com', 1, 'activo', '0000-00-00', '0000-00-00', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`documento`);

--
-- Indexes for table `comite`
--
ALTER TABLE `comite`
  ADD PRIMARY KEY (`id_comite`);

--
-- Indexes for table `comite_informe`
--
ALTER TABLE `comite_informe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_informe_id` (`id_informe`),
  ADD KEY `fk_comite_id` (`id_comite`);

--
-- Indexes for table `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`documento`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comite`
--
ALTER TABLE `comite`
  MODIFY `id_comite` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `comite_informe`
--
ALTER TABLE `comite_informe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `informe`
--
ALTER TABLE `informe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comite_informe`
--
ALTER TABLE `comite_informe`
  ADD CONSTRAINT `fk_comite_id` FOREIGN KEY (`id_comite`) REFERENCES `comite` (`id_comite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_informe_id` FOREIGN KEY (`id_informe`) REFERENCES `informe` (`id`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
