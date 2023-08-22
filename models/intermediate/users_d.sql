{{
  config(
    materialized='table',
    transient=true
  )
}}

with 
users as (
  select * exclude (json_data,file_name,file_row_number,copied_at,_airbyte_ab_id,_airbyte_data,_airbyte_emitted_at,address_json) from {{ ref('users_02') }}
  ),
users_address as (
  select * exclude (json_data) from {{ ref('users_03_address') }}
  ),
users_company as (
  select * exclude (json_data, company_address) from {{ ref('users_03_company') }}
  ),
users_company_address as (
  select * exclude (json_data) from {{ ref('users_03_company_address') }}
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