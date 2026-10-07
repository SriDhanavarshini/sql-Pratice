
USE sql_practice_pack;



-- 1
SELECT * FROM menu_items;

-- 2
SELECT item_name, price
FROM menu_items;


-- 4
UPDATE menu_items
SET price = 350
WHERE item_name = 'Chicken Biryani';

-- 5
UPDATE menu_items
SET price = price * 1.10
WHERE category = 'Fast Food';

-- 6
UPDATE menu_items
SET available_qty = available_qty - 2
WHERE item_name = 'Veg Burger';

-- 7
DELETE FROM menu_items
WHERE available_qty = 0;

-- 8
SELECT *
FROM menu_items
WHERE price > 200;

-- 9
SELECT *
FROM menu_items
WHERE price BETWEEN 100 AND 250;

-- 10
SELECT *
FROM menu_items
WHERE category = 'Breakfast';

-- 11
SELECT *
FROM menu_items
WHERE category IN ('Breakfast', 'Beverage');

-- 12
SELECT *
FROM menu_items
WHERE item_name LIKE '%Chicken%';

-- 13
SELECT *
FROM menu_items
ORDER BY price DESC;

-- 14
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 3;

-- 15
SELECT *
FROM menu_items
WHERE available_qty < 15;


CREATE DATABASE food_delivery_db;

USE food_delivery_db;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    restaurant VARCHAR(100),
    city VARCHAR(50),
    food_type VARCHAR(50),
    order_amount DECIMAL(10,2),
    delivery_partner VARCHAR(50),
    order_date DATE
);

INSERT INTO food_orders VALUES
(101, 'Spice Hub', 'Hyderabad', 'Indian', 850, 'Ravi', '2026-09-01'),
(102, 'Burger Zone', 'Hyderabad', 'Fast Food', 520, 'Kiran', '2026-09-01'),
(103, 'Pizza Point', 'Mumbai', 'Fast Food', 1100, 'Ravi', '2026-09-02'),
(104, 'Curry House', 'Bangalore', 'Indian', 760, 'Aman', '2026-09-02'),
(105, 'Spice Hub', 'Hyderabad', 'Indian', 1250, 'Kiran', '2026-09-03'),
(106, 'Sushi World', 'Mumbai', 'Japanese', 1800, 'Aman', '2026-09-03'),
(107, 'Pizza Point', 'Mumbai', 'Fast Food', 900, 'Ravi', '2026-09-04'),
(108, 'Curry House', 'Bangalore', 'Indian', 640, 'Kiran', '2026-09-04'),
(109, 'Burger Zone', 'Hyderabad', 'Fast Food', 430, 'Aman', '2026-09-05'),
(110, 'Sushi World', 'Mumbai', 'Japanese', 2100, 'Ravi', '2026-09-05'),
(111, 'Spice Hub', 'Hyderabad', 'Indian', 950, 'Aman', '2026-09-06'),
(112, 'Curry House', 'Bangalore', 'Indian', 880, 'Ravi', '2026-09-06');
-- 1
SELECT COUNT(*) AS total_orders
FROM food_orders;

-- 2
SELECT SUM(order_amount) AS total_revenue
FROM food_orders;

-- 3
SELECT AVG(order_amount) AS average_order_value
FROM food_orders;

-- 4
SELECT MAX(order_amount) AS highest_order_amount
FROM food_orders;

-- 5
SELECT MIN(order_amount) AS lowest_order_amount
FROM food_orders;

-- 6
SELECT city, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY city;

-- 7
SELECT restaurant, COUNT(*) AS total_orders
FROM food_orders
GROUP BY restaurant;

-- 8
SELECT food_type, AVG(order_amount) AS average_order_value
FROM food_orders
GROUP BY food_type;

-- 9
SELECT delivery_partner, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY delivery_partner;

-- 10
SELECT city, COUNT(*) AS total_orders
FROM food_orders
GROUP BY city
HAVING COUNT(*) > 3;

-- 11
SELECT restaurant, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY restaurant
HAVING SUM(order_amount) > 2000;

