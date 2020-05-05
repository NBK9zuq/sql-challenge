-- Homework database

CREATE TABLE titles (
    title_id varchar(20) PRIMARY KEY NOT NULL,
    title varchar(100)
    
);

CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id varchar(50) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(100),
    last_name varchar(100),
    sex varchar(10),
    hire_date date NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
	
);

CREATE TABLE departments (
    dept_no varchar(50) PRIMARY KEY NOT NULL,
    dept_name varchar(100) NOT NULL
    
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(50) NOT NULL,
    emp_no int NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(50) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
	
);