use gaming;

select * from video_games;

#1)
select platform,avg(critic_score) as avg_critic_score
from video_games
group by platform
having avg_critic_score>75;


#2)
select sum(case when left(name,1)in ('a','e','i','o','u') then
Global_Sales else 0 end) as total_global_sales_vowels,
sum(case when left(name,1) not in ('a','e','i','o','u') then
Global_Sales else 0 end) as total_global_sales_consonents
from video_games;


#3)
select genre ,avg(critic_count) as avg_critic_count
from video_games
group by genre order by avg_critic_count desc
limit 5;


#4)
select count(*) as No_of_Publishers from(
select publisher,sum(global_sales) as total_global_sales,
sum(NA_Sales) as total_NA_Sales
from video_games
group  by 1 having sum(global_sales)>200 and
sum(NA_Sales)>75) a;


use hr_emp;
select * from employees;

#1)
select job_id,avg(salary) as Average_salary
from employees
group by job_id
having job_id like '%MGR%' or job_id like '%MAN%' or
job_id like '%CLERK%';

select case when job_id like '%MAN%' OR  job_id like'%MGR%' 
then 'Manager'
when job_id like '%CLER%'then 'CLERK' else 'Others' end
as job_type,avg(salary) as avg_salary
from employees group by 1;