-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2021 at 06:22 PM
-- Server version: 5.7.32
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutridoc_nutridock`
--

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_now`
--

CREATE TABLE `subscribe_now` (
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
-- Dumping data for table `subscribe_now`
--

INSERT INTO `subscribe_now` (`id`, `name`, `email`, `phone_no`, `age`, `gender`, `weight`, `height_in_feet`, `height_in_inches`, `physical_activity_id`, `avoid_or_dislike_food_id`, `other_food`, `total`, `discount`, `price`, `food_precautions`, `lifestyle_disease`, `start_date`, `subscribe_now_plan_id`, `subscribe_now_plan_duration_id`, `meal_type_id`, `address1`, `state1`, `city1`, `pincode1`, `address2`, `state2`, `city2`, `pincode2`, `is_deleted`, `created_at`, `updated_at`, `session_id`, `subscription_id`, `comments`, `link`, `approve_status`, `payment_status`, `transaction_id`, `address1_meal`, `address2_meal`) VALUES
(271, 'Sunny Saluja', 'saluja@saluja.co', 8888888660, 36, 'Male', 77, 5, 9, 4, '1,6,3', '', 12000, 3000, 12600, '', 'none', '2021-01-08', 1, 3, '2,4', '403,4th floor SS Developers Shayadree Business park,Above RBL bank, Mico circle Nashik', '', '', '422002', 'Plot 5,6,7 Sukh Villas, Bharat Enclave, Next to Guru Gobind Singh College Indira nagar Annex Nashik,', '', '', '422009', 'No', '2021-01-06 18:23:28', '2021-01-14 10:18:47', '57K68fryf1Rkc9sM0Wwq2tX681t521DMAXjl8Rt5', '100916', 'AMOUNT HAS ALREADY BEEN PAID IN CASH . NO TOFU,SOY, MUSHROOM IN FOOD .', 'https://docs.google.com/spreadsheets/d/1WY0PYOtB1KHHeny9syxLqaMcNc48cxED7RBbnx5_bQk/edit?usp=sharing', 'Approve', 'Paid', '', 'Lunch', 'Dinner'),
(275, 'Rupal Saluja', 'rupaltuteja@gmial.com', 9766186311, 27, 'Female', 62, 5, 3, 3, '1,6,3', '', 12000, 3000, 12600, 'NONE', 'NONE', '2021-01-08', 1, 3, '2,4', 'Plot 5.6.7 Sukh Villas, Bharat Enclave, Nest to Guru Gobind Singh Foundation, Indira Nagar Annexx', '', '', '422009', '', '', '', '', 'No', '2021-01-06 18:43:24', '2021-01-14 10:29:38', 'qpv9hfzduuTWr5VLS7mrtQhBJrH2s6se3v0KCChJ', '100171', 'AMOUNT HAS ALREADY BEEN PAID IN CASH . NO TOFU,SOY, MUSHROOM IN FOOD .', 'https://docs.google.com/spreadsheets/d/1WY0PYOtB1KHHeny9syxLqaMcNc48cxED7RBbnx5_bQk/edit?usp=sharing', 'Approve', 'Paid', '', 'Lunch,Dinner', ''),
(294, 'Urvashi Tikmani', 'urutikmani@gmail.com', 8365262818, 21, 'Female', 53, 5, 3, 3, '5', '', 0, 0, 12000, '', '', '2021-10-10', 1, 3, '1,2', 'hgyfy', '', '', '842002', '', '', '', '', 'Yes', '2021-01-07 11:42:13', '2021-01-09 14:47:52', 'EtYMqunI3cjDKdATgWtNHWPS9GIAQeMSuzywyawd', '100332', '', '', 'Disapprove', '', '', 'Breakfast,Lunch', ''),
(296, 'Ayush Lad', 'ayushlad57.al@gmail.com', 9307168572, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 12:12:30', '2021-01-07 15:07:24', '', '', '', '', 'Disapprove', '', '', '', ''),
(301, 'Gargi', 'gargichavan@gmail.com', 8390552713, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 13:39:07', '2021-01-07 15:06:51', '', '', '', '', 'Disapprove', '', '', '', ''),
(302, 'Namrata', 'dandwaninamrata@gmail.com', 9503858522, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 15:09:09', '2021-01-07 16:56:50', '', '', '', '', 'Disapprove', '', '', '', ''),
(305, 'Yusuf Merchant', 'yusufm52@gmail.com', 9503503650, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 17:20:00', '2021-01-08 16:29:11', '', '', '', '', 'Disapprove', '', '', '', ''),
(306, 'RISHABH GOLIYA', 'goliyarishabh23@gmail.com', 7887597308, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 18:18:32', '2021-01-08 16:29:07', '', '', '', '', 'Disapprove', '', '', '', ''),
(307, 'Pooja Chandak', 'puja_jesrani@hotmail.com', 99300, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 20:44:20', '2021-01-08 16:29:03', '', '', '', '', 'Disapprove', '', '', '', ''),
(309, 'Shivam', 'smulane@gmail.com', 8208017220, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-08 15:13:08', '2021-01-08 16:28:59', '', '', '', '', 'Disapprove', '', '', '', ''),
(322, 'Dr.Asher Shaikh', 'drasher_s@yahoo.com', 9822217862, 49, 'Male', 84, 5, 11, 4, 'None', '', 3325, 175, 3491.25, 'THE ENTIRE FOOD NEEDS TO BE COOKED IN OLIVE OIL ONLY. NO USE OF REFINED OIL.', 'NONE', '2021-01-11', 1, 1, '2,4', 'Above Super value mall, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food from Monday to Saturday at office address.', '', '', '422005', '2nd Floor, Vista Apartments, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food on Sunday. Home address.', '', '', '422005', 'No', '2021-01-09 14:43:53', '2021-01-14 10:19:22', 'Y3TeZ4Prfg6O5Yi7mAnhSUUU9pg0iNH1s9CAXMyT', '100767', 'THE PAYMENT HAS ALREADY BEEN MADE IN CASH. THE PLAN FOR HAS STARTED FROM 09/01/2021 TILL 15/01/2021.  THE ENTIRE FOOD NEEDS TO BE COOKED IN OLIVE OIL ONLY. NO USE OF REFINED OIL', 'https://docs.google.com/spreadsheets/d/1iRAh4PSItyiT_qGPFiF9U2Pap7V4yfidjy0Q0pJirkc/edit?usp=drivesdk', 'Approve', 'Paid', '', 'Lunch,Dinner', ''),
(331, 'Prathmesh Baviskar', 'prathmeshbaviskar@gmail.com', 9960339175, 30, 'Male', 80, 5, 7, 2, '', '', 4987.5, 262.5, 5236.88, 'Less oil, less spicy, less sweet', 'NONE', '2021-01-14', 1, 1, '1,2,4', 'C-302 Tulsi hari Sankul, Near Tulsi Eye Hospital, Happy home colony, Near Gen Vadiya Nagar, Dwarka, Nashik', '', '', '422011', '', '', '', '', 'No', '2021-01-10 18:38:25', '2021-01-14 14:45:09', '3b26GNDLCAdJaN35mBiD38V1XpUEkJSHDLWD6WyT', '100857', '', '', 'Disapprove', 'Paid', 'pay_GNcDpQhhJozaYk', 'Breakfast,Lunch,Dinner', ''),
(333, 'Omkar Bhoye', 'omkarbhoye117@gmail.com', 9420470117, 24, 'Male', 86, 5, 11, 4, 'None', '', 4987.5, 262.5, 5236.88, 'Less oil', 'NONE', '2021-01-14', 1, 1, '1,2,4', '3,Veronica Park, Vrindavan Colony, Gen Vaidya Nagar, Dwarka ,Nashik', '', '', '422011', '', '', '', '', 'No', '2021-01-10 18:46:17', '2021-01-11 11:09:53', 'i8xdi1xKLdGyRCGoInAa3LLjJgvyY52PyzyFzh7z', '100408', '', '', 'Disapprove', 'Paid', 'pay_GNcKMav7DqotiS', 'Breakfast,Lunch,Dinner', ''),
(334, 'Dhara Jain', 'sdhara311@yahoo.com', 8275016396, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-10 21:17:46', '2021-01-10 21:17:46', '', '', '', '', 'Approve', '', '', '', ''),
(336, 'Urvashi', 'urvashitikmani1310@gmail.com', 8375833971, 23, 'Female', 52, 5, 4, 3, '1', '', 0, 0, 6300, '', '', '2021-01-13', 1, 3, '1', 'abc', '', '', '842202', '', '', '', '', 'Yes', '2021-01-11 12:50:00', '2021-01-11 21:11:15', 'xuzRzRm1x9zCqTmJmU1XeNFCO80TrT5pa4PX4NAJ', '100166', '', '', 'Disapprove', '', '', 'Breakfast', ''),
(379, 'raa maa', 'developer@techrupt.in', 9975649868, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 1, '', '', '', '', '', '', '', '', '', 'No', '2021-01-12 17:49:04', '2021-01-13 15:58:10', '', '', '', '', 'Approve', '', '', '', ''),
(380, 'Urvashi Tikmani', 'marketing@nutridock.com', 8375833971, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 1, '1,2', '', '', '', '', '', '', '', '', 'No', '2021-01-12 18:02:51', '2021-01-13 18:38:51', '', '', '', '', 'Approve', '', '', '', ''),
(382, 'Aditya Bafna', 'bafna.aaditya@gmail.com', 9766976666, 30, 'Male', 80, 5, 11, 4, 'None', '', 18000, 4500, 18900, 'High Proteins', 'Borderline Diabetic', '2021-01-14', 1, 3, '1,2,4', 'Nexa Ambad, Workshop :B-17, Ambad MIDC, Nashik', '', '', '422010', 'Seva Sadan, 7/10 Next to Abhinav Apartment, Bhujbal farm road, Nashik', '', '', '422009', 'No', '2021-01-12 21:10:47', '2021-01-14 10:17:07', 'R9f7rwNe6vKMMPu1XYj7UMukwSRb8ro2JKlMbAOe', '100757', '', '', 'Disapprove', 'Paid', '', 'Lunch', 'Dinner'),
(386, 'Rehab Wani', 'wani.r.rehab@gmail.com', 918374415474, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-13 21:07:17', '2021-01-13 21:07:17', '', '', '', '', 'Approve', '', '', '', ''),
(387, 'Vikrant Khune', 'vikrants0009@gmail.com', 8390760009, 0, 'Male', 0, 0, 0, 1, 'None', '', 0, 0, 0, '', '', '0000-00-00', 0, 1, '', '', '', '', '', '', '', '', '', 'No', '2021-01-13 22:29:59', '2021-01-14 12:04:17', '', '', '', '', 'Approve', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribe_now`
--
ALTER TABLE `subscribe_now`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribe_now`
--
ALTER TABLE `subscribe_now`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
