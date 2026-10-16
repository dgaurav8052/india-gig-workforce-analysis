-- Compare median vehicle cost burden by platform type.

SELECT
    platform_type,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY
            (monthly_fuel_cost_inr + monthly_emi_burden_inr)
            / NULLIF(monthly_gross_income_inr, 0) * 100
    ) AS median_cost_burden_pct
FROM gig_workers
GROUP BY platform_type
ORDER BY median_cost_burden_pct DESC;
