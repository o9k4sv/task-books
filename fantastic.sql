--
-- Вывод книг и авторов для жанра "Фантастика" 
--
SELECT `book`.`id`, `book`.`title`, GROUP_CONCAT(`author`.`name`, ' ', `author`.`lastname`) `authors` 
  FROM `book` 
  JOIN `book_genre` ON `book`.`id` = `book_genre`.`book_id` 
  JOIN `book_author` ON `book`.`id` = `book_author`.`book_id` 
  JOIN `author` ON `author`.`id` = `book_author`.`author_id` 
  JOIN `genre` ON `genre`.`id` = `book_genre`.`genre_id` 
  WHERE `genre`.`title` = 'Фантастика'
  GROUP BY `book`.`id`, `book`.`title`;