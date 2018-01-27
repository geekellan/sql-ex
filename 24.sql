Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
select model from (
	select model, price from pc 
	union
	select model, price from Laptop 
	union
	select model, price from Printer 
	) as S where S.price = (
	select MAX(x.price) from (select price from pc 
		union 
		select price from laptop 
		union
		select price from printer
		) as x)
