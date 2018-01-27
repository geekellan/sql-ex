Для каждого класса определите год, когда был спущен на воду первый корабль этого класса. 
Если год спуска на воду головного корабля неизвестен, определите минимальный год спуска на воду кораблей этого класса.
Вывести: класс, год.

SELECT Classes.class, R.min FROM Classes
LEFT JOIN (
	SELECT class, MIN(launched) as min FROM Ships GROUP BY class
) AS R ON R.class = Classes.class
