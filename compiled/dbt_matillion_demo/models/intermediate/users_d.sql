

with 
users as (
  select * exclude (address_json,file_name,file_row_number,copied_at) from analytics.intermediate.users_02
  ),
users_address as (
  select * exclude (file_name,file_row_number,copied_at)  from analytics.intermediate.users_03_address
  ),
users_company as (
  select * exclude (company_address) from analytics.intermediate.users_03_company
  ),
users_company_address as (
  select *  from analytics.intermediate.users_04_company_address
  ),
joined as 
(
  select *
  from 
  users join
  users_address using (id) join
  users_company using (id) join
  users_company_address using (id)
)
select * from joined