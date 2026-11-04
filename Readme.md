# 📊 Sales & Profitability Business Intelligence Dashboard

> **Portfolio Project** | End-to-end data analysis exploring 9,994 retail transactions to uncover hidden profit leaks and regional discounting anomalies.

## 📌 Executive Summary

This project investigates the profitability of a retail Superstore dataset (\$2.30M in total sales, $286K in net profit). While top-line aggregates suggest a healthy business, granular analysis reveals severe margin erosion driven by specific product categories and aggressive regional discounting.

* **Key Objective:** Identify loss-making segments and provide data-driven recommendations for executive decision-making.

* **Tools & Tech Stack:** MySQL, Star Schema Architecture, SQL Validation Queries, Power BI, DAX.

## 🏗️ Data Architecture & Modeling

* **Database Engine:** MySQL (`datashop` database) utilizing an optimized **Star Schema**:

  * `fact_sales` (9,994 transactions)

  * `dim_products` (1,862 products)

  * `dim_customers` (793 customers)

  * `dim_locations` (632 locations)

## 🔍 Key Findings & SQL Validation

### 1. The Furniture Profitability Paradox

While Furniture generated **\$742K in sales**, it yielded a meager **\$18.5K in profit** (a 2.5% net margin vs. 12.5% company average).

* **Tables** emerged as the single largest loss-maker, generating **-\$17,725** in net losses.

* SQL validation proved that **63.6% of all Tables orders (203 out of 319)** were sold at a net loss due to an average discount of **26.13%**.

```
-- SQL Query used to isolate loss-making sub-categories
SELECT 
    dp.Category, 
    dp.Sub_Category, 
    COUNT(*) AS Total_Orders, 
    SUM(CASE WHEN fv.profit < 0 THEN 1 ELSE 0 END) AS Loss_Transactions
FROM dim_products dp
JOIN fact_sales fv ON fv.Product_ID = dp.Product_ID
GROUP BY dp.Category, dp.Sub_Category
ORDER BY Loss_Transactions DESC;

```

### 2. Regional Discount Anomalies

* **Philadelphia, Houston, and Chicago** rank among top cities by sales volume but operate at severe net losses (e.g., Philadelphia at **-\$13.8K**).

* **Root Cause:** Excessive average discounting ranging between **33%–38%** in these metropolitan areas, compared to \~6% in profitable regions like New York City.

## 💡 Strategic Recommendations

1. **Cap Discounts on Tables:** Enforce a strict discount ceiling of 15–20% to prevent severe margin erosion.

2. **Overhaul Regional Pricing Policies:** Re-evaluate discounting strategies in underperforming metropolitan hubs (Philadelphia, Houston, Chicago) to align with profitable regions.