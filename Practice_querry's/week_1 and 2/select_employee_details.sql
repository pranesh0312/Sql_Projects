use hr_emp;

#1.How do you display the values in the "first_name" column of the "employees" table in SQL?
select first_name from employees;

#2.	How do you display all the columns and their respective values from the "employees" table in SQL?
select * from employees;

#3.	How do you retrieve only 5 rows of data from the "employees" table in SQL? [Hint: using limit]
select * from employees limit 5;

#4.	How do you select the employee with the name "Danny Devgan" from the "employees" table in SQL? [Hint: using where clause]
select * from employees
where first_name="Danny";

#5.	How do you retrieve the employee with employee ID "37" from the "employees" table (by starting at offset 36 and limiting the result to 1 row) in SQL? [Hint: using limit, offset]
select * from employees limit 36,1;

#6.	How do you select the employees from the "employees" table who have an employee ID ranging from 33 to 38 inclusive in SQL? [Hint: using in operator]
select * from employees
where employee_id in (33,34,35,36,37,38);
#where employee_id between 33 and 38;

#10.	How do you retrieve only the non-NULL values of the "manager_id" column from the "departments" table in SQL?
select * from employees
where manager_id is not null;

#11.	How do you retrieve the values of the "first_name" column in the "employees" table that start with "sh" in SQL?
select * from employees
where first_name like 'sh%';

#12.How do you select only last_name those ending with "ra" in SQL?
select  distinct last_name from employees
 where right(last_name,2)='ra';

#13.	How do you retrieve the values of the "last_name" column in the "employees" table that end with "ra" in SQL?
select * from employees
where last_name like '%ra';

#14.	How do you retrieve the information of the employee in the "employees" table whose "first_name" starts with "sa" and ends with "a" in SQL?
select * from employees
where first_name like 'sa%a';

#15.	How do you retrieve information of employees from the "employees" table that do not have "sharma" as their "last_name" in SQL?
select * from employees
where not last_name='sharma';

#16.How do you retrieve the unique values of the "last_name" column in the "employees" table in SQL?
select distinct last_name from employees;

#employees last name contains more than 6 letters
select * from employees
where length(last_name)>6;
#where last_name like '%_______% ;

#name and salary of employee from finance department 
select first_name,last_name,salary from employees
where job_id like "FI%";

#employees who were hired between 1970 and 1985
select * from employees
where hire_date  between '1970-01-01' and '1985-12-31';

#employees phone number end in 0 or 5
select * from employees
where right(phone_number,1) in (0,5);

#employees hired who were hired in april
select * from employees
where hire_date like '%-04-%';
#where mid(hire_date,6,2)='04';

#unique job_ids
select count(distinct job_id )from employees;

#all employees who annual salary is grater tan 200000
select * from employees
where salary*12 >200000;

select employee_id,case when right(job_id,3) in ('mgr','man') then 'Yes' else 'No' end as 'is_Manager'
from employees;

select employee_id,salary from employees
where employee_id %2=0;

select * from employees
