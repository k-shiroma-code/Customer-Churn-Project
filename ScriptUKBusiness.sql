ALTER TABLE online_retail RENAME COLUMN online_retail TO InvoiceNo;
ALTER TABLE online_retail RENAME COLUMN field2 TO StockCode;
ALTER TABLE online_retail RENAME COLUMN field3 TO Description;
ALTER TABLE online_retail RENAME COLUMN field4 TO Quantity;
ALTER TABLE online_retail RENAME COLUMN field5 TO InvoiceDate;
ALTER TABLE online_retail RENAME COLUMN field6 TO UnitPrice;
ALTER TABLE online_retail RENAME COLUMN field7 TO CustomerID;
ALTER TABLE online_retail RENAME COLUMN field8 TO Country;

DELETE FROM online_retail
WHERE rowid IN (
    SELECT rowid FROM online_retail
    LIMIT 1
);

SELECT rowid, * FROM online_retail LIMIT 1;

CREATE TABLE online_retail_new (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TEXT,
    UnitPrice REAL,
    CustomerID INTEGER,
    Country TEXT
);

INSERT INTO online_retail_new (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    CAST(Quantity AS INTEGER),
    InvoiceDate,
    CAST(UnitPrice AS REAL),
    CAST(CustomerID AS INTEGER),
    Country
FROM online_retail;

DROP TABLE online_retail;

ALTER TABLE online_retail_new RENAME TO online_retail;






-- 1. Top-selling products by total revenue
SELECT 
    Description,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM online_retail
WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 2. Countries that generate the most revenue
SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM online_retail
WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0
GROUP BY Country
ORDER BY Total_Revenue DESC;


-- 3. Monthly sales trends
SELECT 
  strftime('%Y-%m', 
    '20' || substr(InvoiceDate, 7, 2) || '-' || 
    printf('%02d', CAST(substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1) AS INTEGER)) || '-' || 
    printf('%02d', CAST(substr(InvoiceDate, instr(InvoiceDate, '/') + 1, instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1) AS INTEGER)) || ' ' || 
    substr(InvoiceDate, instr(InvoiceDate, ' ') + 1) || ':00'
  ) AS Month,
  ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM online_retail
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
GROUP BY Month
ORDER BY Month;

-- 4. Average revenue per customer
SELECT 
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT CustomerID), 2) AS Avg_Revenue_Per_Customer
FROM online_retail
WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0 AND CustomerID IS NOT NULL;


-- 5. Percentage of transactions that are returns
WITH all_invoices AS (
    SELECT DISTINCT InvoiceNo FROM online_retail
),
return_invoices AS (
    SELECT DISTINCT InvoiceNo FROM online_retail WHERE InvoiceNo LIKE 'C%'
)
SELECT 
    ROUND(100.0 * COUNT(r.InvoiceNo) / COUNT(a.InvoiceNo), 2) AS Return_Percentage
FROM all_invoices a
LEFT JOIN return_invoices r ON a.InvoiceNo = r.InvoiceNo;


-- 6. Average shopping basket size (items & value per invoice)
SELECT 
    ROUND(AVG(Item_Count), 2) AS Avg_Items_Per_Invoice,
    ROUND(AVG(Total_Value), 2) AS Avg_Basket_Value
FROM (
    SELECT 
        InvoiceNo,
        SUM(Quantity) AS Item_Count,
        SUM(Quantity * UnitPrice) AS Total_Value
    FROM online_retail
    WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0
    GROUP BY InvoiceNo
) basket;


-- 7. RFM Analyis
SELECT
  InvoiceDate,
  '20' || 
    substr(InvoiceDate, instr(InvoiceDate, '/') + instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') + 1, 2) || '-' || 
    printf('%02d', substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1)) || '-' ||
    printf('%02d', substr(
      InvoiceDate,
      instr(InvoiceDate, '/') + 1,
      instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1
    )) AS ParsedDate
FROM online_retail
LIMIT 10;


SELECT
  CustomerID,
  CAST(julianday('2010-12-09') - julianday(
    '20' || 
    substr(InvoiceDate, instr(InvoiceDate, '/') + instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') + 1, 2) || '-' || 
    printf('%02d', substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1)) || '-' ||
    printf('%02d', substr(
      InvoiceDate,
      instr(InvoiceDate, '/') + 1,
      instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1
    ))
  ) AS INTEGER) AS Recency,
  COUNT(DISTINCT InvoiceNo) AS Frequency,
  ROUND(SUM(Quantity * UnitPrice), 2) AS Monetary
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;

