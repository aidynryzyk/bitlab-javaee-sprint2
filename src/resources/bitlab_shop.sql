-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 18, 2023 at 11:56 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitlab_shop`
--
CREATE DATABASE IF NOT EXISTS `bitlab_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bitlab_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES(1, 'computers');
INSERT INTO `categories` (`id`, `name`) VALUES(2, 'smartphones');
INSERT INTO `categories` (`id`, `name`) VALUES(3, 'tablets');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `sold` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(1, 'Macbook Pro 2020', '8 GB RAM/256GB SSD/Intel Core i7', 1499.99, 561, 1, '2020-01-01');
INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(2, 'ASUS TUF GAMING', '16 GB RAM/512GB SSD/AMD Ryzen 5', 999.99, 13, 1, '2019-01-01');
INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(4, 'Apple iPhone 12 Pro', '6 GB RAM/128GB Memory/Super Retina XDR OLED Display', 1099.99, 9, 2, '2020-10-13');
INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(5, 'XIAOMI Redmi Note 8', '6 GB RAM/64GB Memory/Android 9 Pie', 199.99, 9, 2, '2021-05-24');
INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(6, 'XIAOMI Redmi Note 10', '8 GB RAM/128GB Memory/Android 11', 299.99, 16, 2, '2022-05-24');
INSERT INTO `items` (`id`, `name`, `description`, `price`, `sold`, `category_id`, `date_added`) VALUES(7, 'MSI Prestige 15', 'Intel Core i7/1024GB Memory/32 GB RAM', 1999.99, 17, 1, '2023-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full_name`) VALUES(1, 'admin', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
