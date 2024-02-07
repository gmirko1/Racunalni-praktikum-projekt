-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2024 at 08:37 AM
-- Server version: 8.0.29
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storetake`
--

-- --------------------------------------------------------

--
-- Table structure for table `djelatnik`
--

DROP TABLE IF EXISTS `djelatnik`;
CREATE TABLE IF NOT EXISTS `djelatnik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(15) COLLATE utf8mb4_croatian_ci NOT NULL,
  `Prezime` varchar(20) COLLATE utf8mb4_croatian_ci NOT NULL,
  `ID_Razina` int NOT NULL,
  `Odobren` tinyint(1) NOT NULL,
  `Lozinka` varchar(20) COLLATE utf8mb4_croatian_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_croatian_ci NOT NULL,
  `datum_prijave` date DEFAULT NULL,
  `datum_isteka` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_razina` (`ID_Razina`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `djelatnik`
--

INSERT INTO `djelatnik` (`id`, `Ime`, `Prezime`, `ID_Razina`, `Odobren`, `Lozinka`, `email`, `datum_prijave`, `datum_isteka`) VALUES
(1, 'Marko', 'Markovic', 1, 1, 'marko123', 'mmarkovic@gmail.com', '2024-01-01', '2025-01-01'),
(6, 'Darko', 'Darko', 1, 0, '123darko', 'darko@gmail.com', NULL, NULL),
(7, 'Darko', 'Darko', 1, 0, '123darko', 'darko@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
CREATE TABLE IF NOT EXISTS `kategorija` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `naziv`) VALUES
(1, 'Potrošni materijal');

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
CREATE TABLE IF NOT EXISTS `predmet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(30) COLLATE utf8mb4_croatian_ci NOT NULL,
  `Sifra` varchar(20) COLLATE utf8mb4_croatian_ci NOT NULL,
  `Jedinica_mjere` varchar(20) COLLATE utf8mb4_croatian_ci NOT NULL,
  `Kolicina` float NOT NULL,
  `ID_kategorija` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kategorija` (`ID_kategorija`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id`, `Naziv`, `Sifra`, `Jedinica_mjere`, `Kolicina`, `ID_kategorija`) VALUES
(1, 'Kabel', '123456', 'Duljina (metar)', 5, 1),
(2, 'Uže', '654321', 'Duljina (metar)', 10, 1),
(39, 'Matica', '45004', 'Komadi', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `razina_prijave`
--

DROP TABLE IF EXISTS `razina_prijave`;
CREATE TABLE IF NOT EXISTS `razina_prijave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(20) COLLATE utf8mb4_croatian_ci NOT NULL,
  `Opis` text COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `razina_prijave`
--

INSERT INTO `razina_prijave` (`id`, `Naziv`, `Opis`) VALUES
(1, 'Djelatnik', 'Djelatnik se prvi put mora registrirati kroz registracijsku formu, a tek nakon što ga administrator odobri može se prijaviti u aplikaciju i koristiti sve funkcionalnosti te razine prijave.\r\n\r\nDjelatnik (može ih biti više) je osoba koja unosi i ažurira stanje na skladištu. Može pretraživati skladište i vidjeti popis svega što to skladište posjeduje; Prikaz dostupnosti materijala i koliko ih ima na \"stanju.\"'),
(2, 'Admin', 'Administrator može raditi sve kao i djelatnik: unositi i ažurirati stanje na skladištu, Može pretraživati skladište i vidjeti popis svega što to skladište posjeduje.\r\n\r\nDodatno ima prava da doda novog djelatnika i da deaktivira postojećeg. Administrator vidi popis svih korisnika i odobrava nove djelatnike.\r\n'),
(3, 'Korisnik', 'Korisnik ima najmanje prava od svih djelatnika. \r\n\r\nNE MOŽE mijenjati stanje u skladištu, dodavat nove predmete, ažurirat stanje u skaldištu.\r\n\r\nMOŽE jedino pregledavati stanje i predmete u skaldištu, pretraživati skaldište i pregledavati datum spremanja ili uzimanja pojedinog predmeta ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `djelatnik`
--
ALTER TABLE `djelatnik`
  ADD CONSTRAINT `id_razina` FOREIGN KEY (`ID_Razina`) REFERENCES `razina_prijave` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `predmet`
--
ALTER TABLE `predmet`
  ADD CONSTRAINT `id_kategorija` FOREIGN KEY (`ID_kategorija`) REFERENCES `kategorija` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
