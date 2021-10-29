use df;
create table account(
id int,
name varchar(15),
city varchar(20),
salary int,
citizen varchar(20)
);
select * from account;
insert into account values(2,'tushar','indore',12000,'indian');
insert into account values(3,'karan','devas',16000,'indian');
insert into account values(4,'mayank','devas',14000,'American');
insert into account values(9,'durgesh','khandav',12000,'indian');
insert into account values(5,'prachi','khandva',16000,'American');
insert into account values(6,'ritik','indore',17000,'indian');
insert into account values(7,'vikrant','indore',10000,'indian');
insert into account values(8,'ram','Banglor',19000,'American');
#aggerate functions
select min(salary) from account;
select min(salary),name from account;
select min(salary),citizen from account;
select max(salary) from employee; 
select max(salary),name from employee; 
select max(name),salary from employee; 
#gropu by
select count(*) from account group by city;
select count(*),city from account group by city;
select count(*) from account group by citizen;
select count(*),citizen from account group by citizen;
select count(*),citizen from account group by citizen;
select city, count(city)from account group by city;
#use where with group
select city, count(city)from account where salary >=17000 group by city;
select city, count(city) from account group by city having count(salary)>18000;
select name from account where salary>=17000;
SELECT * FROM date where date between 2018-06-2 and 2019-06-2;
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
SELECT count(* )FROM date where cy_date between "2018-06-12" and "2019-06-24";
