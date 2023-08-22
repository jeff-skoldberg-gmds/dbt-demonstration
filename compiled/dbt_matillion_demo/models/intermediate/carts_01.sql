

select
* ,
json_data:_airbyte_ab_id as _airbyte_ab_id, 
json_data:_airbyte_data as _airbyte_data, 
json_data:_airbyte_emitted_at as _airbyte_emitted_at

from
analytics.dbt_jeff.stg_s3__web_traffic

  where file_name ilike '%carts%'


  
