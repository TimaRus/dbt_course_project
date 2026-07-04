{{
  config(
    materialized = 'table',
    post_hook = "{{ check_dependencies(model.name) }}"
  )
}}

SELECT
  book_ref,
  book_date,
  total_amount
FROM {{ ref('stg_flights__bookings') }}