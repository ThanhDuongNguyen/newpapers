-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2020 at 06:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newspaper`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `IDUser` int(20) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PermisstionID` int(20) NOT NULL DEFAULT 4,
  `Author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Duration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUser`, `Name`, `Email`, `DOB`, `Password`, `PermisstionID`, `Author`, `Duration`) VALUES
(1, 'huuduc', 'duc@gmail.com', '1999-11-27', '123456', 1, '', '2020-06-26 01:53:00'),
(2, 'thanhduong', 'duong@gmail.com', '2020-06-18', '', 3, '', '2020-06-26 01:53:00'),
(3, 'thecong', 'cong@gmail.com', '2020-06-13', '', 2, '', '2020-06-26 01:53:00'),
(4, 'quangtrung', 'trung@gmail.com', '2020-06-10', '', 4, '', '2020-06-26 01:53:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`),
  ADD KEY `fk_user_permission` (`PermisstionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_permission` FOREIGN KEY (`PermisstionID`) REFERENCES `permission` (`PermissionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
