create database school;
create table student(
id tinyint primary key,
Name varchar(20),
Age smallint,
City varchar(25)
);
insert into student values
(1,'samuel',18,'Coimbatore'),
(2,'philip',20,'Pune'),
(3,'asif',19,'Chennai');

set autocommit=0;
commit;

insert into student values
(4,'ram',25,'Madurai');

savepoint insert1;

insert into student values
(5,'mark',19,'Delhi');

savepoint insert2;

delete from student where id=2;

select * from student;

rollback to insert2;

select * from student;

commit;


