{% macro get_incremental_table_query(table_name, incremental_key, incremental_key_type, timestamp_format) %}

{% set incremental_query %}
{{
    config(
        materialized='incremental'
    )
}}

select
*
from {{ table_name }}

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where
  {% if incremental_key_type == 'timestamp' %}
    {{parse_timestamp(incremental_key, timestamp_format)}} > (select max({{parse_timestamp(incremental_key, timestamp_format)}}) from {{ this }})
  {% else %}
    {{incremental_key}} > (select max({{incremental_key}}) from {{ this }})
  {% endif %}

{% endif %}

{% endset %}

{{ return(incremental_query) }}

{% endmacro %}


{% macro generate_incremental_table_query(table_name, incremental_key, incremental_key_type, timestamp_format) %}

{{ return(get_incremental_table_query(table_name, incremental_key, incremental_key_type, timestamp_format)) }}

{% endmacro %}
