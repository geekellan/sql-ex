
Найти производителей, которые выпускают более одной модели, при этом все выпускаемые 
производителем модели являются продуктами одного типа.
Вывести: maker, type

select maker, min(type)
from Product
group by maker
having count(model) > 1 and count( distinct type) = 1
