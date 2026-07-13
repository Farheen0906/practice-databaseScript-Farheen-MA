-- Start Transaction
START TRANSACTION;

-- Create Database
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

-- Drop Tables (child first because of foreign keys)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Instructor VARCHAR(100)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Students
INSERT INTO Students (FirstName, LastName, Email)
VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Michael', 'Brown', 'michael@example.com');

-- Insert Courses
INSERT INTO Courses (CourseName, Instructor)
VALUES
('Database Systems', 'Dr. Wilson'),
('Web Development', 'Prof. Davis'),
('Programming Fundamentals', 'Dr. Lee');

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2026-01-10'),
(1, 2, '2026-01-12'),
(2, 3, '2026-01-15'),
(3, 1, '2026-01-18');

-- Commit Transaction
COMMIT;

-- Test Queries
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;