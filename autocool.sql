-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8111
-- Generation Time: Apr 27, 2023 at 01:23 PM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autocool`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonne`
--

CREATE TABLE `abonne` (
  `NUMABONNE` bigint NOT NULL,
  `CODEFORMULE` varchar(32) NOT NULL,
  `NOM` varchar(32) DEFAULT NULL,
  `PRENOM` varchar(32) DEFAULT NULL,
  `DATENAISSANCE` date DEFAULT NULL,
  `RUE` varchar(32) DEFAULT NULL,
  `VILLE` varchar(32) DEFAULT NULL,
  `CODEPOSTAL` varchar(32) DEFAULT NULL,
  `TEL` varchar(32) DEFAULT NULL,
  `TELMOBILE` varchar(32) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PAIEMENTADHESION` tinyint(1) DEFAULT NULL,
  `PAIEMENTCAUTION` tinyint(1) DEFAULT NULL,
  `RIBFOURNI` tinyint(1) DEFAULT NULL,
  `IDENTIFIANT` varchar(32) DEFAULT NULL,
  `MDP` varchar(150) DEFAULT NULL,
  `NUMPERMIS` varchar(32) DEFAULT NULL,
  `LIEUPERMIS` varchar(32) DEFAULT NULL,
  `DATEPERMIS` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_vehicule`
--

CREATE TABLE `categorie_vehicule` (
  `CODECATEG` varchar(32) NOT NULL,
  `LIBELLECATEG` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie_vehicule`
--

INSERT INTO `categorie_vehicule` (`CODECATEG`, `LIBELLECATEG`) VALUES
('L', 'L'),
('M', 'M'),
('S', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(150) NOT NULL,
  `statut` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `login`, `mdp`, `statut`) VALUES
(1, 'savillepatenaude@teleworm.us', '098f6bcd4621d373cade4e832627b4f6', 'secrétaire'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `formule`
--

CREATE TABLE `formule` (
  `CODEFORMULE` varchar(32) NOT NULL,
  `LIBELLEFORMULE` varchar(32) DEFAULT NULL,
  `FRAISADHESION` decimal(10,2) DEFAULT NULL,
  `TARIFMENSUEL` decimal(10,2) DEFAULT NULL,
  `PARTSOCIALE` decimal(10,2) DEFAULT NULL,
  `DEPOTGARANTIE` decimal(10,2) DEFAULT NULL,
  `CAUTION` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `CODEVILLE` bigint NOT NULL,
  `CODELIEU` bigint NOT NULL,
  `NOMLIEU` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`CODEVILLE`, `CODELIEU`, `NOMLIEU`) VALUES
(1, 12, 'Porte de Bourgogne'),
(1, 15, 'Barrière du Médoc'),
(2, 12, 'Aéroport'),
(3, 36, 'Cantinolle');

-- --------------------------------------------------------

--
-- Table structure for table `tarif1`
--

CREATE TABLE `tarif1` (
  `CODEFORMULE` varchar(32) NOT NULL,
  `CODETRANCHEH` varchar(32) NOT NULL,
  `CODECATEG` varchar(32) NOT NULL,
  `TARIFH` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tarif2`
--

CREATE TABLE `tarif2` (
  `CODEFORMULE` varchar(32) NOT NULL,
  `CODETRANCHEKM` varchar(32) NOT NULL,
  `CODECATEG` varchar(32) NOT NULL,
  `TARIFKM` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tranche_horaire`
--

CREATE TABLE `tranche_horaire` (
  `CODETRANCHEH` varchar(32) NOT NULL,
  `DUREE` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tranche_km`
--

CREATE TABLE `tranche_km` (
  `CODETRANCHEKM` varchar(32) NOT NULL,
  `MINKM` bigint DEFAULT NULL,
  `MAXKM` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type_vehicule`
--

CREATE TABLE `type_vehicule` (
  `CODETYPE` varchar(32) NOT NULL,
  `CODECATEG` varchar(32) NOT NULL,
  `LIBELLETYPE` varchar(32) DEFAULT NULL,
  `NBPLACES` bigint DEFAULT NULL,
  `AUTOMATIQUE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_vehicule`
--

INSERT INTO `type_vehicule` (`CODETYPE`, `CODECATEG`, `LIBELLETYPE`, `NBPLACES`, `AUTOMATIQUE`) VALUES
('break', 'L', 'Break', 7, 0),
('city', 'S', 'Citadine', 4, 0),
('poly', 'M', 'Polyvalente', 5, 0),
('util', 'L', 'Utilitaire', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `NUMVEHICULE` varchar(32) NOT NULL,
  `CODELIEU` bigint NOT NULL,
  `CODETYPE` varchar(32) NOT NULL,
  `CODEVILLE` bigint NOT NULL,
  `KILOMETRAGE` bigint DEFAULT NULL,
  `NIVEAUESSENCE` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`NUMVEHICULE`, `CODELIEU`, `CODETYPE`, `CODEVILLE`, `KILOMETRAGE`, `NIVEAUESSENCE`) VALUES
('fdjs', 15, 'break', 1, 125, 50),
('vds', 12, 'city', 2, 552, 12),
('vkkk', 12, 'city', 1, 152, 10);

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

CREATE TABLE `ville` (
  `CODEVILLE` bigint NOT NULL,
  `NOMVILLE` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ville`
--

INSERT INTO `ville` (`CODEVILLE`, `NOMVILLE`) VALUES
(1, 'Bordeaux'),
(2, 'Mérignac'),
(3, 'Eysine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`NUMABONNE`),
  ADD KEY `I_FK_ABONNE_FORMULE` (`CODEFORMULE`);

--
-- Indexes for table `categorie_vehicule`
--
ALTER TABLE `categorie_vehicule`
  ADD PRIMARY KEY (`CODECATEG`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formule`
--
ALTER TABLE `formule`
  ADD PRIMARY KEY (`CODEFORMULE`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`CODEVILLE`,`CODELIEU`),
  ADD KEY `I_FK_STATION_VILLE` (`CODEVILLE`);

--
-- Indexes for table `tarif1`
--
ALTER TABLE `tarif1`
  ADD PRIMARY KEY (`CODEFORMULE`,`CODETRANCHEH`,`CODECATEG`),
  ADD KEY `I_FK_TARIF1_FORMULE` (`CODEFORMULE`),
  ADD KEY `I_FK_TARIF1_TRANCHE_HORAIRE` (`CODETRANCHEH`),
  ADD KEY `I_FK_TARIF1_CATEGORIE_VEHICULE` (`CODECATEG`);

--
-- Indexes for table `tarif2`
--
ALTER TABLE `tarif2`
  ADD PRIMARY KEY (`CODEFORMULE`,`CODETRANCHEKM`,`CODECATEG`),
  ADD KEY `I_FK_TARIF2_FORMULE` (`CODEFORMULE`),
  ADD KEY `I_FK_TARIF2_TRANCHE_KM` (`CODETRANCHEKM`),
  ADD KEY `I_FK_TARIF2_CATEGORIE_VEHICULE` (`CODECATEG`);

--
-- Indexes for table `tranche_horaire`
--
ALTER TABLE `tranche_horaire`
  ADD PRIMARY KEY (`CODETRANCHEH`);

--
-- Indexes for table `tranche_km`
--
ALTER TABLE `tranche_km`
  ADD PRIMARY KEY (`CODETRANCHEKM`);

--
-- Indexes for table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  ADD PRIMARY KEY (`CODETYPE`),
  ADD KEY `I_FK_TYPE_VEHICULE_CATEGORIE_VEHICULE` (`CODECATEG`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`NUMVEHICULE`),
  ADD KEY `I_FK_VEHICULE_STATION` (`CODEVILLE`,`CODELIEU`),
  ADD KEY `I_FK_VEHICULE_TYPE_VEHICULE` (`CODETYPE`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`CODEVILLE`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonne`
--
ALTER TABLE `abonne`
  ADD CONSTRAINT `abonne_ibfk_1` FOREIGN KEY (`CODEFORMULE`) REFERENCES `formule` (`CODEFORMULE`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`CODEVILLE`) REFERENCES `ville` (`CODEVILLE`);

--
-- Constraints for table `tarif1`
--
ALTER TABLE `tarif1`
  ADD CONSTRAINT `tarif1_ibfk_1` FOREIGN KEY (`CODEFORMULE`) REFERENCES `formule` (`CODEFORMULE`),
  ADD CONSTRAINT `tarif1_ibfk_2` FOREIGN KEY (`CODETRANCHEH`) REFERENCES `tranche_horaire` (`CODETRANCHEH`),
  ADD CONSTRAINT `tarif1_ibfk_3` FOREIGN KEY (`CODECATEG`) REFERENCES `categorie_vehicule` (`CODECATEG`);

--
-- Constraints for table `tarif2`
--
ALTER TABLE `tarif2`
  ADD CONSTRAINT `tarif2_ibfk_1` FOREIGN KEY (`CODEFORMULE`) REFERENCES `formule` (`CODEFORMULE`),
  ADD CONSTRAINT `tarif2_ibfk_2` FOREIGN KEY (`CODETRANCHEKM`) REFERENCES `tranche_km` (`CODETRANCHEKM`),
  ADD CONSTRAINT `tarif2_ibfk_3` FOREIGN KEY (`CODECATEG`) REFERENCES `categorie_vehicule` (`CODECATEG`);

--
-- Constraints for table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  ADD CONSTRAINT `type_vehicule_ibfk_1` FOREIGN KEY (`CODECATEG`) REFERENCES `categorie_vehicule` (`CODECATEG`);

--
-- Constraints for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`CODEVILLE`,`CODELIEU`) REFERENCES `station` (`CODEVILLE`, `CODELIEU`),
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`CODETYPE`) REFERENCES `type_vehicule` (`CODETYPE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
