SELECT ListPrice,
       CAST(ListPrice AS decimal(9,1)) AS PriceFormat,
       CONVERT(int, ListPrice) AS PriceConvert, 
       CAST(ListPrice AS int) AS PriceCast
FROM Products;
