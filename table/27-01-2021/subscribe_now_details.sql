-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2021 at 11:48 AM
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
-- Table structure for table `subscribe_now_details`
--

CREATE TABLE `subscribe_now_details` (
  `id` int(10) NOT NULL,
  `subscribe_now_user_id` int(11) NOT NULL,
  `coupon_code_id` int(11) NOT NULL,
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
  `expiry_date` date DEFAULT NULL,
  `extended_date` date DEFAULT NULL,
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
-- Dumping data for table `subscribe_now_details`
--

INSERT INTO `subscribe_now_details` (`id`, `subscribe_now_user_id`, `coupon_code_id`, `age`, `gender`, `weight`, `height_in_feet`, `height_in_inches`, `physical_activity_id`, `avoid_or_dislike_food_id`, `other_food`, `total`, `discount`, `price`, `food_precautions`, `lifestyle_disease`, `start_date`, `expiry_date`, `extended_date`, `subscribe_now_plan_id`, `subscribe_now_plan_duration_id`, `meal_type_id`, `address1`, `state1`, `city1`, `pincode1`, `address2`, `state2`, `city2`, `pincode2`, `is_deleted`, `created_at`, `updated_at`, `subscription_id`, `comments`, `link`, `approve_status`, `payment_status`, `transaction_id`, `address1_meal`, `address2_meal`) VALUES
(271, 0, 0, 36, 'Male', 77, 5, 9, 4, '1,6,3', '', 12000, 3000, 12600, '', 'none', '2021-01-08', NULL, NULL, 1, 3, '2,4', '403,4th floor SS Developers Shayadree Business park,Above RBL bank, Mico circle Nashik', '', '', '422002', 'Plot 5,6,7 Sukh Villas, Bharat Enclave, Next to Guru Gobind Singh College Indira nagar Annex Nashik,', '', '', '422009', 'No', '2021-01-06 18:23:28', '2021-01-14 10:18:47', '100916', 'AMOUNT HAS ALREADY BEEN PAID IN CASH . NO TOFU,SOY, MUSHROOM IN FOOD .', 'https://docs.google.com/spreadsheets/d/1WY0PYOtB1KHHeny9syxLqaMcNc48cxED7RBbnx5_bQk/edit?usp=sharing', 'Approve', 'Paid', '', 'Lunch', 'Dinner'),
(275, 0, 0, 27, 'Female', 62, 5, 3, 3, '1,6,3', '', 12000, 3000, 12600, 'NONE', 'NONE', '2021-01-08', NULL, NULL, 1, 3, '2,4', 'Plot 5.6.7 Sukh Villas, Bharat Enclave, Nest to Guru Gobind Singh Foundation, Indira Nagar Annexx', '', '', '422009', '', '', '', '', 'No', '2021-01-06 18:43:24', '2021-01-14 10:29:38', '100171', 'AMOUNT HAS ALREADY BEEN PAID IN CASH . NO TOFU,SOY, MUSHROOM IN FOOD .', 'https://docs.google.com/spreadsheets/d/1WY0PYOtB1KHHeny9syxLqaMcNc48cxED7RBbnx5_bQk/edit?usp=sharing', 'Approve', 'Paid', '', 'Lunch,Dinner', ''),
(294, 0, 0, 21, 'Female', 53, 5, 3, 3, '5', '', 0, 0, 12000, '', '', '2021-10-10', NULL, NULL, 1, 3, '1,2', 'hgyfy', '', '', '842002', '', '', '', '', 'Yes', '2021-01-07 11:42:13', '2021-01-09 14:47:52', '100332', '', '', 'Disapprove', '', '', 'Breakfast,Lunch', ''),
(296, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 12:12:30', '2021-01-07 15:07:24', '', '', '', 'Disapprove', '', '', '', ''),
(301, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 13:39:07', '2021-01-07 15:06:51', '', '', '', 'Disapprove', '', '', '', ''),
(302, 0, 0, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 15:09:09', '2021-01-07 16:56:50', '', '', '', 'Disapprove', '', '', '', ''),
(305, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 17:20:00', '2021-01-08 16:29:11', '', '', '', 'Disapprove', '', '', '', ''),
(306, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 18:18:32', '2021-01-08 16:29:07', '', '', '', 'Disapprove', '', '', '', ''),
(307, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-07 20:44:20', '2021-01-08 16:29:03', '', '', '', 'Disapprove', '', '', '', ''),
(309, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-08 15:13:08', '2021-01-08 16:28:59', '', '', '', 'Disapprove', '', '', '', ''),
(322, 0, 0, 49, 'Male', 84, 5, 11, 4, 'None', '', 3325, 175, 3491.25, 'THE ENTIRE FOOD NEEDS TO BE COOKED IN OLIVE OIL ONLY. NO USE OF REFINED OIL.', 'NONE', '2021-01-09', NULL, NULL, 1, 1, '2,4', 'Above Super value mall, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food from Monday to Saturday at office address.', '', '', '422005', '2nd Floor, Vista Apartments, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food on Sunday. Home address.', '', '', '422005', 'No', '2021-01-09 14:43:53', '2021-01-15 16:48:44', '100767', 'THE PAYMENT HAS ALREADY BEEN MADE IN CASH. THE PLAN FOR HAS STARTED FROM 09/01/2021 TILL 15/01/2021.  THE ENTIRE FOOD NEEDS TO BE COOKED IN OLIVE OIL ONLY. NO USE OF REFINED OIL', 'https://docs.google.com/spreadsheets/d/1iRAh4PSItyiT_qGPFiF9U2Pap7V4yfidjy0Q0pJirkc/edit?usp=drivesdk', 'Approve', 'Paid', '', 'Lunch,Dinner', ''),
(331, 0, 0, 30, 'Male', 80, 5, 7, 2, '', '', 4987.5, 262.5, 5236.88, 'Less oil, less spicy, less sweet', 'NONE', '2021-01-14', NULL, NULL, 1, 1, '1,2,4', 'C-302 Tulsi hari Sankul, Near Tulsi Eye Hospital, Happy home colony, Near Gen Vadiya Nagar, Dwarka, Nashik', '', '', '422011', '', '', '', '', 'No', '2021-01-10 18:38:25', '2021-01-14 14:45:09', '100857', '', '', 'Disapprove', 'Paid', 'pay_GNcDpQhhJozaYk', 'Breakfast,Lunch,Dinner', ''),
(333, 0, 0, 24, 'Male', 86, 5, 11, 4, 'None', '', 4987.5, 262.5, 5236.88, 'Less oil', 'NONE', '2021-01-14', NULL, NULL, 1, 1, '1,2,4', '3,Veronica Park, Vrindavan Colony, Gen Vaidya Nagar, Dwarka ,Nashik', '', '', '422011', '', '', '', '', 'No', '2021-01-10 18:46:17', '2021-01-11 11:09:53', '100408', '', '', 'Disapprove', 'Paid', 'pay_GNcKMav7DqotiS', 'Breakfast,Lunch,Dinner', ''),
(334, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-10 21:17:46', '2021-01-10 21:17:46', '', '', '', 'Approve', '', '', '', ''),
(336, 0, 0, 23, 'Female', 52, 5, 4, 3, '1', '', 0, 0, 6300, '', '', '2021-01-13', NULL, NULL, 1, 3, '1', 'abc', '', '', '842202', '', '', '', '', 'Yes', '2021-01-11 12:50:00', '2021-01-11 21:11:15', '100166', '', '', 'Disapprove', '', '', 'Breakfast', ''),
(379, 0, 0, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 1, '', '', '', '', '', '', '', '', '', 'No', '2021-01-12 17:49:04', '2021-01-13 15:58:10', '', '', '', 'Approve', '', '', '', ''),
(380, 0, 0, 0, 'Male', 0, 0, 0, 1, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 1, '1,2', '', '', '', '', '', '', '', '', 'Yes', '2021-01-12 18:02:51', '2021-01-16 10:02:38', '', '', '', 'Approve', '', '', '', ''),
(382, 0, 0, 30, 'Male', 80, 5, 11, 4, 'None', '', 18000, 4500, 18900, 'High Proteins', 'Borderline Diabetic', '2021-01-14', NULL, NULL, 1, 3, '1,2,4', 'Nexa Ambad, Workshop :B-17, Ambad MIDC, Nashik', '', '', '422010', 'Seva Sadan, 7/10 Next to Abhinav Apartment, Bhujbal farm road, Nashik', '', '', '422009', 'No', '2021-01-12 21:10:47', '2021-01-14 10:17:07', '100757', '', '', 'Disapprove', 'Paid', '', 'Lunch', 'Dinner'),
(386, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-13 21:07:17', '2021-01-13 21:07:17', '', '', '', 'Approve', '', '', '', ''),
(387, 0, 0, 0, 'Male', 0, 0, 0, 1, 'None', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 1, '', '', '', '', '', '', '', '', '', 'No', '2021-01-13 22:29:59', '2021-01-14 12:04:17', '', '', '', 'Approve', '', '', '', ''),
(404, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-14 23:51:08', '2021-01-14 23:51:08', '', '', '', 'Approve', '', '', '', ''),
(406, 0, 0, 34, 'Male', 82, 6, 0, 4, '1', '', 3300, 450, 3465, 'NONE', 'NONE', '2021-01-18', NULL, NULL, 1, 2, '2', 'Vipul Bungalow, Matoshree Nagar, Behind Tupsakhre Lawns (Back side of HDFC Bank)', '', '', '422002', '', '', '', '', 'No', '2021-01-15 11:11:14', '2021-01-16 10:01:48', '100902', '', '', 'Disapprove', 'Paid', '', 'Lunch', ''),
(415, 0, 0, 49, 'Male', 84, 5, 11, 4, 'None', '', 6000, 300, 6300, 'THE ENTIRE FOOD NEEDS TO BE COOKED IN OLIVE OIL ONLY. NO USE OF REFINED OIL.', 'NONE', '2021-01-18', NULL, NULL, 1, 3, '2', 'Above Super value mall, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food from Monday to Saturday at office address.', '', '', '422005', '2nd Floor, Vista Apartments, near Prasad Circle ,Shramik Nagar, Gangapur Road, Nashik.\r\nDeliver food on Sunday. Home address.', '', '', '422005', 'No', '2021-01-16 10:46:29', '2021-01-16 14:56:54', '100613', '', '', 'Disapprove', 'Paid COD', '', 'Lunch', 'Lunch'),
(416, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-17 22:20:43', '2021-01-17 22:20:43', '', '', '', 'Approve', '', '', '', ''),
(417, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-17 22:21:33', '2021-01-17 22:21:33', '', '', '', 'Approve', '', '', '', ''),
(418, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-18 12:46:23', '2021-01-18 12:46:23', '', '', '', 'Approve', '', '', '', ''),
(419, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-18 18:19:39', '2021-01-18 18:19:39', '', '', '', 'Approve', '', '', '', ''),
(421, 0, 0, 20, 'Female', 73, 5, 38, 1, 'None', '', 4987.5, 0, 5236.88, 'Prefers Avocado', 'NONE', '2021-01-19', NULL, NULL, 1, 1, '1,2,4', 'Gurughar, Plot No- 52, Bharat Enclave, Indira Nagar Annexx Near Guru Gobind Singh College, Nashik', '', '', '422010', '', '', '', '', 'No', '2021-01-18 19:37:30', '2021-01-18 21:01:39', '10094', '', '', 'Disapprove', 'Paid COD', '', '', ''),
(422, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-19 13:16:46', '2021-01-19 13:16:46', '', '', '', 'Approve', '', '', '', ''),
(423, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-19 13:25:33', '2021-01-19 13:25:33', '', '', '', 'Approve', '', '', '', ''),
(425, 0, 0, 29, 'Female', 65, 5, 3, 1, 'None', '', 24000, 6000, 25200, 'No', 'No', '2021-01-22', NULL, NULL, 1, 3, '1,2,3,4', '2791 Kokni pura phule market', '', '', '422001', 'Kokni pura', '', '', '422001', 'No', '2021-01-20 01:02:28', '2021-01-20 01:02:28', '100287', '', '', 'Disapprove', '', '', 'Breakfast,Lunch,Snack,Dinner', 'Breakfast,Lunch,Snack,Dinner'),
(427, 0, 0, 26, 'Male', 74, 5, 8, 4, 'None', '', 12000, 0, 12600, 'NONE', 'NONE', '2021-01-22', NULL, NULL, 1, 3, '2,4', 'SHIVALIK SANKALP, PRASHANT NAGAR, NEAR GST BHAVAN,PATHARDI PHATA, NASHIK', '', '', '422010', '', '', '', '', 'No', '2021-01-20 17:54:21', '2021-01-20 21:03:28', '', '', '', 'Disapprove', 'Paid COD', '', 'Lunch,Dinner', ''),
(429, 0, 0, 34, 'Male', 80, 5, 9, 3, '4', '', 1662.5, 87.5, 1745.62, '', '', '2021-01-23', NULL, NULL, 1, 1, '2', 'Club SJ, 4 floor, the business park, Dsouza colony, opp DCB bank, college Raod', '', '', '422013', '', '', '', '', 'No', '2021-01-21 01:00:21', '2021-01-21 01:00:21', '', '', '', 'Disapprove', '', '', 'Lunch', 'Lunch'),
(430, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-21 15:34:39', '2021-01-21 15:34:39', '', '', '', 'Approve', '', '', '', ''),
(431, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-21 20:29:00', '2021-01-21 20:29:00', '', '', '', 'Approve', '', '', '', ''),
(432, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-21 20:50:49', '2021-01-21 20:50:49', '', '', '', 'Approve', '', '', '', ''),
(433, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-22 17:43:11', '2021-01-22 17:43:11', '', '', '', 'Approve', '', '', '', ''),
(434, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-22 17:43:50', '2021-01-22 17:43:50', '', '', '', 'Approve', '', '', '', ''),
(435, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-22 21:48:56', '2021-01-22 21:48:56', '', '', '', 'Approve', '', '', '', ''),
(436, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-23 10:21:45', '2021-01-23 10:21:45', '', '', '', 'Approve', '', '', '', ''),
(437, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-23 11:21:36', '2021-01-23 11:21:36', '', '', '', 'Approve', '', '', '', ''),
(438, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-23 11:37:25', '2021-01-23 11:37:25', '', '', '', 'Approve', '', '', '', ''),
(441, 0, 0, 30, 'Male', 80, 5, 7, 2, 'None', '', 18000, 0, 18900, 'Less oil, less spicy, less sweet', 'NONE', '2021-01-25', NULL, NULL, 1, 3, '1,2,4', 'C-302 Tulsi hari Sankul, Near Tulsi Eye Hospital, Happy home colony, Near Gen Vadiya Nagar, Dwarka, Nashik', '', '', '422011', '', '', '', '', 'No', '2021-01-23 16:02:48', '2021-01-23 17:03:28', '', '', '', 'Disapprove', 'PAID(Razor Pay)', '', 'Breakfast,Lunch,Dinner', ''),
(444, 0, 0, 34, 'Male', 105, 6, 1, 3, 'None', '', 1662.5, 87.5, 1745.62, 'NO', 'NO', '2021-01-27', NULL, NULL, 1, 1, '3', 'Flat No 603, SSD Heights Apartment, Khanderao Nagar, opposite to Ravi rennaisance, behing hotel Express Inn', '', '', '422010', '', '', '', '', 'No', '2021-01-25 14:10:12', '2021-01-25 14:10:12', '100282', '', '', 'Disapprove', 'Paid', 'pay_GTTdmglE6kOTiU', 'Snack', ''),
(445, 0, 0, 0, 'Male', 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '0000-00-00', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', 'No', '2021-01-25 20:45:29', '2021-01-25 20:45:29', '', '', '', 'Approve', '', '', '', ''),
(447, 0, 0, 32, 'Male', 71, 5, 9, 2, '7', '', 1662.5, 87.5, 1745.62, '', '', '2021-01-29', NULL, NULL, 1, 1, '2', 'Nsdik', '', '', '341023', '', '', '', '', 'No', '2021-01-27 10:14:58', '2021-01-27 10:14:58', '', '', '', 'Disapprove', '', '', 'Lunch', ''),
(448, 0, 1, 25, 'Female', 55, 5, 2, 4, 'None', '', 3325, 175, 3491.25, '', '', '2021-02-01', '2021-02-08', '2021-02-12', 1, 1, '1,2', 'Nashik', '', '', '425413', '', '', '', '', 'No', '2021-01-27 12:26:46', '2021-01-27 12:26:46', '100436', '', '', 'Disapprove', 'Paid', 'pay_GUEwXJc3vusfym', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribe_now_details`
--
ALTER TABLE `subscribe_now_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribe_now_details`
--
ALTER TABLE `subscribe_now_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
