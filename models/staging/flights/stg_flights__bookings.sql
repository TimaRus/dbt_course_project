{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append'
    )
}}

SELECT
  book_ref,
  book_date,
  total_amount
FROM
  {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
WHERE
  book_ref > (SELECT max(book_ref) FROM {{ this }})
{% endif %}
