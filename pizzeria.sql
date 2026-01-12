-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 12. 22:36
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kupon`
--

CREATE TABLE `kupon` (
  `Id` int(11) NOT NULL,
  `Kod` varchar(12) NOT NULL,
  `Felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza_tervezo`
--

CREATE TABLE `pizza_tervezo` (
  `Id` int(11) NOT NULL,
  `Feltet` varchar(30) NOT NULL,
  `Rendeles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `Id` int(11) NOT NULL,
  `Nev` varchar(35) NOT NULL,
  `Lakcim` varchar(50) NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `Osszeg` decimal(10,2) NOT NULL,
  `Egyedi` varchar(40) NOT NULL,
  `Felhasz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kupon`
--
ALTER TABLE `kupon`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `menu`
--
ALTER TABLE `menu`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

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
