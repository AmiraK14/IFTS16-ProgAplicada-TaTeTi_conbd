-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2022 a las 22:45:36
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mijuego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL,
  `idioma` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `idioma`) VALUES
(1, 'espanol'),
(2, 'ingles'),
(3, 'aleman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje_x_idioma`
--

CREATE TABLE `mensaje_x_idioma` (
  `id` int(11) NOT NULL,
  `id_idioma` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensaje_x_idioma`
--

INSERT INTO `mensaje_x_idioma` (`id`, `id_idioma`, `mensaje`) VALUES
(1, 1, 'BIENVENIDO AL TA-TE-TI VIRTUAL'),
(2, 2, 'WELCOME TO VIRTUAL TIC-TAC-TOE'),
(3, 3, 'WILKOMMEN ZUM VIRTUELLEN TIC-TAC-TOE'),
(4, 1, 'Ingrese su nombre:'),
(5, 2, 'Enter your name:'),
(6, 3, 'Gib deinen Namen ein:'),
(7, 1, 'usted usará las CRUCES (X)'),
(8, 2, 'you\'ll play with the Xs'),
(9, 3, 'Sie werden mit Kreuzen (X) spielen'),
(10, 1, 'Deberá ingresar un valor entre 0 y 2 para elegir la fila y columna de la casilla elegida'),
(11, 2, 'You must enter a number between 0 and 2 in aim to select the row and column of the chosen space of the grid'),
(12, 3, 'Sie müssen einen Wert zwischen 0 und 2 eingeben, um die Zeile und Spalte des ausgewählten Felds auszuwählen'),
(13, 1, 'Que empiece el juego!!'),
(14, 2, 'Let\'s start!!'),
(15, 3, 'Lasst uns beginnen!!'),
(16, 1, 'Computadora'),
(17, 2, 'Computer'),
(18, 3, 'Computer'),
(19, 1, 'GANA'),
(20, 2, 'WINS'),
(21, 3, 'GEWINNT'),
(22, 1, 'puntos'),
(23, 2, 'points'),
(24, 3, 'Punkte'),
(25, 1, 'Es un EMPATE. Partida finalizada'),
(26, 2, 'It\'s a tie! END GAME'),
(27, 3, 'Es ist eine Krawatte! SPIEL ENDE'),
(28, 1, 'Desea iniciar una nueva partida? Presiona S o N'),
(29, 2, 'Do you want to start a new game? Press Y or N'),
(30, 3, 'Möchten Sie ein neues Spiel starten? Drücken Sie J oder N'),
(31, 1, 'S'),
(32, 2, 'Y'),
(33, 3, 'J'),
(34, 1, 'FIN DEL JUEGO'),
(35, 2, 'END GAME'),
(36, 3, 'ENDSPIELE'),
(37, 1, 'Resultados finales'),
(38, 2, 'Final results'),
(39, 3, 'Endgültige Ergebnisse'),
(40, 1, 'Fila'),
(41, 2, 'Row'),
(42, 3, 'Zeile'),
(43, 1, 'Columna'),
(44, 2, 'Column'),
(45, 3, 'Spalte'),
(46, 1, 'La ubicacion seleccionada debe estar entre los valores 0 y 2. Intentelo nuevamente.'),
(47, 2, 'The chosen space must be between number 0 and 2. Try again'),
(48, 3, 'Das gewählte Feld muss zwischen den Zahlen 0 und 2 liegen. Versuchen Sie es nochmal'),
(49, 1, 'Ubicacion ocupada. Intentelo nuevamente.'),
(50, 2, 'That space was already played! Try again'),
(51, 3, 'Das gewählte Feld ist keines freies! Versuchen Sie es nochmal'),
(52, 1, 'juega'),
(53, 2, 'plays'),
(54, 3, 'spielt'),
(55, 1, '¿Qué desea hacer? 1.Empezar una nueva partida // 2.Ver histórico de partidas'),
(56, 2, 'What would you like to do? 1.Start a new game // 2.View match history'),
(57, 3, 'Was möchten Sie tun? 1.Starte ein neues Spiel, 2.Spielverlauf anzeigen'),
(58, 1, 'FECHA'),
(59, 2, 'DATE'),
(60, 3, 'JAHRESZAHL'),
(61, 1, 'PUNTAJE ACTUALIZADO'),
(62, 2, 'UPDATED SCORE'),
(63, 3, 'AKTUALISIERTE ERGEBNISSE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

CREATE TABLE `partidas` (
  `id` int(11) NOT NULL,
  `puntosComputadora` int(11) NOT NULL,
  `puntosJugador` int(11) NOT NULL,
  `nombreJugador` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id`, `puntosComputadora`, `puntosJugador`, `nombreJugador`, `fecha`) VALUES
(1, 0, 3, 'Amira', '2022-10-10'),
(2, 1, 3, 'Torterolo', '2022-10-10'),
(3, 2, 4, 'Jazmin', '2022-10-10'),
(4, 2, 2, 'Amira', '2022-10-23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje_x_idioma`
--
ALTER TABLE `mensaje_x_idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mensaje_x_idioma`
--
ALTER TABLE `mensaje_x_idioma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
