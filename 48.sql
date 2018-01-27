
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении

SELECT Classes.class 
FROM Classes 
LEFT JOIN Ships ON Ships.class = Classes.class 
WHERE Classes.class IN (
	SELECT ship FROM Outcomes WHERE result = 'sunk'
) OR  Ships.name IN (
	SELECT ship FROM Outcomes WHERE result = 'sunk'
) 
GROUP BY Classes.class
