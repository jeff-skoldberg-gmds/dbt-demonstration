{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('users_02') -%}
{%- set json_column = 'address_json' -%}
{%- set file_filter = 'users' -%}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnest_json as 
(
  {{- unnest_json(json_table,json_column,file_filter)-}}
)
select json_data,
id,
address as user_address,
city as user_city,
coordinates as user_coordinates,
state as user_state,
postalcode as user_postalcode
from unnest_json