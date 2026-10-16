-- Count compensation outcomes among workers reporting an injury.

SELECT
    injury_compensation_received,
    COUNT(*) AS worker_count
FROM gig_workers
WHERE injury_last_12_months = 'Yes'
GROUP BY injury_compensation_received
ORDER BY worker_count DESC;