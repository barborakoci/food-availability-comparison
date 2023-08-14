WITH GDP AS (
	SELECT `year`AS year1, GDP 
	FROM t_barbora_koci_project_sql_secondary_final ts
	WHERE country LIKE "Czech%"
	AND `year` BETWEEN 2006 AND 2018
	GROUP BY `year`
	),
wages AS (
	SELECT 
		year1,
		porp,
		round(avg(value),0) AS avg_wages
	FROM t_barbora_koci_project_sql_primary_final pt 
	WHERE value IS NOT NULL
	AND porp = 'payroll'
	GROUP BY year1, porp
),
price AS (
	SELECT 
		year1,
		porp,
		round(avg(value),0) AS avg_price
	FROM t_barbora_koci_project_sql_primary_final pt 
	WHERE value IS NOT NULL
	AND porp = 'price'
	GROUP BY year1, porp
	)
SELECT g.year1, g.GDP,
((g.GDP - g2.GDP)/g2.GDP)*100 AS growth_rate_HDP,
((w.avg_wages - w2.avg_wages)/w2.avg_wages)*100 AS growth_rate_wages,
((p.avg_price - p2.avg_price)/p2.avg_price)*100 AS growth_rate_price
FROM GDP g 
JOIN GDP g2 
	ON g.year1 = g2.year1 + 1
	AND g.year1 <= 2018
JOIN wages w 
	 ON w.year1 = g.year1
	AND w.year1 <= 2018
JOIN wages w2 
	ON w.porp = w2.porp
	AND w.year1 = w2.year1 + 1
	AND w.year1 <= 2018
JOIN price p
	ON p.porp != w.porp
	AND p.year1 = w.year1
	AND p.year1 <= 2018
JOIN price p2
	ON p.porp = p2.porp
	AND p.year1 = p2.year1 + 1
	 AND p.year1 <= 2018
;