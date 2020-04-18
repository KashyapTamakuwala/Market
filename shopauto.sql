-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2020 at 02:47 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopauto`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `bill_detail_id` int(11) NOT NULL,
  `customer_name` varchar(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `date` date NOT NULL,
  `MRP` int(11) NOT NULL,
  `total price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `bill_detail_id`, `customer_name`, `product_id`, `quantity`, `date`, `MRP`, `total price`) VALUES
(3, 1, 'tanuj', 6, 1, '2020-03-03', 200, 200),
(4, 1, 'tanuj', 8, 2, '2020-03-03', 78, 156),
(5, 2, 'tvd', 8, 2, '2020-03-03', 78, 156),
(6, 2, 'tvd', 6, 2, '2020-03-03', 200, 400),
(7, 3, 'karan shah', 8, 2, '2020-03-04', 78, 156);

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

CREATE TABLE `bill_details` (
  `bill_detail_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ammount` int(10) NOT NULL,
  `customer_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details`
--

INSERT INTO `bill_details` (`bill_detail_id`, `date`, `ammount`, `customer_name`) VALUES
(1, '2020-03-03', 356, 'tanuj'),
(2, '2020-03-03', 556, 'tvd'),
(3, '2020-03-04', 156, 'karan shah');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_brand` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_brand`, `date`, `quantity`) VALUES
(6, 'Sonny Headphones', 200, 'ddemo', '2020-03-26', 997),
(8, 'BCL TV', 78, 'k;', '2020-03-25', 14),
(11, 'bkbk', 45, 'demo', '2000-02-03', 2),
(12, 'lib', 66, 'jvh', '2000-03-04', 22),
(13, 'jnj', 6, 'bkh', '2000-03-03', 3),
(14, 'bdi', 6, 'hbh', '2000-02-02', 3),
(15, 'jnj', 6, 'bkh', '2000-03-03', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stockhistory`
--

CREATE TABLE `stockhistory` (
  `stock_id` int(11) NOT NULL,
  `product_name` varchar(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_brand` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockhistory`
--

INSERT INTO `stockhistory` (`stock_id`, `product_name`, `product_price`, `product_brand`, `date`, `quantity`) VALUES
(1, 'jnj', 6, 'bkh', '2000-03-03', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `uname`, `email`, `password`) VALUES
(1, 'tanujdoshi', 'tanuj@gmail.com', 'tanuj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `bill_detail_id` (`bill_detail_id`);

--
-- Indexes for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`bill_detail_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `stockhistory`
--
ALTER TABLE `stockhistory`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stockhistory`
--
ALTER TABLE `stockhistory`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`bill_detail_id`) REFERENCES `bill_details` (`bill_detail_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
