Use D1;

-- SUB QUERIES
-- WHERE clause same table
-- employees with age > 30
select * from employee where age in (select age from employee where age > 30);

-- WHERE clause different table
-- emp details working in more than 1 project.
select * from employee where ID in (
select EMP_ID from project group by EMP_ID having count(EMP_ID) > 1
);

-- Single value subquery
-- employee details having age > avg(age)
select * from employee where age > (select avg(age) from employee);

-- FROM clause - Derived tables
-- select max age person whose first name has 'a'
select max(age) from (select * from employee where FNAME like '%a%') AS temp;

-- Corelated subquery
-- find 3rd oldest employee
SELECT *
FROM employee e1
WHERE 3 = (
	SELECT COUNT(e2.age)
    FROM employee e2 
    WHERE e2.age >= e1.age
);

-- VIEW
SELECT * FROM EMPLOYEE;

-- CREATING A VIEW
CREATE VIEW custom_view AS SELECT FNAME, AGE from EMPLOYEE;

-- VIEWING FROM VIEW
SELECT * FROM CUSTOM_VIEW;

-- ALTERING THE VIEW
ALTER VIEW CUSTOM_VIEW AS SELECT FNAME, LNAME, AGE FROM EMPLOYEE;

-- DROPING THE VIEW
DROP VIEW IF EXISTS CUSTOM_VIEW;