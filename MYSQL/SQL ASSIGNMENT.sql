CREATE DATABASE HR;
USE HR;
SELECT * FROM EMP;
/* MODULE 4 */
/*1. Display all information in the tables EMP and DEPT.*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

/*2. Display only the hire date and employee name for each employee. */

SELECT HIRING_DATE , EMP_FNAME FROM EMP;

/*3. Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title */

SELECT CONCAT(EMP_FNAME," = ", JOB_ID) FROM EMP;

/*4. Display the hire date, name and department number for all clerks. */

SELECT HIRING_DATE, EMP_FNAME, DEPT_NO
FROM EMP
WHERE DEPT = "SALESMAN";

/*5. Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT */
 
SELECT JOB_ID,',', EMP_FNAME,',', EMP_LNAME,',', HIRING_DATE,',', SALARY, DEPT,',', COMISSION,',', DEPT_NO
FROM EMP;

/*6. Display the names and salaries of all employees with a salary greater than 2000. */

SELECT EMP_FNAME , SALARY FROM EMP
WHERE SALARY > 15000;

/*7. Display the names and dates of employees with the column headers "Name" and "Start
Date"*/

SELECT EMP_FNAME AS NAME , HIRING_DATE AS START_DATE FROM EMP;

/*8. Display the names and hire dates of all employees in the order they were hired. */

SELECT EMP_FNAME , HIRING_DATE FROM EMP ORDER BY HIRING_DATE ASC;

/*9. Display the names and salaries of all employees in reverse salary order. */

SELECT EMP_FNAME , SALARY FROM EMP ORDER BY SALARY DESC;

/*10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order. */

SELECT EMP_FNAME , DEPT_NO 
FROM EMP
WHERE COMISSION IS NOT NULL
ORDER BY SALARY DESC;

/*11. Display the last name and job title of all employees who do not have a manager */

SELECT EMP_LNAME, DEPT FROM EMP WHERE DEPT != "MANAGER";

/*12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/

SELECT  EMP_LNAME ,SALARY, DEPT FROM EMP WHERE DEPT ="SALESMAN" AND SALARY NOT IN (10000,15000); 

 

/*1) Display the maximum, minimum and average salary and commission earned. */

SELECT 
MAX(SALARY) AS MAXIMUM_SALARY,
MIN(SALARY) AS MINIMUM_SALARY,
AVG(SALARY) AS AVERAGE_SALARY FROM DEPT;

/* 2) Display the department number, total salary payout and total commission payout for 
each department. */

SELECT  DEPT_NO ,  SUM(SALARY) AS TOTAL_SALARY , SUM(COMMISSION) AS TOTAL_COMMISSION 
FROM DEPT 
GROUP BY DEPT_NO;

/*3) Display the department number and number of employees in each department. */

SELECT DEPT_NO , COUNT(DEPTT) AS NUMBEROFEMPLOYEES
FROM DEPT
GROUP BY DEPT_NO;

/*4) Display the department number and total salary of employees in each department. */

SELECT DEPTT, SUM(SALARY) AS TOTAL_SALARY 
FROM DEPT
GROUP BY DEPTT;

/*5) Display the employee's name who doesn't earn a commission. Order the result set
without using the column name */

SELECT DEPT_FNAME , DEPT_LNAME
FROM DEPT
WHERE COMMISSION IS  NULL
ORDER BY 1 ;

/*6) Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately*/

SELECT CONCAT(DEPT_FNAME,' ',DEPT_LNAME) AS 'NAME' , DEPT_NO ,
	CASE 
    WHEN COMMISSION IS NULL THEN 'NO COMMISSION'
    ELSE DEPT.COMMISSION 
    END AS COMMISSION
    FROM DEPT;
    
    /*7) Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately*/

SELECT CONCAT(DEPT_FNAME,' ',DEPT_LNAME) AS 'NAME' , DEPT_NO ,
	CASE 
    WHEN COMMISSION IS NULL THEN 'NO COMMISSION'
    ELSE DEPT.COMMISSION * 2
    END AS COMMISSION
    FROM DEPT;

/*8) Display the employee's name, department id who have the first name same as another
employee in the same department*/

