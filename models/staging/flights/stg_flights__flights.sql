{{
  config(
    materialized = 'table',
    )
}}
select
  flight_id,
  flight_no,
  scheduled_departure,
  scheduled_arrival,
  departure_airport,
  arrival_airport
from
  {{ source('demo_src', 'flights') }}
