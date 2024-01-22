use week_4_day_1;

select * from employee_details;
select * from department_details;

#1.	Retrive employee_id , first_name , last_name and salary details of those employees whose salary is greater than the average salary of all the employees.(11 Rows)
select employee_id,first_name,last_name,salary
from employee_details where (select avg(salary) from employee_details)<salary;


#2.	Display first_name , last_name and department_id of those employee where the location_id of their department is 1700(3 Rows)
select first_name,last_name,department_id from employee_details where 
department_id in  (select department_id from department_details where location_id=1700);


#3.	From the table employees_details, extract the employee_id, first_name, last_name, job_id and department_id who work in  any of the departments of Shipping, Executive and Finance.(9 Rows)
select employee_id,first_name,last_name,job_id,department_id from employee_details
where department_id in(select distinct department_id from department_details
where department_name in ('Shipping','Executive','Finance'));


#4.	Extract employee_id, first_name, last_name,salary, phone_number and email of the  CLERKS who earn more than the salary of any IT_PROGRAMMER.(3 Rows)
select employee_id,first_name,last_name,salary,phone_number,email from employee_details
where job_id like '%clerk%' and salary > any(select salary from employee_details where
job_id like 'it_prog');


#5	Extract employee_id, first_name, last_name,salary, phone_number, email of the AC_ACCOUNTANTs who earn a salary more than all the AD_VPs.(2 Rows)
select employee_id,first_name,last_name,salary,phone_number,email from employee_details
where job_id like '%AC_ACCOUNTANT%' and salary > all(select salary from employee_details where
job_id like 'AD_VP');


#6.	Write a Query to display the employee_id, first_name, last_name,department_id of the employees who have been recruited after the middle(avg) hire_date. (10 Rows)
select employee_id,first_name,last_name,department_id,hire_date from employee_details
where hire_date > (select avg(hire_date) from employee_details);


#7.	Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees belonging to the 'Contracting' department (3 Rows)
select employee_id,first_name,last_name,phone_number,salary,job_id
from employee_details where department_id in (select department_id from department_details
where department_name like 'contracting');


#8.	Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees who does not belong to 'Contracting' department(18 Rows)
select employee_id,first_name,last_name,phone_number,salary,job_id
from employee_details where department_id in (select department_id from department_details
where department_name not like 'contracting');


#9.	Display the employee_id, first_name, last_name, job_id and department_id of the employees who were recruited first in the department(7 Rows)
select employee_id,first_name,last_name,phone_number,job_id,department_id
from employee_details where (department_id,hire_date) in 
(select department_id,min(hire_date) from employee_details group by 1
);


#10.	Display the employee_id, first_name, last_name, salary and job_id of the employees who earn maximum salary for every job.( 7Rows)
select employee_id,first_name,last_name,phone_number,job_id
from employee_details where (job_id,salary) in (
select job_id,max(salary) from employee_details group by 1);


#Using Joins

#7)
select employee_id,first_name,last_name,phone_number,salary,job_id
 from employee_details join department_details using
(department_id) where department_name like 'contracting';

#8)
select employee_id,first_name,last_name,phone_number,salary,job_id
 from employee_details join department_details using
(department_id) where department_name not like 'contracting';
