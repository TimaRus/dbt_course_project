{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append'
    )
}}

SELECT
  {{- bookref_to_bigint('book_ref') }} as book_ref,
  book_date,
  {{- kopeck_to_ruble(column_name = 'total_amount') }} as total_amount
FROM
  {{ source('demo_src', 'bookings') }}
--{% if is_incremental() %}
--WHERE
--  book_ref > (SELECT max(book_ref) FROM {{ this }})
--{% endif %}
{{ limid_data_dev('book_date', 30000) }}
