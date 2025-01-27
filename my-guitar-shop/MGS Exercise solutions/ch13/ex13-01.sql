CREATE VIEW CustomerAddresses
AS
SELECT c.CustomerID, EmailAddress, LastName, FirstName, 
    ba.Line1 AS BillLine1, ba.Line2 AS BillLine2, 
    ba.City AS BillCity, ba.State AS BillState, ba.ZipCode AS BillZip, 
    sa.Line1 AS ShipLine1, sa.Line2 AS ShipLine2, 
    sa.City AS ShipCity, sa.State AS ShipState, sa.ZipCode AS ShipZip 
FROM Customers c 
    JOIN Addresses ba 
      ON c.BillingAddressID  = ba.AddressID
    JOIN Addresses sa 
      ON c.ShippingAddressID = sa.AddressID
