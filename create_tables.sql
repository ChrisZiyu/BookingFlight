
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

INSERT ALL
    INTO AIRPORT (airportcode, airportname, city)
        VALUES
        ('YYZ', 'Toronto Pearson Intnl, Ontario', 'Toronto')
        INTO AIRPORT(airportcode, airportname, city)
        VALUES
            ('CDG', 'Charles De Gaulle', 'Paris')
    INTO AIRPORT (airportcode, airportname, city)
        VALUES
        ('BEY', NULL, 'Beirut')
SELECT 1 FROM dual;

INSERT ALL
         INTO aircraft (aircraftcode, aircraftdesc)
         VALUES (772,'BOEING 777 285-305 STD SEATS')
         INTO aircraft (aircraftcode, aircraftdesc)
         VALUES (332, 'AIRBUS INDUSTRIE JET 200-345 STD SEATS')
SELECT 1 FROM dual;

INSERT INTO AIRLINE(code_airline,airline_name)
    VALUES('AF','AIR FRANCE');
INSERT INTO AIRLINE(code_airline,airline_name)
    VALUES('MEA','AIR FRANCE');
    
INSERT ALL
    INTO traveler(travelerid, traveler_Fname, traveler_Lname, gender)
    VALUES(111, 'Andrew', 'Smith', 'Male')
        INTO traveler(travelerid, traveler_Fname, traveler_Lname, gender)
    VALUES(112, 'Mariam', 'Daoud', 'Female')
        INTO traveler(travelerid, traveler_Fname, traveler_Lname, gender)
    VALUES(113, 'Yasmine', 'Ch', 'Female')
        INTO traveler(travelerid, traveler_Fname, traveler_Lname, gender)
    VALUES(114, 'Hasan', 'Ch', 'Male')
SELECT 1 FROM dual;

INSERT ALL
    INTO bookingrecord(bookingid,bookedOn)
    VALUES(56753936,TO_DATE('25-Jan-19', 'DD-Mon-YY'))
    INTO bookingrecord(bookingid,bookedOn)
    VALUES(56753365,TO_DATE('28-Jan-19','DD-Mon-YY'))
SELECT 1 FROM dual;

INSERT ALL 
    INTO flights(flight_num, airline_Code, aircraft_Code, operatedBy, depDate, dep_Airport_Code, dep_Airport_Name, dep_city,
                        arr_date, arr_Airport_Code, arr_Airport_Name, arr_city)
            VALUES('AF393', 'AF', 772, 'AF', TO_DATE('22-Jun-19', 'DD-Mon-YY'), 'YYZ', 'Toronto Pearson Intl, Ontario', 'Toronto',
                   TO_DATE('23-Jun-19', 'DD-Mon-YY'), 'CDG', 'Charles De Gaul', 'Paris')
    INTO flights (flight_num, airline_Code, aircraft_Code, operatedBy, depDate, dep_Airport_Code, dep_Airport_Name, dep_city,
                        arr_date, arr_Airport_Code, arr_Airport_Name, arr_city)
            VALUES('AF5106', 'AF', 332, 'MEA', TO_DATE('23-Jun-19', 'DD-Mon-YY'), 'CDG', 'Charles De Gaul', 'Paris',
                   TO_DATE('23-Jun-19', 'DD-Mon-YY'), 'BEY', NULL, 'Beirut')
    INTO flights(flight_num, airline_Code, aircraft_Code, operatedBy, depDate, dep_Airport_Code, dep_Airport_Name, dep_city,
                        arr_date, arr_Airport_Code, arr_Airport_Name, arr_city)
            VALUES('AF386', 'AF', 772, 'AF', TO_DATE('17-Jul-19', 'DD-Mon-YY'), 'CDG', 'Charles De Gaul', 'Paris',
                   TO_DATE('17-Jul-19', 'DD-Mon-YY'), 'YYZ', 'Toronto Pearson Intl, Ontario', 'Toronto')
SELECT 1 FROM dual;

INSERT ALL
    INTO bookingflight(booking_ID,flightNum,depTime,arrTime)
    VALUES(56753936,'AF393','9:20 PM','10:50 AM')
    INTO bookingflight(booking_ID,flightNum,depTime,arrTime)
    VALUES(56753936,'AF386','5:00 PM','7:20 PM')
    INTO bookingflight(booking_ID,flightNum,depTime,arrTime)
    VALUES(56753365,'AF393', '9:20 PM','10:50 AM')
    INTO bookingflight(booking_ID,flightNum,depTime,arrTime)
    VALUES(56753365,'AF5106','1:40 PM','6:55 PM')
SELECT 1 FROM dual;

INSERT ALL
    INTO TICKET
    VALUES(573480996631,111,56753936, 'Vegetarian',1200,182)
       INTO TICKET
    VALUES(573480996619,112,56753365, 'Halal', 1353,182)
           INTO TICKET
    VALUES(573480996620,113,56753365, 'Vegetarian', 1142,180)
           INTO TICKET
    VALUES(573480996621,114,56753365, 'Halal', 1142,180)
SELECT 1 FROM dual;
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

