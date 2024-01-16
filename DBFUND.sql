--Creating the Dataase to be used
CREATE database DBFUNDFinalProject; 

--CREATING THE TABLES
-- Advisors Table
CREATE TABLE Advisors (
    advisor_id INT PRIMARY KEY,
    full_name NVARCHAR(100),
    position NVARCHAR(50),
    dept_name NVARCHAR(50),
    phone_number NVARCHAR(15),
    office_loc NVARCHAR(50)
);


-- Students Table
CREATE TABLE Students (
    id# INT PRIMARY KEY,
    name NVARCHAR(100),
    address NVARCHAR(255),
    dob DATE,
    sex NVARCHAR(10),
    category NVARCHAR(20),
    nationality NVARCHAR(50),
    special_needs NVARCHAR(100),
    current_status NVARCHAR(20),
    comments NVARCHAR(MAX),
    advisor_id INT FOREIGN KEY REFERENCES Advisors(advisor_id)
);


-- Halls of Residence Table
CREATE TABLE Halls_of_Residence (
    hall_id INT PRIMARY KEY,
    name NVARCHAR(50),
    address NVARCHAR(255),
    telephone_number NVARCHAR(15),
    manager NVARCHAR(100)
);


-- Student Flats Table
CREATE TABLE Student_Flats (
    flat_id INT PRIMARY KEY,
    flat_number NVARCHAR(10),
    address NVARCHAR(255),
    rooms_available INT
);

