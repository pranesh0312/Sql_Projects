#1.How to check the “zomato” database exists?
show databases;

#2.Create a “zomato” database in SQL Workbench or the Command-Line Interface
create database Zomato;

#3.How to check whether the database is selected and What is the process for selecting the database named ‘zomato' in SQL Workbench?
show databases;
use Zomato;
select database();

#4.Create table Restaurant 
create table Restaurent(
ID int primary key,
Name varchar(20)
);

#5.	Create table dishes
create table dishes(
DishID int primary key,
DishName varchar(20),
Price float,
RestaurentID int,
foreign key(RestaurentID) references Restaurent(ID)
);

#6.	How to insert the following values into the "Restaurant" table
insert into Restaurent values
(1, 'Punjabi Rasoi'), 
(2, 'Udupi Grand'), 
(3, 'BBQ nation');

#7.	Insert the following values into the 'dishes' table
insert into dishes values
(1,'Dal Makhni', 120.00, 1),
(2,'Sarso Saag', 100.00, 1),
(3,'Tandoori Roti', 12.00, 1),
(4, 'Masala Dosa' , 40.00, 2),
(5, ' Rava Idly', 50.00 , 2),
( 6, 'Vada', 30.00, 2),
( 7, 'pizza', 150.00, 3),
( 8, 'burger', 80.00, 3),
(9, 'Momos', 50.00,3);

#8.	Show all the dishes with respective prices which belong to restaurant 'Punjabi Rasoi' 
select * from dishes
where RestaurentID=1;

#9.	Show all the restaurants whose name contains 'bbq' as substring.
select * from Restaurent
where Name like '%bbq%';

#10.Show all dishes whose price is greater than or equal to 120.
select * from dishes
where Price>=120;

#11.Change the datatype of the Price column in the Dishes table from INT to BIGINT
alter table dishes
modify Price bigint;
describe dishes;

#12)Rename the column name "DishName" to "Items"
alter table dishes
change DishName Items varchar(20);
describe dishes;

#13.Create a new table name “Orders
create table Orders(
OrderID int,
Order_date date,
dishes_id int
);

#then, insert the following values to the orders table
insert into Orders values
(1, "2020-01-21", 1),
(2, "2020-01-05", 6),
(3, "2020-01-05", 2),
(4, "2020-01-02", 3),
(5, "2020-01-16", 1),
(6, "2020-01-29", 2);
describe Orders;

#14.Remove all the data which exists in the orders while retaining the structure
truncate table Orders;

#15.Check whether data exist in the table “orders”.
describe Orders;

#16.Drop the orders table from the “zomato” schema
drop table Orders;
show tables;