# 📊 Profit Leakage Analysis (Excel • SQL • Power BI)

## 🔍 Project Overview
This project focuses on identifying and analyzing **profit leakage** in a retail business by examining
discounting strategies, customer behavior, order quality, and product performance.
The objective is to uncover **why high sales do not always translate into high profit**
and to provide actionable insights for improving profitability.

The project follows an **end-to-end data analytics workflow**:
**Excel & Power Query → SQL → Power BI**.

---

## 🧱 End-to-End Workflow

### 1️⃣ Data Cleaning & Preparation (Excel + Power Query)
- Cleaned raw retail sales data
- Handled date formatting issues
- Standardized column names and values
- Created derived fields such as:
  - Profit Margin
  - Loss Flag
  - Discount Bands
- Ensured data quality before loading into SQL

### 2️⃣ Data Modeling & Analysis (SQL – MySQL)
- Designed relational schema for analytical reporting
- Loaded cleaned data into SQL database
- Performed business analysis using SQL:
  - Overall sales and profit KPIs
  - Loss-making products and customers
  - Discount impact on profit margins
  - Region and segment-wise performance
- Validated business logic using SQL aggregations and filters

### 3️⃣ Data Visualization & Storytelling (Power BI)
- Connected Power BI directly to SQL database
- Built interactive dashboards using DAX measures
- Designed executive-level KPIs and analytical visuals
- Focused on storytelling and decision support

---

## 📈 Dashboards Created

### 📌 Dashboard 1: Profit Leakage & Margin Optimization
**Business Question:**  
*Where is profit leaking across the business?*

**Key Insights:**
- High discounts (>20%) significantly reduce profitability
- Certain regions generate strong sales but weak profit
- Some sub-categories are structurally unprofitable
- High sales volume does not guarantee high profit

---

### 📌 Dashboard 2: Customer & Order Quality Analysis
**Business Question:**  
*Who and what type of orders are causing losses?*

**Key Insights:**
- A small percentage of customers contribute disproportionately to losses
- Loss orders form a significant portion of total orders
- Certain customer segments show low average profit per order
- Improving order quality can significantly improve overall margins

---

## 📊 Key KPIs Used
- Total Sales
- Total Profit
- Profit Margin %
- Total Orders
- Loss Orders %
- Total Customers
- Loss Customers %
- Average Profit per Order

---

## 🛠 Tools & Technologies
- **Excel** – Initial exploration and formatting
- **Power Query** – Data cleaning, transformation, and feature creation
- **SQL (MySQL)** – Data modeling and analytical querying
- **Power BI Desktop** – Visualization, DAX measures, and dashboards

---

## 🏗️ Repository Architecture

This project follows a modular structure to separate raw ingestion, logic processing, and visual presentation.


profit-leakage-analysis/
│
├── 📂 data/ ..................... [The Foundation]
│   ├── raw_superstore_data.csv      # Initial dataset (unprocessed)
│   └── cleaned_sales_data.csv       # Post-ETL dataset ready for BI
│
├── 📂 sql/ ...................... [The Engine Room]
│   ├── schema.sql                   # Table creation & definitions
│   └── data_analysis.sql            # Queries for churn & leakage logic
│
├── 📂 powerbi/ .................. [The Cockpit]
│   └── Profit_Leakage_Analysis.pbix # Interactive Dashboard file
│
├── 📂 screenshots/ .............. [The Preview]
│   ├── dashboard_profit_leakage.png # Static view of leakage metrics
│   └── dashboard_customer_quality.png # Customer segmentation view
│
├── .gitignore ................... [System]
└── README.md .................... [Documentation]


---

## 💡 Business Value & Conclusion
This project demonstrates how combining **Excel-based data preparation,
SQL-driven analysis, and Power BI visualization**
can uncover hidden profit leaks and support better business decisions.

The analysis highlights that:
- Discount strategies must be carefully controlled
- Customer quality matters as much as customer quantity
- Profitability should be analyzed beyond topline sales

---

## 🚀 Next Steps
- Extend analysis with time-based trends
- Introduce customer lifetime value (CLV)
- Simulate pricing or discount optimization scenarios

---

## 💡 Business Value & Conclusion

This project demonstrates how combining **Excel-based data preparation,
SQL-driven analysis, and Power BI visualization**
can uncover hidden profit leaks and support better business decisions.

The analysis highlights that:
- Discount strategies must be carefully controlled
- Customer quality matters as much as customer quantity
- Profitability analysis should go beyond top-line sales

---

## 🚀 Future Enhancements
- Time-based trend analysis (YoY / MoM)
- Customer lifetime value (CLV) analysis
- Discount optimization and pricing simulations


---

---

## 👤 Author

**Gangisetti Jashwanth**  

📧 Email: [jashwanth.gangisetti@gmail.com](mailto:jashwanth.gangisetti@gmail.com)  
🔗 LinkedIn: https://www.linkedin.com/in/jashwanth-gangisetti/  
💻 GitHub: https://github.com/Jashwanth0811  


Feel free to connect with me for feedback, collaboration, or data analytics opportunities.
