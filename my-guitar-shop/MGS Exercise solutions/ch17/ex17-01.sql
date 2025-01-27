USE MyGuitarShop;

CREATE ROLE OrderEntry;

GRANT INSERT, UPDATE
  ON Orders
  TO OrderEntry;

GRANT INSERT, UPDATE
  ON OrderItems
  TO OrderEntry;

ALTER ROLE db_datareader ADD MEMBER OrderEntry;
