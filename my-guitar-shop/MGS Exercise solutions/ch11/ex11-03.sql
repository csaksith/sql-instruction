USE MyWebDb;

INSERT INTO Users VALUES 
(1, 'johnsmith@gmail.com', 'John', 'Smith'),
(2, 'janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO Products VALUES 
(1, 'Local Music Vol 1'),
(2, 'Local Music Vol 2');

INSERT INTO Downloads VALUES 
(1, 1, GETDATE(), 'petals_are_falling.mp3', 1), 
(2, 2, GETDATE(), 'turn_signal.mp3', 1), 
(3, 2, GETDATE(), 'one_horse_town.mp3', 2);

SELECT u.EmailAddress, u.FirstName, u.LastName,
       d.DownloadDate, d.Filename, 
       p.ProductName
FROM Users u
  JOIN Downloads d
    ON u.UserID = d.UserID
  JOIN Products p
    ON d.ProductID = p.ProductID
ORDER BY u.EmailAddress DESC, ProductName;