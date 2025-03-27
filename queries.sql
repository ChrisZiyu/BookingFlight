-- 1. List the airline, aircraft, and airport details for flight number AF393
SELECT F.flight_Num, A.code_airline, A.airline_Name, F.aircraft_Code, AC.aircraftDesc, 
       F.dep_Airport_Code, AP1.airportName AS dep_Airport_Name, 
       F.arr_Airport_Code, AP2.airportName AS arr_Airport_Name
FROM FLIGHTS F
JOIN AIRLINE A ON F.airline_Code = A.code_airline
JOIN AIRCRAFT AC ON F.aircraft_Code = AC.aircraftCode
JOIN AIRPORT AP1 ON F.dep_Airport_Code = AP1.airportCode
JOIN AIRPORT AP2 ON F.arr_Airport_Code = AP2.airportCode
WHERE F.flight_Num = 'AF393';

-- 2. List the flight details for bookingId 56753365, ordered by departure date and time
SELECT BF.booking_ID, BR.bookedOn, F.flight_Num, F.dep_Airport_Code, F.depDate AS depDate, 
       BF.depTime, F.arr_Airport_Code, F.arr_Date AS arrDate, BF.arrTime
FROM BOOKINGFLIGHT BF
JOIN FLIGHTS F ON BF.flightNum = F.flight_Num
JOIN BOOKINGRECORD BR ON BF.booking_ID = BR.bookingID
WHERE BF.booking_ID = 56753365
ORDER BY F.depDate, TO_DATE(BF.depTime, 'HH:MI PM');

-- 3. List all passengers for bookingID 56753365
SELECT Tt.booking_ID_Tckt AS bookingID, Tt.eticketNum, T.traveler_Fname, T.traveler_Lname
FROM TICKET Tt
JOIN TRAVELER T ON Tt.traveler_ID_Tckt = T.travelerID
WHERE Tt.booking_ID_Tckt = 56753365;

-- 4. Calculate the total fees for bookingID 56753365 (sum of ticket price and ticket fees for three tickets)
SELECT SUM(Tt.ticket_price + Tt.ticket_fees) AS total_fees
FROM TICKET Tt
WHERE Tt.booking_ID_Tckt = 56753365;

-- 5. Create a view named Book_ticket. In the view, show the list of all bookings 
--    and the number of tickets associated with each booking.
CREATE VIEW Book_ticket AS
SELECT BR.bookingID, COUNT(Tt.eticketNum) AS num_tickets
FROM BOOKINGRECORD BR
LEFT JOIN TICKET Tt ON BR.bookingID = Tt.booking_ID_Tckt
GROUP BY BR.bookingID;
