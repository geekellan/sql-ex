Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price


SELECT distinct Product.maker, Printer.price 
FROM Product
INNER JOIN Printer On Printer.model = Product.model
where Printer.price = (SELECT MIN(price) FROM Printer WHERE Printer.color = 'y') 
AND Printer.color = 'y'
