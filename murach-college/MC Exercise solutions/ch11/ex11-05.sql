USE MyBookDB;

ALTER TABLE Users
ADD UNIQUE (EmailAddress);

UPDATE Users
SET EmailAddress = 'janedoe@yahoo.com'
WHERE UserID = 1;