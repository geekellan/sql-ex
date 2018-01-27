
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, 
т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

select distinct PC.model, pc2.model, PC.speed, PC.ram  
from PC 
INNER JOIN PC as pc2 ON  pc2.speed = PC.speed 
AND pc2.ram=PC.ram AND PC.model != pc2.model AND PC.model > pc2.model
