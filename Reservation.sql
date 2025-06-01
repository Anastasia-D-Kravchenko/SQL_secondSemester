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
select g.Name from Guest g
join Reservation r on g.IdGuest = r.Guest_IdGuest
where r.Paid = 1
group by g.Name
having count(r.Paid) > 3;
-- 3. Find the category with the most rooms.
select Name, Price from Categor r
where Price = (select max(Price) from Categor);
-- 4. List the guests who booked rooms in categories 1 and 3 without repetition
select g.Name from Guest g
join Reservation r on r.Guest_IdGuest = g.IDGUEST
join Room R2 on r.Room_RoomNumber = R2.RoomNumber
join Categor c on R2.Categor_IdCategor = c.IdCategor
where c.Name in ('Standard','Luxury')
GROUP BY g.Name, c.Name
having count(c.Name) < 2;
-- 5. List the duration of all reservations. Provide the customer's name and surname, and name the
-- duration column "Booking duration".
select g.Name, g.Surname, r.DateEnd - r.DateStart as "Booking duration" from Guest g
join Reservation R on g.IdGuest = R.Guest_IdGuest;
-- 6. List the number of unpaid reservations for each guest. Do not list guests with last names beginning
-- with the letter "B".
select g.Name, g.Surname, count(r.Paid) from Guest g
join Reservation R on g.IdGuest = R.Guest_IdGuest
where r.Paid = 0 and g.SURNAME not like 'B%'
group by g.Name, g.Surname;
-- 7. Find rooms that have never been booked.
select r.RoomNumber from Room r
where not exists(select ROOM_ROOMNUMBER from Reservation where r.RoomNumber = Reservation.Room_RoomNumber);
-- 8. List guests who have never rented a room (first name, last name).
select g.Name, g.Surname from Guest g
where not exists(select Guest_IdGuest from Reservation where g.IDGUEST = Reservation.Guest_IdGuest);
-- 9. List the reservation details as: first name, surname, room number, and category name. Sort by
-- category name and descending by the last name.
select g.Name, g.Surname, r2.RoomNumber, c2.Name from Guest g
join Reservation R on g.IdGuest = R.Guest_IdGuest
join Room R2 on R2.RoomNumber = R.Room_RoomNumber
join Categor C2 on C2.IdCategor = R2.Categor_IdCategor
order by c2.NAME, g.Surname DESC ;
-- 10. List the luxurious rooms that have a higher capacity than the minimum capacity of a standard
-- room.
select c.Name, r.Capacity from Categor c
join Room R on c.IdCategor = R.Categor_IdCategor
where c.Name = 'Luxury' and r.CAPACITY > (select min(Capacity) from Room
                                                               join Categor C2 on Room.Categor_IdCategor = C2.IdCategor
                                                               where c2.NAME = 'Standard');













-- Create Table: Patient
CREATE TABLE Patient (
                         IdPatient NUMBER PRIMARY KEY,
                         FirstName VARCHAR2(50),
                         LastName VARCHAR2(50),
                         DateOfBirth DATE
);

-- Create Table: Specialization
CREATE TABLE Specialization (
                                IdSpecialization NUMBER PRIMARY KEY,
                                Name VARCHAR2(50)
);

-- Create Table: Doctor
CREATE TABLE Doctor (
                        IdDoctor NUMBER PRIMARY KEY,
                        FirstName VARCHAR2(50),
                        LastName VARCHAR2(50),
                        Salary NUMBER(10,2), -- Assuming this is annual salary for monthly calculation later
                        IdSpecialization NUMBER,
                        FOREIGN KEY (IdSpecialization) REFERENCES Specialization(IdSpecialization)
);

-- Create Table: Appointment
CREATE TABLE Appointment (
                             IdAppointment NUMBER PRIMARY KEY,
                             AppointmentDate DATE,
                             Price NUMBER(10,2),
                             Description VARCHAR2(250),
                             Patient_IdPatient NUMBER,
                             Doctor_IdDoctor NUMBER,
                             FOREIGN KEY (Patient_IdPatient) REFERENCES Patient(IdPatient),
                             FOREIGN KEY (Doctor_IdDoctor) REFERENCES Doctor(IdDoctor)
);

-- Insert Data: Specialization
INSERT INTO Specialization (IdSpecialization, Name) VALUES (1, 'Cardiologist');
INSERT INTO Specialization (IdSpecialization, Name) VALUES (2, 'Pediatrician');
INSERT INTO Specialization (IdSpecialization, Name) VALUES (3, 'Dermatologist');
INSERT INTO Specialization (IdSpecialization, Name) VALUES (4, 'Dentist');
INSERT INTO Specialization (IdSpecialization, Name) VALUES (5, 'Neurologist');
INSERT INTO Specialization (IdSpecialization, Name) VALUES (6, 'Orthopedist');


-- Insert Data: Doctor
-- Doctors with specializations
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (101, 'John', 'Doe', 120000.00, 1); -- Cardiologist
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (102, 'Jane', 'Smith', 96000.00, 2); -- Pediatrician
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (103, 'Peter', 'Jones', 108000.00, 3); -- Dermatologist
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (104, 'Mary', 'Dent', 84000.00, 4); -- Dentist
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (105, 'Robert', 'Brown', 132000.00, 1); -- Cardiologist
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (106, 'Susan', 'Davis', 110000.00, 5); -- Neurologist
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (107, 'Chris', 'Evans', 105000.00, 6); -- Orthopedist
-- Doctors without specialization (IdSpecialization is NULL)
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (108, 'Lisa', 'White', 72000.00, NULL);
INSERT INTO Doctor (IdDoctor, FirstName, LastName, Salary, IdSpecialization) VALUES (109, 'David', 'Green', 78000.00, NULL);