-- 12
SELECT delivery_partner, AVG(order_amount) AS average_order_amount
FROM food_orders
GROUP BY delivery_partner
HAVING AVG(order_amount) > 800;

-- 13
SELECT food_type, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY food_type
HAVING SUM(order_amount) > 2500;

-- 14
SELECT city, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY city
ORDER BY total_revenue DESC;

-- 15
SELECT restaurant, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY restaurant
ORDER BY total_revenue DESC
LIMIT 1;



CREATE DATABASE IF NOT EXISTS training_institute_db;
USE training_institute_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Arun', 'Hyderabad'),
(2, 'Megha', 'Mumbai'),
(3, 'Zaid', 'Hyderabad'),
(4, 'Pooja', 'Pune'),
(5, 'Rohan', 'Delhi'),
(6, 'Sana', NULL),
(7, 'Vijay', 'Bangalore');

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    fee DECIMAL(10,2)
);

INSERT INTO courses VALUES
(101, 'Python', 15000),
(102, 'Data Engineering', 25000),
(103, 'Power BI', 12000),
(104, 'Cloud Computing', 20000),
(105, 'Cyber Security', 22000),
(106, 'Machine Learning', 28000);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

INSERT INTO enrollments VALUES
(1001, 1, 101, '2026-09-01'),
(1002, 1, 102, '2026-09-03'),
(1003, 2, 103, '2026-09-04'),
(1004, 3, 102, '2026-09-05'),
(1005, 4, 104, '2026-09-06'),
(1006, 2, 101, '2026-09-07'),
(1007, 3, 105, '2026-09-08'),
(1008, 20, 102, '2026-09-09'),
(1009, 5, NULL, '2026-09-10');

-- 1
SELECT s.student_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 2
SELECT s.student_name, s.city, c.course_name, c.fee
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 3
SELECT s.student_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Engineering';

-- 4
SELECT s.student_name, s.city, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- 5
SELECT s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 6
SELECT c.course_name, c.fee, s.student_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON e.student_id = s.student_id;

-- 7
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 8
SELECT e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 9
SELECT e.*
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

-- 10
SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;

-- 11
SELECT s.student_name, COALESCE(SUM(c.fee), 0) AS total_fees
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;

-- 12
SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1;

-- 13
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) > 1;

-- 14
SELECT c.course_name, SUM(c.fee) AS total_revenue
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 15
SELECT c.course_name, SUM(c.fee) AS total_revenue
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_revenue DESC
LIMIT 1;


CREATE DATABASE IF NOT EXISTS vehicle_rental_db;
USE vehicle_rental_db;

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_name VARCHAR(100),
    vehicle_type VARCHAR(50),
    daily_rate DECIMAL(10,2),
    available_status VARCHAR(20)
);

INSERT INTO vehicles VALUES
(1, 'Honda City', 'Car', 2500, 'Available'),
(2, 'Toyota Innova', 'Car', 3500, 'Available'),
(3, 'Royal Enfield', 'Bike', 1200, 'Rented'),
(4, 'Activa', 'Scooter', 700, 'Available'),
(5, 'Mahindra Thar', 'SUV', 4500, 'Rented'),
(6, 'Hyundai Creta', 'SUV', 3200, 'Available'),
(7, 'KTM Duke', 'Bike', 1500, 'Available');

DELIMITER //

-- 1
CREATE PROCEDURE GetAllVehicles()
BEGIN
    SELECT * FROM vehicles;
END //

DELIMITER ;

CALL GetAllVehicles();

DELIMITER //

-- 2
CREATE PROCEDURE GetAvailableVehicles()
BEGIN
    SELECT *
    FROM vehicles
    WHERE available_status = 'Available';
END //

DELIMITER ;

CALL GetAvailableVehicles();

DELIMITER //

-- 3
CREATE PROCEDURE GetVehiclesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT *
    FROM vehicles
    WHERE vehicle_type = p_type;
END //

DELIMITER ;

CALL GetVehiclesByType('Car');

DELIMITER //

