-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2021 at 02:20 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dawdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoptedpets`
--

CREATE TABLE `adoptedpets` (
  `id_adoptor` bigint(20) NOT NULL,
  `id_pet` bigint(11) NOT NULL,
  `adoptionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petinfo`
--

CREATE TABLE `petinfo` (
  `pet_id` bigint(20) NOT NULL,
  `pet_posterid` bigint(20) NOT NULL,
  `pet_name` int(11) NOT NULL,
  `pet_age` int(11) NOT NULL,
  `pet_type` varchar(2000) NOT NULL,
  `pet_breed` varchar(2000) NOT NULL,
  `isVaccinated` tinyint(1) NOT NULL DEFAULT 0,
  `compatibility` varchar(512) NOT NULL,
  `pet_gender` int(11) NOT NULL,
  `pet_isAdopted` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photopet`
--

CREATE TABLE `photopet` (
  `id` bigint(11) NOT NULL,
  `pet_id` bigint(11) NOT NULL,
  `pet_photoname` varchar(4000) NOT NULL,
  `pet_dir` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photosuser`
--

CREATE TABLE `photosuser` (
  `id` bigint(20) NOT NULL,
  `usr_id` bigint(20) NOT NULL,
  `usr_photoname` varchar(4000) NOT NULL,
  `usr_dir` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photosuser`
--

INSERT INTO `photosuser` (`id`, `usr_id`, `usr_photoname`, `usr_dir`) VALUES
(7, 13, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/Luigi/0144084.jpg'),
(8, 14, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/pinf/0144084.jpg'),
(9, 16, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/ernesto/0077810.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `usr_id` bigint(20) NOT NULL,
  `usr_name` varchar(3000) NOT NULL,
  `usr_age` int(11) NOT NULL,
  `usr_phone` varchar(12) NOT NULL,
  `usr_email` varchar(1000) NOT NULL,
  `usr_passcode` varchar(260) NOT NULL,
  `usr_desc` longtext NOT NULL,
  `usr_username` varchar(400) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`usr_id`, `usr_name`, `usr_age`, `usr_phone`, `usr_email`, `usr_passcode`, `usr_desc`, `usr_username`, `deleted`) VALUES
(13, 'Luis Fernando Lomelín Ibarra', 21, '2313213124', 'luigi@email.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'Luigi', 0),
(14, 'Pedro Infante', 80, '923198321', 'pinf@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', 'pinf', 0),
(15, 'Alicia Rodriguez', 21, '35513233', 'arod@gmail.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'arod', 0),
(16, 'Ernesto', 21, '253462156', 'ern@email.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'ernesto', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptedpets`
--
ALTER TABLE `adoptedpets`
  ADD PRIMARY KEY (`id_adoptor`,`id_pet`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indexes for table `petinfo`
--
ALTER TABLE `petinfo`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `pet_posterid` (`pet_posterid`);

--
-- Indexes for table `photopet`
--
ALTER TABLE `photopet`
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `photosuser`
--
ALTER TABLE `photosuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petinfo`
--
ALTER TABLE `petinfo`
  MODIFY `pet_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photosuser`
--
ALTER TABLE `photosuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoptedpets`
--
ALTER TABLE `adoptedpets`
  ADD CONSTRAINT `adoptedpets_ibfk_1` FOREIGN KEY (`id_adoptor`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adoptedpets_ibfk_2` FOREIGN KEY (`id_pet`) REFERENCES `petinfo` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petinfo`
--
ALTER TABLE `petinfo`
  ADD CONSTRAINT `petinfo_ibfk_1` FOREIGN KEY (`pet_posterid`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photopet`
--
ALTER TABLE `photopet`
  ADD CONSTRAINT `photopet_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `petinfo` (`pet_id`);

--
-- Constraints for table `photosuser`
--
ALTER TABLE `photosuser`
  ADD CONSTRAINT `photosuser_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
