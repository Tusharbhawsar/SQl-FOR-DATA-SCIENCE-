create database player_info;
use player_info;
create table players(
player_id int not null,
player_name varchar(40),
player_team varchar(50),
player_city varchar(30),
player_run int
);
insert into players values(1,'virat kholi','india','delhi',50000);
insert into players values(2,'ab','south africa','Maracco',40000);
insert into players values(3,'gayle','west indies','Nambia',38000);
insert into players values(4,'moien ali','England','london',22000);
insert into players values(5,'Babar Ajam','Pakistan','lahor',45000);
insert into players values(6,'tushar bhawsar','india','indore',500);

create table player_2 as select * from players;-- copy all the data of another table

create table players_3 as select * from players;
insert into players_3 select * from players where player_run >=35000;-- insert only needed data from another table

update players set player_city='Cape Town',player_run=43000 where player_id =2; -- update the data 
delete from players where player_id=6;-- for delete the data 