-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 04:37 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegetable_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `farmer_product`
--

CREATE TABLE `farmer_product` (
  `Pid` int(5) NOT NULL,
  `Uid` int(5) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Quantity` int(5) NOT NULL,
  `Quality` varchar(10) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Desired_Price` int(10) NOT NULL,
  `is_sold` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_product`
--

INSERT INTO `farmer_product` (`Pid`, `Uid`, `Type`, `Quantity`, `Quality`, `Description`, `Desired_Price`, `is_sold`) VALUES
(2, 1, 'seed', 200, 'a medium q', 'gfuygvjhjguyghygjhgbjh', 500, 1),
(4, 1, 'Cereals', 100, 'suoer', 'erree', 500, 0),
(5, 1, 'Pulses ', 100, 'good', 'ser', 600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `IID` int(5) NOT NULL,
  `Uid` int(5) NOT NULL,
  `Type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`IID`, `Uid`, `Type`) VALUES
(1, 2, 'Cereals');

-- --------------------------------------------------------

--
-- Table structure for table `retailer_purchase`
--

CREATE TABLE `retailer_purchase` (
  `Sid` int(5) NOT NULL,
  `Pid` int(5) NOT NULL,
  `Seller_id` int(5) NOT NULL,
  `Buyer_id` int(5) NOT NULL,
  `Qunatity` int(10) NOT NULL,
  `Cost_Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailer_purchase`
--

INSERT INTO `retailer_purchase` (`Sid`, `Pid`, `Seller_id`, `Buyer_id`, `Qunatity`, `Cost_Price`) VALUES
(1, 2, 2, 3, 100, 500);

-- --------------------------------------------------------

--
-- Table structure for table `retailer_request`
--

CREATE TABLE `retailer_request` (
  `Pid` int(11) NOT NULL,
  `Offered_Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `Tid` int(5) NOT NULL,
  `WSID` int(5) NOT NULL,
  `RSID` int(5) NOT NULL,
  `Cost` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Uid` int(5) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `City` varchar(10) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone_Number` int(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Uid`, `Username`, `City`, `Role`, `Address`, `Phone_Number`, `Password`) VALUES
(1, 'abc', 'sur', 'farmer', 'aksjdfhadsjfhalskdjh', 1234567890, 'abc'),
(2, 'def', 'ahm', 'wholesaler', 'kjhwlajhslkasjhdlfkjahfkdsljfh', 987654321, 'def'),
(3, 'ghi', 'nad', 'retailer', 'aldskfj;dlkjg;aljkdg;lakjsd;flk', 1237894560, 'ghi');

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler_purchase`
--

CREATE TABLE `wholesaler_purchase` (
  `Sid` int(5) NOT NULL,
  `Pid` int(5) NOT NULL,
  `Seller_id` int(5) NOT NULL,
  `Buyer_id` int(5) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Cost_Price` int(10) NOT NULL,
  `Sell_Price` int(10) NOT NULL,
  `is_sold` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wholesaler_purchase`
--

INSERT INTO `wholesaler_purchase` (`Sid`, `Pid`, `Seller_id`, `Buyer_id`, `Quantity`, `Cost_Price`, `Sell_Price`, `is_sold`) VALUES
(1, 2, 1, 2, 100, 400, 500, 0),
(2, 2, 1, 2, 100, 300, 500, 1),
(4, 5, 1, 2, 100, 600, 700, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler_request`
--

CREATE TABLE `wholesaler_request` (
  `Pid` int(11) NOT NULL,
  `Offered_Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `wid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `farmer_product`
--
ALTER TABLE `farmer_product`
  ADD PRIMARY KEY (`Pid`),
  ADD KEY `pr` (`Uid`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`IID`),
  ADD KEY `USerid` (`Uid`);

--
-- Indexes for table `retailer_purchase`
--
ALTER TABLE `retailer_purchase`
  ADD PRIMARY KEY (`Sid`),
  ADD KEY `wproduct` (`Pid`),
  ADD KEY `wseller` (`Seller_id`),
  ADD KEY `wbuyer` (`Buyer_id`);

--
-- Indexes for table `retailer_request`
--
ALTER TABLE `retailer_request`
  ADD KEY `rid` (`rid`),
  ADD KEY `piid` (`Pid`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`Tid`),
  ADD KEY `Whtrans` (`WSID`),
  ADD KEY `Retrans` (`RSID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Uid`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`);

--
-- Indexes for table `wholesaler_purchase`
--
ALTER TABLE `wholesaler_purchase`
  ADD PRIMARY KEY (`Sid`),
  ADD KEY `pu` (`Pid`),
  ADD KEY `sellerid` (`Seller_id`),
  ADD KEY `buyerid` (`Buyer_id`);

--
-- Indexes for table `wholesaler_request`
--
ALTER TABLE `wholesaler_request`
  ADD KEY `wid` (`wid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `farmer_product`
--
ALTER TABLE `farmer_product`
  MODIFY `Pid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `IID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `retailer_purchase`
--
ALTER TABLE `retailer_purchase`
  MODIFY `Sid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `Tid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Uid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wholesaler_purchase`
--
ALTER TABLE `wholesaler_purchase`
  MODIFY `Sid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `farmer_product`
--
ALTER TABLE `farmer_product`
  ADD CONSTRAINT `pr` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interest`
--
ALTER TABLE `interest`
  ADD CONSTRAINT `USerid` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_purchase`
--
ALTER TABLE `retailer_purchase`
  ADD CONSTRAINT `wbuyer` FOREIGN KEY (`Buyer_id`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wproduct` FOREIGN KEY (`Pid`) REFERENCES `farmer_product` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wseller` FOREIGN KEY (`Seller_id`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_request`
--
ALTER TABLE `retailer_request`
  ADD CONSTRAINT `piid` FOREIGN KEY (`Pid`) REFERENCES `farmer_product` (`Pid`),
  ADD CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `user` (`Uid`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `Retrans` FOREIGN KEY (`RSID`) REFERENCES `retailer_purchase` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Whtrans` FOREIGN KEY (`WSID`) REFERENCES `wholesaler_purchase` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wholesaler_purchase`
--
ALTER TABLE `wholesaler_purchase`
  ADD CONSTRAINT `buyerid` FOREIGN KEY (`Buyer_id`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pu` FOREIGN KEY (`Pid`) REFERENCES `farmer_product` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sellerid` FOREIGN KEY (`Seller_id`) REFERENCES `user` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wholesaler_request`
--
ALTER TABLE `wholesaler_request`
  ADD CONSTRAINT `wid` FOREIGN KEY (`wid`) REFERENCES `user` (`Uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
