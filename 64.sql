Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, 
но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.

SELECT R.point, R.date, 'inc', sum(inc) FROM Income, (
	SELECT point, date FROM Income 
	EXCEPT 
	SELECT Income.point, Income.date FROM Income 
	iNNER JOIN Outcome ON (Income.point=Outcome.point) AND (Income.date=Outcome.date) 
) AS R WHERE R.point=Income.point AND R.date=Income.date 
GROUP BY R.point, R.date 

UNION 

SELECT R1.point, R1.date, 'out', sum(out) FROM Outcome, (
	SELECT point, date FROM Outcome 
	EXCEPT 
	SELECT Income.point, Income.date FROM Income 
	INNER JOIN Outcome ON (Income.point=Outcome.point) AND (Income.date=Outcome.date) 
) AS R1 
WHERE R1.point=Outcome.point AND R1.date=Outcome.date 
GROUP BY R1.point, R1.date
