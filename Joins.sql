CREATE DATABASE D1;
USE D1;

CREATE TABLE EMPLOYEE (
	ID INT PRIMARY KEY,
    FNAME VARCHAR(30),
    LNAME VARCHAR(30),
    AGE INT(2),
    EMAILID VARCHAR(225),
    PHONENO INT,
    CITY CHAR(20)
);

INSERT INTO EMPLOYEE 
VALUES(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
	(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
	(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
	(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
	(5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');
Insert into employee
values(6, 'PKP', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

-- NAME starting and ending with same alphabet;
Select FNAME from employee where left(FNAME,1) = right(FNAME, 1);

CREATE TABLE CLIENT (
	ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(30),
    LAST_NAME VARCHAR(30),
    AGE INT(2),
    EMAILID VARCHAR(225),
    PHONENO INT,
    CITY CHAR(20),
    EMP_ID INT,
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(ID)
);
INSERT INTO CLIENT
VALUES(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
	(2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
	(3, 'Peter', 'Jain', 47, 'peter@abc.com', 111, 'Delhi', 1),
	(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyderabad', 5),
	(5, 'Pratap', 'Singh', 36, 'p@xyz.com', 77767, 'Mumbai', 2);
    
CREATE TABLE PROJECT (
	ID INT PRIMARY KEY,
    EMP_ID INT,
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(ID),
    NAME VARCHAR(5),
    STARTDATE DATE,
    CLIENT_ID INT,
    FOREIGN KEY(CLIENT_ID) REFERENCES CLIENT(ID)
);
INSERT INTO PROJECT
VALUES(1, 1, 'A', '2021-04-21', 3),
	(2, 2, 'B', '2021-03-12', 1),
	(3, 3, 'C', '2021-01-16', 5),
	(4, 3, 'D', '2021-04-27', 2),
	(5, 5, 'E','2021-05-01', 4);

-- INNER JOIN
-- Enlist All the employee's ID's, names along with the Project allocated to them.
SELECT E.ID, E.FNAME, E.LNAME, P. ID, P.NAME FROM EMPLOYEE AS E
INNER JOIN PROJECT AS P ON E.ID = P.EMP_ID;

-- W/O JOIN
SELECT E.ID, E.FNAME, E.LNAME, P. ID, P.NAME FROM EMPLOYEE AS E,
PROJECT AS P WHERE E.ID = P.EMP_ID;

-- Fetch out all the employee's ID's and their contact detail who have been
-- from Jaipur with the clients name working in Hyderabad.
SELECT E.ID, E.EMAILID, E.PHONENO, C.FIRST_NAME, C.LAST_NAME FROM EMPLOYEE AS E
INNER JOIN CLIENT AS C ON E.ID = C.EMP_ID WHERE E.CITY = "jaipur" AND C.CITY = "Hyderabad";

-- LEFT JOIN
-- Fetch out each project allocated to each employee.alter
SELECT * FROM EMPLOYEE AS E
LEFT JOIN PROJECT AS P ON E.ID = P.EMP_ID;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective email ID.
SELECT P.ID, P.NAME, E.FNAME, E.LNAME, E.EMAILID FROM EMPLOYEE AS E
RIGHT JOIN PROJECT AS P
ON E.ID = P.EMP_ID;

-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT E.FNAME, E.LNAME, P.ID, P.NAME FROM EMPLOYEE AS E
CROSS JOIN PROJECT AS P;

SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM CLIENT;