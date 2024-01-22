use week_4_revision;

select* from admission_predict;
select* from department_details;
select* from employee_details;
select* from play_store;
select* from titanic_ds;
select* from video_games_sales;
select* from web;
select* from website_stats;
select* from youtube_11;


#The dataset used: titanic_ds.csv
#1) Display the first_name, last_name, passenger_no , fare of the passenger who paid less than the maximum fare. (20 Row)
select passenger_no,first_name,last_name,fare,deck_number from titanic_ds
where fare< (select max(fare) from titanic_ds);



#2) Retrieve the first_name, last_name, and fare details of those passengers who paid fares greater than the average fare. (11 Rows)
select passenger_no,first_name,last_name,fare from titanic_ds
where fare> (select avg(fare) from titanic_ds);


#3) Display the first_name, sex, age, fare, and deck_number of the passenger equal to passenger number 7 but excludes passenger number 7. (3 Rows)
select first_name, sex, age, fare,deck_number from titanic_ds where
deck_number  in (select deck_number from titanic_ds where passenger_no=7)
and  passenger_no<>7 ;


#The dataset used: youtube_11.csv
#4) Display the video Id and the number of likes of the video that has got fewer likes than the maximum likes(10 Rows)
select video_id,likes from youtube_11 
where likes< (select max(likes) from youtube_11);


#5) Write a query to print video_id and channel_title where trending_date is equals to the trending_date of category_id 1(5 Rows)
select video_id,channel_title from youtube_11 where
trending_date in (select trending_date from youtube_11 where
category_id=1);

#6) Write a query to display the channel_title, publish_date, and the trending_date having category id in between 9 to Maximum category id.Do not use Max function(3Rows)
select channel_title,publish_date,trending_date from youtube_11
where
category_id between 9 and (select count(category_id) from youtube_11);


 
#Datasets Used: employee_details.csv and department_details.csv
#13)Create a view "details" that contains the columns employee_id, first_name, last_name, and the salary from the table "employee_details".
create view details as
(select employee_id,first_name,last_name,salary from employee_details);

select * from details;

#14)Update the view "details" such that it contains the records from the columnsemployee_id, first_name, last_name, salary, hire_date, and job_id where job_id is ‘IT_PROG’.
create or replace view details as
(select employee_id,first_name,last_name,salary,hire_date,job_id from
employee_details e join department_details d using(employee_id)
where job_id='IT_PROG');

select * from details;

#15)Create a view "check_salary" that contains the records from the columns employee_id, first_name, last_name, job_id, and salary from the table "employee_details" where the salary should be greater than.
create view  check_salary as
(select employee_id,first_name,last_name,hire_date,job_id,salary from
employee_details where
salary>20000);

select * from check_salary;

#16)Create a view "pattern_matching" such that it contains the records from the columns employee_id, first_name, job_id, and salary from the table name "employee_details" where first_name ends with "l".
create view pattern_matching as
(select first_name,job_id,salary from employee_details
where right(first_name,1) like '%i');

select * from pattern_matching;

#17)Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".
create view employee_department as
(select * from employee_details e join 
department_details d using(employee_id,manager_id,department_id));

select * from employee_department;

#Dataset Used: admission_predict.csv
#18)A university focuses only on SOP and LOR scores and considers these scores of the students who have had a research paper. Create a view for that university.
create view slr_focus as
(select sop,lor from admission_predict where research=1);

select * from slr_focus;

#19)Create and append a new column "SOP_LOR_AVG" to the view "SLR_Focus".
create or replace view slr_focus as
(select sop,lor,(sop+lor) /2 as SOP_LOR_AVG from admission_predict);


select * from slr_focus;

#Dataset Used: video_games_sales.csv
#20)Display the names of the Games, platforms, and total sales in North America for respective platforms.
select name,platform,sum(na_sales) from video_games_sales

#21)Display the name of the game, platform, Genre, and the total sales in North Americafor the corresponding Genre as Genre_Sales, total sales for the given platform asPlatformm_Sales, and also display the global sales as total sales. Also, arrange theresults in descending order according to the Total Sales

#22)Use nonaggregate window functions to produce the row number for each row withinits partition (Platform) ordered by release year.
#23)Use aggregate window functions to produce the average global sales of each rowwithin its partition (Year of release).
#24)Display the name of the top 5 Games with the highest Critic Score For EachPublisher.