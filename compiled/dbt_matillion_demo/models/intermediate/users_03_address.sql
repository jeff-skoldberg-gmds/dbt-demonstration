with unnest_json as 
(

select
* ,
address_json:address as address, 
address_json:city as city, 
address_json:coordinates as coordinates, 
address_json:state as state, 
address_json:postalCode as postalCode

from
analytics.dbt_jeff.users_02

  where file_name ilike '%users%'


  
)
select json_data,
id,
address as user_address,
city as user_city,
coordinates as user_coordinates,
state as user_state,
postalcode as user_postalcode
from unnest_json