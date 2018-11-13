use soft_uni;
SELECT * FROM employees;
SELECT * FROM employees_projects;
SELECT * FROM projects;
#Exercise joining 3 tables 
SELECT e.first_name as `First name`,e.last_name as `Last name`,p.name as `Project name` FROM employees as e
JOIN employees_projects as ep
ON e.employee_id=ep.employee_id
JOIN projects as p
ON ep.project_id=p.project_id;

#Exercise Display employee`s name and where they live
SELECT * FROM employees;
SELECT  * FROM addresses;
SELECT * FROM towns;
SELECT e.first_name,e.last_name,t.name FROM employees as e
JOIN addresses as a
ON e.address_id=a.address_id
JOIN towns as t
ON a.address_id=t.town_id;
#To be continued