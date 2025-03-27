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
