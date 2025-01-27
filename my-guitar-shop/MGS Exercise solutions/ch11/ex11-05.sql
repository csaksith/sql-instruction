USE MyWebDb;

ALTER TABLE Users
ALTER COLUMN FirstName VARCHAR(20) NOT NULL;

UPDATE Users
SET FirstName = NULL
WHERE UserID = 1;

UPDATE Users
SET FirstName = 'Robert Charles Halliday'
WHERE UserID = 1;