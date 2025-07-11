-- DDL
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

-- DRL
CREATE DATABASE DRL;
USE DRL;

-- SELECT WITHOUT FROM USES DUAL TABLES 
SELECT 55 + 11;
SELECT NOW();
SELECT UCASE("aditya");

CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Abc', 'Def', 100000, '2001-02-14 09:00:00', 'HR'),
		(002, 'Gec', 'Pil', 80000, '2002-06-14 09:00:00', 'Admin'),
		(003, 'Wxc', 'Tiq', 300000, '2021-03-14 09:00:00', 'HR'),
		(004, 'Tzw', 'Brd', 200000, '2019-06-14 09:00:00', 'Admin'),
		(005, 'Rxp', 'Qem', 500000, '2011-03-14 09:00:00', 'Admin'),
		(006, 'Zds', 'Ygh', 70000, '2011-06-14 09:00:00', 'Account'),
		(007, 'Vxz', 'Mnn', 95000, '2019-06-14 09:00:00', 'Account'),
		(008, 'Iwr', 'Rig', 90000, '2011-07-14 09:00:00', 'Admin');
INSERT INTO Worker
	VALUES(009, 'Hwr', NULL, 120000, '2011-07-14 09:00:00', 'Account');

SELECT * FROM Worker;
        
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 2000, '16-01-11'),
		(003, 3000, '16-06-20'),
		(001, 5000, '16-03-20'),
		(002, 2000, '16-08-20');

SELECT * FROM Bonus;

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

SHOW TABLES;

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(001, 'Manager', '2016-02-20 00:00:00'),
		(002, 'Executive', '2016-06-11 00:00:00'),
		(008, 'Executive', '2016-06-11 00:00:00'),
		(005, 'Asst. Manager', '2016-06-11 00:00:00'),
		(004, 'Executive', '2016-06-11 00:00:00'),
		(007, 'Executive', '2016-06-11 00:00:00'),
		(006, 'Lead', '2016-06-11 00:00:00'),
		(003, 'Lead', '2016-06-11 00:00:00');
        
SELECT * FROM Title;

-- WHERE 
SELECT * FROM Worker WHERE SALARY > 100000;
SELECT * FROM Worker WHERE DEPARTMENT = "HR";

-- BETWEEN
SELECT * FROM Worker WHERE SALARY BETWEEN 90000 AND 200000;

-- REDUCE OR
SELECT * FROM Worker WHERE DEPARTMENT = "HR" OR DEPARTMENT = "Admin" OR DEPARTMENT = "Accout";

-- BETTER WAY, TO USE IN 
SELECT * FROM Worker WHERE DEPARTMENT IN("HR", "Admin", "Account");

-- NOT
SELECT * FROM Worker WHERE DEPARTMENT NOT IN("HR", "Account");

-- NULL
SELECT * FROM Worker WHERE LAST_NAME IS NULL;

-- WILDCARD
SELECT * FROM Title WHERE WORKER_TITLE LIKE "%i%";

-- SORTING
SELECT * FROM Worker ORDER BY SALARY DESC;
SELECT * FROM Worker ORDER BY SALARY ASC;

-- DISTINCT
SELECT DISTINCT DEPARTMENT FROM Worker;

-- GROUP BY
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT; -- IF NO AGGREGATION FUNC, THEN WILL WORK AS DISTINCT
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT; -- COUNT()
SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT; -- SUM()
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT; -- AVG()
SELECT DEPARTMENT, MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT; -- MIN()
SELECT DEPARTMENT, MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT; -- MAX()

-- GROUP BY HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2; 
