-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 10:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_email` varchar(20) NOT NULL,
  `Admin_Name` varchar(20) NOT NULL,
  `Position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_email`, `Admin_Name`, `Position`) VALUES
('dilshan@gmail.com', 'Dilshan', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `cus_address`
--

CREATE TABLE `cus_address` (
  `email` varchar(20) NOT NULL,
  `House_No` varchar(10) NOT NULL,
  `Lane` varchar(20) NOT NULL,
  `Sub_city` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `District` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cus_address`
--

INSERT INTO `cus_address` (`email`, `House_No`, `Lane`, `Sub_city`, `City`, `District`) VALUES
('amuja@gmail.com', '126', '2nd street', 'kothalawala', 'Malbe', 'Colombo'),
('chamika@gmail.com', '125', '1st street', 'kothalawala', 'Malbe', 'Colombo'),
('chamqika@gmail.com', '78', 'oruwala rd', 'Athurugiriya', 'Athurugiriya', 'Colombo'),
('daham@gmail.com', '456', 'kurunagala road', 'kurunagala', 'kurunagala', 'kurunagala'),
('himansa@gmail.com', '128', '4th street', 'kothalawala', 'Malbe', 'Colombo'),
('kamalg@gmail.com', '98', 'pore', 'Athurugiriya', 'Athurugiriya', 'Colombo'),
('navindu@gmail.com', '140', 'gell', 'fokem', 'Athurugiriya', 'galle'),
('pradeep@gmail.com', '129', '6th street', 'kothalawala', 'Malbe', 'Colombo'),
('sayumi@gmail.com', '127', '3rd street', 'kothalawala', 'Malbe', 'Colombo');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `email` varchar(50) NOT NULL,
  `Vehicle_num` varchar(20) NOT NULL,
  `Vehicle_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`email`, `Vehicle_num`, `Vehicle_type`) VALUES
('gamage@gmail.com', 'DF8563', 'Bike'),
('sandun@gmail.com', 'FGH45869', 'car'),
('sayumi@gmail.com', 'RD2654', 'car');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `Food_Id` int(10) NOT NULL,
  `Food_Name` varchar(20) NOT NULL,
  `Price` int(5) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`Food_Id`, `Food_Name`, `Price`, `Description`) VALUES
(1001, 'Rice', 800, 'abc'),
(1002, 'Kottu', 1000, 'xyz'),
(1003, 'Biriyani', 1200, 'pqr'),
(1004, 'hoppers', 50, 'lmn'),
(1005, 'pizza', 2999, 'dfg');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_Id` int(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Restaurent_Id` int(10) NOT NULL,
  `Food_Id` int(10) NOT NULL,
  `Confirmation` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_Id`, `Email`, `Restaurent_Id`, `Food_Id`, `Confirmation`) VALUES
(5001, 'himansa@gmail.com', 100, 1001, ''),
(5002, 'chamika@gmail.com', 102, 1003, ''),
(5003, 'kamalg@gmail.com', 103, 1004, ''),
(5004, 'daham@gmail.com', 102, 1002, 'yes'),
(5006, 'chamqika@gmail.com', 101, 1004, '');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Pay_Id` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Card_Number` int(20) NOT NULL,
  `Price` int(5) NOT NULL,
  `Summary` varchar(100) NOT NULL,
  `Payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Pay_Id`, `Email`, `Card_Number`, `Price`, `Summary`, `Payment_date`) VALUES
('10001', 'himansa@gmail.com', 254865489, 800, 'order1', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `plase_order`
--

CREATE TABLE `plase_order` (
  `Driver_email` varchar(20) NOT NULL,
  `Order_Id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plase_order`
--

INSERT INTO `plase_order` (`Driver_email`, `Order_Id`) VALUES
('kavishka@gmail.com', '5004');

-- --------------------------------------------------------

--
-- Table structure for table `restaurent`
--

CREATE TABLE `restaurent` (
  `Restaurent_Id` int(10) NOT NULL,
  `Restaurent_Name` varchar(20) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurent`
--

INSERT INTO `restaurent` (`Restaurent_Id`, `Restaurent_Name`, `Location`) VALUES
(100, 'KFC', 'Malabe'),
(101, 'Dominos', 'Athurugiriya'),
(102, 'Burger King', 'KAduwela'),
(103, 'Avanya', 'Borella'),
(104, 'Master chef', 'Gampaha');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(50) NOT NULL,
  `customer_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`first_name`, `last_name`, `mobile`, `email`, `birthday`, `password`, `customer_type`) VALUES
('Chamika', 'Dilshan', '0758998456', 'chamika@gmail.com', '2006-02-15', 'Chamika123', 'Admin'),
('Chamika', 'Dilshan', '0703966227', 'chamqika@gmail.com', '2019-06-20', 'Dila123', 'Customer'),
('Daham', 'manarathna', '0456897542', 'daham@gmail.com', '2004-12-15', 'Daham123', 'Customer'),
('Danuka', 'perera', '0752365458', 'danuka@gmail.com', '1999-10-14', 'Danuka123', 'Customer'),
('Himansa', 'kumari', '0745895641', 'himansa@gmail.com', '2023-10-04', 'Himansa123', 'Customer'),
('Kamal', 'Gunarathna', '0703568459', 'kamalg@gmail.com', '1994-06-15', 'Kamal123', 'Customer'),
('Navindu', 'Perera', '0703965847', 'navindu@gmail.com', '2001-06-13', 'Navindu123', 'Customer'),
('Sandun', 'Maduranga', '0758965458', 'sandun@gmail.com', '1997-10-14', 'Sandun123', 'Driver');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_email`);

--
-- Indexes for table `cus_address`
--
ALTER TABLE `cus_address`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`Food_Id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `fk_order_user` (`Email`),
  ADD KEY `fk_order_restaurent` (`Restaurent_Id`),
  ADD KEY `fk_order_Food` (`Food_Id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `fk_payment_user` (`Email`);

--
-- Indexes for table `restaurent`
--
ALTER TABLE `restaurent`
  ADD PRIMARY KEY (`Restaurent_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_Food` FOREIGN KEY (`Food_Id`) REFERENCES `food_items` (`Food_Id`),
  ADD CONSTRAINT `fk_order_restaurent` FOREIGN KEY (`Restaurent_Id`) REFERENCES `restaurent` (`Restaurent_Id`),
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`Email`) REFERENCES `user` (`email`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_user` FOREIGN KEY (`Email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
