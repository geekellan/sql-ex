Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

select distinct maker from Product
inner join PC ON PC.model = Product.model and PC.speed >= 750
 and maker in (
 	select maker from Product, Laptop 
 	where Laptop.model = Product.model and Laptop.speed >= 750
 	)
