SELECT CardNumber, 
       LEN(CardNumber) AS CardNumberLength, 
       SUBSTRING(CardNumber, 13, 4) AS LastFourDigits,
       CONCAT('XXXX-XXXX-XXXX-', SUBSTRING(CardNumber, 13, 4)) AS FormattedNumber
FROM Orders;