SELECT * FROM lcsv.matches;
select * from matches;
select team2 from matches;

# to see the unique data from the city column 
select distinct city from matches;
select distinct city,venue from matches;

# identify the unique groups and couts that group
select count(*),city from matches group by city;
select count(*),season from matches group by season;

select count(*),player_of_match from matches group by player_of_match order by player_of_match desc;

# to see the only data of mumbai indians or particular charater/data
select count(*),winner from matches where winner in('Mumbai Indians');
select * from matches where winner not in ('Mumbai Indians');
select count(*),winner from matches where winner in('Rising Pune Supergiant');
select * from matches where winner in('Rising Pune Supergiant');

# want to see how many matches before the 2011
select * from matches where season < '2011';
select count(*) from matches where season < '2011';

# Not worked currently
select avg(season) from matches;
#exctract particular player data 
select * from matches where player_of_match = "Yuvraj Singh"; 
select * from matches where player_of_match = "CH Gayle";
select count(*) from matches where player_of_match = "CH Gayle";
select count(*) from matches where player_of_match = "SK Raina";

# lets see which team lose the match with high margin
# (uses) count emloyee salary is more than 3000,,,
select * from matches where win_by_runs >70;
select count(*) from matches where win_by_runs >70;
select * from matches where win_by_runs >100;

# to see only the particular data 
select * from matches where season = "2019";
# to see the win margin of team between the 90 to 150
select * from matches where win_by_runs between 90 and 150;
