-- Insert Data: Patient
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (1, 'Adam', 'Smith', TO_DATE('1980-01-15', 'YYYY-MM-DD'));
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (2, 'Maria', 'Kowalska', TO_DATE('1990-05-20', 'YYYY-MM-DD'));
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (3, 'John', 'Doe', TO_DATE('1975-11-10', 'YYYY-MM-DD')); -- Duplicate name
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (4, 'Adam', 'Smith', TO_DATE('1980-01-15', 'YYYY-MM-DD')); -- Duplicate name/surname/dob
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (5, 'Anna', 'Nowak', TO_DATE('1988-03-25', 'YYYY-MM-DD'));
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (6, 'Peter', 'Jones', TO_DATE('1965-07-01', 'YYYY-MM-DD'));
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (7, 'Adam', 'Nowak', TO_DATE('1992-09-03', 'YYYY-MM-DD')); -- Another Adam
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (8, 'Catherine', 'Zeta', TO_DATE('1970-04-12', 'YYYY-MM-DD')); -- Name 'C'
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (9, 'Oliver', 'Twista', TO_DATE('1995-12-01', 'YYYY-MM-DD')); -- Surname 'a'
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (10, 'Sophia', 'Brown', TO_DATE('2000-01-01', 'YYYY-MM-DD')); -- Patient with 1 visit in 2012
INSERT INTO Patient (IdPatient, FirstName, LastName, DateOfBirth) VALUES (11, 'George', 'White', TO_DATE('1983-06-15', 'YYYY-MM-DD')); -- Patient for 1983 check


-- Insert Data: Appointment
-- For 'Cardiologist' specialization (IdSpecialization = 1)
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (1, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 150.00, 'Heart check-up', 1, 101);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (2, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 160.00, 'Follow-up', 2, 101);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (3, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 170.00, 'New patient consultation', 3, 105);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (4, TO_DATE('2023-02-05', 'YYYY-MM-DD'), 155.00, 'Routine check', 5, 105);

-- For 'Pediatrician' specialization (IdSpecialization = 2) - to test count < 5
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (5, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 120.00, 'Child check-up', 1, 102);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (6, TO_DATE('2023-03-05', 'YYYY-MM-DD'), 110.00, 'Vaccination', 4, 102);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (7, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 130.00, 'Consultation', 7, 102);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (8, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 100.00, 'Follow-up', 8, 102);

