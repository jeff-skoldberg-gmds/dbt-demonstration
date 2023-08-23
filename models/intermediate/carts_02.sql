{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('carts_01') -%}
{%- set json_column = 'carts_json' -%}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

with unnested as
(
  {{- unnest_json(json_table,json_column)-}}
)
select * rename (id as carts_id) from unnested