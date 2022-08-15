-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2022 at 01:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid` int(3) NOT NULL,
  `bid_price` int(15) NOT NULL,
  `_time` datetime DEFAULT NULL,
  `mid` int(3) NOT NULL,
  `item_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid`, `bid_price`, `_time`, `mid`, `item_id`) VALUES
(1, 40000, '2022-07-30 19:30:00', 2, 1),
(2, 50000, '2022-07-31 20:30:00', 1, 2),
(3, 65000, '2022-08-01 17:00:00', 1, 5),
(4, 70000, '2022-08-02 18:00:00', 1, 4),
(5, 60000, '2022-08-03 10:00:00', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `mid` int(3) NOT NULL,
  `shipping_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`mid`, `shipping_address`) VALUES
(1, 'Garia'),
(2, 'Belgharia');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(3) NOT NULL,
  `c_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `c_name`) VALUES
(1, 'Mobile Device'),
(2, 'Two Wheeler Vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `tid` int(3) NOT NULL,
  `rating` float NOT NULL,
  `_comment` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`tid`, `rating`, `_comment`) VALUES
(1, 4.5, 'Good quality'),
(2, 4.3, 'Left mirror is slightly broken'),
(3, 4.7, 'Completely fine'),
(4, 4.4, 'Good'),
(5, 4.2, 'Horn sound is low');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(3) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `starting_bid_price` int(15) NOT NULL,
  `bidding_increment` int(15) NOT NULL,
  `buyer_mid` int(3) NOT NULL,
  `seller_mid` int(3) NOT NULL,
  `cat_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `title`, `description`, `start_date`, `end_date`, `starting_bid_price`, `bidding_increment`, `buyer_mid`, `seller_mid`, `cat_id`) VALUES
(1, 'Samsung Galaxy S10', 'Android Device', '2022-07-30', '2022-08-15', 30000, 10000, 2, 4, 1),
(2, 'Hero Maestro', 'Scooty', '2022-07-31', '2022-08-15', 42000, 8000, 1, 3, 2),
(3, 'TVS Apache RTR', 'Bike', '2022-08-01', '2022-08-15', 53000, 7000, 2, 4, 2),
(4, 'Hero Vikrant', 'Bike', '2022-08-02', '2022-08-15', 61000, 9000, 1, 3, 2),
(5, 'iPhone XI', 'iOS Device', '2022-08-03', '2022-08-15', 55000, 10000, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mid` int(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone_num` int(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `pass_word` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mid`, `name`, `address`, `phone_num`, `email`, `pass_word`) VALUES
(1, 'Shirsendu Mali', 'Garia', 1678614444, 'sm5@gmail.com', 'kol7tr'),
(2, 'Mitali Saha', 'Belgharia', 2147483647, 'ms9@gmail.com', '158fth'),
(3, 'Avishek Mitra', 'Ajmer', 2147483647, 'am8@gmail.com', 'jjad568'),
(4, 'Aditi Bhattacharjee', 'Chennai', 1111559754, 'ab2@gmail.com', '78kr78');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `mid` int(3) NOT NULL,
  `bank_account_num` int(15) NOT NULL,
  `routing_num` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`mid`, `bank_account_num`, `routing_num`) VALUES
(3, 2147483647, 12345),
(4, 2147483647, 56789);

-- --------------------------------------------------------

--
-- Table structure for table `_transaction`
--

CREATE TABLE `_transaction` (
  `tid` int(3) NOT NULL,
  `amount` int(15) NOT NULL,
  `_time` datetime DEFAULT NULL,
  `item_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `_transaction`
--

INSERT INTO `_transaction` (`tid`, `amount`, `_time`, `item_id`) VALUES
(1, 40000, '2022-08-15 19:45:00', 1),
(2, 50000, '2022-08-15 20:45:00', 2),
(3, 65000, '2022-08-15 17:15:00', 5),
(4, 70000, '2022-08-15 18:15:00', 4),
(5, 60000, '2022-08-15 10:15:00', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bids_ibfk_1` (`mid`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `items_ibfk_1` (`buyer_mid`),
  ADD KEY `items_ibfk_2` (`seller_mid`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `_transaction`
--
ALTER TABLE `_transaction`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `item_id` (`item_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `_transaction` (`tid`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`buyer_mid`) REFERENCES `member` (`mid`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`seller_mid`) REFERENCES `member` (`mid`),
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`);

--
-- Constraints for table `_transaction`
--
ALTER TABLE `_transaction`
  ADD CONSTRAINT `_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
