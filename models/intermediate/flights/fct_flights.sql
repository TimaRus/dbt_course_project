{{
  config(
    materialized = 'table',
    )
}}

SELECT
  flight_id,
  flight_no,
  scheduled_departure,
  scheduled_arrival,
  departure_airport,
  arrival_airport
FROM
    {{ ref('stg_flights__flights') }}