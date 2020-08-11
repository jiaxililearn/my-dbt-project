{% set table_name = "replica.onlineretail" %}
{% set incremental_key = "invoiceno" %}
{% set incremental_key_type = "" %}
{% set timestamp_format = "" %}

{{
generate_incremental_table_query(
  table_name,
  incremental_key,
  incremental_key_type,
  timestamp_format
)
}}
