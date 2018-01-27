
В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели.

SELECT model, type FROM Product 
WHERE upper(model) NOT LIKE '%[^A-Z]%' 
OR model NOT LIKE '%[^0-9]%'
