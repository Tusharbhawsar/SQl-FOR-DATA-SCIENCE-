-- Task1
-- use different clause

use sales;
select * from customers;
select * from customers where customer_code="Cus005";-- to fetch seperate row
select * from customers where customer_name='Excel Stores';
select * from customers where customer_type='E-Commerce';-- getting all the records of 'E-Commerce' 
select customer_type from customers;-- select particular column 
select * from customers order by custmer_name;-- sorting the name by alphbat

select * from transactions;
select sales_qty,sales_qty +5 from transactions;-- to increase the data values
select sales_qty,sales_qty *10 /100 from transactions;-- complex matamatical operation
select sales_qty,sales_qty as newdata from transactions;-- change the column name

-- Distinct,where clause
select * from markets;
select distinct zone from markets;-- select only unique values

select * from transactions;
select * from transactions where sales_qty>4500;--  qyt only value is more than 4500

-- And or not operators 
select * from transactions where sales_qty>6500 and sales_amount>300000;-- it give only specific condition values
select * from transactions where sales_qty>6500 or sales_amount>800000;-- it give any condition satisfy values
select * from transactions where not sales_qty>6500 or sales_amount>800000;-- it not the data of >6500 or > 800000

-- In oprtator 
select distinct markets_name from markets;
select * from markets where markets_name in ("Bhopal","Nagpur","Surat");-- Check only need column
select * from markets where markets_name not in ("Bhopal","Nagpur","Surat");

-- Thr Betweem Operator
select * from sales;
select * from sales where sale between 200 and 300;-- tp check the value between the given numbers

-- the like operator
select * from customers where  custmer_name like 'A%';
select * from customers where  custmer_name like '%T%';
select * from customers where  custmer_name like '%T';-- get only that no ends with t

-- REGEXP(regular experation)
select * from transactions where currency regexp 'USD';-- to get USD name data 
select * from transactions where currency regexp 'USD|INR';-- to get USD  & INR name data (^begining $end)
select * from markets where zone regexp "[m-z]";

#aggerate functions
select * from transactions;
select min(sales_amount) from transactions;
select max(sales_amount) from transactions;-- see below multiple joins

#gropu by
select * from transactions;
select count(*) from markets group by zone;
select count(*),zone from markets group by zone;
select  * from transactions where order_date between "2017-10-10" and "2018-4-11";

-- the null operators
select * from customers where customer_type is null;-- to check the null at present not null available

-- order by clause
select * from customers order by custmer_name;
select * from customers order by custmer_name desc; -- check the data by order

-- limit clause
select * from transactions limit 5;-- it gives only 5 records 

-- inner join
select * from customers join transactions on customers.customer_code=transactions.customer_code;
select * from customers c join transactions t on c.customer_code=t.customer_code;

-- joining across Database
select * from transactions t join customers c on t.customer_code=c.customer_code;
select t.product_code,t.customer_code,c.custmer_name,t.sales_amount from transactions t 
join customers c on t.customer_code=c.customer_code;
select t.product_code,t.customer_code,c.custmer_name,t.sales_amount from transactions t 
join customers c on t.customer_code=c.customer_code order by custmer_name;

-- join multiple table
select * from transactions t join customers c on c.customer_code=t.customer_code
join markets m on t.market_code=m.markets_code;
select t.product_code,t.customer_code,m.markets_code,c.custmer_name,t.sales_amount,m.markets_name from transactions t 
join markets m on t.market_code=m.markets_code join customers c on t.customer_code=c.customer_code where markets_name="Bhopal";
select max(sales_amount),markets_name from transactions t join customers c on c.customer_code=t.customer_code
join markets m on t.market_code=m.markets_code;-- $$$%%%%%$
select max(sales_amount),custmer_name,markets_name from transactions t 
join markets m on t.market_code=m.markets_code join customers c on t.customer_code=c.customer_code where markets_name="Bhopal";

-- left join
select * from markets m left join transactions t  on t.market_code=m.markets_code; 














