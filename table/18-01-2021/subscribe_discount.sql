-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 08:03 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

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
-- Table structure for table `subscribe_discount`
--

CREATE TABLE `subscribe_discount` (
  `subscribe_discount_id` int(11) NOT NULL,
  `discount_on_amount` float NOT NULL,
  `discount_in_percent` float NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribe_discount`
--

INSERT INTO `subscribe_discount` (`subscribe_discount_id`, `discount_on_amount`, `discount_in_percent`, `is_deleted`, `created_at`, `updated_at`, `status`) VALUES
(1, 0, 5, 'No', '2021-01-15 15:59:58', '2021-01-15 15:59:58', 'Active'),
(2, 0, 12, 'No', '2021-01-15 16:00:23', '2021-01-15 16:00:23', 'Active'),
(3, 0, 20, 'No', '2021-01-15 16:00:42', '2021-01-15 16:00:42', 'Active'),
(4, 0, 25, 'No', '2021-01-15 16:00:59', '2021-01-15 16:00:59', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribe_discount`
--
ALTER TABLE `subscribe_discount`
  ADD PRIMARY KEY (`subscribe_discount_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribe_discount`
--
ALTER TABLE `subscribe_discount`
  MODIFY `subscribe_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
