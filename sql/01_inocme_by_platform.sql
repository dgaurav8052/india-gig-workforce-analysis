-- Compare worker counts and monthly net income by platform type.

SELECT
    platform_type,
    COUNT(*) AS worker_count,
    ROUND(AVG(monthly_net_income_inr), 2) AS average_net_income,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY monthly_net_income_inr
    ) AS median_net_income
FROM gig_workers
GROUP BY platform_type
ORDER BY median_net_income DESC;