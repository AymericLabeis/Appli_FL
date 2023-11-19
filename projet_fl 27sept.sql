-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 27 sep. 2023 à 13:26
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_fl`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_categories` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categories`, `nom`) VALUES
(1, 'nouveaute'),
(2, 'fruits'),
(3, 'legumes'),
(4, 'facile'),
(5, 'rapide');

-- --------------------------------------------------------

--
-- Structure de la table `fruits_legumes`
--

DROP TABLE IF EXISTS `fruits_legumes`;
CREATE TABLE IF NOT EXISTS `fruits_legumes` (
  `id_fruits_legumes` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `img` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_dispo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prix` float NOT NULL,
  `kilo_piece` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vitamines` varchar(250) NOT NULL,
  `mineraux` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `id_users` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id_fruits_legumes`),
  KEY `FK_FL_USERS` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fruits_legumes`
--

INSERT INTO `fruits_legumes` (`id_fruits_legumes`, `libelle`, `img`, `img_dispo`, `prix`, `kilo_piece`, `vitamines`, `mineraux`, `type`, `id_users`) VALUES
(1, 'Abricot', 'abricot.jpg', 'juin_aout', 3, '€/KG', 'C, E, Carotène', 'Magnésium, Potassium', 'fruit', 1),
(2, 'Ail', 'ail.jpg', 'juillet_decembre', 0, '€/KG', 'B6, C', 'Phosphore, Potassium', 'legume', 1),
(3, 'Ananas', 'ananas.jpg', 'octobre_janvier', 0, '€ la pièce', 'B3, B9, C', 'Calcium, Manganèse, Potassium', 'fruit', 1),
(4, 'Artichaud', 'artichaud.jpg', 'avril_septembre', 25.25, '€ la pièce', 'B9, C', 'Potassium, Sodium', 'legume', 1),
(5, 'Asperge', 'asperge.jpg', 'avril_juin', 0, '€/KG', 'B9, C', '-', 'legume', 1),
(6, 'Aubergine', 'aubergine.jpg', 'juin_septembre', 0, '€/KG', 'B9, C', 'Potassium, Sodium', 'legume', 1),
(7, 'Avocat', 'avocat.jpg', 'septembre_avril', 0, '€ la pièce', 'B9, C', 'Phosphore, Potassium', 'fruit', 1),
(8, 'Banane', 'banane.jpg', 'janvier_decembre', 0, '€/KG', 'B9, C', 'Magnésium, Potassium', 'fruit', 1),
(9, 'Betterave', 'betterave.jpg', 'octobre_mars', 0, '€/KG', 'B9, C', 'Phosphore, Potassium', 'legume', 1),
(10, 'Blette', 'blette.jpg', 'juin_novembre', 0, '€/KG', 'B9, C', 'Potassium, Sodium', 'legume', 1),
(11, 'Brocolis', 'brocolis.jpg', 'septembre_avril', 0, '€ la pièce', 'B9, C', 'Phosphore, Potassium, Magnésium', 'legume', 1),
(12, 'Carotte', 'carotte.jpg', 'decembre_mars', 0, '€/KG', 'B9, Carotène', 'Calcium, Magnésium, Potassium', 'legume', 1),
(13, 'Cassis', 'cassis.jpg', 'juin_septembre', 0, '€/KG', 'B9, C', 'Calcium, Potassium', 'fruit', 1),
(14, 'Céleri', 'céleri.jpg', 'octobre_mars', 0, '€/KG', 'B9, C', 'Potassium, Sodium', 'legume', 1),
(15, 'Cerise', 'cerise.jpg', 'mai_juillet', 0, '€/KG', 'B9, C ,Carotène', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(16, 'Champignon de Paris', 'champignon de paris.jpg', 'janvier_aout', 0, '€/KG', 'B3, B5', 'Phosphore, Potassium', 'legume', 1),
(17, 'Chou', 'chou.jpg', 'octobre_mars', 0, '€ la pièce', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(18, 'Chou-fleur', 'chou-fleur.jpg', 'septembre_mars', 0, '€ la pièce', 'B9, C', 'Magnésium, Phosphore, Potassium', 'legume', 1),
(19, 'Clémentine', 'clémentine.jpg', 'novembre_fevrier', 0, '€/KG', 'B9, C', 'Phosphore, Potassium', 'fruit', 1),
(20, 'Coing', 'coing.jpg', 'septembre_octobre', 0, '€/KG', 'B3, C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(21, 'Concombre', 'concombre.jpg', 'avril_octobre', 0, '€ la pièce', 'B9, C', 'Phosphore, Potassium', 'legume', 1),
(22, 'Butternut', 'butternut.jpg', 'septembre_janvier', 0, '€/KG', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(23, 'Courgette', 'courgette.jpg', 'avril_septembre', 0, '€/KG', 'B9, C', 'Phosphore, Potassium', 'legume', 1),
(24, 'Fenouil', 'fenouil.jpg', 'juin_decembre', 0, '€/KG', 'B3, C', 'Calcium, Potassium', 'legume', 1),
(25, 'Figue', 'figue.jpg', 'juillet_novembre', 0, '€/KG', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(26, 'Fraise', 'fraise.jpg', 'mai_juillet', 0, '€/KG', 'B9, C', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(27, 'Framboise', 'framboise.jpg', 'juin_septembre', 0, '€/KG', 'B5, C, E', 'Magnésium, Phosphore, Potassium', 'fruit', 1),
(28, 'Fruit de la passion', 'fruit de la passion.jpg', 'janvier_decembre', 0, '€/KG', 'B2, B3, C', 'Magnésium, Phosphore, Potassium, Sodium', 'fruit', 1),
(29, 'Grenade', 'grenade.jpg', 'novembre_fevrier', 0, '€ la pièce', 'B5, C, E', 'Magnésium, Phosphore, Potassium', 'fruit', 1),
(30, 'Groseille', 'groseille.jpg', 'juin_septembre', 0, '€/KG', 'B3, C, E', 'Calcium, Phosphore, Potassium', 'fruit', 1),
(31, 'Haricot vert', 'haricot vert.jpg', 'juin_septembre', 0, '€/KG', 'C, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(32, 'Kiwi', 'kiwi.jpg', 'novembre_mai', 0, '€ la pièce', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(33, 'Laitue', 'laitue.jpg', 'mai_septembre', 0, '€ la pièce', 'B3, C, E', 'Calcium, Magnésium, Phosphore, Potassium', 'legume', 1),
(34, 'Maïs', 'maïs.jpg', 'juillet_octobre', 0, '€/KG', 'B3, B5, B9', 'Calcium, Phosphore, Potassium', 'legume', 1),
(35, 'Mangue', 'mangue.jpg', 'avril_decembre', 0, '€ la pièce', 'B3, C', 'Magnésium, Phosphore, Potassium', 'fruit', 1),
(36, 'Melon', 'melon.jpg', 'juin_septembre', 0, '€ la pièce', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(37, 'Mirabelle', 'mirabelle.jpg', 'aout_septembre', 0, '€/KG', '-', 'Manganèse, Zinc', 'fruit', 1),
(38, 'Mûre', 'mûre.jpg', 'aout_octobre', 0, '€/KG', 'C, E', 'Calcium, Phosphore, Potassium', 'fruit', 1),
(39, 'Myrtille', 'myrtille.jpg', 'juin_septembre', 0, '€/KG', 'B3, C, E', 'Calcium, Phosphore, Potassium', 'fruit', 1),
(40, 'Navet', 'navet.jpg', 'octobre_mai', 0, '€/KG', 'C, E', 'Calcium, Potassium', 'legume', 1),
(41, 'Nectarine', 'nectarine.jpg', 'juin_aout', 0, '€/KG', 'C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(42, 'Noisette', 'noisette.jpg', 'septembre_novembre', 0, '€/KG', 'B3, B5, E', 'Calcium, Phosphore, Potassium', 'fruit', 1),
(43, 'Noix', 'noix.jpg', 'septembre_novembre', 0, '€/KG', 'B9, E', 'Phosphore, Potassium', 'fruit', 1),
(44, 'Noix de coco', 'noix de coco.jpg', 'novembre_fevrier', 0, '€ la pièce', 'B9, C', 'Magnésium, Potassium', 'fruit', 1),
(45, 'Oignon', 'oignon.jpg', 'aout_avril', 0, '€/KG', 'B5, C', 'Phosphore, Potassium', 'legume', 1),
(46, 'Orange', 'orange.jpg', 'novembre_avril', 0, '€/KG', 'B9, C', 'Calcium, Potassium', 'fruit', 1),
(47, 'Oseille', 'oseille.jpg', 'mai_octobre', 0, '€/KG', 'C, E', 'Magnésium, Potassium', 'legume', 1),
(48, 'Panais', 'panais.jpg', 'octobre_fevrier', 0, '€/KG', 'C, K1', 'Calcium, Magnésium, Potassium', 'legume', 1),
(49, 'Pamplemousse', 'pamplemousse.jpg', 'fevrier_juin', 0, '€ la pièce', '-', '-', 'fruit', 1),
(50, 'Pastèque', 'pastèque.jpg', 'juin_aout', 0, '€ la pièce', 'B9, C', 'Magnésium, Potassium', 'fruit', 1),
(51, 'Petit pois', 'petit pois.jpg', 'avril_juillet', 0, '€/KG', 'B3, C', 'Calcium, Magnésium, Phosphore, Potassium', 'legume', 1),
(52, 'Pêche', 'pêche.jpg', 'juin_aout', 0, '€/KG', 'C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(53, 'Poire', 'poire.jpg', 'juillet_septembre', 0, '€/KG', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(54, 'Poireau', 'poireau.jpg', 'septembre_mars', 0, '€/KG', 'B9, C', 'Calcium, Phosphore, Potassium', 'legume', 1),
(55, 'Poivron', 'poivron.jpg', 'juin_septembre', 0, '€/KG', 'C, E', 'Phosphore, Potassium', 'legume', 1),
(56, 'Pomme', 'pomme.jpg', 'aout_avril', 0, '€/KG', 'C, E', 'Magnésium, Potassium', 'fruit', 1),
(57, 'Potiron', 'potiron.jpg', 'septembre_janvier', 0, '€/KG', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(58, 'Prune', 'prune.jpg', 'juillet_octobre', 0, '€/KG', 'B9, C, Carotène', 'Calcium, Magnésium, Potassium', 'fruit', 1),
(59, 'Radis', 'radis.jpg', 'mars_juin', 0, '€/KG', 'B3, C', 'Calcium, Potassium', 'legume', 1),
(60, 'Raisin', 'raisin.jpg', 'juillet_octobre', 0, '€/KG', 'B9, C', 'Calcium, Magnésium, Phosphore, Potassium', 'fruit', 1),
(61, 'Rhubarbe', 'rhubarbe.jpg', 'avril_juin', 0, '€/KG', 'B9, C, Carotène', 'Calcium, Potassium', 'fruit', 1),
(62, 'Tomate', 'tomate.jpg', 'mai_septembre', 0, '€/KG', 'C, Carotène, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(63, 'Topinambour', 'topinambour.jpg', 'novembre_mars', 0, '€/KG', 'B9, C, E', 'Calcium, Magnésium, Potassium', 'legume', 1),
(64, 'Citron', 'citron.jpg', 'novembre_fevrier', 0, '€/KG', 'B9, C', 'Calcium, Magnésium, Phosphore, Potassium', 'fruit', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fruits_legumes_mois`
--

