USE MurachCollege;

CREATE ROLE StudentEnrollment;

GRANT INSERT, UPDATE, DELETE
  ON Students
  TO StudentEnrollment;

GRANT INSERT, UPDATE, DELETE
  ON StudentCourses
  TO StudentEnrollment;

GRANT INSERT, UPDATE, DELETE
  ON Courses
  TO StudentEnrollment

ALTER ROLE db_datareader ADD MEMBER StudentEnrollment;

ALTER ROLE StudentEnrollment ADD MEMBER JimRhodes;
