
--
-- Создание таблицы языков
--

CREATE TABLE IF NOT EXISTS language (
    ID varchar(100) not null,
    NAME varchar(100) not null,
    PRIMARY KEY (ID)
);

--
-- Создание таблицы с названиями фильмов на нескольких языках
--

CREATE TABLE IF NOT EXISTS movie_title
(
    MOVIE_ID int not null,
    LANGUAGE_ID varchar(100) not null,
    TITLE varchar(100) not null,

    FOREIGN KEY FK_LANGUAGE_KEY (LANGUAGE_ID)
    REFERENCES language(ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

--
-- Заполнением таблицы языков значениями (российский, английский и украинский языки)
--

INSERT INTO language (ID, NAME)
VALUES ('ru', 'русский'),
       ('en', 'английский'),
       ('uk', 'мова');



--
-- Добавление названий фильмов на других языках
--
INSERT INTO movie_title (MOVIE_ID, LANGUAGE_ID, TITLE)
VALUES  (1,'en','The Terminator'),
        (1,'uk','Термінатор'),
        (2,'en','Alien'),
        (2,'uk','Чужий'),
        (3,'en','The Thing'),
        (3,'uk','Щось'),
        (4,'en','The Shining'),
        (4,'uk','Сяйво'),
        (5,'en','Avatar'),
        (6,'uk','Аватара');


--
-- Копирование из оригинальной (изначальной) таблицы movie названий фильмов на русском языке
--
INSERT INTO movie_title (MOVIE_ID, LANGUAGE_ID, TITLE) SELECT movie.ID, 'ru', movie.TITLE FROM movie;

--
-- Выборка, сортируемая по ID
--
SELECT * FROM movie_title ORDER BY MOVIE_ID;

--
-- Удаление колонки с TITLE
--
ALTER TABLE movie DROP COLUMN TITLE;


