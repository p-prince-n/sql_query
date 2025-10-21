-- Part A – DDL (Data Definition Language)
CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Departments(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

ALTER TABLE Departments MODIFY dept_id INT AUTO_INCREMENT;

CREATE TABLE Employees(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary >= 10000),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
);
ALTER TABLE Employees ADD COLUMN email VARCHAR(100);
ALTER TABLE Employees MODIFY email VARCHAR(100) UNIQUE;
RENAME TABLE Employees TO Company_Employees;
ALTER TABLE Company_Employees DROP COLUMN email; 

-- Part B – DML (Data Manipulation Language)

-- INSERT 3 records into Departments

INSERT INTO Departments VALUES (1, 'HR'), 
(2, 'IT'), 
(3, 'Sales');

-- Insert 3 records into Employees:

INSERT INTO Company_Employees VALUES 
(101, 'John', 25000, 1),
(102, 'Alice', 30000, 2),
(103, 'Bob', 18000, 3);

SELECT c.emp_name AS employee_name, c.salary, d.dept_name 
FROM Company_Employees c 
JOIN Departments d WHERE 
c.dept_id = d.dept_id;
