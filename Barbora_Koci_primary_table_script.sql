CREATE OR REPLACE TABLE t_Barbora_Koci_project_SQL_primary_final AS
(SELECT 
	cpib.name AS name,
	cp.value AS value,
	payroll_quarter AS quarter1,
	cp.payroll_year AS year1,
	'payroll' AS porp
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_calculation cpc 
	ON cp.calculation_code = cpc.code 
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
LEFT JOIN czechia_payroll_unit cpu 
	ON cp.unit_code = cpu.code	
LEFT JOIN czechia_payroll_value_type cpvt 
	ON cp.value_type_code = cpvt.code
WHERE cp.value_type_code = 5958
AND cp.calculation_code = 200
AND cpib.name IS NOT NULL
AND cp.payroll_year BETWEEN 2006 AND 2018
GROUP BY porp, name, year1, quarter1
ORDER BY porp, name, year1)
UNION ALL	
(SELECT
	cpc.name AS name,
	cp.value AS value,
	quarter(cp.date_from) AS quarter1,
	year(cp.date_from) AS year1,
	'price' AS porp
FROM czechia_price cp 
LEFT JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code 
LEFT JOIN czechia_region cr
	ON cp.region_code = cr.code
WHERE cr.name IS NOT NULL
GROUP BY porp, name, year1, quarter1
ORDER BY porp, name, year1)
;