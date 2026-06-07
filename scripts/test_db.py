import sqlite3
import pandas as pd

conn = sqlite3.connect("data/db/bluestock_mf.db")

query = "SELECT * FROM mutual_funds LIMIT 5"
df = pd.read_sql(query, conn)

print(df)

conn.close()