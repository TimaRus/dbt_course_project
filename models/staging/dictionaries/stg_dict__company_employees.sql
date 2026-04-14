{{
    config(
        materialized = 'table',
    )
}}
SELECT
    employee_id
FROM
    {{ ref('company_employees') }}