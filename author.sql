--
-- Вывод имени автора с наибольшим числом книг
--
SELECT `author_id`, CONCAT_WS(' ', `name`, `lastname`) `author_name`
  FROM `book_author` 
  JOIN `author` ON `author`.`id` = `book_author`.`author_id` 
  GROUP BY `author_id` 
  ORDER BY COUNT(`book_id`) 
  DESC LIMIT 1;