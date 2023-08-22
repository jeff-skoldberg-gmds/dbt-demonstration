with source as (

  select * from {{ source('sample_data', 'web_traffic') }}

),

cleaned as (

  select
    json_data,
    file_name,
    file_row_number::int as file_row_number,
    copied_at::timestamptz as copied_at

  from source

)

select * from cleaned