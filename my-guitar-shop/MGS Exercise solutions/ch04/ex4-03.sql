SELECT FirstName, LastName, Line1, City, State, ZipCode
FROM Customers c
  JOIN Addresses a
    ON c.CustomerID = a.CustomerID AND
       c.ShippingAddressID = a.AddressID;
