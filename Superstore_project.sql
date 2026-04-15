SELECT COUNT(*) AS total_rows
FROM sales;
--Total Sales--
SELECT ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales;
--Top Region--
SELECT "Region",
       SUM("Sales") AS total_sales
FROM sales
GROUP BY "Region"
ORDER BY total_sales DESC;
--Top Category--
SELECT "Category",
       SUM("Sales") AS total_sales
FROM sales
GROUP BY "Category"
ORDER BY total_sales DESC;
--Total profit--
SELECT ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM sales;
--Total orders--
SELECT COUNT(DISTINCT "Order ID") AS total_orders
FROM sales;
--Segment wise performance--
SELECT "Segment",
       ROUND(SUM("Sales")::numeric, 2) AS total_sales,
       ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM sales
GROUP BY "Segment"
ORDER BY total_sales DESC;
--Worst sub category--
SELECT "Sub-Category",
       ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM sales
GROUP BY "Sub-Category"
ORDER BY total_profit ASC
LIMIT 5;
--Top profitable sub-category--
SELECT "Sub-Category",
       ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM sales
GROUP BY "Sub-Category"
ORDER BY total_profit DESC
LIMIT 5;
--Loss making products--
SELECT "Product Name",
       ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM sales
GROUP BY "Product Name"
HAVING SUM("Profit") < 0
ORDER BY total_profit ASC
LIMIT 10;