{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('carts_01') -%}
{%- set json_column = '_airbyte_data' -%}
{%- set file_filter = 'carts' -%}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnested as
(
  {{- unnest_json(json_table,json_column,file_filter)-}}
)
select * rename (id as carts_id) from unnested