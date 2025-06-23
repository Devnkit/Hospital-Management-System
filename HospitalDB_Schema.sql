-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Step 2: Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Step 3: Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Step 4: Create Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Gender CHAR(1),
    DOB DATE,
    ContactNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- Step 5: Create Rooms Table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10),
    RoomType VARCHAR(50), -- ICU, General, Private, etc.
    IsAvailable BOOLEAN
);

-- Step 6: Create Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Step 7: Create Admissions Table
CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    RoomID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
-- Insert Sample Departments
INSERT INTO Departments (DepartmentName) VALUES ('Cardiology'), ('Orthopedics'), ('Neurology');

-- Insert Sample Doctor
INSERT INTO Doctors (Name, Email, Phone, DepartmentID)
VALUES ('Dr. Anita Mehra', 'anita.mehra@hospital.com', '9876543210', 1);

-- Insert Sample Patient
INSERT INTO Patients (Name, Gender, DOB, ContactNumber, Address)
VALUES ('Ravi Sharma', 'M', '1985-06-15', '9988776655', 'Gomti Nagar, Lucknow');

-- Insert Sample Room
INSERT INTO Rooms (RoomNumber, RoomType, IsAvailable)
VALUES ('101', 'General', TRUE);
