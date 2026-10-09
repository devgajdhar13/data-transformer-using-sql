Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS DataTransformer;
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> USE DataTransformer;
Database changed

mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     RegistrationDate DATE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Department VARCHAR(50),
    ->     HireDate DATE,
    ->     Salary DECIMAL(10,2)
    -> );

mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Department VARCHAR(50),
    ->     HireDate DATE,
    ->     Salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Customers VALUES
    -> (1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
    -> (2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
    -> (3, 'Robert', 'Brown', '  robert.brown@email.com  ', '2022-06-20'),
    -> (4, 'Emily', 'Davis', 'emily.davis@email.com', '2023-01-10'),
    -> (5, 'Michael', 'Wilson', 'michael.wilson@email.com', '2020-09-05'),
    -> (6, 'Sarah', 'Taylor', '  sarah.taylor@email.com', '2023-04-18'),
    -> (7, 'David', 'Anderson', 'david.anderson@email.com', '2021-07-25'),
    -> (8, 'Olivia', 'Thomas', 'olivia.thomas@email.com  ', '2022-12-12');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders VALUES
    -> (101, 1, '2023-07-01', 150.50),
    -> (102, 2, '2023-07-03', 200.75),
    -> (103, 1, '2023-07-15', 1200.00),
    -> (104, 3, '2023-08-02', 650.40),
    -> (105, 4, '2023-08-10', 320.00),
    -> (106, 2, '2023-08-21', 1500.99),
    -> (107, 5, '2023-09-05', 520.25),
    -> (108, 3, '2023-09-18', 90.00),
    -> (109, 6, '2023-10-01', 780.60),
    -> (110, 1, '2023-10-14', 45.99),
    -> (111, 4, '2023-11-03', 1050.00),
    -> (112, 7, '2023-11-20', 410.30);
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Employees VALUES
    -> (1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
    -> (2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
    -> (3, 'Daniel', 'Clark', 'IT', '2019-05-10', 72000.00),
    -> (4, 'Laura', 'Martinez', 'Finance', '2018-11-30', 65000.00),
    -> (5, 'James', 'Lewis', 'Sales', '2022-02-14', 42000.00),
    -> (6, 'Linda', 'Walker', 'Marketing', '2020-08-23', 48000.00),
    -> (7, 'Kevin', 'Hall', 'IT', '2021-09-01', 80000.00),
    -> (8, 'Karen', 'Young', 'HR', '2023-01-09', 38000.00);
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT o.OrderID, o.OrderDate, o.TotalAmount,
    ->        c.CustomerID, c.FirstName, c.LastName, c.Email
    -> FROM Orders o
    -> INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
+---------+------------+-------------+------------+-----------+----------+----------------------------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName | Email                      |
+---------+------------+-------------+------------+-----------+----------+----------------------------+
|     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      | john.doe@email.com         |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@email.com       |
|     103 | 2023-07-15 |     1200.00 |          1 | John      | Doe      | john.doe@email.com         |
|     104 | 2023-08-02 |      650.40 |          3 | Robert    | Brown    |   robert.brown@email.com   |
|     105 | 2023-08-10 |      320.00 |          4 | Emily     | Davis    | emily.davis@email.com      |
|     106 | 2023-08-21 |     1500.99 |          2 | Jane      | Smith    | jane.smith@email.com       |
|     107 | 2023-09-05 |      520.25 |          5 | Michael   | Wilson   | michael.wilson@email.com   |
|     108 | 2023-09-18 |       90.00 |          3 | Robert    | Brown    |   robert.brown@email.com   |
|     109 | 2023-10-01 |      780.60 |          6 | Sarah     | Taylor   |   sarah.taylor@email.com   |
|     110 | 2023-10-14 |       45.99 |          1 | John      | Doe      | john.doe@email.com         |
|     111 | 2023-11-03 |     1050.00 |          4 | Emily     | Davis    | emily.davis@email.com      |
|     112 | 2023-11-20 |      410.30 |          7 | David     | Anderson | david.anderson@email.com   |
+---------+------------+-------------+------------+-----------+----------+----------------------------+
12 rows in set (0.00 sec)

mysql> SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     110 | 2023-10-14 |       45.99 |
|          1 | John      | Doe      |     103 | 2023-07-15 |     1200.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     106 | 2023-08-21 |     1500.99 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Brown    |     108 | 2023-09-18 |       90.00 |
|          3 | Robert    | Brown    |     104 | 2023-08-02 |      650.40 |
|          4 | Emily     | Davis    |     111 | 2023-11-03 |     1050.00 |
|          4 | Emily     | Davis    |     105 | 2023-08-10 |      320.00 |
|          5 | Michael   | Wilson   |     107 | 2023-09-05 |      520.25 |
|          6 | Sarah     | Taylor   |     109 | 2023-10-01 |      780.60 |
|          7 | David     | Anderson |     112 | 2023-11-20 |      410.30 |
|          8 | Olivia    | Thomas   |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName, c.LastName
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+---------+------------+-------------+------------+-----------+----------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName |
+---------+------------+-------------+------------+-----------+----------+
|     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    |
|     103 | 2023-07-15 |     1200.00 |          1 | John      | Doe      |
|     104 | 2023-08-02 |      650.40 |          3 | Robert    | Brown    |
|     105 | 2023-08-10 |      320.00 |          4 | Emily     | Davis    |
|     106 | 2023-08-21 |     1500.99 |          2 | Jane      | Smith    |
|     107 | 2023-09-05 |      520.25 |          5 | Michael   | Wilson   |
|     108 | 2023-09-18 |       90.00 |          3 | Robert    | Brown    |
|     109 | 2023-10-01 |      780.60 |          6 | Sarah     | Taylor   |
|     110 | 2023-10-14 |       45.99 |          1 | John      | Doe      |
|     111 | 2023-11-03 |     1050.00 |          4 | Emily     | Davis    |
|     112 | 2023-11-20 |      410.30 |          7 | David     | Anderson |
+---------+------------+-------------+------------+-----------+----------+
12 rows in set (0.00 sec)

mysql> SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    -> UNION
    -> SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     110 | 2023-10-14 |       45.99 |
|          1 | John      | Doe      |     103 | 2023-07-15 |     1200.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     106 | 2023-08-21 |     1500.99 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Robert    | Brown    |     108 | 2023-09-18 |       90.00 |
|          3 | Robert    | Brown    |     104 | 2023-08-02 |      650.40 |
|          4 | Emily     | Davis    |     111 | 2023-11-03 |     1050.00 |
|          4 | Emily     | Davis    |     105 | 2023-08-10 |      320.00 |
|          5 | Michael   | Wilson   |     107 | 2023-09-05 |      520.25 |
|          6 | Sarah     | Taylor   |     109 | 2023-10-01 |      780.60 |
|          7 | David     | Anderson |     112 | 2023-11-20 |      410.30 |
|          8 | Olivia    | Thomas   |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID
    -> WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);
+------------+-----------+----------+
| CustomerID | FirstName | LastName |
+------------+-----------+----------+
|          1 | John      | Doe      |
|          3 | Robert    | Brown    |
|          2 | Jane      | Smith    |
|          6 | Sarah     | Taylor   |
|          4 | Emily     | Davis    |
+------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT EmployeeID, FirstName, LastName, Salary
    -> FROM Employees
    -> WHERE Salary > (SELECT AVG(Salary) FROM Employees);
+------------+-----------+----------+----------+
| EmployeeID | FirstName | LastName | Salary   |
+------------+-----------+----------+----------+
|          3 | Daniel    | Clark    | 72000.00 |
|          4 | Laura     | Martinez | 65000.00 |
|          7 | Kevin     | Hall     | 80000.00 |
+------------+-----------+----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT OrderID, OrderDate,
    ->        YEAR(OrderDate) AS OrderYear,
    ->        MONTH(OrderDate) AS OrderMonth
    -> FROM Orders;
+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-07-15 |      2023 |          7 |
|     104 | 2023-08-02 |      2023 |          8 |
|     105 | 2023-08-10 |      2023 |          8 |
|     106 | 2023-08-21 |      2023 |          8 |
|     107 | 2023-09-05 |      2023 |          9 |
|     108 | 2023-09-18 |      2023 |          9 |
|     109 | 2023-10-01 |      2023 |         10 |
|     110 | 2023-10-14 |      2023 |         10 |
|     111 | 2023-11-03 |      2023 |         11 |
|     112 | 2023-11-20 |      2023 |         11 |
+---------+------------+-----------+------------+
12 rows in set (0.00 sec)

mysql> SELECT OrderID, OrderDate,
    ->        DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
    -> FROM Orders;
+---------+------------+----------------+
| OrderID | OrderDate  | DaysSinceOrder |
+---------+------------+----------------+
|     101 | 2023-07-01 |           1196 |
|     102 | 2023-07-03 |           1194 |
|     103 | 2023-07-15 |           1182 |
|     104 | 2023-08-02 |           1164 |
|     105 | 2023-08-10 |           1156 |
|     106 | 2023-08-21 |           1145 |
|     107 | 2023-09-05 |           1130 |
|     108 | 2023-09-18 |           1117 |
|     109 | 2023-10-01 |           1104 |
|     110 | 2023-10-14 |           1091 |
|     111 | 2023-11-03 |           1071 |
|     112 | 2023-11-20 |           1054 |
+---------+------------+----------------+
12 rows in set (0.02 sec)

mysql> SELECT OrderID, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
    -> FROM Orders;
+---------+---------------+
| OrderID | FormattedDate |
+---------+---------------+
|     101 | 01-Jul-2023   |
|     102 | 03-Jul-2023   |
|     103 | 15-Jul-2023   |
|     104 | 02-Aug-2023   |
|     105 | 10-Aug-2023   |
|     106 | 21-Aug-2023   |
|     107 | 05-Sep-2023   |
|     108 | 18-Sep-2023   |
|     109 | 01-Oct-2023   |
|     110 | 14-Oct-2023   |
|     111 | 03-Nov-2023   |
|     112 | 20-Nov-2023   |
+---------+---------------+
12 rows in set (0.01 sec)

mysql> SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName
    -> FROM Customers;
+------------+----------------+
| CustomerID | FullName       |
+------------+----------------+
|          1 | John Doe       |
|          2 | Jane Smith     |
|          3 | Robert Brown   |
|          4 | Emily Davis    |
|          5 | Michael Wilson |
|          6 | Sarah Taylor   |
|          7 | David Anderson |
|          8 | Olivia Thomas  |
+------------+----------------+
8 rows in set (0.00 sec)

mysql> SELECT CustomerID, REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
    -> FROM Customers;
+------------+------------------+
| CustomerID | UpdatedFirstName |
+------------+------------------+
|          1 | Jonathan         |
|          2 | Jane             |
|          3 | Robert           |
|          4 | Emily            |
|          5 | Michael          |
|          6 | Sarah            |
|          7 | David            |
|          8 | Olivia           |
+------------+------------------+
8 rows in set (0.00 sec)

mysql> SELECT CustomerID, UPPER(FirstName) AS FirstNameUpper, LOWER(LastName) AS LastNameLower
    -> FROM Customers;
+------------+----------------+---------------+
| CustomerID | FirstNameUpper | LastNameLower |
+------------+----------------+---------------+
|          1 | JOHN           | doe           |
|          2 | JANE           | smith         |
|          3 | ROBERT         | brown         |
|          4 | EMILY          | davis         |
|          5 | MICHAEL        | wilson        |
|          6 | SARAH          | taylor        |
|          7 | DAVID          | anderson      |
|          8 | OLIVIA         | thomas        |
+------------+----------------+---------------+
8 rows in set (0.01 sec)

mysql> SELECT CustomerID, TRIM(Email) AS CleanEmail
    -> FROM Customers;
+------------+--------------------------+
| CustomerID | CleanEmail               |
+------------+--------------------------+
|          1 | john.doe@email.com       |
|          2 | jane.smith@email.com     |
|          3 | robert.brown@email.com   |
|          4 | emily.davis@email.com    |
|          5 | michael.wilson@email.com |
|          6 | sarah.taylor@email.com   |
|          7 | david.anderson@email.com |
|          8 | olivia.thomas@email.com  |
+------------+--------------------------+
8 rows in set (0.00 sec)

mysql> SELECT OrderID, OrderDate, TotalAmount,
    ->        SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderID) AS RunningTotal
    -> FROM Orders;
+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
|     103 | 2023-07-15 |     1200.00 |      1551.25 |
|     104 | 2023-08-02 |      650.40 |      2201.65 |
|     105 | 2023-08-10 |      320.00 |      2521.65 |
|     106 | 2023-08-21 |     1500.99 |      4022.64 |
|     107 | 2023-09-05 |      520.25 |      4542.89 |
|     108 | 2023-09-18 |       90.00 |      4632.89 |
|     109 | 2023-10-01 |      780.60 |      5413.49 |
|     110 | 2023-10-14 |       45.99 |      5459.48 |
|     111 | 2023-11-03 |     1050.00 |      6509.48 |
|     112 | 2023-11-20 |      410.30 |      6919.78 |
+---------+------------+-------------+--------------+
12 rows in set (0.00 sec)

mysql> SELECT OrderID, TotalAmount,
    ->        RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
    -> FROM Orders;
+---------+-------------+------------+
| OrderID | TotalAmount | AmountRank |
+---------+-------------+------------+
|     106 |     1500.99 |          1 |
|     103 |     1200.00 |          2 |
|     111 |     1050.00 |          3 |
|     109 |      780.60 |          4 |
|     104 |      650.40 |          5 |
|     107 |      520.25 |          6 |
|     112 |      410.30 |          7 |
|     105 |      320.00 |          8 |
|     102 |      200.75 |          9 |
|     101 |      150.50 |         10 |
|     108 |       90.00 |         11 |
|     110 |       45.99 |         12 |
+---------+-------------+------------+
12 rows in set (0.00 sec)

mysql> SELECT OrderID, TotalAmount,
    ->        CASE
    ->            WHEN TotalAmount > 1000 THEN '10% off'
    ->            WHEN TotalAmount > 500 THEN '5% off'
    ->            ELSE 'No discount'
    ->        END AS Discount,
    ->        CASE
    ->            WHEN TotalAmount > 1000 THEN TotalAmount * 0.90
    ->            WHEN TotalAmount > 500 THEN TotalAmount * 0.95
    ->            ELSE TotalAmount
    ->        END AS FinalAmount
    -> FROM Orders;
+---------+-------------+-------------+-------------+
| OrderID | TotalAmount | Discount    | FinalAmount |
+---------+-------------+-------------+-------------+
|     101 |      150.50 | No discount |      150.50 |
|     102 |      200.75 | No discount |      200.75 |
|     103 |     1200.00 | 10% off     |   1080.0000 |
|     104 |      650.40 | 5% off      |    617.8800 |
|     105 |      320.00 | No discount |      320.00 |
|     106 |     1500.99 | 10% off     |   1350.8910 |
|     107 |      520.25 | 5% off      |    494.2375 |
|     108 |       90.00 | No discount |       90.00 |
|     109 |      780.60 | 5% off      |    741.5700 |
|     110 |       45.99 | No discount |       45.99 |
|     111 |     1050.00 | 10% off     |    945.0000 |
|     112 |      410.30 | No discount |      410.30 |
+---------+-------------+-------------+-------------+
12 rows in set (0.01 sec)

mysql> SELECT EmployeeID, FirstName, LastName, Salary,
    ->        CASE
    ->            WHEN Salary >= 60000 THEN 'High'
    ->            WHEN Salary >= 50000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryCategory
    -> FROM Employees;
+------------+-----------+----------+----------+----------------+
| EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
+------------+-----------+----------+----------+----------------+
|          1 | Mark      | Johnson  | 50000.00 | Medium         |
|          2 | Susan     | Lee      | 55000.00 | Medium         |
|          3 | Daniel    | Clark    | 72000.00 | High           |
|          4 | Laura     | Martinez | 65000.00 | High           |
|          5 | James     | Lewis    | 42000.00 | Low            |
|          6 | Linda     | Walker   | 48000.00 | Low            |
|          7 | Kevin     | Hall     | 80000.00 | High           |
|          8 | Karen     | Young    | 38000.00 | Low            |
+------------+-----------+----------+----------+----------------+
8 rows in set (0.00 sec)