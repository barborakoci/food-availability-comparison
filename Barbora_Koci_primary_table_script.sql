CREATE OR REPLACE TABLE t_Barbora_Koci_project_SQL_primary_final AS
SELECT 
	cpc.name AS food_category,
	cp.value AS food_price,
	cpib.name AS industry_branch,
	cp2.value AS avg_wages,
	cpu.name AS unit,
	cpvt.name AS value_type,
	cpc2.name AS calculation,
	cr.name AS region,
	cp.date_from
FROM czechia_price cp 
LEFT JOIN czechia_payroll cp2
	ON cp2.payroll_year = year(cp.date_from)
	AND cp2.value_type_code = 5958
LEFT JOIN czechia_payroll_calculation cpc2 
	ON cp2.calculation_code = cpc2.code 
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp2.industry_branch_code = cpib.code 
LEFT JOIN czechia_payroll_unit cpu 
	ON cp2.unit_code = cpu.code	
LEFT JOIN czechia_payroll_value_type cpvt 
	ON cp2.value_type_code = cpvt.code
LEFT JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code 
LEFT JOIN czechia_region cr
	ON cp.region_code = cr.code;