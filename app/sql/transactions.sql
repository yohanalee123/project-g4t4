-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 02, 2020 at 10:00 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paypage`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_id`, `product`, `amount`, `currency`, `status`, `created_at`) VALUES
('ch_1GQXGPAb2gRuQhJxq8NdXPMH', 'cus_GyUEIpnVZC0gRQ', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-03-25 19:19:14'),
('ch_1GRGhgAb2gRuQhJxLl9zItqI', 'cus_GzFCTC51mN4HVJ', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-03-27 19:50:25'),
('ch_1GTLj1Ab2gRuQhJx6wlGaAHg', 'cus_H1OWLVJr6N2b0C', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 13:36:24'),
('ch_1GTMDeAb2gRuQhJxUnHzevVJ', 'cus_H1P1NgEMHrMxFR', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 14:08:03'),
('ch_1GTMLVAb2gRuQhJxyuMOYDG5', 'cus_H1P9feRPxImLLd', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 14:16:10'),
('ch_1GTMX7Ab2gRuQhJxen1aJNJQ', 'cus_H1PLvj3Vl520Kp', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 14:28:10'),
('ch_1GTMYFAb2gRuQhJxPPYsCefy', 'cus_H1PMyRWH3JDHuF', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 14:29:20'),
('ch_1GTMioAb2gRuQhJxC9Q9yaP4', 'cus_H1PX8mFpwMfw5m', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 14:40:15'),
('ch_1GTN4SAb2gRuQhJxvUeeXIad', 'cus_H1PugJVzW8oQgY', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 15:02:37'),
('ch_1GTO13Ab2gRuQhJxvn3lG4Ja', 'cus_H1QsgD2b9GnMo8', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 16:03:11'),
('ch_1GTP0VAb2gRuQhJxppAB6zIw', 'cus_H1RuSHBJ6yLstE', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 17:06:41'),
('ch_1GTPHAAb2gRuQhJxHGG2DAjV', 'cus_H1SB1NnBLimh0l', 'Intro to React Course', '5000', 'usd', 'succeeded', '2020-04-02 17:23:53'),
('ch_1GTPMBAb2gRuQhJx6uoPne8s', 'cus_H1SGQXJBrEPBVe', 'Intro to React Course', '5000', 'usd', 'succeeded', '2020-04-02 17:29:05'),
('ch_1GTPPqAb2gRuQhJxIVYBhSDE', 'cus_H1SKJQcA2vbE7c', '', '5000', 'usd', 'succeeded', '2020-04-02 17:32:52'),
('ch_1GTPQFAb2gRuQhJxLdfUEydS', 'cus_H1SKlRpKKY4kMR', '', '5000', 'usd', 'succeeded', '2020-04-02 17:33:16'),
('ch_1GTPSRAb2gRuQhJxOX6hRoFF', 'cus_H1SNyXOmVecsjw', '', '5000', 'usd', 'succeeded', '2020-04-02 17:35:33'),
('ch_1GTPSQAb2gRuQhJx4R5j9DjJ', 'cus_H1SNZIoKBRPmaC', '', '5000', 'usd', 'succeeded', '2020-04-02 17:35:33'),
('ch_1GTPSSAb2gRuQhJxQ67PHyGG', 'cus_H1SNLpIiPDwvNR', '', '5000', 'usd', 'succeeded', '2020-04-02 17:35:34'),
('ch_1GTPSHAb2gRuQhJxoH8e7EaE', 'cus_H1SM4SqpVPG7RP', '', '5000', 'usd', 'succeeded', '2020-04-02 17:35:43'),
('ch_1GTPSzAb2gRuQhJxZ8Ls65w3', 'cus_H1SNYmDnMqUMta', '', '5000', 'usd', 'succeeded', '2020-04-02 17:36:07'),
('ch_1GTPUoAb2gRuQhJxC7vnZXL0', 'cus_H1SPdvJ7IBvW8v', '', '5000', 'usd', 'succeeded', '2020-04-02 17:38:00'),
('ch_1GTPpaAb2gRuQhJx8jb1pyKK', 'cus_H1SlhhnDrfQIya', 'Intro To React Course', '5000', 'usd', 'succeeded', '2020-04-02 17:59:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