-- For 'Dermatologist' specialization (IdSpecialization = 3) - to test count >= 5
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (9, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 90.00, 'Skin check', 2, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (10, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 85.00, 'Acne treatment', 3, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (11, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 95.00, 'Rash diagnosis', 5, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (12, TO_DATE('2023-04-15', 'YYYY-MM-DD'), 100.00, 'Mole removal', 6, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (13, TO_DATE('2023-04-20', 'YYYY-MM-DD'), 110.00, 'Consultation', 7, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (14, TO_DATE('2023-04-25', 'YYYY-MM-DD'), 105.00, 'Follow-up', 8, 103);

-- For 'Dentist' specialization (IdSpecialization = 4) - to be excluded
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (15, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 200.00, 'Cleaning', 1, 104);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (16, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 300.00, 'Filling', 2, 104);

-- For Doctor without specialization (IdDoctor = 108)
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (17, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 80.00, 'General check', 3, 108);

-- Appointments for specific year checks (1983, 2012, 2013)
-- Patient 11 had no appointment in 1983, but in other years
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (18, TO_DATE('1982-10-01', 'YYYY-MM-DD'), 50.00, 'Old visit', 11, 101);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (19, TO_DATE('1984-01-01', 'YYYY-MM-DD'), 55.00, 'Old visit', 11, 101);

-- Appointments for 2012 (Patient 10 has 1 visit < 20, Patient 1 has multiple visits > 20)
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (20, TO_DATE('2012-01-05', 'YYYY-MM-DD'), 15.00, 'Low price visit', 10, 102); -- Patient 10, 1 visit, price < 20
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (21, TO_DATE('2012-02-10', 'YYYY-MM-DD'), 25.00, 'Visit in 2012', 1, 101); -- Patient 1, price > 20
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (22, TO_DATE('2012-03-15', 'YYYY-MM-DD'), 30.00, 'Visit in 2012', 1, 103); -- Patient 1, price > 20
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (23, TO_DATE('2012-04-20', 'YYYY-MM-DD'), 22.00, 'Visit in 2012', 2, 102); -- Patient 2, price > 20

-- Appointments for 2013 for total price by patient
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (24, TO_DATE('2013-01-01', 'YYYY-MM-DD'), 50.00, 'Visit 2013', 1, 101);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (25, TO_DATE('2013-01-05', 'YYYY-MM-DD'), 70.00, 'Visit 2013', 1, 101);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (26, TO_DATE('2013-02-10', 'YYYY-MM-DD'), 45.00, 'Visit 2013', 2, 102);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (27, TO_DATE('2013-03-15', 'YYYY-MM-DD'), 80.00, 'Visit 2013', 3, 103);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (28, TO_DATE('2013-04-20', 'YYYY-MM-DD'), 60.00, 'Visit 2013', 4, 104);
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (29, TO_DATE('2013-05-25', 'YYYY-MM-DD'), 90.00, 'Visit 2013', 4, 104); -- Another visit for Patient 4


-- Appointments for 2012 for TotalPrice by Specialization
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (30, TO_DATE('2012-01-10', 'YYYY-MM-DD'), 100.00, 'Cardiology 2012', 1, 101); -- Cardiologist
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (31, TO_DATE('2012-02-15', 'YYYY-MM-DD'), 120.00, 'Pediatric 2012', 2, 102); -- Pediatrician
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (32, TO_DATE('2012-03-20', 'YYYY-MM-DD'), 90.00, 'Dermatology 2012', 3, 103); -- Dermatologist
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (33, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 150.00, 'Cardiology 2012', 4, 105); -- Cardiologist
INSERT INTO Appointment (IdAppointment, AppointmentDate, Price, Description, Patient_IdPatient, Doctor_IdDoctor) VALUES (34, TO_DATE('2012-05-30', 'YYYY-MM-DD'), 70.00, 'General 2012', 5, 108); -- No specialization

-- 1. Find patients with duplicate names and surnames. (Headings: "Name", "Surname", "NumberOfRepetitions".)
select FirstName as "Name", LASTNAME as "Surname", count(*) as "NumberOfRepetitions"
from Patient
GROUP BY FirstName, LASTNAME
having count(*)  > 1;
-- 2. Write down information about the number of visits and the average cost of visits to doctors for each specialization.
--    List the name of the specialization. Do not take into account dentists and those specializations for which the number of visits was less than 5.
--    Skip the group of doctors without specialization. (Headings: "Specialization", "NumberOfVisits", "AveragePrice".)
select s.Name as "Specialization", count(*) as "NumberOfVisits", round(avg(a.Price),2) as "AveragePrice" from Specialization s
join Doctor D on s.IdSpecialization = D.IdSpecialization
join Appointment a on D.IdDoctor = a.Doctor_IdDoctor
where s.NAME != 'Dentist'
group by s.Name
having count(*) > 5;
-- 3. For each specialization, find the doctor who had the most visits.
--    Skip doctors without specializations and specializations without doctors.
--    (Headings: "Specialization", "NumberOfVisits", "DoctorName", "DoctorSurname".)
with GroupedVisits as(
        select s.Name, d.IdDoctor, count(*) as Count
        from Appointment
            join Doctor d on d.IdDoctor = Appointment.Doctor_IdDoctor
            join Specialization S on d.IdSpecialization = S.IdSpecialization
        group by s.Name, d.IdDoctor)
select  gv.Name AS "Specialization", gv.Count, d.FirstName AS "DoctorName", d.LastName AS "DoctorSurname"
from GroupedVisits gv
        join Doctor d on d.IdDoctor = gv.IdDoctor
where (gv.Name, gv.Count) in (select Name, max(Count) as MaxCount
                              from GroupedVisits
                              group by Name);
-- 4. Find a patient who had no appointment for a visit in 1983 (but may have had in other years).
--    (Headings: "PatientName", "PatientSurname".)
select distinct p.FirstName as "PatientName", p.LastName as "PatientSurname"
from Patient p
where not exists(select 1 from Appointment where Patient_IdPatient = p.IdPatient and To_Char(AppointmentDate, 'YYYY') = 1983)
and
   exists(select 1 from Appointment where Patient_IdPatient = p.IdPatient and To_Char(AppointmentDate, 'YYYY') != 1983);
-- 5. List how many visits each patient had in 2012, giving their name and surname.
--    Do not consider visits priced less than $ 20 and patients who have only had 1 visit.
--    (Headings: "PatientName", "PatientSurname", "NumberOfVisits".)
select p.FirstName as "PatientName", p.LastName as "PatientSurname", count(*)
from Patient p
join Appointment A2 on p.IdPatient = A2.Patient_IdPatient
where To_char(a2.APPOINTMENTDATE, 'YYYY') = 2012 and a2.Price > 20
group by p.IdPatient, p.FirstName, p.LastName
having count(*) > 1;
select p.FirstName as "PatientName", p.LastName as "PatientSurname", p.IdPatient
from Patient p
group by p.IdPatient, p.FirstName, p.LastName;
-- 6. Find the sum of fees for visits to doctors for each specialization in 2012.
--    List the name of the specialization. For doctors without specialization, replace the name of the specialization with 'None'
--    (at the query level, do not modify the data in the table). (Headings: "Specialization", "TotalPrice".)
select nvl(s.Name, 'None') as Specialization, sum(a.Price) as TotalPrice
from Appointment a
join Doctor d on a.Doctor_IdDoctor = d.IdDoctor
left join Specialization s on d.IdSpecialization = s.IdSpecialization
where To_Char(a.APPOINTMENTDATE, 'YYYY') = 2012
group by s.Name;
-- 7. List the details of visits to all doctors having specialization "Cardiologist".
--    The result should be: doctor's name, doctor's surname, date of visit, price.
--    Sort results in descending order by date.
--    (Headings: "DoctorName", "DoctorSurname", "DateOfVisit", "Price".)
select d.FirstName, d.LastName, a.AppointmentDate, a.Price
from Doctor d
join Appointment a on d.IdDoctor = a.Doctor_IdDoctor
join Specialization S on d.IdSpecialization = S.IdSpecialization
where s.Name = 'Cardiologist'
order by a.APPOINTMENTDATE DESC;
-- 8. List the name, surname and monthly salary (assuming the Salary includes annual earnings)
--    for doctors who have a specialization. (Headings: "DoctorName", "DoctorSurname", "Monthly Earnings".)
select d.FirstName, d.LastName, round(d.Salary/12,2)
from Doctor d
join Specialization S on d.IdSpecialization = S.IdSpecialization;
-- 9. Find for each patient the amount they paid for visits in 2013.
--    List the patient's name and surname. Consider the possibility of several patients with the same name and surname.
--    (Headings: "PatientName", "PatientSurname", "TotalPrice".)
select p.FirstName as "PatientName", p.LastName as "PatientSurname", sum(a.Price)
from Patient p
join Appointment a on p.IdPatient = a.Patient_IdPatient
where to_char(a.AppointmentDate, 'YYYY') = 2013
group by p.IDPATIENT, p.FirstName, p.LastName;
-- 10. List the names and surnames of patients whose first name begins with the letter 'C' or whose surname ends with the letter 'a'.
--     The result should be: Name and surname in one column (separated by a space), labeled with the heading "Patient"
select p.FirstName || ' ' || p.LastName as "Patient"
from Patient p
where p.FirstName like 'C%' or p.LastName like '%a';











-- Create Table: DEPT (Departments)
CREATE TABLE DEPT (
                      DEPTNO NUMBER(2) PRIMARY KEY,
                      DNAME VARCHAR2(14),
                      LOC VARCHAR2(13)
);

-- Create Table: SALGRADE (Salary Grades)
CREATE TABLE SALGRADE (
                          GRADE NUMBER PRIMARY KEY,
                          LOSAL NUMBER,
                          HISAL NUMBER
);

-- Create Table: EMP (Employees)
-- This table includes a self-referencing foreign key for the manager (MGR)
CREATE TABLE EMP (
                     EMPNO NUMBER(4) PRIMARY KEY,
                     ENAME VARCHAR2(10),
                     JOB VARCHAR2(9),
                     MGR NUMBER(4),
                     HIREDATE DATE,
                     SAL NUMBER(7,2),
                     COMM NUMBER(7,2),
                     DEPTNO NUMBER(2),
                     FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO),
                     FOREIGN KEY (MGR) REFERENCES EMP(EMPNO) -- Self-referencing foreign key
);

-- Insert Data: DEPT
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (40, 'OPERATIONS', 'BOSTON');

-- Insert Data: SALGRADE
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES (1, 700, 1200);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES (2, 1201, 1400);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES (3, 1401, 2000);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES (4, 2001, 3000);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES (5, 3001, 9999);

-- Insert Data: EMP (Order matters for MGR foreign key)
-- Managers first, then employees who report to them
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('1981-05-01', 'YYYY-MM-DD'), 2850, NULL, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('1981-06-09', 'YYYY-MM-DD'), 2450, NULL, 10);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('1981-04-02', 'YYYY-MM-DD'), 2975, NULL, 20);

-- Employees reporting to managers
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('1980-12-17', 'YYYY-MM-DD'), 800, NULL, 20);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('1981-02-20', 'YYYY-MM-DD'), 1600, 300, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('1981-02-22', 'YYYY-MM-DD'), 1250, 500, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('1987-04-19', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('1981-09-08', 'YYYY-MM-DD'), 1500, 0, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('1987-05-23', 'YYYY-MM-DD'), 1100, NULL, 20); -- ADAMS
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('1981-12-03', 'YYYY-MM-DD'), 950, NULL, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('1981-12-03', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7940, 'ADAMS_CLERK', 'CLERK', 7788, TO_DATE('1988-01-01', 'YYYY-MM-DD'), 1000, NULL, 20); -- Another CLERK after ADAMS
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7941, 'LOWEST_SAL', 'ANALYST', 7566, TO_DATE('1988-01-01', 'YYYY-MM-DD'), 2001, NULL, 20); -- Lowest salary for ANALYST in grade 4
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7942, 'LOWEST_SAL2', 'SALESMAN', 7698, TO_DATE('1988-01-01', 'YYYY-MM-DD'), 1250, NULL, 30); -- Lowest salary for SALESMAN in grade 2
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7943, 'NO_SUB', 'CLERK', 7782, TO_DATE('1988-01-01', 'YYYY-MM-DD'), 1200, NULL, 10); -- No subordinates


