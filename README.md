# 🛍️ Retail Sales Insights & Customer Behavior Analysis (SQL + Tableau)

This project analyzes a real-world transactional dataset from a UK-based online retail store using SQL. We explore customer behavior, sales performance, and inventory metrics, then visualize key insights with Tableau.

## 📊 Dataset

**Source:** [UCI Machine Learning Repository - Online Retail Dataset](https://archive.ics.uci.edu/ml/datasets/Online+Retail)  
**Period Covered:** December 1, 2010 – December 9, 2011  
**Size:** 541,909 transactions  
**File:** `Online Retail.xlsx` (converted to CSV)

## 🧾 Variables Table

| Variable Name | Role      | Type        | Description                                                                 | Units     | Missing Values |
|---------------|-----------|-------------|-----------------------------------------------------------------------------|-----------|----------------|
| InvoiceNo     | ID        | Categorical | A 6-digit code uniquely assigned to each transaction. Codes starting with 'C' indicate cancellations. | —         | No             |
| StockCode     | ID        | Categorical | A 5-digit code uniquely assigned to each distinct product.                  | —         | No             |
| Description   | Feature   | Categorical | Product name.                                                               | —         | No             |
| Quantity      | Feature   | Integer     | Number of items purchased per product per transaction.                      | —         | No             |
| InvoiceDate   | Feature   | Date        | Date and time when each transaction was generated.                          | —         | No             |
| UnitPrice     | Feature   | Continuous  | Product price per unit.                                                     | Sterling  | No             |
| CustomerID    | Feature   | Categorical | A 5-digit code uniquely assigned to each customer.                          | —         | No             |
| Country       | Feature   | Categorical | Country where the customer resides.                                         | —         | No             |

## 🛠️ Tools Used

- **SQL** (SQLite)
- **Tableau** for visualization

## 🔍 Key Questions Answered

- 🧾 What are the top-selling products?
- 🌍 Which countries generate the most revenue?
- 📅 How do sales trend monthly?
- 💰 What is the average revenue per customer?
- ❌ What percentage of transactions are returns?
- 🛒 How big is the average shopping basket?

## 🧠 SQL Topics Covered

- Aggregation (`SUM`, `AVG`, `COUNT`)
- Filtering (`WHERE`, `LIKE`, `BETWEEN`)
- Date & time functions
- Grouping (`GROUP BY`, `HAVING`)
- CTEs & Subqueries
- Joins (if extended to other tables)
- Window Functions (for RFM analysis)

## 📈 Tableau Dashboard Highlights

- Revenue by Country Code
