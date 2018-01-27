Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания. 
1) A - B и B - A считать РАЗНЫМИ маршрутами.
2) Использовать только таблицу Trip

SELECT count(*) FROM (
	SELECT TOP 1 WITH TIES count(*) count, town_from, town_to FROM trip
	GROUP BY town_from, town_to 
	ORDER BY count DESC
) as R
