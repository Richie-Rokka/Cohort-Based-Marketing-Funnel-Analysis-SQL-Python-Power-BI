# 📊 Cohort-Based Marketing Funnel Analysis  
**From Misleading Snapshots to Accurate Conversion Insights**

---

## 🚀 Overview

Most marketing funnel analyses rely on **snapshot data**, which can lead to misleading conclusions about performance.

In this project, I rebuilt a funnel analysis using a **cohort-based approach** to accurately track how leads convert over time and uncover true performance patterns.

> 💡 Key Shift: From *“What does performance look like now?”* → to *“How does performance evolve over time?”*

---

## 🎯 Business Problem

A traditional funnel analysis suggested that:
- February outperformed March in conversion rates

However, this raised a critical question:

> ❓ *Are we measuring performance correctly, or just misinterpreting time-based data?*

---

## ⚠️ The Problem with Snapshot Analysis

Snapshot funnel analysis:
- Captures performance at a single point in time  
- Ignores how long leads have had to convert  
- Can unfairly compare newer vs older leads  

### Result:
❌ Overestimation of recent performance  
❌ Misleading channel effectiveness  
❌ Poor decision-making  

---

## 🧠 Solution: Cohort-Based Analysis

To solve this, I implemented a **cohort analysis framework**:

- Grouped leads by acquisition period (monthly cohorts)  
- Tracked each cohort’s conversion over time  
- Compared performance across cohorts based on lifecycle stage  

---

## 🛠️ Tools & Technologies

- **SQL (BigQuery)** → Data extraction & transformation  
- **Python (Pandas)** → Data cleaning & cohort structuring  
- **Power BI** → Visualization & storytelling  

---

## 📊 Analytical Approach

### Step 1 — Data Preparation
- Cleaned and structured funnel dataset  
- Validated conversion stages (Lead → MQL → SQL → Customer)  

### Step 2 — Cohort Structuring
- Grouped leads by acquisition month  
- Created time-based conversion tracking  

### Step 3 — Analysis
- Measured conversion rates per cohort over time  
- Compared early vs late cohort performance  

---

## 📈 Key Insights

### 1. Time Drives Conversion Performance
- Earlier cohorts showed higher conversion rates  
- Not due to better performance, but **longer time to convert**

---

### 2. Majority of Conversions Happen Early
- Most conversions occurred within the **first 30 days**  
- Conversion probability drops significantly afterward  

---

### 3. Recent Cohorts Are Misleading
- Lower conversion rates were observed  
- Root cause: **insufficient observation window**, not poor performance  

---

## 📉 Business Impact

Without cohort analysis:
- Teams may **shift budget away from recent campaigns prematurely**
- Underestimate **conversion timelines**
- Misalign **performance expectations**

With cohort analysis:
- ✅ Better forecasting of conversions  
- ✅ Improved campaign evaluation  
- ✅ Smarter budget allocation  

---

## 🔍 Before vs After

| Approach | Insight Quality | Risk |
|----------|---------------|------|
| Snapshot Analysis | Low | Misleading conclusions |
| Cohort Analysis | High | Accurate decision-making |

---

## 💡 Key Takeaways

- **Time is a critical variable in funnel analysis**  
- Snapshot ≠ Cohort analysis  
- Data interpretation matters as much as data itself  

> 👉 *Good analysis is not just about data — it's about context.*

---

## 📊 Dashboard Highlights

- Cohort conversion trends  
- Time-to-conversion analysis  
- Funnel performance comparison across cohorts  

---

## 🧩 Limitations

- Dataset size and structure may limit generalization  
- Assumes consistent tracking across funnel stages  
- No external factors (seasonality, campaigns) included  

---

## 🔮 Future Improvements

- Integrate **channel-level cohort analysis**  
- Add **predictive modeling for conversion forecasting**  
- Include **time-to-event survival analysis**  

---

## 📚 Key Learnings

- Importance of choosing the right analytical framework  
- Difference between descriptive vs temporal analysis  
- How to translate technical findings into business insights  

---

## 🔗 Project Links

- 📂 GitHub Repository: *([Add your link here](https://github.com/Richie-Rokka/Cohort-Based-Marketing-Funnel-Analysis-SQL-Python-Power-BI))*  
- 📊 Dashboard Preview: *(Add Power BI screenshot or link)*  

---

## 👤 Author

**Abodunrin (Richard) Oketade**  
Data Analyst | Business Intelligence | Revenue & Operations Analytics  

> “Turning data into business decisions.”
