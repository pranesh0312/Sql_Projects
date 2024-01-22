use week_4_day_2;

select * from movies;
select * from play_store;
select * from ratings;
select * from rent;
select * from sale;
select * from students;
select * from web;
select * from website_stats;
select * from wine;

#--Dataset Used: wine.csv--
#1.	Give a dense rank to the wine varieties on the basis of the price.
select *, dense_rank() over (order by price desc) 
as total_rank from  wine;

#2.	Use aggregate window functions to find the average of points for each row within its partition (country) and also arrange the final result in the descending order by country. print country, province, winery, variety
select country,province,winery,variety,
avg(points) over(partition by country) as 
average_points from wine
order by country desc;


#--Dataset Used: students.csv--
#3.	Provide the new roll numbers to the students on the basis of their names alphabetically
select distinct name,dense_rank() over(order by name asc)
as Roll_no from students;


# Dataset Used: website_stats.csv and web.csv
#4.	Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'
select  day,ad_clicks,ad_clicks-lead(ad_clicks) over(order by day)
as difference_ad_clicks from web w join website_stats ws
where w.id=ws.website_id and w.name='olympus';

select  day,ad_clicks,ad_clicks-lag(ad_clicks) over(order by day desc)
as difference_ad_clicks from web w join website_stats ws
where w.id=ws.website_id and w.name='olympus' order by day;

#5.	Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.
select day,no_users,min(no_users) over(order by no_users)
as min_users from web w join website_stats ws
where w.id=ws.website_id and ws.website_id=3;

select day,no_users,first_value(no_users) over(order by no_users)
as min_users from web w join website_stats ws
where w.id=ws.website_id and ws.website_id=3;




# Dataset Used: play_store.csv and sale.csv
#6.	Write a query that’s orders games in the play store into three buckets as per editor ratings received from higher to lowest
select *,ntile(3) over( order by r.id) as rating
from play_store p join ratings r 
using(id);

#7.	Write a query that displays the name of the game, the price, the sale date and the 4th column should display the sales consecutive number i.e. ranking of game as per the sale took place, so that the latest game sold gets number 1. Order the result by editor's rating of the game
select name,price,date,dense_rank()
over(order by str_to_date(date,'%d-%m-%y') desc) as sale_rank
from play_store p join sale s where
s.game_id=p.id order by editor_rating;



# Dataset Used: movies.csv, ratings.csv, rent.csv
#8.	Write a query that displays basic movie information’s as well as the previous rating provided by customer for that same movie make sure that the list is sorted by the id of the reviews
with temp1 as(#with -->used to simplify queries
select m.*,rating,lag(rating) over(partition by customer_id,movie_id)
as Previous_rating from movies m join ratings r 
where m.id=r.movie_id)
select * from temp1 where previous_rating is not null;#to select value from the  result table we use (with)

#9.	For each movie, show the following information: title, genre, average user rating for that movie and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).
select title,genre,avg(rating) as avg_user_rating,
dense_rank() over(partition by genre order by avg(rating) desc) as genre_rank
from movies m join ratings r on r.movie_id=m.id
group by 1,2;

with temp1 as(
select title,genre,avg(rating) as avg_user_rating
from  movies m join ratings r on r.movie_id=m.id
group by 1,2)
select *,dense_rank() over(partition by genre order by
avg_user_rating desc) as genre_rating from temp1;

#10.	For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent on that day, the sum of payment_amounts on the previous day and the difference between these two values.
 with temp1 as
 (select rental_date,sum(payment_amount) over(partition by rental_date)
 as day_payment from rent)
 select *,lag(day_payment) over(order by rental_date) as 
 previous_day_pmt ,day_payment-lag(day_payment) over(order by rental_date) as diff
 from temp1;
 
 