-- Section 1: Database & Table Basics
USE collegedb;
CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT CHECK (age >=18),
    city VARCHAR(30)
);

ALTER TABLE students MODIFY student_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD email VARCHAR(100);
ALTER TABLE students DROP COLUMN city;
RENAME TABLE students TO Student_info;
DROP TABLE Student_info;

-- Section 2: Constraints Practice

CREATE TABLE Courses (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) UNIQUE,
    duration INT CHECK (duration > 0),
    fees DECIMAL(10,2) DEFAULT 10000
);
DESCRIBE Courses;
ALTER TABLE Courses ADD teacher_name VARCHAR(50);
DESCRIBE Courses;
ALTER TABLE Courses MODIFY fees DECIMAL(10,2) DEFAULT 15000;
DESCRIBE Courses;
ALTER TABLE Courses DROP COLUMN teacher_name;
DESCRIBE Courses;

-- Section 3: Foreign Key Practice

CREATE TABLE Departments(
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary >= 10000),
    dept_id INT,
    CONSTRAINT fk_emp_dept 
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
);
DESCRIBE Employees;
ALTER TABLE Employees DROP  CONSTRAINT fk_emp_dept;
DROP TABLE Departments, Employees;

-- Section 4: Advanced Foreign Key Actions

CREATE TABLE Departments (
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE Employees (
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
    ON DELETE CASCADE
);

CREATE TABLE Projects(
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_pro_dept
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
    ON DELETE SET NULL
);

CREATE TABLE Managers (
	manager_id INT AUTO_INCREMENT PRIMARY KEY,
    manager_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_mang_dept
    FOREIGN KEY ( dept_id)
    REFERENCES Departments(dept_id)
    ON DELETE RESTRICT
);


-- Section 5: Other Constraints & Modifications


CREATE TABLE LibraryBooks (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    author VARCHAR(50),
    copies INT CHECK (copies > 0),
    price DECIMAL(10,2) DEFAULT 500
);

ALTER TABLE LibraryBooks ADD CONSTRAINT unq_bk_tlt UNIQUE (book_title);
ALTER TABLE LibraryBooks DROP CONSTRAINT unq_bk_tlt;
RENAME TABLE LibraryBooks TO Books;
DROP TABLE Books;


-- Section 6: Real-World DDL Scenarios


CREATE TABLE Teachers(
	teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_name VARCHAR(50),
    subject VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary >= 10000)
);

CREATE TABLE Classes(
	class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(20),
    teacher_id INT,
    CONSTRAINT fk_cls_teh
    FOREIGN KEY (teacher_id)
    REFERENCES Teachers(teacher_id)
    ON DELETE SET NULL
);

CREATE TABLE LibraryMembers(
	member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    join_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE LibraryMembers ADD membership_type VARCHAR(20) DEFAULT 'Regular';
DESCRIBE LibraryMembers;
ALTER TABLE LibraryMembers MODIFY membership_type VARCHAR(20) NOT NULL DEFAULT 'Regular';
DESCRIBE LibraryMembers;
ALTER TABLE LibraryMembers DROP COLUMN join_at;
DESCRIBE LibraryMembers;
DROP TABLE LibraryMembers;
DROP TABLE Classes, Courses, Departments, Employees, Managers, Projects, Teachers;


