-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2019 at 05:08 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `la_traviata`
--

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE `story` (
  `text` varchar(1000) COLLATE utf8_bin NOT NULL,
  `options` varchar(1000) COLLATE utf8_bin NOT NULL,
  `gives` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `story`
--

INSERT INTO `story` (`text`, `options`, `gives`, `id`, `question_id`) VALUES
('\"#name and Alfredo talk about their love. Alfredo confesses he loves her a lot.  Later, at the party - Alfredo prosposes a toast and talks about his love about #name. Even later, #name and Alfredo talk in private.\"', '[\"4 Accept him\",\"5 Reject him\"]', '', 20, 1),
('\"#name is standing on a balcony... Alfredo is coming to talk to her.\"', '[\"1 Talk to him\",\"2 Ignore him\"]', '', 21, 0),
('\"Later that evening, Alfredo proposes a toast in front of the party guests. He talks about his love for #name.\"', '[\"4 Accept him\",\"6 Reject him\"]', '', 22, 2),
('\"Alfredo leaves and commits suicide. #name is devastated and dies from stress. The other day #name wakes up in the house. Alfredo\'s father pays a visit - he cries to her about his son, but doesn\'t blame her. #name is devastated and dies of depression... Game Over.\"', '[\"0 Replay\"]', '', 23, 6),
('\"Alfredo leaves. #name wakes up in the house. Doctor Grenvil pays a visit. He gives #name a bottle of pills that will help with the sickness. Next day, Alfredo comes back and confesses his love once again. #name starts hurting...\"', '[\"10 Fall in his arms\",\"11 Use pills\",\"99 Do nothing\"]', '', 24, 5),
('\"You died. Game Over.\"', '[\"0 Try again\"]', '', 25, 99),
('\"#name and Alfredo wake up in the house. #name leaves for a short moment. While #name is out, Doctor Grenvil pays Alfredo a visit but doesn\'t give him the pills #name needs because of his jealousy. Later that night, #name collapses and dies.\"', '[\"0 Game Over. Try again.\"]', '', 26, 4),
('\"#name falls in his arms and dies.\"', '[\"0 Game Over. Try again.\"]', '', 27, 10),
('\"#name takes a pill from the pill bottle. #name feels immediately better and they live a happy life ever after.\"', '[\"0 Game Over. Try again.\"]', '', 28, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `story`
--
ALTER TABLE `story`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `story`
--
ALTER TABLE `story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
