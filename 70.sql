Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.

SELECT DISTINCT Outcomes.battle 
FROM Outcomes 
LEFT JOIN Ships ON Ships.name = Outcomes.ship 
LEFT JOIN Classes ON Outcomes.ship = Classes.class OR Ships.class = Classes.class 
WHERE Classes.country IS NOT NULL 
GROUP BY Classes.country, Outcomes.battle 
HAVING COUNT(Outcomes.ship) >= 3
