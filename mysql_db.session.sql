CREATE TABLE users (
    name varchar(100),
    username varchar(100),
    password varchar(100),
    DOB date,
    email varchar(100),
    phoneNumber varchar(25),
    address varchar(100)
);

INSERT INTO users
VALUES
('Peter Smith', 'pes71', 'irrelevant', '1999-07-25', 'psmith@gmail.com', '417-123-4567', '458 Oak St, Springfield, USA'),
('Alex McMoil', 'alm470', 'Ilovecats!', '2003-11-30', 'amcmoil3@outlook.com', '412-555-1180', '123 Elm St, Pittsburgh, USA'),
('Emily Johnson', 'emj133', 'StrongPass123', '1992-03-12', 'ejohnson@yahoo.com', '617-909-6512', '1491 Maple Ave, Boston, USA'),
('Luiz Santos', 'lfr39', 'messifan', '1985-09-01', 'luiz.santos@zoho.com', '305-963--0842', '345 Pine St, Miami, USA');

CREATE TABLE employees (
    name varchar(100),
    id varchar(100),
    address varchar(100),
    phoneNumber varchar(25),
    email varchar(100),
    SSN varchar(20),
    salary decimal(10, 2)
);

INSERT INTO employees
VALUES
('John Doe', 'JD123456', '789 Pine St, Oakville', '534-120-4439', 'john.doe@company.com', '123-45-6789', 65000.00),
('Priya Patel', 'PP789012', '456 Elm St, Maplewood', '216-754-8980', 'priya.patel@company.com', '987-65-4321', 87000.00),
('Mohammed Ali', 'MA654321', '321 Cedar St, Riverside', '317-009-2572', 'mohammed.ali@company.com', '654-32-1098', 100000.00);


-- SELECT * FROM users;
-- SELECT * FROM employees;