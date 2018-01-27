Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания. 
1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
2) Использовать только таблицу Trip

SELECT count(*) FROM (
	SELECT TOP 1 WITH TIES sum(counts) sums, first, second FROM (
		SELECT count(*) counts, town_from first, town_to second FROM Trip WHERE town_from > town_to
		GROUP BY town_from, town_to

		UNION ALL

		SELECT count(*) counts, town_to, town_from FROM Trip WHERE town_to > town_from
		GROUP BY town_from, town_to
	) as r GROUP BY first, second ORDER BY sums DESC
) as R
