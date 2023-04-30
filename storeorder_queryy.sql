SELECT * FROM project.superstoreordersdatas;

-- using select function in filtering sales per year.

SELECT sales, year
FROM project.superstoreordersdatas;

select * FROM project.superstoreordersdatas
 WHERE year > 2011;
 
 select * FROM project.superstoreordersdatas
 WHERE sales >= 10;
 
 select * FROM project.superstoreordersdatas
 WHERE sales >= 10 and year = 2011;
 
  select * FROM project.superstoreordersdatas
 WHERE region = 'Africa' or region = 'North';
 
 select * FROM project.superstoreordersdatas
 WHERE segment = 'consumer' or segment = 'Corperate';
 
 select * FROM project.superstoreordersdatas
 WHERE not segment = 'Consumer';
 
 
 -- grouping by total orders from each countries
 select country, count(orderId) as total_county 
 FROM project.superstoreordersdatas group by country;
 
 -- using having function to filter for total sales by country
 select country, count(sales) as total_sales 
 FROM project.superstoreordersdatas group by country
 having count(sales) >10;
 
 -- using character_length fuction to check the number of characters in orderID
 select orderId, character_length(orderId) as total_len
 FROM project.superstoreordersdatas;
 
 -- concatenating the table
 
 select orderId, productName, concat(productName, " ", sales, year ) as productName_sales
 FROM project.superstoreordersdatas;
 
-- selecting three colunms from the table
SELECT  discount, profit, sales
FROM project.superstoreordersdatas;


-- using average function in querying the database

select avg(quantity) FROM project.superstoreordersdatas;

SELECT profit, sales, (Select AVG(sales) FROM project.superstoreordersdatas) as AllAvgsales
FROM project.superstoreordersdatas;

SELECT quantity, discount, (Select AVG(discount) FROM project.superstoreordersdatas) as AllAvgdiscount
FROM project.superstoreordersdatas;

-- finding the average sales and odering with order by function

Select a.orderID, AllAvgsales
From 
	(Select orderID, sales, AVG(sales)  over () as AllAvgsales
	FROM project.superstoreordersdatas) a
Order by a.orderID;

-- using count function

select country, count(country) as sales_country

FROM project.superstoreordersdatas
group by country;


-- filtering the record by a particular order( ascending or descending)

select * FROM project.superstoreordersdatas order by country desc;



select * FROM project.superstoreordersdatas 
where shipDate between '06/01/2011' and '05/10/2011';
--


