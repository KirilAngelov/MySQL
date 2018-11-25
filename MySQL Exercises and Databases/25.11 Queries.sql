#Not all queries are here

USE ruk_database;
SELECT * FROM clients;
SELECT id,full_name FROM clients
ORDER BY id asc;



SELECT id,concat(first_name,' ',last_name) as full_name,concat('$',salary) as salary,started_on FROM employees
WHERE salary>100000 and started_on>='2018/01/01'
ORDER BY salary desc;




SELECT c.id,concat(card_number,':',full_name) as 'card_token' FROM cards as c
JOIN bank_accounts as ba
ON ba.id=c.bank_account_id
JOIN clients as cc
ON ba.client_id=cc.id
ORDER BY c.id desc;



SELECT concat(first_name,' ',last_name) as `name`,started_on,count(*) as `clients` FROM employees as e
join employees_clients as ec
on e.id=ec.employee_id
JOIn clients as c
on ec.client_id=c.id
GROUP BY `name`
ORDER BY clients desc,e.id asc
LIMIT 5 ;