Среди тех, кто пользуется услугами только какой-нибудь одной компании, определить имена разных пассажиров, летавших чаще других. 
Вывести: имя пассажира и число полетов.


SELECT TOP 1 WITH TIES name, maxs FROM passenger
INNER JOIN (
	SELECT passengerID, max(counts) maxs FROM ( 
		SELECT pass_in_trip.ID_psg passengerID, Trip.ID_comp, count(*) counts FROM pass_in_trip
		INNER JOIN trip ON trip.trip_no = pass_in_trip.trip_no
		GROUP BY pass_in_trip.ID_psg, Trip.ID_comp
	) AS R GROUP BY passengerID HAVING count(*) = 1
) AS R1 ON ID_psg = passengerID ORDER BY maxs DESC
