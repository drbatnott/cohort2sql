-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2022 at 04:03 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newpenguin`
--

-- --------------------------------------------------------

--
-- Table structure for table `habitat`
--

CREATE TABLE `habitat` (
  `habitatID` int(11) NOT NULL,
  `habitatDescription` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `habitat`
--

INSERT INTO `habitat` (`habitatID`, `habitatDescription`) VALUES
(1, 'Antarctic Oceans'),
(2, 'A variety of islands and shores in the Southern Pacific and the Antarctic Oceans.');

-- --------------------------------------------------------

--
-- Table structure for table `penguin`
--

CREATE TABLE `penguin` (
  `penguinID` int(11) NOT NULL,
  `commonName` varchar(50) NOT NULL,
  `scientificName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penguin`
--

INSERT INTO `penguin` (`penguinID`, `commonName`, `scientificName`) VALUES
(1, 'Emperor', 'Aptenodytes forsteri'),
(2, 'Adelie', 'Pygoscelis adeliae');

-- --------------------------------------------------------

--
-- Table structure for table `penguinhabitation`
--

CREATE TABLE `penguinhabitation` (
  `penguinID` int(11) NOT NULL,
  `habitatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penguinhabitation`
--

INSERT INTO `penguinhabitation` (`penguinID`, `habitatID`) VALUES
(1, 1),
(2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `habitat`
--
ALTER TABLE `habitat`
  ADD PRIMARY KEY (`habitatID`);

--
-- Indexes for table `penguin`
--
ALTER TABLE `penguin`
  ADD PRIMARY KEY (`penguinID`);

--
-- Indexes for table `penguinhabitation`
--
ALTER TABLE `penguinhabitation`
  ADD KEY `penguinID` (`penguinID`),
  ADD KEY `habitatID` (`habitatID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `habitat`
--
ALTER TABLE `habitat`
  MODIFY `habitatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penguin`
--
ALTER TABLE `penguin`
  MODIFY `penguinID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penguinhabitation`
--
ALTER TABLE `penguinhabitation`
  ADD CONSTRAINT `penguinhabitation_ibfk_1` FOREIGN KEY (`penguinID`) REFERENCES `penguin` (`penguinID`),
  ADD CONSTRAINT `penguinhabitation_ibfk_2` FOREIGN KEY (`habitatID`) REFERENCES `habitat` (`habitatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
