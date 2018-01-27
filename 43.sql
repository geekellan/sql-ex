
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.

select name from Battles
where YEAR (date) NOT IN (
	select launched from Ships where launched is not null
)
