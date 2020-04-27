-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 avr. 2020 à 00:21
-- Version du serveur :  5.5.24-log
-- Version de PHP : 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `breif4`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `IDCONSULTATION` int(11) NOT NULL,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`IDCONSULTATION`, `DATE`) VALUES
(1, '2020-04-27'),
(2, '2020-04-22'),
(3, '2020-04-21');

//Update
update consultation set DATE = '2019-2-21' where IDCONSULTATION = 4;

//Delete
delete FROM consultation where IDCONSULTATION = 4;

-- --------------------------------------------------------

--
-- Structure de la table `est_prescrit`
--

CREATE TABLE `est_prescrit` (
  `CODE` int(11) NOT NULL,
  `IDCONSULTATION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `MATRICULE` int(11) NOT NULL,
  `IDCONSULTATION` int(11) NOT NULL,
  `MEDECINNAME` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`MATRICULE`, `IDCONSULTATION`, `MEDECINNAME`) VALUES
(1, 1, 'berada'),
(3, 3, 'Yasser');

update medecin set medecinName = 'Yasser' where IDCONSULTATION = 3;

delete FROM medecin where IDCONSULTATION = 2;



-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `CODE` int(11) NOT NULL,
  `LIBELLE` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`CODE`, `LIBELLE`) VALUES
(1, 'doliprane'),
(2, 'Aspro');

update medicament set libelle = 'doliprane' where CODE= 1;

delete FROM medicament  where CODE= 3;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `NUMEROSS` int(11) NOT NULL,
  `IDCONSULTATION` int(11) NOT NULL,
  `PATIENTNOM` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`NUMEROSS`, `IDCONSULTATION`, `PATIENTNOM`) VALUES
(20, 2, 'Boufaa'),
(22, 3, 'Ghouas');

update patient set patientName = 'Boufaa' where IDCONSULTATION = 2;

delete FROM patient  where IDCONSULTATION = 1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`IDCONSULTATION`);

--
-- Index pour la table `est_prescrit`
--
ALTER TABLE `est_prescrit`
  ADD PRIMARY KEY (`CODE`,`IDCONSULTATION`),
  ADD KEY `FK_EST_PRESCRIT2` (`IDCONSULTATION`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`MATRICULE`),
  ADD KEY `FK_DONNE` (`IDCONSULTATION`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`CODE`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`NUMEROSS`),
  ADD KEY `FK_ASSISTE` (`IDCONSULTATION`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `est_prescrit`
--
ALTER TABLE `est_prescrit`
  ADD CONSTRAINT `FK_EST_PRESCRIT2` FOREIGN KEY (`IDCONSULTATION`) REFERENCES `consultation` (`IDCONSULTATION`),
  ADD CONSTRAINT `FK_EST_PRESCRIT` FOREIGN KEY (`CODE`) REFERENCES `medicament` (`CODE`);

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `FK_DONNE` FOREIGN KEY (`IDCONSULTATION`) REFERENCES `consultation` (`IDCONSULTATION`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FK_ASSISTE` FOREIGN KEY (`IDCONSULTATION`) REFERENCES `consultation` (`IDCONSULTATION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
