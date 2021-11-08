create database win_fun_data;
use win_fun_data;
create table emp_details(

emp_id int(10) not null,
emp_name varchar (50),
emp_dep varchar(40),
emp_salary int(10)
);
insert into emp_details values(1,'Tushar',"IT",15000);
insert into emp_details values(2,'Ritik',"Admin",16000);
insert into emp_details values(3,'Vikrant',"Finance",17000);
insert into emp_details values(4,'Himashu',"Admin",18000);
insert into emp_details values(5,'Sourabh',"IT",19000);
insert into emp_details values(6,'Tarun',"HR",20000);
insert into emp_details values(7,'Suraj',"Finance",21000);
insert into emp_details values(8,'Ritesh',"HR",22000);
insert into emp_details values(9,'Rohit',"Finance",23000);
insert into emp_details values(10,'Karan',"Admin",24000);
insert into emp_details values(11,'Prashant',"Finance",25000);
insert into emp_details values(12,'Anshita',"HR",26000);
insert into emp_details values(13,'Harshita',"HR",26000);

CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);



select * from emp_details;
select emp_dep,max(emp_salary) from emp_details group by emp_dep;
select e.*,max(emp_salary) over(partition by emp_dep) as max_salary from emp_details e order by max_salary;

-- @@ row_number,rank_dense_rank_lead and leg---@@
select e.*,row_number () over(partition by emp_dep) as rn from emp_details e;-- it assign number of each department and get how many data in each dep

-- Fetch the first 2 employee from each department to join the company
 select * from (select e.*,row_number () over(partition by emp_dep order by emp_id) as rn from emp_details e) x where x.rn<3;

-- Fetch the top 3 employees in each department earning the salary
select e.*, rank() over (partition by emp_dep order by emp_salary desc) as rnk from emp_details e;-- ###%%%%
select * from (select e.*, rank() over (partition by emp_dep order by emp_salary desc) as rnk from emp_details e) x where x.rnk <2;
select * from (select e.*, rank() over (partition by emp_dep order by emp_salary desc) as rnk from emp_details e) x where x.rnk <3;

select e.*, dense_rank() over (partition by emp_dep order by emp_salary desc) as drnk from emp_details e;--  ###$$$$%%
select e.*,rank() over(partition by emp_dep order by emp_salary desc) as rnk, 
dense_rank() over (partition by emp_dep order by emp_salary desc ) as drnk
 from emp_details e;
 
 -- Fetch the quary to display if the salary of an employee is higher,lower or equal to the previous employee
 -- lag and lead function
 select e.*, lag(emp_salary) over(partition by emp_dep) as pre_emp_salary from emp_details e; 
select e.*, lag(emp_salary,2,0) over(partition by emp_dep) as pre_emp_salary from emp_details e; 
select e.*, lead(emp_salary) over(partition by emp_dep) as next_emp_salary from emp_details e;
select e.*, lead(emp_salary,2,0) over(partition by emp_dep) as next_emp_salary from emp_details e;

-- Write a quary to display the most expensive product under each category (corresponding to each records)
-- First_values & last values
select * from product;
select *,first_value(product_name) over(partition by product_category order by price desc) as most_exp_product from product;

-- Writw a quary to display the most least product under each category (corresponding to each records)
-- Frame clause need to execute result 
select *, last_value(product_name) over(partition by product_category order by price desc) as most_leat_product from product;-- isnt work
select *, first_value(product_name) over(partition by product_category order by price desc) as most_exp_product,
last_value(product_name) over (partition by product_category order by price desc range between unbounded preceding and unbounded following) 
as most_least_product from product;-- %%^^$^$## 

-- ntile
-- Write a quary to segregate all the expensive phones ,mid range phones ,and the cheaper phpnes
select product_name,
case when x.buckets=1 then 'Expensive Phones'
when x.buckets=2 then 'Mid Phones'
when x.buckets=1 then 'Cheaper Phones' end phone_category
from(select *,ntile(3) over(order by price desc) as buckets from product where product_category='Phone') x; 

-- percent_rank
select *, percent_rank() over(order by price) as percentage_rank from product;
select *, percent_rank() over(order by price) as percentage_rank,
round(percent_rank() over(order by price)::numeric * 100 ,2) as per_rank from product;