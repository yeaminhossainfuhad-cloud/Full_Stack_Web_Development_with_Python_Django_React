-- Active: 1777352198323@@127.0.0.1@3306@mycampus

SHOW TABLES;

DROP Table students;

CREATE Table students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(100),
    email VARCHAR(150) UNIQUE
);


CREATE Table courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department VARCHAR(100)
);


CREATE Table enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade DECIMAL(4,2),
    fee_paid DECIMAL(8,2),
    UNIQUE KEY uq_student_course(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

SELECT * FROM students;

INSERT INTO students(
    student_name, age, city, email
) VALUES
('Rahim Uddin', 21, 'Dhaka', 'rahim@example.com'),
('Nusrat Jahan', 22, 'Chittagong', 'nusrat@example.com'),
('Karim Hossain', 20, 'Sylhet', 'karim@example.com'),
('Tania Akter', 23, 'Dhaka', 'tania@example.com'),
('Sabbir Ahmed', 21, 'Rajshahi', 'sabbir@example.com'),
('Mitu Begum', 24, 'Dhaka', 'mitu@example.com'),
('Imran Khan', 19, 'Khulna', 'imran@example.com'),
('Puja Das', 22 ,'Chittagong', 'puja@example.com'); 


INSERT INTO courses (
course_name, credits, department
) VALUES
('Python Programming', 3, 'CSE'),
('Database Systems', 3, 'CSE'),
('Web Development', 4, 'CSE'),
('Digital Marketing', 2, 'BBA'),
('Data Science', 4, 'CSE'),
('Business English', 2, 'English');

SELECT * FROM courses;


INSERT INTO enrollments (student_id, course_id, grade, fee_paid) VALUES
(1, 1, 85.50, 5000.00),
(1, 2, 90.00, 5000.00),
(1, 3, 78.00, 6000.00),
(2, 1, 92.00, 5000.00),
(2, 3, 88.50, 6000.00),
(3, 2, 70.00, 5000.00),
(3, 4, 65.00, 4000.00),
(4, 1, 95.00, 5000.00),
(4, 5, 91.00, 7000.00),
(5, 3, 80.00, 6000.00),
(5, 6, 74.00, 4000.00),
(6, 2, 88.00, 5000.00),
(6, 5, 93.50, 7000.00),
(7, 4, 60.00, 4000.00),
(7, 6, 55.00, 4000.00),
(8, 1, 87.00, 5000.00),
(8, 3, 82.00, 6000.00);

SELECT * FROM enrollments;


SELECT department, course_name FROM courses;

SELECT * FROM students
WHERE age>20;

SELECT * FROM students
WHERE city = 'Dhaka';

SELECT * FROM students
WHERE city = 'Dhaka' AND age = 21;

SELECT COUNT(*) FROM students
WHERE city = 'Dhaka';

SELECT SUM(age) FROM students
WHERE city = 'Dhaka';

SELECT AVG(age) as average_age
FROM students
WHERE city = 'Dhaka';

SELECT
    student_name AS Name, 
    city AS Location
FROM students;

SELECT *
FROM students
WHERE age IN (21,22,23);

SELECT *
FROM students
WHERE age NOT IN (21,22,23);