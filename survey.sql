-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2020 at 08:33 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutridock`
--

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `download_app` varchar(50) NOT NULL,
  `comments` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `download_app`, `comments`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'Yes', 'dsdvsdvadawd', '2020-08-28 05:28:33', '2020-08-28 05:28:33', 'Active', 'No'),
(2, 'Yes', 'dsdvsdvadawd', '2020-08-28 05:28:44', '2020-08-28 05:28:44', 'Active', 'No'),
(3, 'Yes', 'dddsasdasdads', '2020-08-28 05:31:55', '2020-08-28 05:31:55', 'Active', 'No'),
(4, 'Yes', 'zfzdff', '2020-08-28 05:34:14', '2020-08-28 05:34:14', 'Active', 'No'),
(5, 'Yes', 'afsfsf', '2020-08-28 05:41:06', '2020-08-28 05:41:06', 'Active', 'No'),
(6, 'Yes', 'scsdfdad', '2020-08-28 05:43:18', '2020-08-28 05:43:18', 'Active', 'No'),
(7, 'Yes', 'xcXCsCasd', '2020-08-28 05:44:00', '2020-08-28 05:44:00', 'Active', 'No'),
(8, 'Yes', 'dsdsd', '2020-08-28 05:44:58', '2020-08-28 05:44:58', 'Active', 'No'),
(9, 'Yes', 'adDDAD', '2020-08-28 05:50:25', '2020-08-28 05:50:25', 'Active', 'No'),
(10, 'Yes', 'ADAD', '2020-08-28 05:51:13', '2020-08-28 05:51:13', 'Active', 'No'),
(11, 'Yes', 'ASDd', '2020-08-28 05:54:18', '2020-08-28 05:54:18', 'Active', 'No'),
(12, 'Yes', 'asdsdD', '2020-08-28 05:57:17', '2020-08-28 05:57:17', 'Active', 'No'),
(13, 'Yes', 'SSADSDD', '2020-08-28 05:59:25', '2020-08-28 05:59:25', 'Active', 'No'),
(14, 'Yes', 'ASDADAF', '2020-08-28 06:03:47', '2020-08-28 06:03:47', 'Active', 'No'),
(15, 'Yes', 'Hello', '2020-08-28 06:05:24', '2020-08-28 06:05:24', 'Active', 'No'),
(16, 'Yes', 'zssdasd', '2020-08-28 06:11:23', '2020-08-28 06:11:23', 'Active', 'No'),
(17, 'Yes', 'sasdsd', '2020-08-28 06:12:17', '2020-08-28 06:12:17', 'Active', 'No'),
(18, 'Yes', 'asdasdsd', '2020-08-28 06:14:48', '2020-08-28 06:14:48', 'Active', 'No'),
(19, 'Yes', 'asdsdsd', '2020-08-28 06:15:05', '2020-08-28 06:15:05', 'Active', 'No'),
(20, 'Yes', 'zdsdd', '2020-08-28 06:15:31', '2020-08-28 06:15:31', 'Active', 'No'),
(21, 'Yes', 'afafdf', '2020-08-28 06:17:26', '2020-08-28 06:17:26', 'Active', 'No'),
(22, 'Yes', 'asdsdsd', '2020-08-28 06:18:07', '2020-08-28 06:18:07', 'Active', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
