Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.

SELECT Product.maker 
FROM Product
LEFT JOIN PC ON PC.model = Product.model 
WHERE Product.type = 'PC' 
GROUP BY Product.maker 
HAVING COUNT(Product.model) = COUNT(PC.model)