-- 1. Find all people working as CLERK and employed after ADAMS. Display results ordered by hiredates.
select Job, Ename from EMP
where Job = 'CLERK' and HIREDATE > (select HIREDATE from emp where ENAME = 'ADAMS')
order by HIREDATE;
-- 2. Find all jobs which appear both in department 10 and in department 20.
select Job from emp where deptno = 10
intersect
select Job from emp where deptno = 20;
-- 3. Find people who earn the lowest salary for their job and grade.
select e.Ename, e.Job, s.Grade from EMP e
join SALGRADE s on e.Sal between LOSAL and HISAL
where e.Sal = (select min(sal) from emp join SALGRADE s1 on Sal between LOSAL and HISAL where job = e.job and s1.grade = s.grade);
-- 4. How many people earn less than the maximal salary for the department located in NEW YORK.
select count(*) from EMP
where sal < (select max(sal) from emp join dept on EMP.DEPTNO = dept.DEPTNO where loc = 'NEW YORK');
-- 5. For each manager find the number of his subordinate. Display name of the manager and the number of people working under his supervision.
select m.ename, count(e.empno) from emp e
join emp m on m.empno = e.MGR
group by m.ename;
-- 6. Find all employees (personal number,name,profession and salary), who earn less than the average salary for people with salaries in the third grade. Display results order by salaries ascending.
select empno, ename, job, sal from EMP
where sal < (select avg(sal) from emp join SALGRADE on sal between LOSAL and hisal where grade = 3)
order by sal;
-- 7. For each job in each grade find the average yearly incomes. Order results by jobs.
select grade, job, avg(sal*12-nvl(comm,2)) from emp
join SALGRADE on sal between LOSAL and hisal
group by grade, job;
-- 8. Display names, jobs and hiredates for all employees working in DALLAS. Order results by names.
select ename, job, HIREDATE from emp
join dept d on d.deptno = emp.DEPTNO
where loc = 'DALLAS'
order by ename;
-- 9. Show all values of salaries from the 3-rd grade earned by people from Dallas (don't repeat the same values).
select distinct sal from EMP
join dept d on d.deptno = emp.DEPTNO
join SALGRADE on sal between LOSAL and hisal
where grade = 3 and d.loc = 'DALLAS';
-- 10. Find the number of people who don't supervise the others.
select count(e.empno) from EMP e
where e.empno not in (select distinct mgr from emp where mgr is not null)
-- where ename in (select emp.ename from emp left join emp m on m.empno = emp.MGR minus select m.ename from emp left join emp m on m.empno = emp.MGR)










alter session set nls_date_format = 'DD-MM-YYYY';

-- tables
-- Table: T_Category
CREATE TABLE T_Category (
                            Id integer  NOT NULL,
                            Name varchar2(50)  NOT NULL,
                            CONSTRAINT T_Category_pk PRIMARY KEY (Id)
) ;

-- Table: T_Employee
CREATE TABLE T_Employee (
                            Id integer  NOT NULL,
                            Salary number(8,2)  NOT NULL,
                            Boss integer  NULL,
                            CONSTRAINT T_Employee_pk PRIMARY KEY (Id)
) ;

-- Table: T_Job
CREATE TABLE T_Job (
                       Id integer  NOT NULL,
                       Name varchar2(40)  NOT NULL,
                       CONSTRAINT T_Job_pk PRIMARY KEY (Id)
) ;

-- Table: T_JobHistory
CREATE TABLE T_JobHistory (
                              Job integer  NOT NULL,
                              Employee integer  NOT NULL,
                              "From" date  NOT NULL,
                              "To" date  NULL,
                              CONSTRAINT T_JobHistory_pk PRIMARY KEY (Job,Employee,"From")
) ;

-- Table: T_Person
CREATE TABLE T_Person (
                          Id integer  NOT NULL,
                          Name varchar2(50)  NOT NULL,
                          Surname varchar2(50)  NOT NULL,
                          CONSTRAINT T_Person_pk PRIMARY KEY (Id)
) ;

-- Table: T_Product
CREATE TABLE T_Product (
                           Id integer  NOT NULL,
                           Name varchar2(50)  NOT NULL,
                           Price number(8,2)  NOT NULL,
                           Category integer  NOT NULL,
                           CONSTRAINT T_Product_pk PRIMARY KEY (Id)
) ;

-- Table: T_ProductList
CREATE TABLE T_ProductList (
                               Purchase integer  NOT NULL,
                               Product integer  NOT NULL,
                               Quantity integer  NOT NULL,
                               CONSTRAINT T_ProductList_pk PRIMARY KEY (Purchase,Product)
) ;

-- Table: T_Purchase
CREATE TABLE T_Purchase (
                            Id integer  NOT NULL,
                            "Date" date  NOT NULL,
                            Customer integer  NOT NULL,
                            CONSTRAINT T_Purchase_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: Employee_Employee (table: T_Employee)
ALTER TABLE T_Employee ADD CONSTRAINT Employee_Employee
    FOREIGN KEY (Boss)
        REFERENCES T_Employee (Id);

-- Reference: Employee_Person (table: T_Employee)
ALTER TABLE T_Employee ADD CONSTRAINT Employee_Person
    FOREIGN KEY (Id)
        REFERENCES T_Person (Id);

-- Reference: List_of_products_Product (table: T_ProductList)
ALTER TABLE T_ProductList ADD CONSTRAINT List_of_products_Product
    FOREIGN KEY (Product)
        REFERENCES T_Product (Id);

-- Reference: List_of_products_Purchase (table: T_ProductList)
ALTER TABLE T_ProductList ADD CONSTRAINT List_of_products_Purchase
    FOREIGN KEY (Purchase)
        REFERENCES T_Purchase (Id);

-- Reference: Product_Category (table: T_Product)
ALTER TABLE T_Product ADD CONSTRAINT Product_Category
    FOREIGN KEY (Category)
        REFERENCES T_Category (Id);

-- Reference: Purchase_Person (table: T_Purchase)
ALTER TABLE T_Purchase ADD CONSTRAINT Purchase_Person
    FOREIGN KEY (Customer)
        REFERENCES T_Person (Id);

-- Reference: T_JobHistory_T_Employee (table: T_JobHistory)
ALTER TABLE T_JobHistory ADD CONSTRAINT T_JobHistory_T_Employee
    FOREIGN KEY (Employee)
        REFERENCES T_Employee (Id);

-- Reference: T_JobHistory_T_Job (table: T_JobHistory)
ALTER TABLE T_JobHistory ADD CONSTRAINT T_JobHistory_T_Job
    FOREIGN KEY (Job)
        REFERENCES T_Job (Id);

--Person values
INSERT ALL
    INTO T_PERSON (ID, Name, Surname) VALUES (1, 'Ben', 'Cimon')
INTO T_PERSON (ID, Name, Surname) VALUES (2, 'Nick', 'Nicias')
INTO T_PERSON (ID, Name, Surname) VALUES (3, 'Peter', 'Paches')
INTO T_PERSON (ID, Name, Surname) VALUES (4, 'Philip', 'Phormio')
INTO T_PERSON (ID, Name, Surname) VALUES (5, 'Chris', 'Cnemus')
INTO T_PERSON (ID, Name, Surname) VALUES (6, 'Eric', 'Eurymedon')
SELECT 1 FROM dual;

--Employee values
INSERT ALL
    INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (1, 9888.65, null)
INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (3, 3225.34, 1)
INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (4, 2775.75, 1)
INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (6, 4566.91, 1)
SELECT 1 FROM dual;

--Job values
INSERT ALL
    INTO T_JOB (Id, Name) VALUES (1, 'manager')
INTO T_JOB (Id, Name) VALUES (2, 'cashier')
INTO T_JOB (Id, Name) VALUES (3, 'janitor')
SELECT 1 FROM dual;

--JobHistory values
INSERT ALL
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 1, '11-12-2018', '01-04-2020')
INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (1, 1, '01-04-2020', null)
INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 3, '04-04-2022', null)
INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (3, 4, '13-09-2021', null)
INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 6, '01-04-2020', '04-04-2022')
SELECT 1 FROM dual;

