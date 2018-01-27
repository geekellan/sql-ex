Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
 С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, 
 у которой есть корабли в базе данных.

SELECT country, cast(avg((power(bore,3)/2)) AS numeric(6,2)) AS weight 
FROM (SELECT country, classes.class, bore, name FROM classes LEFT JOIN ships ON classes.class=ships.class 
	UNION ALL 
	SELECT DISTINCT country, class, bore, ship FROM classes t1 LEFT JOIN outcomes t2 ON t1.class=t2.ship 
	WHERE ship=class and ship not in (SELECT name FROM ships) 
) a WHERE name IS NOT NULL GROUP BY country
