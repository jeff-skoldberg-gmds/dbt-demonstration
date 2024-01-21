

select
    t.$1::variant as data,
    metadata$filename as file_name,
    metadata$file_row_number as file_row_number,
    current_timestamp()::timestamptz as ingested_at
from
@raw.stage_raw.json_data_stage 
(pattern=>'\\d{4}\/rides-file\/.*\.json$', FILE_FORMAT => raw.stage_raw.json_format) t