-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 25. 23:46
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
-- Tábla szerkezet ehhez a táblához `pizza_tervezo`
--

CREATE TABLE `pizza_tervezo` (
  `Id` int(11) NOT NULL,
  `Feltet` varchar(255) NOT NULL,
  `Rendeles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizza_tervezo`
--

INSERT INTO `pizza_tervezo` (`Id`, `Feltet`, `Rendeles_id`) VALUES
(1, 'mozzarella', 3),
(2, 'mozzarella, cheddar, sonka, szalámi, szalonna gomba, tonhal, ananász, kukorica', 4);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Rendeles_id` (`Rendeles_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `pizza_tervezo`
--
ALTER TABLE `pizza_tervezo`
  ADD CONSTRAINT `pizza_tervezo_ibfk_1` FOREIGN KEY (`Rendeles_id`) REFERENCES `rendelesek` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
