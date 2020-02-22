ETL Project - Aviation Metrics

Team Members:
Melissa Lin,
Kat Anggasastra,
Sreeteja Bollepalli

Goal: Gain insights into the domestic airline industry by aggregating aviation metrics by flight routes, airlines, airport codes and price per flight.

Data Sources:
https://www.kaggle.com/shellshock1911/us-commercial-aviation-industry-metrics#airline_codes.csv
https://www.kaggle.com/zernach/2018-airplane-flights


Division of labor:  
Kat: SQL code to define and join tables \
Sreeteja: Clean data in Python \
Melissa: Convert pandas dataframe to SQL and push to Postgres 

Scope of work:

Extract:\
Download 3 files from Kaggle in csv format and read it into 3 Pandas dataframes:\
airline_codes.csv: Describes airline codes with corresponding airline names. This file has 2 columns and 15 rows.\
airport_codes.csv: Describes airport codes with corresponding airport names. This file has 2 columns and 30 rows.\
Cleaned_2018_Flights.csv: Describes the domestic aviation industry metrics for 15 U.S. airlines and 30 major U.S airports.  
This file has 14 columns and 900,000 rows. We were unable to load this to github because of the file size.
 

Transform:\
For Flight_2018.csv, we kept 5 columns that were relevant to airlines, departing and arrival airport codes, mileage and price per ticket. 
We renamed columns for readability and consistency. Since this file has over 900,000 rows, we had to select the first 10,000 rows to optimize combining and joining with airport and airline tables.

For airline.csv, we renamed columns for readability and consistency.\
For the airport.csv, we renamed columns for readability and consistency\
In Postgres, we joined all 3 tables with SQL based on airport codes and airline codes.

Load:\
For our production database, we used a Postgres relational database and named it airline_etl. 
We created tables for each csv file:  flight_2018, airline and airport\
From our Jupyter Notebook, we established a database connection with SQL alchemy.\
From our Jupyter Notebook, we pushed the Pandas dataframe into our Postgres production database.

Production database schemas:\
CREATE TABLE airline(\
	airline_code TEXT PRIMARY KEY,\
	airline_name TEXT);

CREATE TABLE airport(\
	airport_code TEXT PRIMARY KEY,\
	airport_name TEXT);

CREATE TABLE flight_2018(\
	origin_airport_code TEXT,\
	dest_airport_code TEXT,\
	miles INT,\
	airline_code TEXT,\
	price FLOAT);

Join 3 tables:\
SELECT flight_2018.origin_airport_code, a1.airport_name, 
	flight_2018.dest_airport_code, a2.airport_name,\
	flight_2018.airline_code, airline.airline_name,\
	flight_2018.miles, flight_2018.price\
FROM flight_2018\
LEFT OUTER JOIN airline ON flight_2018.airline_code = airline.airline_code\
LEFT OUTER JOIN airport a1 ON flight_2018.origin_airport_code = a1.airport_code\
LEFT OUTER JOIN airport a2 ON flight_2018.dest_airport_code = a2.airport_code;


Insights:\
With this aggregated data set, we can ask the following questions to understand the aviation industry:\
What are the most popular flight routes\
What are the minimum, maximum and average price per flight route\
What are the busiest airport




