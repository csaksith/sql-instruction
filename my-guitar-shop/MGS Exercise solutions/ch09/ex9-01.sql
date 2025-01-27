SELECT ListPrice, DiscountPercent, 
    ROUND(ListPrice * DiscountPercent * .01, 2) AS DiscountAmount
FROM Products;