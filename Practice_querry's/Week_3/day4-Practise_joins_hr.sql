use hr;

select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;

#1)
select e.employee_id,e.first_name,e.last_name,
j.job_title,min_salary,max_salary
from employees e inner join jobs j
on e.job_id=j.job_id;


#2)
select d.department_name,count(distinct employee_id) as no_of_employees
from departments d left join employees e
on d.department_id=e.department_id
group by department_name;


#3)
select count(distinct department_name) as no_of_dept
from departments d join locations l
on d.location_id=l.location_id
where city='seattle';


#4)
select e.*,count(jb.employee_id) 
as No_of_times_repeated
from employees e join job_history jb
on e.employee_id=jb.employee_id
group by 1
having count(jb.employee_id) >1 ;


select * from employees where employee_id in
(select employee_id from job_history group by 1
having count(*)>1);

#5)

(select d.department_name,ifnull(avg(e.salary),0) as avg_salary
from departments d left join employees e
on d.department_id=e.department_id
group by department_name)

union

(select ifnull(d.department_name,'Unknown'),avg(e.salary) as avg_salary
from departments d right join employees e
on d.department_id=e.department_id
group by 1);








