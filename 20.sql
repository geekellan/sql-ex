
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT maker, COUNT(model) AS Count_Model 
from Product 
WHERE type = 'pc'
GROUP BY Product.maker 
HAVING COUNT(model) >= 3
