use travego;     #To select the required database

show tables;     #To view the how many tables are there in database


select * from passenger;
select * from price;

#a)How many female passengers traveled a minimum distance of 600 KMs?
select count(*) as no_of_female_Passengers from passenger
where Gender='F' and Distance>=600;


#b)Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus
select * from passenger
where Distance>500 and Bus_Type='Sleeper';


#c)Select passenger names whose names start with the character 'S'.
select Passenger_name from passenger
where left(passenger_name,1)='S';


#d)Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output
select p.Passenger_name,p.Boarding_City,p.Destination_City,p.Bus_Type,pr.Price
from passenger p  inner join price pr
on p.Bus_Type=pr.Bus_Type and p.Distance=pr.Distance;

#E)What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting ina bus?
select  p.Passenger_name,pr.Price 
from passenger p join price pr 
where p.Bus_Type='Sitting' and
p.Distance=1000;


#F)What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
(select 'Pallavi' as name,'Sleeper' as type,
pr.Price from passenger p join price pr
on p.Passenger_id=pr.id and p.Distance=pr.Distance
where Passenger_id=3)

union

(select 'Pallavi' as name,'Sitting' as type,
pr.Price from passenger p join price pr
on p.Passenger_id=pr.id and p.Bus_Type=pr.Bus_Type
where pr.Distance=600 and pr.Bus_Type='sitting');
 
 
#G)Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
SET SQL_SAFE_UPDATES = 0;
update passenger 
set category='Non-AC'
where Bus_Type='Sleeper';

select * from passenger;   #To view the table after updating



#H)Delete an entry from the table where the passenger name is Piyush and commit this change in the database
delete from passenger where Passenger_name='Piyush';

select * from passenger;   #To view the table after deleting the 'Piyush' Record


#I)Truncate the table passenger and comment on the number of rows in the table (explain if required).

select count(*) from passenger as no_of_rows;  #To view the no of rows before Truncate
#no of Rows=8
#no of columns=8

truncate table passenger;

describe passenger;  #To view the table format after Truncate

#Truncate:The truncate removes the data from the table and retains the table structure
#no of Rows=0
#no of columns=8

#J)Delete the table passenger from the database
drop table passenger;

#Drop:The Drop function delete the table completely

show tables;     #To view the how many tables are there in database afere dropping the 'Passenger' table



# In safe update mode, MySQL prevents you from updating or deleting rows in a table without specifying a 'key' in the 'WHERE' clause

#SET SQL_SAFE_UPDATES = 0;--->To disable the safe update mode
#SET SQL_SAFE_UPDATES = 1;--->To enable the safe update mode