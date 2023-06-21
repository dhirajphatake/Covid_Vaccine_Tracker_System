-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 06:10 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaccinated_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `individual_list`
--

CREATE TABLE `individual_list` (
  `id` int(30) NOT NULL,
  `tracking_code` varchar(50) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Partially Vaccinated, 2= Fully Vaccinated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual_list`
--

INSERT INTO `individual_list` (`id`, `tracking_code`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `address`, `status`, `date_created`, `date_updated`) VALUES
(1, '133632365921974', 'Vishal', 'Balasaheb', 'Japkar', 'Male', '2001-06-23', '9876543210', 'Nepti, Ahmednagar', 2, '2021-10-18 16:00:22', '2022-05-01 17:50:28'),
(6, '574418553965891', 'Rushikesh', 'Bhaskar', 'Bhingare', 'Male', '2001-06-12', '8788888888', 'Manori, Rahiri', 1, '2022-05-01 17:54:33', NULL),
(7, '923968548117211', 'Dhiraj', 'Dnyandeo', 'Phatake', 'Male', '2001-05-18', '9370058101', 'Kharwandi, Newasa', 1, '2022-05-01 23:16:38', NULL),
(8, '866076023825650', 'Gaurav', 'Sandip', 'Pund', 'Male', '2001-09-27', '7741984318', 'Nandgaon', 2, '2022-05-03 16:15:30', '2022-05-03 16:16:25'),
(9, '943302770310376', 'Abhishek', 'Vishnu', 'Gaywale', 'Male', '2002-04-04', '9000000000', 'Kharwandi, Newasa', 2, '2022-05-08 12:50:21', '2022-05-08 12:51:21'),
(10, '300449403994070', 'Suraj', 'Milind', 'Salve', 'Male', '2001-07-21', '7020811114', 'Fula saundar Mala - Burudgaon Road, Ahmednagar', 1, '2022-05-09 13:45:34', NULL),
(11, '553908705829886', 'Rama', 'Lahanu', 'Rupnar ', 'Male', '2001-07-25', '9834696164', 'Ahmednagar', 1, '2022-05-14 15:43:34', NULL),
(12, '427511653735076', 'mayuresh', 'prakash', 'ghodke', 'Male', '2001-10-30', '7559201990', 'vambori', 1, '2022-05-16 12:36:22', NULL),
(13, '066559195599176', 'Haridas', 'Vishnu', 'Gohdake', 'Male', '2001-06-08', '9876543210', 'At Ghospuri', 1, '2022-05-28 15:50:12', '2022-05-28 15:53:08'),
(14, '419658401479170', 'Anish', 'Dnyandeo', 'Phatake', 'Male', '2004-01-05', '9000000000', 'Kharwandi, Newasa', 2, '2022-06-03 23:09:02', NULL),
(15, '299448672507951', 'Darshan', 'Ashok', 'Phatake', 'Male', '2006-11-25', '9000000000', 'A/p Kharwandi ', 1, '2022-06-13 14:20:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Centralize Vaccination Tracker System - PHP'),
(6, 'short_name', 'CVTS - PHP'),
(11, 'logo', 'uploads/logo-1634524879.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1634524906.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `location_id` int(30) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `location_id`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, NULL, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(3, 'Rushikesh', 'Bhingare', 'rushikeshbhingare', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatar-3.png?v=1634528899', NULL, 2, 1, '2021-10-18 11:38:39', '2022-05-01 23:27:54'),
(4, 'vishal', 'japkar', 'vishaljapkar', '660cf8e6bd7b73e4be7109fc5b944361', 'uploads/avatar-4.png?v=1634529434', NULL, 2, 3, '2021-10-18 11:57:14', '2022-05-01 23:29:35'),
(6, 'Dhiraj', 'Phatake', 'dhirajphatake', '528b79150520dd919b54ac43fc8cab9c', NULL, NULL, 2, 1, '2022-05-01 23:28:41', '2022-05-01 23:30:27'),
(7, 'Abhishek', 'Gaywale', 'abhi', '0192023a7bbd73250516f069df18b500', NULL, NULL, 2, 7, '2022-05-08 12:47:21', '2022-05-08 12:47:40'),
(8, 'Gaurav', 'Pund', '65545645--/*dsfkjsfufsda', '5048b270818f5522c67db0070da60d69', NULL, NULL, 2, NULL, '2022-05-09 10:12:41', NULL),
(9, 'Suraj', 'Salve', 'Suraj', '0192023a7bbd73250516f069df18b500', NULL, NULL, 2, 1, '2022-05-09 13:43:39', NULL),
(10, 'Rama', 'Rupnar', 'rama', '0192023a7bbd73250516f069df18b500', NULL, NULL, 2, 8, '2022-05-14 15:46:00', NULL),
(11, 'Anish', 'Phatake', 'anishphatake', '0192023a7bbd73250516f069df18b500', NULL, NULL, 2, 2, '2022-06-03 23:11:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_location_list`
--

CREATE TABLE `vaccination_location_list` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccination_location_list`
--

INSERT INTO `vaccination_location_list` (`id`, `location`, `status`, `date_created`) VALUES
(1, 'Manori-Rahuri', 1, '2021-10-18 11:16:32'),
(2, 'Kharwandi-Newasa', 1, '2021-10-18 11:20:21'),
(3, 'Nepti-Ahmednagar', 1, '2021-10-18 11:20:42'),
(4, 'Gutewadi-Shrigonda', 1, '2021-10-18 11:21:06'),
(6, 'Nandgaon-Rahuri', 1, '2022-05-03 16:17:11'),
(7, 'Bhenda', 1, '2022-05-08 12:46:11'),
(8, 'Ahmednagar', 1, '2022-05-09 14:06:04'),
(9, 'Parner - Kohokadi', 1, '2022-05-14 15:50:50'),
(10, 'Kharwandi', 1, '2022-06-03 23:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_history_list`
--

CREATE TABLE `vaccine_history_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `individual_id` int(30) NOT NULL,
  `vaccine_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `vaccination_type` varchar(50) NOT NULL,
  `vaccinated_by` text NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_history_list`
--

INSERT INTO `vaccine_history_list` (`id`, `user_id`, `individual_id`, `vaccine_id`, `location_id`, `vaccination_type`, `vaccinated_by`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 1, 4, '1st Dose', 'Dr. Juan Batumbakal', 'Sample Only', '2021-10-18 16:00:22', '2021-10-18 16:07:49'),
(9, 1, 6, 2, 1, '1st Dose', 'Rahuri Doctors', 'Take 1 tab of paracitmol', '2022-05-01 17:54:33', NULL),
(10, 1, 7, 7, 3, '1st Dose', 'Newasa Doctor', '1st Dose', '2022-05-01 23:16:38', NULL),
(12, 1, 9, 8, 7, '1st Dose', 'Abhishek', 'dose 1', '2022-05-08 12:50:21', NULL),
(13, 1, 10, 7, 3, '1st Dose', 'Suraj', '1st Dose', '2022-05-09 13:45:34', NULL),
(14, 1, 11, 8, 8, '1st Dose', 'Rama', '1st Dose', '2022-05-14 15:43:34', NULL),
(15, 1, 12, 8, 8, '1st Dose', 'kishor', '1st dose', '2022-05-16 12:36:22', NULL),
(16, 1, 13, 7, 7, '1st Dose', 'Abhi', '1st dose', '2022-05-28 15:50:12', '2022-05-28 15:52:29'),
(17, 1, 14, 8, 2, '2nd Dose', 'Dhiraj', '2nd dose', '2022-06-03 23:09:02', NULL),
(18, 1, 15, 12, 2, '1st Dose', 'Phatake Dr.', '1st dose', '2022-06-13 14:20:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_list`
--

CREATE TABLE `vaccine_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_list`
--

INSERT INTO `vaccine_list` (`id`, `name`, `status`, `date_created`) VALUES
(1, 'Pfizer-BioNTech', 1, '2021-10-18 11:05:20'),
(2, 'Moderna', 1, '2021-10-18 11:05:24'),
(3, 'Johnson & Johnson’s Janssen', 1, '2021-10-18 11:05:30'),
(4, 'AstraZeneca', 1, '2021-10-18 11:07:42'),
(7, 'Covaxin', 1, '2022-05-01 23:14:41'),
(8, 'Covishield', 1, '2022-05-01 23:14:54'),
(9, 'Sputnik - V', 1, '2022-05-01 23:35:08'),
(12, 'Booster', 1, '2022-06-10 10:17:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `individual_list`
--
ALTER TABLE `individual_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `individual_id` (`individual_id`);

--
-- Indexes for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `individual_list`
--
ALTER TABLE `individual_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD CONSTRAINT `vaccine_history_list_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `vaccination_location_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vaccine_history_list_ibfk_7` FOREIGN KEY (`individual_id`) REFERENCES `individual_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
