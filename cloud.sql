-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2025 a las 23:40:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cloud`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_activate_user` (IN `p_id` INT)   BEGIN
    UPDATE user SET state = 1 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_game` (IN `p_gamename` VARCHAR(255), IN `p_created_by` VARCHAR(100))   BEGIN
    INSERT INTO games (gamename, created_by, state)
    VALUES (p_gamename, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_game_score` (IN `p_game_id` INT, IN `p_time` INT, IN `p_score` INT, IN `p_user_id` INT)   BEGIN
    INSERT INTO game_scores (game_id, time, score, user_id, state)
    VALUES (p_game_id, p_time, p_score, p_user_id, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_state_type` (IN `p_name` VARCHAR(100), IN `p_created_by` VARCHAR(100))   BEGIN
    INSERT INTO state_type (name, created_by, state)
    VALUES (p_name, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_user` (IN `p_username` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_created_by` VARCHAR(100))   BEGIN
    INSERT INTO user (username, password, created_by, state)
    VALUES (p_username, p_password, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_user_token` (IN `p_user_id` INT, IN `p_token` VARCHAR(255), IN `p_login_attempts` INT, IN `p_last_login` DATETIME, IN `p_created_by` VARCHAR(100))   BEGIN
    INSERT INTO user_tokens (user_id, token, login_attempts, last_login, created_by, state)
    VALUES (p_user_id, p_token, p_login_attempts, p_last_login, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_game` (IN `p_id` INT)   BEGIN
    UPDATE games SET state = 3 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_game_score` (IN `p_id` INT)   BEGIN
    UPDATE game_scores SET state = 3 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_state_type` (IN `p_id` TINYINT)   BEGIN
    UPDATE state_type SET state = 3 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_user` (IN `p_id` INT)   BEGIN
    UPDATE user SET state = 3 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_user_token` (IN `p_id` INT)   BEGIN
    UPDATE user_tokens SET state = 3 WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_games` ()   BEGIN
    SELECT * FROM games WHERE state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_game_scores` ()   BEGIN
    SELECT * FROM game_scores WHERE state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_state_types` ()   BEGIN
    SELECT * FROM state_type WHERE state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_users` ()   BEGIN
    SELECT * FROM user WHERE state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_tokens` ()   BEGIN
    SELECT * FROM user_tokens WHERE state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user` (IN `p_username` VARCHAR(100), IN `p_password` VARCHAR(255))   BEGIN
    SELECT id, username
    FROM user
    WHERE username = p_username
      AND password = p_password
      AND state = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_game` (IN `p_id` INT, IN `p_gamename` VARCHAR(255), IN `p_modified_by` VARCHAR(100))   BEGIN
    UPDATE games
    SET gamename = p_gamename,
        modified_by = p_modified_by
    WHERE id = p_id AND state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_game_score` (IN `p_id` INT, IN `p_time` INT, IN `p_score` INT)   BEGIN
    UPDATE game_scores
    SET time = p_time,
        score = p_score
    WHERE id = p_id AND state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_state_type` (IN `p_id` TINYINT, IN `p_name` VARCHAR(100), IN `p_modified_by` VARCHAR(100))   BEGIN
    UPDATE state_type
    SET name = p_name,
        modified_by = p_modified_by
    WHERE id = p_id AND state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user` (IN `p_id` INT, IN `p_username` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_modified_by` VARCHAR(100))   BEGIN
    UPDATE user
    SET username = p_username,
        password = p_password,
        modified_by = p_modified_by
    WHERE id = p_id AND state <> 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user_token` (IN `p_id` INT, IN `p_token` VARCHAR(255), IN `p_login_attempts` INT, IN `p_last_login` DATETIME, IN `p_modified_by` VARCHAR(100))   BEGIN
    UPDATE user_tokens
    SET token = p_token,
        login_attempts = p_login_attempts,
        last_login = p_last_login,
        modified_by = p_modified_by
    WHERE id = p_id AND state <> 3;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `gamename` varchar(255) NOT NULL COMMENT 'Game Name',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Created At',
  `created_by` varchar(100) DEFAULT NULL COMMENT 'Created By',
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Modified At',
  `modified_by` varchar(100) DEFAULT NULL COMMENT 'Modified By'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores game information';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game_scores`
--

CREATE TABLE `game_scores` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `game_id` int(11) NOT NULL COMMENT 'Foreign Key to games',
  `time` int(11) NOT NULL COMMENT 'Time (seconds or ms, según tu lógica)',
  `score` int(11) NOT NULL COMMENT 'Score',
  `user_id` int(11) NOT NULL COMMENT 'Foreign Key to users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores scores for each game and user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_type`
--

CREATE TABLE `state_type` (
  `id` tinyint(4) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `state_type`
--

INSERT INTO `state_type` (`id`, `description`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(0, 'Inactivo', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL),
(1, 'Activo', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL),
(2, 'Bloqueado', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL),
(3, 'Eliminado', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL),
(4, 'Suspendido temporalmente', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL),
(5, 'Suspendido permanentemente', '2025-05-26 15:00:41', NULL, '2025-05-26 15:00:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(100) DEFAULT NULL,
  `state` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `user_id` int(11) NOT NULL COMMENT 'Foreign Key to Users',
  `token` varchar(255) NOT NULL COMMENT 'Authentication Token',
  `login_attempts` int(11) DEFAULT 0 COMMENT 'Login Attempts',
  `last_login` datetime DEFAULT NULL COMMENT 'Last Login Time',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Created At',
  `created_by` varchar(100) DEFAULT NULL COMMENT 'Created By',
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Modified At',
  `modified_by` varchar(100) DEFAULT NULL COMMENT 'Modified By'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores user tokens and login information';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `game_scores`
--
ALTER TABLE `game_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `state_type`
--
ALTER TABLE `state_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT de la tabla `game_scores`
--
ALTER TABLE `game_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `game_scores`
--
ALTER TABLE `game_scores`
  ADD CONSTRAINT `game_scores_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `game_scores_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state_type` (`id`);

--
-- Filtros para la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
