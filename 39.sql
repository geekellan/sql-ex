
Найдите корабли, "сохранившиеся для будущих сражений"; 
т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.


SELECT DISTINCT R.ship 
FROM (SELECT outcomes.ship, battles.name, battles.date, outcomes.result 
	FROM outcomes INNER JOIN battles ON outcomes.battle = battles.name 
	) R 
WHERE UPPER(R.ship) IN (
	SELECT UPPER(ship) FROM (
		SELECT outcomes.ship, battles.name, battles.date, outcomes.result FROM outcomes 
		INNER JOIN battles ON outcomes.battle = battles.name )  R1 
	WHERE R1.date < R.date AND R1.result = 'damaged')
