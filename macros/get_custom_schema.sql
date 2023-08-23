{% macro generate_schema_name(custom_schema_name, node) -%}

{%- set default_schema = target.schema -%}
    
    {% if target.name == 'qa' and custom_schema_name is not none -%}
        qa_{{ custom_schema_name | trim }}
    
    {% elif target.name == 'emerald-target' and custom_schema_name is not none -%}
        {{ custom_schema_name | trim }}
    {%- else -%}
        {{ generate_schema_name_for_env(custom_schema_name, node) }}
    {% endif %}
{%- endmacro %}