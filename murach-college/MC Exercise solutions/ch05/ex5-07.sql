SELECT LastName + ', ' + FirstName AS InstructorName, COUNT(*) AS CourseCount
FROM Instructors i
  JOIN Courses c
    ON i.InstructorID = c.InstructorID
WHERE Status = 'P'
GROUP BY Rollup(LastName + ', ' + FirstName);
