use hr_emp;
select * from employees;

#1)
select first_name,email from employees
where strcmp(email,first_name)=-1;


#2)
select * from employees
order by hire_date asc ,salary asc  limit 10;

#3)
select count(*) as no_of_employees from employees
where left(job_id,1)  like left(first_name,1) or 
 left(job_id,1) like left(last_name,1);
 
 
 
 
 #4)
 select count(*) from employees
 order by locate('.%.',phone_number) asc,email asc;
 
 select * from employees
 order by substr(phone_number,5,locate('.',phone_number,5)-5),
 email;
 
 
 
 #5)
 select count(*) as no_of_employees
 from employees
 where first_name like '%a%a%';
 
 
 #6)
 select concat_ws('_',first_name,last_name) as Employer_name,
 (2023-substr(hire_date,1,4)) as no_of_years 
 from employees;
 
 select concat_ws('_',first_name,last_name) as Employer_name,
 (2023-year(hire_date)) as no_of_years 
 from employees;
