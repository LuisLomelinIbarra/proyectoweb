-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 01:18 AM
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

--
-- Dumping data for table `adoptedpets`
--

INSERT INTO `adoptedpets` (`id_adoptor`, `id_pet`, `adoptionDate`) VALUES
(22, 8, '2021-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `petinfo`
--

CREATE TABLE `petinfo` (
  `pet_id` bigint(20) NOT NULL,
  `pet_posterid` bigint(20) NOT NULL,
  `pet_name` varchar(300) NOT NULL,
  `pet_age` int(11) NOT NULL,
  `pet_type` varchar(2000) NOT NULL,
  `pet_breed` varchar(2000) NOT NULL,
  `isVaccinated` tinyint(1) NOT NULL DEFAULT 0,
  `compatibility` varchar(512) NOT NULL,
  `pet_gender` varchar(50) NOT NULL,
  `pet_isAdopted` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `pet_color` varchar(200) NOT NULL,
  `pet_story` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petinfo`
--

INSERT INTO `petinfo` (`pet_id`, `pet_posterid`, `pet_name`, `pet_age`, `pet_type`, `pet_breed`, `isVaccinated`, `compatibility`, `pet_gender`, `pet_isAdopted`, `deleted`, `pet_color`, `pet_story`) VALUES
(8, 13, 'Katt', 2, 'Cat', 'Mixed', 1, 'Good with other cats', 'Female', 0, 0, 'Brown', 'A sad story'),
(9, 22, 'Fido', 100, 'Dog', 'Pan', 0, 'Mata todo', 'Male', 0, 0, 'Orange', 'Mato a todos');

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

--
-- Dumping data for table `photopet`
--

INSERT INTO `photopet` (`id`, `pet_id`, `pet_photoname`, `pet_dir`) VALUES
(0, 8, 'photo', 'E:/xampp/htdocs/proyectoweb/photos/user/Luigi/cat2.jpg'),
(0, 9, 'photo', 'E:/xampp/htdocs/proyectoweb/photos/user/andy/pet3.jpg');

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
(9, 16, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/ernesto/0077810.jpg'),
(11, 21, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/juan/bird.png'),
(12, 22, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/andy/cat.png');

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
(16, 'Ernesto', 21, '253462156', 'ern@email.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'ernesto', 0),
(21, 'Juanito', 30, '1742047210', 'juan@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', 'juan', 0),
(22, 'Andres', 21, '73281742189', 'andy@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', 'andy', 0);

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
  MODIFY `pet_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `photosuser`
--
ALTER TABLE `photosuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
