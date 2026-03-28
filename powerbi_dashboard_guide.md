# Power BI Dashboard Guide

## Recommended DAX Measures
Total Customers = COUNT(dataset[CustomerID])
Churned Customers = CALCULATE(COUNT(dataset[CustomerID]), dataset[Churn] = "Yes")
Retained Customers = CALCULATE(COUNT(dataset[CustomerID]), dataset[Churn] = "No")
Churn Rate % = DIVIDE([Churned Customers], [Total Customers], 0) * 100
Avg Monthly Charges = AVERAGE(dataset[MonthlyCharges])
Avg Tenure = AVERAGE(dataset[Tenure])

## Page 1 Visuals
- KPI Cards
- Churn Distribution
- Average Monthly Charges by Churn
- Churn by Contract Type
- Churn Rate by Internet Service

## Page 2 Visuals
- Churn Rate by Payment Method
- Churn Rate by Tenure Group
- Contract Analysis
- Charge Comparison by Churn
