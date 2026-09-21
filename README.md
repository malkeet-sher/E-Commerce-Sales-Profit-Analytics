# E-Commerce Sales & Profit Analytics

## Project Overview

This project analyzes e-commerce transaction data for **NovaCart E-Commerce** from a **Junior Data Analyst** perspective.

The objective was to evaluate sales and profit performance, product and category performance, discount impact, customer trends, return behavior, regional and channel performance, and monthly business trends.

## Business Requirements

Management wanted answers to the following questions:

- What are the overall sales and profit results?
- Which products generate the highest sales and profit?
- Which products have stronger profit margins?
- How are categories performing?
- How do discounts affect profitability?
- Which channels and regions perform better?
- Which customers contribute the most sales and profit?
- What is the impact of product returns?
- How does performance change month by month?

## Tools & Technologies

- Python — data cleaning and Exploratory Data Analysis (EDA)
- Pandas — data manipulation
- NumPy — numerical calculations
- SQL (Structured Query Language) — business analysis
- SQLite — database analysis
- Tableau Public — interactive dashboard
- GitHub — project documentation and version control

## Dataset

The raw dataset contains **5,005 rows** and **12 columns**.

Key fields include:

- Order ID
- Order Date
- Customer ID
- Product
- Category
- Region
- Quantity
- Unit Price
- Discount
- Sales
- Cost
- Channel

The raw data contains common real-world data quality issues including duplicate records, missing values, inconsistent text formatting, mixed discount formats, and return transactions.

## Data Cleaning

The dataset was cleaned and validated using Python and Pandas.

Main cleaning steps:

- Removed 5 duplicate rows
- Standardized Category, Region, and Channel values
- Handled missing Customer ID values
- Filled the missing Category using product-level category information
- Filled the missing Region with `UNKNOWN` where reliable inference was not possible
- Converted mixed discount formats into numeric decimal values
- Converted Order Date into a proper date format
- Reconstructed missing Quantity and Sales values using available transaction data
- Identified negative Quantity transactions as returns
- Created Profit and Profit Margin fields

After cleaning:

- **5,000 rows**
- **4,929 Sale orders**
- **71 Return orders**

## Key Business Results

### Overall Performance

- **Net Sales:** ₹237,972,050
- **Net Profit:** ₹59,716,980
- **Net Profit Margin:** 25.1%

### Product Performance

- Laptop generated the highest sales and profit.
- Mouse had a much lower revenue contribution but a profit margin of approximately **41.9%**.
- Smartphone generated high sales but a lower profit margin of approximately **18.6%**.

### Category Performance

- Electronics generated approximately **₹222.19 million** in sales.
- Accessories generated approximately **₹15.78 million** in sales.
- Accessories had higher unit volume, while Electronics generated much higher revenue because of product price mix.

### Monthly Performance

- **December:** highest monthly sales at approximately ₹22.38 million
- **June:** lowest monthly sales at approximately ₹15.41 million
- **November:** highest monthly profit at approximately ₹5.54 million

### Channel Performance

- App and Website generated similar sales and profit levels.
- Marketplace generated lower sales and profit compared with App and Website.

### Regional Performance

- East generated the highest sales among the named regions.
- North recorded the highest number of orders among the named regions.

### Return Analysis

- **71 return orders** were identified.
- Returns created approximately **₹1.23 million** negative sales impact.
- Smartphone had the highest number of return orders.
- Return activity was analyzed separately from normal sales transactions.

## SQL Analysis

The project includes SQL queries for:

- Overall business performance
- Product performance
- Category performance
- Monthly sales and profit
- Discount impact
- Channel performance
- Regional performance
- Return analysis
- Product return rate
- Top 10 customers by sales
- Top 10 customers by profit
- Average Order Value (AOV)
- Product profitability ranking
- Window-function based profitability analysis

## Tableau Dashboard

The interactive Tableau Public dashboard includes:

- Key Performance Indicator (KPI) cards
- Product Sales Performance
- Product Profit Performance
- Category Sales Performance
- Category Profit Performance
- Monthly Sales Trend
- Channel filtering

### Dashboard Preview

![E-Commerce Sales & Profit Dashboard](dashboard/E-Commerce%20Sales%20%26%20Profit%20Dashboard.png)

### Tableau Public

[View Interactive Dashboard](https://public.tableau.com/app/profile/malkeet.singh3211/viz/E-Commerce-Sales-Profit-Analytics/E-CommerceSalesProfitDashboard)

## Project Structure

```text
E-Commerce-Sales-Profit-Analytics/
│
├── dashboard/
│   ├── E-Commerce Sales & Profit Dashboard.png
│   └── E-Commerce-Sales-Profit-Analytics.twbx
│
├── data/
│   ├── ecommerce_orders_raw.csv
│   ├── ecommerce_orders_clean.csv
│   └── ecommerce_sales.db
│
├── python/
│   └── ecommerce_analysis.ipynb
│
├── sql/
│   └── ecommerce_analysis.sql
│
└── README.md
