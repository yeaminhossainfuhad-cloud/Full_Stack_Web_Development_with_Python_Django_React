-- Active: 1777352198323@@127.0.0.1@3306@xyz
SHOW DATABASES;

CREATE DATABASE xyz;

SHOW TABLES;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE employees(
    id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    salary INT,
    hire_date DATE,
    department_id INT,
    Foreign Key (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, name, location) VALUES
(1,'Engineering','Dhaka'),
(2, 'Marketing','Chittagong'),
(3, 'HR','Dhaka'),
(4,'Finance','Sylhet'),
(5,'Design','Dhaka'),
(6,'Legal','Khulna');

SELECT * FROM departments;

INSERT INTO employees (id, full_name, email, salary, hire_date, department_id) VALUES
(1, 'Rahim Uddin', 'rahim@example.com', 30000, '2022-01-15', 1),
(2, 'Karim Hasan', 'karim@example.com', 35000, '2021-06-20', 2),
(3, 'Ayesha Akter', 'ayesha@example.com', 40000, '2020-03-10', 1),
(4, 'Nusrat Jahan', 'nusrat@example.com', 32000, '2023-02-05', 3),
(5, 'Sabbir Ahmed', 'sabbir@example.com', 45000, '2019-11-25', 2),
(6, 'Farhan Khan', 'farhan@example.com', 38000, '2021-09-12', 4),
(7, 'Mim Rahman', 'mim@example.com', 31000, '2022-07-18', 3),
(8, 'Tanvir Hossain', 'tanvir@example.com', 50000, '2018-05-30', 5),
(9, 'Jannat Islam', 'jannat@example.com', 36000, '2020-12-22', 4),
(10, 'Rifat Chowdhury', 'rifat@example.com', 42000, '2019-08-14', 2);

INSERT INTO employees (id, full_name, email, salary, hire_date, department_id) VALUES
(11, 'Anower', NULL, 50000, '2018-09-20',1);

SELECT * FROM employees;

SELECT * FROM employees
ORDER BY salary ASC
;

SELECT * FROM employees
ORDER BY salary DESC
;

SELECT * FROM employees 
ORDER BY 
    department_id ASC,
    hire_date DESC
;

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3
;

SELECT * FROM employees
WHERE full_name LIKE 'R%'
ORDER BY full_name
;

