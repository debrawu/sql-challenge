-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- merge 
select * from employees_all

select e.emp_no, e.last_name, e.first_name, e.gender, salary.salary 
from employees_all e
join salary
on e.emp_no = salary.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees_all
where hire_date like '%%/%%/1986'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select * from dept_managers
select * from dept_name

select d.dept_no, dept_name.dept_name, d.emp_no, employees_all.first_name, employees_all.last_name
from dept_managers d
join dept_name
on d.dept_no = dept_name.dept_no
join employees_all
on employees_all.emp_no = d.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select * from emp_dept_assignment
select * from dept_name

select e.emp_no, e.last_name, e.first_name, emp_dept_assignment.dept_no, dept_name.dept_name 
from employees_all e
join emp_dept_assignment
on e.emp_no = emp_dept_assignment.emp_no
join dept_name
on dept_name.dept_no = emp_dept_assignment.dept_no

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name, e.gender 
from employees_all e
where first_name = 'Hercules'
and last_name like 'B%'

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

select * from emp_dept_assignment
select * from dept_name

select em.emp_no, e.last_name, e.first_name, dept_name.dept_name 
from emp_dept_assignment em
join dept_name
on em.dept_no = dept_name.dept_no
join employees_all e
on e.emp_no = em.emp_no
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select em.emp_no, e.last_name, e.first_name, dept_name.dept_name 
from emp_dept_assignment em
join dept_name
on em.dept_no = dept_name.dept_no
join employees_all e
on e.emp_no = em.emp_no
where dept_name = 'Sales'
or dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, 
count(last_name)
from employees_all
group by last_name
order by count(last_name) DESC
