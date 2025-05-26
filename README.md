# Retail Sales Insights & Customer Behavior Analysis (SQL)

This project analyzes a real-world transactional dataset from a UK-based online retail store using SQL. The focus is on uncovering customer behavior patterns, evaluating sales performance, and monitoring inventory metrics.

---

## Dataset Overview

- **Source:** [UCI Machine Learning Repository – Online Retail Dataset](https://archive.ics.uci.edu/ml/datasets/Online+Retail)  
- **Time Period:** December 1, 2010 – December 9, 2011  
- **Total Records:** 541,909 transactions  
- **File Used:** `Online Retail.xlsx` (converted to CSV for analysis)

---

## Data Dictionary

| Variable Name | Role       | Data Type   | Description                                                                 | Units     | Missing Values |
|---------------|------------|-------------|------------------------------------------------------------------------------|-----------|----------------|
| `InvoiceNo`   | Identifier | Categorical | Unique transaction code (prefix 'C' denotes cancellations)                   | —         | None           |
| `StockCode`   | Identifier | Categorical | Unique product code                                                         | —         | None           |
| `Description` | Feature    | Categorical | Product name                                                                 | —         | None           |
| `Quantity`    | Feature    | Integer     | Number of items purchased per transaction                                   | —         | None           |
| `InvoiceDate` | Feature    | DateTime    | Date and time of transaction                                                | —         | None           |
| `UnitPrice`   | Feature    | Float       | Product price per unit                                                      | Sterling  | None           |
| `CustomerID`  | Feature    | Categorical | Unique customer identifier                                                  | —         | None           |
| `Country`     | Feature    | Categorical | Customer’s country of residence                                             | —         | None           |

---

## Tools Used

- **SQL (SQLite)** – Querying and analyzing the data
- **DBeaver** – SQL IDE for running queries and exploration
- **Tableau** – Visualization and dashboard creation

### Data Preparation Steps
1. Cleaned and standardized column names
2. Ensured all data types were correctly formatted
3. Converted date formats to ISO standard

---

## Key Business Questions Answered

- What are the top-selling products?
- Which countries generate the most revenue?
- How do sales trend month by month?
- What is the average revenue per customer?
- What percentage of transactions are returns?
- How big is the average shopping basket?

---

## SQL Topics Covered

- Aggregations: `SUM`, `AVG`, `COUNT`
- Filtering: `WHERE`, `LIKE`, `BETWEEN`
- Date & Time functions
- Grouping: `GROUP BY`, `HAVING`
- CTEs & Subqueries
- Joins *(if extended to additional datasets)*
- Window Functions *(for advanced analysis like RFM)*

---
