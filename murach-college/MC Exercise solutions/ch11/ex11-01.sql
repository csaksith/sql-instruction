USE master;
GO

IF DB_ID('MyBookDB') IS NOT NULL
  DROP DATABASE MyBookDB
GO

CREATE DATABASE MyBookDB;
GO

USE MyBookDB;

CREATE TABLE Users (
  UserID       INT          PRIMARY KEY,
  EmailAddress VARCHAR(100) NOT NULL,
  FirstName    VARCHAR(25)  NOT NULL,
  LastName     VARCHAR(42)  NOT NULL
);

CREATE TABLE Books (
  BookID   INT         PRIMARY KEY,
  BookName VARCHAR(45) UNIQUE
);

CREATE TABLE Downloads (
  DownloadID   INT          PRIMARY KEY,
  UserID       INT          NOT NULL,
  DownloadDate DATETIME2    NOT NULL,
  Filename     VARCHAR(50)  NOT NULL,
  BookID       INT          NOT NULL,
  CONSTRAINT FK_DownloadsUsers
    FOREIGN KEY (UserID )
    REFERENCES Users (UserID),
  CONSTRAINT FK_DownloadsBooks
    FOREIGN KEY (BookID )
    REFERENCES Books (BookID)
);

CREATE INDEX IX_UserID
	ON Downloads (UserID);

CREATE INDEX IX_BookID
	ON Downloads (BookID);

