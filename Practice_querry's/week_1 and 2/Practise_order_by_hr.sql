use hr_emp;

select * from employees order by first_name,last_name;

select * from employees where salary>10000 order by salary desc;

select first_name,last_name from employees where salary>10000 order by salary desc;

