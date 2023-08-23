with unnest_json as 
(

select
* ,
company_address:address as address, 
company_address:city as city, 
company_address:coordinates as coordinates, 
company_address:postalCode as postalCode, 
company_address:state as state

from
analytics.dbt_jeff.users_03_company


  
),
final as
(
  select
  id,
  address as company_address,
  city as company_city,
  coordinates as company_coordinates,
  state as company_state,
  postalcode as company_postalcode
  from unnest_json
)

select * from final