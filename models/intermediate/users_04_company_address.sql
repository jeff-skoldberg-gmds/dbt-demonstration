{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('users_03_company') -%}
{%- set json_column = 'company_address' -%}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnest_json as 
(
  {{- unnest_json(json_table,json_column)-}}
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