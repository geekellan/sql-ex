Найдите модели ПК-блокнотов, скорость которых меньше скорости любого из ПК. 
Вывести: type, model, speed

select distinct Product.type, Laptop.model, Laptop.speed 
from Laptop inner join Product ON Product.model =  Laptop.model 
WHERE speed < ALL(select speed from PC)
