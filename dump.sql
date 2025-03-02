-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Мар 02 2025 г., 18:18
-- Версия сервера: 9.2.0
-- Версия PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_books`
--
CREATE DATABASE IF NOT EXISTS `db_books` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_books`;

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `lastname`) VALUES
(1, 'Льюис', 'Кэрролл'),
(2, 'Джон Рональд Руэл', 'Толкин'),
(3, 'Айн', 'Рэнд'),
(4, 'Фёдор', 'Достоевский'),
(5, 'Артур Конан', 'Дойл'),
(6, 'Аркадий', 'Стругацкий'),
(7, 'Борис', 'Стругацкий');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `page_count` int NOT NULL,
  `date_publish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `title`, `isbn`, `page_count`, `date_publish`) VALUES
(1, 'Хоббит', '978-5-457-19428-1', 256, '1937-09-21'),
(2, 'Атлант расправил плечи', '978-5-9614-2004-3', 1131, '1957-10-10'),
(3, 'Записки о Шерлоке Холмсе', '978-5-04-041870-1', 448, '1894-02-01'),
(4, 'Алиса в Стране чудес', '978-5-457-05301-4', 112, '1865-07-04'),
(5, 'Преступление и наказание', '978-5-04-116676-2', 672, '1866-07-02'),
(6, 'Алиса в Зазеркалье', '978-5-04-175682-6', 181, '1871-01-01'),
(7, 'Собака Баскервилей', '978-5-04-200381-3', 176, '1901-08-05'),
(8, 'Властелин Колец: Братство кольца', '978-5-17-110164-0', 480, '1954-07-29'),
(9, 'Властелин Колец: Две крепости', '978-5-04-018239-8', 384, '1954-11-11'),
(10, 'Властелин Колец: Возвращение короля', '978-5-17-112287-4', 384, '1955-10-20'),
(11, 'Пикник на обочине', '978-5-4250-4020-6', 256, '1972-03-14');

-- --------------------------------------------------------

--
-- Структура таблицы `book_author`
--

CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book_author`
--

INSERT INTO `book_author` (`book_id`, `author_id`) VALUES
(1, 2),
(8, 2),
(9, 2),
(10, 2),
(2, 3),
(3, 5),
(7, 5),
(4, 1),
(6, 1),
(5, 4),
(11, 6),
(11, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `book_genre`
--

CREATE TABLE `book_genre` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book_genre`
--

INSERT INTO `book_genre` (`book_id`, `genre_id`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 3),
(6, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `title`) VALUES
(1, 'Фантастика'),
(2, 'Детектив'),
(3, 'Роман');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD KEY `autor_id` (`author_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `book_genre_ibfk_2` (`genre_id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
