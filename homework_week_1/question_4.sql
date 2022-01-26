select date(tpep_pickup_datetime) as day, cast(max(tip_amount) as float(2)) as largest_tip 
from yellow_taxi_trips
where date(tpep_pickup_datetime) between '2021-01-01' and '2021-01-31'
group by date(tpep_pickup_datetime) 
order by day 
limit 100;
