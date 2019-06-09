-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Jun 03, 2019 at 06:49 PM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_reinscha`
--

-- --------------------------------------------------------

--
-- Table structure for table `Album`
--

CREATE TABLE `Album` (
  `Writer` varchar(64) NOT NULL,
  `Release_Date` date DEFAULT NULL,
  `Name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Album`
--

INSERT INTO `Album` (`Writer`, `Release_Date`, `Name`) VALUES
('Ces Cru', '0000-00-00', 'Catestrophic Event Specilaists'),
('Counting Crows', '0000-00-00', 'Shre 2(soundtrack)'),
('DC Talk', '0000-00-00', 'Jesus Freak'),
('Eagele Eye Cherry', '0000-00-00', 'Desireless'),
('Eminem', '0000-00-00', 'Kamikazie'),
('Garth Brooks', '0000-00-00', 'Ropin the Wind'),
('Goo Goo Dolls', '0000-00-00', 'City of Angels'),
('Jarren Benton', '0000-00-00', 'Skitzo - Single'),
('Jedi Mind Tricks', '0000-00-00', 'Violence Begets Violence'),
('Lifehouse', '0000-00-00', 'Who We Are'),
('Logic', '0000-00-00', 'Confessions of A Dangerous Mind'),
('Logic?', '0000-00-00', 'My Movie'),
('Mac Lethal', '0000-00-00', 'Congratulations'),
('Matchbox 20', '0000-00-00', 'More Than You Think You Are'),
('MGK', '0000-00-00', 'Lace Up'),
('Nena', '0000-00-00', '99 Luftballons'),
('Odd Future', '0000-00-00', 'The OF Tape Vol 2'),
('P.O.D', '0000-00-00', 'Satellite'),
('Pusha T', '0000-00-00', 'Spotify Sessions'),
('Skillet', '0000-00-00', 'Unleashed'),
('Tech N9ne', NULL, 'Something Else'),
('Thousand Foot Krutch', '0000-00-00', 'Exhale'),
('Tyler The Creator', NULL, 'OKRA');

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `Name` varchar(64) NOT NULL,
  `Street` varchar(64) DEFAULT NULL,
  `City` varchar(64) DEFAULT NULL,
  `State` varchar(16) DEFAULT NULL,
  `Genre` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`Name`, `Street`, `City`, `State`, `Genre`) VALUES
('Barenaked Ladies', NULL, 'Ontaria', 'Canada', 'Alternative Rock'),
('Ces Cru', NULL, 'Kansas City', 'Missouri', 'Rap'),
('Counting Crows', NULL, 'Berkeley', 'California', 'Alternative Rock'),
('DC Talk', NULL, 'Lynchburg', 'Virgina', 'Christian Rock'),
('Eagel Eye Cherry', NULL, 'Sockholm', 'Sweden', 'Rock'),
('Eminem', NULL, 'Clinton Township', 'Michigan', 'Rap'),
('Garth Brooks', NULL, 'Tusla', 'Oklahoma', 'Country'),
('Goo Goo Dolls', NULL, 'Buffalo', 'New York', 'Alternative Rock'),
('Jarren Benton', NULL, 'Decatur', 'Georgia', 'Hip Hop'),
('Jedi Mind Tricks', NULL, 'Philadelphia', 'Pennsylvania', 'Rap'),
('Lifehouse', NULL, 'Los Angeles', 'California', 'Alternative Rock'),
('Logic', NULL, 'Beverly Hills', 'California', 'Rap'),
('Logic?', NULL, NULL, NULL, 'Hip Hop'),
('Mac Lethal', NULL, 'Kansas City', 'Missouri', 'Rap'),
('Matchbox 20', NULL, 'Orlando', 'Florida', 'Alternative Rock'),
('MGK', NULL, 'Houston', 'Texas', 'Rap'),
('Nena', NULL, 'West Berlin', 'Germany', 'Rock'),
('Odd Future', NULL, 'Los Angeles', 'California', 'Alternative Hip '),
('P.O.D', NULL, 'San Diego', 'California', 'Christian Metal'),
('Push T', NULL, 'New York City', 'New York', 'Hip Hop'),
('Skillet', NULL, 'Memphis', 'Tennessee', 'Chirstina Rock'),
('Tech N9ne', NULL, 'Kasas City', 'Missouri', 'Rap'),
('Thousand Foot Krutch', NULL, 'Ontario', 'Canada', 'Christian Rock'),
('Tyler the Creator', NULL, 'Ladera Heights', 'California', 'Rap');

-- --------------------------------------------------------

--
-- Table structure for table `Playlist`
--

CREATE TABLE `Playlist` (
  `Playlist_name` varchar(64) NOT NULL,
  `Artist` varchar(64) NOT NULL,
  `Album` varchar(64) NOT NULL,
  `Title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Song`
--

CREATE TABLE `Song` (
  `Name` varchar(64) NOT NULL,
  `Length` varchar(16) NOT NULL,
  `Performer` varchar(64) NOT NULL,
  `Release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Song`
--

INSERT INTO `Song` (`Name`, `Length`, `Performer`, `Release_date`) VALUES
('Mac Lethal', '3:09', 'Angel of Death', '0000-00-00'),
('Pinch Me', '3:49', 'Barenaked Ladies', '0000-00-00'),
('Accidentally in Love', '3:08', 'Counting Crows', '0000-00-00'),
('Jesus Freak', '4:50', 'DC Talk', '0000-00-00'),
('Jedi Mind Tricks', '3:56', 'Design in Malilce', '0000-00-00'),
('Save Tonght', '3:11', 'Eagel Eye Cherry', '0000-00-00'),
('MGK', '5:07', 'Edge of Destruction', '0000-00-00'),
('Eminem', '4:22', 'Fall', '0000-00-00'),
('Against the Grain', '2:23', 'Garth Brooks', '0000-00-00'),
('Iris', '3:36', 'Goo Goo Dolls', '0000-00-00'),
('Logic?', '4:14', 'Hello World', '0000-00-00'),
('Logic', '4:05', 'Homicide', '0000-00-00'),
('Clocks', '4:24', 'Lifehouse', '0000-00-00'),
('Unwell', '3:48', 'Matchbox 20', '0000-00-00'),
('99 Luftballons', '3:49', 'Nena', '0000-00-00'),
('Tyler the Creator', '2:31', 'OKRA', '0000-00-00'),
('Odd Future', '10:38', 'Oldie', '0000-00-00'),
('Alive', '3:39', 'P.O.D', '0000-00-00'),
('Ces Cru', '4:06', 'Recession Proof', '0000-00-00'),
('Resistance', '3:08', 'Skillet', '0000-00-00'),
('Jarren Benton', '3:38', 'Skitzo', '0000-00-00'),
('Tech N9ne', '4:26', 'So Dope', '0000-00-00'),
('Pusha T', '3:59', 'Sweet Serenade', '0000-00-00'),
('Running With Giants', '4:09', 'Thousand Foot Krutch', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Username` varchar(64) NOT NULL,
  `Fname` varchar(64) NOT NULL,
  `Password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Username`, `Fname`, `Password`) VALUES
