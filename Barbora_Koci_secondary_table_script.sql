CREATE TABLE t_barbora_koci_project_sql_secondary_final
SELECT c.*, e.`year`, e.GDP, e.gini, e.taxes, e.fertility, e.mortaliy_under5 
FROM economies e
LEFT JOIN countries c
ON e.country = c.country
WHERE GDP IS NOT NULL 
ORDER BY e.country;