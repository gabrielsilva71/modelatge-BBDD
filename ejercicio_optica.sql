-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-05-2019 a las 13:09:41
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio_optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTS`
--

CREATE TABLE `CLIENTS` (
  `clientid` int(10) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `client_street` varchar(20) NOT NULL,
  `client_number` varchar(5) NOT NULL,
  `client_floor` varchar(5) NOT NULL,
  `client_apartment` varchar(5) NOT NULL,
  `client_zipcode` varchar(5) NOT NULL,
  `client_city` varchar(10) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(20) NOT NULL,
  `register_date` date NOT NULL,
  `recommended_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CLIENTS`
--

INSERT INTO `CLIENTS` (`clientid`, `first_name`, `last_name`, `client_street`, `client_number`, `client_floor`, `client_apartment`, `client_zipcode`, `client_city`, `client_phone`, `client_email`, `register_date`, `recommended_by`) VALUES
(12354, 'Gabriel', 'Silva', 'Carrer Barcelona', '12', '1', '5B', '08012', 'Barcelona', '11112222', 'email@email.com', '2019-05-31', 1231231);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GLASSES`
--

CREATE TABLE `GLASSES` (
  `modelid` int(10) NOT NULL,
  `model` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `sphere` decimal(10,0) NOT NULL,
  `cylinder` decimal(10,0) NOT NULL,
  `axis` decimal(10,0) NOT NULL,
  `frame` enum('Flotant','Pasta','Metalic','') NOT NULL,
  `frame_color` varchar(10) NOT NULL,
  `lens_color` varchar(10) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GLASSES`
--

INSERT INTO `GLASSES` (`modelid`, `model`, `supplierid`, `sphere`, `cylinder`, `axis`, `frame`, `frame_color`, `lens_color`, `price`) VALUES
(2222222, 1111111, 123456, '1', '1', '2', 'Flotant', 'Red', 'Black', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INVOICES`
--

CREATE TABLE `INVOICES` (
  `invoiceid` int(10) NOT NULL,
  `clientid` int(10) NOT NULL,
  `modelid` int(10) NOT NULL,
  `supplierid` int(10) NOT NULL,
  `salesperson` varchar(20) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `VAT` decimal(10,0) NOT NULL,
  `credit card` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `INVOICES`
--

INSERT INTO `INVOICES` (`invoiceid`, `clientid`, `modelid`, `supplierid`, `salesperson`, `price`, `VAT`, `credit card`) VALUES
(888888, 12354, 2222222, 123456, 'Juan Juan', '10', '1', 1234443444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SUPPLIERS`
--

CREATE TABLE `SUPPLIERS` (
  `supplierid` int(10) NOT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `street` varchar(20) NOT NULL,
  `number` varchar(5) NOT NULL,
  `floor` varchar(5) NOT NULL,
  `apartment` varchar(5) NOT NULL,
  `city` varchar(10) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `NIF` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SUPPLIERS`
--

INSERT INTO `SUPPLIERS` (`supplierid`, `supplier_name`, `street`, `number`, `floor`, `apartment`, `city`, `zipcode`, `country`, `phone`, `fax`, `NIF`) VALUES
(123456, 'Ray Ban', 'Via Corsa', '12', '11', '1', 'Milan', '12345', 'Italy', '1112223335', '121213131', '9999999');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CLIENTS`
--
ALTER TABLE `CLIENTS`
  ADD PRIMARY KEY (`clientid`);

--
-- Indices de la tabla `GLASSES`
--
ALTER TABLE `GLASSES`
  ADD PRIMARY KEY (`modelid`,`supplierid`,`price`) USING BTREE,
  ADD KEY `supplierid` (`supplierid`);

--
-- Indices de la tabla `INVOICES`
--
ALTER TABLE `INVOICES`
  ADD PRIMARY KEY (`invoiceid`,`clientid`,`modelid`,`supplierid`,`price`) USING BTREE,
  ADD KEY `clientid` (`clientid`),
  ADD KEY `supplierid` (`supplierid`),
  ADD KEY `modelid` (`modelid`);

--
-- Indices de la tabla `SUPPLIERS`
--
ALTER TABLE `SUPPLIERS`
  ADD PRIMARY KEY (`supplierid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CLIENTS`
--
ALTER TABLE `CLIENTS`
  MODIFY `clientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12355;

--
-- AUTO_INCREMENT de la tabla `GLASSES`
--
ALTER TABLE `GLASSES`
  MODIFY `modelid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2222223;

--
-- AUTO_INCREMENT de la tabla `INVOICES`
--
ALTER TABLE `INVOICES`
  MODIFY `invoiceid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=888889;

--
-- AUTO_INCREMENT de la tabla `SUPPLIERS`
--
ALTER TABLE `SUPPLIERS`
  MODIFY `supplierid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `GLASSES`
--
ALTER TABLE `GLASSES`
  ADD CONSTRAINT `GLASSES_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `SUPPLIERS` (`supplierid`);

--
-- Filtros para la tabla `INVOICES`
--
ALTER TABLE `INVOICES`
  ADD CONSTRAINT `INVOICES_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `CLIENTS` (`clientid`),
  ADD CONSTRAINT `INVOICES_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `SUPPLIERS` (`supplierid`),
  ADD CONSTRAINT `INVOICES_ibfk_3` FOREIGN KEY (`modelid`) REFERENCES `GLASSES` (`modelid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
