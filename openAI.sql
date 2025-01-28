create database books;
use books;

-- Drop tables if they exist
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
-- Create authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);
-- Create books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    publish_date DATE,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);
-- Populate authors table with 30 rows of data
INSERT INTO authors (first_name, last_name, birth_date, nationality) VALUES
('John', 'Smith', '1970-05-10', 'American'),
('Emily', 'Johnson', '1982-03-15', 'British'),
('Michael', 'Brown', '1965-07-22', 'Canadian'),
('Sophia', 'Davis', '1990-11-30', 'Australian'),
('Daniel', 'Wilson', '1978-04-12', 'Irish'),
('Olivia', 'Taylor', '1985-08-19', 'American'),
('James', 'Anderson', '1955-02-02', 'British'),
('Emma', 'Thomas', '1992-10-05', 'New Zealander'),
('Liam', 'White', '1988-06-17', 'Canadian'),
('Isabella', 'Moore', '1980-09-28', 'Australian'),
('Noah', 'Martin', '1975-12-13', 'Irish'),
('Mia', 'Thompson', '1995-01-25', 'American'),
('Lucas', 'Garcia', '1968-05-21', 'Mexican'),
('Amelia', 'Martinez', '1993-07-03', 'Spanish'),
('Ethan', 'Robinson', '1981-09-09', 'Canadian'),
('Charlotte', 'Clark', '1986-04-07', 'Australian'),
('William', 'Rodriguez', '1990-02-17', 'American'),
('Ava', 'Lewis', '1977-10-10', 'British'),
('Alexander', 'Walker', '1962-06-19', 'Irish'),
('Harper', 'Hall', '1998-12-29', 'American'),
('Benjamin', 'Allen', '1983-11-11', 'British'),
('Ella', 'Young', '1991-08-25', 'Australian'),
('Henry', 'Hernandez', '1976-03-31', 'Mexican'),
('Grace', 'King', '1989-07-14', 'Canadian'),
('Jack', 'Wright', '1963-01-01', 'American'),
('Sofia', 'Lopez', '1984-06-05', 'Spanish'),
('Samuel', 'Hill', '1969-09-18', 'Irish'),
('Chloe', 'Scott', '1996-02-22', 'Australian'),
('Logan', 'Green', '1987-03-15', 'American'),
('Abigail', 'Adams', '1994-08-01', 'British');

-- Populate books table with 30 rows of data
INSERT INTO books (title, genre, publish_date, author_id) VALUES
('The Journey Begins', 'Fiction', '2005-05-01', 1),
('A Tale of Time', 'Fantasy', '2008-09-12', 2),
('Hidden Realms', 'Adventure', '2011-03-24', 3),
('The Last Horizon', 'Science Fiction', '2013-07-18', 4),
('Echoes of Eternity', 'Historical Fiction', '2016-11-22', 5),
('Whispers in the Dark', 'Thriller', '2002-04-10', 6),
('Dreams of Tomorrow', 'Romance', '2009-08-14', 7),
('The Lost Treasure', 'Adventure', '2014-02-28', 8),
('Beyond the Stars', 'Science Fiction', '2017-10-03', 9),
('Fragments of the Past', 'Mystery', '2020-06-12', 10),
('Shadows of the Future', 'Fiction', '2007-12-30', 1),
('Legends of the Forest', 'Fantasy', '2012-03-18', 2),
('The Secret Island', 'Adventure', '2015-08-07', 3),
('Through the Portal', 'Science Fiction', '2018-01-25', 4),
('The Forgotten Path', 'Historical Fiction', '2021-09-09', 5),
('The Silent Witness', 'Thriller', '2006-04-21', 6),
('Hearts Entwined', 'Romance', '2010-11-17', 7),
('The Hidden Map', 'Adventure', '2013-05-30', 8),
('Across the Universe', 'Science Fiction', '2016-09-19', 9),
('Pieces of Yesterday', 'Mystery', '2019-12-11', 10),
('Beyond the Horizon', 'Fiction', '2004-06-05', 11),
('Chronicles of Avalon', 'Fantasy', '2008-02-29', 12),
('The Mystic Quest', 'Adventure', '2011-07-10', 13),
('Parallel Worlds', 'Science Fiction', '2014-11-03', 14),
('The Timeless Journey', 'Historical Fiction', '2018-04-27', 15),
('Beneath the Shadows', 'Thriller', '2009-09-15', 16),
('Bound by Destiny', 'Romance', '2013-02-08', 17),
('The Hidden Cavern', 'Adventure', '2017-06-22', 18),
('Voyage of Discovery', 'Science Fiction', '2021-03-14', 19),
('Echoes of the Heart', 'Romance', '2015-08-30', 20);

select * from authors;
select * from books;

select auth.author_id, auth.first_name, auth.last_name, auth.birth_date, auth.nationality, bk.book_id, bk.title, bk.genre, bk.publish_date
	from authors as auth
    right join books as bk
    on auth.author_id = bk.author_id;

SELECT b.title, b.genre, b.publish_date
	FROM books b
    JOIN authors a
    ON b.author_id = a.author_id
    WHERE a.first_name = 'John' AND a.last_name = 'Smith';



