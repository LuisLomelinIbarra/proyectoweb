-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-11-2021 a las 05:40:07
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dawdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptedpets`
--

CREATE TABLE `adoptedpets` (
  `id_adoptor` bigint(20) NOT NULL,
  `id_pet` bigint(11) NOT NULL,
  `adoptionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `petinfo`
--

CREATE TABLE `petinfo` (
  `pet_id` bigint(20) NOT NULL,
  `pet_posterid` bigint(20) NOT NULL,
  `pet_name` varchar(30) NOT NULL,
  `pet_age` int(11) NOT NULL,
  `pet_type` varchar(10) NOT NULL,
  `pet_breed` varchar(30) NOT NULL,
  `pet_color` varchar(10) NOT NULL,
  `pet_story` varchar(200) NOT NULL,
  `isVaccinated` tinyint(1) NOT NULL DEFAULT 0,
  `compatibility` varchar(200) NOT NULL,
  `pet_gender` varchar(10) NOT NULL,
  `pet_isAdopted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `petinfo`
--

INSERT INTO `petinfo` (`pet_id`, `pet_posterid`, `pet_name`, `pet_age`, `pet_type`, `pet_breed`, `pet_color`, `pet_story`, `isVaccinated`, `compatibility`, `pet_gender`, `pet_isAdopted`, `deleted`) VALUES
(1, 16, 'Baltto', 1, 'Dog', 'Husky', 'Brown', 'A total disaster', 1, 'Kids and other dogs and cats', 'Male', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `photopet`
--

CREATE TABLE `photopet` (
  `id` bigint(11) NOT NULL,
  `pet_id` bigint(11) NOT NULL,
  `pet_photoname` varchar(4000) NOT NULL,
  `pet_dir` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `photosuser`
--

CREATE TABLE `photosuser` (
  `id` bigint(20) NOT NULL,
  `usr_id` bigint(20) NOT NULL,
  `usr_photoname` varchar(4000) NOT NULL,
  `usr_dir` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `photosuser`
--

INSERT INTO `photosuser` (`id`, `usr_id`, `usr_photoname`, `usr_dir`) VALUES
(7, 13, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/Luigi/0144084.jpg'),
(8, 14, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/pinf/0144084.jpg'),
(9, 16, 'profpic', 'E:/xampp/htdocs/proyectoweb/photos/user/ernesto/0077810.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userinfo`
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
-- Volcado de datos para la tabla `userinfo`
--

INSERT INTO `userinfo` (`usr_id`, `usr_name`, `usr_age`, `usr_phone`, `usr_email`, `usr_passcode`, `usr_desc`, `usr_username`, `deleted`) VALUES
(13, 'Luis Fernando Lomelín Ibarra', 21, '2313213124', 'luigi@email.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'Luigi', 0),
(14, 'Pedro Infante', 80, '923198321', 'pinf@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', 'pinf', 0),
(15, 'Alicia Rodriguez', 21, '35513233', 'arod@gmail.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'arod', 0),
(16, 'Ernesto', 21, '5531423581', 'er@outlook.com', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', '', 'ernesto', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adoptedpets`
--
ALTER TABLE `adoptedpets`
  ADD PRIMARY KEY (`id_adoptor`,`id_pet`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indices de la tabla `petinfo`
--
ALTER TABLE `petinfo`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `pet_posterid` (`pet_posterid`);

--
-- Indices de la tabla `photopet`
--
ALTER TABLE `photopet`
  ADD KEY `pet_id` (`pet_id`);

--
-- Indices de la tabla `photosuser`
--
ALTER TABLE `photosuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indices de la tabla `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `petinfo`
--
ALTER TABLE `petinfo`
  MODIFY `pet_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `photosuser`
--
ALTER TABLE `photosuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adoptedpets`
--
ALTER TABLE `adoptedpets`
  ADD CONSTRAINT `adoptedpets_ibfk_1` FOREIGN KEY (`id_adoptor`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adoptedpets_ibfk_2` FOREIGN KEY (`id_pet`) REFERENCES `petinfo` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `petinfo`
--
ALTER TABLE `petinfo`
  ADD CONSTRAINT `petinfo_ibfk_1` FOREIGN KEY (`pet_posterid`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `photopet`
--
ALTER TABLE `photopet`
  ADD CONSTRAINT `photopet_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `petinfo` (`pet_id`);

--
-- Filtros para la tabla `photosuser`
--
ALTER TABLE `photosuser`
  ADD CONSTRAINT `photosuser_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `userinfo` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
