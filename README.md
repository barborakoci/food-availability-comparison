# food-availability-comparison
The development of food prices, wages and the impact of GDP

8.8.2023
1. pokusy 
Zkouška přidání souborů na GitHub.
Primární tabulka vytvořená pomocí leftjoin podle 4. lekce, mzdy a ceny spojené podle roků.
q1 - 1. pokus o vypracování 1. otázky, nevychází z primární tabulky, pokus o window function, ale zdá se, že nelze použít v partition by 2 argumenty, cosi se zagregovalo, ale jinak než jsem chtěla.

2. pokusy
Primární tabulka vytvořená pomocí UNION ALL. Pro mzdy použity přepočtené hodnoty.
q1 - Přehled odvětví, ve kterých docházelo k poklesu mzdy + ve kterém roce, seřazeno od největšího poklesu.

9.8.2023
2. výzkumná otázka
q2 - Přehled průměrných mezd a cen chleba a mléka v 1. a posledním srovnatelném období. Ceny chleba a mléka jsou dostupné od roku 2006 do roku 2018. 1. srovnatelné období je tedy 1. čtvrtletí roku 2006, poslední srovnatelné období je 4. čtvrtletí roku 2018.