with unnest_json as 
(

select
* ,
address_json:address as address, 
address_json:city as city, 
address_json:coordinates as coordinates, 
address_json:postalCode as postalCode, 
address_json:state as state

from
analytics.intermediate.users_02


  
)
select 
id,
address as user_address,
city as user_city,
coordinates as user_coordinates,
state as user_state,
postalcode as user_postalcode,
file_name,
file_row_number,
copied_at
from unnest_json