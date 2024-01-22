create database customers;
use customers;
create table customer_details(
customer_id int primary key,
Name varchar(20),
phone_number varchar(20)
);
create table account_details(
account_number int,
account_type varchar(20),
branch_code varchar(20),
city varchar(20),
branch varchar(20)
);
describe customer_details;
describe account_details;