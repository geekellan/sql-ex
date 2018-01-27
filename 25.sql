Найдите производителей принтеров
, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, 
имеющих наименьший объем RAM. Вывести: Maker

SELECT DISTINCT maker 
FROM product 
WHERE model IN ( 
SELECT model 
FROM pc 
WHERE ram = ( 
  SELECT MIN(ram) 
  FROM pc 
  ) 
AND speed = ( 
  SELECT MAX(speed) 
  FROM pc 
  WHERE ram = ( 
   SELECT MIN(ram) 
   FROM pc 
   ) 
  ) 
) 
AND  maker IN ( 
	SELECT maker 
	FROM product 
	WHERE type='printer' 
)
