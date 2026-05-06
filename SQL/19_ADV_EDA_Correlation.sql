--A.	Discount vs Quantity: CORRELATION ANALYSIS
SELECT CORR(discount_applied, quantity_purchased) 
FROM sales.fact_sales;

--B.	Discount vs Profit Margin: CORRELATION ANALYSIS
SELECT CORR(discount_applied, profit_margin)     
FROM sales.fact_sales;

--C.	Price vs Quantity
SELECT CORR(price_per_unit, quantity_purchased)
FROM sales.fact_sales;

--D. Multilevel Correlation
SELECT country,
CORR(discount_applied, profit_margin)
FROM sales.fact_sales
GROUP BY country;

--E. Quantity vs Profit
SELECT CORR(quantity_purchased, profit_margin)
FROM sales.fact_sales;

--F. Price vs Profit
SELECT CORR(price_per_unit, profit_margin)
FROM sales.fact_sales;

--G. Profit vs Quantity by Store
SELECT store_location,
       CORR(quantity_purchased, profit_margin)
FROM sales.fact_sales
GROUP BY store_location;

--H. Discount vs Profit by Product Category
SELECT category,
       CORR(discount_applied, profit_margin)
FROM sales.fact_sales
GROUP BY category;
