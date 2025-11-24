# 📄 Dataset Cleaning Summary

This folder contains both the **raw datasets** and the **cleaned datasets** used to build the **Student Performance Dashboard**.  
All cleaning was completed using **Excel Power Query** before loading the data into the Data Model.

---

## 🧹 1. Standardized Column Names
- Renamed columns for clarity and consistency  
- Removed extra spaces and special characters  
- Unified key fields such as `Student_ID`, `Subject`, and `Date`

---

## 🔢 2. Corrected Data Types
- Converted ID and text fields → **Text**
- Converted exam scores & homework percentages → **Decimal Number**
- Converted date columns → **Date**

---

## 🗑️ 3. Removed Invalid or Duplicate Records
- Deleted empty rows and rows with missing key values  
- Removed duplicate records  
- Ensured no corrupted or inconsistent entries remained

---

## 🎯 4. Cleaned Exam & Homework Fields
- Fixed percentages stored as text  
- Corrected invalid values (e.g., scores above 100)  
- Standardized homework completion percentages

---

## 📘 5. Cleaned Attendance Records
- Standardized labels:  
  `Present`, `Absent`, `Late`, `Excused`, `Left Early`
- Ensured attendance fields are text and consistently formatted  
- Removed invalid or extra entries

---

## 🔗 6. Data Model Preparation
- Loaded each cleaned table into the **Excel Data Model**
- Built **1-to-many relationships** using `Student_ID`
- Ensured no duplicates exist in the `students` table (primary key)

---

✔️ The cleaned data is now ready for analysis, pivot tables, and dashboard visuals.

