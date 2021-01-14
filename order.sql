-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 10:46 AM
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
-- Database: `sonubafn_canvassy`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pincode` int(10) DEFAULT NULL,
  `canvas_size` varchar(100) DEFAULT NULL,
  `shipping_charge` varchar(100) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'Initiated',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `name`, `email`, `mobile`, `city`, `state`, `address`, `pincode`, `canvas_size`, `shipping_charge`, `image1`, `image2`, `image3`, `image4`, `image5`, `dob`, `order_date`, `transaction_id`, `amount`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Small- 14x18 inches - Rs 6800', '350', '5bd5c75cfedc62b93e06a6e3cba70194d63353f6.jpg', '746755ff92895f46d74b57905adcc93754a8d18d.jpg', 'd77cc7457d6c1633c70769001bacfe33d44b1504.jpg', NULL, NULL, NULL, NULL, NULL, '7150', '', 'Initiated', '2020-08-24 12:38:12', '2020-08-24 12:38:12'),
(2, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Small- 14x18 inches - Rs 6800', '350', 'b1b80157f2ae12a404d971af12981e7bfa3785a0.jpg', 'ac34444a7df73f24e32a85e60d88792bc7d5cc81.jpg', '3fe100ee5df1433ea12d545cc13b3e77b7c3a845.jpg', NULL, NULL, NULL, NULL, NULL, '7150', '', 'Initiated', '2020-08-24 12:38:46', '2020-08-24 12:38:46'),
(3, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Small- 14x18 inches - Rs 6800', '350', 'dd6dfabc096a71e2b9a8865a0edd22e24176ac34.jpg', 'a7b1ac5638bb95c890ab11b66cd27dabfd192a44.jpg', 'b3e88fabe36ed2d1c60f6b8bb39d1971dce64de4.jpg', NULL, NULL, NULL, NULL, NULL, '7150', '', 'Initiated', '2020-08-24 12:40:28', '2020-08-24 12:40:28'),
(4, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Medium- 18x24 inches- Rs 9800', '450', 'b8b867f77be4225bffdef9d03303d617d60729f4.jpg', '7873e988db991972fb49447f96db6b9c668d308a.jpg', '16617c828885aa13473066ec5bdb83f647d7eee0.jpg', NULL, NULL, NULL, NULL, NULL, '10250', '', 'Initiated', '2020-08-24 12:42:45', '2020-08-24 12:42:45'),
(5, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Medium- 18x24 inches- Rs 9800', '450', '116d69647f2d326b9746e985ee8cd146736c0486.jpg', '7591e76076646c9ccd46f737dd6ac006d6436dcd.jpg', '767936d4e539232f636e3d5bf575de7f31139e02.jpg', NULL, NULL, NULL, NULL, NULL, '10250', '', 'Initiated', '2020-08-24 12:42:57', '2020-08-24 12:42:57'),
(6, 'testing', 'webdeveloper@techrupt.in', '9284225229', 'saaa', 'er', 'fsf', 123456, 'Small- 14x18 inches - Rs 6800', '350', 'af43fe89621f440c4e3523d2d4ddbd63b119e6d6.jpg', '2b806cbdb27233d4e3ebab039f61a074ca292732.png', '573711b404b698e0197184330c213d76e12d71c7.jpg', NULL, NULL, NULL, NULL, NULL, '7150', '', 'Initiated', '2020-08-25 05:06:28', '2020-08-25 05:06:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
