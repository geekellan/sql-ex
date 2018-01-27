В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное 
число раз (первичным ключом в таблицах является столбец code), 
требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc).
Отсутствующие значения считать неопределенными (NULL).

select point, date, sum(sumOut), sum(sumInc) 
from( select point, date, sum(inc) as sumInc, null as sumOut from Income Group by point, date 
Union 
select point, date, null as sumInc, sum(out) as sumOut from Outcome Group by point, date ) as X
group by point, date order by point