SELECT DEPT_LNAME, DEPT_NO
FROM DEPT
WHERE DEPTT = "SALESMAN";

/*9) Display the sum of salaries of the employees working under each Manager*/

SELECT SUM(SALARY) 
FROM DEPT
WHERE DEPTT = "MANAGER"; 

/*10) Select the Managers name, the count of employees working under and the department
ID of the manager. */

SELECT DEPT_LNAME FROM DEPT WHERE DEPTT = "MANAGER";

/*11) Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a! */

SELECT DEPT_LNAME , DEPT_NO , SALARY 
 FROM DEPT
 WHERE DEPT_LNAME LIKE '_a%';

/*12) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id.*/

SELECT DEPT_NO, AVG(SALARY) AS AVERAGE_SALARY
FROM DEPT
GROUP BY DEPT_NO;

/*13) Select the maximum salary of each department along with the department id */

SELECT DEPT_NO, MAX(SALARY) AS MAXIMUM
FROM DEPT
GROUP BY DEPT_NO;

/*14) Display the commission, if not null display 10% of salary, if null display a default value 1*/

SELECT DEPT_LNAME ,
	CASE 
		WHEN COMMISSION IS NOT NULL THEN COMMISSION
        WHEN SALARY IS NOT NULL THEN 0.01 * SALARY
        ELSE 1
	END AS DISPLAYED_COMMISSION
FROM DEPT; 

/*1. Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. */

SELECT 
    SUBSTRING(UPPER(LOWER(DEPT_LNAME)), 2, 4) AS Modified_last_name
FROM DEPT;

/*2. Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/

SELECT DEPT_FNAME , DEPT_LNAME AS AMONG_WITH_A
FROM DEPT
WHERE DEPT_LNAME LIKE 'A%';

/*3. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.*/

SELECT * FROM DEPT;

SELECT 
	DEPT_LNAME AS LASTNAME,
    CASE 
		WHEN SALARY * 0.5 > 1000 THEN SALARY * 1.1
        ELSE SALARY * 1.115
	END AS UPDATED_SALARY,
    1500 AS BONUS_AMOUNT
FROM DEPT;

/*4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!*/

SELECT 
	CONCAT(SUBSTRING(DEPT_NO,1,2),'00','E') AS EMPLOYEE_ID,
    DEPT_NO AS DEPARTMENT_ID,
    UPPER(CONCAT(
		IF(DEPTT LIKE '%Z%',REPLACE(DEPTT,'Z','$!'),DEPTT)
	))AS MANAGER_NAME,
    UPPER(SALARY) AS SALARY
FROM DEPT;

/*5. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names */

SELECT 
    CONCAT(UPPER(SUBSTRING(DEPT_LNAME, 1, 1))), LOWER(SUBSTRING(DEPT_LNAME, 2)) AS FormattedLastName,
    LENGTH(DEPT_LNAME) AS NameLength
FROM 
    DEPT
WHERE 
    DEPT_LNAME LIKE 'J%' OR DEPT_LNAME LIKE 'A%' OR DEPT_LNAME LIKE 'M%'
ORDER BY 
    DEPT_LNAME;

/*6. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY */

SELECT 
    DEPT_LNAME,
    LPAD(CONCAT('$', FORMAT(SALARY, 2)), 15, '$') AS SALARY
FROM 
    DEPT;
    

/*7. Display the employee's name if it is a palindrome*/

SELECT 
    DEPT_FNAME AS EmployeeName
FROM 
    DEPT
WHERE 
   DEPT_FNAME = REVERSE(DEPT_FNAME);
 
/*8. Display First names of all employees with initcaps. */

SELECT 
	CONCAT(UPPER(SUBSTRING(DEPT_FNAME,1,1)),LOWER(SUBSTRING(DEPT_FNAME,2)))AS FROMATED_FIRSTNAME
FROM DEPT;

/*9. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.*/

SELECT * FROM DEPT;

/*10. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. */

SELECT 
	CONCAT(
		LOWER(SUBSTRING(DEPT_FNAME,1,1)),
        LOWER(DEPT_LNAME),
        '@systechusa.com'
	) AS Email_address ,
    DEPT_FNAME
FROM DEPT;

