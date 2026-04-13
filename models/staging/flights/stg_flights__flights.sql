{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = ['flight_id', 'flight_no']
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
  {{ source('demo_src', 'flights') }}
{% if is_incremental() %}
WHERE
  scheduled_departure >= (SELECT max(scheduled_departure) - interval '100 day' FROM {{ this }})
{% endif %}