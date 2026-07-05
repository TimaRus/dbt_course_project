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
  arrival_airport,
  status,
  aircraft_code,
  actual_departure,
  actual_arrival,
  {{ concat_columns([ 'flight_id', 'flight_no' ]) }} AS flight_info
FROM
    {{ ref('stg_flights__flights') }}

{% for status_value in dbt_utils.get_column_values(table = this, column ='status') %}
    --{{ status_value }}
{% endfor %}