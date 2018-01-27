Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
Вывести: одна общая средняя цена.

select sum(s.sum)/sum(s.kol)
from (select price as sum, 1 as kol from PC, Product where Product.model = PC.model and Product.maker = 'A'
	UNION ALL
	select price as sum, 1 as kol from Laptop, Product where Product.model = Laptop.model and Product.maker = 'A') as s
