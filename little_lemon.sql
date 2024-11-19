CREATE DATABASE IF NOT EXISTS little_lemon;
Use little_lemon;

CREATE TABLE Customers(CustomerID 
INT NOT NULL PRIMARY KEY, FULLName VARCHAR(100) NOT NULL,
PhoneNumber INT NOT NULL UNIQUE);

INSERT INTO Customers(CustomerID,FullNAME,PhoneNumber)
VALUES
(1, "Latika Desai", 0757536378), 
(2, "Manish Deshmukh", 0757536379), 
(3, "Soham Nal", 0757536376), 
(4, "Shubham Das", 0757536375), 
(5, "Rohit Purohit", 0757536374),     
(6, "Ketki Desai", 0757636378),      
(7, "Nimesh Jaha", 0753536379),      
(8, "Shreeja Datt", 0754536376),      
(9, "Mike Edwards", 0757236375),     
(10, "Karl Pederson", 0757936374);

SELECT * FROM Customers;

CREATE TABLE Booking(BookingID INT, BookingDate DATE,TableNUMBER INT, NumberOfGuests INT, CustomerID INT);
INSERT INTO Booking
(BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES
(10, '2021-11-10', 7, 5, 1),  
(11, '2021-11-10', 5, 2, 2),  
(12, '2021-11-10', 3, 2, 4), 
(13, '2021-11-11', 2, 5, 5),  
(14, '2021-11-11', 5, 2, 6),  
(15, '2021-11-11', 3, 2, 7), 
(16, '2021-11-11', 3, 5, 1),  
(17, '2021-11-12', 5, 2, 2),  
(18, '2021-11-12', 3, 2, 4), 
(19, '2021-11-13', 7, 5, 6),  
(20, '2021-11-14', 5, 2, 3),  
(21, '2021-11-14', 3, 2, 4);

SELECT * FROM Booking;

CREATE TABLE Courses(CourseName VARCHAR(255) PRIMARY KEY, Cost Decimal(4,2));
INSERT INTO Courses (CourseName,Cost)
VALUES
("Greek Salad",15.00),
("Bean Soup",12.25),
("Pizza",15.00),
("Carbonara",12.00),
("Kabasa",17.00),
("Shwarma",11.30);

SELECT * FROM Courses;

SELECT * FROM Booking
WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';

SELECT Customers.FullName, Booking.BookingID 
FROM Customers RIGHT JOIN Booking 
ON Customers.CustomerID = Booking.CustomerID 
WHERE BookingDate = '2021-11-11';

SELECT BookingDate, COUNT(BookingDate) 
FROM Booking
GROUP BY BookingDate;

SELECT * FROM Courses;


CREATE TABLE DeliveryAddress(     
    ID INT PRIMARY KEY,     
    Address VARCHAR(255) NOT NULL,     
    Type VARCHAR(100) NOT NULL DEFAULT "Private",     
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SHOW COLUMNS FROM DeliveryAddress;

ALTER TABLE Courses ADD COLUMN Ingredients VARCHAR(255);
SHOW COLUMNS FROM Courses;


SELECT FullName 
FROM Customers 
WHERE (SELECT CustomerID FROM Booking WHERE Customers.CustomerID = Booking.CustomerID and BookingDate = "2021-11-11");

CREATE VIEW BookingView AS SELECT BookingID, BookingDate, NumberOfGuests FROM Booking WHERE NumberOfGuests > 3 AND BookingDate < "2021-11-13";
SELECT * FROM BookingView;

CREATE PROCEDURE GetBookingsData (InputDate DATE) 
SELECT * 
FROM Booking 
WHERE BookingDate = InputDate;

SELECT CONCAT("ID: ", BookingID,', Date: ', BookingDate,', Number of guests: ', NumberOfGuests) AS "Booking Details" FROM Booking;