#To create the database
create database employee_db;

#To view the all the databases
show databases;

#3.	How to check whether the database is selected and What is the process for selecting the database named 'employee_db' in SQL Workbench?
use employee_db;

#4.	Create a table called "emp" with columns for employee ID, name, department, and salary
create table emp(
employee_ID int,
name varchar(20),
department varchar(20),
salary int
);

#5.	Rename “emp”  table “employees” in SQL Workbench Or Command-Line Interface
rename table emp to employees;
show tables;

#6.	How to describe the columns for a table named 'employees' in SQL?
describe employees;

#7.	How can the name of a column be modified from 'employee_id' to 'Id' in SQL?
alter table employees
change employee_ID ID  int;
describe employees;

#8.	How can we add two columns after the name column in employees table?Fields are “Age”, “Sex”
alter table employees
add column Age smallint after name,
add column Sex char(10) after Age;
describe employees;

#9.	How can we change the datatype of name column in SQL? 
alter table employees
modify name  int;
describe employees;

#10.How can we drop age column in employees table? 
alter table employees
drop column Age;
describe employees;

#11.How to delete the records without deleting the structure of employees table?
Insert into employees values(1,2,"male","HR",200000),
(2,3,"Female","Tester",4000000);
truncate table employees;
select * from employees;

#12.What is the process for dropping a table and verifying its deletion in SQL? 
drop table employees;
show tables; 

#13.What is the process for dropping a database and verifying its deletion in SQL?
drop database employee_db;
show databases; 