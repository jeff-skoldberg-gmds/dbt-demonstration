{# ----------------   only change the first two variables -------------------- #}

{%- set json_table = ref('stg_s3__web_traffic') -%}
{%- set json_column = 'json_data' -%}
{%- set file_filter = 'users' -%}


{#- ----------------   Edit below here only if necessary for a particular model ---------------- -#}

{{- unnest_json(json_table,json_column,file_filter)-}}