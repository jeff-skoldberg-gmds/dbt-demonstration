{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('users_02') -%}
{%- set json_column = 'address_json' -%}



{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnest_json as 
(
  {{- unnest_json(json_table,json_column)-}}
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