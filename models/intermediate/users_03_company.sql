{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('users_02') -%}
{%- set json_column = 'company_json' -%}



{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnest_json as 
(
  {{- unnest_json(json_table,json_column)-}}
),
level_1 as
(
  select
  id,
  address as company_address,
  department as company_department,
  name as company_name,
  title as company_job_title
  from unnest_json
)

select * from level_1