---

# **🛫 Flight Booking Management System**  
*A relational database system for managing airline bookings, travelers, and tickets.*  

![Database Schema](https://your-image-link.com) *(Add an ER Diagram here if available!)*  

---

## **📖 Table of Contents**
- [🚀 Features](#-features)
- [🛠️ Technologies Used](#-technologies-used)
- [📂 Database Design](#-database-design)
- [📜 SQL Queries](#-sql-queries)
- [⚙️ Setup & Installation](#️-setup--installation)
- [📸 Screenshots (ER Diagram)](#-screenshots-er-diagram)
- [📌 Future Enhancements](#-future-enhancements)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [📞 Contact](#-contact)

---

## **🚀 Features**
✅ **Fully normalized relational database** (1NF, 2NF, 3NF)  
✅ **Entity-Relationship (ER) model** for structuring flight bookings  
✅ **Advanced SQL queries** for managing bookings, travelers, and flights  
✅ **Joins, aggregations, and views** for optimized data retrieval  
✅ **Stored procedures and triggers** *(if applicable)* for automation  

---

## **🛠️ Technologies Used**
- **Database:** PostgreSQL / Oracle SQL  
- **Query Language:** SQL  
- **Tools:** SQL Developer / pgAdmin  
- **Concepts:** Normalization, Joins, Views, Stored Procedures  

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

### 📋 **2️⃣ List all passengers for a specific booking**
```sql
SELECT Tt.booking_ID_Tckt AS bookingID, Tt.eticketNum, 
       T.traveler_Fname, T.traveler_Lname
FROM TICKET Tt
JOIN TRAVELER T ON Tt.traveler_ID_Tckt = T.travelerID
WHERE Tt.booking_ID_Tckt = 56753365;
```
---

### 💰 **3️⃣ Calculate total fees for a booking**
```sql
SELECT SUM(Tt.ticket_price + Tt.ticket_fees) AS total_fees
FROM TICKET Tt
WHERE Tt.booking_ID_Tckt = 56753365;
```
---

### 🔎 **4️⃣ Create a SQL View for Bookings & Ticket Count**
```sql
CREATE VIEW Book_ticket AS
SELECT BR.bookingID, COUNT(Tt.eticketNum) AS num_tickets
FROM BOOKINGRECORD BR
LEFT JOIN TICKET Tt ON BR.bookingID = Tt.booking_ID_Tckt
GROUP BY BR.bookingID;
```
✅ **Optimized queries** for better performance  
✅ **Indexes & constraints** to maintain data integrity  

---

## **⚙️ Setup & Installation**
### **1️⃣ Clone the repository**
```bash
git clone https://github.com/yourusername/flight-booking-db.git
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
*(Add an image of your ER Diagram if available!)*  

---

## **📌 Future Enhancements**
🔹 **API Development using Node.js & Express.js**  
🔹 **Integration with a frontend (React.js or Angular)**  
🔹 **Performance tuning with indexing & caching**  

---

## **🤝 Contributing**
Pull requests are welcome! Feel free to submit feature requests or bug fixes.  

---

## **📄 License**
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.  

---

## **📞 Contact**
📧 **Email:** [your-email@example.com](mailto:your-email@example.com)  
🔗 **GitHub:** [github.com/yourusername](https://github.com/yourusername)  

---

This **README** is fully **structured & optimized** for **GitHub** with Markdown **headings, tables, and code blocks**. 🎯  

✅ **Next Step:** Upload your project to **GitHub**, and I can help format the repo! 🚀  
Would you like me to **write a short project description for LinkedIn as well?**
