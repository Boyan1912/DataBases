USE TelerikAcademy

-- Task 1 --
--SELECT FirstName, LastName, Salary FROM Employees
--WHERE Salary = (SELECT MIN(Salary) FROM Employees);

-- Task 2 --
--SELECT FirstName, LastName, Salary FROM Employees
--WHERE Salary <= 
--(SELECT MIN(Salary) + (MIN(Salary) * 1/10)
--FROM Employees);

-- Task 3 --
--SELECT e.FirstName, e.LastName, e.Salary, e.DepartmentID, 
--d.Name AS [Department Name] 
--FROM Employees e, Departments d
--WHERE Salary = 
--	(SELECT MIN(Salary) FROM Employees
--	WHERE DepartmentID = e.DepartmentID
--	AND e.DepartmentID = d.DepartmentID)

-- Task 4 --
--SELECT AVG(Salary) AS [Average Salary in Department #1]
--FROM Employees
--WHERE DepartmentID = 1;

-- Task 5 --
--SELECT AVG(Salary) AS [Average Salary in Sales Department]
--FROM Employees e
--WHERE EXISTS
--	(SELECT *
--	FROM Departments d
--	WHERE e.DepartmentID = d.DepartmentID
--	AND d.Name = 'Sales');

-- Task 6 --
--SELECT COUNT(*) AS [Number of employees in the "Sales" department]
--FROM Employees e
--WHERE EXISTS
--	(SELECT *
--	FROM Departments d
--	WHERE e.DepartmentID = d.DepartmentID
--	AND d.Name = 'Sales');

-- Task 7 --
--SELECT COUNT(*) AS [Number of employees with a manager]
--FROM Employees
--WHERE ManagerID IS NOT NULL;

-- Task 8 --
--SELECT COUNT(*) AS [Number of employees with no manager]
--FROM Employees
--WHERE ManagerID IS NULL;

-- Task 9 --
-- TODO --
SELECT AVG(Salary) FROM Employees e
WHERE EXISTS
	(SELECT *
	FROM Departments
	WHERE e.DepartmentID = DepartmentID);


