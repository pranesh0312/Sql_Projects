use world;
select * from city;
select * from country;
select * from countrylanguage;




#1)
select c.name as country_name,ct.name as city_name,
c.population as country_population,ct.population as city_population
from city ct,country c
where c.capital=ct.id and ct.population>50000;


#2)
select count(distinct continent) as no_of_continents
from country co,countrylanguage cl
where co.Code=cl.CountryCode and 
Language='french';


#3)
select name,2020-IndepYear as current_year
from country where IndepYear 
between 1920 and 1929;

select * from country 
where indepyear+100 between 2020 and 2029;

select * from country where indepyear like '192_';




#4)
select *,((GNP-GNPold) /GNP)*100
as Percentage from country
where Continent='Africa' and
((GNP-GNPold)/GNP)*100>15;


#5)
select * from country co,countrylanguage cl
where co.Code=cl.CountryCode
and LifeExpectancy >80 and
Language='English';
