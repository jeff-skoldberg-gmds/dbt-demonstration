with unnested as
(

select
* ,
_airbyte_data:discountedTotal as discountedTotal, 
_airbyte_data:products as products, 
_airbyte_data:total as total, 
_airbyte_data:totalProducts as totalProducts, 
_airbyte_data:totalQuantity as totalQuantity, 
_airbyte_data:userId as userId, 
_airbyte_data:id as id

from
analytics.dbt_jeff.carts_01

  where file_name ilike '%carts%'


  
)
select * rename (id as carts_id) from unnested