SELECT
    scheduled_departure::date AS scheduled_departure,
    COUNT(*) AS cancelled_flights_cnt
FROM {{ ref('fct_flights') }}
WHERE departure_airport = 'MJZ'
GROUP BY scheduled_departure::date