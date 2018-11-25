
USE ruk_database;
SELECT * FROM cities;
SELECT id,name AS Name FROM cities 
WHERE country_code='BG'
ORDER BY name ASC;



SELECT Concat(first_name,' ',middle_name,' ',last_name) as `Full Name`,
LEFT(birth_date,4) as `BirthYear` FROM accounts
WHERE birth_date>'1991'
ORDER BY birth_date desc;
 
 

SELECT c.name as `City`,COUNT(h.id) AS `Hotels`FROM hotels AS h
JOIN cities as c
ON h.city_id=c.id
GROUP BY c.name
ORDER BY `Hotels` DESC, c.name;



SELECT * FROM cities as f
WHERE NOT EXISTS (
SELECT city_id FROM hotels as h
WHERE f.id=h.city_id)
ORDER BY name asc;


    
SELECT * FROM rooms;
SELECT r.id,price as Price,h.name as `Hotel`,c.name as `City` FROM rooms as r
JOIN hotels as h
ON h.id=r.hotel_id
JOIN cities as c
ON c.id=h.city_id
WHERE type='First Class'
ORDER BY price desc,r.id asc;



SELECT * FROM cities;
SELECT * FROM hotels;
SELECT c.name as `City`,count(*) as `Hotels` FROM cities as c
right JOIN hotels as h
ON c.id=h.city_id
GROUP BY `City`;


SELECT * FROM cities;
SELECT c.id AS Id ,c.name as 'City',c.country_code as 'Country',count(*) as 'Accounts' FROM accounts as a
JOIN cities as c
ON c.id=a.city_id
GROUP BY c.name
ORDER BY count(*) desc,id 
LIMIT 5 ;


SELECT * FROM bank_accounts;
	SELECT cc.full_name,count(c.card_number) as cards FROM cards as c
	right JOIN bank_accounts as ba
	on ba.id=c.bank_account_id
	JOIN clients as cc
	On ba.client_id=cc.id
	Group by cc.full_name,cc.id
	Order by count(card_number) desc,cc.id
Limit 1 





