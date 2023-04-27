-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 09:12 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `email`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com'),
(2, 'anup', 'asd', 'anupmhrzn16@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(255) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `showtime_id` int(255) NOT NULL,
  `seat_id` int(255) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `customer_id`, `showtime_id`, `seat_id`, `total_price`) VALUES
(1, 1, 1, 12, 200),
(2, 1, 1, 1, 200),
(5, 3, 1, 18, 150),
(8, 3, 1, 19, 150),
(9, 3, 1, 14, 150),
(10, 3, 2, 16, 150),
(11, 3, 1, 15, 150),
(32, 3, 1, 27, 150),
(44, 3, 2, 24, 150),
(46, 3, 2, 30, 150),
(47, 3, 2, 28, 150),
(50, 3, 2, 28, 150),
(51, 3, 2, 13, 150),
(63, 3, 1, 16, 150),
(64, 3, 1, 28, 150),
(65, 3, 1, 25, 150),
(66, 3, 1, 26, 150),
(67, 3, 1, 30, 150),
(69, 3, 1, 7, 150),
(70, 3, 1, 7, 150),
(71, 3, 1, 7, 150),
(72, 3, 1, 21, 150),
(73, 3, 1, 3, 150),
(74, 3, 1, 4, 150),
(75, 3, 2, 5, 150),
(76, 3, 2, 6, 150),
(77, 3, 2, 5, 150),
(78, 3, 2, 6, 150),
(79, 6, 4, 26, 150),
(80, 6, 4, 15, 150),
(81, 6, 4, 16, 150),
(82, 1, 5, 14, 150),
(83, 1, 5, 15, 150),
(94, 1, 5, 14, 150),
(95, 1, 5, 15, 150),
(96, 3, 2, 17, 150),
(97, 3, 2, 18, 150),
(98, 3, 2, 19, 150),
(99, 3, 4, 27, 150),
(100, 3, 4, 28, 150),
(101, 3, 4, 7, 150),
(102, 3, 4, 7, 150),
(103, 3, 4, 7, 150),
(104, 3, 4, 7, 150),
(105, 3, 8, 17, 150),
(106, 3, 6, 16, 150),
(107, 3, 6, 28, 150),
(108, 3, 8, 15, 150),
(109, 3, 7, 18, 150),
(110, 3, 5, 6, 150),
(111, 3, 7, 9, 150);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `password`) VALUES
(1, 'rima', 'awal@gmail.com', 'b18e628d262c4a205df1431c2e920d3b'),
(2, 'bijen', 'bijen12@gmail.com', NULL),
(3, 'bish', 'asjh@gmail.com', '08b0d7b5372088af3680621998b9f232'),
(6, 'preeti', 'preeti@gmail.com', 'd62fd9b4f8a8b1e41f6172e4e635cde9'),
(7, 'anup', 'jhhj@n.com', '1393d294a01b03f643902d1c6651d0fa'),
(8, 'wer', 'wetr@gh.com', 'd62fd9b4f8a8b1e41f6172e4e635cde9'),
(9, 'ws', 'sd@h.sd', '1393d294a01b03f643902d1c6651d0fa');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `cast` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  `gene` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `description`, `release_date`, `video_url`, `cast`, `duration`, `gene`, `director`, `picture`, `poster`) VALUES
(1, 'Dungeons & Dragons', 'A charming thief and a band of unlikely adventurers undertake an epic heist to retrieve a lost relic, but things go dangerously awry when they run afoul of the wrong people. Dungeons & Dragons: Honor Among Thieves brings the rich world and playful spirit ', '2023-03-23', 'https://www.youtube.com/embed/HGvv-Hhft3U', 'Chris Pine, Michelle Rodriguez, Justice Smith, Sophia Lillis', '02:14:34', 'Action, Adventure', 'Jonathan Goldstein, John Francis Daley', 'Dungeons&Dragons-picture.jpg', 'Dungeons&Dragons-poster.png'),
(2, 'Bholaa :IN 3D', 'Bholaa is an upcoming Indian Hindi-language action thriller film directed by Ajay Devgn and produced by Ajay Devgn FFilms, Reliance Entertainment, T-Series Films and Dream Warrior Pictures. It is an official remake of the 2019 Tamil film Kaithi directed b', '2023-03-30', 'https://www.youtube.com/embed/K-EMszLvRIQ', 'Ajay Devgn, Tabu', '02:24:34', ' Action, Drama, Thriller', 'Ajay Devgn', 'Bholaa-picture.jpg', 'Bholaa-poster.jpg'),
(3, 'Prema', 'Prema is an upcoming Love Story movie, directed by Govinda Singh Bhandari\r\n\r\n', '2023-03-31', 'https://www.youtube.com/embed/KezD7ga7FHs', 'Arun Chhetri, Shristi Shrestha, Subeksha Khadka', '01:57:08', 'Love Story', ' Govinda Singh Bhandari', 'Prema-picture.jpeg', 'Prasad-2-poster.jpg'),
(4, 'Nai Nabhannu La-6 ', 'Nai Nabhannu La 6 upcoming Nepali Romantic Drama movie, directed by Bikash Raj Acharya\r\n\r\n', '2023-04-14', 'https://www.youtube.com/embed/SOcT73iK8Ng', ' Aashirwad B Chhetri, Aanchal Sharma', '02:23:48', ' Drama, Love Story', 'Bikash Raj Acharya', 'Nai-Nabhannu-La-6-picture.jfif', 'Nai-Nabhannu-La-6-poster.jpg'),
(5, 'Prasad 2 ', 'Prasad 2 is an upcoming nepali Social Drama movie, directed By Sudrashan Thapa\r\n\r\n', '2023-05-07', 'https://www.youtube.com/embed/18LSFPz2Q70', 'Bipin Karki, Keki Adhikari, Arpan Thapa', '02:25:47', ' Social, Drama', 'Sudarshan Thapa', 'Prasad-2-picture.jfif', 'Prasad-2-poster.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `screen_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `floor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`screen_id`, `name`, `floor`) VALUES
(1, 'Audi A', 'floor 1'),
(2, 'Audi B', 'floor 2');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30);

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE `showtime` (
  `showtime_id` int(255) NOT NULL,
  `movie_id` int(255) NOT NULL,
  `screen_id` int(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `showtime`
--

INSERT INTO `showtime` (`showtime_id`, `movie_id`, `screen_id`, `start_time`, `end_time`) VALUES
(1, 1, 1, '08:00:00', '11:00:00'),
(2, 1, 1, '06:00:00', '09:00:00'),
(4, 2, 1, '02:00:00', '05:00:00'),
(5, 3, 1, '02:00:00', '05:00:00'),
(6, 2, 2, '05:00:00', '09:00:00'),
(7, 3, 2, '08:00:00', '11:00:00'),
(8, 2, 1, '11:00:00', '02:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tranx_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `movie_name` varchar(255) NOT NULL,
  `screen` varchar(255) NOT NULL,
  `seats` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tranx_id`, `username`, `movie_name`, `screen`, `seats`, `date`, `start_time`, `total_price`) VALUES
(1, 'bish', 'Dungeons & Dragons', 'Audi A', '21', '2023-04-05', '08:00:00', '150.0'),
(2, 'bish', 'Dungeons & Dragons', 'Audi A', '5,6', '2023-04-05', '06:00:00', '300.0'),
(3, 'preeti', 'Bholaa :IN 3D', 'Audi A', '26', '2023-04-06', '02:00:00', '150.0'),
(4, 'preeti', 'Bholaa :IN 3D', 'Audi A', '15,16', '2023-04-06', '02:00:00', '300.0'),
(5, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(6, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(7, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(8, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(9, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(10, 'rima', 'Prema', 'Audi A', '14,15', '2023-04-06', '02:00:00', '300.0'),
(11, 'bish', 'Dungeons & Dragons', 'Audi A', '17,18,19', '2023-04-09', '06:00:00', '450.0'),
(12, 'bish', 'Bholaa :IN 3D', 'Audi A', '27,28', '2023-04-15', '02:00:00', '300.0'),
(13, 'bish', 'Bholaa :IN 3D', 'Audi A', '7', '2023-04-26', '02:00:00', '150.0'),
(14, 'bish', 'Bholaa :IN 3D', 'Audi A', '17', '2023-04-26', '11:00:00', '150.0'),
(15, 'bish', 'Bholaa :IN 3D', 'Audi B', '16', '2023-04-26', '05:00:00', '150.0'),
(16, 'bish', 'Bholaa :IN 3D', 'Audi B', '28', '2023-04-26', '05:00:00', '150.0'),
(17, 'bish', 'Bholaa :IN 3D', 'Audi A', '15', '2023-04-26', '11:00:00', '150.0'),
(18, 'bish', 'Prema', 'Audi B', '18', '2023-04-26', '08:00:00', '150.0'),
(19, 'bish', 'Prema', 'Audi A', '6', '2023-04-26', '02:00:00', '150.0'),
(20, 'bish', 'Prema', 'Audi B', '9', '2023-04-26', '08:00:00', '150.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer` (`customer_id`),
  ADD KEY `fk_showtime` (`showtime_id`),
  ADD KEY `fk_seats` (`seat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`screen_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`showtime_id`),
  ADD KEY `fk_movies` (`movie_id`),
  ADD KEY `fk_screens` (`screen_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tranx_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
  MODIFY `screen_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `showtime_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tranx_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_seats` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_showtime` FOREIGN KEY (`showtime_id`) REFERENCES `showtime` (`showtime_id`);

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `fk_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_screens` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
