-- ============================================
-- Bank Marketing Analysis
-- SQL Analysis Queries
-- ============================================

-- 1. View the first 10 rows
SELECT *
FROM bank_marketing_cleaned
LIMIT 10;

-- ============================================
-- Customer Overview
-- ============================================

-- 2. Total number of customers
SELECT COUNT(*) AS total_customers
FROM bank_marketing_cleaned;

-- 3. Total subscribed customers
SELECT COUNT(*) AS subscribed_customers
FROM bank_marketing_cleaned
WHERE subscribed = 'yes';

-- 4. Subscription rate
SELECT
    ROUND(
        COUNT(CASE WHEN subscribed = 'yes' THEN 1 END) * 100.0 /
        COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing_cleaned;

-- ============================================
-- Job Analysis
-- ============================================

-- 5. Customers by job
SELECT
    job,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY job
ORDER BY total_customers DESC;

-- 6. Average balance by job
SELECT
    job,
    ROUND(AVG(balance), 2) AS average_balance
FROM bank_marketing_cleaned
GROUP BY job
ORDER BY average_balance DESC;

-- 7. Subscription rate by job
SELECT
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(
        SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing_cleaned
GROUP BY job
ORDER BY subscription_rate DESC;

-- ============================================
-- Financial Analysis
-- ============================================

-- 8. Average account balance
SELECT
    ROUND(AVG(balance), 2) AS average_balance
FROM bank_marketing_cleaned;

-- 9. Average balance by loan status
SELECT
    loan,
    ROUND(AVG(balance), 2) AS average_balance
FROM bank_marketing_cleaned
GROUP BY loan;

-- 10. Average balance by housing loan
SELECT
    housing,
    ROUND(AVG(balance), 2) AS average_balance
FROM bank_marketing_cleaned
GROUP BY housing;

-- ============================================
-- Education Analysis
-- ============================================

-- 11. Customers by education level
SELECT
    education,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY education
ORDER BY total_customers DESC;

-- ============================================
-- Campaign Analysis
-- ============================================

-- 12. Customers contacted each month
SELECT
    month,
    COUNT(*) AS contacts
FROM bank_marketing_cleaned
GROUP BY month
ORDER BY contacts DESC;

-- 13. Average campaign contacts
SELECT
    ROUND(AVG(campaign), 2) AS average_contacts
FROM bank_marketing_cleaned;

-- ============================================
-- Age Analysis
-- ============================================

-- 14. Average age
SELECT
    ROUND(AVG(age), 1) AS average_age
FROM bank_marketing_cleaned;

-- 15. Young vs older customers
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) AS customers
FROM bank_marketing_cleaned
GROUP BY age_group;

-- ============================================
-- Marital Status
-- ============================================

-- 16. Customers by marital status
SELECT
    marital,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY marital
ORDER BY total_customers DESC;

-- ============================================
-- Previous Campaign Outcome
-- ============================================

-- 17. Previous campaign outcomes
SELECT
    poutcome,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY poutcome
ORDER BY total_customers DESC;

-- ============================================
-- Contact Method
-- ============================================

-- 18. Contact methods used
SELECT
    contact,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY contact
ORDER BY total_customers DESC;

-- ============================================
-- Subscription Breakdown
-- ============================================

-- 19. Overall subscription breakdown
SELECT
    subscribed,
    COUNT(*) AS total_customers
FROM bank_marketing_cleaned
GROUP BY subscribed;

-- ============================================
-- Top 10 Customers by Balance
-- ============================================

-- 20. Highest account balances
SELECT
    age,
    job,
    balance,
    subscribed
FROM bank_marketing_cleaned
ORDER BY balance DESC
LIMIT 10;
