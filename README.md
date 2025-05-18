**#** Rakuten E-Commerce Sales Forecasting & Inventory Optimization

**Goal**: Predict future sales and recommend optimal inventory levels for an online retailer using real-world e-commerce data.

## 🚀 Overview

This end-to-end data science project includes:
- Data cleaning and preprocessing (SQL, Pandas)
- Exploratory Data Analysis (EDA)
- Predictive modeling using time series regression
- Interactive Tableau dashboards
- Optional Streamlit app for sales prediction

## 🛠️ Tools & Technologies
- **Languages**: Python, SQL
- **Libraries**: Pandas, NumPy, Scikit-learn, XGBoost, Matplotlib, Seaborn
- **Platforms**: Jupyter Notebook, Tableau, Streamlit
- **Techniques**: Regression, Time Series Forecasting, Feature Engineering, Lag Features

## 🧩 Project Structure

```
rakuten-sales-forecasting/
│
├── data/
│   ├── raw/             # Original Rakuten data
│   ├── processed/       # Cleaned & feature-rich datasets
│   └── for_tableau/     # Exported data for Tableau dashboards
│
├── notebooks/
│   ├── 01_EDA.ipynb
│   └── 02_Modeling.ipynb
│
├── sql/
│   └── queries.sql      # SQL queries for data exploration
│
├── tableau/
│   └── dashboards.twb   # Tableau workbook and screenshots
│
├── streamlit_app/
│   └── app.py           # Optional app for interactive predictions
│
├── README.md
└── requirements.txt
```

## 📊 Tableau Dashboards
- **Sales Overview**: Track total sales, top products, revenue trends
- **Category Insights**: Category-level analysis over time
- **Inventory Alerts**: Identify understocked or overstocked items
- **Forecasting Panel**: Compare actual vs. predicted sales

## 🤖 Modeling
- Feature engineering from time-based and historical sales data
- Handled missing values and outliers
- Trained XGBoost and Random Forest regressors
- Evaluated performance using RMSE and MAE
- Deployed forecasts for next 30 days by product/category

## ✅ Results
- Achieved predictive accuracy within ±10% of actual sales on average
- Enabled inventory managers to reduce overstock and anticipate demand spikes
- Created dashboards to drive decision-making for non-technical stakeholders

## 💡 Future Work
- Incorporate pricing, promo, or external data (weather, holidays)
- Add LSTM/Prophet for sequence-based forecasting
- Improve interactivity in Streamlit and Tableau

---

**Author**: Kyle Shiroma  
**GitHub**: [@k-shiroma-code](https://github.com/k-shiroma-code)  
**Email**: kyleshiroma77@gmail.com
