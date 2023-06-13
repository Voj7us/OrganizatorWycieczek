-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Cze 2023, 17:44
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `trasy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakopanem`
--

CREATE TABLE `zakopanem` (
  `Nazwa` varchar(255) NOT NULL,
  `Długość` varchar(255) NOT NULL,
  `Trudność` varchar(255) NOT NULL,
  `PunktyOrientacyjne` varchar(255) NOT NULL,
  `Opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zakopanem`
--

INSERT INTO `zakopanem` (`Nazwa`, `Długość`, `Trudność`, `PunktyOrientacyjne`, `Opis`) VALUES
('Szlak na Giewont:', 'około 9 km (w obie strony)', 'średnia', 'Dolina Małej Łąki, Przełęcz Kondracka, Przełęcz Krzyżne', 'Na tej trasie możesz podziwiać malownicze widoki na Tatry, a na Giewoncie znajduje się kaplica Matki Boskiej Częstochowskiej.'),
('Dolina Kościeliska:', 'około 8 km (w obie strony)', 'łatwa', 'Schronisko na Hali Ornak, Jaskinia Mylna', 'Dolina Kościeliska oferuje urocze krajobrazy, strumienie i liczne skały. Można również odwiedzić Jaskinię Mylną, która jest dostępna dla turystów.\r\n '),
('Dolina Chochołowska:', 'około 14 km (w obie strony)', 'łatwa', 'Schronisko na Polanie Chochołowskiej, Wodogrzmoty Mickiewicza', 'Dolina Chochołowska jest jedną z najdłuższych i najpiękniejszych dolin w Tatrach. Na trasie można podziwiać malownicze widoki oraz imponujące wodospady - Wodogrzmoty Mickiewicza.\r\n'),
('Dolina Pięciu Stawów Polskich:', 'około 10 km (w obie strony)', 'średnia', 'Schronisko PTTK w Dolinie Pięciu Stawów, Wielki Staw Polski', 'Dolina Pięciu Stawów Polskich to jedno z najpiękniejszych miejsc w Tatrach. Trasa prowadzi przez górskie potoki, skaliste ścieżki i zielone łąki, a na końcu znajduje się imponujący Wielki Staw Polski, otoczony majestatycznymi szczytami. To idealne miejsce do odpoczynku i kontemplacji przyrody.\r\n'),
('Szlak na Rysy:', 'około 9 km (w obie strony)', 'trudna', ' Przełęcz pod Kopą, Rysy (szczyt)', 'Rysy to najwyższy szczyt Tatr Polskich i jedno z najpopularniejszych miejsc do wspinaczki. Trasa jest wymagająca, ale nagrodą są spektakularne widoki z góry. Wspinaczka na Rysy wymaga pewnych umiejętności i doświadczenia.\r\n'),
('Szlak na Kasprowy Wierch:', 'około 8 km (w obie strony)', 'łatwa', 'Polana Kondratowa, Kasprowy Wierch (szczyt)', 'Kasprowy Wierch to popularny szczyt w Tatrach Zachodnich. Można tam dotrzeć kolejką linową lub pieszo. Trasa piesza prowadzi przez piękne tereny górskie, a na szczycie można podziwiać panoramę Tatr i okolicznych regionów.\r\n'),
('Morskie Oko:', 'około 8 km (w obie strony)', 'łatwa', 'Schronisko przy Morskim Oku, Jezioro Morskie Oko', 'Morskie Oko to największe i najbardziej znane jezioro w Tatrach. Trasa prowadzi przez malownicze tereny i kończy się przy samym jeziorze, gdzie można podziwiać jego piękno.\r\n '),
('Szlak na Giewont', 'około 9 km (w obie strony)', 'średnia', 'Dolina Małej Łąki, Przełęcz Kondracka, Przełęcz Kr...', 'Na tej trasie możesz podziwiać malownicze widoki n...'),
('Szlak na Rysy', 'około 24 km (w obie strony)', 'trudna', 'Dolina Pięciu Stawów, Przełęcz pod Chłopkiem, Wyżnia Kopa Kondracka', 'To jedna z najtrudniejszych tras w Tatrach, prowadząca na najwyższy szczyt w Polsce...'),
('Szlak na Kasprowy Wierch', 'około 8 km (w obie strony)', 'łatwa', 'Polana Kondratowa, Kasprowy Wierch (szczyt)', 'Kasprowy Wierch to popularny szczyt w Tatrach Zachodnich...'),
('Szlak na Świnicę', 'około 6 km (w obie strony)', 'łatwa', 'Dolina Gąsienicowa, Świnicka Przełęcz', 'Świnica to popularny szczyt w Tatrach Wysokich...'),
('Szlak na Morskie Oko', 'około 8 km (w obie strony)', 'łatwa', 'Dolina Rybiego Potoku, Morskie Oko (jezioro)', 'Morskie Oko jest jednym z najpiękniejszych jezior w Tatrach...'),
('Szlak na Dolinę Chochołowską', 'około 10 km (w obie strony)', 'łatwa', 'Siwa Polana, Dolina Chochołowska', 'Dolina Chochołowska to jedna z najdłuższych dolin tatrzańskich...'),
('Szlak na Gąsienicową Czubę', 'około 7 km (w obie strony)', 'średnia', 'Dolina Gąsienicowa, Gąsienicowa Czuba', 'Gąsienicowa Czuba to wybitny szczyt w Tatrach...'),
('Szlak na Kasprowy Wierch z Kuźnic', 'około 10 km (w obie strony)', 'łatwa', 'Kuźnice, Polana Kondratowa, Kasprowy Wierch (szczyt)', 'To jedna z popularnych tras na Kasprowy Wierch...'),
('Szlak na Zawrat', 'około 12 km (w obie strony)', 'trudna', 'Dolina Pięciu Stawów, Przełęcz pod Kopą, Przełęcz Zawrat', 'Zawrat to wybitna przełęcz w Tatrach Wysokich...'),
('Szlak na Czerwone Wierchy', 'około 14 km (w obie strony)', 'średnia', 'Polana Chochołowska, Przełęcz między Kopami, Czerwone Wierchy', 'Czerwone Wierchy to malownicze pasmo w Tatrach Zachodnich...'),
('Szlak na Rakoń', 'około 6 km (w obie strony)', 'łatwa', 'Polana Strążyska, Rakoń', 'Rakoń to niewielki, ale urokliwy szczyt w Tatrach Zachodnich...'),
('Szlak na Kozi Wierch', 'około 10 km (w obie strony)', 'średnia', 'Kuźnice, Dolina Kondratowa, Kozi Wierch', 'Kozi Wierch to jeden ze znanych szczytów w Tatrach Zachodnich...'),
('Szlak na Gęsia Szyję', 'około 8 km (w obie strony)', 'trudna', 'Dolina Małej Łąki, Gęsia Szyja', 'Gęsia Szyja to trudny i wymagający szczyt w Tatrach Zachodnich...'),
('Szlak na Starorobociański Wierch', 'około 14 km (w obie strony)', 'średnia', 'Palenica Białczańska, Dolina Roztoki, Starorobociański Wierch', 'Starorobociański Wierch to znany szczyt w Tatrach Zachodnich...'),
('Szlak na Mnicha', 'około 18 km (w obie strony)', 'trudna', 'Dolina Rybiego Potoku, Przełęcz między Kopami, Mnich', 'Mnich to imponujący i wymagający szczyt w Tatrach...'),
('Szlak na Rysy od słowackiej strony', 'około 16 km (w obie strony)', 'trudna', 'Tatrzański Park Narodowy (Słowacja), Schronisko Chata pri Zelenom plese, Rysy', 'To jeden z najpopularniejszych szlaków na Rysy, prowadzący od słowackiej strony...');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
