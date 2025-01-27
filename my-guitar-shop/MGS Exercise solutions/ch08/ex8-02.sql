SELECT DateAdded, 
       CAST(DateAdded AS DATE) AS AddedDate, 
       CAST(DateAdded AS TIME) AS AddedTime, 
       CAST(DateAdded AS CHAR(7)) AS AddedChar7
FROM Products;