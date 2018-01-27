Из таблицы Outcome получить все записи за тот месяц (месяцы),
 с учетом года, в котором суммарное значение расхода (out) было максимальным.

SELECT Outcome.* FROM Outcome
INNER JOIN (
	SELECT TOP 1 WITH TIES YEAR(date) AS Year, MONTH(date) AS Month, SUM(out) AS ALL_TOTAL
	FROM Outcome
	GROUP BY YEAR(date), MONTH(date)
	ORDER BY ALL_TOTAL DESC
) R ON YEAR(Outcome.date) = R.Year AND MONTH(Outcome.date) = R.Month
