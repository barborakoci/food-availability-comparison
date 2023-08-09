WITH 
ch2006 AS (
	SELECT value AS bread_price
	FROM t_barbora_koci_project_sql_primary_final tbkpspf 
	WHERE name LIKE 'Chléb%'
	AND quarter1 = 1
	AND year1 = 2006
),
m2006 AS (
	SELECT value AS milk_price
	FROM t_barbora_koci_project_sql_primary_final tbkpspf 
	WHERE name LIKE 'Mléko%'
	AND quarter1 = 1
	AND year1 = 2006
),
ch2018 AS (
	SELECT value AS bread_price
	FROM t_barbora_koci_project_sql_primary_final tbkpspf 
	WHERE name LIKE 'Chléb%'
	AND quarter1 = 4
	AND year1 = 2018
),
m2018 AS (
	SELECT value AS milk_price
	FROM t_barbora_koci_project_sql_primary_final tbkpspf 
	WHERE name LIKE 'Mléko%'
	AND quarter1 = 4
	AND year1 = 2018
),
wages2006 AS (
		SELECT 
			year1,
			quarter1,
			round(avg(value),0) AS avg_wages
		FROM t_barbora_koci_project_sql_primary_final tbkpspf 
		WHERE porp = 'payroll'
		AND quarter1 = 1
		AND year1 = 2006
		GROUP BY quarter1, quarter1
),
wages2018 AS (
		SELECT 
			year1,
			quarter1,
			round(avg(value),0) AS avg_wages
		FROM t_barbora_koci_project_sql_primary_final tbkpspf 
		WHERE porp = 'payroll'
		AND quarter1 = 4
		AND year1 = 2018
		GROUP BY quarter1, year1
)
SELECT *, 
	round((avg_wages/bread_price),0) AS bread_amount,
	round((avg_wages/milk_price),0) AS milk_amount
FROM wages2006, ch2006, m2006
UNION
SELECT *,
	round((avg_wages/bread_price),0) AS bread_amount,
	round((avg_wages/milk_price),0) AS milk_amount
FROM wages2018, ch2018, m2018
;
