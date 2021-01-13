-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Gen 13, 2021 alle 14:46
-- Versione del server: 5.7.24
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `booking_start_date` date NOT NULL,
  `booking_end_date` date NOT NULL,
  `room_number` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `booking_nights` int(11) NOT NULL,
  `booking_price` float(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `bookings`
--

INSERT INTO `bookings` (`booking_id`, `booking_start_date`, `booking_end_date`, `room_number`, `guest_id`, `booking_nights`, `booking_price`) VALUES
(1, '2021-01-13', '2021-01-16', 2, 1, 3, 135.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `ospiti`
--

CREATE TABLE `ospiti` (
  `guest_id` int(11) NOT NULL,
  `guest_firstname` varchar(45) NOT NULL,
  `guest_lastname` varchar(45) NOT NULL,
  `guest_birth` date NOT NULL,
  `guest_address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ospiti`
--

INSERT INTO `ospiti` (`guest_id`, `guest_firstname`, `guest_lastname`, `guest_birth`, `guest_address`) VALUES
(1, 'Alessandro', 'Ferraro', '1992-08-27', 'Torino');

-- --------------------------------------------------------

--
-- Struttura della tabella `stanze`
--

CREATE TABLE `stanze` (
  `room_number` int(11) NOT NULL,
  `room_type` varchar(25) NOT NULL,
  `room_max_occupancy` int(11) NOT NULL,
  `room_price` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `stanze`
--

INSERT INTO `stanze` (`room_number`, `room_type`, `room_max_occupancy`, `room_price`) VALUES
(1, 'double', 2, 60.00),
(2, 'single', 1, 45.00);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `bookings_fk_1` (`room_number`),
  ADD KEY `bookings_fk_2` (`guest_id`);

--
-- Indici per le tabelle `ospiti`
--
ALTER TABLE `ospiti`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indici per le tabelle `stanze`
--
ALTER TABLE `stanze`
  ADD PRIMARY KEY (`room_number`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `ospiti`
--
ALTER TABLE `ospiti`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `stanze`
--
ALTER TABLE `stanze`
  MODIFY `room_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_fk_1` FOREIGN KEY (`room_number`) REFERENCES `stanze` (`room_number`),
  ADD CONSTRAINT `bookings_fk_2` FOREIGN KEY (`guest_id`) REFERENCES `ospiti` (`guest_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
