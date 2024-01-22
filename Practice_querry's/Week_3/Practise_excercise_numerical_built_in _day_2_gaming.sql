use gaming;
select * from video_games;

#1)top 5 games in terms of Na_sales rounded off to 1 decimal point
select * from video_games 
order by round(NA_Sales,1) desc
limit 5;

#2)how many games ,na_sales contributed atleast 50% to global sales
select count(*) as no_of_games from video_games
where NA_Sales/Global_Sales>=0.5;


#3)all nintendo games whose critic score score is odd number
select * from video_games
where Publisher ='Nintendo' and Critic_Score mod 2=1;


#4)name,yof release,publisher,global sales,critic score,of all action games.if game do not have critic score show values of user_score *10 ,if both no give 0
select name,year_of_release,publisher,global_sales,
ifnull(ifnull(critic_score,user_score*10),0) as critic_score
from video_games where genre='action';

select name,year_of_release,publisher,global_sales,
coalesce(critic_score,user_score*10,0)
as critic_score
from video_games where genre='action';



#5)how many ganes have critic score divisible by bot 3 and 4
select count(*) as no_of_games from video_games
where Critic_Score mod 3 =0 and 
Critic_Score mod 4 =0;



#6)list all games released in leap year
select * from video_games
where Year_of_Release mod 4=0;


#7)display all the games whose square of jp sales is lower than eu sales
select * from video_games
where power(jp_sales,2)<EU_Sales;

select * from video_games
where (jp_sales)<sqrt(eu_sales);


#8)how many games have theie year relase perfectly divisible by critic score
select count(*) as no_of_games from video_games
where Year_of_Release mod Critic_Score=0;


#9)how many games have their global sales as an interger
select count(*) as no_of_games from video_games
where Global_Sales mod 1=0;

select count(*) as no_of_games from video_games
where floor(global_sales)=Global_Sales;



#10)
select * from video_games where Publisher='ubisoft'
order by NA_Sales*416.37+EU_Sales*273.38+
JP_Sales*584.87+Other_Sales *500 
desc limit 10;

#11)celcious value for  temperature in fahrenhie
select 25 as f,(25-32)*5/9 as c union
select 31 as f,(31-32)*5/9 as c union
select 14 as f,(14-32)*5/9 as c union
select 44 as f,(44-32)*5/9 as c union
select 86 as f,(86-32)*5/9 as c union
select 134 as f,(134-32)*5/9 as c union
select 180 as f,(180-32)*5/9 as c ;

 


#12)most sold game without anu user and critic score
select * from video_games
where User_Score is null and Critic_Score is null
order by Global_Sales desc limit 1;