-- 4
CREATE PROCEDURE GetVehiclesByMaxRate(IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT *
    FROM vehicles
    WHERE daily_rate <= p_max_rate;
END //

DELIMITER ;

CALL GetVehiclesByMaxRate(3000);

DELIMITER //

-- 5
CREATE PROCEDURE UpdateVehicleRate(
    IN p_vehicle_id INT,
    IN p_new_rate DECIMAL(10,2)
)
BEGIN
    UPDATE vehicles
    SET daily_rate = p_new_rate
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL UpdateVehicleRate(1, 2800);

DELIMITER //

-- 6
CREATE PROCEDURE ChangeVehicleStatus(
    IN p_vehicle_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE vehicles
    SET available_status = p_status
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL ChangeVehicleStatus(3, 'Available');

DELIMITER //

-- 7
CREATE PROCEDURE IncreaseDailyRate(IN p_percentage DECIMAL(5,2))
BEGIN
    UPDATE vehicles
    SET daily_rate = daily_rate + (daily_rate * p_percentage / 100);
END //

DELIMITER ;

CALL IncreaseDailyRate(10);

DELIMITER //

-- 8
CREATE PROCEDURE DeleteVehicle(IN p_vehicle_id INT)
BEGIN
    DELETE FROM vehicles
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL DeleteVehicle(7);

DELIMITER //

-- 9
CREATE PROCEDURE GetVehiclesBetweenRates(
    IN p_min_rate DECIMAL(10,2),
    IN p_max_rate DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM vehicles
    WHERE daily_rate BETWEEN p_min_rate AND p_max_rate;
END //

DELIMITER ;

CALL GetVehiclesBetweenRates(1000, 3500);

DELIMITER //

-- 10
CREATE PROCEDURE CountVehiclesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS vehicle_count
    FROM vehicles
    WHERE vehicle_type = p_type;
END //

DELIMITER ;

CALL CountVehiclesByType('SUV');




CREATE DATABASE IF NOT EXISTS registration_db;
USE registration_db;

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    mobile VARCHAR(40),
    city VARCHAR(50),
    postal_code VARCHAR(20)
);

INSERT INTO registrations VALUES
(1, ' rohit sharma ', ' ROHIT@GMAIL.COM ', '+91-98765-43210', 'hyderabad', '500001'),
(2, 'SARA KHAN', 'sara@yahoo.com', '99887 66554', ' MUMBAI ', '400001'),
(3, ' amit    patel ', '', '(040)99887766', 'Hyderabad', '500 032'),
(4, 'Neha Singh ', NULL, '9876543210', 'BANGALORE', '560001'),
(5, 'imran ali', 'IMRAN@MAIL.COM ', '91 9988772211', NULL, '500084'),
(6, 'Priya Rao', 'priya@gmail', '98765-AB210', 'Pune', '411001');

-- 1
UPDATE registrations
SET full_name = TRIM(full_name);

-- 2
UPDATE registrations
SET full_name = UPPER(full_name);

-- 3
UPDATE registrations
SET email = LOWER(TRIM(email));

-- 4
UPDATE registrations
SET email = NULL
WHERE TRIM(email) = '';

-- 5
UPDATE registrations
SET mobile = REPLACE(REPLACE(mobile, ' ', ''), '-', '');

-- 6
UPDATE registrations
SET mobile = REGEXP_REPLACE(mobile, '[^0-9]', '');

-- 7
UPDATE registrations
SET city = UPPER(TRIM(city));

-- 8
SELECT *
FROM registrations
WHERE city IS NULL;

-- 9
SELECT *
FROM registrations
WHERE email IS NULL OR TRIM(email) = '';

-- 10
SELECT *
FROM registrations
WHERE email REGEXP '^[A-Za-z0-9._%+-]+@gmail\\.com$';

-- 11
SELECT *
FROM registrations
WHERE email IS NOT NULL
AND email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

-- 12
SELECT registration_id,
       REGEXP_REPLACE(postal_code, '[^0-9]', '') AS numeric_postal_code
FROM registrations;

-- 13
SELECT *
FROM registrations
WHERE mobile REGEXP '[A-Za-z]';

-- 14
SELECT
    UPPER(TRIM(full_name)) AS name,
    NULLIF(LOWER(TRIM(email)), '') AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city
FROM registrations;

-- 15
CREATE TABLE registrations_cleaned AS
SELECT
    registration_id,
    UPPER(TRIM(full_name)) AS full_name,
    NULLIF(LOWER(TRIM(email)), '') AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;




CREATE DATABASE IF NOT EXISTS call_centre_db;
USE call_centre_db;

CREATE TABLE call_performance (
    call_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    team VARCHAR(50),
    calls_handled INT,
    customer_rating DECIMAL(3,2),
    performance_date DATE
);

INSERT INTO call_performance VALUES
(1, 'Aman', 'Alpha', 42, 4.50, '2026-09-01'),
(2, 'Sara', 'Alpha', 38, 4.70, '2026-09-01'),
(3, 'Ravi', 'Beta', 50, 4.20, '2026-09-01'),
(4, 'Neha', 'Beta', 45, 4.80, '2026-09-01'),
(5, 'Aman', 'Alpha', 48, 4.60, '2026-09-02'),
(6, 'Sara', 'Alpha', 44, 4.50, '2026-09-02'),
(7, 'Ravi', 'Beta', 46, 4.30, '2026-09-02'),
(8, 'Neha', 'Beta', 52, 4.90, '2026-09-02'),
(9, 'Kabir', 'Alpha', 41, 4.40, '2026-09-01'),
(10, 'Kabir', 'Alpha', 49, 4.60, '2026-09-02'),
(11, 'Pooja', 'Beta', 45, 4.70, '2026-09-01'),
(12, 'Pooja', 'Beta', 50, 4.80, '2026-09-02');

-- 1
SELECT *,
       SUM(calls_handled) OVER () AS total_calls
FROM call_performance;

-- 2
SELECT *,
       SUM(calls_handled) OVER (PARTITION BY team) AS team_total_calls
FROM call_performance;

-- 3
SELECT *,
       AVG(calls_handled) OVER (PARTITION BY team) AS team_average_calls
FROM call_performance;

-- 4
SELECT *,
       AVG(customer_rating) OVER (PARTITION BY team) AS team_average_rating
FROM call_performance;

-- 5
SELECT *,
       SUM(calls_handled) OVER (
           PARTITION BY agent_name
           ORDER BY performance_date
       ) AS cumulative_calls
FROM call_performance;

-- 6
SELECT *,
       SUM(calls_handled) OVER (
           PARTITION BY team
           ORDER BY performance_date
       ) AS team_cumulative_calls
FROM call_performance;

-- 7
SELECT *,
       AVG(calls_handled) OVER (PARTITION BY team) AS team_average_calls,
       calls_handled -
       AVG(calls_handled) OVER (PARTITION BY team) AS difference
FROM call_performance;

-- 8
SELECT *,
       LAG(calls_handled) OVER (
           PARTITION BY agent_name
           ORDER BY performance_date
       ) AS previous_day_calls
FROM call_performance;

-- 9
SELECT *,
       calls_handled -
       LAG(calls_handled) OVER (
           PARTITION BY agent_name
           ORDER BY performance_date
       ) AS call_difference
FROM call_performance;

-- 10
SELECT *,
       SUM(calls_handled) OVER (
           PARTITION BY agent_name
       ) AS total_agent_calls
FROM call_performance;


-- ============================================================
-- PRACTICE SET 7 — RANKING
-- Uses call_performance table from Practice Set 6
-- ============================================================

USE call_centre_db;

-- 1
SELECT *,
       RANK() OVER (ORDER BY calls_handled DESC) AS call_rank
FROM call_performance;

-- 2
SELECT *,
       ROW_NUMBER() OVER (ORDER BY calls_handled DESC) AS row_number_rank
FROM call_performance;

-- 3
SELECT *,
       RANK() OVER (ORDER BY calls_handled DESC) AS rank_position
FROM call_performance;

-- 4
SELECT *,
       DENSE_RANK() OVER (ORDER BY calls_handled DESC) AS dense_rank_position
FROM call_performance;

-- 5
SELECT *,
       ROW_NUMBER() OVER (ORDER BY calls_handled DESC) AS row_num,
       RANK() OVER (ORDER BY calls_handled DESC) AS rank_num,
       DENSE_RANK() OVER (ORDER BY calls_handled DESC) AS dense_rank_num
FROM call_performance;

-- 6
SELECT *,
       RANK() OVER (
           PARTITION BY team
           ORDER BY calls_handled DESC
       ) AS team_rank
FROM call_performance;

-- 7
SELECT *,
       RANK() OVER (ORDER BY customer_rating DESC) AS rating_rank
FROM call_performance;

-- 8
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY team
               ORDER BY calls_handled DESC
           ) AS rn
    FROM call_performance
)
SELECT *
FROM ranked
WHERE rn <= 3;

