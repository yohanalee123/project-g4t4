-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2020 at 05:09 AM
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
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseInfo`, `CourseType`, `Price`, `MentorID`, `Availability`, `Image`) VALUES
(97, 'SQL in Nutshell', 'Learn SQL with SSMS', 'Technology', 21.5, 0, NULL, 'images/sql.jpg'),
(98, 'Cooking', 'Learn how to cook to satisfy your MIL', 'Baking & Cooking', 99.9, 0, NULL, 'images/cooking.jpg'),
(91, 'Understanding People', 'Learn to understand human and their thoughts', 'General', 99.4, 0, NULL, 'images/post-7.jpg'),
(92, 'Happy in Workplace', 'Learn how to go home early after work', 'General', 94, 0, NULL, 'images/worl.jpg'),
(93, 'PHP Soup', 'Learn PHP and teach your future boss', 'Technology', 20.5, 0, NULL, 'images/sql.jpg'),
(94, 'Brief History of Time', 'Better remember when your aniversary', 'General', 20, 0, NULL, 'images/post-8.jpg'),
(95, 'IT\r\n', 'Study IT to get a bright future and compete with your cousins', 'Technology', 1, 0, NULL, 'images/post-9.jpg'),
(96, 'Founder of Php', 'Learn from the founder of PHP about Java', 'Technology', 34, 0, NULL, 'images/php.jpg'),
(90, 'CT', 'Code with efficiency to make your code run faster', 'Technology', 99.4, 0, NULL, 'images/post-6.jpg'),
(100, 'i want 2 die', 'asd', 'Technology', 11, 99, 'Monday Tuesday Wednesday ', 'images/killmyself.png'),
(99, 'I want die', 'Depression', 'Technology', 99, 10, 'Monday Tuesday Wednesday Thursday Friday ', 'images/die.png'),
(1, 'Kill Yohana', 'Kill Yohana', 'Technology', 1, 1, 'Wednesday Friday ', 'images/KillYohana.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
