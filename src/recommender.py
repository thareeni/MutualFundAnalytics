import pandas as pd

# Load performance data
funds = pd.read_csv("../data/raw/07_scheme_performance.csv")

risk = input("Enter Risk Appetite (Low / Moderate / High): ").strip()

filtered = funds[
    funds["risk_grade"].str.lower() == risk.lower()
]

top3 = filtered.sort_values(
    by="sharpe_ratio",
    ascending=False
).head(3)

print("\nTop 3 Recommended Funds\n")
print(top3[[
    "scheme_name",
    "fund_house",
    "category",
    "sharpe_ratio"
]])