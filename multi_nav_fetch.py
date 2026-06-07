import requests
import pandas as pd

funds = {
    "SBI_Bluechip": 119551,
    "ICICI_Bluechip": 120503,
    "Nippon_Large_Cap": 118632,
    "Axis_Bluechip": 119092,
    "Kotak_Bluechip": 120841
}

for name, code in funds.items():

    url = f"https://api.mfapi.in/mf/{code}"

    response = requests.get(url)

    data = response.json()

    print(f"\n{name}")
    print(data["meta"]["scheme_name"])

    df = pd.DataFrame(data["data"])

    df.to_csv(
        f"data/raw/{name}_nav.csv",
        index=False
    )

print("\nAll NAV files saved successfully!")