-- 9
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY agent_name
               ORDER BY calls_handled DESC
           ) AS rn
    FROM call_performance
)
SELECT *
FROM ranked
WHERE rn = 1;

-- 10
SELECT agent_name,
       SUM(calls_handled) AS total_calls,
       RANK() OVER (
           ORDER BY SUM(calls_handled) DESC
       ) AS agent_rank
FROM call_performance
GROUP BY agent_name;




CREATE DATABASE IF NOT EXISTS insurance_db;
USE insurance_db;

CREATE TABLE insurance_claims (
    claim_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    insurance_type VARCHAR(50),
    claim_amount DECIMAL(12,2),
    branch VARCHAR(50)
);

INSERT INTO insurance_claims VALUES
(1, 'Ajay Kumar', 'Health', 75000, 'Hyderabad'),
(2, 'Meena Shah', 'Motor', 45000, 'Mumbai'),
(3, 'Rohit Jain', 'Health', 125000, 'Hyderabad'),
(4, 'Sara Ali', 'Travel', 30000, 'Delhi'),
(5, 'Vikas Rao', 'Motor', 85000, 'Mumbai'),
(6, 'Nisha Singh', 'Health', 60000, 'Delhi'),
(7, 'Imran Khan', 'Travel', 55000, 'Hyderabad'),
(8, 'Pooja Patel', 'Motor', 40000, 'Delhi'),
(9, 'Karan Mehta', 'Health', 150000, 'Mumbai'),
(10, 'Farah Ahmed', 'Travel', 35000, 'Hyderabad');

