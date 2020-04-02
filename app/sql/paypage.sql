-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 02, 2020 at 12:42 PM
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
('cus_H1SlhhnDrfQIya', 'Sally', 'Smith', 'yohanalee.2018@smu.edu.sg', '2020-04-02 17:59:28'),
('cus_H1TMJpwssAdYgX', 'Sally', 'Smith', 'yohanalee.2018@smu.edu.sg', '2020-04-02 18:36:56'),
('cus_H1TQhq5M1BvENe', 'Tom', 'Smith', 'jdoe@gmail.com', '2020-04-02 18:41:04'),
('cus_H1U7p2EXYHoriv', 'Sally', 'Williams', 'jdoe@gmail.com', '2020-04-02 19:23:51'),
('cus_H1U84M1WI06mgr', 'Tom', 'Smith', 'jdoe@gmail.com', '2020-04-02 19:24:42'),
('cus_H1U85RDTpnk9mr', 'John', 'Smith', 'sally@gmail.com', '2020-04-02 19:25:05'),
('cus_H1U97OjxZzfFx7', 'Tom', 'Smith', 'yohanalee.2018@smu.edu.sg', '2020-04-02 19:26:02'),
('cus_H1UBWD4EOzJK6E', 'Sally', 'Williams', 'jdoe@gmail.com', '2020-04-02 19:27:56'),
('cus_H1UCnxt8RduIMn', 'Sally', 'Williams', 'jdoe@gmail.com', '2020-04-02 19:28:32'),
('cus_H1UHGaZNae7rrP', 'yoha', 'Smith', 'jdoe@gmail.com', '2020-04-02 19:34:01'),
('cus_H1ULTklqA77Kad', 'Tom', 'Williams', 'jdoe@gmail.com', '2020-04-02 19:38:08'),
('cus_H1UPwrjRGiZgS0', 'yoh', 'Smith', 'sally@gmail.com', '2020-04-02 19:41:59'),
('cus_H1UVyqU2FmmKPP', 'Sally', 'Williams', 'sally@gmail.com', '2020-04-02 19:47:43'),
('cus_H1UWNiF4Y9pI5U', 'Tom', 'Williams', 'tomm@gmail.com', '2020-04-02 19:48:56'),
('cus_H1UZ2YKSrbuiyV', 'Tom', 'Bone', 'tomm@gmail.com', '2020-04-02 19:51:47'),
('cus_H1Ua972yAlqp6O', 'yoha', 'Smith', 'jdoe@gmail.com', '2020-04-02 19:52:27'),
('cus_H1UpcZnuB4z9rv', 'yoh', 'Smith', 'tomm@gmail.com', '2020-04-02 20:08:02'),
('cus_H1V1ReiF7ADGhF', 'yoha', 'Williams', 'jdoe@gmail.com', '2020-04-02 20:19:55'),
('cus_H1V3viLUdoSixS', 'John', 'Smith', 'tomm@gmail.com', '2020-04-02 20:22:08'),
('cus_H1V5OJr7Rs9G9l', 'Tom', 'Bone', 'tomm@gmail.com', '2020-04-02 20:23:56'),
('cus_H1VAyzoNvFLOpy', 'John', 'Doe', 'yohanalee.2018@smu.edu.sg', '2020-04-02 20:29:00'),
('cus_H1VC4XacGNccqh', 'Jack', 'Williams', 'tomm@gmail.com', '2020-04-02 20:30:50'),
('cus_H1VHM4iqDJKQM3', 'yoh', 'Doe', 'jdoe@gmail.com', '2020-04-02 20:35:48'),
('cus_H1VK6ACADStZow', 'Sally', 'Williams', 'tomm@gmail.com', '2020-04-02 20:38:26'),
('cus_H1VLEnAx0DpYeE', 'yoha', 'Bone', 'tomm@gmail.com', '2020-04-02 20:39:24'),
('cus_H1VLiEJlB9SK7s', 'yoh', 'Williams', 'tomm@gmail.com', '2020-04-02 20:40:02'),
('cus_H1VMbvqjTFKdw1', 'yoh', 'Smith', 'jdoe@gmail.com', '2020-04-02 20:40:35'),
('cus_H1VMZBtRLqLZJk', 'yoh', 'Bone', 'sally@gmail.com', '2020-04-02 20:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `amount` varchar(2048) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_id`, `product`, `amount`, `currency`, `status`, `created_at`) VALUES
('ch_1GTRWMAb2gRuQhJx6PcMvUin', 'cus_H1UVyqU2FmmKPP', 'Happy in Workplace', '94.00', 'usd', 'succeeded', '2020-04-02 19:47:43'),
('ch_1GTRXWAb2gRuQhJx4Xvn5raM', 'cus_H1UWNiF4Y9pI5U', 'Happy in Workplace', '94.00', 'sgd', 'succeeded', '2020-04-02 19:48:56'),
('ch_1GTRaIAb2gRuQhJxvD5vFBiu', 'cus_H1UZ2YKSrbuiyV', 'Cooking', '50.00', 'usd', 'succeeded', '2020-04-02 19:51:47'),
('ch_1GTRavAb2gRuQhJxvNkrBZLl', 'cus_H1Ua972yAlqp6O', 'Happy in Workplace', '94.00', 'usd', 'succeeded', '2020-04-02 19:52:27'),
('ch_1GTRq1Ab2gRuQhJxBzGxM9Ub', 'cus_H1UpcZnuB4z9rv', 'Cooking', '50.00', 'sgd', 'succeeded', '2020-04-02 20:08:02'),
('ch_1GTS1VAb2gRuQhJxvjiWBcoZ', 'cus_H1V1ReiF7ADGhF', 'Happy in Workplace', '94', 'sgd', 'succeeded', '2020-04-02 20:19:55'),
('ch_1GTS3fAb2gRuQhJxlqu1IcD2', 'cus_H1V3viLUdoSixS', 'Cooking', '50', 'sgd', 'succeeded', '2020-04-02 20:22:08'),
('ch_1GTS5OAb2gRuQhJxach4Yjgf', 'cus_H1V5OJr7Rs9G9l', 'Cooking', '50', 'usd', 'succeeded', '2020-04-02 20:23:56'),
('ch_1GTSAIAb2gRuQhJxeKOREdQE', 'cus_H1VAyzoNvFLOpy', 'Cooking', '50', 'usd', 'succeeded', '2020-04-02 20:29:00'),
('ch_1GTSC5Ab2gRuQhJxCOBgvqZt', 'cus_H1VC4XacGNccqh', 'Cooking', '50', 'usd', 'succeeded', '2020-04-02 20:30:50'),
('ch_1GTSGtAb2gRuQhJxBiQcM8j5', 'cus_H1VHM4iqDJKQM3', 'Cooking', '50', 'sgd', 'succeeded', '2020-04-02 20:35:48'),
('ch_1GTSJRAb2gRuQhJxuZgtrhCC', 'cus_H1VK6ACADStZow', 'Cooking', '5000', 'sgd', 'succeeded', '2020-04-02 20:38:26'),
('ch_1GTSKNAb2gRuQhJxXIzKMJNk', 'cus_H1VLEnAx0DpYeE', 'Cooking', '50', 'sgd', 'succeeded', '2020-04-02 20:39:24'),
('ch_1GTSKyAb2gRuQhJx3njn0gDQ', 'cus_H1VLiEJlB9SK7s', 'SQL in Nutshell', '99.5', 'sgd', 'succeeded', '2020-04-02 20:40:02'),
('ch_1GTSLVAb2gRuQhJxbo3TL2v2', 'cus_H1VMbvqjTFKdw1', 'SQL in Nutshell', '99.5', 'sgd', 'succeeded', '2020-04-02 20:40:35'),
('ch_1GTSM5Ab2gRuQhJxYqMcxE74', 'cus_H1VMZBtRLqLZJk', 'testdat', '12', 'sgd', 'succeeded', '2020-04-02 20:41:11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
