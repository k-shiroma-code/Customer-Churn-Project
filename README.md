# Online Retail Sales Analysis

## Overview
This project analyzes a UK-based online retail dataset using **SQL** for data transformation and analysis, and **Tableau** for interactive visualization. The goal is to uncover actionable business insights related to sales trends, customer behavior, and product relationships. A key part of the analysis includes **RFM (Recency, Frequency, Monetary)** segmentation to classify customers into behavioral groups.

---

## Data Cleaning and Transformation
- Renamed ambiguous columns with descriptive names (`InvoiceNo`, `StockCode`, `Description`, etc.).
- Casted data to appropriate types (e.g., integers for `Quantity`, reals for `UnitPrice`).
- Removed rows representing returns (invoices starting with "C").
- Standardized inconsistent date formats into SQL date format for time-based analysis.

---

## Analyses Performed

### 1. Top-Selling Products
Identified products generating the highest revenue.

### 2. Geographic Sales Distribution
Summarized total revenue by country to identify major markets.

### 3. Monthly Sales Trends
Tracked changes in revenue over time to detect seasonality and business cycles.

### 4. Customer Insights with RFM Segmentation
Performed Recency-Frequency-Monetary analysis to segment customers into:
- Big Spenders  
- Recent but One-Time  
- At Risk  
- Others  

### 5. Return Rate Analysis
Filtered and analyzed return transactions to understand customer return behavior and its effect on revenue.

### 6. Shopping Basket Metrics
Calculated the average number of items and monetary value per invoice to evaluate customer purchasing patterns.

### 7. Market Basket Analysis
Used self-joins to identify frequently purchased product pairs, revealing cross-selling opportunities.

### 8. Customer Ranking & Quartiles
Applied window functions to rank customers by revenue and classify them into quartiles based on spending behavior.

---

## Tableau Visualization

An interactive dashboard was created using Tableau to enhance understanding of RFM segments and customer patterns.

**Key Views in the Dashboard:**
- RFM Segment Distribution (bar chart)
- Recency vs. Frequency (scatter plot)
- Monetary Value by Segment (bar chart)

---

## Key Insights
- A small group of products and customers drive a large share of revenue.
- Sales show seasonality, with peaks indicating high-demand periods.
- RFM segmentation reveals valuable customer groups for personalized marketing.
- Common product bundles suggest potential for increasing basket size via recommendations.

---

## Future Work
- Incorporate customer demographic or behavioral data to refine segmentation.
- Apply machine learning models to predict high-value customers and churn.
- Expand Tableau dashboards to include filters and interactivity for end users.

---

## How to Run This Project
1. Import the `online_retail.csv` dataset into your SQL database.
2. Run the provided SQL scripts for cleaning and schema setup.
3. Execute the analysis queries sequentially to generate insights.
4. Export the results for visualization or import into Tableau for dashboards.

---
