-- Create Table: Guest
-- Stores information about hotel guests.
CREATE TABLE Guest (
                       IdGuest NUMBER PRIMARY KEY,         -- Unique identifier for the guest
                       Name VARCHAR2(100),                 -- Guest's first name
                       Surname VARCHAR2(100),              -- Guest's last name
                       Discount NUMBER(5,2)                -- Discount percentage for the guest (e.g., 0.05 for 5%)
);

-- Create Table: Categor
-- Stores information about room categories.
CREATE TABLE Categor (
                          IdCategor NUMBER PRIMARY KEY,      -- Unique identifier for the room Categor
                          Name VARCHAR2(50),                  -- Name of the Categor (e.g., 'Standard', 'Deluxe', 'Suite')
                          Price NUMBER(10,2)                  -- Price per night for this Categor
);

-- Create Table: Room
-- Stores information about individual rooms.
-- Includes a foreign key to link to its Categor.
CREATE TABLE Room (
                      RoomNumber NUMBER PRIMARY KEY,      -- Unique identifier for the room
                      Capacity NUMBER(2),                 -- Maximum capacity of the room (number of people)
                      Categor_IdCategor NUMBER,         -- Foreign Key referencing the Categor table
                      FOREIGN KEY (Categor_IdCategor) REFERENCES Categor(IdCategor)
);

-- Create Table: Reservation
-- Stores information about room reservations.
-- Includes foreign keys to link to the guest and the room.
CREATE TABLE Reservation (
                             IdReservation NUMBER PRIMARY KEY,   -- Unique identifier for the reservation
                             DateStart DATE,                     -- Start date of the reservation
                             DateEnd DATE,                       -- End date of the reservation
                             Paid SMALLINT,                      -- Payment status (0 for unpaid, 1 for paid)
                             Guest_IdGuest NUMBER,               -- Foreign Key referencing the Guest table
                             Room_RoomNumber NUMBER,             -- Foreign Key referencing the Room table
                             FOREIGN KEY (Guest_IdGuest) REFERENCES Guest(IdGuest),
                             FOREIGN KEY (Room_RoomNumber) REFERENCES Room(RoomNumber)
);


-- Insert Sample Data into Guest table
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (101, 'Alice', 'Smith', 0.05);
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (102, 'Bob', 'Johnson', 0.10);
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (103, 'Charlie', 'Brown', 0.00);
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (104, 'Diana', 'Miller', 0.08);
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (105, 'Eve', 'Taylor', 0.00);
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (106, 'Frank', 'Black', 0.00); -- Guest with surname starting with 'B'
INSERT INTO Guest (IdGuest, Name, Surname, Discount) VALUES (107, 'Grace', 'White', 0.00);


-- Insert Sample Data into Categor table
INSERT INTO Categor (IdCategor, Name, Price) VALUES (1, 'Standard', 100.00);
INSERT INTO Categor (IdCategor, Name, Price) VALUES (2, 'Deluxe', 150.00);
INSERT INTO Categor (IdCategor, Name, Price) VALUES (3, 'Suite', 250.00);
INSERT INTO Categor (IdCategor, Name, Price) VALUES (4, 'Luxury', 350.00); -- Added for 'luxurious rooms' query

-- Insert Sample Data into Room table
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (101, 2, 1); -- Standard
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (102, 2, 1); -- Standard
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (201, 3, 2); -- Deluxe
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (202, 3, 2); -- Deluxe
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (301, 4, 3); -- Suite
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (302, 4, 3); -- Suite
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (401, 5, 4); -- Luxury
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (402, 6, 4); -- Luxury
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (501, 2, 1); -- Standard, never booked
INSERT INTO Room (RoomNumber, Capacity, Categor_IdCategor) VALUES (502, 3, 2); -- Deluxe, never booked

-- Insert Sample Data into Reservation table
-- Use TO_DATE for Oracle date literals
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1, 101, 101); -- Alice, Room 101, Paid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (2, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 0, 101, 201); -- Alice, Room 201, Unpaid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (3, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 1, 102, 102); -- Bob, Room 102, Paid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (4, TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-18', 'YYYY-MM-DD'), 1, 103, 301); -- Charlie, Room 301, Paid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (5, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-03', 'YYYY-MM-DD'), 0, 104, 202); -- Diana, Room 202, Unpaid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (6, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-08-15', 'YYYY-MM-DD'), 1, 101, 302); -- Alice, Room 302, Paid (3rd paid for Alice)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (7, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-02', 'YYYY-MM-DD'), 1, 101, 101); -- Alice, Room 101, Paid (4th paid for Alice)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (8, TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-06', 'YYYY-MM-DD'), 0, 106, 102); -- Frank, Room 102, Unpaid
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (9, TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-12', 'YYYY-MM-DD'), 1, 102, 201); -- Bob, Room 201, Paid (2nd paid for Bob)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (10, TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'), 0, 102, 301); -- Bob, Room 301, Unpaid (2nd unpaid for Bob)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (11, TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'), 1, 101, 401); -- Alice, Room 401, Paid (5th paid for Alice)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (12, TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'), 1, 103, 402); -- Charlie, Room 402, Paid (2nd paid for Charlie)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (13, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), 1, 104, 101); -- Diana, Room 101, Paid (1st paid for Diana)
INSERT INTO Reservation (IdReservation, DateStart, DateEnd, Paid, Guest_IdGuest, Room_RoomNumber) VALUES (14, TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-11-07', 'YYYY-MM-DD'), 0, 105, 201); -- Eve, Room 201, Unpaid


-- 1. Find the room with the lowest number in its respective room category.
select RoomNumber from Room
join Categor C2 on C2.IdCategor = Room.Categor_IdCategor
where Price in (select min(Price) from Categor);
-- 2. List the number of paid reservations for each guest. Do not list those guests who have booked less
-- than 3 times.
select g.Name, count()
-- 3. Find the category with the most rooms.

-- 4. List the guests who booked rooms in categories 1 and 3 without repetition

-- 5. List the duration of all reservations. Provide the customer's name and surname, and name the

-- duration column "Booking duration".

-- 6. List the number of unpaid reservations for each guest. Do not list guests with last names beginning
-- with the letter "B".

-- 7. Find rooms that have never been booked.

-- 8. List guests who have never rented a room (first name, last name).

-- 9. List the reservation details as: first name, surname, room number, and category name. Sort by
-- category name and descending by the last name.

-- 10. List the luxurious rooms that have a higher capacity than the minimum capacity of a standard
-- room.
