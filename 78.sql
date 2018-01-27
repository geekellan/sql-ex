Для каждого сражения определить первый и последний день
месяца,
в котором оно состоялось. 
Вывод: сражение, первый день месяца, последний
день месяца.

Замечание: даты представить без времени в формате "yyyy-mm-dd".

SELECT name, REPLACE(CONVERT(CHAR(12), DATEADD(m, DATEDIFF(m,0,date),0), 102),'.','-') AS first_day,
             REPLACE(CONVERT(CHAR(12), DATEADD(s,-1,DATEADD(m, DATEDIFF(m, 0, date) + 1,0)), 102), '.', '-') AS last_day
FROM Battles
