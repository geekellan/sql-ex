В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
[т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). 
Использовать таблицы Income_o и Outcome_o.

SELECT income_o.point, income_o.date, inc, out 
FROM income_o 
LEFT JOIN outcome_o ON income_o.point = outcome_o.point 
AND income_o.date = outcome_o.date 

UNION 

SELECT outcome_o.point, outcome_o.date, inc, out 
FROM income_o 
RIGHT JOIN outcome_o  ON income_o.point = outcome_o.point 
AND income_o.date = outcome_o.date
