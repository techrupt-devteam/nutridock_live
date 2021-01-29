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
-- Table structure for table `subscribe_now_user`
--

CREATE TABLE `subscribe_now_user` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(155) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe_now_user`
--

INSERT INTO `subscribe_now_user` (`id`, `name`, `email`, `password`, `phone_no`, `is_deleted`, `created_at`, `updated_at`, `session_id`) VALUES
(271, 'Sunny Saluja', 'saluja@saluja.co', '', 8888888660, 'No', '2021-01-06 18:23:28', '2021-01-14 10:18:47', '57K68fryf1Rkc9sM0Wwq2tX681t521DMAXjl8Rt5'),
(275, 'Rupal Saluja', 'rupaltuteja@gmial.com', '', 9766186311, 'No', '2021-01-06 18:43:24', '2021-01-14 10:29:38', 'qpv9hfzduuTWr5VLS7mrtQhBJrH2s6se3v0KCChJ'),
(294, 'Urvashi Tikmani', 'urutikmani@gmail.com', '', 8365262818, 'Yes', '2021-01-07 11:42:13', '2021-01-09 14:47:52', 'EtYMqunI3cjDKdATgWtNHWPS9GIAQeMSuzywyawd'),
(296, 'Ayush Lad', 'ayushlad57.al@gmail.com', '', 9307168572, 'No', '2021-01-07 12:12:30', '2021-01-07 15:07:24', ''),
(301, 'Gargi', 'gargichavan@gmail.com', '', 8390552713, 'No', '2021-01-07 13:39:07', '2021-01-07 15:06:51', ''),
(302, 'Namrata', 'dandwaninamrata@gmail.com', '', 9503858522, 'No', '2021-01-07 15:09:09', '2021-01-07 16:56:50', ''),
(305, 'Yusuf Merchant', 'yusufm52@gmail.com', '', 9503503650, 'No', '2021-01-07 17:20:00', '2021-01-08 16:29:11', ''),
(306, 'RISHABH GOLIYA', 'goliyarishabh23@gmail.com', '', 7887597308, 'No', '2021-01-07 18:18:32', '2021-01-08 16:29:07', ''),
(307, 'Pooja Chandak', 'puja_jesrani@hotmail.com', '', 99300, 'No', '2021-01-07 20:44:20', '2021-01-08 16:29:03', ''),
(309, 'Shivam', 'smulane@gmail.com', '', 8208017220, 'No', '2021-01-08 15:13:08', '2021-01-08 16:28:59', ''),
(322, 'Dr.Asher Shaikh', 'drasher_s@yahoo.com', '', 9822217862, 'No', '2021-01-09 14:43:53', '2021-01-15 16:48:44', 'Y3TeZ4Prfg6O5Yi7mAnhSUUU9pg0iNH1s9CAXMyT'),
(331, 'Prathmesh Baviskar', 'prathmeshbaviskar@gmail.com', '', 9960339175, 'No', '2021-01-10 18:38:25', '2021-01-14 14:45:09', '3b26GNDLCAdJaN35mBiD38V1XpUEkJSHDLWD6WyT'),
(333, 'Omkar Bhoye', 'omkarbhoye117@gmail.com', '', 9420470117, 'No', '2021-01-10 18:46:17', '2021-01-11 11:09:53', 'i8xdi1xKLdGyRCGoInAa3LLjJgvyY52PyzyFzh7z'),
(334, 'Dhara Jain', 'sdhara311@yahoo.com', '', 8275016396, 'No', '2021-01-10 21:17:46', '2021-01-10 21:17:46', ''),
(336, 'Urvashi', 'urvashitikmani1310@gmail.com', '', 8375833971, 'Yes', '2021-01-11 12:50:00', '2021-01-11 21:11:15', 'xuzRzRm1x9zCqTmJmU1XeNFCO80TrT5pa4PX4NAJ'),
(379, 'raa maa', 'developer@techrupt.in', '', 9975649868, 'No', '2021-01-12 17:49:04', '2021-01-13 15:58:10', ''),
(380, 'Urvashi Tikmani', 'marketing@nutridock.com', '', 8375833971, 'Yes', '2021-01-12 18:02:51', '2021-01-16 10:02:38', ''),
(382, 'Aditya Bafna', 'bafna.aaditya@gmail.com', '', 9766976666, 'No', '2021-01-12 21:10:47', '2021-01-14 10:17:07', 'R9f7rwNe6vKMMPu1XYj7UMukwSRb8ro2JKlMbAOe'),
(386, 'Rehab Wani', 'wani.r.rehab@gmail.com', '', 918374415474, 'No', '2021-01-13 21:07:17', '2021-01-13 21:07:17', ''),
(387, 'Vikrant Khune', 'vikrants0009@gmail.com', '', 8390760009, 'No', '2021-01-13 22:29:59', '2021-01-14 12:04:17', ''),
(404, 'Jihan Gajjar', 'jihangajjar@gmail.com', '', 9762535555, 'No', '2021-01-14 23:51:08', '2021-01-14 23:51:08', ''),
(406, 'Vipul Chandak', 'vipulchandak216@yahoo.com', '', 8007711777, 'No', '2021-01-15 11:11:14', '2021-01-16 10:01:48', 'y887SgbOYgqhnm1g9TKMbdNC0tNIDcKDDXMOnW8v'),
(415, 'Dr.Asher Shaikh', 'drasher_s@yahoo.com', '', 9822217862, 'No', '2021-01-16 10:46:29', '2021-01-16 14:56:54', 'iq4lEXkwrxyZtvN04xSeuGW2Do6ZYObuVTnaSvs0'),
(416, 'Dilip Patil', 'Deelip.patil@tajhotels.com', '', 9225101222, 'No', '2021-01-17 22:20:43', '2021-01-17 22:20:43', ''),
(417, 'Dilip Patil', 'Deelip.patil@tajhotels.com', '', 9225101222, 'No', '2021-01-17 22:21:33', '2021-01-17 22:21:33', ''),
(418, 'Aniruddha P', 'aniruddha.p@sevagroup.co.in', '', 9428697600, 'No', '2021-01-18 12:46:23', '2021-01-18 12:46:23', ''),
(419, 'Aarohi Shetty', 'aarohishetty@gmail.com', '', 8291885992, 'No', '2021-01-18 18:19:39', '2021-01-18 18:19:39', ''),
(421, 'Tanirika Chhabra', 'ritzgopi@gmail.com', '', 8308361717, 'No', '2021-01-18 19:37:30', '2021-01-18 21:01:39', '3KbGHR87xfa8w5IAXAiT6cxN8H96v2JuzwmARtzZ'),
(422, 'Jackson Jose', 'jacksonjose30@gmail.com', '', 9765838540, 'No', '2021-01-19 13:16:46', '2021-01-19 13:16:46', ''),
(423, 'Saurabh Borase', 'sourabhborase@gmail.com', '', 9511791039, 'No', '2021-01-19 13:25:33', '2021-01-19 13:25:33', ''),
(425, 'Zaib kokni', 'zaibkokni09@gmail.com', '', 9607198876, 'No', '2021-01-20 01:02:28', '2021-01-20 01:02:28', '4w85q0KwLVUH6o2J09hRRBfl9Hxjznlt5a58lqv3'),
(427, 'Ashish Kotiya', 'patel.ashish973@gmail.com', '', 9960964567, 'No', '2021-01-20 17:54:21', '2021-01-20 21:03:28', '76FxjN1zVNM5X4ZR7l6cNLOwWDBozkUdG4GMT6WE'),
(429, 'Sagar Jadhav', 'sagarjad86@gmail.com', '', 97305, 'No', '2021-01-21 01:00:21', '2021-01-21 01:00:21', 'ANfJjm2bFuL7Z4v4wFswEDfooC2tqKgJbccC8O97'),
(430, 'Punita lalwani', 'ssoni149@gmail.com', '', 97648, 'No', '2021-01-21 15:34:39', '2021-01-21 15:34:39', ''),
(431, 'Sneha nagpure', 'sneha.n2911@yahoo.com', '', 9823676136, 'No', '2021-01-21 20:29:00', '2021-01-21 20:29:00', ''),
(432, 'Sneha nagpure', 'sneha.n2911@yahoo.com', '', 9823676136, 'No', '2021-01-21 20:50:49', '2021-01-21 20:50:49', ''),
(433, 'Raj Test M', 'developer@techrupt.com', '', 9975649868, 'No', '2021-01-22 17:43:11', '2021-01-22 17:43:11', ''),
(434, 'Rajashree Test', 'developer@techrupt.com', '', 9975649868, 'No', '2021-01-22 17:43:50', '2021-01-22 17:43:50', ''),
(435, 'Ashlesha', 'ashukahane1989@gmail.com', '', 8600766949, 'No', '2021-01-22 21:48:56', '2021-01-22 21:48:56', ''),
(436, 'Rajashree Testing', 'developer@techrupt.in', '', 9975649868, 'No', '2021-01-23 10:21:45', '2021-01-23 10:21:45', ''),
(437, 'Yash Dhakad', 'yashdhakad378@gmail', '', 9763048098, 'No', '2021-01-23 11:21:36', '2021-01-23 11:21:36', ''),
(438, 'Anas qureshi', 'mohammadanascr7@gmail.com', '', 9665891714, 'No', '2021-01-23 11:37:25', '2021-01-23 11:37:25', ''),
(441, 'Prathmesh Baviskar', 'prathmeshbaviskar@gmail.com', '', 9960339175, 'No', '2021-01-23 16:02:48', '2021-01-23 17:03:28', 'yxIe06fhCkaOrdKbrU7oYpXYXIFdZxfPyX8DGn0i'),
(444, 'Nishant Gaware', 'nishant.gaware@gmail.com', '', 9833593140, 'No', '2021-01-25 14:10:12', '2021-01-25 14:10:12', 'Vv9R7kYQuKY4UgkGXZ2mPlJm8ZTlFCaIhuO0MhyF'),
(445, 'nagesh mishra', 'mnagesh96@gmail.com', '', 9130020921, 'No', '2021-01-25 20:45:29', '2021-01-25 20:45:29', ''),
(447, 'Testing IT Team', 'webdesigner@techrupt.in', '', 7028102190, 'No', '2021-01-27 10:14:58', '2021-01-27 10:14:58', 'RtrGAGlYTBs1dNzljw0yyuueCMGTQUEy7iW4ssDY'),
(448, 'Testing Testing', 'webdeveloper@techrupt.in', '', 8149678010, 'No', '2021-01-27 12:26:46', '2021-01-27 12:26:46', '0gXrbcgp31AEaHhQie5Iyc3zaz22eyFV5daaEEUE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribe_now_user`
--
ALTER TABLE `subscribe_now_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribe_now_user`
--
ALTER TABLE `subscribe_now_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
