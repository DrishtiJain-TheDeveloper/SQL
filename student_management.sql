CREATE DATABASE StudentManagementSystem;

USE StudentManagementSystem;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Rahul Sharma', 20, 'Male', 'Delhi'),
(2, 'Sneha Verma', 21, 'Female', 'Mumbai'),
(3, 'Aman Gupta', 22, 'Male', 'Jaipur');

INSERT INTO Courses VALUES
(101, 'Java Programming', 6),
(102, 'Database Management', 4),
(103, 'Web Development', 5);

INSERT INTO Enrollments VALUES
(1, 1, 101, 88),
(2, 2, 102, 92),
(3, 3, 103, 85);

SELECT * FROM Students;

SELECT student_name, city
FROM Students
WHERE age > 20;

SELECT s.student_name, c.course_name, e.marks
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON c.course_id = e.course_id;

SELECT AVG(marks) AS Average_Marks
FROM Enrollments;

UPDATE Students
SET city = 'Pune'
WHERE student_id = 2;

DELETE FROM Enrollments
WHERE enrollment_id = 3;
