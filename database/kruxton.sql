-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 06:49 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kruxton`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Chinese', 'Chinese Items'),
(2, 'Mexican', 'Mexican Items'),
(3, 'Pizza', 'Pizza Items'),
(4, 'Indian', 'Indian items'),
(5, 'Sandwiches', 'Sandwiches Types'),
(6, ' Japanese', ' Japanese Items'),
(9, 'Thai', 'Thai Items');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`) VALUES
(1, '278998154978', 904, 1000, 1001, '2023-02-03 19:17:03'),
(2, '091428583362', 1343, 0, 1005, '2023-02-03 19:17:34'),
(3, '543076159999', 1622, 0, 1004, '2023-02-03 19:17:56'),
(4, '967470759448', 742, 1000, 1003, '2023-02-03 19:20:26'),
(5, '300535882264', 1354, 1400, 1006, '2023-02-03 20:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`) VALUES
(1, 1, 8, 1, 452, 452),
(2, 1, 7, 1, 452, 452),
(3, 2, 3, 1, 520, 520),
(4, 2, 6, 1, 443, 443),
(5, 2, 10, 1, 80, 80),
(6, 2, 1, 1, 300, 300),
(7, 3, 2, 1, 352, 352),
(8, 3, 1, 1, 300, 300),
(9, 3, 3, 1, 520, 520),
(10, 3, 4, 1, 450, 450),
(11, 4, 9, 1, 50, 50),
(12, 4, 8, 1, 452, 452),
(13, 4, 10, 3, 80, 240),
(14, 5, 4, 1, 450, 450),
(15, 5, 8, 2, 452, 904);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Unavailable,1=Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`) VALUES
(1, 1, 'Chow Mein', 'Chow mein is a Chinese dish made from stir-fried noodles with vegetables and sometimes meat', 300, 1),
(2, 1, 'Hot Pot', 'a communal meal that involves a pot filled with broth constantly simmered by a heat source underneath', 352, 1),
(3, 1, 'Kung Pao Chicken', 'Kung Pao chicken, also transcribed Gong Bao or Kung Po, is a spicy, stir-fried Chinese dish made with cubes of chicken, peanuts, vegetables, and chili peppers.', 520, 1),
(4, 1, 'Ma Po Tofu', 'Mapo tofu is a popular Chinese dish from Sichuan province. ', 450, 1),
(5, 6, 'Tofu', 'The Japanese eat it alone, as if it were meat or cheese. Another popular way of eating tofu is to serve it fried.', 452, 1),
(6, 6, 'Tempura', 'A simple and traditional tempura batter is typically made of ice water, flour, and egg yolks.', 443, 1),
(7, 6, 'Yakitori', 'This type is usually served with a sweet tare sauce, and depending on the region, it can also come with raw egg yolk for dipping.', 452, 1),
(8, 4, 'Pakora', 'Pakoras are made by coating ingredients, usually vegetables, in a spiced batter, then deep frying them. ', 452, 1),
(9, 4, 'Vada Pav', 'Vada pav, alternatively spelt wada pao, is a vegetarian fast food dish native to the Indian state of Maharashtra. ', 50, 1),
(10, 4, 'Paratha', 'Paratha is a flatbread native to South Asia, prevalent throughout the modern-day nations of India, Sri Lanka, Pakistan, Nepal, Bangladesh, Maldives, Afghanistan, Myanmar, Malaysia, Singapore, Mauritius, Fiji, Guyana, Suriname, and Trinidad and Tobago where wheat is the traditional staple.', 80, 1),
(11, 9, 'Pad Thai', 'Pad thai, phat thai, or phad thai, is a stir-fried rice noodle dish commonly served as a street food in Thailand as part of the countrys cuisine.', 452, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Kruxton Bristo By Mayuri K', 'mayuri.infospace@gmail.com', '9000000000', '', '&lt;p&gt;Kruxton Bristo By Mayuri K&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(3, 'Mayuri K.', 'mayuri.infospace@gmail.com', 'cd92a26534dba48cd785cdcc0b3e6bd1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
