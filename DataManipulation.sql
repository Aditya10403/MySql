CREATE DATABASE CUSTOMER;
USE CUSTOMER;

CREATE TABLE CUSTOMER (
	ID INTEGER PRIMARY KEY,
    CNAME VARCHAR(225),
    ADDRESS VARCHAR(225),
    GENDER CHAR(2),
    CITY VARCHAR(225),
    PINCODE INTEGER
);

-- INSERT
INSERT INTO CUSTOMER
	VALUES(1251, 'Ram Kumar', 'NSB Road', 'M', 'Raniganj', 144002),
		  (1300, 'Shyam Singh', 'School more', 'M', 'Durgapur', 141001),
		  (245, 'Aditya Shukla', 'Bara Bajar', 'M', 'Asansol', 144003),
		  (210, 'Susrita Sinha', 'Anjana', 'F', 'Asansol', 144003),
		  (500, 'Rohan Arora', 'Sishubagan', 'M', 'Raniganj', 144002);
          
INSERT INTO CUSTOMER
VALUES (1252, 'Rohan Arora2', 'Sishubagan', 'M', 'Raniganj', NULL);

INSERT INTO CUSTOMER(ID, CNAME)
VALUES(121, 'Brajmohon');

SELECT * FROM CUSTOMER;

-- ON DELETE CASCADE
CREATE TABLE Order_Details (
	Order_id INTEGER PRIMARY KEY,
    Delivery_date DATE,
    Cust_id INT,
    FOREIGN KEY(Cust_id) REFERENCES CUSTOMER(ID) ON DELETE CASCADE
);

-- ON DELETE SET NULL
CREATE TABLE Order_Details (
	Order_id INTEGER PRIMARY KEY,
    Delivery_date DATE,
    Cust_id INT,
    FOREIGN KEY(Cust_id) REFERENCES CUSTOMER(ID) ON DELETE SET NULL
);

INSERT INTO Order_Details 
VALUES (3, '2019-03-11', 1252);
INSERT INTO Order_Details 
VALUES (4, '2020-03-11', 1252);

SELECT * FROM Order_Details;

-- DELETE
DELETE FROM CUSTOMER WHERE ID = 1252;
 
-- UPDATE 
UPDATE CUSTOMER SET ADDRESS = 'School more', GENDER = 'M' WHERE ID = 121; 

-- UPDATE MULTIPLE ROWS
-- SET SQL_SAFE_UPDATES = 0-ALLOWS , 1-DON'T ALLOWS
UPDATE CUSTOMER SET PINCODE = 144001; -- SQL PREVENTS THIS - SO SET SQL_SAFE_UPDATES = 0
UPDATE CUSTOMER SET PINCODE = PINCODE + 1; 

-- DELETE
DELETE FROM CUSTOMER WHERE ID = 121;

-- REPLACE - PRIMARY KEY IS REQUIRED
REPLACE INTO CUSTOMER(ID, CITY)
VALUES(1300, 'Colony'); -- IF ALREADY THEN REPLACE AND REST WILL NULL
REPLACE INTO CUSTOMER(ID, CITY)
VALUES(1333, 'Colony'); -- IF NOT THEN INSERT VALUE
REPLACE INTO CUSTOMER SET ID = 1300, NAME = 'Max', CITY = 'UK';
REPLACE INTO CUSTOMER(ID, CNAME, CITY)
	SELECT ID, NAME, CITY
    FROM CUSTOMER WHERE ID = 500;

SELECT * FROM CUSTOMER;