--Category values
INSERT ALL
    INTO T_Category (Id, Name) VALUES (1, 'fish')
INTO T_Category (Id, Name) VALUES (2, 'vegetable')
INTO T_Category (Id, Name) VALUES (3, 'fruit')
SELECT 1 FROM dual;

--Product values
INSERT ALL
    INTO T_Product (Id, Name, Price, Category) VALUES(1, 'cod', 2.20, 1)
INTO T_Product (Id, Name, Price, Category) VALUES(2, 'herring', 2.75, 1)
INTO T_Product (Id, Name, Price, Category) VALUES(3, 'garlic', 0.99, 2)
INTO T_Product (Id, Name, Price, Category) VALUES(4, 'potato', 0.15, 2)
INTO T_Product (Id, Name, Price, Category) VALUES(5, 'kiwi', 1.15, 3)
INTO T_Product (Id, Name, Price, Category) VALUES(6, 'mango', 0.99, 3)
SELECT 1 FROM dual;

--Purchase values
INSERT ALL
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (1, '04-05-2020', 5)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (2, '14-09-2021', 5)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (3, '19-11-2021', 5)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (4, '11-01-2020', 1)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (5, '09-12-2020', 1)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (6, '11-12-2019', 1)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (7, '07-03-2018', 1)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (8, '01-05-2020', 4)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (9, '17-11-2020', 4)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (10, '23-12-2021', 3)
INTO T_PURCHASE (Id, "Date", Customer) VALUES (11, '13-08-2022', 3)
SELECT 1 FROM dual;

