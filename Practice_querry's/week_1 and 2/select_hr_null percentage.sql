use hr_emp;
select count(commission_pct)/count(*) as nulll_count from employees;
select count(*) from employees where commission_pct is null;
select (1-(count(commission_pct)/count(*)))*100  as count from employees;