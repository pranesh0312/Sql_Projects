use world;

select * from city;
select * from country;
select * from countrylanguage;

#1)
select count(*) as no_of_country from country
where locate('re',Name ) or locate('er',Name);

select count(*) as no_of_country from country
where name like '%re%' or name like '%er%';

#2)
select * from country
order by length(name),code asc; 

#3)
select * from country where 
strcmp(name,localname)=1;


#4)
select distinct Region from country;


#5)
select *, GNP/population as GNP_PER_CAPITA
from country order by GNP/population
desc limit 25;



#6)
select *, (Population/SurfaceArea) as Population_Density
from country order by Population_Density
desc limit 10;


#7)
select count(*)  as no_of_country
from country
where locate(left(Code,2), Name);

select count(*) from country where
position(left(code,2)in name)>0;

select count(*) from country where
instr(name,left(code,2))>0;