--ProductList values
INSERT ALL
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (1, 1, 3)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (2, 4, 15)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (2, 1, 4)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (3, 5, 2)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (3, 1, 12)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 3, 5)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 1, 3)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 2, 11)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 2, 13)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 5, 4)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 6, 13)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (6, 3, 12)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (6, 5, 3)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (7, 4, 2)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (7, 5, 13)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (8, 1, 11)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (8, 2, 3)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (9, 3, 13)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (9, 6, 5)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (10, 5, 14)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (10, 4, 100)
INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (11, 4, 57)
SELECT 1 FROM dual;

commit;

-- Task 1: Find everyone whose surname starts with neither 'C' nor 'P'.
-- Expected result: Name, Surname
select Name, Surname from T_Person
where Surname not like 'C%' and Surname not like 'P%';
-- Task 2: List all products alongside their quantity and category from the purchase with ID == 4. Sort it in descending order by quantity.
-- Expected result: Product Name, Quantity, Category Name
select Name, Quantity, Category from T_Product
join T_ProductList on Product = ID
where Purchase = 4
order by Quantity desc;
-- Task 3: List all currently employed employees, their current positions and the date from which they have been working in this position. Sort by date ascending.
-- Expected result: Employee Name, Employee Surname, Position Name, From Date
select p.Name, p.Surname, j.Name, jh."From" from T_Person p
join T_Employee e on e.id = p.id
join T_JobHistory jh on jh.EMPLOYEE = e.ID
join T_job j on j.id = jh.JOB
order by jh."From";
-- Task 4: List names of all employees currently employed (call the column "Employee") + surname of their boss (call the column "Boss").
-- If someone doesn't have a boss, then print "No boss" in the "Boss" column. Hint: use UNION.
-- Expected result: Employee, Boss
select p.Name || ' ' || p.Surname, nvl(pb.Surname, 'No boss') from T_Person p
join T_Employee e on e.id = p.ID
left join T_employee eb on eb.id = e.Boss
left join T_person pb on eb.id = pb.id;
-- Task 5: Find out how many receipts (T_Purchase) contain products from the 'fruit' category.
-- Enter name of a product + a number of receipts on which the product appears.
-- Expected result: Product Name, Number of Receipts
select p.Name, count(*) from T_Product p
join Category c on c.id = p.CATEGORY
group by p.Name;
-- Task 6: Find out how many purchases each customer made in 2020 and 2021.
-- Expected result: Customer Name, Customer Surname, Year, Number of Purchases

