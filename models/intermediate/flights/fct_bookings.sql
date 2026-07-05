{{
  config(
    materialized = 'table',
    post_hook = "{{ check_dependencies(model.name) }}"
  )
}}

select
    {{- show_columns_relation('stg_flights__bookings') -}},
    {{ dbt_utils.generate_surrogate_key(['book_ref']) }}
from
    {{ ref('stg_flights__bookings') }}