Найти производителей, которые выпускают только принтеры или только PC.
При этом искомые производители PC должны выпускать не менее 3 моделей.


SELECT maker 
FROM Product 
GROUP BY maker 
HAVING count(distinct type) = 1 AND (
	min(type) = 'printer' OR (min(type) = 'pc' AND count(model) >= 3)
)
