Среди тех, кто пользуется услугами только одной компании, определить имена разных пассажиров, летавших чаще других. 
Вывести: имя пассажира, число полетов и название компании.

SELECT (
	SELECT name FROM Passenger 
	WHERE ID_psg = R.ID_psg
) AS name, R.trip_Qty, (
	SELECT name FROM Company 
	WHERE ID_comp = R.ID_comp
) AS Company 
FROM (
	SELECT Pass_in_trip.ID_psg, MIN(Trip.ID_comp) AS ID_comp, 
	COUNT(*) AS trip_Qty, MAX(COUNT(*)) OVER() AS Max_Qty 
	FROM Pass_in_trip 
	INNER JOIN Trip ON Pass_in_trip.trip_no = Trip.trip_no 
	GROUP BY Pass_in_trip.ID_psg 
	HAVING MIN(Trip.ID_comp) = MAX(Trip.ID_comp) 
) AS R 
WHERE R.trip_Qty = R.Max_Qty
