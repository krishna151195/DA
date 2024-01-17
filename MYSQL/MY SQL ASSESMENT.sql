-- Assessment 1: 

create database office;

use office;

CREATE TABLE WORKER_A
(
 WORKER_ID INT PRIMARY KEY,
 FIRST_NAME VARCHAR(35),
 LAST_NAME VARCHAR(35),
 SALARY INT,
 JOINING_DATE DATETIME ,
 DEPARTMENT VARCHAR(35)
);

SELECT * FROM WORKER_A;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
-- Arrange FIRST_NAME IN ASCENDING ORDER

SELECT FIRST_NAME FROM WORKER_A ORDER BY FIRST_NAME ASC;

-- ARRANGE DEPARTMENT IN DESCENDING

SELECT DEPARTMENT FROM WORKER_A ORDER BY DEPARTMENT DESC;

-- 2.Write an SQL query to print details for Workers with the first names “KIRAN” and “PIYA” from the Worker table. 
-- FIND THE FIRST NAME WHOES "KIRAN" AND "PIYA"

SELECT * FROM WORKER_A WHERE FIRST_NAME= "KIRAN" OR FIRST_NAME= "PIYA";


-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘N’ and contains six alphabets.
-- WHOSE FIRST_NAME ENDS WITH "N"

SELECT * FROM WORKER_A WHERE FIRST_NAME LIKE "%N";

--  4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
-- WHOSE SALARY BETWEEN 95000 TO 500000

SELECT * FROM WORKER_A WHERE SALARY BETWEEN 95000 AND 500000;

--  5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
--  FETCH DUPLICATE RECORD IN TABLE

SELECT COUNT(WORKER_ID),DEPARTMENT
FROM WORKER_A
GROUP BY DEPARTMENT
HAVING COUNT(WORKER_ID)> 1;

-- 6. Write an SQL query to show the top 6 records of a table.  
-- TOP 5 RECORD SHOW ME

 SELECT * FROM WORKER_A LIMIT 5;
 
 -- 7. Write an SQL query to fetch the departments that have less than five people in them. 
 -- LESS THAN FIVE PEOPLE IN DEPARTMENT
 
 SELECT * from WORKER_A limit 5;
 
 --  8. Write an SQL query to show all departments along with the number of people in there.  
 -- SHOW ALL DEPARTMENT OF PEOPLE
SELECT * FROM WORKER_A;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department.
-- THE HIGHEST SALARY IN DEPARTMENT

SELECT MAX(SALARY) AS MAXIMUM FROM WORKER_A;

-- Assessment 2: 
/*Question 2: Open school database, then select student table and use following SQL statements. 
TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT */

CREATE DATABASE SCHOOLL;
USE SCHOOLL;
CREATE TABLE STUDENT 
(
 STD_ID INT PRIMARY KEY,
 STD_NAME VARCHAR(35),
 SEX ENUM("MALE","FEMALE"),
 PERCENTAGE INT,
 CLASS INT,
 SEC VARCHAR(20),
 STREAM VARCHAR(30),
 DOB DATE 
);

SELECT * FROM STUDENT;

-- 1 To display all the records form STUDENT table. 
-- ALL RECORD SHOW FROM STUDENT

 SELECT * FROM student ; 

-- 2. To display any name and date of birth from the table STUDENT. 
-- ONLY  SHOW STUDENT NAME AND DATE OF BIRTH.
 
 SELECT STD_NAME, DOB FROM student;
 
 -- 3. To display all students record where percentage is greater of equal to 85 FROM student table. 
 -- SHOW STUDENT RECORD WHOSE ACHIEVE 85% AND MORE THAN 80%.
 
 SELECT * FROM student WHERE percentage >= 85;
 
 -- 4.To display student name, stream and percentage where percentage of student is more than 75 
 -- SHOW STUDENT RECORD WHOSE ACHIEVE 75% AND MORE THAN
 
 SELECT STD_NAME, STREAM, PERCENTAGE FROM STUDENT WHERE percentage > 75; 
 
 -- 5. To display all records of maths students whose percentage is more than 85 form student table. 
 -- DISPLAY ALL RECORD OF SCIENCE STREAM EHOSE PERCENTAGE MORE THAN 85
 
 SELECT * FROM student WHERE stream = "Maths" AND percentage > 85; 