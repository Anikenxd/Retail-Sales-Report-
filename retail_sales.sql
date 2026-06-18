create database retail_sales;
use retail_sales;
select * from retail_sales_cleaned;

# Total Profit 
select sum(sales*quantity) as total_profit from retail_sales_cleaned;

#category wise total revenue
select category,sum(sales*quantity) as total_revenue_by_category from retail_sales_cleaned group by category;

#region wise total revenue
select region,sum(sales*quantity) as total_revenue_by_region from retail_sales_cleaned group by region;

#Profit by region
select region,sum(profit) as total_profit_by_region from retail_sales_cleaned group by region ;

#Profit by category
select category,sum(profit) as total_profit_by_category from retail_sales_cleaned group by category ;

#total sales
select sum(sales) as total_sales from retail_sales_cleaned; 

#total Profit 
select sum(profit) as total_profit from retail_sales_cleaned; 

#total quantity
select category,count(quantity) as total_quantiy from retail_sales_cleaned group by category; 

# margin of profit
select category,ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM retail_sales_cleaned
GROUP BY category;

#rank by revenue category
SELECT
    category,
    revenue,
    RANK() OVER(
        ORDER BY revenue DESC
    ) ranking
FROM
(
    SELECT
        category,
        SUM(sales) revenue
    FROM retail_sales_cleaned
    GROUP BY category
) x;

