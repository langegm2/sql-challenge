create table departments(
dept_no varchar (4)not null,
dept_name varchar (30) not null,
primary key (dept_no),
	unique (dept_name)
);
select * from departments

create table employees(
employeesemp_no int  not null,
emp_title_id varchar (40) not null,
birth_date date not null,
first_name varchar (40) not null,
last_name varchar (40)not null,
sex varchar (10)not null,
hire_date date not null,
primary key(employeesemp_no, emp_title_id)
);

create table dept_manager(
	deptdept_no varchar (40) not null,
	emp_no int not null,
	foreign key (emp_no) references employees(employeesemp_no),
	foreign key (deptdept_no) references departments(dept_no),
	primary key (deptdept_no,emp_no)
);

create table salaries(
emp_no int not null,
salary int not null,
	foreign key (emp_no) references employees (employeesemp_no),
	primary key (emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no varchar (30),
	foreign key (emp_no) references employees(employeesemp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
	);
-------foreign key could be issue title_id
create table titles(
	title_id int not null,
	title varchar (30) not null,
	foreign key (title_id) references employees (employeesemp_no),
	primary key (title_id)
);

select * from titles


-----data analysis

--1.
select * from employees 
----(employeesemp_no),(last_name), (first_name), (sex), (salary),

select employees.employeesemp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
from employees
inner join salaries on
salaries.emp_no = employees.employeesemp_no;


---2.
select first_name, last_name
from employees
where hire_date between '1-1-86' and '12-31-86';


--3.
select departments.dept_no, departments.dept_name, dept_manager.deptdept_no,dept_manager.emp_no
from departments
inner join dept_manager 
on departments.dept_no= dept_manager.deptdept_no
inner join employees 
on dept_manager.emp_no = employees.employeesemp_no

--4.
select dept_emp.dept_no,employees.employeesemp_no,employees.first_name,employees.last_name
from employees
inner join dept_emp
on employees.employeesemp_no= dept_emp.emp_no
inner join departments 
on departments.dept_no = dept_emp.dept_no


--5.
select first_name, last_name, sex
from employees
where first_name ='Hercules'
AND last_name LIKE 'B%'


--6.
select departments.dept_no,dept_emp.emp_no,employees.first_name, employees.last_name
from employees
inner join dept_emp
on dept_emp.emp_no = employees.employeesemp_no
inner join departments
on departments.dept_no=dept_emp.dept_no




--7.

select employees.last_name, employeesemp_no, employees.first_name, departments.dept_name 
from employees
inner join dept_manager
on dept_manager.emp_no = employees.employeesemp_no
inner join departments
on departments.dept_no = dept_manager.deptdept_no
where dept_name = 'Sales' 
or dept_name = 'developement'


--8.
SELECT count(last_name) as frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
