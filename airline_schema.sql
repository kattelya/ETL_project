CREATE TABLE airport(
	airport_code TEXT PRIMARY KEY, 
	airport_name TEXT);

CREATE TABLE airline(
	airline_code TEXT PRIMARY KEY, 
	airline_name TEXT);
	
	
CREATE TABLE flight_2018(
	origin_airport_code TEXT,
	dest_airport_code TEXT,
	miles INT,
	airline_code TEXT,
	price FLOAT);


SELECT flight_2018.origin_airport_code, a1.airport_name, flight_2018.dest_airport_code, a2.airport_name, flight_2018.airline_code, airline.airline_name, flight_2018.miles, flight_2018.price
FROM flight_2018
LEFT OUTER JOIN airline ON flight_2018.airline_code = airline.airline_code
LEFT OUTER JOIN airport a1 ON flight_2018.origin_airport_code = a1.airport_code
LEFT OUTER JOIN airport a2 ON flight_2018.dest_airport_code = a2.airport_code;





 