-- Top 10 Customers by Sales

SELECT
    Customer_ID,
    COUNT(*) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Customers by Profit

SELECT
    Customer_ID,
    COUNT(*) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Customer_ID
ORDER BY Total_Profit DESC
LIMIT 10;

-- Product Return Analysis

SELECT
    Product,
    COUNT(*) AS Return_Orders,
    ABS(SUM(Quantity)) AS Returned_Units,
    ABS(SUM(Sales)) AS Return_Sales_Impact,
    ABS(SUM(Profit)) AS Return_Profit_Impact
FROM orders
WHERE Order_Type = 'Return'
GROUP BY Product
ORDER BY Returned_Units DESC;

-- =========================================================
-- QUERY 3: Product Return Analysis
-- =========================================================

SELECT
    Product,
    COUNT(*) AS Return_Orders,
    ABS(SUM(Quantity)) AS Returned_Units,
    ABS(SUM(Sales)) AS Return_Sales_Impact,
    ABS(SUM(Profit)) AS Return_Profit_Impact
FROM orders
WHERE Order_Type = 'Return'
GROUP BY Product
ORDER BY Returned_Units DESC;


-- =========================================================
-- QUERY 4: Product Return Rate
-- =========================================================

WITH product_orders AS (
    SELECT
        Product,
        COUNT(*) AS Total_Orders,
        SUM(
            CASE
                WHEN Order_Type = 'Return' THEN 1
                ELSE 0
            END
        ) AS Return_Orders
    FROM orders
    GROUP BY Product
)

SELECT
    Product,
    Total_Orders,
    Return_Orders,
    ROUND(
        Return_Orders * 100.0 / NULLIF(Total_Orders, 0),
        2
    ) AS Return_Rate_Percent
FROM product_orders
ORDER BY Return_Rate_Percent DESC;


-- =========================================================
-- QUERY 5: Category Performance
-- =========================================================

SELECT
    Category,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percent
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Category
ORDER BY Total_Sales DESC;


-- =========================================================
-- QUERY 6: Monthly Sales and Profit
-- =========================================================

SELECT
    strftime('%Y-%m', Order_Date) AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percent
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Month
ORDER BY Month;


-- =========================================================
-- QUERY 7: Discount Impact on Sales and Profit
-- =========================================================

SELECT
    Discount,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percent
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Discount
ORDER BY Discount;


-- =========================================================
-- QUERY 8: Channel Performance
-- =========================================================

SELECT
    Channel,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percent
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Channel
ORDER BY Total_Sales DESC;


-- =========================================================
-- QUERY 9: Region Performance
-- =========================================================

SELECT
    Region,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin_Percent
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Region
ORDER BY Total_Sales DESC;


-- =========================================================
-- QUERY 10: Overall Business Performance
-- =========================================================

SELECT
    SUM(Sales) AS Net_Sales,
    SUM(Profit) AS Net_Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS Net_Profit_Margin_Percent
FROM orders;


-- =========================================================
-- QUERY 11: Return Summary
-- =========================================================

SELECT
    COUNT(*) AS Return_Orders,
    ABS(SUM(Quantity)) AS Returned_Units,
    ABS(SUM(Sales)) AS Return_Sales_Impact,
    ABS(SUM(Profit)) AS Return_Profit_Impact
FROM orders
WHERE Order_Type = 'Return';


-- =========================================================
-- QUERY 12: Top 10 Customers by Sales
-- =========================================================

SELECT
    Customer_ID,
    COUNT(*) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;


-- =========================================================
-- QUERY 13: Top 10 Customers by Profit
-- =========================================================

SELECT
    Customer_ID,
    COUNT(*) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
WHERE Order_Type = 'Sale'
GROUP BY Customer_ID
ORDER BY Total_Profit DESC
LIMIT 10;


-- =========================================================
-- QUERY 14: Average Order Value
-- =========================================================

SELECT
    ROUND(SUM(Sales) * 1.0 / COUNT(*), 2) AS Average_Order_Value
FROM orders
WHERE Order_Type = 'Sale';


-- =========================================================
-- QUERY 15: Product Profitability Ranking
-- =========================================================

WITH product_profit AS (
    SELECT
        Product,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM orders
    WHERE Order_Type = 'Sale'
    GROUP BY Product
)

SELECT
    Product,
    Total_Sales,
    Total_Profit,
    RANK() OVER (
        ORDER BY Total_Profit DESC
    ) AS Profit_Rank
FROM product_profit
ORDER BY Profit_Rank;

