# HR Employee Insights – Power BI Dashboard

<p align="center">
  <img src="assets/logo.png" alt="Logo" width="140"/>
</p>

<h1 align="center">HR Employee Insights – Power BI Dashboard</h1>

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)


A comprehensive HR analytics dashboard built using **Power BI**, designed to uncover insights about workforce demographics, attrition, satisfaction, compensation, and overall employee experience.

This project transforms raw HR data into actionable insights that support data-driven decision-making for HR teams and leadership.

---

## 📌 Project Overview

The HR Employee Insights Dashboard provides a 360° view of the workforce, including:

- **Employee demographics & distribution**
- **Attrition & retrenchment trends**
- **Satisfaction & engagement indicators**
- **Salary & compensation analysis**
- **Performance relationships with tenure, job role, and satisfaction**

All pages are supported by slicers, KPIs, and interactive visualizations.

📄 *Detailed insight analysis:* `docs/Report_Insights_Analysis.md`

---

## 🗂 Project Structure

```md
HR-Employee-Insights-Dashboard/
│
├── assets/
│   ├── dashboard/
│   │   ├── 01_overview.png
│   │   ├── 02_attrition_retrenchment.png
│   │   ├── 03_satisfaction_environment.png
│   │   └── 04_salary_compensation.png
│   │
│   └── wallpapers/
│       ├── page1.svg
│       ├── page2.svg
│       └── page3.svg
│
├── data/
│   ├── HR_EmployeeInfo.csv
│   ├── HR_Performance.csv
│   ├── HR_Satisfaction.csv
│   └── HR_MasterDataset.csv
│
├── docs/
│   └── Report_Insights_Analysis.md
│
├── HR analytics.pbix
└── README.md
```

---

## 🛠 Tech Stack

| Tool | Purpose |
|------|---------|
| **Power BI** | Initial cleaning & validation, Data modeling, DAX, dashboard development |
| **Figma (optional)** | Page backgrounds & UI assets |

---

## 📊 Dashboard Pages

### **1️⃣ Overview**
Summarizes workforce characteristics:

- **Total Employees:** 1,470+  
- **Attrition Rate:** 16%  
- **Average Age:** 37  
- **Promotion Rate:** 40%  
- **Frequent Travelers:** 277  
- **Average Salary:** 6.50K  
- **Total Exited Employees:** 237  
- **Employee Performance Breakdown:** 226 High Performers, 1K Medium Performers  

---

### **2️⃣ Attrition & Retrenchment Analysis**
Key indicators:

- **Attrition Rate:** 16%  
- **Total Attrition:** 237  
- **Retrenchment Rate:** 8%  
- **Retrenched Employees:** 117  
- Highest attrition found in:
  - Laboratory Technicians  
  - Sales Executives  
  - Research Scientists  
- Young age groups (26–35) show highest attrition  
- Salary band **0–3K** has highest turnover  

---

### **3️⃣ Satisfaction & Work Environment**

- **Avg Job Satisfaction:** 2.73  
- **Avg Environment Satisfaction:** 2.72  
- **Avg Work-Life Balance:** 2.76  
- **Low Satisfaction Rate:** 82%  
- Overtime significantly reduces satisfaction  
- Strong correlation between low satisfaction & high attrition  

---

### **4️⃣ Salary & Compensation Analysis**

- **Avg Monthly Salary:** 6.50K  
- **Median Salary:** 4.92K  
- **Highest Paying Department:** Sales  
- **Gender Pay Gap:** -5%  
- **Salary Growth Curve** peaks between 15–25 years experience  
- Education level strongly predicts income  

---

## 🧹 Data Preparation Summary

### **Raw Data Issues Fixed**
- Inconsistent salary formats  
- Missing performance values  
- Duplicates  
- Null satisfaction entries  
- Mismatched job roles  

### **Transformations**
- Standardized columns  
- Created age groups + salary bands  
- Merged performance + satisfaction + employee info  
- Cleaned nulls & invalid data  

---

## 🧠 Key Insights (Summary)

- Employees aged **26–35** are most attrition-prone  
- Salary band **0–3K** strongly correlates with attrition  
- **R&D** has the largest workforce  
- Overtime reduces job & environment satisfaction  
- Higher education = significantly higher compensation  
- Sales is highest-paying but not highest satisfaction  

---


## 👤 About the Developer

**Reem Barqawi**  
📧 Email: reeembarqawi@gmail.com  
🔗 LinkedIn: https://www.linkedin.com/in/reem-barqawi200  


<div align="center">

⭐ **If you found this project helpful, please give it a star!**  
Made with 💚 by **Reem Barqawi**

</div>
