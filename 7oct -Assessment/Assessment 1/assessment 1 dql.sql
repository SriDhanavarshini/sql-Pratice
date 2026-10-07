USE telecom_assessment;
-- Section A Basic & CRUD
-- 1
select customer_name,city,email from customers;

-- 2 
select * from customers where city in ('Hyderabas','Mumbai');

-- 3

select * from customers where customer_name LIKE '%a%';

-- 4
INSERT INTO customers (customer_id, customer_name, city, mobile, email) 
VALUES (9, 'Suji', 'Bangalore', '9941769299', NULL);

-- 5

update customers set city='Chennai' where customer_id=6;

-- 6

DELETE from customers where customer_id=9;


-- 7 

select * from customers order by customer_name ASC;



-- SECTION B Agrreagatrion/Group by/Having

-- 8

select count(payment_id) as total_payments, sum(amount) as total_amount from payments;


-- 9

select customer_id,sum(amount) as total_amount from payments GROUP by customer_id;

-- 10
select customer_id from payments group by customer_id having sum(amount)>2000;

-- 11
select avg(amount) as avg_purchase,customer_id from payments GROUP by customer_id; 

-- Section C- Joins

select c.customer_name,p.plan_name,p.monthly_charge,s.status from subscriptions s LEFT JOIN customers c on s.customer_id=c.customer_id
LEFT JOIN plans p ON s.plan_id=p.plan_id;

select c.customer_name from customers c  LEFT JOIN subscriptions  s on c.customer_id=s.customer_id;

select s.subscription_id from subscriptions s left join customers c on s.customer_id=c.customer_id
LEFT JOIN plans p ON s.plan_id=p.plan_id where s.customer_id is null or s.plan_id is null;

-- Section D - Data Cleansing

update customers set customer_name=Trim(customer_name);

update customers set email=LOWER(email);

update customers set email=NULLIF(email,'');

SELECT * FROM customers WHERE mobile REGEXP '^[0-9]+$';

SELECT *FROM customers WHERE mobile NOT REGEXP '^[0-9]+$';
