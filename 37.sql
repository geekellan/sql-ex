Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).

SELECT classes.class 
FROM classes 
 INNER JOIN ( 
 SELECT class, name 
 FROM ships 
 UNION 
 SELECT ship, ship 
 FROM outcomes 
) AS s ON s.class = classes.class 
GROUP BY classes.class 
HAVING COUNT(s.name) = 1
