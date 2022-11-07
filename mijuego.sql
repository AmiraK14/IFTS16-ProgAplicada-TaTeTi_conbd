-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2022 a las 04:11:38
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
(1, 2, 'WELCOME TO VIRTUAL TIC-TAC-TOE'),
(1, 3, 'WILKOMMEN ZUM VIRTUELLEN TIC-TAC-TOE'),
(2, 1, 'Ingrese su nombre:'),
(2, 2, 'Enter your name:'),
(2, 3, 'Gib deinen Namen ein:'),
(3, 1, 'usted usará las CRUCES (X)'),
(3, 2, 'you\'ll play with the Xs'),
(3, 3, 'Sie werden mit Kreuzen (X) spielen'),
(4, 1, 'Deberá ingresar un valor entre 0 y 2 para elegir la fila y columna de la casilla elegida'),
(4, 2, 'You must enter a number between 0 and 2 in aim to select the row and column of the chosen space of the grid'),
(4, 3, 'Sie müssen einen Wert zwischen 0 und 2 eingeben, um die Zeile und Spalte des ausgewählten Felds auszuwählen'),
(5, 1, 'Que empiece el juego!!'),
(5, 2, 'Let\'s start!!'),
(5, 3, 'Lasst uns beginnen!!'),
(6, 1, 'Computadora'),
(6, 2, 'Computer'),
(6, 3, 'Computer'),
(7, 1, 'GANA'),
(7, 2, 'WINS'),
(7, 3, 'GEWINNT'),
(8, 1, 'puntos'),
(8, 2, 'points'),
(8, 3, 'Punkte'),
(9, 1, 'Es un EMPATE. Partida finalizada'),
(9, 2, 'It\'s a tie! END GAME'),
(9, 3, 'Es ist eine Krawatte! SPIEL ENDE'),
(10, 1, 'Desea iniciar una nueva partida? Presiona S o N'),
(10, 2, 'Do you want to start a new game? Press Y or N'),
(10, 3, 'Möchten Sie ein neues Spiel starten? Drücken Sie J oder N'),
(11, 1, 'S'),
(11, 2, 'Y'),
(11, 3, 'J'),
(12, 1, 'FIN DEL JUEGO'),
(12, 2, 'END GAME'),
(12, 3, 'ENDSPIELE'),
(13, 1, 'Resultados finales'),
(13, 2, 'Final results'),
(13, 3, 'Endgültige Ergebnisse'),
(14, 1, 'Fila'),
(14, 2, 'Row'),
(14, 3, 'Zeile'),
(15, 1, 'Columna'),
(15, 2, 'Column'),
(15, 3, 'Spalte'),
(16, 1, 'La ubicacion seleccionada debe estar entre los valores 0 y 2. Intentelo nuevamente.'),
(16, 2, 'The chosen space must be between number 0 and 2. Try again'),
(16, 3, 'Das gewählte Feld muss zwischen den Zahlen 0 und 2 liegen. Versuchen Sie es nochmal'),
(17, 1, 'Ubicacion ocupada. Intentelo nuevamente.'),
(17, 2, 'That space was already played! Try again'),
(17, 3, 'Das gewählte Feld ist keines freies! Versuchen Sie es nochmal'),
(18, 1, 'juega'),
(18, 2, 'plays'),
(18, 3, 'spielt'),
(19, 1, '¿Qué desea hacer? 1.Empezar una nueva partida // 2.Ver histórico de partidas'),
(19, 2, 'What would you like to do? 1.Start a new game // 2.View match history'),
(19, 3, 'Was möchten Sie tun? 1.Starte ein neues Spiel, 2.Spielverlauf anzeigen'),
(20, 1, 'FECHA'),
(20, 2, 'DATE'),
(20, 3, 'JAHRESZAHL'),
(21, 1, 'PUNTAJE ACTUALIZADO'),
(21, 2, 'UPDATED SCORE'),
(21, 3, 'AKTUALISIERTE ERGEBNISSE'),
(22, 1, 'PUNTAJE GUARDADO'),
(22, 2, 'SAVED SCORE'),
(22, 3, 'GESPEICHERTE ERGEBNISSE');

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
(4, 2, 2, 'Amira', '2022-10-23'),
(5, 1, 1, 'Amira', '2022-10-23'),
(6, 1, 2, 'Amira', '2022-11-06'),
(7, 0, 5, 'Amira', '2022-11-06');

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
  ADD PRIMARY KEY (`id`,`id_idioma`);

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
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