-- Task 7: List the names of customers who have purchased more than 20 fishes.
-- Expected result: Customer Name, Customer Surname

-- Task 8: List all products with their quantity and category that Peter Paches' boss has purchased (consider all his purchases). Sort by quantity ascending.
-- Expected result: Product Name, Quantity, Category Name

-- Task 9: List all products that Chris Cnemus has bought and how much he spent on each of these products (in all purchases).
-- Expected result: Product Name, Total Spent

-- Task 10: Find all customers who spent more than $50 in our store. Print a customer's name + the value of all his purchases.
-- Expected result: Customer Name, Total Purchase Value









-- Create Table: T_Dog
CREATE TABLE T_Dog (
                       IdDog NUMBER PRIMARY KEY,
                       Name VARCHAR2(50),
                       Breed VARCHAR2(50),
                       DateOfBirth DATE
);

-- Create Table: T_Instructor
CREATE TABLE T_Instructor (
                              IdInstructor NUMBER PRIMARY KEY,
                              Name VARCHAR2(100)
);

-- Create Table: T_Class
CREATE TABLE T_Class (
                         IdClass NUMBER PRIMARY KEY,
                         ClassDate DATE,
                         MaxSeats NUMBER(3),
                         Price NUMBER(7,2), -- Price of the class
                         InstructorId NUMBER,
                         FOREIGN KEY (InstructorId) REFERENCES T_Instructor(IdInstructor)
);

-- Create Table: T_Customer
CREATE TABLE T_Customer (
                            IdCustomer NUMBER PRIMARY KEY,
                            Name VARCHAR2(50),
                            Surname VARCHAR2(50)
);

-- Create Table: T_Ticket
-- This table represents a customer purchasing a ticket for a specific dog to a specific class.
CREATE TABLE T_Ticket (
                          IdTicket NUMBER PRIMARY KEY,
                          CustomerId NUMBER,
                          ClassId NUMBER,
                          DogId NUMBER,
                          PurchaseDate DATE,
                          FOREIGN KEY (CustomerId) REFERENCES T_Customer(IdCustomer),
                          FOREIGN KEY (ClassId) REFERENCES T_Class(IdClass),
                          FOREIGN KEY (DogId) REFERENCES T_Dog(IdDog)
);

-- Insert Data: T_Dog
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (1, 'Buddy', 'Golden Retriever', TO_DATE('2023-05-10', 'YYYY-MM-DD'));
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (2, 'Lucy', 'Labrador', TO_DATE('2023-01-20', 'YYYY-MM-DD'));
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (3, 'Max', 'German Shepherd', TO_DATE('2022-11-01', 'YYYY-MM-DD'));
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (4, 'Daisy', 'Poodle', TO_DATE('2024-02-15', 'YYYY-MM-DD')); -- Youngest dog born in 2024
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (5, 'Charlie', 'Beagle', TO_DATE('2024-01-05', 'YYYY-MM-DD')); -- Another 2024 dog
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (6, 'Bella', 'Bulldog', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (7, 'Rocky', 'Boxer', TO_DATE('2022-07-07', 'YYYY-MM-DD'));
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (8, 'Leo', 'Dachshund', TO_DATE('2021-09-12', 'YYYY-MM-DD')); -- Oldest dog for top 3
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (9, 'Milo', 'Corgi', TO_DATE('2021-03-25', 'YYYY-MM-DD')); -- 2nd oldest
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (10, 'Zoe', 'Shih Tzu', TO_DATE('2020-06-30', 'YYYY-MM-DD')); -- 3rd oldest
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (11, 'Sparky', 'Terrier', TO_DATE('2023-08-01', 'YYYY-MM-DD')); -- Dog not in any class
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (12, 'Fido', 'Pug', TO_DATE('2023-02-01', 'YYYY-MM-DD')); -- Dog with 5-letter name, for task 10
INSERT INTO T_Dog (IdDog, Name, Breed, DateOfBirth) VALUES (13, 'Bingo', 'Poodle', TO_DATE('2023-04-01', 'YYYY-MM-DD')); -- Dog with 5-letter name, for task 10

-- Insert Data: T_Instructor
INSERT INTO T_Instructor (IdInstructor, Name) VALUES (101, 'Alice Wonderland');
INSERT INTO T_Instructor (IdInstructor, Name) VALUES (102, 'Bob The Builder');
INSERT INTO T_Instructor (IdInstructor, Name) VALUES (103, 'Charlie Chaplin');

-- Insert Data: T_Class
-- Classes for various months and prices
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 10, 50.00, 101); -- June class
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (2, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 8, 45.00, 101); -- February class
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (3, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 12, 55.00, 102); -- June class
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (4, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 7, 60.00, 102); -- February class (most expensive for Bob)
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (5, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 15, 40.00, 103);
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (6, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 10, 65.00, 101); -- Most expensive for Alice
INSERT INTO T_Class (IdClass, ClassDate, MaxSeats, Price, InstructorId) VALUES (7, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 5, 70.00, 103); -- Most expensive for Charlie

-- Insert Data: T_Customer
INSERT INTO T_Customer (IdCustomer, Name, Surname) VALUES (1, 'Customer', 'One');
INSERT INTO T_Customer (IdCustomer, Name, Surname) VALUES (2, 'Customer', 'Two');
INSERT INTO T_Customer (IdCustomer, Name, Surname) VALUES (3, 'Customer', 'Three');
INSERT INTO T_Customer (IdCustomer, Name, Surname) VALUES (4, 'Customer', 'Four'); -- Customer for most tickets

