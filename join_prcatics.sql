CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    manager_name VARCHAR(50),
    budget DECIMAL(12,2),
    start_date DATE,
    dept_email VARCHAR(100) UNIQUE
);

INSERT INTO Departments VALUES
(1, 'Human Resources', 'New York', 'Emma Johnson', 500000, '2018-04-10', 'hr@company.com'),
(2, 'Information Technology', 'San Francisco', 'Michael Brown', 800000, '2017-06-15', 'it@company.com'),
(3, 'Sales', 'Chicago', 'Sophia Davis', 650000, '2019-02-12', 'sales@company.com'),
(4, 'Finance', 'Boston', 'Liam Wilson', 900000, '2016-11-20', 'finance@company.com'),
(5, 'Marketing', 'Seattle', 'Olivia Miller', 700000, '2020-01-05', 'marketing@company.com'),
(6, 'Operations', 'Dallas', 'Noah Taylor', 550000, '2018-07-18', 'operations@company.com'),
(7, 'Research & Development', 'Austin', 'Ava Anderson', 1200000, '2015-09-22', 'rnd@company.com'),
(8, 'Customer Support', 'Denver', 'James Thomas', 400000, '2021-03-10', 'support@company.com'),
(9, 'Procurement', 'Miami', 'Charlotte Lee', 480000, '2019-08-19', 'procurement@company.com'),
(10, 'Legal', 'New Jersey', 'Ethan Harris', 600000, '2022-05-25', 'legal@company.com');


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    job_title VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary >= 10000),
    hire_date DATE,
    dept_id INT,
    email VARCHAR(100) UNIQUE,
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
        REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(101, 'John Smith', 'M', 'HR Executive', 45000, '2020-01-15', 1, 'john.smith@company.com'),
(102, 'Alice Johnson', 'F', 'Recruiter', 48000, '2021-03-10', 1, 'alice.johnson@company.com'),
(103, 'Robert Brown', 'M', 'Software Engineer', 85000, '2019-07-25', 2, 'robert.brown@company.com'),
(104, 'Sophia White', 'F', 'System Analyst', 92000, '2018-09-10', 2, 'sophia.white@company.com'),
(105, 'Liam Davis', 'M', 'Sales Executive', 60000, '2020-05-05', 3, 'liam.davis@company.com'),
(106, 'Olivia Moore', 'F', 'Finance Manager', 95000, '2017-11-22', 4, 'olivia.moore@company.com'),
(107, 'James Taylor', 'M', 'Marketing Lead', 78000, '2021-01-18', 5, 'james.taylor@company.com'),
(108, 'Ava Williams', 'F', 'Operations Supervisor', 67000, '2019-04-07', 6, 'ava.williams@company.com'),
(109, 'Noah Martinez', 'M', 'R&D Engineer', 99000, '2018-12-20', 7, 'noah.martinez@company.com'),
(110, 'Emma Garcia', 'F', 'Customer Support Rep', 42000, '2022-02-15', 8, 'emma.garcia@company.com'),
(111, 'William Thomas', 'M', 'Procurement Officer', 53000, '2020-08-12', 9, 'william.thomas@company.com'),
(112, 'Charlotte Clark', 'F', 'Legal Advisor', 88000, '2022-06-10', 10, 'charlotte.clark@company.com'),
(113, 'Benjamin Lewis', 'M', 'Sales Associate', 58000, '2021-09-03', 3, 'benjamin.lewis@company.com'),
(114, 'Mia Walker', 'F', 'Software Tester', 75000, '2020-12-05', 2, 'mia.walker@company.com'),
(115, 'Lucas Hall', 'M', 'IT Support', 64000, '2019-10-01', 2, 'lucas.hall@company.com'),
(116, 'Amelia Young', 'F', 'HR Assistant', 43000, '2021-04-20', 1, 'amelia.young@company.com'),
(117, 'Elijah King', 'M', 'Marketing Executive', 70000, '2020-03-15', 5, 'elijah.king@company.com'),
(118, 'Harper Allen', 'F', 'Finance Analyst', 82000, '2019-07-01', 4, 'harper.allen@company.com'),
(119, 'Evelyn Scott', 'F', 'Operations Coordinator', 65000, '2021-11-25', 6, 'evelyn.scott@company.com'),
(120, 'Daniel Adams', 'M', 'Customer Support Lead', 55000, '2020-02-28', 8, 'daniel.adams@company.com');

