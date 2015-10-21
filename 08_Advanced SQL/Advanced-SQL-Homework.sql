USE TelerikAcademy

-- TASKS - https://github.com/TelerikAcademy/Databases/tree/master/08.%20Advanced%20SQL/Homework

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
--SELECT d.Name, AVG(e.Salary)  AS [Average Salary]
--FROM Departments d
--JOIN Employees e
--ON e.DepartmentID = d.DepartmentID
--GROUP BY d.Name
--ORDER BY [Average Salary] DESC; 

-- Task 10 --
--SELECT COUNT(e.EmployeeID) AS [Employees count], d.Name
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--			GROUP BY d.Name;

--SELECT COUNT(e.EmployeeID) AS [Employees count], t.Name
--FROM Employees e, Towns t, Addresses a
--	WHERE e.AddressID = a.AddressID
--	AND a.TownID = t.TownID
--		GROUP BY t.Name;
	
-- Task 11 --
--SELECT m.FirstName + ' ' + m.LastName AS [Manager], 
--COUNT(e.EmployeeID) AS [Exact No. of Employees]
--	FROM Employees m, Employees e
--		WHERE e.ManagerID = m.EmployeeID
--			GROUP BY m.LastName, m.FirstName
--				HAVING COUNT(e.EmployeeID) = 5;

-- Task 12 --
--SELECT e.FirstName + ' ' + e.LastName AS 'Employee', 
--ISNULL(m.FirstName + ' ' + m.LastName, 'no manager') AS 'Manager'
--FROM Employees e
--	LEFT OUTER JOIN Employees m
--		ON e.ManagerID = m.EmployeeID

-- Task 13 --
--SELECT FirstName + ' ' + LastName AS 'Employee'
--FROM Employees
--	WHERE LEN(LastName) = 5;

--Task 14 --
--SELECT CONVERT(nvarchar, GETDATE(), 13) AS [Now];

-- Task 15 --
--CREATE TABLE Users(
--	UserId int IDENTITY,
--	Username varchar(50) NOT NULL,
--	Pwd varchar(100) CHECK(DATALENGTH(Pwd) >= 5) NOT NULL,
--	FullName varchar(50),
--	LastLogIn DATETIME,
--	CONSTRAINT PK_Users PRIMARY KEY(UserId)
--)

-- Task 16 --
--CREATE VIEW [Users Loged in Today] AS
--SELECT * FROM Users
--WHERE DATEADD(DAY, 1, LastLogIn) > GETDATE()
--GO

-- Task 17 --
--CREATE TABLE Groups(
--	GroupId int IDENTITY,
--	Name varchar(50) UNIQUE NOT NULL,
--	CONSTRAINT PK_Groups PRIMARY KEY(GroupId)
--)
--GO

-- Task 18 --
--ALTER TABLE Users
--ADD GroupId INT
--GO

--INSERT INTO Groups (Name)
--VALUES('Some Gr 1'), ('Some Gr 2'), ('Some Gr 3'), ('Some Gr 4'), ('Some Gr 40'), ('Some Gr 90')
--GO

--ALTER TABLE Users
--ADD CONSTRAINT FK_Users_Groups
--FOREIGN KEY (GroupId)
--REFERENCES Groups(GroupId)
--GO

-- Task 19 --
--INSERT INTO Users(Username, Pwd, FullName, LastLogIn)
--VALUES('Pesho', 123, 'PP', GETDATE()), ('Gosho', 22, 'GG', GETDATE()), ('Tosho', 999, 'TT', GETDATE())
--GO

-- Task 20 --
--UPDATE Users
--SET FullName = 'Petar Petrov'
--WHERE Username = 'Pesho';

--UPDATE Groups
--SET Name = 'Updated Group'
--WHERE GroupId = 2;

-- Task 21 --
--DELETE FROM Users
--WHERE Username LIKE 'G%';

--DELETE FROM Groups
--WHERE Name LIKE '%0';

-- Task 22 --
--INSERT INTO Users
--(Username, Pwd, FullName, LastLogIn)
--SELECT 
--LOWER(LEFT(FirstName, 1) + LastName), LOWER(FirstName + JobTitle), FirstName + ' ' + LastName, NULL
--FROM Employees;

-- Task 23 --
--UPDATE Users
--SET Pwd = NULL
--WHERE LastLogIn < CONVERT(DATETIME, '10.03.2010');

-- Task 24 --
--DELETE FROM Users
--WHERE Pwd IS NULL;
			 
-- Task 25 --
--SELECT AVG(e.Salary) AS [Average Salary], d.Name AS [Department Name], e.JobTitle
--	FROM Employees e
--		JOIN Departments d
--			ON e.DepartmentID = d.DepartmentID
--GROUP BY d.Name, e.JobTitle;

-- Task 26 --
--SELECT ROUND(MIN(e.Salary), 2) AS [MinSalary], 
--        d.Name AS [Department],
--        e.JobTitle, 
--        MIN(CONCAT(e.FirstName, ' ', e.LastName)) AS [First Employee by Name],
--       MAX(CONCAT(e.FirstName, ' ', e.LastName)) AS [Last Employee by Name]
--    FROM Employees e 
--    JOIN Departments d
--        ON e.DepartmentID = d.DepartmentID
--    GROUP BY d.Name, e.JobTitle
--    ORDER BY MinSalary

-- Task 27 --
--SELECT TOP 1 t.Name, COUNT(e.EmployeeID) AS [Count Employees]
--FROM Employees e
--	JOIN Addresses a
--		ON e.AddressID = a.AddressID
--	JOIN Towns t
--		ON a.TownID = t.TownID
--GROUP BY t.Name
--ORDER BY [Count Employees] DESC;

-- Task 28 --
--SELECT t.Name AS Town, COUNT(DISTINCT m.EmployeeID) AS [Count Managers], 
--COUNT(e.EmployeeID) AS [Count Employees]
--FROM Employees e
--	JOIN Employees m
--		ON e.ManagerID = m.EmployeeID
--	JOIN Addresses a
--		ON m.AddressID = a.AddressID
--	JOIN Towns t
--		ON a.TownID = t.TownID
--GROUP BY t.Name
--ORDER BY [Count Managers] DESC;






