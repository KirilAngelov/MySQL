USE gringotts;
# NUMBER OF ids
SELECT COUNT(id) as 'Count' from wizzard_deposits
GROUP BY 'Count';
# longest magic wand
SELECT MAX(magic_wand_size) AS 'longest magic wand' from wizzard_deposits;


#Longest wand from deposit_group
SELECT deposit_group,max(magic_wand_size) as 'longest_magic_size' from wizzard_deposits
GROUP BY deposit_group
order by `longest_magic_size`,deposit_group asc;

#lowest average magic wand by deposit group
select deposit_group from wizzard_deposits
GROUP BY deposit_group
ORDER BY avg(magic_wand_size)
LIMIT 1;

#Sum of deposits
SELECT deposit_group,sum(deposit_amount) as 'total_sum' from wizzard_deposits
GROUP BY deposit_group
ORDER BY  `total_sum` asc;

#Deposit sum from family
SELECT deposit_group,sum(deposit_amount) as 'total sum' from wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP by deposit_group
ORDER BY deposit_group asc;

SELECT deposit_group,sum(deposit_amount) as 'total sum' from wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP BY deposit_group
HAVING `total sum`<150000
ORDER BY `total sum` desc;


SELECT deposit_group,magic_wand_creator,MIN(deposit_charge) from wizzard_deposits
GROUP BY deposit_group,magic_wand_creator
ORDER BY `magic_wand_creator`,`deposit_group`;


SELECT * FROM wizzard_deposits;
SELECT '[11-20]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE `age`>=11 and `age`<=20
UNION
SELECT '[21-30]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE `age`>=21 and `age`<=30
UNION
SELECT '[31-40]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE `age`>=31 and `age`<=40
UNION
SELECT '[41-50]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE `age`>=41 and `age`<=50
UNION
SELECT '[51-60]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE `age`>=51 and `age`<=60
UNION
SELECT '[61+]'as age_group,count(age)as 'Count'from wizzard_deposits
WHERE  `age`>=61
ORDER BY `Count`;

SELECT LEFT(first_name,1) as first_letter from wizzard_deposits
GROUP BY `first_letter`
ORDER BY `first_letter`;

SELECT deposit_group,is_deposit_expired,AVG(deposit_interest) as 'average interest' FROM wizzard_deposits
WHERE deposit_start_date>='1985/01/01'
GROUP BY is_deposit_expired,deposit_group
ORDER BY deposit_group desc,is_deposit_expired asc;

