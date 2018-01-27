Для каждого класса определите число кораблей этого класса, потопленных в сражениях. 
Вывести: класс и число потопленных кораблей.

SELECT classes.class, COUNT(R.ship) 
FROM classes 
LEFT JOIN ( 
	SELECT outcomes.ship, ships.class 
	FROM outcomes 
	LEFT JOIN ships ON ships.name = outcomes.ship 
	WHERE outcomes.result = 'sunk' 
) AS R ON R.class = classes.class OR R.ship = classes.class 
GROUP BY classes.class



