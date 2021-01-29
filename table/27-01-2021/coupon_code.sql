-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2021 at 06:26 AM
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
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `coupon_code_id` int(11) NOT NULL,
  `coupon_code` varchar(11) NOT NULL,
  `extension_days` int(11) NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_code`
--

INSERT INTO `coupon_code` (`coupon_code_id`, `coupon_code`, `extension_days`, `is_deleted`, `created_at`, `updated_at`, `status`) VALUES
(1, 'seva_123', 100, 'Yes', '2021-01-21 14:48:44', '2021-01-21 16:38:58', 'Active'),
(2, '1234567879', 5, 'Yes', '2021-01-21 16:18:47', '2021-01-21 16:41:49', 'Active'),
(3, 'seva_9999', 5, 'No', '2021-01-21 16:19:09', '2021-01-25 14:48:25', 'Active'),
(4, 'seva_9797', 3, 'Yes', '2021-01-22 11:14:29', '2021-01-22 14:47:04', 'Active'),
(5, 'seva_45', 2, 'No', '2021-01-25 16:59:08', '2021-01-25 16:59:08', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`coupon_code_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `coupon_code_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
