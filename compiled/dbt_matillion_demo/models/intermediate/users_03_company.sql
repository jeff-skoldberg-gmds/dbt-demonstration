with unnest_json as 
(

select
* ,
company_json:address as address, 
company_json:department as department, 
company_json:name as name, 
company_json:title as title

from
analytics.dbt_jeff.users_02

  where file_name ilike '%users%'


  
),
level_1 as
(
  select json_data,
  id,
  address as company_address,
  department as company_department,
  name as company_name,
  title as company_job_title
  from unnest_json
)

select * from level_1