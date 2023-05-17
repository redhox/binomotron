-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : lun. 15 mai 2023 à 12:50
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomotron_test2`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int NOT NULL,
  `prenom` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nom` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `mail` varchar(42) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `prenom`, `nom`, `mail`) VALUES
(1, 'Morgan', 'COULM', 'morgan.coulm@isen-ouest.yncrea.fr'),
(2, 'Camille', 'ULVOAS', 'camille.ulvoas@isen-ouest.yncrea.fr'),
(3, 'Yves', 'PAUL', 'yves.paul@isen-ouest.yncrea.fr'),
(4, 'Laura', 'PERTRON', 'laura.pertron@isen-ouest.yncrea.fr'),
(5, 'Frédéric', 'BOIREAU', 'frederic.boireau@isen-ouest.yncrea.fr'),
(6, 'Guillaume', 'CARDON', 'guillaume.cardon@isen-ouest.yncrea.fr'),
(7, 'Jonathan', 'NEEDHAM', 'jonathan.needham@isen-ouest.yncrea.fr'),
(8, 'Jérémy', 'LARDIC', 'jeremy.lardic@isen-ouest.yncrea.fr'),
(9, 'Mickaël', 'RENNARD', 'mickael.rennard@isen-ouest.yncrea.fr'),
(10, 'Ibrahim', 'MOHAMMAD', 'ibrahim.mohammad@isen-ouest.yncrea.fr'),
(11, 'Andy', 'DUBIGNY', 'andy.dubigny@isen-ouest.yncrea.fr'),
(12, 'Pierre-Marie', 'GUEVEL', 'pierre-marie.guevel@isen-ouest.yncrea.fr'),
(13, 'Youenn', 'FEULVARC’H', 'youenn.feulvarc-h@isen-ouest.yncrea.fr'),
(14, 'Gwendal', 'QUENET', 'gwendal.quenet@isen-ouest.yncrea.fr'),
(15, 'Alexandre', 'CARAES', 'alexandre.caraes@isen-ouest.yncrea.fr'),
(16, 'Bastien', 'SUCHY-REINARD', 'bastien.suchy-reinard@isen-ouest.yncrea.fr');

-- --------------------------------------------------------

--
-- Structure de la table `eleve_groupe`
--

CREATE TABLE `eleve_groupe` (
  `id_eleve` int NOT NULL,
  `id_groupe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Groupes`
--

CREATE TABLE `Groupes` (
  `id_groupe` int NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Projet`
--

CREATE TABLE `Projet` (
  `id_projet` int NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet_groupe`
--

CREATE TABLE `projet_groupe` (
  `id_projet` int NOT NULL,
  `id_groupe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`);

--
-- Index pour la table `eleve_groupe`
--
ALTER TABLE `eleve_groupe`
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Index pour la table `Groupes`
--
ALTER TABLE `Groupes`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `Projet`
--
ALTER TABLE `Projet`
  ADD PRIMARY KEY (`id_projet`);

--
-- Index pour la table `projet_groupe`
--
ALTER TABLE `projet_groupe`
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `Groupes`
--
ALTER TABLE `Groupes`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Projet`
--
ALTER TABLE `Projet`
  MODIFY `id_projet` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve_groupe`
--
ALTER TABLE `eleve_groupe`
  ADD CONSTRAINT `eleve_groupe_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `eleve_groupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `Groupes` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `projet_groupe`
--
ALTER TABLE `projet_groupe`
  ADD CONSTRAINT `projet_groupe_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `Groupes` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `projet_groupe_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `Projet` (`id_projet`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
