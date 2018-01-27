Найти производителей компьютерной техники, у которых нет моделей ПК, не представленных в таблице PC.

SELECT DISTINCT maker 
FROM product 
WHERE maker NOT IN ( 
     SELECT maker 
     FROM product 
     WHERE type = 'pc' and  model NOT IN (SELECT model FROM PC)
)
