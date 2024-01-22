use inclass;

select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;
select distinct status from orders;

#Database used: db1 (db1.sql file provided)
#7) Get those order details whose amount is greater than 100,000 and got canceled (1 Row))
select o.* ,amount from orders o join payments p
using(customernumber) where status='cancelled' and
amount>100000;
#8) Get employee details who shipped an order within two days from the order date (15 Rows)
#select * from customers c join orders o using(customerNumber)
#join employees e 

#9) Get the product name, product line, and product vendor of products that got canceled (53 Rows)
select distinct p.productname,p.productline,p.productvendor
 from products p join orderdetails using(productcode) join
orders o using(ordernumber) where status='cancelled';
#10)Get the customer's full name along with phone number, address, state, and country, whose order was resolved(4 Rows)
select concat_ws('-',contactfirstname,contactlastname),phone,addressline1,state,country
from customers c join orders o using(customernumber) where status='resolved';

#11) Display those customers who ordered products of price greater than the average price of all products(98 Rows)
select  distinct c.* from customers c join orders o using(customernumber) join orderdetails od 
using (ordernumber) join products p using(productcode) where priceeach>(select avg(priceeach)
from orderdetails) ;

#12)Get office details of employees who work in the same city where their customers reside(5 Rows)
select distinct o.* from employees e join offices o using(officecode) join
customers c on c.salesrepemployeenumber=e.employeenumber
where c.city=o.city;
