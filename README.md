Sure! Here’s your **complete GitHub README** with **database normalization** properly formatted alongside the previous sections. 🚀  

---

# **🛫 Flight Booking Management System**  
*A relational database system for managing airline bookings, travelers, and tickets.*  

![Database Schema](https://your-image-link.com) *(Add an ER Diagram here if available!)*  

---

## **📖 Table of Contents**
- [🚀 Features](#-features)
- [🛠️ Technologies Used](#-technologies-used)
- [📂 Database Design](#-database-design)
- [🔎 Database Normalization](#-database-normalization)
- [📜 SQL Queries](#-sql-queries)
- [⚙️ Setup & Installation](#️-setup--installation)
- [📸 Screenshots (ER Diagram)](#-screenshots-er-diagram)
- [📌 Future Enhancements](#-future-enhancements)
- [📞 Contact](#-contact)

---

## **🚀 Features**
✅ **Fully normalized relational database** (1NF, 2NF, 3NF)  
✅ **Entity-Relationship (ER) model** for structuring flight bookings  
✅ **Advanced SQL queries** for managing bookings, travelers, and flights  
✅ **Joins, aggregations, and views** for optimized data retrieval  

---

## **🛠️ Technologies Used**
- **Database:** PostgreSQL / Oracle SQL  
- **Query Language:** SQL  
- **Tools:** SQL Developer / pgAdmin  
- **Concepts:** Normalization, Joins, Views

---

## **📂 Database Design**
### **1️⃣ Entities & Tables**
The system consists of multiple tables with **foreign key relationships**:

| **Table Name**  | **Description** |
|----------------|---------------|
| `Airports`  | Stores airport details (code, name, city) |
| `Flights`  | Contains flight information (number, airline, aircraft, timings) |
| `Airlines`  | Stores airline names and codes |
| `Travelers`  | Maintains passenger details (name, gender, ID) |
| `Tickets`  | Links travelers to their flight bookings |
| `BookingRecords`  | Stores flight booking details |

---

## **🔎 Database Normalization**
To ensure **data integrity, minimize redundancy, and optimize query performance**, the **Flight Booking Management System** database was **normalized to 3NF (Third Normal Form).**  

### **🛠 Normalization for Booking Records**  
#### **✅ 1NF (First Normal Form)**
Ensures each column contains **atomic values** (no repeating groups).  
```plaintext
BookingRecord [bookingID, flight_num, bookedOn, flightName, airlineCode, airlineName, 
               aircraftCode, aircraftDesc, operatedBy, depdate, depTime, depAirportName, 
               depCity, arrDate, arrTime, arrAirportCode, arrAirportName]
Bookings_Flight [bookingID, bookedOn]
```
---

#### **✅ 2NF (Second Normal Form)**
Removes **partial dependencies** by ensuring all **non-key attributes are fully dependent** on the primary key.  
```plaintext
BookingRecord [bookingID, bookedOn]
Bookings_Flight [bookingID, flight_num]
Flight [flightNum, flightName, airlineCode (FK), airlineName, aircraftCode (FK), aircraftDesc, 
        operatedBy (FK), depdate, depTime, depAirportCode (FK), depAirportName, depCity, 
        arrDate, arrTime, arrAirportCode (FK), arrAirportName]
```
---

#### **✅ 3NF (Third Normal Form)**
Eliminates **transitive dependencies**, ensuring that **non-key attributes are not dependent on other non-key attributes**.  
```plaintext
BookingRecord [bookingID, bookedOn]
Booking_Flight [bookingID (FK), flight_num (FK), depTime, arrTime]
Flight [flightNum, airlineCode (FK), aircraftCode (FK), operatedBy (FK), depdate, 
        depAirportCode (FK), depAirportName, depCity, arrDate, arrAirportCode (FK), arrAirportName]
Airline [airlineCode, airlineName]
Aircraft [aircraftCode, aircraftDesc, operatedBy]
Airport [airportCode, airportName, city]
```
---

### **🛠 Normalization for Ticket System**  
#### **✅ 1NF (First Normal Form)**
Ensures no **duplicate or repeating groups**.  
```plaintext
Ticket [eticket#, travelerID, bookingID (FK), travelerFname, travelerLname, 
        gender, mealPreference, ticketPrice, taxesFees]
```
---

#### **✅ 2NF (Second Normal Form)**
Splitting data to remove **partial dependencies**.  
```plaintext
Traveler [travelerID, travelerFname, travelerLname, gender]
Ticket [eTicket#, travelerID (FK), bookingID (FK), ticketPrice, taxesFees, mealPreference]
```
---

✅ **By normalizing the database,** we ensure **efficient data retrieval, reduced redundancy, and improved database performance!** 🎯  

---

Here is your **updated GitHub README** with the additional **SQL queries** properly formatted. 🚀  

---

## **📜 SQL Queries**
### 🔍 **1️⃣ List Airline, Aircraft & Airport details for a flight**
```sql
SELECT F.flight_Num, A.code_airline, A.airline_Name, F.aircraft_Code, AC.aircraftDesc, 
       F.dep_Airport_Code, AP1.airportName AS dep_Airport_Name, 
       F.arr_Airport_Code, AP2.airportName AS arr_Airport_Name
FROM FLIGHTS F
JOIN AIRLINE A ON F.airline_Code = A.code_airline
JOIN AIRCRAFT AC ON F.aircraft_Code = AC.aircraftCode
JOIN AIRPORT AP1 ON F.dep_Airport_Code = AP1.airportCode
JOIN AIRPORT AP2 ON F.arr_Airport_Code = AP2.airportCode
WHERE F.flight_Num = 'AF393';
```
---

### 📋 **2️⃣ List flight details for a specific booking**
*(Fetches flight details for `bookingId = 56753365`, ordered by departure date and time.)*
```sql
SELECT BF.booking_ID, BR.bookedOn, F.flight_Num, F.dep_Airport_Code, F.depDate AS depDate, 
       BF.depTime, F.arr_Airport_Code, F.arr_Date AS arrDate, BF.arrTime
FROM BOOKINGFLIGHT BF
JOIN FLIGHTS F ON BF.flightNum = F.flight_Num
JOIN BOOKINGRECORD BR ON BF.booking_ID = BR.bookingID
WHERE BF.booking_ID = 56753365
ORDER BY F.depDate, TO_DATE(BF.depTime, 'HH:MI PM');
```
---

### 🧑‍✈️ **3️⃣ List all passengers for a specific booking**
*(Retrieves all passengers associated with `bookingId = 56753365`.)*
```sql
SELECT Tt.booking_ID_Tckt AS bookingID, Tt.eticketNum, T.traveler_Fname, T.traveler_Lname
FROM TICKET Tt
JOIN TRAVELER T ON Tt.traveler_ID_Tckt = T.travelerID
WHERE Tt.booking_ID_Tckt = 56753365;
```
---

### 💰 **4️⃣ Calculate total ticket fees for a booking**
*(Calculates the total amount paid for tickets and fees for `bookingId = 56753365`.)*
```sql
SELECT SUM(Tt.ticket_price + Tt.ticket_fees) AS total_fees
FROM TICKET Tt
WHERE Tt.booking_ID_Tckt = 56753365;
```
---

### 📊 **5️⃣ Create a SQL View for Bookings & Ticket Count**
*(Creates a view to track the number of tickets for each booking.)*
```sql
CREATE VIEW Book_ticket AS
SELECT BR.bookingID, COUNT(Tt.eticketNum) AS num_tickets
FROM BOOKINGRECORD BR
LEFT JOIN TICKET Tt ON BR.bookingID = Tt.booking_ID_Tckt
GROUP BY BR.bookingID;
```
---

## **⚙️ Setup & Installation**
### **1️⃣ Clone the repository**
```bash
git clone https://github.com/ChrisZiyu/flight-booking-db.git
cd flight-booking-db
```
---

### **2️⃣ Install PostgreSQL (if not installed)**
[Download PostgreSQL](https://www.postgresql.org/download/)  

---

### **3️⃣ Import the database**
Run the SQL schema file:
```bash
psql -U your_username -d your_database -f assignment2SQL.sql
```
---

## **📸 Screenshots (ER Diagram)**
![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Flights.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Airport.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Airline_aircraft.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/BookingFlight.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Ticket_traveler.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Traveler.jpg)

![Database Schema](https://github.com/ChrisZiyu/BookingFlight/blob/main/Airline_flights.jpg)




---

## **📌 Future Enhancements**
🔹 **API Development using Node.js & Express.js**  
🔹 **Integration with a frontend (React.js or Angular)**  
🔹 **Performance tuning with indexing & caching**  

---

## **📞 Contact**
📧 **Email:** [christianukiike@gmail.com](mailto:christianukiike@gmail.com)  
🔗 **GitHub:** [github.com/ChrisZiyu](https://github.com/ChrisZiyu)  

---