-- List each employee’s name and their department name.

SELECT e.emp_name AS 'Employee Name', d.dept_name AS 'Department name' FROM employees e 
INNER JOIN departments d 
ON e.dept_id = d.dept_id;

-- Display employee name, job title, and department location.

SELECT 
    e.emp_name AS 'Employee name',
    e.job_title AS 'JOB',
    d.location AS 'Location'
FROM
    employees e
        INNER JOIN
    departments d ON e.dept_id = d.dept_id;

-- Show employee name, their department’s manager name, and department name.

SELECT 
    e.emp_name AS 'Employee name',
    d.manager_name AS 'manager',
    d.dept_name AS 'department'
FROM
    employees e
        INNER JOIN
    departments d ON e.dept_id = d.dept_id;

-- List employee name, salary, and the email of their department.

SELECT 
    e.emp_name AS 'Employee name',
    e.salary AS 'salary',
    d.dept_email AS 'department email'
FROM
    employees e
        INNER JOIN
    departments d ON e.dept_id = d.dept_id;

-- Display employee name, department name, and location for departments in ‘New York’.

SELECT 
    e.emp_name AS 'Employee name',
    d.dept_name AS 'department',
    d.location AS 'Location'
FROM
    employees e
        INNER JOIN
    departments d ON e.dept_id = d.dept_id
WHERE d.location = 'New York';




-- LEFT JOIN Practice


-- List all departments and the employees working in them, including departments with no employees.

SELECT 
    d.dept_id,
    d.dept_name,
    d.location,
    e.emp_id,
    e.emp_name,
    e.job_title,
    e.salary
FROM 
    Departments d
LEFT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;
    
    
-- Display department name, employee name, and salary — show 
-- even departments with no employees.

SELECT 
    d.dept_name,
    e.emp_name,
    e.salary
FROM 
    Departments d
LEFT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;

-- Show department name and employee name where the employee is assigned to a department.

SELECT 
    d.dept_name,
    e.emp_name
FROM 
    Departments d
LEFT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;

-- Display all departments and employees who joined after 2020-01-01.

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name,
    e.hire_date
FROM 
    Departments d
LEFT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id
    AND e.hire_date > '2020-01-01';

-- List departments that have no employees (should return NULL for employee columns).

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name,
    e.hire_date
FROM 
    Departments d
LEFT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id
WHERE 
    e.emp_id IS NULL;


-- CROSS JOIN


SELECT 
    d.dept_id,
    d.dept_name,
    d.location,
    e.emp_id,
    e.emp_name,
    e.job_title,
    e.salary
FROM 
    Departments d
CROSS JOIN
    Employees e ;


-- JOIN with Conditions (No Aggregates)

-- Display all employees working in the ‘IT’ or ‘Finance’ department.
SELECT
    d.dept_name,
    e.emp_id,
    e.emp_name,
    e.hire_date
FROM 
    Departments d
INNER JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id
WHERE
    d.dept_name IN ('Information Technology', 'Finance');


-- List all employees whose department is located in ‘Chicago’.
SELECT
    d.dept_name,
    d.location,
    e.emp_id,
    e.emp_name,
    e.hire_date
FROM 
    Departments d
INNER JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id
WHERE
    d.location = 'Chicago';


-- RIGHT JOIN Practice

-- List all employees and their department names, even if they are not assigned to a department.
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM 
    Departments d
RIGHT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;


-- Display employee name, job title, and department manager name for all employees, even if the department doesn’t exist.

SELECT 
    e.emp_name,
    e.job_title,
    d.manager_name
FROM 
    Departments d
RIGHT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;



-- Show all employees, their department location, and the department name — include employees without a valid dept_id.
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    d.location
FROM 
    Departments d
RIGHT JOIN 
    Employees e 
ON 
    d.dept_id = e.dept_id;
