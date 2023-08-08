-- CREATE OR REPLACE VIEW v_q1 AS
WITH wages AS (
	SELECT 
		cpib.name, 
		cp.payroll_year,
		avg (cp.value)over(PARTITION BY cpib.name, cp.payroll_year) AS avg_wages
	FROM czechia_payroll cp  
	LEFT JOIN czechia_payroll_industry_branch cpib
		ON cp.industry_branch_code = cpib.code 
	WHERE cp.value IS NOT NULL
		AND cp.value > 2000
		AND cpib.name IS NOT NULL
	GROUP BY cpib.name, payroll_year
	)
	SELECT 
		w.*,
		(w.avg_wages - w2.avg_wages) AS diff
	FROM wages w 
	JOIN wages w2 
	    ON w.name = w2.name
	    AND w.payroll_year = w2.payroll_year + 1
	    AND w.payroll_year < 2021
	WHERE (w.avg_wages - w2.avg_wages) < 0
	;

-- Pro zajímavost

-- V kterých odvětvích docházelo k poklesu mzdy nejvíce v průběhu let? 

SELECT name, count(avg_wages) AS frequency
FROM v_q1
GROUP BY name
ORDER BY frequency DESC;

V kterých letech docházelo k poklesu mzdy v nejvíce odvětvích?

SELECT payroll_year, count(avg_wages) AS frequency
FROM v_q1
GROUP BY payroll_year
ORDER BY frequency DESC;
;