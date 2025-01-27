USE MurachCollege;

DECLARE @StudentCount INT;

SELECT @StudentCount = COUNT(*)
FROM Students
WHERE GraduationDate IS NULL;
  
IF @StudentCount >= 100
  PRINT 'The number of undergrad students is greater than or equal to 100';
ELSE
  PRINT 'The number of undergrad students is less than 100';