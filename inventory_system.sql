-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2024 a las 05:16:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventory_system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acquisitions`
--

CREATE TABLE `acquisitions` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `acquisition_date` date DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `movement_date` date DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `movement_type` enum('entrada','salida') NOT NULL,
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `maintenance_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `username`, `password`) VALUES
(1, 'Misael Alejandro Haro Marquez', 'maxmisaelharo0@gmail.com', 'misaeldxd', 'blackmisael'),
(2, 'Misael Alejandro Haro Marquez', 'misaelharo993@gmail.com', 'misaelfrijolito', 'soyguapo2'),
(3, 'Marco Antonio Galva', 'marcoantoga@gmail.com', 'marquiño', 'marcos2000'),
(12, 'Laura Valentino Diaz Lopez', 'lauradiaz@gmail.com', 'lauradiaz', 'soyhermosa'),
(14, 'Yanfer Taxigala ', 'falleboy@gmail.com', 'fallerick', 'elpendejo'),
(15, 'Robii Aragon', 'robiaragon@gmail.com', 'robii', 'elrobbii'),
(21, 'Kevin Bravata Gutiérrez ', 'kevin.bravata@gmail.com', 'bravata11', 'soyincreible');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acquisitions`
--
ALTER TABLE `acquisitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indices de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acquisitions`
--
ALTER TABLE `acquisitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acquisitions`
--
ALTER TABLE `acquisitions`
  ADD CONSTRAINT `acquisitions_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Filtros para la tabla `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `inventory_movements_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
