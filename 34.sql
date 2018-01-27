SELECT DISTINCT name 
FROM classes, ships 
WHERE launched >= 1922 AND displacement > 35000 
	AND type='bb' AND ships.class = classes.class
