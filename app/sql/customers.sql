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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `created_at`) VALUES
('cus_GyUAC2FG66uDwb', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-03-25 19:15:14'),
('cus_GyUDcnj11PMNIf', 'Tom', 'Smith', 'tomm@gmail.com', '2020-03-25 19:17:59'),
('cus_GyUEIpnVZC0gRQ', 'Tom', 'Smith', 'tomm@gmail.com', '2020-03-25 19:19:14'),
('cus_GzFCTC51mN4HVJ', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-03-27 19:50:25'),
('cus_H1OWLVJr6N2b0C', 'Yohana', 'Lee', 'yohanalee.2018@smu.edu.sg', '2020-04-02 13:36:24'),
('cus_H1P1NgEMHrMxFR', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 14:08:03'),
('cus_H1P9feRPxImLLd', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 14:16:10'),
('cus_H1PLvj3Vl520Kp', 'John', 'Doe', 'jdoe@gmail.com', '2020-04-02 14:28:10'),
('cus_H1PMyRWH3JDHuF', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 14:29:20'),
('cus_H1PX8mFpwMfw5m', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 14:40:15'),
('cus_H1PugJVzW8oQgY', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 15:02:37'),
('cus_H1QsgD2b9GnMo8', 'Sally', 'Smith', 'yohanalee.2018@smu.edu.sg', '2020-04-02 16:03:11'),
('cus_H1RuSHBJ6yLstE', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 17:06:41'),
('cus_H1SB1NnBLimh0l', 'John', 'Doe', 'jdoe@gmail.com', '2020-04-02 17:23:53'),
('cus_H1SGQXJBrEPBVe', 'John', 'Doe', 'jdoe@gmail.com', '2020-04-02 17:29:05'),
('cus_H1SHWfDxQTunIM', 'John', 'Doe', 'jdoe@gmail.com', '2020-04-02 17:29:49'),
('cus_H1SI1dgL9i0l4H', 'Sally', 'Williams', 'yohanalee.2018@smu.edu.sg', '2020-04-02 17:30:53'),
('cus_H1SKJQcA2vbE7c', 'Tom', 'Smith', 'jdoe@gmail.com', '2020-04-02 17:32:52'),
('cus_H1SKlRpKKY4kMR', '', '', '', '2020-04-02 17:33:16'),
('cus_H1SL3gBWmHfpS9', 'Sally', 'Smith', 'jdoe@gmail.com', '2020-04-02 17:33:51'),
('cus_H1SNyXOmVecsjw', 'John', 'Bone', 'jdoe@gmail.com', '2020-04-02 17:35:33'),
('cus_H1SNZIoKBRPmaC', 'John', 'Bone', 'jdoe@gmail.com', '2020-04-02 17:35:33'),
('cus_H1SNLpIiPDwvNR', 'John', 'Bone', 'jdoe@gmail.com', '2020-04-02 17:35:34'),
('cus_H1SM4SqpVPG7RP', 'John', 'Bone', 'jdoe@gmail.com', '2020-04-02 17:35:43'),
('cus_H1SNYmDnMqUMta', 'John', 'Bone', 'jdoe@gmail.com', '2020-04-02 17:36:07'),
('cus_H1SPdvJ7IBvW8v', 'Sally', 'Doe', 'jdoe@gmail.com', '2020-04-02 17:38:00'),
('cus_H1SlhhnDrfQIya', 'Sally', 'Smith', 'yohanalee.2018@smu.edu.sg', '2020-04-02 17:59:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
