-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 01:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carserv`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `special_request` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `service_name` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_id`, `service_id`, `booking_date`, `special_request`, `created_at`, `service_name`) VALUES
(1, 2, NULL, '2024-11-16', '', '2024-11-07 06:48:19', 'Oil Change'),
(2, 3, NULL, '2024-12-06', '', '2024-11-07 08:22:33', 'Tire Replacement'),
(3, 4, NULL, '2024-11-24', '', '2024-11-07 08:24:03', 'Tire Replacement'),
(4, 5, NULL, '2024-11-29', '', '2024-11-07 08:24:52', 'Other'),
(5, 6, NULL, '2024-11-15', '', '2024-11-12 16:02:08', 'Oil Change'),
(6, 7, NULL, '2024-12-11', '', '2024-12-19 09:03:44', 'Oil Change'),
(7, 9, NULL, '2024-12-13', 't69', '2024-12-23 11:31:07', 'Oil Change'),
(8, 10, NULL, '2005-06-02', 'tire ', '2025-01-16 06:01:02', 'Oil Change');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `created_at`) VALUES
(2, 'jeet', 'upadhyayjeet75@gmail.com', NULL, '2024-11-07 06:48:19'),
(3, 'ewewewe', 'upadhyayjeet99@gmail.com', NULL, '2024-11-07 08:22:32'),
(4, 'BOOST  BOT', 'upadhyayjeet95@gmail.com', NULL, '2024-11-07 08:24:03'),
(5, 'CAR CARE HUB', 'upadhyayjeet33@gmail.com', NULL, '2024-11-07 08:24:52'),
(6, 'rtetre', 'upadhyayjeet-569@gmail.com', NULL, '2024-11-12 16:02:06'),
(7, 'bhjjbjkbjkbjkb', 'upadhyayjeet885@gmail.com', NULL, '2024-12-19 09:03:41'),
(9, 'ASSISTANT ', 'upadhyayjeet696969@gmail.com', NULL, '2024-12-23 11:31:06'),
(10, 'Jeet Upadhyay', 'upadhyayjeet55@gmail.com', NULL, '2025-01-16 06:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `description`, `price`) VALUES
(1, 'Oil Change', 'Complete oil and filter change', 29.99),
(2, 'Tire Replacement', 'High-quality tire replacement service', 89.99),
(3, 'Diagnostic Test', 'Full vehicle diagnostics', 49.99);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
