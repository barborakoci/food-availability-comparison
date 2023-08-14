WITH wages AS (
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
		SELECT 
			w.year1, w.avg_wages, p.avg_price,
			((w.avg_wages - w2.avg_wages)/w2.avg_wages)*100 AS growth_rate_wages,
			((p.avg_price - p2.avg_price)/p2.avg_price)*100 AS growth_rate_price,
			((p.avg_price - p2.avg_price)/p2.avg_price)*100 - ((w.avg_wages - w2.avg_wages)/w2.avg_wages)*100 AS diff
		FROM wages w 
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
		ORDER BY diff DESC 
;