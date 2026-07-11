
-- 1. View all records
SELECT * FROM customer;

-- 2. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customer;

-- 3. Total purchase amount
SELECT SUM("purchase_amount_(usd)") AS total_sales
FROM customer;

-- 4. Average purchase amount
SELECT ROUND(AVG("purchase_amount_(usd)"),2) AS average_purchase
FROM customer;

-- 5. Average review rating
SELECT ROUND(AVG(review_rating)::numeric,2) AS average_review_rating
FROM customer;

-- 6. Purchase amount by category
SELECT
    category,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY category
ORDER BY total_sales DESC;

-- 7. Number of customers by category
SELECT
    category,
    COUNT(customer_id) AS total_customers
FROM customer
GROUP BY category
ORDER BY total_customers DESC;

-- 8. Purchase amount by gender
SELECT
    gender,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY gender;

-- 9. Purchase amount by season
SELECT
    season,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY season
ORDER BY total_sales DESC;

-- 10. Purchase amount by clothing size
SELECT
    size,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY size
ORDER BY total_sales DESC;

-- 11. Purchase amount by shipping type
SELECT
    shipping_type,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY shipping_type
ORDER BY total_sales DESC;

-- 12. Purchase amount by subscription status
SELECT
    subscription_status,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY subscription_status;

-- 13. Customers using promo code
SELECT
    promo_code_used,
    COUNT(*) AS customer_count
FROM customer
GROUP BY promo_code_used;

-- 14. Customers receiving discount
SELECT
    discount_applied,
    COUNT(*) AS customer_count
FROM customer
GROUP BY discount_applied;

-- 15. Top 10 states by purchase amount
SELECT
    location,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY location
ORDER BY total_sales DESC
LIMIT 10;

-- 16. Top 10 purchased items
SELECT
    item_purchased,
    COUNT(*) AS purchase_count
FROM customer
GROUP BY item_purchased
ORDER BY purchase_count DESC
LIMIT 10;

-- 17. Category-wise average review rating
SELECT
    category,
    ROUND(AVG(review_rating)::numeric,2) AS average_rating
FROM customer
GROUP BY category
ORDER BY average_rating DESC;

-- 18. Gender-wise average purchase amount
SELECT
    gender,
    ROUND(AVG("purchase_amount_(usd)"),2) AS average_purchase
FROM customer
GROUP BY gender;

-- 19. Average purchase amount by subscription status
SELECT
    subscription_status,
    ROUND(AVG("purchase_amount_(usd)"),2) AS average_purchase
FROM customer
GROUP BY subscription_status;

-- 20. Previous purchases analysis
SELECT
    previous_purchases,
    COUNT(*) AS customers
FROM customer
GROUP BY previous_purchases
ORDER BY previous_purchases;

-- 21. Highest spending customers
-- 21. Highest spending customers
SELECT
    customer_id,
    "purchase_amount_(usd)"
FROM customer
ORDER BY "purchase_amount_(usd)" DESC
LIMIT 10;

-- 22. Average purchase amount by shipping type
SELECT
    shipping_type,
    ROUND(AVG("purchase_amount_(usd)"),2) AS average_purchase
FROM customer
GROUP BY shipping_type
ORDER BY average_purchase DESC;

-- 23. Purchase amount by color
SELECT
    color,
    SUM("purchase_amount_(usd)") AS total_sales
FROM customer
GROUP BY color
ORDER BY total_sales DESC;

-- 24. Customers by age group
SELECT
CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS age_group,
COUNT(*) AS total_customers
FROM customer
GROUP BY age_group
ORDER BY age_group;

-- 25. Overall business summary
SELECT
COUNT(*) AS total_customers,
SUM("purchase_amount_(usd)") AS total_sales,
ROUND(AVG("purchase_amount_(usd)"),2) AS average_purchase,
ROUND(AVG(review_rating)::numeric,2) AS average_review
FROM customer;