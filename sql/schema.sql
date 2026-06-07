CREATE TABLE dim_fund (
    amfi_code INTEGER PRIMARY KEY,
    fund_house TEXT,
    scheme_name TEXT,
    category TEXT,
    sub_category TEXT,
    plan TEXT,
    launch_date DATE,
    benchmark TEXT,
    expense_ratio_pct REAL,
    exit_load_pct REAL,
    min_sip_amount REAL,
    min_lumpsum_amount REAL,
    fund_manager TEXT,
    risk_category TEXT,
    sebi_category_code TEXT
);

CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    day INTEGER
);

CREATE TABLE fact_nav (
    amfi_code INTEGER,
    date DATE,
    nav REAL,
    PRIMARY KEY (amfi_code, date)
);

CREATE TABLE fact_transactions (
    investor_id INTEGER,
    transaction_date DATE,
    amfi_code INTEGER,
    transaction_type TEXT,
    amount_inr REAL,
    state TEXT,
    city TEXT,
    city_tier TEXT,
    age_group TEXT,
    gender TEXT,
    annual_income_lakh REAL,
    payment_mode TEXT,
    kyc_status TEXT
);

CREATE TABLE fact_performance (
    amfi_code INTEGER,
    expense_ratio_pct REAL,
    risk_category TEXT
);

CREATE TABLE fact_aum (
    amfi_code INTEGER,
    aum REAL
);