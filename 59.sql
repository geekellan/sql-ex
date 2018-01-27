Посчитать остаток денежных средств на каждом пункте приема для базы данных 
с отчетностью не чаще одного раза в день. 
Вывод: пункт, остаток


SELECT c1, c2 - (
	CASE WHEN o2 IS NULL THEN 0 
	ELSE o2 
	END
) 
FROM (
	SELECT point c1, sum(inc) c2 FROM income_o 
	GROUP BY point
) as t1 LEFT JOIN (
	SELECT point o1, sum(out) o2 FROM outcome_o 
	GROUP BY point
) as t2 ON c1=o1
