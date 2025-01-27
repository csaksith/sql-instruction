USE MyBookDB;

ALTER TABLE Users
ALTER COLUMN EmailAddress VARCHAR(25);

UPDATE Users
SET EmailAddress = 'jonathon.lawrence.anderson@gmail.com'
WHERE UserID = 1;