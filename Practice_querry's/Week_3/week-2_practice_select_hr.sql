use hr;
select * from departments;
select * from jobs;
select * from locations;
#1)Fetch all the records for Employees Table.
select * from employees;

#2)Show all the emp_id, first_name, last_name from employee Table
select employee_id,first_name,last_name 
from employees;

#3)Write a query in SQL to display the first_name and last_name, department_id and salary from employees Table who earn more than 20000.( 'Steven', 'King', '90', '24000.00')
select first_name,last_name,department_id,salary 
from employees where salary >20000;

#4)Write a query in SQL to display the first_name and last_name, email, salary and manager_ID for those employees whose managers_ID is 120, 103 or 145.(18 rows)
select first_name,last_name,email,salary,manager_id
from employees where manager_id in (120,103,145);

#5)Write a query in SQL to display the first_name and last_name, department_id and salary from employees Table who earn more than 8000 And whose managers_ID is 120, 103 or 145.(3 rows)
select first_name,last_name,department_id,salary
from employees where salary>8000 and 
manager_id in (120,103,145);

#6)Write a query to display all the locations (id, city) which do not have any state province mentioned. (6 rows) [NOTE: LOCATION TABLE]
select location_id,city from locations
where state_province is null;

#7)Write a query to display job_id, job titles, min_salary, max_salary whose maximum salary is greater than 10000. (9 rows) [NOTE: JOBS TABLE]
select * from jobs
where max_salary > 10000;

#8)Write a query to display department_id,department_name, Manager_id whose manager_id is greater than 200 and location_id is 2400.(1 row) [NOTE : DEPARTMENTS TABLE]
select department_id,department_name,manager_id
from departments where
manager_id > 200 and location_id = 2400;

#9)Write a query to display the job title whose minimum salary is greater than 8000 and max salary less than 20000 (3 rows).[NOTE : JOBS TABLE]
select job_title from jobs
where min_salary >8000 and max_salary <20000;

#10)Write a query to retrieve all the records of departments with managers for the location id 1700. (5 rows) [NOTE : DEPARTMENTS TABLE]
select * from departments
where manager_id is not null and location_id = 1700;

#11)List all departments starting with “P” where there are managers.(2 rows)[NOTE:DEPARTMENT TABLE]
select department_name from departments
where left(department_name,1)='p'and 
manager_id is not null;

#12)Print a bonafide certificate for an employee (say for emp. id 123) as below:
#"This is to certify that <full name> with employee id <emp. id> is working as <job id> in dept. <dept ID>. (1 ROW) [NOTE : EMPLOYEES table].
select concat("This is to certify that ",first_name," ",last_name," with employee id ",employee_id," working as ",job_id, " in "," dept. ",department_id) 
as Bonafide_certificate
from employees where employee_id=123;


#13)Write a query to display the department-wise and job-id-wise total salaries of employees whose salary is more than 25000.(8 rows) [NOTE : EMPLOYEES TABLE]



#14)Write a query to display names of employees whose first name as well as last name ends with vowels. (vowels : aeiou ) (5 rows) [NOTE : EMPLOYEES TABLE]
select concat_ws('_',first_name,last_name) as 
Employee_name from employees
where right(first_name,1) in ('a','e','i','o','u')
and right(last_name,1) in ('a','e','i','o','u');

#15)What is the average salary range (diff. between min & max salary) of all types 'Manager's and 'Clerk's. (9 rows)[NOTE : JOBS TABLE]
select max_salary-min_salary as average_salary
from jobs where job_id like 'clerk'
and job_id like 'man';

#16)Write a query to list the names of all people who report to the same person in department Accounting (i.e.2).
select first_name,last_name,department_name,e.manager_id
from employees e,departments d
where e.department_id=d.department_id and
e.manager_id=d.manager_id and 
department_name='Accounting';


#17)Write a SQL query to display each employee's first name, last name, department number, and department name. (106 rows)
select first_name,last_name,department_name,e.department_id
from employees e,departments d
where e.department_id=d.department_id;

#19)19. Display the first name where commission percentage is not provided. (72 rows)
select first_name from employees
where commission_pct is null;

#20)employees first,last name,job_tittle(use employee and job)
select first_name,last_name,job_title
from employees e,jobs jb
where e.job_id=jb.job_id;

#21)list dept id,dept name,city where the department located 
select department_id,department_name,city
from departments d,locations lc
where d.location_id=lc.location_id;

#22)list dept id,mang id,first,last name
select d.department_id,d.manager_id,e.first_name,e.last_name
from departments d,employees e
where d.manager_id=e.employee_id;

#23)all details of employee table with their city
select e.* ,l.city from employees e,departments d,locations l
where e.department_id=d.department_id and 
d.location_id=l.location_id;





