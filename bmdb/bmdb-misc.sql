--ch 7
-- update and delete
SELECT *
	FROM Movie
-- insert a test/dummy record
INSERT INTO Movie (Title, Year, Rating, Director)
VALUES ('Test', 2025,'R','Test Director')

SELECT *
	From Movie
	WHERE ID = 3

--update test movie to test movie 2, year 2026
UPDATE Movie
	SET Title = 'Test 2',
		Year = 2026
	WHERE ID = 3

-- delete
DELETE MOVIE
	WHERE ID = 3

SELECT *
	FROM Movie

--Actor Table
SELECT *
	FROM Actor
INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
VALUES ('Will', 'Ferrell','M', '1967-07-16'),
	   ('Zooey', 'Deschanel','F', '1980-01-17'),
	   ('Peter', 'Dinklage','M', '1969-06-11'),
	   ('John C.', 'Reilly','M', '1969-06-11'),
	   ('Mary', 'Steenburgen','F', '1953-02-08');

--add credit
SELECT *
	FROM Movie
SELECT *
	FROM Actor
--credits
--Elf (4)
--Will Ferrell (1) - Buddy
--Zooey Deschanel (2) -Jovie
--Peter Dinklage (3) - Miles Finch
--Mary Steenburgen (5) - Emily Hobbs
--Step Brothers (3) 
--Will Ferrell (1) - Brennan Huff
--John C. Reilly (4) - Dale Dobak
--Mary Steenburgen (5) - Nancy Huff

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(4, 1, 'Buddy'),
	(4, 2, 'Jovie'),
	(4, 3, 'Miles Finch'),
	(4, 5, 'Emily Hobbs'),
	(3, 1, 'Brennan Huff'),
	(3, 4, 'Dale Dobak'),
	(3, 5, 'Nancy Huff');

SELECT *
	FROM Credit

-- show credits -- movie, actor, and role
SELECT Title, CONCAT(FirstName, ', ', LastName) AS Actor, Role
	FROM Credit C
	JOIN Movie M ON M.ID = C.MovieID
	JOIN Actor A ON A.ID = C.ActorID

--copy the movie tabl into MovieCopy
SELECT *
	INTO MovieCopy
	FROM Movie