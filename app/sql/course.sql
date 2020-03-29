-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2020 at 10:38 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(64) NOT NULL,
  `CourseInfo` varchar(1024) NOT NULL,
  `CourseType` varchar(64) NOT NULL,
  `Price` float NOT NULL,
  `MentorID` int(11) NOT NULL,
  `Availability` varchar(2048) DEFAULT NULL,
  `Image` varchar(2048) DEFAULT NULL,
  `ListDate` date DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseInfo`, `CourseType`, `Price`, `MentorID`, `Availability`, `Image`, `ListDate`) VALUES
(97, 'SQL in Nutshell', 'Learn SQL with SSMS', 'Technology', 21.5, 0, 'Monday Tuesday Thursday Friday', 'images/sql.jpg', '2020-03-29'),
(98, 'Cooking', 'Learn how to cook to satisfy your MIL', 'Baking & Cooking', 99.9, 0, 'Tuesday Wednesday Friday Saturday', 'images/cooking.jpg', '2020-03-19'),
(91, 'Understanding People', 'Learn to understand human and their thoughts', 'General', 99.4, 0, 'Wednesday Thursday Friday Sunday', 'images/post-7.jpg', '2020-03-01'),
(92, 'Happy in Workplace', 'Learn how to go home early after work', 'General', 94, 0, 'Monday Friday Sunday', 'images/worl.jpg', '2020-02-12'),
(93, 'PHP Soup', 'Learn PHP and teach your future boss', 'Technology', 20.5, 0, 'Wednesday Friday Sunday', 'images/sql.jpg', '2020-03-10'),
(94, 'Brief History of Time', 'Better remember when your aniversary', 'General', 20, 0, 'Tuesday Wednesday Thursday Friday Saturday Sunday', 'images/post-8.jpg', '2020-02-23'),
(95, 'IT\r\n', 'Study IT to get a bright future and compete with your cousins', 'Technology', 1, 0, 'Sunday', 'images/post-9.jpg', '2020-03-10'),
(96, 'Founder of Php', 'Learn from the founder of PHP about Java', 'Technology', 34, 0, 'Monday Friday', 'images/php.jpg', '2020-01-06'),
(90, 'CT', 'Code with efficiency to make your code run faster', 'Technology', 99.4, 0, 'Tuesday Thursday Friday', 'images/post-6.jpg', '2020-01-06'),
(99, 'I want die', 'Depression', 'Technology', 99, 10, 'Monday Tuesday Wednesday Thursday Friday ', 'images/die.png', '2020-01-14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
