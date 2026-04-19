{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'owner_model'
    }
    )
}}

SELECT
  book_ref,
  book_date,
  total_amount
FROM
    {{ ref('stg_flights__bookings') }}