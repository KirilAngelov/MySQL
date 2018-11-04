USE soft_uni;
#Query 1
SELECT * FROM departments;

#Query 2 
SELECT name FROM departments; 

#Query 3 
SELECT first_name,last_name,salary FROM employees;

#Query 4 
SELECT first_name,middle_name,last_name FROM employees;

#Query 5 
SELECT CONCAT(first_name,'.',last_name,'@softuni.bg') AS 'full_email' FROM employees;

#Query 6
SELECT DISTINCT salary AS Salary FROM employees
ORDER BY salary;

#Query 7 
 SELECT employee_id as id,first_name AS First_Name,last_name As Last_Name,middle_name As Middle_Name,
 job_title AS Job_Title, department_id AS Dept_ID, manager_id AS Mngr_id,hire_date AS Hire_Date,
 salary,address_id FROM employees
 WHERE job_title='Sales Representative';
 
#Query 8
SELECT first_name,last_name, job_title AS JobTitle FROM employees
WHERE salary BETWEEN 20000 and 30000;

#Query 9 
SELECT CONCAT(first_name,' ',middle_name,' ',last_name) as Full_Name FROM employees
WHERE salary IN (25000,14000,12500,23600);

#Query 10
SELECT first_name,last_name FROM employees 
WHERE manager_id IS NULL;

#Query 11
SELECT first_name,last_name,salary FROM employees
WHERE salary>50000
ORDER BY salary DESC;

#Query 12
SELECT first_name,last_name FROM employees
ORDER BY salary DESC
LIMIT 5;

#Query 13
SELECT first_name,last_name FROM employees
WHERE department_id!=4;

#Query 14
SELECT DISTINCT job_title AS Job_title FROM employees 
ORDER BY job_title;
	
#Query 15
SELECT project_id AS id,name AS Name,description AS Description,start_date,end_date
FROM projects
ORDER BY start_date,name
LIMIT 10;

#Query 16
SELECT first_name,last_name,hire_date FROM employees
ORDER BY hire_date DESC
LIMIT 7;

#Query 17
SELECT * FROM departments;
UPDATE salary
SET salary=salary*1.12
WHERE department_id IN (1,2,4,11);

#Query 18
USE geography;
SELECT peak_name FROM peaks
ORDER BY peak_name ASC;

#Query 19
SELECT country_name,population FROM countries
WHERE continent_code ='EU'
ORDER BY POPULATION DESC
LIMIT 30; 

#Query 20
SELECT * FROM countries;
SELECT country_name,country_code,
(CASE
    WHEN currency_code='EUR' THEN 'EURO'
    ELSE 'Not Euro'
END)
AS currency
FROM countries
ORDER BY country_name;

#Query 21
SELECT country_name,capital,
(CASE
WHEN LEFT(capital,1)='B' THEN 'Starts with B'
ELSE 'Does not start with B'
END)
AS answer
FROM countries
ORDER BY country_name;

#Query 22
SELECT country_name,capital,
(CASE 
WHEN LEFT(country_name,1)='A' AND continent_code='AF'
THEN 'Is in Africa and starts with A '
WHEN LEFT(country_name,1)='A' and continent_code<>'AF'
THEN 'Is not in Africa but starts with A'
ELSE 'Is not in Africa'
END)
AS answer
FROM countries
ORDER BY country_name;


#Query 21


 