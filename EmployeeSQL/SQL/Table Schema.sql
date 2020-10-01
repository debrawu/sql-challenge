---- creating tables & importing CSV files 
---- DEPARTMENT NAMES
CREATE TABLE dept_name (
	dept_no VARCHAR not null,
	dept_name VARCHAR not null
);
select * from dept_name

-- ADDING COLUMN because i forgot primary keys & foreign keys 
ALTER TABLE dept_name
ADD primary key (dept_no)

---- EMPLOYEES & THEIR ASSIGNED DEPARTMENTS
CREATE TABLE emp_dept_assignment (
	emp_no VARCHAR not null,
	dept_no VARCHAR
);

select * from emp_dept_assignment

-- ADDING because i forgot primary keys & foreign keys 
ALTER TABLE emp_dept_assignment 
ADD foreign key (dept_no) references dept_name(dept_no),
ADD foreign key (emp_no) references employees_all(emp_no)

---- DEPARTMENT MANAGERS
CREATE TABLE dept_managers (
	dept_no VARCHAR not null,
	emp_no VARCHAR
);
select * from dept_managers

-- ADDING because i forgot primary keys & foreign keys 
ALTER TABLE dept_managers
ADD foreign key (dept_no) references dept_name(dept_no),
ADD foreign key (emp_no) references employees_all(emp_no)

---- EMPLOYEE INFORMATION 
CREATE TABLE employees_all (
	emp_no VARCHAR,
	dept_no VARCHAR,
	birthdate VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date VARCHAR
);
select * from employees_all

-- ADDING CONSTRAINTS because i forgot primary keys & foreign keys 
ALTER TABLE employees_all
ADD primary key (emp_no)

-- RENAME COLUMN DEPT NO TO TITLE_ID
ALTER TABLE employees_all
RENAME COLUMN dept_no to title_id

-- ADD FOREIGN KEY TO REFERENCE TO TITLE TABLE
ALTER TABLE employees_all
ADD foreign key (title_id) references titles (title_id);

---- SALARIES
CREATE TABLE salary (
	emp_no VARCHAR,
	salary INTEGER
);
select * from salary

-- ADDING CONSTRAINTS because i forgot primary keys & foreign keys 
ALTER TABLE salary
ADD foreign key (emp_no) references employees_all (emp_no);

---- TITLES
CREATE TABLE titles (
	dept_no VARCHAR,
	title VARCHAR
);

select * from titles

-- ADDING CONSTRAINTS because i forgot primary keys & foreign keys 
ALTER TABLE titles
RENAME COLUMN dept_no TO title_id

ALTER TABLE titles
ADD PRIMARY KEY (title_id)