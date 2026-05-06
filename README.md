# 🌍 Global Sales Analytics Intelligence Platform
### *Transforming Multi-Country Retail Data into Executive-Level Business Intelligence*

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Enterprise%20Warehouse-blue?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Advanced%20Analytics-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Interactive%20Dashboard-yellow?style=for-the-badge&logo=powerbi&logoColor=black)
![Statistics](https://img.shields.io/badge/Statistics-Hypothesis%20Testing-green?style=for-the-badge)
![Regression](https://img.shields.io/badge/Regression-Modeling-orange?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio%20Project-181717?style=for-the-badge&logo=github&logoColor=white)

---

# 📌 Project Overview

Modern retail organizations generate massive volumes of transactional data daily, yet many businesses struggle to transform raw sales records into meaningful strategic decisions.

This project presents a complete end-to-end retail sales analytics solution built using:

- PostgreSQL
- Advanced SQL
- Statistical Testing
- Regression Modeling
- Power BI
- Executive Reporting

The analysis was performed on a multi-country retail dataset covering:

- 🇨🇦 Canada
- 🇨🇳 China
- 🇮🇳 India
- 🇳🇬 Nigeria
- 🇬🇧 United Kingdom
- 🇺🇸 United States

The goal was to move beyond descriptive analytics and answer critical business questions:

- 🔎 What happened?
- 🧠 Why did it happen?
- 📈 What factors truly drive profitability?
- 🚀 What strategic actions should management take next?

The final outcome is a professional business intelligence solution combining data engineering, statistical analytics, and executive storytelling.

---

# ✨ Key Features & Deliverables

- 🏗️ Enterprise-grade PostgreSQL data warehouse
- 📊 Advanced SQL exploratory data analysis (EDA)
- 📈 Statistical hypothesis testing (T-Test, ANOVA, Chi-Square)
- 📉 Multiple regression modeling
- 📊 Interactive Power BI executive dashboard
- 📘 Board-level executive PDF report
- 🔍 Data quality validation and financial correction pipeline
- 🎯 Business-focused strategic recommendations

---

# 🏗️ Enterprise Data Architecture

A layered enterprise data architecture was implemented to ensure scalability, data quality, and analytics readiness.

| Layer | Purpose |
|---|---|
| RAW | Raw CSV ingestion without transformation |
| VALIDATION | Null checks, duplicate detection, data integrity validation |
| TRANSFORM | Cleaning, type conversion, metric calculation |
| FACT | Analytics-ready centralized fact table |

---

# 🛠️ Technologies Used

| Tool | Purpose |
|---|---|
| PostgreSQL | Data Warehouse |
| SQL | EDA & Business Analysis |
| Power BI | Dashboard & Visualization |
| Excel | Statistical Testing |
| Python (ReportLab) | Executive PDF Report Generation |
| pgAdmin 4 | Database Administration |

---

# 🔍 Data Integrity & Financial Correction

During exploratory analysis, several financial inconsistencies were identified:

- Unrealistic product cost structures
- Excessive discounts (up to 98%)
- Artificial negative profitability
- Margin instability

## ✅ Corrections Applied

- Reconstructed cost price using realistic pricing assumptions
- Standardized discount range between 0–40%
- Recalculated all financial KPIs
- Validated economic consistency across records

> Result: The dataset became economically realistic, analytics-ready, and suitable for executive decision-making.

---

# 📊 Exploratory Data Analysis (SQL)

The project answered several high-impact business questions.

## 🌍 Revenue Performance

- Which countries generate the highest revenue?
- Which months show strongest sales seasonality?
- How volatile is revenue performance?

## 📦 Profitability Analysis

- Which categories generate the highest profit?
- How do discounts impact margins?
- Which products are high-margin but low-volume?

## 👥 Customer Behavior

- Revenue contribution by age group
- Gender-wise profitability analysis
- Preferred payment methods by customer segment

## ⚠️ Risk & Stability Analysis

- Revenue volatility analysis (CV = 82%)
- Profit margin stability analysis (CV = 42%)
- Outlier detection using Z-score & IQR methods

---

# 🧪 Statistical Hypothesis Testing

The analysis moved beyond descriptive reporting into diagnostic analytics.

---

## 🔹 T-Test — Adult vs Senior Purchase Quantity

| Metric | Result |
|---|---|
| p-value | 0.728 |
| Cohen's d | 0.015 |

❌ No statistically significant difference in purchase quantity.

---

## 🔹 ANOVA — Store Location vs Profit Margin

| Metric | Result |
|---|---|
| p-value | 0.629 |
| Eta² | 0.0048 |

❌ Geography does not significantly influence profitability.

---

## 🔹 Chi-Square — Age Group × Payment Method

| Metric | Result |
|---|---|
| p-value | 0.107 |
| Cramer's V | 0.038 |

❌ Payment method preference is not dependent on age group.

---

# 📉 Multiple Regression Modeling

A multiple regression model was developed to identify the strongest drivers of profitability.

## 📊 Model Findings

| Variable | Impact | Result |
|---|---|---|
| Quantity Purchased | Strong Positive | ✅ Significant |
| Discount Applied | Weak | ❌ Not Significant |
| Price Per Unit | Slight Negative | ⚠️ Minor Effect |
| Country | Minimal | ❌ Not Significant |
| Category | Minimal | ❌ Not Significant |

## 🎯 Core Business Insight

> Profitability is primarily volume-driven.

After eliminating geography, demographics, category, discount strategy, and payment behavior, the only consistently significant predictor of profit margin was:

✅ Quantity Purchased

This suggests operational scale and basket size matter more than aggressive discounting strategies.

---

# 🔥 Key Business Findings

## 1️⃣ Discounts Do Not Drive Long-Term Profitability

Heavy discounting reduced revenue quality without meaningfully improving margin performance.

---

## 2️⃣ Geography Has Limited Impact

Country-level differences were statistically insignificant in determining profit margin.

---

## 3️⃣ Sales Volume Is the Primary Profit Driver

Higher purchase quantity consistently increased profitability across all regions.

---

## 4️⃣ Margin Stability Matters More Than Revenue Peaks

Several high-revenue periods showed unstable profitability due to discount leakage.

---

# 📊 Power BI Executive Dashboard

A professional 3-page interactive Power BI dashboard was developed for executive stakeholders.

---

## 📌 Executive Summary

- KPI Cards
- Revenue Trends
- Country Comparison
- Profitability Overview

---

## 🌍 Regional Deep Dive

- Geographic Sales Analysis
- Store-Level Performance
- Category Profit Matrix
- Heatmap Analysis

---

## 👥 Customer Analytics

- Age × Gender Treemap
- Payment Method Distribution
- Discount Sensitivity Analysis
- Customer Segment Insights

---

# 🚀 Advanced Dashboard Features

- Dynamic Top N Analysis
- Interactive Slicers
- Drill-through Navigation
- KPI vs Target Tracking
- Cross-filtering
- Executive Storytelling Layout

---

# 📷 Dashboard Preview

## Executive Dashboard

<!-- Replace with dashboard screenshot -->
<img width="1400" alt="Global Sales Dashboard" src="YOUR_DASHBOARD_IMAGE_LINK">

---

# 📘 Executive Report

A board-level executive PDF report was created summarizing:

- Data governance process
- Validation framework
- Statistical findings
- Regression insights
- Strategic business recommendations

📎 File Included:
`Global_Sales_Executive_Report_2025.pdf`

---

# 🧠 Strategic Recommendations

Instead of focusing on:

- ❌ Aggressive discounting
- ❌ Geographic restructuring
- ❌ Demographic segmentation

The analysis recommends focusing on:

- ✅ Increasing basket size
- ✅ Cross-selling & upselling
- ✅ Operational efficiency
- ✅ Seasonal inventory planning
- ✅ Revenue stability optimization

---

# 🚀 Business Impact

Expected business outcomes include:

- 📈 4–7% potential margin improvement
- 📊 Improved revenue consistency
- 💰 Reduced profit leakage
- 🎯 Better pricing strategy
- 🏪 Improved inventory planning
- 📉 Better operational efficiency

---

# 🗂️ Repository Structure

```plaintext
GLOBAL-SALES-DATA-ANALYSIS/
│
├── 📁 DATA/
│   ├── sales_Canada.csv
│   ├── sales_China.csv
│   ├── sales_India.csv
│   └── ...
│
├── 📁 SQL/
│   ├── schema_creation.sql
│   ├── data_validation.sql
│   ├── eda_queries.sql
│   └── regression_queries.sql
│
├── 📁 POWERBI/
│   └── Sales_Data.pbix
│
├── 📁 REPORT/
│   └── Global_Sales_Executive_Report_2025.pdf
│
├── 📁 DASHBOARD_SCREENSHOTS/
│
└── README.md
```

---

# 🎓 Skills Demonstrated

- Enterprise Data Modeling
- Advanced SQL Analytics
- Statistical Thinking
- Hypothesis Testing
- Business Intelligence
- Data Visualization
- Executive Storytelling
- Dashboard Design
- Data Validation & Governance
- Business Strategy Communication

---

# 🔮 Future Enhancements

- Predictive sales forecasting
- Customer segmentation using clustering
- Real-time Power BI refresh pipeline
- Automated anomaly detection
- Streamlit analytics web application
- Machine learning-based profit prediction

---

# 👨‍💻 Author

## Subhamoy Hazra

Aspiring Data Analyst specializing in:

- SQL
- PostgreSQL
- Power BI
- Statistical Analytics
- Business Intelligence

🔗 GitHub: https://github.com/Su-Xmt-007

---

# ⭐ Final Note

This project demonstrates the complete lifecycle of a modern analytics solution:

- Data Engineering
- Data Validation
- SQL Analytics
- Statistical Testing
- Business Intelligence
- Executive Reporting

If you found this project valuable, consider giving it a ⭐ on GitHub.
