use world;
select * from city;
select * from country;
select * from countrylanguage;

#1)
select continent,avg(gnp) as Average_GNP from country
group  by Continent
order by avg(gnp) desc;



#2)
select Language,count(name) as number_of_countries
from country co,countrylanguage cl
where co.code=cl.CountryCode
group by Language;

select language,count(*) from
countrylanguage group by 1;


#3)
select region,sum(population) as total_population
from country
group by Region
having sum(population)>100000000;


#4)
select continent,sum(population)/sum(surfacearea)
as Population_density from country
group by 1;


#5)
select continent,count(Name) 
as no_of_countries from country
group by Continent order by 
count(Name) desc limit 3;


#6)
select language,sum(Population) as total_population
from country co,countrylanguage cl
where co.Code=cl.CountryCode and Language='Tamil'
group by 1;
 



