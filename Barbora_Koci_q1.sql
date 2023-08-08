CREATE OR REPLACE VIEW v_q1 AS
WITH wages AS (
	SELECT 
		name, 
		year1,
		round(avg(value),0) AS avg_wages
	FROM t_barbora_koci_project_sql_primary_final pt 
	WHERE value IS NOT NULL
		AND porp = 'payroll'
	GROUP BY name, year1
	)
		SELECT 
			w.*,
			(w.avg_wages - w2.avg_wages) AS diff
		FROM wages w 
		JOIN wages w2 
		    ON w.name = w2.name
		    AND w.year1 = w2.year1 + 1
		    AND w.year1 < 2021
		WHERE (w.avg_wages - w2.avg_wages) < 0
		ORDER BY diff 
		;
 
-- Pro zajímavost

-- V kterých odvětvích docházelo k poklesu mzdy nejvíce v průběhu let? 

SELECT name, count(avg_wages) AS frequency
FROM v_q1
GROUP BY name
ORDER BY frequency DESC;

-- V kterých letech docházelo k poklesu mzdy v nejvíce odvětvích?

SELECT payroll_year, count(avg_wages) AS frequency
FROM v_q1
GROUP BY payroll_year
ORDER BY frequency DESC;