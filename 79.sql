пределить пассажиров, которые больше других времени провели в полетах. 
Вывод: имя пассажира, общее время в минутах, проведенное в полетах

SELECT Passenger.name, T.minutes
FROM (
	SELECT Pass_in_trip.ID_psg,
	SUM((DATEDIFF(minute, time_out, time_in) + 1440)%1440) AS minutes,
	MAX(SUM((DATEDIFF(minute, time_out, time_in) + 1440)%1440)) OVER() AS MaxMinutes
	FROM Pass_in_trip
    INNER JOIN Trip ON Pass_in_trip.trip_no = Trip.trip_no
    GROUP BY Pass_in_trip.ID_psg
) AS T INNER JOIN Passenger ON Passenger.ID_psg = T.ID_psg
WHERE T.minutes = T.MaxMinutes
