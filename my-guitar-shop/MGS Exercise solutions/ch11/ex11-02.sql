USE master;
GO

DROP DATABASE IF EXISTS MyWebDb
GO

CREATE DATABASE MyWebDb;
GO

USE MyWebDb;

CREATE TABLE Users (
  UserID       INT          PRIMARY KEY,
  EmailAddress VARCHAR(100) UNIQUE,
  FirstName    VARCHAR(45)  NULL,
  LastName     VARCHAR(45)  NOT NULL
);

CREATE TABLE Products (
  ProductID   INT         PRIMARY KEY,
  ProductName VARCHAR(45) UNIQUE
);

CREATE TABLE Downloads (
  DownloadID   INT         PRIMARY KEY,
  UserID       INT         NOT NULL,
  DownloadDate DATETIME2   NOT NULL,
  Filename     VARCHAR(50) NOT NULL,
  ProductID    INT         NOT NULL,
  CONSTRAINT FK_DownloadsUsers
    FOREIGN KEY (UserID )
    REFERENCES Users (UserID),
  CONSTRAINT FK_DownloadsProducts
    FOREIGN KEY (ProductID )
    REFERENCES Products (ProductID)
);

CREATE INDEX IX_UserID
	ON Downloads (UserID);

CREATE INDEX IX_ProductID
	ON Downloads (ProductID);

CREATE INDEX IX_EmailAddress
	ON Users (EmailAddress);

CREATE INDEX IX_DownloadDate
	ON Downloads (DownloadDate);


