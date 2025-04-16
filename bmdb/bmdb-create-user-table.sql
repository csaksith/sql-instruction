-- add user table to bmdb
USE bmdb;
GO

CREATE TABLE [User] (
	Id				int PRIMARY KEY IDENTITY(1,1),
	Username		varchar(20) NOT NULL UNIQUE,
	Password		varchar(10) NOT NULL,
	FirstName		varchar(20) NOT NULL,
	LastName		varchar(20) NOT NULL,
	PhoneNumber		varchar(12) NOT NULL,
	Email			varchar(75) NOT NULL
);

INSERT INTO [User] (Username, Password, FirstName, LastName, PhoneNumber, Email)
VALUES ('hgilmore', 'pwd', 'Happy', 'Gilmore', '555-111-2345', 'happy@newmovie.com');

SELECT * FROM [User];