SELECT 
flattened.value::VARIANT AS users_json,
file_name,
file_row_number,
copied_at::timestamptz copied_at
FROM analytics.stage.stg_s3__web_traffic,
LATERAL FLATTEN(input => analytics.stage.stg_s3__web_traffic.json_data:users) AS flattened