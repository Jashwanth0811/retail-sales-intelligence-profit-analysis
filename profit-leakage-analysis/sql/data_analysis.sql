------------------------------------------------------------
-- STEP 3: Data Preparation & Transformation
------------------------------------------------------------

-- 3.1 Profit Margin Calculation
-- Updates each row with profit margin (profit ÷ sales).
-- Ensures division only occurs when sales is not zero.
UPDATE sales
SET profit_margin = profit / sales
WHERE sales <> 0;

-- 3.2 Loss Flag Assignment
-- Flags orders as 'Loss' if profit < 0, otherwise 'Profit'.
UPDATE sales
SET loss_flag =
CASE
    WHEN profit < 0 THEN 'Loss'
    ELSE 'Profit'
END;

-- 3.3 Extract Order Year & Month
-- Derives year and month name from order_date for reporting.
UPDATE sales
SET
    order_year = YEAR(order_date),
    order_month = MONTHNAME(order_date);

-- 3.4 Discount Band Classification (VERY IMPORTANT)
-- Categorizes discount values into bands for analysis.
UPDATE sales
SET discount_band =
CASE
    WHEN discount = 0 THEN '0%'
    WHEN discount <= 0.10 THEN '0–10%'
    WHEN discount <= 0.20 THEN '10–20%'
    ELSE '>20%'
END;

------------------------------------------------------------
-- STEP 4: KPI QUERIES (SAVE THESE)
------------------------------------------------------------

-- 4.1 Overall Business KPIs
-- Provides total sales, total profit, and overall profit margin.
SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),4) AS profit_margin
FROM sales;

-- 4.2 Loss-Making Orders Percentage
-- Calculates % of orders that resulted in a loss.
SELECT
    COUNT(*) AS loss_orders,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales),
        2
    ) AS loss_order_percentage
FROM sales
WHERE profit < 0;

------------------------------------------------------------
-- STEP 5: Profit Leakage Analysis Queries
------------------------------------------------------------

-- 5.1 Loss-Making Products
-- Identifies products with negative total profit.
-- Shows sales, profit, and margin per product.
SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),4) AS margin
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- 5.2 Category & Sub-Category Leakage
-- Analyzes profitability by category and sub-category.
SELECT
    category,
    sub_category,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/SUM(sales),4) AS margin
FROM sales
GROUP BY category, sub_category
ORDER BY margin;

-- 5.3 Region-wise Performance
-- Compares sales and profit across regions.
-- Orders results by highest sales first.
SELECT
    region,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/SUM(sales),4) AS margin
FROM sales
GROUP BY region
ORDER BY sales DESC;

-- 5.4 Discount Impact (CORE QUERY)
-- Evaluates how different discount bands affect sales and profit.
SELECT
    discount_band,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit,
    ROUND(SUM(profit)/SUM(sales),4) AS margin
FROM sales
GROUP BY discount_band
ORDER BY discount_band;

-- 5.5 High Sales but Loss Products (ADVANCED)
-- Finds products with above-average sales but negative profit.
-- Useful for identifying profit leakage in popular products.
SELECT
    product_name,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM sales
GROUP BY product_name
HAVING SUM(sales) > (SELECT AVG(sales) FROM sales)
AND SUM(profit) < 0;
