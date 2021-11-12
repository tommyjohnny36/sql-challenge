-- 1. List the following details of each employee: employee number, last name, first name, 
-- sex, and salary.

SELECT
  Employees.emp_no,
  Employees.last_name,
  Employees.first_name,
  Employees.sex,
  Salaries.salary
FROM employees
INNER JOIN salaries ON
Employees.emp_no = salaries.emp_no;

-- 2. 
-- Use Join to find first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';


-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

-- Create join statement to query the department number, department name, the manager's employee number, last name, first name
SELECT d.dept_no, d.dept_name, j.emp_no, e.last_name, e.first_name
FROM department d
LEFT JOIN Department_Managers j
ON d.dept_no = j.dept_no
LEFT JOIN employees e
ON e.emp_no = j.emp_no;


-- 4. List the department of each employee with the following information: employee number, last name,
-- first name, and department name.

-- Create join statement to query a list of employee info and department name 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employee j
JOIN employees e
ON (e.emp_no = j.emp_no)
	JOIN department AS d
	ON (d.dept_no = j.dept_no);


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and 
-- last names begin with "B."
SELECT e.first_name, e.last_name, sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
-- Add WHERE statement to the previous join query of department name and employee info
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employee j
JOIN employees e
ON (e.emp_no = j.emp_no)
	JOIN department AS d
	ON (d.dept_no = j.dept_no)
	WHERE d.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

-- Add WHERE and AND statements to the previous join query of department name and employee info
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employee j
JOIN employees e
ON (e.emp_no = j.emp_no)
	JOIN department AS d
	ON (d.dept_no = j.dept_no)
	WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'


-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;
