DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Title;
DROP TABLE IF EXISTS Department_Managers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Department_Employee;
---------------------
CREATE TABLE department (
	dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM department;
--------------------
--------------------
CREATE TABLE title (
	title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (title_id)
);

SELECT * FROM title;
-----------------
--------------------
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

SELECT * FROM employees;
-----------------

------------------
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
----------------

------ Create a junction table.
CREATE TABLE Department_Managers (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM department_managers;
-----------------

------ Create a junction table.
CREATE TABLE Department_Employee (
    emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

SELECT * FROM department_employee;
------------------