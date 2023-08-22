{% macro unnest_json(json_table, json_column, file_filter=none) %}

{%- set json_column_query -%}

select 
distinct json.KEY AS COLUMN_NAME
from
{{json_table}}
,LATERAL FLATTEN( {{json_column}} ) json

{% if file_filter is not none %}
  where file_name ilike '%{{file_filter}}%'
{% endif %}


{%- endset -%}


{% set results = run_query(json_column_query) %}

{%- if execute -%}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{%- endif -%}

select
* ,
{% for column_name in results_list -%}
{{json_column}}:{{ column_name }} as {{ column_name }}{% if not loop.last -%}, {% endif %}
{% endfor %}
from
{{json_table}}
{% if file_filter is not none %}
  where file_name ilike '%{{file_filter}}%'
{% endif %}

  
{% endmacro %}