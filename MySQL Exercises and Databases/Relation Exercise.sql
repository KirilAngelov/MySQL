CREATE DATABASE exercise_31_10_2018;
CREATE TABLE persons(
person_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
Salary DECIMAL(7,2) NOT NULL,
passport_id INT NOT NULL UNIQUE
);

CREATE TABLE passports(
passport_id INT PRIMARY KEY AUTO_INCREMENT,
passport_number CHAR(8) NOT NULL
);

ALTER TABLE passports
AUTO_INCREMENT=100;
SELECT * FROM passports;
SHOW COLUMNS FROM passports;
ALTER TABLE persons
ADD CONSTRAINT fk_persons_passport_id
FOREIGN KEY(passport_id)
REFERENCES passports(passport_id);

show columns from persons;


CREATE TABLE manufacturers(
manufacturer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(10) NOT NULL,
established_on DATE NOT NULL
);

CREATE TABLE models(
model_id INT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
manufacturer_id INT NOT NULL
);
DROP TABLE models;
ALTER TABLE models
AUTO_INCREMENT=100;
ALTER TABLE models
ADD CONSTRAINT fk_manufacturers_manufacturer_id
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id);


CREATE TABLE students(
student_id INT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
CREATE TABLE Exams(
exam_id INT NOT NULL PRIMARY KEY,
Name VARCHAR(50)
);
ALTER TABLE Exams
AUTO_INCREMENT=100;
CREATE TABLE students_exams(
student_id INT NOT NULL,
exam_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(student_id,exam_id)
);
ALTER TABLE students_exams
ADD CONSTRAINT fk_students_student_id
FOREIGN KEY(student_id)
REFERENCES students(student_id);
ALTER TABLE students_exams
ADD CONSTRAINT fk_exams_exam_id
FOREIGN KEY(exam_id)
REFERENCES Exams(exam_id);


CREATE DATABASE onlinestore;
USE onlinestore;
CREATE TABLE item_types(
item_type_id INT(11) NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
CREATE TABLE items(
item_id INT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
item_type_id INT(11) NOT NULL,
CONSTRAINT fk_items_item_types
FOREIGN KEY(item_type_id)
REFERENCES item_types(item_type_id)
);
CREATE TABLE cities(
city_id INT(11) NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
CREATE TABLE customers(
customer_id INT(11) PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
birthday DATE ,
city_id INT(11) NOT NULL,
CONSTRAINT fk_customers_cities
FOREIGN KEY(city_id)
REFERENCES cities(city_id)
);
CREATE TABLE orders(
order_id INT(11) NOT NULL PRIMARY KEY,
customer_id INT(11) NOT NULL,
CONSTRAINT fk_orders_customers
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);
CREATE TABLE order_items(
order_id INT(11) NOT NULL,
item_id INT(11) NOT NULL,
CONSTRAINT pk_order_items
PRIMARY KEY(order_id,item_id),
CONSTRAINT fk_order_items_orders_items
FOREIGN KEY(order_id)
REFERENCES orders(order_id),
CONSTRAINT fk_order_items_items_order
FOREIGN KEY(item_id)
REFERENCES items(item_id)
);