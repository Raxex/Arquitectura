-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2018 at 01:04 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartasexpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `emisor` varchar(10) NOT NULL,
  `sucursal_recepcion` int(11) NOT NULL,
  `sucursal_actual` int(11) NOT NULL,
  `recibido` tinyint(1) NOT NULL,
  `tipo_solicitud` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `localizacion` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_solicitud`
--

CREATE TABLE `tipo_solicitud` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `descripcion`) VALUES
(1, 'Admin'),
(2, 'usuario normal');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `rut` varchar(10) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `zip` varchar(7) NOT NULL,
  `direccion` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tipo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`rut`, `nombre`, `apellido`, `zip`, `direccion`, `email`, `password`, `tipo`) VALUES
('18566961-5', 'Joakin', 'Torros', '5598560', 'Muerte lenta 333', 'juako@lo.com', 'Kakaru', 2),
('19233916-2', 'Roberto', 'Oyarzun', '5505320', 'calle falsa 123', 'roberto.oyarzun.25@gmail.com', 'Armagedon1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `envios_sucursal_a` (`sucursal_recepcion`),
  ADD KEY `envios_sucursal_b` (`sucursal_actual`),
  ADD KEY `envios_tipo_solicitud` (`tipo_solicitud`),
  ADD KEY `envios_usuario` (`emisor`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `usuario_tipo` (`tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_sucursal_a` FOREIGN KEY (`sucursal_recepcion`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_sucursal_b` FOREIGN KEY (`sucursal_actual`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_tipo_solicitud` FOREIGN KEY (`tipo_solicitud`) REFERENCES `tipo_solicitud` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_usuario` FOREIGN KEY (`emisor`) REFERENCES `usuario` (`rut`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
