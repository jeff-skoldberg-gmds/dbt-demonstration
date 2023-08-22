with unnest_json as 
(

select
* ,
company_address:address as address, 
company_address:city as city, 
company_address:coordinates as coordinates, 
company_address:state as state, 
company_address:postalCode as postalCode

from
analytics.dbt_jeff.users_03_company


  
),
final as
(
  select json_data,
  id,
  address as company_address,
  city as company_city,
  coordinates as company_coordinates,
  state as company_state,
  postalcode as company_postalcode
  from unnest_json
)

select * from final