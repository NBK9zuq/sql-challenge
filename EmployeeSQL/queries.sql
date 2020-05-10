--1.  List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d JOIN dept_manager dm on 
d.dept_no = dm.dept_no JOIN employees e on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e LEFT JOIN dept_emp AS de on 
e.emp_no = de.emp_no LEFT JOIN departments AS d on de.dept_no = d.dept_no
order by emp_no;
;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e LEFT JOIN dept_emp AS de on 
e.emp_no = de.emp_no LEFT JOIN departments AS d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e LEFT JOIN dept_emp AS de on 
e.emp_no = de.emp_no LEFT JOIN departments AS d on de.dept_no = d.dept_no
WHERE dept_name in ('Sales', 'Development')
;
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(emp_no) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC
;

