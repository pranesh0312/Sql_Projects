use world;

#1)	Write a SQL query to find the length of the country name in the "country" table.[Hint: Char_length, Character_length]
select name, length(name)  as length_country from country;
select char_length(name)  as char_length_country from country;

#2.	Write a SQL query to concatenate the name and code in the "country" table, separated by a space.[Hint: Concat]
select concat(Name,' ',Code) as concate_word
 from country;
select * from country;
#3.	Write a SQL query to concatenate the code, name, localname, continent, region in the "country" table, separated by a comma. [Hint: Concat_ws]
select concat_ws(', ',code,name,continent,region) as concat_ws
from country;

#4.	Write a SQL query to convert the country name to uppercase in the "country" table.[Hint: UCase, Upper]
select upper(name) as upper_name  from country;
select ucase(name) as upper_name  from country;

#5.	Write a SQL query to extract the first 3 characters of the name in the "country" table.[Hint: Left]
select name,left(name,3) from country;

#6.	Write a SQL query to extract a substring of 5 characters from the "country" table, starting from the 2nd character and ending at the 7th character of the "name" column in the "country" table.[Hint: Substring, mid]
select name, substr(name,2,7) as substring_word from country;
select name,mid(name,2,7) as mid_word from country;

#7.	Write a SQL query to determine the position of code in the country name in the "country" table. [Hint: Locate, Instr, Position]
select  name ,locate(code,name) as locate_word from country;
select name,instr(name,code) as instr_word from country;
select name,position(code in name) as positin_word 
from country;

#8.	Write a SQL query to compare the country name and country code in the "country" table, and return the result in the form of 0, 1, or -1.
select name, strcmp(name,code) as compare_word from country;

#9.	Write a SQL query to reverse the order of characters in the country name in the "country" table.

select name,reverse(name) as reverse_order_name
 from country;
