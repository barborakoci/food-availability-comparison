# food-availability-comparison
The development of food prices, wages and the impact of GDP

Barbora_Koci_primary_table_script
8.8.2023
1. pokusy 
Zkouška přidání souborů na GitHub.
Primární tabulka vytvořená pomocí leftjoin podle 4. lekce, mzdy a ceny spojené podle roků.

2. pokusy
Primární tabulka vytvořená pomocí UNION ALL. Pro mzdy použity přepočtené hodnoty. Data byla zachována po čtvrtletích, jako nejmenší srovnatelné období. V tabulce mezd byly použity pro agregaci funkce quarter a year. Jelikož nejsou k dispozici data po jednotlivých okresech (pouze po krajích), nebyla připojena tabulka czechia_district.

14.8.2013
Finální verze
Do primární tabulky přidána podmínka pro omezení roků – pouze společné roky s tabulkou cen.

Barbora_Koci_q1
8.8.2023
1. pokusy 
q1 - 1. pokus o vypracování 1. otázky, nevychází z primární tabulky, pokus o window function, ale zdá se, že nelze použít v partition by 2 argumenty, cosi se zagregovalo, ale jinak, než jsem chtěla.
2.pokusy
q1 - Přehled odvětví, ve kterých docházelo k poklesu mzdy + ve kterém roce, seřazeno od největšího poklesu.

Barbora_Koci_q2
9.8.2023
2. výzkumná otázka
q2 - Přehled průměrných mezd a cen chleba a mléka v 1. a posledním srovnatelném období. Ceny chleba a mléka jsou dostupné od roku 2006 do roku 2018. 1. srovnatelné období je tedy 1. čtvrtletí roku 2006, poslední srovnatelné období je 4. čtvrtletí roku 2018.

Barbora_Koci_q3
14.8.2023
3. výzkumná otázka
míra růstu = ((aktuální hodnota / počáteční hodnota)1/n - 1)*100 Ve vzorci zohledněn počet časových období.
Pro položku "Jakostní víno bílé" jsou dostupná data až od roku 2015, proto byla z průzkumu vynechána. Na první pohled je i bez výpočtu zřejmé, že míra růstu je vyšší než např. u banánů.
q3 – Přehled průměrných cen pro jednotlivé kategorie potravin v letech 2006 a 2018 a míry růstu.

Barbora_Koci_q4
14.8.2023
4. výzkumná otázka
meziroční míra růstu = ((aktuální hodnota - počáteční hodnota/ počáteční hodnota)*100
q4 – Přehled průměrných cen a mezd v jednotlivých letech a rozdíl míry růstu.


Barbora_Koci_secondary_table_script
14.8.2023
Ačkoliv pro vypracování 5. výzkumné otázky není tabulka countries potřeba, snažila jsem se v sekundární tabulce o zachování maximálního množství dat z obou spojovaných tabulek.

Barbora_Koci_q5
14.8.2023
5. výzkumná otázka
meziroční míra růstu = ((aktuální hodnota - počáteční hodnota/ počáteční hodnota)*100
q5 – Přehled HDP, míry růstu HDP, cen a mezd v jednotlivých letech.
