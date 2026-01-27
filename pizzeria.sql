-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 27. 22:18
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizzeria`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `Id` int(11) NOT NULL,
  `Felhasznalonev` varchar(35) NOT NULL,
  `Jelszo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`Id`, `Felhasznalonev`, `Jelszo`) VALUES
(1, 'Susie', 'Iwasthe1'),
(2, 'Jeremy', 'Faceless2'),
(3, 'Gabriel', 'HarHarHar3'),
(4, 'Fritz', 'Pirrate4'),
(5, 'Cassidy', 'KEEPUHERE5'),
(6, 'Charlotte Emily', 'Carryemall6'),
(7, 'Gregory', 'Superstar7'),
(8, 'Cassie', 'Roxyfan8');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kupon`
--

CREATE TABLE `kupon` (
  `Id` int(11) NOT NULL,
  `Kod` varchar(12) NOT NULL,
  `Felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kupon`
--

INSERT INTO `kupon` (`Id`, `Kod`, `Felhasznalo_id`) VALUES
(1, 'URD0GH3R3', 1),
(2, 'COMETOUS', 2),
(3, 'H0TDEALS', 5),
(4, 'ALLNIGHT', 7),
(5, '0UTTH3R3', 6),
(6, 'TH3RUINS', 8);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `Id` int(11) NOT NULL,
  `Pizzanev` varchar(40) NOT NULL,
  `Ar` decimal(10,2) NOT NULL,
  `Rendel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`Id`, `Pizzanev`, `Ar`, `Rendel_id`) VALUES
(1, 'Prosciutto e Funghi', 1450.00, 2),
(2, 'Diavola', 1399.00, 1),
(3, 'Napoletana', 1399.00, 5),
(4, 'Marinara', 1600.00, 6),
(5, 'Quattro Stagioni', 2000.00, 7),
(6, 'Capricciosa', 2100.00, 8);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza_tervezo`
--

CREATE TABLE `pizza_tervezo` (
  `Id` int(11) NOT NULL,
  `Feltet` varchar(255) NOT NULL,
  `Rendeles_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizza_tervezo`
--

INSERT INTO `pizza_tervezo` (`Id`, `Feltet`, `Rendeles_id`) VALUES
(1, 'mozzarella', 3),
(2, 'mozzarella, cheddar, sonka, szalámi, szalonna gomba, tonhal, ananász, kukorica', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `Id` int(11) NOT NULL,
  `Nev` varchar(35) NOT NULL,
  `Lakcim` varchar(50) NOT NULL,
  `Datum` datetime NOT NULL,
  `Osszeg` decimal(10,2) NOT NULL,
  `Egyedi` tinyint(1) NOT NULL,
  `Felhasz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`Id`, `Nev`, `Lakcim`, `Datum`, `Osszeg`, `Egyedi`, `Felhasz_id`) VALUES
(1, 'Susie', 'Istálló utca 1', '1985-06-25 17:52:07', 1399.00, 0, 1),
(2, 'Jeremy', 'Szilva utca 27', '1985-06-25 18:10:07', 1450.00, 0, 2),
(3, 'Charlotte Emily', 'Hurrikán utca 1', '1983-10-26 16:12:08', 999.00, 1, 6),
(4, 'Gregory', 'Cső utca 100', '2026-01-25 23:12:07', 3450.00, 1, 7),
(5, 'Gabriel', 'Erdő utca 5', '1985-06-25 19:31:42', 1399.00, 0, 3),
(6, 'Fritz', 'Szilva utca 99', '1985-06-25 20:32:52', 1600.00, 0, 4),
(7, 'Cassidy', 'Erdő utca 66', '1985-06-25 21:31:42', 2000.00, 0, 5),
(8, 'Cassie', 'Eper utca 46', '2026-01-27 21:31:42', 2100.00, 0, 8);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `kupon`
--
ALTER TABLE `kupon`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Kod` (`Kod`),
  ADD KEY `Felhasznalo_id` (`Felhasznalo_id`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Rendel_id` (`Rendel_id`);

--
-- A tábla indexei `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Rendeles_id` (`Rendeles_id`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Felhasz_id` (`Felhasz_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `kupon`
--
ALTER TABLE `kupon`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `menu`
--
ALTER TABLE `menu`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kupon`
--
ALTER TABLE `kupon`
  ADD CONSTRAINT `kupon_ibfk_1` FOREIGN KEY (`Felhasznalo_id`) REFERENCES `felhasznalok` (`Id`);

--
-- Megkötések a táblához `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Rendel_id`) REFERENCES `rendelesek` (`Id`);

--
-- Megkötések a táblához `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  ADD CONSTRAINT `pizza_tervezo_ibfk_1` FOREIGN KEY (`Rendeles_id`) REFERENCES `rendelesek` (`Id`);

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`Felhasz_id`) REFERENCES `felhasznalok` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
