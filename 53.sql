Определите среднее число орудий для классов линейных кораблей.
Получить результат с точностью до 2-х десятичных знаков

select CAST(
	AVG(CAST(numGuns as numeric(6,2))
	) AS NUMERIC(6,2)) 
from Classes where type = 'bb'
