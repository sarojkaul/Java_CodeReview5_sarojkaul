-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Dez 2020 um 20:12
-- Server-Version: 10.4.16-MariaDB
-- PHP-Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr5_famazon_sarojkaul`
--
CREATE DATABASE IF NOT EXISTS `cr5_famazon_sarojkaul` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr5_famazon_sarojkaul`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_Id` int(11) NOT NULL,
  `company_name` varchar(55) DEFAULT NULL,
  `address` varchar(66) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `fk_location_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`company_Id`, `company_name`, `address`, `phone_number`, `fk_location_Id`) VALUES
(1, 'addidas', '103-1409 99 St NW', 234590812, 3),
(2, 'Puma', '203-1409 99 St NW', 234590809, 1),
(3, 'Huawei', '203-1409 99 St NW', 134590809, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cutomers`
--

CREATE TABLE `cutomers` (
  `coustmer_Id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `gender` varchar(55) DEFAULT NULL,
  `email` varchar(44) DEFAULT NULL,
  `dateof_registration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cutomers`
--

INSERT INTO `cutomers` (`coustmer_Id`, `first_name`, `last_name`, `gender`, `email`, `dateof_registration`) VALUES
(1, 'john', 'smith', 'Male', 'johnQgmail.com', '2001-04-12'),
(2, 'alina', 'kithe', 'Female', 'alina@gmail.com', '2001-10-12'),
(3, 'Mike', 'joe', 'Male', 'Mike@gmail.com', '2001-03-11'),
(4, 'Maria', 'ions', 'Female', 'maria@gmail.com', '2020-03-11');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_Id` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_Id`, `country`, `city`, `zipcode`) VALUES
(1, 'Canada', 'Brahmton', 12345),
(2, 'America', 'Tax', 22346),
(3, 'Austria', 'vienna', 134567),
(4, 'Austria', 'Linz', 734567);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `order_Id` int(11) NOT NULL,
  `fk_customer_Id` int(11) DEFAULT NULL,
  `fk_product_Id` int(11) DEFAULT NULL,
  `fk_company_Id` int(11) DEFAULT NULL,
  `fk_location_Id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `approved` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`order_Id`, `fk_customer_Id`, `fk_product_Id`, `fk_company_Id`, `fk_location_Id`, `order_date`, `approved`, `quantity`) VALUES
(1, 2, 2, 3, 4, '2020-07-12 00:00:00', 'Yes', 2),
(2, 3, 1, 1, 1, '2020-11-12 00:00:00', 'Yes', 4),
(3, 4, 1, 2, 3, '2020-10-12 00:00:00', 'Yes', 1),
(4, 2, 1, 1, 2, '2020-03-12 00:00:00', 'Yes', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `product_Id` int(11) NOT NULL,
  `fk_product_category_Id` int(11) DEFAULT NULL,
  `fk_company_Id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`product_Id`, `fk_product_category_Id`, `fk_company_Id`, `stock`, `price`, `product_name`) VALUES
(1, 2001, 3, 50, '120Euro', 'Huawei_Xpro'),
(2, 2002, 1, 120, '20Euro', 'Addidas T_shirt'),
(3, 2004, 2, 50, '70Euro', 'Puma shoes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product_category`
--

CREATE TABLE `product_category` (
  `product_category_Id` int(11) NOT NULL,
  `name` varchar(66) DEFAULT NULL,
  `description` varchar(77) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `product_category`
--

INSERT INTO `product_category` (`product_category_Id`, `name`, `description`) VALUES
(2001, 'Phone', 'This category contains all phones'),
(2002, 'clothes', 'This category contains all clothes'),
(2003, 'Electronic', 'This category contains all electronic products'),
(2004, 'shoes', 'This category contains all shoes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipment_status`
--

CREATE TABLE `shipment_status` (
  `status_Id` int(11) NOT NULL,
  `fk_order_Id` int(11) DEFAULT NULL,
  `shipped` varchar(55) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL,
  `sent_date_Time` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shipment_status`
--

INSERT INTO `shipment_status` (`status_Id`, `fk_order_Id`, `shipped`, `fk_location`, `sent_date_Time`, `delivery_date`) VALUES
(1, 1, 'Yes', 2, '2020-09-12', '2020-12-12'),
(2, 2, 'Yes', 1, '0000-00-00', '0000-00-00'),
(3, 4, 'Yes', 3, '2020-07-12', '2020-10-12');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_Id`),
  ADD KEY `fk_location_Id` (`fk_location_Id`);

--
-- Indizes für die Tabelle `cutomers`
--
ALTER TABLE `cutomers`
  ADD PRIMARY KEY (`coustmer_Id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_Id`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_Id`),
  ADD KEY `fk_customer_Id` (`fk_customer_Id`),
  ADD KEY `fk_product_Id` (`fk_product_Id`),
  ADD KEY `fk_company_Id` (`fk_company_Id`),
  ADD KEY `fk_location_Id` (`fk_location_Id`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_Id`),
  ADD KEY `fk_product_category_Id` (`fk_product_category_Id`),
  ADD KEY `fk_company_Id` (`fk_company_Id`);

--
-- Indizes für die Tabelle `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_Id`);

--
-- Indizes für die Tabelle `shipment_status`
--
ALTER TABLE `shipment_status`
  ADD PRIMARY KEY (`status_Id`),
  ADD KEY `fk_order_Id` (`fk_order_Id`),
  ADD KEY `fk_location` (`fk_location`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `company`
--
ALTER TABLE `company`
  MODIFY `company_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `cutomers`
--
ALTER TABLE `cutomers`
  MODIFY `coustmer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `location_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `orders`
--
ALTER TABLE `orders`
  MODIFY `order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2005;

--
-- AUTO_INCREMENT für Tabelle `shipment_status`
--
ALTER TABLE `shipment_status`
  MODIFY `status_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_location_Id`) REFERENCES `location` (`location_Id`);

--
-- Constraints der Tabelle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_customer_Id`) REFERENCES `cutomers` (`coustmer_Id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_product_Id`) REFERENCES `products` (`product_Id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`fk_company_Id`) REFERENCES `company` (`company_Id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`fk_location_Id`) REFERENCES `location` (`location_Id`);

--
-- Constraints der Tabelle `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_product_category_Id`) REFERENCES `product_category` (`product_category_Id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`fk_company_Id`) REFERENCES `company` (`company_Id`);

--
-- Constraints der Tabelle `shipment_status`
--
ALTER TABLE `shipment_status`
  ADD CONSTRAINT `shipment_status_ibfk_1` FOREIGN KEY (`fk_order_Id`) REFERENCES `orders` (`order_Id`),
  ADD CONSTRAINT `shipment_status_ibfk_2` FOREIGN KEY (`fk_location`) REFERENCES `location` (`location_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