('atlas884', 'Sara', 'SuperSecretKey'),
('bookershune', 'Bella', 'Dodge:5:'),
('few_lor', 'Karol', 'asdf32345sd*7'),
('gaurav104', 'Neil', 'LetmeInnnnn'),
('loialest', 'Jimmothy', '1234'),
('lowko', 'Tim', 'PleaseDontHackMe'),
('Minithra', 'Tony', 'CheeseIsGood'),
('Swordie100', 'Nancy', 'SQLBeCool'),
('v3rononx', 'Zach', 'RayIsaCuteDoge'),
('Zerodashzero', 'Bob', 'Password');

-- --------------------------------------------------------

--
-- Table structure for table `User_Friend`
--

CREATE TABLE `User_Friend` (
  `Username` varchar(64) NOT NULL,
  `Friendname` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User_Friend`
--

INSERT INTO `User_Friend` (`Username`, `Friendname`) VALUES
('Zerodashzero', 'loialest'),
('Zerodashzero', 'atlas884'),
('Zerodashzero', 'Minithra'),
('atlas884', 'Minithra'),
('atlas884', 'bookershune'),
('gaurav104', 'v3rononx'),
('gaurav104', 'Swordie100'),
('gaurav104', 'few_lor'),
('v3rononx', 'Minithra'),
('bookershune', 'few_lor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Album`
--
ALTER TABLE `Album`
  ADD PRIMARY KEY (`Writer`);

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `Song`
--
ALTER TABLE `Song`
  ADD PRIMARY KEY (`Performer`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
