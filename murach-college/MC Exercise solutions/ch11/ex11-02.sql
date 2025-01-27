USE MyBookDB;

INSERT INTO Users VALUES 
(1, 'johnsmith@gmail.com', 'John', 'Smith'),
(2, 'janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO Books VALUES 
(1, 'Murach''s SQL Server 2019'),
(2, 'Murach''s Python Programming');

INSERT INTO Downloads VALUES 
(1, 1, GETDATE(), 'sq19_allfiles.exe', 1), 
(2, 2, GETDATE(), 'sq19_ch03.pdf', 1), 
(3, 2, GETDATE(), 'python_allfiles.zip', 2);

SELECT u.EmailAddress, u.FirstName, u.LastName,
       d.DownloadDate, d.Filename, 
       b.BookName
FROM Users u
  JOIN Downloads d
    ON u.UserID = d.UserID
  JOIN Books b
    ON d.BookID = b.BookID
ORDER BY u.EmailAddress DESC, BookName;