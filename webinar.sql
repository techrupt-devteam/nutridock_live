-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 11:47 AM
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
-- Table structure for table `webinar`
--

CREATE TABLE `webinar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `age` varchar(50) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'Initiated',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webinar`
--

INSERT INTO `webinar` (`id`, `name`, `email`, `mobile`, `city`, `age`, `transaction_id`, `amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:18:36', '2020-08-26 09:18:36'),
(2, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:18:56', '2020-08-26 09:18:56'),
(3, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:19:06', '2020-08-26 09:19:06'),
(4, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:19:31', '2020-08-26 09:19:31'),
(5, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:20:58', '2020-08-26 09:20:58'),
(6, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:24:15', '2020-08-26 09:24:15'),
(7, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:34:51', '2020-08-26 09:34:51'),
(8, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:35:58', '2020-08-26 09:35:58'),
(9, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', '25', NULL, '150', 'Initiated', '2020-08-26 09:37:49', '2020-08-26 09:37:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `webinar`
--
ALTER TABLE `webinar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `webinar`
--
ALTER TABLE `webinar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
