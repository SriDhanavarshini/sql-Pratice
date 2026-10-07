-- Assessment 2 Airline Booking

-- Section A 
-- 1
select * from flights where source_city='Hyderabad';
-- 2
select * from flights where ticket_price BETWEEN 6000 and 20000;
-- 3
SELECT * FROM flights WHERE ticket_price > 15000 AND destination_city IN ('Dubai', 'Singapore');
-- 4
update flights set ticket_price=ticket_price+ticket_price*0.05 WHERE airline='SkyJet';
-- 5
select * from flights ORDER BY ticket_price DESC LIMIT 3;


-- Section B 

-- 6
select airline, avg(ticket_price) as avg_ticket_price from flights group by airline;
-- 7
select sum(seats) as total_seats,flight_id from bookings GROUP BY flight_id; 
-- 8
select airline from flights group by airline having avg(ticket_price)>8000;
-- 9
select f.airline, sum(b.seats *f.ticket_price) as booking_value from bookings b left join flights f on b.flight_id=f.flight_id group by f.airline;

-- Section C 

-- 10
select p.passenger_name,f.airline,f.source_city,f.destination_city,b.status from bookings b left join passengers p on b.passenger_id=p.passenger_id
left join flights f on b.flight_id=f.flight_id;
-- 11
SELECT p.passenger_name,b.booking_id,b.flight_id,b.status FROM passengers p LEFT JOIN bookings b ON p.passenger_id = b.passenger_id;
-- 12
SELECT b.booking_id FROM bookings b LEFT JOIN passengers p ON b.passenger_id = p.passenger_id LEFT JOIN flights f ON b.flight_id = f.flight_id WHERE p.passenger_id IS NULL
   OR f.flight_id IS NULL;

-- Section D

-- 13
select p. passenger_name,sum(b.seats*f.ticket_price) from bookings b left join passengers p on b.passenger_id=p.passenger_id 
left join flights f on b.flight_id=f.flight_id  group by b.passenger_id;

-- 14
select p. passenger_name,sum(b.seats*f.ticket_price) from bookings b left join passengers p on b.passenger_id=p.passenger_id 
left join flights f on b.flight_id=f.flight_id  where b.status='Confirmed' group by b.passenger_id having sum(b.seats*f.ticket_price)>10000;