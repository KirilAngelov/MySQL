USE soft_uni;
SELECT * FROM employees;
SELECT * FROM addresses;
SELECT * FROM towns;
SELECT * FROM departments;

#0.1 Towns with addresses
SELECT e.first_name,e.last_name,t.name as 'town',a.address_text from employees as e
JOIN addresses as a
on e.address_id=a.address_id
JOIN towns as t
on a.town_id=t.town_id
ORDER BY e.first_name asc,last_name;

#0.2 Employees hired after a certain date and department
SELECT e.first_name,e.last_name,e.hire_date,d.name FROM employees as e
JOIN departments as d on d.department_id=e.department_id
WHERE e.hire_date>'1999/1/1' and
d.name in ('Sales','Finance')
ORDER BY hire_date asc; 	

#0.3 Employees with a project started after 12/08/2002 and is not finished
SELECT e.employee_id,e.first_name,p.name as 'project_name' FROM employees as e
JOIN employees_projects as ep
on e.employee_id=ep.employee_id
JOIN projects as p
on ep.project_id=p.project_id
WHERE p.start_date>'2002/08/13'
and p.end_date is null
ORDER BY e.first_name asc,p.name asc;

#Employee resume with their managers and names of departments
SELECT * FROM employees;
SELECT  *FROM departments;
SELECT e.employee_id,
CONCAT(e.first_name,' ',e.last_name) as 'employee_name',
CONCAT(e1.first_name,' ',e1.last_name) as 'manager name',
d.name as 'department_name'
 FROM employees as e
JOIN employees as e1
on e1.employee_id=e.manager_id
JOIN departments as d
ON e.department_id=d.department_id
ORDER BY e.employee_id
LIMIT 5 ;

#Highest peaks in Bulgaria
USE geography;
SELECT c.country_code,m.mountain_range,p.peak_name,p.elevation FROM countries as c
JOIN  mountains_countries as mc
ON c.country_code=mc.country_code
JOIN mountains as m
on mc.mountain_id=m.id
JOIN peaks as p
ON m.id=p.mountain_id
WHERE c.country_code='BG' AND p.elevation>2835
ORDER BY elevation desc;

#Mountain ranges in Bulgaria,Russia and USA
SELECT c.country_code,c.country_name,m.mountain_range FROM countries as c
join mountains_countries as mc
on c.country_code=mc.country_code
JOIN mountains as m
ON m.id=mc.mountain_id
WHERE c.country_code IN ('BG','US','RU')
ORDER BY country_code,mountain_range;