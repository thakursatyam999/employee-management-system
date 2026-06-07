create database employee_management_system;
USE employee_management_system;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,

    username VARCHAR(50) UNIQUE NOT NULL,

    password VARCHAR(100) NOT NULL,

    role VARCHAR(20) NOT NULL
);

INSERT INTO users(username,password,role)
VALUES
('admin','admin123','admin'),

('rahul','rahul123','employee'),

('rohan','rohan123','employee'),

('anjali','anjali123','employee'),

('pooja','pooja123','employee');

SELECT * FROM users;

CREATE TABLE employees(

    emp_id INT PRIMARY KEY AUTO_INCREMENT,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    department VARCHAR(100),

    salary DOUBLE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees
(name,email,department,salary)

VALUES

('Rahul',
'rahul@gmail.com',
'HR',
45000),

('Rohan',
'rohan@gmail.com',
'IT',
60000),

('Anjali',
'anjali@gmail.com',
'Finance',
55000),

('Pooja',
'pooja@gmail.com',
'Marketing',
60000);

select * from employees;

SELECT username,
       LENGTH(username),
       password,
       LENGTH(password)
FROM users;

select database();

desc users;

INSERT INTO employees
(name,email,department,salary)

VALUES

('Krishi','krishi@gmail.com','Finance',30000),
('Ashfaq','ashfaq@gmail.com','IT',40000),
('Rukhsar','rukhsar@gmail.com','Finance',60000),
('Yash','yash@gmail.com','Marketing',20000),
('Nandini','nandini@gmail.com','Management',40000),
('Saeeda','saeeda@gmail.com','Management',10000);


INSERT INTO employees
(name,email,department,salary)

VALUES

('Srikant','srikant@gmail.com','IT','70000'),
('JK','jk@gmail.com','IT','60000'),
('Pasha','pasha@gmail.com','Marketing','650000'),
('Suchi','suchi@gmail.com','IT','40000'),
('Milind','milind@gmail.com','Management','80000'),
('Zoya','zoya@gmail.com','IT','40000'),
('Dhriti','dhriti@gmail.com','HR','85000'),
('Atharva','atharva@gmail.com','HR','80000'),
('Chellam','chellan@gmail.com','IT','100000'),
('Bhaskaran','bhaskaran@gmail.com','Marketing','25000');



