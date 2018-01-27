Для каждой компании подсчитать количество перевезенных пассажиров (если они были в этом месяце)
 по декадам апреля 2003. При этом учитывать только дату вылета. 
Вывод: название компании, количество пассажиров за каждую декаду

SELECT Company.name, R.1_10, R.11_21, R.21_30 
FROM (
	SELECT Trip.ID_comp, 
	SUM(CASE WHEN DAY(Pass_in_trip.date) < 11 THEN 1 ELSE 0 END) AS 1_10, 
	SUM(CASE WHEN (DAY(Pass_in_trip.date) > 10 AND DAY(P.date) < 21) THEN 1 ELSE 0 END) AS 11_21, 
	SUM(CASE WHEN DAY(Pass_in_trip.date) > 20 THEN 1 ELSE 0 END) AS 21_30 
	FROM Trip 
	INNER JOIN Pass_in_trip ON Trip.trip_no = Pass_in_trip.trip_no AND CONVERT(char(6), P.date, 112) = '200304' 
GROUP BY Trip.ID_comp 
) AS R INNER JOIN Company ON R.ID_comp = Company.ID_comp
