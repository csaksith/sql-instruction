--BMDB data
--insert movie records
USE BMDB
GO

SELECT *
	FROM Movie

INSERT INTO Movie (Title, Year, Rating, Director)
VALUES ('Step Brothers', 2008,'R','Adam McKay'),
		('Elf', 2003, 'PG', 'Jon Favreau')
--lab time		
--add 3 movies
INSERT INTO Movie (Title, Year, Rating, Director)
VALUES	('The Substance', 2024, 'R', 'Coralie Fargeat'),
		('Once Upon a Time... in Hollywood', 2019,'R','Quentin Tarantino'),
		('Barbie',2023,'PG-13','Greta Gerwig')
--add 2 actors
INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
VALUES 
    -- The Substance
    ('Demi', 'Moore', 'F', '1962-11-11'),
    ('Margaret', 'Qualley', 'F', '1994-10-23'),

    -- Once Upon a Time in Hollywood
    ('Leonardo', 'DiCaprio', 'M', '1974-11-11'),
    ('Brad', 'Pitt', 'M', '1963-12-18'),

    -- Barbie
    ('Margot', 'Robbie', 'F', '1990-07-02'),
    ('Ryan', 'Gosling', 'M', '1980-11-12');

SELECT *
	FROM Actor
SELECT *
	FROM Credit
SELECT *
	FROM Movie
--credits
INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(3, 1, 'Elizabeth Sparkle'),
	(3, 2, 'Sue'),
	(4, 3, 'Rick Dalton'),
	(4, 4, 'Cliff Booth'),
	(5, 5, 'Barbie'),
	(5, 6, 'Ken');
