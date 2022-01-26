select "Zone", drop_offs  
from (

select "DOLocationID", count(*) as drop_offs
from public.yellow_taxi_trips
left join public.taxi_zone_lookup on "LocationID"="PULocationID"
where "Zone"='Central Park' and date(tpep_pickup_datetime)='2021-01-14'
group by "DOLocationID"

) central_park_pick_ups

left join public.taxi_zone_lookup on "DOLocationID"="LocationID"
order by drop_offs desc
