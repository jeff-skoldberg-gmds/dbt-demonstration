{{
  config(
    materialized = 'table',
    )
}}

SELECT 
flattened.value::VARIANT AS carts_json,
file_name,
row_number() over (partition by null order by null) as file_row_number,
copied_at
FROM {{ ref('stg_s3__web_traffic') }},
LATERAL FLATTEN(input => {{ ref('stg_s3__web_traffic') }}.json_data:carts) AS flattened