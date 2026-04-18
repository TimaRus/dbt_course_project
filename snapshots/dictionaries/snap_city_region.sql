{% snapshot snap_city_region %}

{{
   config(
       target_schema='snapshot',
       unique_key='city',

       strategy='timestamp',
       updated_at='updated_at',
   )
}}

SELECT
    city,
    region,
    updated_at
FROM {{ ref('city_region') }}

{% endsnapshot %}