-- 1
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *
FROM claim_totals;

-- 2
WITH branch_totals AS (
    SELECT branch,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY branch
)
SELECT *
FROM branch_totals;

-- 3
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *
FROM claim_totals
WHERE total_claims > 200000;

-- 4
WITH average_claim AS (
    SELECT AVG(claim_amount) AS avg_claim
    FROM insurance_claims
)
SELECT *
FROM insurance_claims
WHERE claim_amount > (SELECT avg_claim FROM average_claim);

-- 5
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *,
       RANK() OVER (ORDER BY total_claims DESC) AS claim_rank
FROM claim_totals;

-- 6
WITH type_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
),
branch_totals AS (
    SELECT branch,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY branch
)
SELECT insurance_type AS category,
       total_claims
FROM type_totals
UNION ALL
SELECT branch AS category,
       total_claims
FROM branch_totals;

-- 7
SELECT *
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.insurance_type = ic.insurance_type
);

-- 8
SELECT *
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.branch = ic.branch
);

-- 9
SELECT *
FROM insurance_claims ic
WHERE claim_amount = (
    SELECT MAX(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.insurance_type = ic.insurance_type
);

-- 10
SELECT *
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.branch = ic.branch
);




CREATE DATABASE IF NOT EXISTS company_hierarchy_db;
USE company_hierarchy_db;

CREATE TABLE staff_hierarchy (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT,
    designation VARCHAR(100)
);

