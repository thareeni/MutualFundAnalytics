import requests
import pandas as pd

url = "https://api.mfapi.in/mf/125497"

response = requests.get(url)

data = response.json()

print("Scheme Name:")
print(data["meta"]["scheme_name"])

df = pd.DataFrame(data["data"])

df.to_csv(
    "data/raw/hdfc_top100_nav.csv",
    index=False
)

print("NAV data saved successfully!")