-- Insert Data: T_Ticket
-- For Task 1 (Dog participation dates)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (1, 1, 1, 1, TO_DATE('2024-05-20', 'YYYY-MM-DD')); -- Buddy in Class 1
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (2, 1, 2, 1, TO_DATE('2024-01-30', 'YYYY-MM-DD')); -- Buddy in Class 2
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (3, 2, 1, 2, TO_DATE('2024-05-25', 'YYYY-MM-DD')); -- Lucy in Class 1
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (4, 3, 3, 3, TO_DATE('2024-06-01', 'YYYY-MM-DD')); -- Max in Class 3

-- For Task 7 (Max Seats check)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (5, 1, 1, 6, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (6, 2, 1, 7, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (7, 3, 1, 8, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (8, 4, 1, 9, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (9, 1, 1, 10, TO_DATE('2024-05-20', 'YYYY-MM-DD')); -- Class 1 has 10 seats, 6 tickets so far
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (10, 2, 1, 2, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (11, 3, 1, 3, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (12, 4, 1, 4, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (13, 1, 1, 5, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (14, 2, 1, 6, TO_DATE('2024-05-20', 'YYYY-MM-DD'));

-- For Task 8 (Dogs in June and Feb classes)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (15, 1, 1, 7, TO_DATE('2024-05-20', 'YYYY-MM-DD')); -- Rocky in June class
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (16, 1, 2, 7, TO_DATE('2024-01-30', 'YYYY-MM-DD')); -- Rocky in Feb class

-- For Task 9 (Customer with most tickets) - Customer Four (Id:4)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (17, 4, 1, 1, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (18, 4, 2, 2, TO_DATE('2024-01-30', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (19, 4, 3, 3, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (20, 4, 4, 4, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (21, 4, 5, 5, TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (22, 4, 6, 6, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (23, 4, 7, 7, TO_DATE('2024-04-01', 'YYYY-MM-DD'));

-- For Task 10 (Dog participation count, 5-letter names)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (24, 1, 1, 12, TO_DATE('2024-05-20', 'YYYY-MM-DD')); -- Fido (1 class)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (25, 1, 2, 13, TO_DATE('2024-01-30', 'YYYY-MM-DD')); -- Bingo (1 class)
INSERT INTO T_Ticket (IdTicket, CustomerId, ClassId, DogId, PurchaseDate) VALUES (26, 1, 3, 13, TO_DATE('2024-06-01', 'YYYY-MM-DD')); -- Bingo (2 classes)


-- 1. For each dog, write down its name, the name of the breed, and all the dates of the classes in which it participated.

-- 2. Show dogs that have not participated in any classes. List their name and breed name.

-- 3. For each instructor, display the date and maximum number of seats for their most expensive class.
SELECT
    i.Name AS InstructorName,
    c.ClassDate,
    c.MaxSeats
FROM
    T_Instructor i
        JOIN
    T_Class c ON i.IdInstructor = c.InstructorId
WHERE c.Price in (
        SELECT
            MAX(Price)
        FROM
            T_Class
        GROUP BY
            InstructorId
    );
-- 4. Show all dogs that are older than the youngest dog born in 2024. Sort them by name in ascending order.

-- 5. In one column, display the name and breed name of the dog. In the other column, display how old each dog is (in years). Call the second column 'Age'.
SELECT
    d.Name || ' (' || d.Breed || ')' AS "Dog Info",
    round(months_between(SYSDATE, d.DateOfBirth) / 12, 2) AS "Age"
FROM
    T_Dog d;
-- 6. Without using the ORDER BY instruction, show the top 3 oldest dogs.
SELECT
    Name,
    Breed,
    DateOfBirth
FROM (
         SELECT
             Name,
             Breed,
             DateOfBirth
         FROM
             T_Dog
     )
fetch first 3 rows only;
-- 7. Make sure that the number of purchased tickets does not exceed the maximum seats for each class.
SELECT
    c.IdClass,
    c.ClassDate,
    c.MaxSeats,
    COUNT(t.IdTicket) AS PurchasedTickets
FROM
    T_Class c
        join
    T_Ticket t ON c.IdClass = t.ClassId
GROUP BY
    c.IdClass, c.ClassDate, c.MaxSeats
HAVING
    COUNT(t.IdTicket) > c.MaxSeats;
-- 8. Show dogs that participated in the classes held both in June and in February.
SELECT
    d.Name AS DogName,
    d.Breed
FROM
    T_Dog d
WHERE
    EXISTS (
        SELECT 1
        FROM T_Ticket t
                 JOIN T_Class c ON t.ClassId = c.IdClass
        WHERE t.DogId = d.IdDog
          AND TO_CHAR(c.ClassDate, 'MM') = '06' -- June
    )
  AND EXISTS (
    SELECT 1
    FROM T_Ticket t
             JOIN T_Class c ON t.ClassId = c.IdClass
    WHERE t.DogId = d.IdDog
      AND TO_CHAR(c.ClassDate, 'MM') = '02' -- February
);
-- 9. Show the name of the customer who collectively bought the most tickets for the class (can be more than 1).

-- 10. For each dog, show how many classes it has participated in. Exclude those dogs whose name has 5 letters and have participated in less than 2 classes.
