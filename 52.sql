Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов 
и водоизмещение не более 65 тыс.тонн

SELECT DISTINCT ships.name 
FROM ships INNER JOIN classes ON classes.class = ships.class 
WHERE UPPER(classes.country) = 'JAPAN' 
AND (numguns>=9 or numguns is NULL) 
AND (classes.bore < 19 OR classes.bore IS NULL) 
AND (displacement <= 65000 OR classes.displacement IS NULL) 
AND classes.type = 'bb'
