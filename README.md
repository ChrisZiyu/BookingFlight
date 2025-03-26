# BookingFlight
A structured relational database for managing flight bookings, passengers, and ticketing operations.

📖 Table of Contents
📌 Flight Booking Management System
🚀 Features
🛠️ Technologies Used
🎯 Database Design
📂 SQL Queries
📜 Setup & Installation
📸 Screenshots (ER Diagram)
📌 To-Do & Future Enhancements
🤝 Contributing
📄 License
📞 Contact
🚀 Features
✅ Fully normalized relational database (1NF, 2NF, 3NF)
✅ Entity-Relationship (ER) diagram to structure flight bookings
✅ SQL queries for CRUD operations (Create, Read, Update, Delete)
✅ Advanced SQL joins to retrieve complex booking & passenger data
✅ Aggregation & views for ticket summary reports
✅ Stored procedures & triggers (if applicable) for automation

🛠️ Technologies Used
Database: PostgreSQL / Oracle SQL
Query Language: SQL
Tools: SQL Developer / pgAdmin
Concepts: Normalization, Joins, Views, Stored Procedures
🎯 Database Design
The system is structured into the following tables:

Airports (airportCode, airportName, city)
Flights (flightNum, airlineCode, aircraftCode, departureDate, etc.)
Airlines (airlineCode, airlineName)
Travelers (travelerID, firstName, lastName, gender)
Tickets (eticketNum, travelerID, bookingID, ticketPrice, taxesFees)
Booking Records (bookingID, bookedOn)
✅ Normalized to 3NF to remove redundant data
✅ One-to-many relationships for structured data integrity

📂 SQL Queries
1️⃣ List Airline, Aircraft & Airport details for a flight
sql
Copy
Edit
SELECT F.flight_Num, A.code_airline, A.airline_Name, F.aircraft_Code, AC.aircraftDesc, 
       F.dep_Airport_Code, AP1.airportName AS dep_Airport_Name, F.arr_Airport_Code, 
       AP2.airportName AS arr_Airport_Name
FROM FLIGHTS F
JOIN AIRLINE A ON F.airline_Code = A.code_airline
JOIN AIRCRAFT AC ON F.aircraft_Code = AC.aircraftCode
JOIN AIRPORT AP1 ON F.dep_Airport_Code = AP1.airportCode
JOIN AIRPORT AP2 ON F.arr_Airport_Code = AP2.airportCode
WHERE F.flight_Num = 'AF393';
2️⃣ Calculate total ticket fees for a booking
sql
Copy
Edit
SELECT SUM(Tt.ticket_price + Tt.ticket_fees) AS total_fees
FROM TICKET Tt
WHERE Tt.booking_ID_Tckt = 56753365;
✅ Optimized queries for fast execution
✅ Advanced joins for retrieving structured data

📜 Setup & Installation
1️⃣ Clone the repository
bash
Copy
Edit
git clone https://github.com/yourusername/flight-booking-db.git
cd flight-booking-db
2️⃣ Install PostgreSQL (if not installed)
Download PostgreSQL

3️⃣ Import the database
Run the SQL schema file:

bash
Copy
Edit
psql -U your_username -d your_database -f assignment2SQL.sql
📸 Screenshots (ER Diagram)
(Add a screenshot of your ER Diagram here if available!)

📌 To-Do & Future Enhancements
✅ Integrate with a frontend (React.js or Angular)
✅ API Development using Node.js & Express.js
✅ Improve performance with indexing & caching

🤝 Contributing
Pull requests are welcome! Please open an issue first to discuss changes.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

📞 Contact
✉️ Email: your-email@example.com
🔗 GitHub: github.com/yourusername

