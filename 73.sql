Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
Вывод: страна, сражение

SELECT DISTINCT Classes.country, Battles.name 
FROM Battles, Classes
EXCEPT
SELECT Classes.country, Outcomes.battle FROM Outcomes
LEFT JOIN Ships ON Ships.name = Outcomes.ship
LEFT JOIN Classes ON Outcomes.ship = Classes.class OR Ships.class = Classes.class
WHERE Classes.country IS NOT NULL
GROUP BY Classes.country, Outcomes.battle
