-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 05, 2021 at 09:53 AM
-- Server version: 5.7.33
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teamcode_db_result`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `post` varchar(1000) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcement_id`, `title`, `post`, `date_post`) VALUES
(1, 'School Resumption', 'School will be resume on the 4th of January 2021', '2020-12-24 15:35:49'),
(4, 'Welcome Back', 'Welcoming messages from the staff', '2020-12-24 21:10:09'),
(7, 'Happy BirthdayðŸŽ‚ðŸŽ‚', 'I wish you a happy Birthday dearðŸŽ‚ðŸ˜ðŸ’™', '2020-12-27 11:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `regno` varchar(50) NOT NULL,
  `student` varchar(100) NOT NULL,
  `ccode` varchar(20) NOT NULL,
  `ctitle` varchar(100) NOT NULL,
  `cunit` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `score` varchar(50) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `pointt` varchar(20) NOT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `regno`, `student`, `ccode`, `ctitle`, `cunit`, `level`, `semester`, `score`, `grade`, `pointt`, `date_uploaded`) VALUES
(76, 'Regno', 'studentName', 'Ccode', 'Ctitle', 'Cunit', 'Level', 'Semester', 'Score', 'Grade', 'Point', '2021-02-03 09:21:05'),
(77, '15/8073', 'Muhammad Ahmad', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '55', 'C', '8.25', '2021-02-03 09:21:05'),
(78, '16/12050', 'Adam Musa Yau', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '60', 'BC', '9', '2021-02-03 09:21:05'),
(79, '15/8075', 'Fatima Idris', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(80, '15/8076', 'Usman Ibrahim', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(81, '15/8077', 'Sadiq Abubakar', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '50', 'CD', '7.5', '2021-02-03 09:21:05'),
(82, '15/8078', 'Zakariyau Yahaya', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '65', 'BC', '9.75', '2021-02-03 09:21:05'),
(83, '15/12050', 'Idris Abbah', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '65', 'BC', '9.75', '2021-02-03 09:21:05'),
(84, '15/8075', 'Fatima Idris', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '50', 'CD', '7.5', '2021-02-03 09:21:05'),
(85, '15/8076', 'Usman Ibrahim', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(86, '15/8077', 'Sadiq Abubakar', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(87, '15/8078', 'Zakariyau Yahaya', 'COM_412', 'Computer Programming(Java)', '3', '400', 'FIRST SEMESTER', '60', 'BC', '9', '2021-02-03 09:21:05'),
(88, '15/8073', 'Muhammad Ahmad', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '55', 'C', '8.25', '2021-02-03 09:21:05'),
(89, '15/8075', 'Fatima Idris', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '55', 'C', '8.25', '2021-02-03 09:21:05'),
(90, '15/8076', 'Usman Ibrahim', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '60', 'BC', '9', '2021-02-03 09:21:05'),
(91, '15/8077', 'Sadiq Abubakar', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(92, '15/8078', 'Zakariyau Yahaya', 'COM_413', 'Project Management', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(93, '15/8073', 'Muhammad Ahmad', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '50', 'CD', '7.5', '2021-02-03 09:21:05'),
(94, '16/12050', 'Adam Musa Yau', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '65', 'BC', '9.75', '2021-02-03 09:21:05'),
(95, '15/8076', 'Usman Ibrahim', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '65', 'BC', '9.75', '2021-02-03 09:21:05'),
(96, '15/8077', 'Sadiq Abubakar', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '50', 'CD', '7.5', '2021-02-03 09:21:05'),
(97, '15/8078', 'Zakariyau Yahaya', 'COM_414', 'Compiler Construction', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(98, '15/8073', 'Muhammad Ahmad', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(99, '16/12050', 'Adam Musa Yau', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '60', 'BC', '9', '2021-02-03 09:21:05'),
(100, '15/8075', 'Fatima Idris', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '55', 'C', '8.25', '2021-02-03 09:21:05'),
(101, '15/8077', 'Sadiq Abubakar', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(102, '15/8078', 'Zakariyau Yahaya', 'COM_415', 'Data Communication and Networks', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(103, '15/8073', 'Muhammad Ahmad', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '50', 'CD', '7.5', '2021-02-03 09:21:05'),
(104, '16/12050', 'Adam Musa Yau', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '65', 'BC', '9.75', '2021-02-03 09:21:05'),
(105, '15/8075', 'Fatima Idris', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(106, '15/8076', 'Usman Ibrahim', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(107, '15/8078', 'Zakariyau Yahaya', 'COM_416', 'Multimedia', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(108, '15/8073', 'Muhammad Ahmad', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(109, '16/12050', 'Adam Musa Yau', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(110, '15/8075', 'Fatima Idris', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05'),
(111, '15/8076', 'Usman Ibrahim', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '70', 'AB', '10.5', '2021-02-03 09:21:05'),
(112, '15/8077', 'Sadiq Abubakar', 'STA_411', 'Operation Research II', '3', '400', 'FIRST SEMESTER', '75', 'A', '12', '2021-02-03 09:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `Student_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `Student_name`, `gender`, `phone`, `email`, `regno`, `level`, `semester`, `password`, `picture`, `created_at`, `updated_at`) VALUES
(109, 'Mahmood Rabui Abubakar', '', '', '', '16/12054', 'HND-II', 'First Semester', '16/12054', '', NULL, NULL),
(111, 'Adam Musa Yau', '', '', '', '16/12050', 'HND-II', 'First Semester', '16/12050', '', NULL, NULL),
(112, 'Sani Abdullahi', '', '', '', '16/12051', 'HND-II', 'First Semester', '16/12051', '', NULL, NULL),
(113, 'Yasir Murtala', '', '', '', '16/12052', 'HND-II', 'First Semester', '16/12052', '', NULL, NULL),
(114, 'Shehu Isa Musa', '', '', '', '16/12053', 'HND-II', 'First Semester', '16/12053', '', NULL, NULL),
(123, 'Adam Musa Yau', '', '', '', '16/12050', '400', 'First Semester', '16/12050', '', NULL, NULL),
(124, 'Sani Abdullahi', '', '', '', '16/12051', '400', 'First Semester', '16/12051', '', NULL, NULL),
(125, 'Sadeeq Umar', '', '', '', '15/8077', 'HND-II', 'First Semester', '15/8077', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adam Musa Yau', 'result', '0000-00-00 00:00:00', '12345', 'adamcynaira', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