DROP TABLE IF EXISTS `fruits_legumes_mois`;
CREATE TABLE IF NOT EXISTS `fruits_legumes_mois` (
  `id_fruits_legumes` int NOT NULL,
  `id_mois` tinyint UNSIGNED NOT NULL,
  KEY `FK_EST_AFFICHE` (`id_mois`),
  KEY `FK_EST_AFFICHE2` (`id_fruits_legumes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fruits_legumes_mois`
--

INSERT INTO `fruits_legumes_mois` (`id_fruits_legumes`, `id_mois`) VALUES
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 10),
(3, 11),
(3, 12),
(3, 1),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(9, 10),
(9, 11),
(9, 12),
(9, 1),
(9, 2),
(9, 3),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(11, 9),
(11, 10),
(11, 11),
(11, 12),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 12),
(12, 1),
(12, 2),
(12, 3),
(13, 6),
(13, 7),
(13, 8),
(13, 9),
(14, 10),
(14, 11),
(14, 12),
(14, 1),
(14, 2),
(14, 3),
(15, 5),
(15, 6),
(15, 7),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(17, 10),
(17, 11),
(17, 12),
(17, 1),
(17, 2),
(17, 3),
(18, 9),
(18, 10),
(18, 11),
(18, 12),
(18, 1),
(18, 2),
(18, 3),
(19, 11),
(19, 12),
(19, 1),
(19, 2),
(20, 9),
(20, 10),
(21, 4),
(21, 5),
(21, 6),
(21, 7),
(21, 8),
(21, 9),
(21, 10),
(22, 9),
(22, 10),
(22, 11),
(22, 12),
(22, 1),
(23, 4),
(23, 5),
(23, 6),
(23, 7),
(23, 8),
(23, 9),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(24, 6),
(24, 7),
(24, 8),
(24, 9),
(24, 10),
(24, 11),
(24, 12),
(25, 7),
(25, 8),
(25, 9),
(25, 10),
(25, 11),
(26, 5),
(26, 6),
(26, 7),
(27, 6),
(27, 7),
(27, 8),
(27, 9),
(28, 1),
(28, 3),
(28, 2),
(28, 4),
(28, 5),
(28, 6),
(28, 7),
(28, 8),
(28, 9),
(28, 10),
(28, 11),
(28, 12),
(29, 11),
(29, 12),
(29, 1),
(29, 2),
(30, 6),
(30, 7),
(30, 8),
(30, 9),
(31, 6),
(31, 7),
(31, 8),
(31, 9),
(32, 11),
(32, 12),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(32, 5),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(34, 7),
(34, 8),
(34, 9),
(34, 10),
(35, 5),
(35, 6),
(35, 7),
(35, 8),
(35, 9),
(35, 10),
(35, 11),
(35, 12),
(36, 6),
(36, 7),
(36, 8),
(36, 9),
(37, 8),
(37, 9),
(38, 8),
(38, 9),
(38, 10),
(39, 6),
(39, 7),
(39, 8),
(39, 9),
(40, 10),
(40, 11),
(40, 12),
(40, 1),
(40, 2),
(40, 3),
(40, 4),
(40, 5),
(41, 6),
(41, 7),
(41, 8),
(42, 9),
(42, 10),
(42, 11),
(43, 9),
(43, 10),
(43, 11),
(44, 11),
(44, 12),
(44, 1),
(44, 2),
(45, 8),
(45, 9),
(45, 10),
(45, 11),
(45, 12),
(45, 1),
(45, 2),
(45, 3),
(45, 4),
(45, 5),
(46, 11),
(46, 12),
(46, 1),
(46, 2),
(46, 3),
(46, 4),
(46, 5),
(47, 5),
(47, 6),
(47, 7),
(47, 8),
(47, 9),
(47, 10),
(48, 10),
(48, 11),
(48, 12),
(48, 1),
(48, 2),
(49, 2),
(49, 3),
(49, 4),
(49, 5),
(49, 6),
(50, 6),
(50, 7),
(50, 8),
(51, 4),
(51, 5),
(51, 6),
(51, 7),
(52, 6),
(52, 7),
(52, 8),
(53, 7),
(53, 8),
(53, 9),
(54, 9),
(54, 10),
(54, 11),
(54, 12),
(54, 1),
(54, 2),
(54, 3),
(55, 6),
(55, 7),
(55, 8),
(55, 9),
(56, 8),
(56, 9),
(56, 10),
(56, 11),
(56, 12),
(56, 1),
(56, 2),
(56, 3),
(56, 4),
(57, 9),
(57, 10),
(57, 11),
(57, 12),
(57, 1),
(58, 7),
(58, 8),
(58, 9),
(58, 10),
(59, 3),
(59, 4),
(59, 5),
(59, 6),
(60, 7),
(60, 8),
(60, 9),
(60, 10),
(61, 4),
(61, 5),
(61, 6),
(62, 5),
(62, 6),
(62, 7),
(62, 8),
(62, 9),
(63, 11),
(63, 12),
(63, 1),
(63, 2),
(63, 3),
(8, 1),
(64, 11),
(64, 12),
(64, 1),
(64, 2),
(1, 6),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `mois`
--

