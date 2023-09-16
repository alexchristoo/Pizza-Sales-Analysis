select *from pizza_sales_excel_file;

-- REVENUE
select sum(total_price) as revenue
from pizza_sales_excel_file;

-- AVERAGE_ORDER_VALUE
select sum(total_price)/count(distinct order_id) as averageOrderValue
from pizza_sales_excel_file;

-- Total Pizzas Sold
SELECT count(pizza_id)
FROM pizza_sales_excel_file;

-- TOTAL ORDERS
SELECT count(distinct order_id)
FROM pizza_sales_excel_file;

-- Average Pizzas Per Order
select sum(quantity)/count(distinct order_id)
from pizza_sales_excel_file; 

-- Total pizza per order 
select distinct order_id, sum(quantity)
from pizza_sales_excel_file
group by order_id;

alter table pizza_sales_excel_file modify order_date date;

--  Daily Trend for Total Orders
select count(distinct order_id), dayname(order_date)
from pizza_sales_excel_file
group by dayname(order_date);

--  Monthly Trend for Total Orders
select count(distinct order_id), monthname(order_date)
from pizza_sales_excel_file
group by monthname(order_date);

-- % pizza by Pizza Category
select pizza_category,sum(quantity) as total ,sum(quantity)/48620*100 as percent
from pizza_sales_excel_file
group by pizza_category;

-- % of Sales by Pizza Category
select pizza_category , format(sum(total_price),2) as revenue, 
format(sum(total_price) *100/ (select sum(total_price) from pizza_sales_excel_file),2) as percent
from pizza_sales_excel_file
group by pizza_category;

--  % of Sales by Pizza Size
select pizza_size , format(sum(total_price),2) as revenue, 
format(sum(total_price) *100/ (select sum(total_price) from pizza_sales_excel_file),2) as percent
from pizza_sales_excel_file
group by pizza_size;

-- Top 5 Pizzas by Revenue
select distinct pizza_name, format(sum(total_price),2) as revenue 
from pizza_sales_excel_file
group by pizza_name
order by sum(total_price) desc
limit 5;

-- bottom 5 Pizzas by Revenue
select distinct pizza_name, format(sum(total_price),2) as revenue 
from pizza_sales_excel_file
group by pizza_name
order by sum(total_price) asc
limit 5;

-- Top 5 Pizzas by quantity
select distinct pizza_name, (sum(quantity)) as total 
from pizza_sales_excel_file
group by pizza_name
order by sum(quantity) desc
limit 5;
 
-- bottom 5 Pizzas by quantity
select distinct pizza_name, (sum(quantity)) as total 
from pizza_sales_excel_file
group by pizza_name
order by sum(quantity) asc
limit 5;

-- Top 5 Pizzas by totalorders
select distinct pizza_name, (count(distinct order_id)) as total 
from pizza_sales_excel_file
group by pizza_name
order by count(distinct order_id) desc
limit 5;

-- bottom 5 Pizzas by totalorders
select distinct pizza_name, (count(distinct order_id)) as total 
from pizza_sales_excel_file
group by pizza_name
order by count(distinct order_id) asc
limit 5;

select *from pizza_sales_excel_file;

-- Pizza by quantity
select pizza_category, pizza_size, pizza_name ,sum(quantity)
from pizza_sales_excel_file
group by 1,2,3;

select pizza_category, pizza_size
from pizza_sales_excel_file
where pizza_category = 'Classic'
and pizza_size = 'XXL';

select distinct pizza_name, pizza_ingredients
from pizza_sales_excel_file;










-- SELECT @@hostname;
-- select user();

-- CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';
-- GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'
-- WITH GRANT OPTION;
-- CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';
-- GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%'
-- WITH GRANT OPTION;