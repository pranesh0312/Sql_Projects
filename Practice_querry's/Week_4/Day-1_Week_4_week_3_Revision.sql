use chinook;

select * from album;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoiceline;
select * from mediatype;
select * from playlist;
select * from playlisttrack;
select * from track;


#1)Calculate Monthly-Wise invoice Sales and sort them in descending order. (12 rows)
select month(Invoicedate),sum(total) from invoice
group by month(Invoicedate)
order by 2 desc;
#we can use extract function also to get the month

#2)Write an SQL query to fetch the names of all employees and their managers. (7 rows)
select concat_ws('-',e.firstname,e.lastname) as Employee_name,
concat_ws('-',m.firstname,m.lastname) as reportsto
from employee e join employee m on 
 e.reportsto=m.employeeid;


#3)Find the names of customers who have made a purchase in the USA? (13 rows)
select distinct concat_ws('-',c.firstname,c.lastname) as customer_name
from customer c join invoice i
using(customerid) where billingcountry='usa';


#4)Show the name of each genre and the total number of tracks in that genre. (25 rows)
select g.name,count(trackid) as no_of_tracks 
from genre g  join track t using (genreid)
group by 1;


#5)Show the name of each customer and the total amount they have spent on purchases. (59 rows)
select concat_ws(firstname,'',c.lastname) as employee_name,
sum(i.total) as total_amount_spent from customer c join invoice i
using(customerid)
group by 1;


#6)Find the name of the album with the highest unit price. (1 row)
select title,sum(unitprice) as unit_price from track join album 
using(albumid) group by 1 order by 2 desc
limit 1;


#7)Display the percentage of missing values for “billingstate” and “billingpostalcode” columns respectively for the invoice table. (1 row)
select round((count(*)-count(billingstate)) /count(*) *100,2) as 
Percentage_of_bs,round(
(count(*)-count(billingpostalcode))/count(*) *100,2) as
Percentage_of_bc
 from invoice;


#8)Show the name of each track and the total number of times it has been purchased.
select t.name,sum(il.quantity) as total_no_purchase
 from invoiceline il join track t
on il.trackid=t.trackid
group by 1 ;


#9)Find the name of the customer who has made the largest purchase in terms of total cost. (1 row)
select concat_ws('-',c.firstname,c.lastname) as employee_name,sum(total)
from customer c join invoice i
using(customerid) order by 1 desc
limit 1;


#10)Display the total amount spent by each customer and the number of invoices they have. (59 rows)
select concat_ws('-',c.firstname,c.lastname) 
as employee_name,sum(total) as total_amount_spent,
 count(invoiceid) as no_of_invoice
 from customer c join invoice i
using(customerid) join 
invoiceline il using(invoiceid)
group by employee_name;



#11)Find the name of the artist who has the most tracks in the chinook database. (1 row)
select ar.name,count(t.albumid) as no_of_tracks
 from album a join artist ar
using(artistid) join track t using(albumid) 
group by 1 order by no_of_tracks
desc limit 1;


#12)Find the names and email addresses of customers who have spent more than the average amount on invoices. (59 rows)
select concat_ws(firstname,' ',lastname) as name,
email,sum(total) as amount_spent from customer join invoice using(customerid)
group by 1,2 having sum(total)>
(select avg(total) from invoice);


#13)List the names of all the artists that have tracks in the 'Rock' genre. (51 rows)
select distinct ar.name from album a join artist ar
using(artistid) join track t using(albumid)
join genre g using(genreid) where g.name='rock';