DROP TABLE IF EXISTS `mois`;
CREATE TABLE IF NOT EXISTS `mois` (
  `id_mois` tinyint UNSIGNED NOT NULL,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mois`
--

INSERT INTO `mois` (`id_mois`, `nom`) VALUES
(1, 'janvier'),
(2, 'février'),
(3, 'mars'),
(4, 'avril'),
(5, 'mai'),
(6, 'juin'),
(7, 'juillet'),
(8, 'août'),
(9, 'septembre'),
(10, 'octobre'),
(11, 'novembre'),
(12, 'decembre');

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `id_recettes` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ingredients` text NOT NULL,
  `duree` smallint NOT NULL,
  `etapes` text NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fl_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_categories` int NOT NULL,
  `id_users` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_recettes`),
  KEY `id_categories` (`id_categories`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`id_recettes`, `nom`, `img`, `ingredients`, `duree`, `etapes`, `slug`, `fl_principal`, `id_categories`, `id_users`, `created_at`, `updated_at`) VALUES
(1, 'Gratin de brocolis', 'gratin-de-brocolis.jpeg', '- 15 cl de crème fraiche \r\n- 100g de fromage râpé \r\n- 1 oignon\r\n- 2 oeufs\r\n- 2 tranches de jambon dégraissé \r\n- 2 gousses d\'ail \r\n- 300g de brocolis\r\n- sel, poivre, huile ,chapelure\r\n\r\n', 30, '1) Faire bouillir un fond d\'eau légèrement salée dans une grande casserole.\r\n2) Plonger les brocolis, couvrir et laisser cuire à feu doux. Battre les 2 oeufs dans un grand bol, ajouter la crème, le sel, le poivre et la noix de muscade. Mélanger.\r\n3) Ajouter les 2 tranches de jambon préalablement coupées en petits morceaux ainsi que le tiers du fromage râpé. Mélanger le tout.\r\n4) Lorsque les brocolis sont tendres, les égoutter le plus possible. Préchauffer le four (180°C). Faire chauffer un fond d\'huile dans la casserole et y mettre l\'oignon haché grossièrement. Faire revenir à feu très doux et ne pas faire brunir !\r\n5) Y ajouter les deux gousses d\'ail pressées et les brocolis. Assaisonner légèrement et bien mélanger.\r\n6) Verser le contenu de la casserole dans un plat à gratin, bien étaler. Verser le mélange d\'oeufs, étaler le tout de façon uniforme. \r\n7) Saupoudrer de chapelure et du restant de gruyère râpé. Mettre le plat au four, toujours sur 180°C et laisser cuire entre 30 et 45 min.\r\n8) Vérifier la cuisson de temps en temps... L\'ensemble doit être (en fin de cuisson) assez dense, un peu comme une grosse omelette.\r\n\r\n\r\n\r\n', '', 'brocolis', 1, 1, '2023-08-10 21:05:27', '2023-09-21 12:15:26'),
(2, 'Tarte aux pommes', 'Tarte aux pommes.jpg', '- 1 rouleau de Pâte sablée \r\n- 3 pomme golden \r\n- 3 oeufs\r\n- 3 cuillère à sucre\r\n- 20cl de crème liquide\r\n- 1 pincée de Cannelle\r\n- 1 sachet de sucre vanillé\r\n\r\n\r\n', 20, '1) Déroulez, étalez et piquez la pâte dans un moule à tarte. Pelez, videz et coupez en fines tranches les pommes. Posez-les sur la pâte en rosace.\r\n2) Dans un saladier, battez les œufs avec le sucre, puis ajoutez la crème et la cannelle. Versez le mélange sur les pommes.\r\n3) Mettez au four à 210°C (thermostat 7) pour 40 minutes environ. Vers la fin de la cuisson, répartissez sur la tarte le sucre vanillé et remettez au four pour caramélisé.\r\n', '', 'pomme', 1, 1, '2023-08-14 09:49:27', '2023-09-21 12:15:26'),
(3, 'Cheesecake à la mangue', 'Cheescake à la mangue.jpg', '- 225 g de palets bretons\r\n- 1 c. à soupe de sucre\r\n- 2 c. à soupe jus de citron\r\n- 300 g de fromage frais (type Philadelphia)\r\n- 300 g de mascarpone\r\n- 70 g de sucre glace\r\n- Quelques feuilles de menthe\r\n', 25, '1) Préchauffez votre four à 180 °C.\r\n2) Dans un saladier, émiettez les palets bretons puis mélangez-les avec le beurre fondu. La préparation doit être sablonneuse et humide.\r\n3) Tapissez le fond d’un moule à charnières de papier sulfurisé puis versez dans le fond de celui-ci le mélange biscuits/beurre et étalez-le de manière homogène en tassant à l’aide du dos d’une cuillère à soupe.\r\n4) Enfournez pour 10 minutes de cuisson. À la sortie du four, laissez refroidir à température ambiante.\r\n5) Coupez les mangues en dés puis mixez-les avec le jus de citron et le sucre en poudre.\r\n6) Dans un saladier, fouettez le mascarpone avec le fromage frais puis ajoutez le sucre glace, la moitié de la purée de mangue et le zeste d’un citron vert tout en continuant à mélanger. Le mélange doit être bien ferme. Vous pouvez utiliser un batteur électrique pour cette étape.\r\n7) Une fois prêt, versez l’appareil sur le biscuit refroidi puis lissez la surface à l’aide d’une spatule. Réservez au frais pour minimum 2 heures.\r\n8) Démoulez votre cheesecake à la mangue puis étalez le reste de purée sur celui-ci. Servez-le avec quelques feuilles de menthe !\r\n', '', 'mangue', 1, 1, '2023-08-14 20:21:58', '2023-09-21 12:15:26'),
(4, 'Ratatouille', 'ratatouille.jpg', '-4 tomates\r\n-2 aubergines\r\n-2 oignons\r\n-1 poivron rouge\r\n-1 courgette\r\n-1 aromate (ail, thym, laurier)\r\n-1 branche de romarin\r\n-4 cl d\'huile d\'olive\r\n-4 pincées de sel et poivre', 35, '1) Couper les aubergines et les courgettes en dés de taille moyenne, les saler et les laisser dégorger pendant 10 min. Les essorer ensuite soigneusement.\r\n2) Éplucher et émincer les oignons. Couper les poivrons en 2, les épépiner puis retirer la membrane blanche. Les couper ensuite en gros morceaux.\r\n3) Laver les tomates, les éplucher et les couper en morceaux. Éplucher et dégermer l\'ail, puis le hacher finement.\r\n4) Réservez chacun des légumes dans un récipient séparé. La cuisson des légumes pour la ratatouille se fait dans un ordre bien précis, comme vous allez le constater ci-dessous...\r\n5) Faire chauffer l\'huile dans une sauteuse, puis faire suer les oignons avec une pincée de sel fin. Ajouter les aubergines et les poivrons, assaisonner à nouveau de sel fin et laisser cuire à feu moyen pendant 5 min. Mettre les courgettes et saler, puis laisser cuire à feu moyen pendant 5 min.\r\n6) Ajouter ensuite les aromates (ail, thym, laurier), la branche de romarin, puis les tomates. Rectifier l\'assaisonnement en sel et en poivre.\r\n7) Laisser mijoter à couvert et à feu doux pendant 30 min.', '', 'tomate,aubergine,oignon,poivron,courgette', 1, 1, '2023-08-16 15:09:31', '2023-09-21 12:15:26'),
(5, 'Tarte aux aubergines et tomates', 'tartes aux aubergines et aux tomates.jpg', '-1 pâte à tarte\r\n-3 tomates\r\n-2 aubergines\r\n-60g de parmesan\r\n-250 g de mozzarella\r\n-Quelques brins de basilic\r\n-Sel, poivre\r\n\r\n\r\n', 30, '1) Étalez votre pâte puis déposez-la dans votre moule à tarte. À l’aide d’une fourchette, piquez le fond et les bords.\r\n2) Préchauffez votre four à 200 °C.\r\n3) Ensuite, saupoudrez le fond de la pâte de parmesan (en plus d’être délicieux, celui-ci permet d’absorber l’humidité de la tomate et évitera à la pâte d’être détrempée).\r\n4) Rincez et coupez en rondelles les aubergines ainsi que les tomates assez finement.\r\n5) Égouttez et découpez en fines rondelles la mozzarella puis coupez ces rondelles en deux.\r\n6) Maintenant, alternez les aubergines, tomates et mozzarella sur le fond de tarte jusqu’à épuisement des ingrédients. Placez à quelques endroits des feuilles de basilic.\r\n7) Pour terminer, saupoudrez de parmesan et enfournez pendant 20 minutes', '', 'tomate,aubergine', 1, 1, '2023-08-17 20:49:18', '2023-09-21 12:15:26'),
(6, 'Tarte multi-légumes', 'tarte multi-légumes.jpg', '- 250 g de farine\r\n-125 g de beurre froid\r\n-1 œuf\r\n-1 c.à.c herbes aromatiques\r\n-2 c.à.s d’eau froide\r\n-1 bouquet de ciboulette \r\n-50 g épinards \r\n-250 g asperges \r\n-125 g tomates \r\n-sel, poivre\r\n\r\n\r\n', 45, '1) Verser la farine, le beurre coupé en dés, les herbes et le sel dans un mixeur, et mixez jusqu’à ce que le beurre disparaisse. Ajouter l’œuf et 2 cuillères d’eau froide et mixer pour obtenir une pâte qui s’agglomère. Former une boule et placer 20 min au réfrigérateur.\r\n2) Mélanger la ricotta avec le parmesan, l’œuf, du sel, du poivre. Ajouter la ciboulette ciselée et les pousses d’épinard finement hachées au couteau.\r\n3) Laver les asperges, couper et jeter les talons durs. Éplucher la carotte, la couper en bâtonnets. Faire pré-cuire les asperges et les bâtonnets de carotte pendant 3 minutes dans une casserole d’eau bouillante, puis les égoutter.\r\n4) Étaler la pâte à l’aide d’un rouleau à pâtisserie sur le plan de travail fariné, en forme de rectangle d’environ 25x40 cm. Mettre sur une plaque recouverte de papier cuisson. Étaler la préparation à la ricotta sur la pâte en laissant 3 cm de bord vide. Aligner les asperges et les bâtonnets de carotte sur la ricotta, ajouter les petits pois et les tomates cerises puis rabattre les bords de pâte.\r\n5) Faire cuire au four à 190°C pendant 25 min.', '', 'asperge,tomate', 1, 1, '2023-08-17 21:11:18', '2023-09-21 12:15:26'),
(7, 'Raïta de concombre', 'Raïta de concombre.webp', '-1 concombre \r\n-2 pots de yahourts à la Grecques\r\n-1 gousse d\'ail\r\n-10 feuilles de menthe\r\n-3 cébettes\r\n-1 pincée de sel et poivre', 10, '1) Râpez le concombre, hachez l\'ail et les oignons et hachez la menthe.\r\n2) Dans un bol, mélangez le concombre, l\'ail, l\'oignon, la menthe, le yaourt grec avec le sel et le poivre. Vous pouvez rajouter un filet d\'huile d\'olive au moment du dressage si vous le souhaitez.\r\n3) Réservez votre sauce au frais jusqu\'à la dégustation.', '', 'concombre,ail,menthe', 1, 1, '2023-08-26 22:59:34', '2023-09-21 12:15:26'),
(8, 'Salade de petits pois, courgettes, menthe et citron', 'salade de petit pois, courgettes.jpg', '-650 à 700 g Petits pois frais à écosser\r\n-2 courgettes (300 g environ)\r\n-150 g Stracciatella\r\n-1 Cébette\r\n-10 brins Menthe\r\n-20 g Amandes effilées\r\n-1/2 Citron (le jus)\r\n-1/2 citron confit\r\n-3 c. à soupe Huile d\'olive\r\n-Sel et poivre', 25, '1) Commencez cette recette de salade de printemps en écossant les petits pois si besoin. Pelez les courgettes et coupez-les en rondelles fines. Faites cuire les petits pois et les courgettes 4 min dans une casserole d’eau bouillante salée. Égouttez-les.\r\n\r\n2)Retirez la pulpe du citron confit et coupez-le en petits morceaux. Émincez la cébette. Ciselez les feuilles de menthe. Torréfiez les amandes à sec environ 1 min dans une poêle à feu moyen en surveillant.\r\n\r\n3) Mélangez le jus de citron, l’huile d’olive, du sel et du poivre. Assemblez tous les ingrédients préparés et la stracciatella. Mélangez-les à la vinaigrette et servez.', '', 'petit pois,courgette,citron', 1, 1, '2023-08-17 21:54:55', '2023-09-21 12:15:26'),
(9, 'Carpaccio de champignons, noisettes et parmesan', 'CARPACCIO DE CHAMPIGNONS, NOISETTES ET PARMESAN.PNG', '-400g de champignons de Paris\r\n- 1 citron 🍋 \r\n- 100g de copeaux de parmesan \r\n- 1/2 gousse d\'ail \r\n- 100g de noisettes\r\n- 1/2 bouquet de persil \r\n- 2 filets d\'huile de noix (ou noisette ou huile d\'olive)\r\n- sel, poivre du moulin\r\n\r\n', 30, '1) Faites torréfier les noisettes environ 15 minutes au four à 160°C.\r\n\r\n2) Lavez, séchez les champignons dans un linge propre, retirez la moitié du pied au couteau, puis coupez les en lamelles. Déposez les dans un saladier.\r\n\r\n3) Versez le demi jus de citron, ajoutez la demie gousse d\'ail hachée, le petit bouquet de persil haché. \r\n\r\n4) Arrosez d\'huile de noix et salez, poivrez.\r\n\r\n5) Ajoutez les noisettes et le parmesan.\r\n\r\n6) Conservez au réfrigérateur jusqu\'au service, puis servez bien frais en entrée.\r\n\r\n', '', 'champignon de paris,noisette,citron,ail', 1, 1, '2023-08-29 20:43:34', '2023-09-21 12:15:26'),
(10, 'Soupe de butternut et carottes ', 'Soupe de butternut.jpg', '- 1 courge butternut \r\n- 1 Oignon \r\n- 2 Carottes\r\n- 2 cuillères à soupe de crème fraiche \r\n- 1 cube de bouillon de volaille \r\n- Sel et poivre \r\n- Curry \r\n- Huile d\'olive  \r\n', 10, '1) Faire revenir dans l’huile d’olive : l’oignon émincé ainsi que les carottes et la courge butternut préalablement épluchés et coupés en dés. Couvrir d’eau à hauteur et ajouter le cube de bouillon de volaille.\r\n\r\n2) Laisser mijoter à couvert 25 minutes. Ajouter la crème, mixer le tout, saler et poivrer.\r\n\r\n', '', 'butternut,carotte,oignon', 1, 1, '2023-09-02 09:07:58', '2023-09-21 12:15:26'),
(148, 'fgk', 'appareil alex.png', 'ghg', 4, 'hgh', '', '', 1, 3, '2023-09-22 14:05:40', '2023-09-22 14:05:40');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'ay', 'admin@admin.fr', '$2y$10$FxFVNESoAyN.57UFCVC5X.GBwqNO4YNVM9A7S9yXf87i8pUxYXG6C', 'admin', '2023-09-21 12:10:10', '2023-09-23 00:19:44'),
(2, 'john', 'toto@to.fr', '$2y$10$Cr88po33yxmpIc2xzZI1YeQWS7W2cw6n8UnfcAvyoa3KmjGIpa7WS', 'DEFAULT', '2023-09-21 12:08:24', '2023-09-21 12:16:16'),
(3, 'margot', 'margot-blazeix@hotmail.fr', '$2y$10$MvZVXN4p5daczWF0pVrwP.VPitSrz53G/OwyfcrDYwN8ujhxnkDXC', 'DEFAULT', '2023-09-21 12:43:48', '2023-09-22 11:31:42'),
(45, 'toto1', 'patricia.fizailne@yahoo.fr', '$2y$10$KTCNRzyWUv22qqlx9N18Yerk7QkRJIzZrjYmbVXGERqImzzQdG5iG', 'DEFAULT', '2023-09-22 12:47:58', '2023-09-22 12:48:52'),
(46, 'aym', 'fgfdgfdgfdg@vcvfd.fr', '$2y$10$hkWhGUXzkzbjTLnzgPyxleiczghcC98lGI1zNZ4PL0i6MBTCY.Lz.', 'DEFAULT', '2023-09-22 14:01:29', '2023-09-22 14:01:29');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fruits_legumes`
--
ALTER TABLE `fruits_legumes`
  ADD CONSTRAINT `FK_FL_USERS` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `fruits_legumes_mois`
--
ALTER TABLE `fruits_legumes_mois`
  ADD CONSTRAINT `FK_EST_AFFICHE` FOREIGN KEY (`id_mois`) REFERENCES `mois` (`id_mois`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_EST_AFFICHE2` FOREIGN KEY (`id_fruits_legumes`) REFERENCES `fruits_legumes` (`id_fruits_legumes`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD CONSTRAINT `recettes_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `recettes_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
