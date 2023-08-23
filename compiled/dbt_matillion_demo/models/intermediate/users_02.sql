with unnest_json as
(

select
* ,
users_json:address as address, 
users_json:age as age, 
users_json:bank as bank, 
users_json:birthDate as birthDate, 
users_json:bloodGroup as bloodGroup, 
users_json:company as company, 
users_json:domain as domain, 
users_json:ein as ein, 
users_json:email as email, 
users_json:firstName as firstName, 
users_json:gender as gender, 
users_json:id as id, 
users_json:ip as ip, 
users_json:lastName as lastName, 
users_json:macAddress as macAddress, 
users_json:password as password, 
users_json:phone as phone, 
users_json:userAgent as userAgent, 
users_json:username as username, 
users_json:hair as hair, 
users_json:height as height, 
users_json:image as image, 
users_json:eyeColor as eyeColor, 
users_json:maidenName as maidenName, 
users_json:ssn as ssn, 
users_json:weight as weight, 
users_json:university as university

from
analytics.dbt_jeff.users_01


  
)
select * rename (address as address_json, company as company_json)
from unnest_json