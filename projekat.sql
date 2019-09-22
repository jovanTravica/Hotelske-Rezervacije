-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2019 at 04:01 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekat`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `menadzerID` int(11) NOT NULL,
  `slika` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `naziv`, `adresa`, `telefon`, `opis`, `menadzerID`, `slika`) VALUES
(2, 'Hotel Tulip', 'negde bb', '+38155988742', 'Jedan od najluksuznijih I najopremljenijih hotela u ovom lancu.', 2, 'C:\\Users\\jocas\\Desktop\\slikaHotel.jpg'),
(3, 'Hotel Royal Tulip', 'negde drugde', '+48 99855314', 'Najveci, najluksuzniji i najopremljeniji hotel ovog lanca, koji i nosi ime samog lanca.', 4, 'C:\\Users\\jocas\\Desktop\\hotel.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `korisnickoIme` varchar(255) NOT NULL,
  `lozinka` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `poeni` float NOT NULL,
  `tipKorisnika` enum('Klijent','Menadzer','Administrator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `korisnickoIme`, `lozinka`, `email`, `telefon`, `poeni`, `tipKorisnika`) VALUES
(1, 'Jovan', 'jovan123', 'jovan@royaltulip.com', '0629714966', 0, 'Administrator'),
(2, 'Will Smith', 'manager', 'will@royaltulip.com', '+90 88266971', 0, 'Menadzer'),
(4, 'Jon van Dyke', 'pedja123', 'jvd@royaltulip.com', '+90 88511697', 0, 'Menadzer'),
(8, 'Donovan', '123', 'donovan@gmail.com', '0631119234', 1020, 'Klijent');

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `id` int(11) NOT NULL,
  `idSobe` int(11) NOT NULL,
  `cenaRezervacije` float NOT NULL,
  `poeni` float NOT NULL,
  `datumDolaska` varchar(100) NOT NULL,
  `datumOdlaska` varchar(100) NOT NULL,
  `nazivHotela` varchar(255) NOT NULL,
  `status` enum('Rezervisano','Stigao','Otisao') NOT NULL,
  `idKorisnika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`id`, `idSobe`, `cenaRezervacije`, `poeni`, `datumDolaska`, `datumOdlaska`, `nazivHotela`, `status`, `idKorisnika`) VALUES
(23, 4, 15000, 1020, '12.05.2019', '15.05.2019', 'Hotel Tulip', 'Rezervisano', 8);

-- --------------------------------------------------------

--
-- Table structure for table `soba`
--

CREATE TABLE `soba` (
  `id` int(11) NOT NULL,
  `idHotela` int(11) NOT NULL,
  `tipSobe` int(11) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `brojSoba` int(11) NOT NULL,
  `brojSlobodnihSoba` int(11) NOT NULL,
  `cena` float NOT NULL,
  `slika` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soba`
--

INSERT INTO `soba` (`id`, `idHotela`, `tipSobe`, `opis`, `brojSoba`, `brojSlobodnihSoba`, `cena`, `slika`) VALUES
(4, 2, 1, 'Jednokrevetna soba sa bracnim krevetom.', 8, 4, 5000, 'C:\\Users\\jocas\\Desktop\\soba.jpg'),
(5, 2, 1, 'Dvokrevetna soba, 2 bracna kreveta', 10, 5, 7000, 'C:\\Users\\jocas\\Desktop\\soba4 (1).jpg'),
(6, 3, 1, 'Luksuzna soba sa bracnim krevetom', 10, 8, 100000, 'C:\\Users\\jocas\\Desktop\\soba4 (2).jpg'),
(7, 3, 1, 'Jednokrevetna soba sa pogledom na stazu', 10, 4, 6000, 'C:\\Users\\jocas\\Desktop\\soba2 (1).jpg'),
(8, 3, 2, 'Dvokrevetna soba.', 10, 7, 9000, 'C:\\Users\\jocas\\Desktop\\soba2 (2).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tipsobe`
--

CREATE TABLE `tipsobe` (
  `id` int(11) NOT NULL,
  `vrsta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipsobe`
--

INSERT INTO `tipsobe` (`id`, `vrsta`) VALUES
(1, 'Jednokrevetna'),
(2, 'Dvokrevetna'),
(3, 'Trokrevetna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menadzerID` (`menadzerID`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idKorisnika` (`idKorisnika`),
  ADD KEY `idSobe` (`idSobe`);

--
-- Indexes for table `soba`
--
ALTER TABLE `soba`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idHotela` (`idHotela`),
  ADD KEY `tipSobe` (`tipSobe`);

--
-- Indexes for table `tipsobe`
--
ALTER TABLE `tipsobe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `soba`
--
ALTER TABLE `soba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`menadzerID`) REFERENCES `korisnik` (`id`);

--
-- Constraints for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_2` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnik` (`id`),
  ADD CONSTRAINT `rezervacija_ibfk_3` FOREIGN KEY (`idSobe`) REFERENCES `soba` (`id`);

--
-- Constraints for table `soba`
--
ALTER TABLE `soba`
  ADD CONSTRAINT `soba_ibfk_1` FOREIGN KEY (`idHotela`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `soba_ibfk_2` FOREIGN KEY (`tipSobe`) REFERENCES `tipsobe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
