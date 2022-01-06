-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 06 jan. 2022 à 10:30
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`) VALUES
(2, 'Pennac', 'Daniel'),
(3, 'Zola', 'Emile'),
(6, 'Despentes', 'Virginie');

-- --------------------------------------------------------

--
-- Structure de la table `emprunte`
--

CREATE TABLE `emprunte` (
  `id` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `id_usager` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunte`
--

INSERT INTO `emprunte` (`id`, `id_livre`, `id_usager`, `date_emprunt`, `date_retour`) VALUES
(1, 1, 2, '2022-01-06', '2022-01-27'),
(2, 7, 1, '2022-01-05', '2022-01-26');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `id_auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `ISBN`, `titre`, `categorie`, `id_auteur`) VALUES
(1, '978-2070403691', 'Au bonheur des ogres', 'roman', 2),
(2, '978-2070403707', 'La fée carabine', 'roman', 2),
(3, '978-2070403684', 'La petite marchande de prose', 'roman', 2),
(4, '978-2070403004\r\n', 'Monsieur Malaussène', 'roman', 2),
(5, '978-2912632739', 'Des chrétiens et des maures', 'roman', 2),
(6, '978-2070754793', 'Aux fruits de la passion', 'roman', 2),
(7, '978-1973111863', 'La fortune des Rougon', 'roman', 3),
(8, '978-2253008873', 'L\'oeuvre', 'roman', 3),
(9, '978-2266289191', 'Germinal', 'roman', 3),
(10, '978-2253082132', 'La joie de vivre', 'roman', 3),
(11, '978-2091870793', 'Au bonheur des dames', 'roman', 3),
(12, '978-2253082217', 'La terre', 'roman', 3),
(13, '978-2070418015', 'La bête humaine', 'roman', 3),
(14, '978-2253122111', 'King Kong théorie', 'essai', 6),
(15, '978-2253087540', 'Les jolies choses', 'roman', 6);

-- --------------------------------------------------------

--
-- Structure de la table `usager`
--

CREATE TABLE `usager` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `telephone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `usager`
--

INSERT INTO `usager` (`id`, `nom`, `prenom`, `mail`, `telephone`) VALUES
(1, 'Arp', 'Guillaume', 'guillaume.arp@gmail.com', 769794241),
(2, 'Barbe', 'Céline', 'laloutrecosmique@hotmail.fr', 786168785);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunte`
--
ALTER TABLE `emprunte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_livre` (`id_livre`),
  ADD KEY `id_auteur` (`id_usager`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auteur` (`id_auteur`);

--
-- Index pour la table `usager`
--
ALTER TABLE `usager`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `emprunte`
--
ALTER TABLE `emprunte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `usager`
--
ALTER TABLE `usager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunte`
--
ALTER TABLE `emprunte`
  ADD CONSTRAINT `emprunte_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunte_ibfk_2` FOREIGN KEY (`id_usager`) REFERENCES `usager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