/*11. Display the names and job titles of all employees with the same job as Trenna.*/

SELECT * FROM DEPT;

SELECT 
	DEPT_FNAME,
    DEPT_LNAME,
    DEPTT
FROM DEPT
WHERE DEPTT = (SELECT DEPTT FROM DEPT WHERE DEPT_FNAME='Trenna');

/*12. Display the names and department name of all employees working in the same city as 
Trenna. */

/*ADDRESS NOT INCLUDE IN THE TABLE*/

/*13. Display the name of the employee whose salary is the lowest.*/

SELECT MIN(SALARY) AS MIN_SALARY, DEPT_LNAME
FROM DEPT;

/*14. Display the names of all employees except the lowest paid.
*/

SELECT DEPT_FNAME , SALARY 
FROM DEPT
WHERE 
	SALARY > (SELECT MIN(SALARY) FROM DEPT);

/*--------------------------------------------*/


/*1. Write a query to display the last name, department number, department name for all 
employees. */

SELECT DEPT_FNAME , 
	   DEPT_NO ,
       DEPTT
FROM DEPT;

/*2. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output. */

SELECT DISTINCT 
		JOB_ID,
		(SELECT DEPTT FROM DEPT WHERE DEPT_NO = '10') AS DEPARTMENT_LOCTION
FROM DEPT
WHERE DEPT_NO = '10';

/*3. Write a query to display the employee last name,department name,location id and 
city of all employees who earn commission.*/

SELECT DEPT_LNAME , DEPTT , JOB_ID 
FROM DEPT
WHERE COMMISSION IS NOT NULL;

/*4. Display the employee last name and department name of all employees who have an 'a' in their last name*/

SELECT DEPT_LNAME , DEPTT
FROM DEPT
WHERE DEPT_LNAME LIKE "%a";


/*5.Display the employee last name and employee number along with their manager's last name and
 manager number (including the employees who have no manager).*/ 
 
 SELECT
    DEPT_LNAME AS employee_last_name,
    JOB_ID,
    (SELECT DEPT_LNAME FROM DEPT WHERE JOB_ID = DEPT_NO),
    JOB_ID AS employee_number
FROM
    DEPT;

/*6. Create a query that displays employees last name,department number,and all the employees
 who work in the same department as a given employee.*/
 
 SELECT DEPT_LNAME , DEPT_NO 
 FROM DEPT;
 
 /*7. Create a query that displays the name,job,department name,salary,grade for all employees.
 Derive grade based on salary(>=500=A, >=300=B,<3000=C)*/
 
 SELECT
    DEPT_LNAME AS employee_name,
    JOB_ID AS job,
    (SELECT DEPTT FROM DEPT WHERE JOB_ID = DEPT_NO) AS department_name,
    SALARY,
    CASE
        WHEN SALARY >= 500 THEN 'A'
        WHEN SALARY >= 300 THEN 'B'
        ELSE 'C'
    END AS grade
FROM
    DEPT;

/*10. Display the names and hire date for all employees who were hired before their 
managers along withe  their manager names and hire date. Label the columns as Employee name,
 emp_hire_date,manager name,man_hire_date*/
 
 SELECT
    CONCAT(DEPT_FNAME, ' ', DEPT_LNAME) AS "Employee name",
    HIRE_DATE AS "emp_hire_date",
    (SELECT CONCAT(DEPT_FNAME, ' ',DEPT_LNAME) FROM DEPT m WHERE DEPT_NO= JOB_ID) AS "manager name",
    (SELECT HIRE_DATE FROM DEPT WHERE DEPT_NO = JOB_ID) AS "man_hire_date"
FROM
    DEPT 
WHERE
    HIRE_DATE < (SELECT HIRE_DATE FROM DEPT m WHERE DEPT_NO = JOB_ID);
    
/* /////////////////////////////////////////////////////////// */

/*1. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus. */ 

SELECT DEPT_NO, CONCAT(DEPT_FNAME, ' ', DEPT_LNAME) AS employee_name
FROM DEPT
WHERE DEPTT = 'Sales' AND COMMISSION = 2000;

/*2. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A.*/

SELECT 
    DEPT_NO,
    COALESCE(address, 'N/A') AS address
