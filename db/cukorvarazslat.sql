-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 24. 10:05
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `cukorvarazslat`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `offers`
--

CREATE TABLE `offers` (
  `id` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `message` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `offers`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `type`
--

CREATE TABLE `type` (
  `id` char(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `type`
--

INSERT INTO `type` (`id`, `type`, `name`) VALUES
('F', 'GENDER', 'nő'),
('M', 'GENDER', 'férfi'),
('A', 'USER', 'adminisztátor'),
('G', 'USER', 'vendég'),
('L', 'USER', 'vezető'),
('N', 'USER', 'nincs hitelesítve'),
('U', 'USER', 'felhasználó'),
('W', 'USER', 'dolgozó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL DEFAULT 'G',
  `name` varchar(100) NOT NULL,
  `born` date DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `born`, `gender`, `country_code`, `phone`, `address`, `email`, `password`, `valid`) VALUES
(1, 'U', 'Bálint Bence Dániel', NULL, 'M', NULL, NULL, NULL, 'balint.bencedaniel-2019@keri.mako.hu', '1234Aa', 1),
(2, 'U', 'Bálint Gergő', NULL, 'M', NULL, NULL, NULL, 'balint.gergo-2019@keri.mako.hu', '1234Aa', 1),
(3, 'U', 'Földi Ákos Ádám', NULL, 'M', NULL, NULL, NULL, 'foldi.akosadam-2019@keri.mako.hu', '1234Aa', 1),
(4, 'U', 'Kányási Dávid Gergő', NULL, 'M', NULL, NULL, NULL, 'kanyasi.davidgergo-2019@keri.mako.hu', '1234Aa', 1),
(5, 'U', 'Kiss Benjámin Zoltán', NULL, 'M', NULL, NULL, NULL, 'kiss.benyaminzoltan-2019@keri.mako.hu', '1234Aa', 1),
(6, 'U', 'Surányi Csenge', NULL, 'F', NULL, NULL, NULL, 'suranyi.csenge-2019@keri.mako.hu', '1234Aa', 1),
(7, 'U', 'Szabó Martin Tamás', NULL, 'M', NULL, NULL, NULL, 'szabo.martintamas-2019@keri.mako.hu', '1234Aa', 1),
(8, 'U', 'Tóth Barnabás Gyula', NULL, 'M', NULL, NULL, NULL, 'toth.barnabasgyula-2019@keri.mako.hu', '1234Aa', 1),
(9, 'U', 'Török Ferenc', NULL, 'M', NULL, NULL, NULL, 'torok.ferenc-2019@keri.mako.hu', '1234Aa', 1),
(10, 'U', 'Valach Martin', NULL, 'M', NULL, NULL, NULL, 'valach.martin-2019@keri.mako.hu', '1234Aa', 1),
(11, 'U', 'Vörös Alexandra', NULL, 'F', NULL, NULL, NULL, 'voros.alexandra-2019@keri.mako.hu', '1234Aa', 1),
(12, 'A', 'Gera Imre', NULL, 'M', NULL, NULL, NULL, 'gera.imre.tch@gmail.com', '1234Aa', 1),
(13, 'A', 'Kiss Andrea', '1974-12-01', 'F', '36', '302360141', '6900 Makó, Posta utca 4-6.', 'kissamail@gmail.com', '1234Aa', 1),
(14, 'A', 'Molnár Zsolt', NULL, 'M', NULL, NULL, NULL, 'molnarzsoltnavay@gmail.com', '1234Aa', 1),
(15, 'A', 'Ódry Attila', '1964-03-08', 'M', '36', '304816888', '6725 Szeged, Futrinka utca 66.', 'odry.attila@keri.mako.hu', '1234Aa', 1),
(16, 'A', 'Vidéki Gyula Milán', NULL, 'M', NULL, NULL, NULL, 'videki.gyula.milan@gmail.com', '1234Aa', 1),
(17, 'U', 'Földi Ákos', '2004-03-17', 'M', '36', '301168611', 'Szegedi utca 9-13/c', 'akoska610@gmail.com', 'Majompok1', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlas`
--

CREATE TABLE `vasarlas` (
  `id` int(11) NOT NULL,
  `userid` int(5) NOT NULL,
  `kartyaszam` int(19) NOT NULL,
  `fizetes_idopont` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type`,`id`) USING BTREE;

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `vasarlas`
--
ALTER TABLE `vasarlas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
