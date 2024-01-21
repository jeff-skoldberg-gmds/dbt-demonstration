select * from {{ source('google_sheets','sample_data2') }}
order by id