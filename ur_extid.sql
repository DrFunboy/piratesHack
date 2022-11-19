-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 19 2022 г., 11:20
-- Версия сервера: 5.6.43-84.3-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sportcrm_uroboro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ur_extid`
--

CREATE TABLE `ur_extid` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `extype` int(11) NOT NULL DEFAULT '0',
  `extid` bigint(20) UNSIGNED DEFAULT NULL,
  `extoken` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duedate` datetime DEFAULT NULL,
  `extended` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ur_extid`
--

INSERT INTO `ur_extid` (`id`, `parent`, `extype`, `extid`, `extoken`, `created`, `duedate`, `extended`) VALUES
(1, 0, 154, 188, NULL, '2022-11-18 13:23:28', NULL, NULL),
(2, 1, 155, 1, NULL, '2022-11-18 14:18:49', NULL, NULL),
(3, 2, 155, 1, NULL, '2022-11-18 20:41:24', NULL, NULL),
(8, 0, 240, NULL, NULL, '2022-11-19 06:27:35', NULL, '{\"time\":1668839270670,\"blocks\":[{\"id\":\"extendedTmpl_h3\",\"type\":\"header\",\"data\":{\"text\":\"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a\",\"level\":3},\"tunes\":{\"anchorTune\":[]}},{\"id\":\"PQeLFTG5nQ\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"\\/files\\/_thumb\\/image\\/ur_6378775b594d20.96386906.png.md.jpeg\",\"key\":\"ur_6378775b594d20.96386906\"},\"caption\":\"\\u041b\\u043e\\u0433\\u043e\\u0442\\u0438\\u043f\\u044b\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}}],\"version\":\"2.25.0\"}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ur_extid`
--
ALTER TABLE `ur_extid`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_extparent` (`parent`,`extype`,`extid`,`extoken`),
  ADD KEY `extid` (`extid`,`extype`),
  ADD KEY `extoken` (`extoken`,`extype`),
  ADD KEY `duedate` (`duedate`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ur_extid`
--
ALTER TABLE `ur_extid`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
