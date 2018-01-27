Вывести все строки из таблицы Product, кроме трех строк с наименьшими номерами моделей 
и трех строк с наибольшими номерами моделей.

SELECT maker, model, type FROM
(
	SELECT maker, model, type,
	row_number() over(ORDER BY model) first,
	row_number() over(ORDER BY model DESC) second
	FROM Product
) R
WHERE first > 3 AND second > 3
