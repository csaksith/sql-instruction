USE MyBookDB;

ALTER TABLE Books
  ADD Price   DECIMAL(5,2)    DEFAULT 59.50;

ALTER TABLE Books
  ADD DateAdded  DATETIME2;
