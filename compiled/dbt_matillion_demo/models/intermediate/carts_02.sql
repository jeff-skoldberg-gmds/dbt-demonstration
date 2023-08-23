with unnested as
(

select
* ,
carts_json:discountedTotal as discountedTotal, 
carts_json:id as id, 
carts_json:products as products, 
carts_json:total as total, 
carts_json:totalProducts as totalProducts, 
carts_json:totalQuantity as totalQuantity, 
carts_json:userId as userId

from
analytics.intermediate.carts_01


  
)
select * rename (id as carts_id) from unnested