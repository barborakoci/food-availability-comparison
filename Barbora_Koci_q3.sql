WITH price2006 AS (
	SELECT 
		name AS n1,
		round(avg(value),0) AS avg_price2006
	FROM t_barbora_koci_project_sql_primary_final pt 
	WHERE value IS NOT NULL
		AND porp = 'price'
		AND year1 = 2006
	GROUP BY name
	),
price2018 AS (
	SELECT 	
		name AS n2,
		round(avg(value),0) AS avg_price2018
	FROM t_barbora_koci_project_sql_primary_final pt 
	WHERE value IS NOT NULL
		AND porp = 'price'
		AND year1 = 2018
	GROUP BY name
		)
SELECT p.*, p2.avg_price2018,round((power((p2.avg_price2018/p.avg_price2006),1/13)-1)*100,2) AS avg_growth_rate
FROM price2006 p
JOIN price2018 p2
ON p.n1 = p2.n2
ORDER BY avg_growth_rate
;