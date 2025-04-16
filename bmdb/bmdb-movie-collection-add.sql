Create table MovieCollection (
Id 					int PRIMARY KEY IDENTITY(1,1),
UserId				integer			not null,
MovieId				integer			not null,
PurchasePrice 		decimal(4,2) 	not null,
Foreign Key (UserID) references [User](ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT UQ_User_Movie UNIQUE (UserId, MovieId)
);

ALTER TABLE [User]
ADD CollectionValue decimal(4,2);

SELECT * From [User];
SELECT * From Movie;

insert into MovieCollection (UserID, MovieID, PurchasePrice) VALUES
	(1, 1, 19.99),
	(1, 2, 32.99);

SELECT *
  FROM MovieCollection;

  SELECT *
  FROM [User];

  -- what is the purchasse price for userId 1? =>52.98 
  select SUM(purchasePrice) AS Total
  from MovieCollection
  where UserId=1;

  -- update user.collectionvalue, set = Total from above
  UPDATE [User]
  SET CollectionValue=52.98
  WHERE Id=1;