-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 08:39 AM
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
-- Table structure for table `subscribe_now1`
--

CREATE TABLE `subscribe_now1` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `age` int(5) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `weight` int(10) NOT NULL,
  `height_in_feet` int(5) NOT NULL,
  `height_in_inches` int(5) NOT NULL,
  `physical_activity_id` int(10) NOT NULL,
  `avoid_or_dislike_food_id` varchar(255) NOT NULL,
  `other_food` varchar(100) NOT NULL,
  `total` float NOT NULL,
  `discount` float NOT NULL,
  `price` float NOT NULL,
  `food_precautions` text NOT NULL,
  `lifestyle_disease` text NOT NULL,
  `start_date` date NOT NULL,
  `subscribe_now_plan_id` int(10) NOT NULL,
  `subscribe_now_plan_duration_id` int(10) NOT NULL,
  `meal_type_id` varchar(255) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `state1` varchar(100) NOT NULL,
  `city1` varchar(50) NOT NULL,
  `pincode1` varchar(6) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `state2` varchar(100) NOT NULL,
  `city2` varchar(50) NOT NULL,
  `pincode2` varchar(6) NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `subscription_id` varchar(55) NOT NULL,
  `comments` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `approve_status` enum('Approve','Disapprove') NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `address1_meal` varchar(55) NOT NULL,
  `address2_meal` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe_now1`
--

INSERT INTO `subscribe_now1` (`id`, `name`, `email`, `phone_no`, `age`, `gender`, `weight`, `height_in_feet`, `height_in_inches`, `physical_activity_id`, `avoid_or_dislike_food_id`, `other_food`, `total`, `discount`, `price`, `food_precautions`, `lifestyle_disease`, `start_date`, `subscribe_now_plan_id`, `subscribe_now_plan_duration_id`, `meal_type_id`, `address1`, `state1`, `city1`, `pincode1`, `address2`, `state2`, `city2`, `pincode2`, `is_deleted`, `created_at`, `updated_at`, `session_id`, `subscription_id`, `comments`, `link`, `approve_status`, `payment_status`, `transaction_id`, `address1_meal`, `address2_meal`) VALUES
(3, 'Amira Dhivre', 'webdeveloper@techrupt.in', 8149678010, 25, 'Female', 55, 5, 2, 4, 'None', '', 6650, 350, 6982.5, '', '', '2021-01-20', 1, 1, '1,2,3,4', 'Nashik', '', '', '425413', '', '', '', '', 'No', '2021-01-18 12:24:38', '2021-01-18 12:24:38', 'ToGCDqeHjbkBqDnLxRAnANgAWd4vdCwdoD71jocP', '100525', '', '', 'Disapprove', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribe_now1`
--
ALTER TABLE `subscribe_now1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribe_now1`
--
ALTER TABLE `subscribe_now1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
