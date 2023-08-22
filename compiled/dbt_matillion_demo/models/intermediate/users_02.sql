with unnest_json as
(

select
* ,
_airbyte_data:address as address, 
_airbyte_data:age as age, 
_airbyte_data:bank as bank, 
_airbyte_data:birthDate as birthDate, 
_airbyte_data:bloodGroup as bloodGroup, 
_airbyte_data:company as company, 
_airbyte_data:domain as domain, 
_airbyte_data:ein as ein, 
_airbyte_data:email as email, 
_airbyte_data:gender as gender, 
_airbyte_data:height as height, 
_airbyte_data:image as image, 
_airbyte_data:lastName as lastName, 
_airbyte_data:macAddress as macAddress, 
_airbyte_data:maidenName as maidenName, 
_airbyte_data:password as password, 
_airbyte_data:phone as phone, 
_airbyte_data:ssn as ssn, 
_airbyte_data:weight as weight, 
_airbyte_data:eyeColor as eyeColor, 
_airbyte_data:ip as ip, 
_airbyte_data:username as username, 
_airbyte_data:firstName as firstName, 
_airbyte_data:hair as hair, 
_airbyte_data:userAgent as userAgent, 
_airbyte_data:id as id, 
_airbyte_data:university as university

from
analytics.dbt_jeff.users_01

  where file_name ilike '%users%'


  
)
select * rename (address as address_json, company as company_json)
from unnest_json