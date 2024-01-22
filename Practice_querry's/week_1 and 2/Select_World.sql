#country with same first and last same letter
SELECT * FROM world.country
where left(Name,1)=right(Name,1);

#no of countries start with i
SELECT count(*) FROM world.country#use of as to change column nae
where Name like 'I%';#'I'

#countries speaking Dutch
SELECT count(*) FROM world.countrylanguage
where Language='Dutch';

#name of cities where population is more than 10million
SELECT Name FROM world.city
where Population>10000000;

#countries start with vowel and end with vowel
SELECT * FROM world.country
where  (Name like 'a%'or Name like 'e%'or Name like'i%'or Name like 'o%'or Name like'u%')
and(Name like '%a'or Name like '%e'or Name like'%i'or Name like '%o'or Name like'%u');
 
#countries gained independance after 1950
SELECT * FROM world.country
where IndepYear>1950;

#no of countries in africa continent
SELECT count(*) as no_of_countries FROM world.country
where Continent='Africa';

#countries whose area larger than area of Argentina
SELECT * FROM world.country
where SurfaceArea>(select SurfaceArea from world.country where
Name='Argentina');

