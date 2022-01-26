select concat(case when a."Zone" is null then 'Unknown' else a."Zone" end,' / ',
case when b."Zone" is null then 'Unknown' else b."Zone" end) as pair, 
avg(total_amount) as average_total
from public.yellow_taxi_trips
left join public.taxi_zone_lookup a on "PULocationID"= a."LocationID"
left join public.taxi_zone_lookup b on "DOLocationID"= b."LocationID"
group by "PULocationID", "DOLocationID", a."Zone", b."Zone"
order by average_total desc
