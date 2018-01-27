Посчитать остаток денежных средств на всех пунктах приема для базы данных с отчетностью не чаще одного раза в день

SELECT sum(SUMA) FROM (
	SELECT sum(inc) as SUMA FROM income_o 

	UNION 

	SELECT -sum(out) as SUMA FROM outcome_o 
) as R
