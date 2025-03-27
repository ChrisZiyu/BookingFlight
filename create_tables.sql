
--Airport Table
CREATE TABLE AIRPORT(
    airportCode char(3) NOT NULL PRIMARY KEY,
    airportName varchar(30),
    city varchar(30)
);
--Aircraft Table
CREATE TABLE AIRCRAFT(
    aircraftCode char(3) NOT NULL PRIMARY KEY,
    aircraftDesc varchar (60)
);
--Airline Table
CREATE TABLE AIRLINE (
    code_airline char(5) PRIMARY KEY,
    airline_Name varchar(30)
);
--Traveler Table
CREATE TABLE TRAVELER(
        travelerID number NOT NULL PRIMARY KEY,
        traveler_Fname varchar(30),
        traveler_Lname varchar(30),
        gender char(10)
);

--Booking Record Table
CREATE TABLE BOOKINGRECORD(
    bookingID number,
    bookedOn DATE
);

--Flights Table
CREATE TABLE FLIGHTS (
    flight_Num varchar(10) NOT NULL PRIMARY KEY,
    airline_Code char(5),
    aircraft_Code char(3),
    operatedBy char(5),
    depDate date,
    dep_Airport_Code char(3),
    dep_Airport_Name varchar(30),
    dep_city varchar(15),
    arr_Date date,
    arr_Airport_Code char(3),
    arr_Airport_Name varchar(30),
    arr_city varchar(15)
);

CREATE TABLE BOOKINGFLIGHT (
    booking_ID NUMBER,
    flightNum VARCHAR(10),
    depTime VARCHAR(8),
    arrTime VARCHAR(8)
);
CREATE TABLE TICKET(
        eticketNum number NOT NULL,
        traveler_ID_Tckt NUMBER,
        booking_ID_Tckt NUMBER,
        meal_preference varchar(15),
        ticket_price NUMBER,
        ticket_fees NUMBER
);

--ADD CONSTRAINTS
ALTER TABLE BOOKINGRECORD
ADD CONSTRAINT pk_booking_Record 
PRIMARY KEY(bookingID);

ALTER TABLE FLIGHTS
ADD CONSTRAINT fk_aircraftCode_FlightT 
FOREIGN KEY(aircraft_Code) REFERENCES AIRCRAFT(aircraftCode);

ALTER TABLE FLIGHTS
ADD CONSTRAINT fk_operatedBy_FlightT 
FOREIGN KEY(operatedBy) REFERENCES AIRLINE(code_airline);

ALTER TABLE FLIGHTS
 ADD CONSTRAINT fk_depAirpCode_FLightT 
 FOREIGN KEY (dep_Airport_Code) REFERENCES AIRPORT(airportCode);
 
ALTER TABLE FLIGHTS
ADD CONSTRAINT fk_arrAirpCode_FLightT 
FOREIGN KEY(arr_Airport_Code) REFERENCES AIRPORT(airportCode);

ALTER TABLE FLIGHTS
ADD CONSTRAINT fk_airlineCode_FlightT
FOREIGN KEY(airline_Code) REFERENCES AIRLINE(code_airline);

ALTER TABLE BOOKINGFLIGHT
ADD CONSTRAINT fk_booking_ID_BookingFlightT
FOREIGN KEY (booking_ID) REFERENCES BOOKINGRECORD (bookingID);

ALTER TABLE BOOKINGFLIGHT
ADD CONSTRAINT fk_flight_Num_BookingFlightT 
FOREIGN KEY (flightNum) REFERENCES FLIGHTS (flight_Num);

 ALTER TABLE TICKET
ADD CONSTRAINT fk_booking_ID_TicketT 
FOREIGN KEY (booking_ID_Tckt) REFERENCES BOOKINGRECORD (bookingID);   

ALTER TABLE TICKET
ADD CONSTRAINT fk_Traveler_ID_TicketT 
FOREIGN KEY (traveler_ID_Tckt) REFERENCES TRAVELER (travelerID);

--
--rollback;
--SELECT * 
--FROM AIRCRAFT;

-- Drop constraints on FLIGHTS table
/*ALTER TABLE FLIGHTS DROP CONSTRAINT fk_aircraftCode_FlightT;
ALTER TABLE FLIGHTS DROP CONSTRAINT fk_operatedBy_FlightT;
ALTER TABLE FLIGHTS DROP CONSTRAINT fk_depAirpCode_FLightT;
ALTER TABLE FLIGHTS DROP CONSTRAINT fk_arrAirpCode_FLightT;
ALTER TABLE FLIGHTS DROP CONSTRAINT fk_airlineCode_FlightT;

-- Drop constraints on BOOKINGFLIGHT table
ALTER TABLE BOOKINGFLIGHT DROP CONSTRAINT fk_booking_ID_BookingFlightT;
ALTER TABLE BOOKINGFLIGHT DROP CONSTRAINT fk_flight_Num_BookingFlightT;

ALTER TABLE TICKET DROP CONSTRAINT fk_Traveler_ID_TicketT ;

ALTER TABLE TICKET DROP CONSTRAINT fk_booking_ID_TicketT ;


-- Drop dependent tables first
DROP TABLE BOOKINGFLIGHT;
DROP TABLE FLIGHTS;

-- Drop other tables
DROP TABLE BOOKINGRECORD;
DROP TABLE TICKET;
DROP TABLE TRAVELER;
DROP TABLE AIRLINE;
DROP TABLE AIRCRAFT;
DROP TABLE AIRPORT;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'FLIGHTS' AND CONSTRAINT_TYPE = 'R';*/

