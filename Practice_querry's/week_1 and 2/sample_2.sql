Create database Company;#To create a database
show databases;
use Company;
show tables;
Create table customer_details(
customer_id int,
first_name varchar(20),
last_name varchar(20),
country varchar(20)
);
select * from customer_details;
describe customer_details;
Insert into customer_details values(1,"Pranesh","P","India"),
(2,"Ramesh","R","USA");
select * from customer_details;
alter table customer_details
change first_name firstname varchar(20),
change last_name lastname varchar(25);
describe customer_details;
alter table customer_details
add column income int;
describe customer_details;
alter table customer_details
add column DOB date after lastname;
describe customer_details;
alter table customer_details
drop column income;
describe customer_details;
rename table customer_details to Customer_info;
show tables