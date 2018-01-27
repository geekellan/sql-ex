
Для ПК с максимальным кодом из таблицы PC вывести все его характеристики (кроме кода) в два столбца:
- название характеристики (имя соответствующего столбца в таблице PC);
- значение характеристики

SELECT R, R1 FROM
(SELECT 
	cast(model as VARCHAR(10)) as model, 
	cast (speed as VARCHAR(10)) as speed, 
	cast(ram as VARCHAR(10)) as ram,
	cast(hd as VARCHAR(10)) as hd, 
	cast(cd as VARCHAR(10)) as cd, 
	cast(price as VARCHAR(10)) as price FROM PC 
	where code = (SELECT max(code) FROM PC) 
) t

UNPIVOT
( R1 FOR R IN(speed, model, ram, hd, cd, price)) as unpvt