-- Leases Table
CREATE TABLE Leases (
    lease_number INT PRIMARY KEY,
    duration INT,
    student_id INT FOREIGN KEY REFERENCES Students(id#),
    place_number INT,
    flat_id INT,
    address_details NVARCHAR(255),
    entry_date DATE,
    exit_date DATE
);

-- Invoices Table
CREATE TABLE Invoices (
    invoice_number INT PRIMARY KEY,
    lease_number INT FOREIGN KEY REFERENCES Leases(lease_number),
    quarter NVARCHAR(20),
    payment_due DECIMAL(10, 2),
    student_name NVARCHAR(100),
    student_id INT,
    place_number INT,
    address NVARCHAR(255)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    invoice_number INT FOREIGN KEY REFERENCES Invoices(invoice_number),
    date_of_payment DATE,
    method_of_payment NVARCHAR(20),
    first_reminder_date DATE,
    second_reminder_date DATE
);

-- Student Flat Inspections Table
CREATE TABLE Student_Flat_Inspections (
    inspection_id INT PRIMARY KEY,
    flat_id INT FOREIGN KEY REFERENCES Student_Flats(flat_id),
    staff_name NVARCHAR(100),
    inspection_date DATE,
    satisfactory_condition NVARCHAR(3),
    additional_comments NVARCHAR(MAX)
);

-- Accommodation Staff Table
CREATE TABLE Accommodation_Staff (
    staff_id INT PRIMARY KEY,
    full_name NVARCHAR(100),
    home_address NVARCHAR(255),
    dob DATE,
    sex NVARCHAR(10),
    position NVARCHAR(50),
    location NVARCHAR(50)
);

-- Courses Table
CREATE TABLE Courses (
    course_number NVARCHAR(20) PRIMARY KEY,
    course_title NVARCHAR(100),
    year INT,
    instructor NVARCHAR(100),
    room_number NVARCHAR(20),
    dept_name NVARCHAR(50)
);

-- Contacts Table
CREATE TABLE Contacts (
    SIN NVARCHAR(15) PRIMARY KEY,
    full_name NVARCHAR(100),
    relationship NVARCHAR(50),
    address NVARCHAR(255),
    contact_phone_number NVARCHAR(15)
);


--INSERTING SAMPLE RECORDS
-- Insert Sample Records into Advisors Table
INSERT INTO Advisors VALUES (2002, 'Dr. Mary Johnson', 'Academic Advisor', 'Computer Science', '555-1234', 'CS Building, Room 101');


-- Insert Sample Records into Students Table
INSERT INTO Students VALUES (1004, 'Steve Doe', '123 Main St, Cityville, A1B 2C3', '1995-05-15', 'Male', 'Sophomore', 'Canadian', NULL, 'Placed', 'Excellent student', 2001);


-- Insert Sample Records into Leases Table
INSERT INTO Leases VALUES (5005, 7, 7009, 101, NULL, 'Maple Hall, 123 Main St, Cityville, A1B 2C3', '2023-09-01', '2024-06-30');


-- Insert Sample Records into Invoices Table
INSERT INTO Invoices VALUES (6012, 3401, 'Fall 2022', 1400, 'John Doe', 1001, 101, 'Maple Hall, 123 Main St, Cityville, A1B 2C3');


-- Insert Sample Records into Payments Table
INSERT INTO Payments VALUES (2, 3014, '2023-08-21', 'Credit Card (Visa)', '2023-09-20', '2023-10-05');


--INSERTING MORE SAMPLE RECORDS
-- Insert Sample Records into Students Table
INSERT INTO Students VALUES (1001, 'John Doe', '123 Main St, Cityville, A1B 2C3', '1995-05-15', 'Male', 'Sophomore', 'Canadian', NULL, 'Placed', 'Excellent student', 2001);
INSERT INTO Students VALUES (1002, 'Peter Kate', '242 Main St, Cityville, A2B 3C3', '1987-05-15', 'Male', 'Senior', 'Brazil', NULL, 'Placed', 'Excellent student', 2002);


-- Insert Sample Records into Advisors Table
INSERT INTO Advisors VALUES (2001, 'Dr. Alice Johnson', 'Academic Advisor', 'Computer Science', '555-1234', 'CS Building, Room 101');

-- Insert Sample Records into Halls_of_Residence Table
INSERT INTO Halls_of_Residence VALUES (3010, 'McCaleb Hall', '712 Pine St, Villagetown, M2N 3P4', '555-9846', 'Mr. James Brown');
INSERT INTO Halls_of_Residence VALUES (3012, 'Austines Hall', '989 Pine St, Villagetown, M2N 3Q4', '555-9856', 'Mr. Barack Brown');
INSERT INTO Halls_of_Residence VALUES (3013, 'Gerald Hall', '629 Pine St, Villagetown, M2N 3Z4', '555-9866', 'Mr. Paul Brown');

-- Insert Sample Records into Student_Flats Table
INSERT INTO Student_Flats VALUES (4001, 'F101', '111 Elm St, Cityville, A1B 2C3', 3);


-- Insert Sample Records into Leases Table
INSERT INTO Leases VALUES (5071, 3, 1001, 101, NULL, 'Maple Hall, 123 Main St, Cityville, A1B 2C3', '2023-09-01', '2024-06-30');

-- Insert Sample Records into Invoices Table
INSERT INTO Invoices VALUES (6012, 5092, 'Fall 2023', 1300, 'John Doe', 1002, 102, 'Maple Hall, 123 Main St, Cityville, A1B 2C3');
INSERT INTO Invoices VALUES (6013, 5093, 'Fall 2023', 1400, 'John Doe', 1003, 103, 'Maple Hall, 123 Main St, Cityville, A1B 2C3');
INSERT INTO Invoices VALUES (6014, 5094, 'Fall 2023', 1500, 'John Doe', 1004, 104, 'Maple Hall, 123 Main St, Cityville, A1B 2C3');
INSERT INTO Invoices VALUES (6015, 5095, 'Fall 2023', 1600, 'John Doe', 1005, 105, 'Maple Hall, 123 Main St, Cityville, A1B 2C3');

-- Insert Sample Records into Payments Table
INSERT INTO Payments VALUES (4, 6081, '2023-09-05', 'Credit Card (Visa)', '2023-09-20', '2023-10-05');

-- Insert Sample Records into Student_Flat_Inspections Table
INSERT INTO Student_Flat_Inspections VALUES (7014, 4017, 'Mr. Austine Brown', '2023-10-15', 'Yes', 'Clean and well-maintained');


-- Insert Sample Records into Accommodation_Staff Table
INSERT INTO Accommodation_Staff VALUES (8011, 'Ms. Emily Davis', '444 Pine St, Villagetown, M2N 3P4', '1980-03-12', 'Female', 'Hall Manager', 'Maple Hall');

-- Insert Sample Records into Courses Table
INSERT INTO Courses VALUES ('C102', 'Introduction to Computer Science', 2023, 'Prof. Jennifer Lee', 'CS101', 'Computer Science');

-- Insert Sample Records into Contacts Table
INSERT INTO Contacts VALUES ('123-456-789', 'Mr. Mark Johnson', 'Parent', '789 Elm St, Cityville, A1B 2C3', '555-1111');


--CREATING THE INDEXES
--Create the appropriate indexes on each table
CREATE INDEX idx_student_id ON Students (id#);
CREATE INDEX idx_student_name ON Students (name);
CREATE INDEX idx_student_status ON Students (current_status);

CREATE INDEX idx_advisor_id ON Advisors (advisor_id);
CREATE INDEX idx_advisor_name ON Advisors (full_name);
CREATE INDEX idx_advisor_dept ON Advisors (dept_name);

CREATE INDEX idx_hall_id ON Halls_of_Residence (hall_id);
CREATE INDEX idx_hall_name ON Halls_of_Residence (name);

CREATE INDEX idx_flat_id ON Student_Flats (flat_id);
CREATE INDEX idx_flat_number ON Student_Flats (flat_number);

CREATE INDEX idx_lease_number ON Leases (lease_number);
CREATE INDEX idx_lease_student_id ON Leases (student_id);

CREATE INDEX idx_invoice_number ON Invoices (invoice_number);
CREATE INDEX idx_invoice_student_id ON Invoices (student_id);

CREATE INDEX idx_payment_invoice_number ON Payments (invoice_number);

CREATE INDEX idx_inspection_id ON Student_Flat_Inspections (inspection_id);
CREATE INDEX idx_inspection_date ON Student_Flat_Inspections (inspection_date);


CREATE INDEX idx_staff_id ON Accommodation_Staff (staff_id);
CREATE INDEX idx_staff_name ON Accommodation_Staff (full_name);

CREATE INDEX idx_course_number ON Courses (course_number);
CREATE INDEX idx_course_title ON Courses (course_title);


CREATE INDEX idx_contact_sin ON Contacts (SIN);
CREATE INDEX idx_contact_name ON Contacts (full_name);


--CREATING QUERY REPORTS
--Database Queries to create 5 different reports
--i.Report 1: List of Students and their Advisors
SELECT
    s.id# AS student_id,
    s.name AS student_name,
    s.current_status,
    a.full_name AS advisor_name,
    a.dept_name AS advisor_department
FROM Students s
JOIN Advisors a ON s.advisor_id = a.advisor_id;

--ii.Report 2: Total Number of Students in Each Hall of Residence
SELECT * FROM Halls_of_Residence;
SELECT
    h.name AS hall_name,
    COUNT(s.id#) AS total_students
FROM Halls_of_Residence h
LEFT JOIN Leases l ON h.hall_id = l.hall_id
LEFT JOIN Students s ON l.student_id = s.id#
GROUP BY h.name;

--iii.Report 3: List of Overdue Invoices
SELECT
    i.invoice_number,
    i.quarter,
    i.payment_due,
    s.name AS student_name,
    l.entry_date,
    l.exit_date
FROM Invoices i
JOIN Leases l ON i.lease_number = l.lease_number
JOIN Students s ON l.student_id = s.id#
WHERE i.payment_due < GETDATE()
AND i.payment_due NOT IN (SELECT payment_due FROM Payments WHERE invoice_number = i.invoice_number);


--iv.Report 4: Average Room Occupancy in Student Flats
SELECT
    sf.flat_number,
    AVG(CASE WHEN l.exit_date >=  GETDATE() THEN 1 ELSE 0 END) AS average_occupancy
FROM Student_Flats sf
LEFT JOIN Leases l ON sf.flat_id = l.flat_id
GROUP BY sf.flat_number;


--v.Report 5: Staff Members in Each Hall with Contact Information
SELECT
    h.name AS hall_name,
    a.full_name AS staff_name,
    a.position,
    a.location,
    a.telephone_number
FROM Halls_of_Residence h
JOIN Accommodation_Staff a ON h.hall_id = a.hall_id;

--THE END OF PROJECT



