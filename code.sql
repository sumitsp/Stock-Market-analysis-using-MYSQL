#Creating a database "assignment" which contains the tables of of information of all six stocks
create database assignment;
use assignment; 
#we will import all the data from csv to sql by importing via "TABLE DATA IMPORT WIZARD"
# Now we will create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. 
# we have used the function truncate to limit decimal places upto 3 to make the data clean and easy to read(done for all tables)
#We had changed the date format  to datetime data type while importing the data(done for all tables)
# For Bajaj1
create table bajaj1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from bajaj
window w as (order by Date asc);
select * from bajaj1 limit 100;
# For Eicher1
create table eicher1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from eicher
window w as (order by Date asc);
select * from eicher1 limit 100;
# For Hero motocorp1
create table hero1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from hero
window w as (order by Date asc);
select * from hero1 limit 100;
#For Infosys1
create table infosys1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from infosys
window w as (order by Date asc);
select * from infosys1 limit 100;
# For TCS1
create table tcs1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from tcs
window w as (order by Date asc);
select * from tcs1 limit 100;
# For TVS motors1
create table tvs1
select row_number() over w as Day, Date,`Close Price`,
if((ROW_NUMBER() OVER w) > 19, (avg(`Close Price`) OVER (order by Date asc rows 19 PRECEDING)), null) `20 Day MA`,
if((ROW_NUMBER() OVER w) > 49, (avg(`Close Price`) OVER (order by Date asc rows 49 PRECEDING)), null) `50 Day MA`
from tvs
window w as (order by Date asc);
select * from tvs1 limit 100;
# Now we will create a master table containing the date and close price of all the six stocks and the Column header for the price is the name of the stock
create table master_table 
select b.Date as Date,b.`Close Price` as Bajaj, e.`Close Price` as Eicher, h.`Close Price` as Hero, i.`Close Price` as Infosys, 
t.`Close Price` as TCS, tv.`Close Price` as TVS
from bajaj1 b
left join eicher1 e on b.Date = e.Date 
left join hero1 h on b.Date = h.Date
left join infosys1 i on b.Date = i.Date
left join tcs1 t on b.Date = t.Date
left join tvs1 tv on b.Date = tv.Date;

#Use the table created in Part(1) to generate buy and sell signal. 
#Store this in another table named 'bajaj2'. Perform this operation for all stocks.
# For bajaj2
create table bajaj2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from bajaj1;
select * from master_table;
# For eicher2
create table eicher2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from eicher1;
# For infosys2
create table infosys2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from infosys1;
# For hero2
create table hero2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from hero1;
# For tcs2
create table tcs2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from tcs1;
# For tvs2
create table tvs2 as
select date, `Close Price`,
case
    when `20 DAY MA` > `50 DAY MA` THEN "BUY"
    when `20 DAY MA` < `50 DAY MA` THEN "SELL"
    else "HOLD"
end as'Signal'
from tvs1;
# Create a User defined function, that takes the date as input and returns the signal 
# for that particular day (Buy/Sell/Hold) for the Bajaj stock.
delimiter $$
create function input_signal (s date)
returns char(50) deterministic
begin
declare s_value varchar(5);
set s_value = (select 'Signal' from bajaj2 where Date = s);
return s_value;
end
$$
delimiter ;
select input_signal('2016-03-16') as `signal`;
select * from tvs2;