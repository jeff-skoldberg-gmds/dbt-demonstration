{{
    config(
        materialized="copy_into",
    )
}}

select
    t.$1::variant as data,
    metadata$filename as file_name,
    metadata$file_row_number as file_row_number,
    current_timestamp()::timestamptz as ingested_at
from
@{{source('gcs_external', 'json_data_stage') }} 
{{ var("file_search_1") }} t