INSERT INTO staff_hierarchy VALUES
(1, 'Raj Malhotra', NULL, 'CEO'),
(2, 'Meera Shah', 1, 'CTO'),
(3, 'Vikram Rao', 1, 'Sales Director'),
(4, 'Aman Khan', 2, 'Engineering Manager'),
(5, 'Sara Ali', 2, 'Data Manager'),
(6, 'Rohit Das', 4, 'Developer'),
(7, 'Priya Singh', 4, 'Developer'),
(8, 'Kabir Ahmed', 5, 'Data Engineer'),
(9, 'Neha Rao', 5, 'Data Analyst'),
(10, 'Imran Sheikh', 3, 'Sales Manager'),
(11, 'Pooja Jain', 10, 'Sales Executive');

-- 1
SELECT *
FROM staff_hierarchy
WHERE manager_id IS NULL;

-- 2
SELECT *
FROM staff_hierarchy
WHERE manager_id = 1;

-- 3
SELECT *
FROM staff_hierarchy
WHERE manager_id = 2;

-- 4
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation,
           0 AS hierarchy_level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           s.designation,
           h.hierarchy_level + 1
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT *
FROM hierarchy;

-- 5
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation,
           0 AS hierarchy_level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           s.designation,
           h.hierarchy_level + 1
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT employee_name,
       designation,
       hierarchy_level
FROM hierarchy;

-- 6
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation
    FROM staff_hierarchy
    WHERE employee_name = 'Meera Shah'

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           s.designation
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT *
FROM hierarchy;

-- 7
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation
    FROM staff_hierarchy
    WHERE employee_name = 'Aman Khan'

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           s.designation
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT *
FROM hierarchy;

-- 8
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM staff_hierarchy e
LEFT JOIN staff_hierarchy m
    ON e.manager_id = m.employee_id;

-- 9
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           0 AS hierarchy_level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           h.hierarchy_level + 1
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT hierarchy_level,
       COUNT(*) AS employee_count
FROM hierarchy
GROUP BY hierarchy_level
ORDER BY hierarchy_level;

-- 10
WITH RECURSIVE hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation,
           0 AS hierarchy_level
    FROM staff_hierarchy
    WHERE employee_name = 'Raj Malhotra'

    UNION ALL

    SELECT s.employee_id,
           s.employee_name,
           s.manager_id,
           s.designation,
           h.hierarchy_level + 1
    FROM staff_hierarchy s
    JOIN hierarchy h
        ON s.manager_id = h.employee_id
)
SELECT *
FROM hierarchy
ORDER BY hierarchy_level, employee_id;




CREATE DATABASE IF NOT EXISTS hotel_db;
USE hotel_db;

CREATE TABLE hotel_bookings (
    booking_id INT PRIMARY KEY,
    hotel_city VARCHAR(50),
    room_type VARCHAR(50),
    nights INT,
    amount DECIMAL(10,2)
);

INSERT INTO hotel_bookings VALUES
(1, 'Hyderabad', 'Standard', 2, 6000),
(2, 'Hyderabad', 'Deluxe', 3, 13500),
(3, 'Hyderabad', 'Suite', 2, 18000),
(4, 'Mumbai', 'Standard', 2, 9000),
(5, 'Mumbai', 'Deluxe', 3, 18000),
(6, 'Mumbai', 'Suite', 1, 15000),
(7, 'Bangalore', 'Standard', 3, 10500),
(8, 'Bangalore', 'Deluxe', 2, 12000),
(9, 'Bangalore', 'Suite', 2, 20000);

-- 1
SELECT hotel_city,
       SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY hotel_city;

-- 2
SELECT room_type,
       SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY room_type;

-- 3
SELECT hotel_city,
       room_type,
       SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY hotel_city, room_type;

-- 4
SELECT hotel_city,
       room_type,
       SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY hotel_city, room_type WITH ROLLUP;

-- 5
SELECT SUM(amount) AS grand_total
FROM hotel_bookings;

-- 6
SELECT hotel_city,
       room_type,
       SUM(nights) AS total_nights
FROM hotel_bookings
GROUP BY hotel_city, room_type;

-- 7
SELECT hotel_city,
       room_type,
       SUM(nights) AS total_nights,
       SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY hotel_city, room_type WITH ROLLUP;
