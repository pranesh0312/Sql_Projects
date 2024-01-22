use gaming;
select * from video_games;

#1)Find the unique genre in video_games table and sort by alphabetic order
select genre from video_games group by genre
order by 1;

#2)How many individual platform present in video_games table
select count(platform) from video_games
group by platform;


#3)Calculate sum the global_sales for individual platform and round up to 2 decimals in video_games table
select platform,round(sum(global_sales),2) 
as sum_of_global_sales from video_games
group by platform;


#4)Find the average global_sales for individual platform and round up to 2 decimals in video_games table
select platform,round(avg(global_sales),2) 
as Avg_of_global_sales from video_games
group by 1;


#5)Find the maximum global_sales for individual platform in video_games table
select platform,max(global_sales) 
as max_of_global_sales from video_games
group by platform;


#6.	Find the minimum global_sales for individual platform in video_games table
select platform,min(global_sales) 
as min_of_global_sales from video_games
group by 1;


#7.	Find the application name released in between 2019 and 2020 year_of_release in video_games table
select Name from video_games
where year_of_release between 2019 and 2020
group by Name;


#8.	Find the null values in the video_games table
select * from video_games
where year_of_release is null or
 na_sales is null or
 eu_sales is null or
 jp_sales is null or
 other_sales is null or 
 global_sales is null or
 critic_score is null or
 critic_count is null or
 year_of_release is null or
 year_of_release is null or
 user_score is null or
 user_count is null;
 
 select count(*)-count(Name) as Name,
 count(*)-count(platform) as platforn,
 count(*)-count(Year_of_release) as Year_of_release,
 count(*)-count(genre) as genre,
 count(*)-count(publisher) as publisher,
 count(*)-count(na_sales) as na_sales,
 count(*)-count(eu_sales) as eu_sales,
 count(*)-count(jp_sales) as jp_sales,
 count(*)-count(other_sales) as other_sales,
 count(*)-count(global_sales) as global_sales,
 count(*)-count(critic_score) as critic_score,
 count(*)-count(critic_count) as critic_count,
 count(*)-count(user_score) as user_score,
 count(*)-count(user_count) as critic_count,
 count(*)-count(developer) as developer,
 count(*)-count(rating) as rating from video_games;
 
 select 'name' as col_name, count(*)-count(Name) as null_values from video_games,
 union
 select 'platform' as col_name count(*)-count(platform) as null_values from video_games
 union,
 select 'year_of_release' as col_name count(*)-count(year_of_release) as null_values from video_games
 union,
 select 'genre' as col_name count(*)-count(genre) as null_values from video_games
 union,
 select 'publisher' as col_name count(*)-count(publisher) as null_values from video_games
 union,
 select 'Na_sales' as col_name count(*)-count(Na_sales) as null_values from video_games
 union,
 select 'eu_sales' as col_name count(*)-count(eu_sales) as null_values from video_games
 union,
 select 'jp_sales' as col_name count(*)-count(jp_sales) as null_values from video_games
 union,
 select 'other_sales' as col_name count(*)-count(other_sales) as null_values from video_games
 union,
 select 'critic_score' as col_name count(*)-count(critic_score) as null_values from video_games
 union,
 select 'critic_count' as col_name count(*)-count(critic_count) as null_values from video_games
 union,
 select 'user_score' as col_name count(*)-count(user_score) as null_values from video_games
 union,
 select 'user_count' as col_name count(*)-count(user_count) as null_values from video_games
 union,
 select 'developer' as col_name count(*)-count(developer) as null_values from video_games
 union,
 select 'rating' as col_name count(*)-count(rating) as null_values from video_games
 order by 2;

 


#9)	Find the sum critic_score for each publisher and check if any null values replace with “0” in video_games table
select publisher,ifnull(sum(critic_score),0) 
as sum_of_critic_score from video_games
group by publisher;


#10.	Display the name along with publisher of the top 5 Games with highest Critic Score.
select name,publisher
from video_games
order by critic_score desc
limit 5;


#11.	Find the total user_count on every year_of_release and filter null values and check if any null values replace with "unknown year" in video_games table
select ifnull(year_of_release,'unknown')
as year_of_release,sum(ifnull(user_count,0)) as sum_of_user_count
from video_games
where user_count is not null
group by year_of_release;


