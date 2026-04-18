{% snapshot dim_flights__airports %}

{{
   config(
       target_schema='snapshot',
       unique_key='airport_code',

       strategy='check',
       check_cols = ['airport_name', 'city', 'coordinates', 'timezone']
   )
}}

SELECT
airport_code,
airport_name,
city,
coordinates,
timezone
FROM {{ ref('stg_flights__airports') }}

{% endsnapshot %}