FROM DEPT
WHERE ADDRESS = 'CA';

/*3. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.*/

SELECT DEPT_NO, DEPT_FNAME, DEPT_LNAME  
    FROM DEPT
    WHERE DEPT_LNAME LIKE '%U%';
    
/*4. Find the subcategories that have at least two different prices less than $15.*/

SELECT * FROM Category where start >=1 and start < 18;

/*---------------------------------------------------------*/

/*1. Write a query to display the last name and hire date of any employee in the same 
department as SALES. */

SELECT DEPT_LNAME, HIRE_DATE 
from dept
where DEPTT = "CLERK";

/*2. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary.*/

SELECT DEPT_NO, DEPT_LNAME 
FROM DEPT
WHERE SALARY> (SELECT AVG(SALARY) FROM DEPT)
ORDER BY SALARY ASC;

/*3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u*/

SELECT DEPT_NO, DEPT_LNAME
FROM DEPT
WHERE DEPTT IN (
    SELECT DISTINCT DEPT_NO
    FROM DEPT
    WHERE DEPT_LNAME LIKE '%U%'
);

/*4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA.*/

select dept_lname, deptt, dept_no 
from dept
where address = "odhav";

/*5. Display the last name and salary of every employee who reports to FILLMORE.*/

SELECT DEPT_LNAME, SALARY 
FROM DEPT; 

/*6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department.*/

SELECT DEPT_NO, DEPT_LNAME, JOB_ID
FROM DEPT
WHERE DEPTT = "CLERK";

/*7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.*/

SELECT DEPT_NO, DEPT_LNAME, SALARY
FROM DEPT
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM DEPT
)
AND DEPTT IN (
    SELECT DEPT_NO
    FROM DEPT
    WHERE DEPT_LNAME LIKE '%U%'
);

/*8. Display the names of all employees whose job title is the same as anyone in the sales 
dept. */

SELECT * FROM DEPT WHERE DEPTT = "SALESMAN";


/*9. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise. */

SELECT DEPT_NO, SALARY, 1.05 AS raise_percentage
FROM EMP
WHERE DEPT_NO IN (1899, 2315)

UNION

SELECT DEPT_NO, SALARY, 1.10 AS raise_percentage
FROM DEPT
WHERE DEPT_NO = 7896

UNION

SELECT DEPT_NO, SALARY, 1.15 AS raise_percentage
FROM DEPT
WHERE DEPT_NO IN (4589, 1565)

UNION

SELECT DEPT_NO, SALARY, 1.00 AS raise_percentage
FROM DEPT
WHERE DEPT_NO =1325 ;

/*10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries. */

SELECT SALARY, DEPT_LNAME
FROM DEPT
ORDER BY SALARY DESC
LIMIT 3; 

/*11. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column */

SELECT DEPT_FNAME, DEPT_LNAME, SALARY , COALESCE(COMMISSION, 0) AS DEPARTMENT_COMMISSION
FROM DEPT;

/*12. Display the Managers (name) with top three salaries along with their salaries and 
department information.*/

SELECT DEPT_FNAME, HIREDATE FROM EMP WHERE EXPERIENCE_YEAR= 3;

/*-------------------------------------------------------------*/

/*1) Find the date difference between the hire date and resignation_date for all the 
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date
*/
SELECT EMPLOYEE_ID,
       EMP_FNAME,
       SALARY,
       TO_CHAR(HIRE_DATE,'MM DD,YY')
FROM EMP;

/*2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)*/

SELECT 
  CASE 
    WHEN HIRE_DATE IS NOT NULL THEN FORMAT(HIRE_DATE, 'MM/dd/yyyy')
    ELSE '(12, 01th 1900)'
  END AS formatted_hire_date,
  
  CASE 
    WHEN REG_DATE IS NOT NULL THEN FORMAT(REG_DATE, 'MMM dd, yyyy')
    ELSE '(Dec 01th, 1900)'
  END AS formatted_resignation_date
FROM DEPT;

/*3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 
months)*/

SELECT YEAR('(12, 01th 1900)') AS Year;

/*4) Display the count of days in the previous quarter*/

SELECT QUARTER(CURDATE());





 
    




























