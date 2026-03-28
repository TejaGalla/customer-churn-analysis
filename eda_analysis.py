import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("dataset.csv")

print("Total Customers:", len(df))
print("Churn Rate %:", round((df["Churn"] == "Yes").mean() * 100, 2))
print("Average Monthly Charges:", round(df["MonthlyCharges"].mean(), 2))
print("Average Tenure:", round(df["Tenure"].mean(), 2))

df["Churn"].value_counts().plot(kind="bar", title="Churn Distribution")
plt.tight_layout()
plt.savefig("images/churn_distribution.png")
plt.close()

df.groupby("Churn")["MonthlyCharges"].mean().plot(kind="bar", title="Average Monthly Charges by Churn")
plt.tight_layout()
plt.savefig("images/avg_monthly_charges_by_churn.png")
plt.close()

contract_churn = df.groupby(["Contract", "Churn"]).size().unstack(fill_value=0)
contract_churn.plot(kind="bar", title="Churn by Contract Type")
plt.tight_layout()
plt.savefig("images/churn_by_contract.png")
plt.close()

internet_churn = df.groupby("InternetService")["Churn"].apply(lambda s: (s == "Yes").mean() * 100)
internet_churn.plot(kind="bar", title="Churn Rate by Internet Service")
plt.tight_layout()
plt.savefig("images/churn_rate_by_internet_service.png")
plt.close()

print("Charts saved in images folder.")
