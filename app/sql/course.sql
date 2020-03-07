-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 07, 2020 at 02:15 PM
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
  `Availability` varchar(2048) DEFAULT NULL,
  `Image` varchar(2048) DEFAULT NULL,
  `MentorID` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseInfo`, `CourseType`, `Price`, `Availability`, `Image`, `MentorID`) VALUES
(97, 'SQL in Nutshell', 'Learn SQL with SSMS', 'Technology', 21.5, NULL, NULL, 0),
(98, 'Cooking', 'Learn how to cook to satisfy your MIL', 'Baking & Cooking', 99.9, NULL, NULL, 0),
(91, 'Understanding People', 'Learn to understand human and their thoughts', '', 99.4, NULL, NULL, 0),
(92, 'Happy in Workplace', 'Learn how to go home early after work', '', 94, NULL, NULL, 0),
(93, 'PHP Soup', 'Learn PHP and teach your future boss', 'Technology', 20.5, NULL, NULL, 0),
(94, 'Brief History of Time', 'Better remember when your aniversary', '', 20, NULL, NULL, 0),
(95, 'It', 'Study IT to get a bright future and compete with your cousins', 'Technology', 1, NULL, NULL, 0),
(96, 'Founder of Php', 'Learn from the founder of PHP about Java', 'Technology', 34, NULL, NULL, 0),
(90, 'CT', 'Code with efficiency to make your code run faster', 'Technology', 99.4, 'Monday', NULL, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
