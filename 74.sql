Вывести классы всех кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран. 
Вывод: страна, класс

SELECT Classes.country, Classes.class 
FROM Classes
WHERE UPPER(Classes.country) = 'RUSSIA' AND EXISTS ( 
	SELECT Classes.country, Classes.class 
	FROM Classes 
	WHERE UPPER(Classes.country) = 'RUSSIA' 
) 

UNION ALL 

SELECT Classes.country, Classes.class 
FROM Classes
WHERE NOT EXISTS (
	SELECT Classes.country, Classes.class 
	FROM Classes
	WHERE UPPER(Classes.country) = 'RUSSIA' 
)
