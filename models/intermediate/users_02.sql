{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('users_01') -%}
{%- set json_column = 'users_json' -%}
{# {%- set file_filter = 'users' -%} #}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnest_json as
(
  {{- unnest_json(json_table,json_column)-}}
)
select * rename (address as address_json, company as company_json)
from unnest_json