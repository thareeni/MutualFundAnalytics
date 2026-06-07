-- 1. Top 5 funds by highest expense ratio
SELECT scheme_name, expense_ratio_pct
FROM dim_fund
ORDER BY expense_ratio_pct DESC
LIMIT 5;


-- 2. Top 5 funds by lowest expense ratio
SELECT scheme_name, expense_ratio_pct
FROM dim_fund
ORDER BY expense_ratio_pct ASC
LIMIT 5;


-- 3. Risk category distribution
SELECT risk_category, COUNT(*) AS total_funds
FROM dim_fund
GROUP BY risk_category
ORDER BY total_funds DESC;


-- 4. SEBI category distribution
SELECT sebi_category_code, COUNT(*) AS total_funds
FROM dim_fund
GROUP BY sebi_category_code
ORDER BY total_funds DESC;


-- 5. Transaction count by type (SIP/Lumpsum/Redemption)
SELECT transaction_type, COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;


-- 6. Total investment amount by transaction type
SELECT transaction_type, SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;


-- 7. Top 5 investor states by transaction volume
SELECT state, COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC
LIMIT 5;


-- 8. Investment amount by age group
SELECT age_group, SUM(amount_inr) AS total_investment
FROM fact_transactions
GROUP BY age_group
ORDER BY total_investment DESC;


-- 9. Investment distribution by city tier
SELECT city_tier, SUM(amount_inr) AS total_investment
FROM fact_transactions
GROUP BY city_tier
ORDER BY total_investment DESC;


-- 10. Fund house dominance (number of schemes)
SELECT fund_house, COUNT(*) AS total_schemes
FROM dim_fund
GROUP BY fund_house
ORDER BY total_schemes DESC
LIMIT 5;