Определить названия всех кораблей из таблицы Ships, которые удовлетворяют, по крайней мере, комбинации любых четырёх критериев из следующего списка: 
numGuns = 8 
bore = 15 
displacement = 32000 
type = bb 
launched = 1915 
class=Kongo 
country=USA

SELECT name 
FROM Ships JOIN Classes ON Ships.class = Classes.class 
WHERE 
CASE WHEN numGuns = 8 THEN 1 ELSE 0 END + 
CASE WHEN bore = 15 THEN 1 ELSE 0 END + 
CASE WHEN displacement = 32000 THEN 1 ELSE 0 END + 
CASE WHEN type = 'bb' THEN 1 ELSE 0 END + 
CASE WHEN launched = 1915 THEN 1 ELSE 0 END + 
CASE WHEN Ships.class = 'Kongo' THEN 1 ELSE 0 END + 
CASE WHEN country = 'USA' THEN 1 ELSE 0 END > = 4
