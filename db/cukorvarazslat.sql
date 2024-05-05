-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 05. 12:11
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

INSERT INTO `offers` (`id`, `name`, `email`, `message`, `date`) VALUES
(5, 'Ódry Attila', 'odry.attila@keri.mako.hu', 'dsdsdsdsds', '2024-04-29');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `expiration` varchar(7) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `date` datetime NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `card_number`, `expiration`, `cvv`, `date`, `total`) VALUES
(1, 15, '1111111111111111', '2024/05', '123', '2024-05-04 18:24:15', 49984),
(2, 15, '1111111111111111', '2025/01', '123', '2024-05-04 18:27:18', 20995),
(3, 15, '1111111111111111', '2024/05', '123', '2024-05-04 20:34:45', 5998),
(4, 15, '1111111111111111', '2024/05', '123', '2024-05-05 09:57:43', 10797);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders_item`
--

CREATE TABLE `orders_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `orders_item`
--

INSERT INTO `orders_item` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 12, 2999),
(2, 1, 7, 3, 3999),
(3, 1, 24, 1, 1999),
(4, 2, 2, 2, 2999),
(5, 2, 8, 3, 4999),
(6, 3, 2, 2, 2999),
(7, 4, 3, 2, 3999),
(8, 4, 29, 1, 2799);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `product_type` varchar(20) NOT NULL,
  `img` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `product_type`, `img`, `price`) VALUES
(1, 'Bambi', 'figurak', 'bambi.jpg', 2999),
(2, 'Grincs', 'figurak', 'grincs.jpeg', 2999),
(3, 'Oroszlánkirály', 'figurak', 'oroszlankiraly.jpeg', 3999),
(4, 'Verdák', 'figurak', 'verdak_matuka_mc_queen.jpeg', 4999),
(5, 'Dobbermann', 'figurak', 'dog.jpeg', 2999),
(6, 'Mickey egér csomag', 'figurak', 'miki_eger_csomag.jpeg', 7999),
(7, 'Micimackó és barátai', 'figurak', 'micimacko.jpg', 3999),
(8, 'Jávorszarvas', 'figurak', 'szarvass.jpeg', 4999),
(9, 'Liliom', 'cukorviragdisz', 'liliom.jpeg', 4999),
(10, 'Cymbídium Orchidea', 'cukorviragdisz', 'cymbidium_orchidea.jpeg', 1999),
(11, 'Hóvirág', 'cukorviragdisz', 'hovirag.jpeg', 2599),
(12, 'Tulipán', 'cukorviragdisz', 'tulipanok.jpeg', 3999),
(13, 'Gyöngyvirág', 'cukorviragdisz', 'gyongyvirag.jpeg', 2999),
(14, 'Mikulás virág', 'cukorviragdisz', 'mikulasvirag.jpeg', 3499),
(15, 'Angol rózsa', 'cukorviragdisz', 'angol_rozsa.jpg', 2999),
(16, 'Rózsa', 'cukorviragdisz', 'bazsarozsa_rozsa.jpeg', 3199),
(17, 'A halott menyasszony', 'naszparok', 'halottmenny2.jpg', 4099),
(18, 'Király és királyné', 'naszparok', 'par3.jpg', 2699),
(19, 'Cicák', 'naszparok', 'parok8.jpeg', 4999),
(20, 'Shrek és Fióna', 'naszparok', 'shrekpar.jpg', 3000),
(21, 'Ludak', 'naszparok', 'ludak.jpeg', 2399),
(22, 'Mosómedvék', 'naszparok', 'mosomacik.jpeg', 3599),
(23, 'Arany rózsa', 'eskuvocukor', 'fantasia_rozsa.jpeg', 2999),
(24, 'Tulipán', 'eskuvocukor', 'tulipan_pink.jpeg', 1999),
(25, 'Orchidea', 'eskuvocukor', 'orchidea2.jpeg', 2499),
(26, 'Bazsarózsa', 'eskuvocukor', 'bazsarozsa_hortenzia.jpeg', 3999),
(27, 'Piros Orchidea', 'eskuvocukor', 'orchidea_piros.jpeg', 3499),
(28, 'Liliom', 'eskuvocukor', 'liliom.jpeg', 3299),
(29, 'Frézia', 'eskuvocukor', 'frezia_pillangovirag.jpeg', 2799),
(30, 'Anemóna', 'eskuvocukor', 'anemone.jpeg', 4299);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products_type`
--

CREATE TABLE `products_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order_by` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `products_type`
--

INSERT INTO `products_type` (`id`, `type`, `name`, `order_by`) VALUES
(1, 'cukorviragdisz', 'Cukorvirágdísz', 2),
(2, 'eskuvocukor', 'Esküvő cukor', 4),
(3, 'figurak', 'Figurák', 1),
(4, 'naszparok', 'Nászpárok', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL,
  `price` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products_type`
--
ALTER TABLE `products_type`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`user_id`,`product_id`,`price`) USING BTREE;

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
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `products_type`
--
ALTER TABLE `products_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
