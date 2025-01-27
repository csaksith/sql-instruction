UPDATE DepartmentInstructors
SET AnnualSalary = AnnualSalary + (AnnualSalary * .1)
WHERE DepartmentName = 'English' AND Status = 'F';