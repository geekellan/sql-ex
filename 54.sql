С точностью до 2-х десятичных знаков определите 
среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).

SELECT CAST(AVG(CAST(x.numguns as numeric(6,2))) AS numeric(6,2))
FROM ( 
	SELECT numguns, name 
	FROM classes 
	RIGHT JOIN ships ON classes.class=ships.class AND type='bb' AND ships.name <>'null' AND ships.class <>'null' 
	UNION ALL 
	SELECT DISTINCT numguns, ship 
	FROM classes LEFT JOIN outcomes ON classes.class=outcomes.ship 
	WHERE ship not IN (SELECT name FROM ships) AND class<>'null' AND type='bb' 
) AS x