--RFM Calculation
WITH rfm_base AS (
  SELECT
    CustomerID,
    CAST(julianday('2010-12-09') - julianday(
      '20' || 
      substr(InvoiceDate, instr(InvoiceDate, '/') + instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') + 1, 2) || '-' || 
      printf('%02d', substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1)) || '-' ||
      printf('%02d', substr(
        InvoiceDate,
        instr(InvoiceDate, '/') + 1,
        instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1
      ))
    ) AS INTEGER) AS Recency,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monetary
  FROM online_retail
  WHERE CustomerID IS NOT NULL
  GROUP BY CustomerID
),

--Assign RFM Scores
rfm_scores AS (
  SELECT *,
    -- Recency Score: lower is better
    CASE 
      WHEN Recency <= 30 THEN 5
      WHEN Recency <= 60 THEN 4
      WHEN Recency <= 90 THEN 3
      WHEN Recency <= 120 THEN 2
      ELSE 1
    END AS R_score,

    -- Frequency Score: higher is better
    CASE 
      WHEN Frequency >= 50 THEN 5
      WHEN Frequency >= 30 THEN 4
      WHEN Frequency >= 20 THEN 3
      WHEN Frequency >= 10 THEN 2
      ELSE 1
    END AS F_score,

    -- Monetary Score: higher is better
    CASE 
      WHEN Monetary >= 1000 THEN 5
      WHEN Monetary >= 500 THEN 4
      WHEN Monetary >= 250 THEN 3
      WHEN Monetary >= 100 THEN 2
      ELSE 1
    END AS M_score
  FROM rfm_base
)

--Combine into RFM Score and Segment
SELECT
  CustomerID,
  Recency,
  Frequency,
  Monetary,
  R_score,
  F_score,
  M_score,
  R_score || F_score || M_score AS RFM_Score,
  CASE
    WHEN R_score = 5 AND F_score = 5 AND M_score = 5 THEN 'Champions'
    WHEN R_score = 5 AND F_score >= 4 THEN 'Loyal Customers'
    WHEN R_score >= 4 AND F_score >= 3 AND M_score >= 3 THEN 'Potential Loyalist'
    WHEN R_score <= 2 AND F_score <= 2 AND M_score <= 2 THEN 'At Risk'
    WHEN R_score = 1 AND F_score = 1 AND M_score = 1 THEN 'Lost'
    WHEN R_score >= 4 AND F_score = 1 THEN 'Recent but One-Time'
    WHEN F_score >= 4 AND M_score >= 4 THEN 'Big Spenders'
    ELSE 'Others'
  END AS Segment
FROM rfm_scores
ORDER BY RFM_Score DESC;


SELECT 
  InvoiceDate,
  Description,
  Quantity,
  UnitPrice,
  SUM(Quantity * UnitPrice) OVER (ORDER BY InvoiceDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_Revenue
FROM online_retail
WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0
ORDER BY InvoiceDate;


SELECT 
  CustomerID,
  ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
  RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Revenue_Rank
FROM online_retail
WHERE CustomerID IS NOT NULL AND InvoiceNo NOT LIKE 'C%'
GROUP BY CustomerID
ORDER BY Revenue_Rank;

SELECT 
  CustomerID,
  ROUND(SUM(Quantity * UnitPrice), 2) AS Monetary,
  NTILE(4) OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Monetary_Quartile
FROM online_retail
WHERE CustomerID IS NOT NULL AND InvoiceNo NOT LIKE 'C%'
GROUP BY CustomerID;

SELECT 
  a.Description AS Product_A,
  b.Description AS Product_B,
  COUNT(DISTINCT a.InvoiceNo) AS Times_Bought_Together
FROM online_retail a
JOIN online_retail b 
  ON a.InvoiceNo = b.InvoiceNo
  AND a.StockCode < b.StockCode 
WHERE a.InvoiceNo NOT LIKE 'C%'
  AND a.Quantity > 0 
  AND b.Quantity > 0
GROUP BY a.Description, b.Description
ORDER BY Times_Bought_Together DESC
LIMIT 20;



