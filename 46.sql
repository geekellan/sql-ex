Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), 
вывести название, водоизмещение и число орудий.

SELECT Outcomes.ship, displacement, numGuns 
FROM (
	SELECT name AS ship, displacement, numGuns 
	FROM Ships JOIN Classes ON Classes.class=Ships.class 
	UNION 
	SELECT class AS ship, displacement, numGuns 
	FROM Classes
) AS a RIGHT JOIN Outcomes  ON Outcomes.ship=a.ship 
WHERE battle = 'Guadalcanal'
