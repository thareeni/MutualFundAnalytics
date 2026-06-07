import pandas as pd
import sqlite3
import os

# Load cleaned data
df = pd.read_csv("data/processed/cleaned.csv")

# Create db folder if not exists
os.makedirs("data/db", exist_ok=True)

# Connect SQLite database
conn = sqlite3.connect("data/db/bluestock_mf.db")

# Load data into table
df.to_sql("mutual_funds", conn, if_exists="replace", index=False)

conn.commit()
conn.close()

print("SQLite DB created successfully ✔")