Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.

SELECT name FROM Passenger
WHERE ID_psg IN (
	SELECT ID_psg FROM Pass_in_trip 
	GROUP BY place,ID_psg HAVING count(*) >1 
)
