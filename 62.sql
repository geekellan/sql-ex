Посчитать остаток денежных средств на всех пунктах приема 
на начало дня 15/04/01 для базы данных с отчетностью не чаще одного раза в день.

SELECT (
	SELECT sum(inc) FROM Income_o 
	WHERE date<'2001-04-15') - ( SELECT sum(out) FROM Outcome_o WHERE date<'2001-04-15' )
