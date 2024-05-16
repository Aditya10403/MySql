Create database if not exists ABC;
use ABC;

create table Dept1(
	empid int primary key,
    name char(1),
    role varchar(20)
);
insert into Dept1
values( 1, 'A', 'engineer'),
	( 2, 'B', 'salesman'),
    ( 3, 'C', 'manager'),
    ( 4, 'D', 'salesman'),
    ( 5, 'E', 'engineer');
    
create table Dept2(
	empid int primary key,
    name char(1),
    role varchar(20)
);
insert into Dept2
values( 3, 'C', 'manager'),
	( 6, 'F', 'marketing'),
    ( 7, 'G', 'salesman');
    
select * from Dept1;
select * from Dept2;

-- SET OPERATIONS

-- list out all the employees in the company
-- UNION
select * from dept1
UNION
select * from dept2;

-- list out all the employees in all departments who work as salesman
select * from dept1 where role = 'salesman'
UNION
select * from dept2 where role = 'salesman';

-- list out all the employees who work in all the departments.
-- INTERSECT
select dept1.* from dept1 INNER JOIN dept2 USING(empid);

-- list out all the emplouees working in dept1 but not in dept2.
-- MINUS
select dept1.* from dept1 LEFT JOIN dept2 USING(empid)
where dept2.empid is null;

