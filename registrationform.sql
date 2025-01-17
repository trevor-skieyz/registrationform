-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 12:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registrationform`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `AllergyID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `AllergyDescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontacts`
--

CREATE TABLE `emergencycontacts` (
  `ContactID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL DEFAULT current_timestamp(),
  `Gender` enum('Male','female','other','') NOT NULL,
  `Contact_number` int(11) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitrecords`
--

CREATE TABLE `visitrecords` (
  `VisitID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `ReasonForVisit` varchar(255) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`AllergyID`);

--
-- Indexes for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD PRIMARY KEY (`ContactID`),
  ADD KEY `emergencycontacts` (`PatientID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `visitrecords`
--
ALTER TABLE `visitrecords`
  ADD PRIMARY KEY (`VisitID`),
  ADD KEY `visitrecords` (`PatientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergies`
--
ALTER TABLE `allergies`
  ADD CONSTRAINT `allergies` FOREIGN KEY (`AllergyID`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD CONSTRAINT `emergencycontacts` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visitrecords`
--
ALTER TABLE `visitrecords`
  ADD CONSTRAINT `visitrecords` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
