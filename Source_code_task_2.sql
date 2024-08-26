-- 13/06/2024
-- MENTORNESS INTERSHIP
-- TASK -2  HOTEL RESERVATION DATA ANALYSIShotel_datahotel_data
#(note- In comment above query I put ques and comment below I put ans)

#piyush kadam
create database mentorness;
use mentorness;
select * from hotel_data;


-- 1. What is the total number of reservations in the dataset?
	select count(*) from hotel_data;
#->700


-- 2. Which meal plan is the most popular among guests?
select type_of_Smeal_plan,count(type_of_meal_plan) as count_of_meal_plan from hotel_data group by type_of_meal_plan order by count(type_of_meal_plan) desc limit 1;

-- type_of_meal_plan | count_of_meal_plan
-- Meal Plan 1	     |      527



-- 3. What is the average price per room for reservations involving children?
select round(avg(avg_price_per_room),2) as avg_price_per_room from hotel_data where no_of_children>0;

-- > avg_price_per_room
-- >'144.57'




-- 4. How many reservations were made for the year 2017?
select count(*)from hotel_data where arrival_date like "%2017";
-- ->123



-- 5. What is the most commonly booked room type?
select room_type_reserved as most_common_room_type ,count(room_type_reserved) as count
from hotel_data 
group by room_type_reserved 
order by count(room_type_reserved) desc limit 1;

# most_common_room_type | count
-- 'Room_Type 1'        |'534'


-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as reservations_on_weekend from hotel_data where no_of_weekend_nights>0;

# reservations_on_weekend
-- 383


-- 7. What is the highest and lowest lead time for reservations?

select max(lead_time) as highest_lead_time from hotel_data;

-- >highest_lead_time
-- >443

select min(lead_time) as lowest_lead_time from hotel_data;

-- > lowest_lead_time
-- > 0



-- 8. What is the most common market segment type for reservations?

select market_segment_type as most_common_segment,count(market_segment_type) as count
from hotel_data group by market_segment_type
 order by count(market_segment_type) desc limit 1;

-- > most_common_segment  | count
-- > Online               |  518


-- 9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as confirmed_bookings from hotel_data where booking_status="not_canceled";

-- > confirmed_bookings
-- > 493
select * from hotel_data;

-- 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults from hotel_data;

-- >total_adults
-- >1316

select sum(no_of_children) as total_childrens from hotel_data;
-- > total_childrens
-- > 69


-- 11. What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as avg_weekend_nights from hotel_data where no_of_weekend_nights>0 and no_of_children>0 ;

-- > avg_weekend_nights
-- > '1.6000'




-- 12. How many reservations were made in each month of the year?
select date_format(str_to_date(arrival_date,"%d-%m-%Y"), "%Y-%m")as year_months,
count(*) as reservation_count
from hotel_data
group by Year_months
order by year_months;
# year_months | reservation_count
-- 2017-07,   |  8
-- 2017-08,	  |	14
-- 2017-09,   |	35
-- 2017-10,   |	40
-- 2017-11,   |	13
-- 2017-12,   |	13
-- 2018-01,   |	11
-- 2018-02,   |	28
-- 2018-03,   |	52
-- 2018-04,   |	67
-- 2018-05,   |	55
-- 2018-06,   |	84
-- 2018-07,   |	36
-- 2018-08,   |	56
-- 2018-09,   |	45
-- 2018-10,   |	63
-- 2018-11,   |	41
-- 2018-12,   |	39



-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room
-- type?

select room_type_reserved as room_type,avg(no_of_weekend_nights)+avg(no_of_week_nights) as avg_number_nights
from hotel_data group by room_type_reserved order by room_type;

-- > room_type | avg_number_nights
-- Room_Type 1 | 2.8783
-- Room_Type 2 | 3.0000
-- Room_Type 4 | 3.8000
-- Room_Type 5 | 2.5000
-- Room_Type 6 | 3.6111
-- Room_Type 7 | 2.6667


-- 14. For reservations involving children, what is the most common room type, and what is the average
-- price for that room type?

select room_type_reserved,count(room_type_reserved) as count_room_type,round(avg(avg_price_per_room),2) as avg_room_type
from hotel_data 
where no_of_children>0
group by room_type_reserved 
order by count(room_type_reserved) desc
limit 1;

 -- > room_type_reserved |  count_room_type |   avg_room_type
 -- > Room_Type 1        |     24           |   123.12

-- 15. Find the market segment type that generates the highest average price per room.

select market_segment_type as market_segment,max(avg_price_per_room) as highest_average 
from hotel_data group by market_segment_type
 order by highest_average desc limit 1;

-- > market_segment | highest_average
-- > Online         | 258

select market_segment_type as market_segment,avg(avg_price_per_room) as highest_average 
from hotel_data group by market_segment_type  order by highest_average desc limit 1;