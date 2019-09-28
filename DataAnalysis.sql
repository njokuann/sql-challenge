SELECT * FROM departments
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

# 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

# 2. List employees who were hired in 1987.
SELECT hire_date
FROM employees
WHERE extract(year from hire_date) = '1987';

# 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments as d
INNER JOIN dept_manager AS m ON
m.dept_no = d.dept_no
JOIN employees AS e ON
e.emp_no = m.emp_no;


# 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dep ON
dep.dept_no = d.dept_no;


# 5. List all employees whose first name is "Duangkaew" and last names begin with "P."

SELECT * FROM employees
WHERE first_name LIKE 'Duangkaew'
AND last_name LIKE 'P%';


# 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments as dep ON
dep.dept_no = d.dept_no
WHERE dep.dept_name LIKE 'Sales';


# 7 . List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp as d ON
e.emp_no = d.emp_no
INNER JOIN departments as dep ON
dep.dept_no = d.dept_no
WHERE dep.dept_name LIKE 'Sales'
or dep.dept_name LIKE 'Development';


8. In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;