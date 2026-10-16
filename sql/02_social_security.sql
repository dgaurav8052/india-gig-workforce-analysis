-- Count workers and calculate the percentage in each social security category.

SELECT
    social_security_coverage,
    COUNT(*) AS worker_count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM gig_workers),
        2
    ) AS percentage
FROM gig_workers
GROUP BY social_security_coverage
ORDER BY worker_count DESC;