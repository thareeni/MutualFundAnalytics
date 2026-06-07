import os
import pandas as pd

# STEP 1: Load raw data
df = pd.read_csv("data/raw/01_fund_master.csv")

# STEP 2: Basic cleaning
df = df.drop_duplicates()
df = df.ffill()
df.columns = df.columns.str.strip().str.lower()

# STEP 3: Create folder if not exists
os.makedirs("data/processed", exist_ok=True)

# STEP 4: Save cleaned file
df.to_csv("data/processed/cleaned.csv", index=False)

print("ETL completed successfully ✔")