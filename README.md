# Online Retail Sales Analysis Project

## Overview
This project analyzes the Online Retail dataset from a UK-based online store using SQL. It focuses on cleaning and transforming raw data, followed by extracting actionable business insights related to sales performance, customer behavior, and product relationships.

## Data Cleaning and Transformation
- Renamed ambiguous columns with meaningful names (e.g., `InvoiceNo`, `StockCode`, `Description`, etc.).
- Converted data types to appropriate formats (e.g., integers for `Quantity` and `CustomerID`, real numbers for `UnitPrice`).
- Removed metadata rows and filtered out return transactions (invoices starting with 'C').
- Parsed inconsistent date formats into a standardized SQL date format.

## Key Analyses Performed
1. **Top-selling Products**  
   Identified the best-selling products by total revenue.

2. **Geographic Sales Distribution**  
   Analyzed revenue contributions by country.

3. **Monthly Sales Trends**  
   Tracked sales revenue over time to detect seasonality.

4. **Customer Insights**  
   - Calculated average revenue per customer.  
   - Conducted Recency-Frequency-Monetary (RFM) analysis to segment customers into meaningful groups (e.g., Champions, Loyal Customers, At Risk).

5. **Return Rate Analysis**  
   Estimated the percentage of transactions that were returns.

6. **Shopping Basket Analysis**  
   Calculated average basket size (items per invoice) and average basket value.

7. **Market Basket Analysis**  
   Identified product pairs frequently purchased together.

8. **Customer Ranking & Segmentation with Window Functions**  
   Used window functions to rank customers by revenue and assign quartiles based on monetary value.

## Challenges
- Handling inconsistent and non-standard date formats for proper analysis.
- Filtering and excluding return transactions to focus on revenue-generating sales.
- Implementing RFM segmentation and scoring logic using SQL CASE statements.
- Performing market basket analysis through self-joins to detect product affinities.

## Results & Insights
- Top products generate a significant portion of revenue, indicating best sellers.
- Certain countries dominate revenue, revealing key market opportunities.
- Sales exhibit seasonality, with identifiable peaks in monthly revenue.
- Customer segmentation highlights distinct groups for targeted marketing.
- Product affinity analysis uncovers common product bundles for potential cross-selling.

## Future Work
- Integrate customer demographic data to enrich segmentation.
- Implement predictive models to forecast sales trends.
- Develop interactive dashboards to visualize insights.

## How to Run This Project
1. Import the `online_retail.csv` dataset into your SQL database.
2. Run the provided data cleaning and schema setup SQL scripts.
3. Execute the analysis queries sequentially to generate insights.
4. Export query results for further visualization or reporting.

---
