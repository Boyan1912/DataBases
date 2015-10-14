USE TelerikAcademy

-- Task 4 --
-- SELECT * FROM Departments;

-- Task 5 --
-- SELECT Name FROM Departments;

-- Task 6 & 7 --
-- SELECT FirstName + ' ' + LastName AS 'Full Name', Salary FROM Employees;

-- Task 8 --
-- SELECT FirstName + '.' + LastName + '@telerik.com' AS 'Full Email Addresses' FROM Employees;

-- Task 9 --
-- SELECT DISTINCT Salary FROM Employees;

-- Task 10 --
-- SELECT * FROM Employees WHERE JobTitle = 'Sales Representative';

-- Task 11 --
-- SELECT * FROM Employees WHERE FirstName LIKE 'SA%';

-- Task 12 --
-- SELECT * FROM Employees WHERE LastName LIKE '%ei%';

-- Task 13 --
-- SELECT Salary FROM Employees WHERE Salary BETWEEN 20000 AND 30000;

-- Task 14 --
-- SELECT FirstName + ' ' + LastName FROM Employees WHERE Salary IN (25000, 14000, 12500, 23600);

-- Task 15 --
-- SELECT * FROM Employees WHERE ManagerID IS NULL;

-- Task 16 --
-- SELECT * FROM Employees WHERE Salary > 5000 ORDER BY -Salary;
-- SELECT * FROM Employees WHERE Salary > 5000 ORDER BY Salary DESC;

-- Task 17 --
-- SELECT TOP 5 * FROM Employees ORDER BY Salary DESC;

-- Task 18 --
-- SELECT e.FirstName, e.LastName, e.AddressID, a.AddressID, a.AddressText
-- FROM Employees e INNER JOIN Addresses a
-- ON e.AddressID = a.AddressID;

-- Task 19 --
-- SELECT e.FirstName, e.LastName, e.AddressID, a.AddressID, a.AddressText
-- FROM Employees e, Addresses a
-- WHERE e.AddressID = a.AddressID;

-- Task 20 --
-- SELECT e.FirstName + ' ' + e.LastName AS Employee, e.EmployeeID, e.ManagerID, 
-- m.FirstName + ' ' + m.LastName AS Manager, m.EmployeeID 
-- FROM Employees e, Employees m 
-- WHERE e.ManagerID = m.EmployeeID;

-- Task 21 --
-- SELECT e.FirstName + ' ' + e.LastName AS Employee,
-- m.FirstName + ' ' + m.LastName AS Manager, 
-- a.AddressText, t.Name AS Town, 
-- e.EmployeeID, e.ManagerID, m.EmployeeID, e.AddressID, a.AddressID, a.TownID, t.TownID
-- FROM Employees e, Employees m, Addresses a, Towns t
-- WHERE e.ManagerID = m.EmployeeID AND e.AddressID = a.AddressID AND a.TownID = t.TownID;

-- Task 22 --
-- SELECT Name AS 'Departments & Towns' FROM Departments
-- UNION
-- SELECT Name FROM Towns

-- Task 23 --
-- SELECT e.LastName EmpLastName, m.LastName MngrLastName
-- FROM Employees e RIGHT OUTER JOIN Employees m
-- ON e.ManagerID = m.EmployeeID;

-- SELECT e.LastName EmpLastName, m.LastName MngrLastName
-- FROM Employees e LEFT OUTER JOIN Employees m
-- ON e.ManagerID = m.EmployeeID;

-- Task 24 --
-- SELECT e.FirstName, e.LastName, d.Name AS [Department Name], e.HireDate
-- FROM Employees e, Departments d
-- WHERE d.Name IN ('Sales', 'Finance')
-- AND e.DepartmentID = d.DepartmentID
-- AND YEAR(e.HireDate) BETWEEN 1995 AND 2005;
