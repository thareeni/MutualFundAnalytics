import pandas as pd
import os

print("Program Started...")

folder = "data/raw"

for file in os.listdir(folder):
    
    if file.endswith(".csv"):
        
        path = os.path.join(folder, file)

        print("\n" + "=" * 60)
        print("File:", file)

        try:
            df = pd.read_csv(path)

            print("\nShape:")
            print(df.shape)

            print("\nData Types:")
            print(df.dtypes)

            print("\nFirst 5 Rows:")
            print(df.head())

            print("\nMissing Values:")
            print(df.isnull().sum())

            print("\nDuplicate Rows:")
            print(df.duplicated().sum())

        except Exception as e:
            print("Error reading file:", e)

print("\nAll files processed successfully!")