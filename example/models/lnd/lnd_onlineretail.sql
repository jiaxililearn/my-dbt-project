{% set table_name = "replica.onlineretail" %}
{% set incremental_key = "invoicedate" %}
{% set incremental_key_type = "timestamp" %}
{% set timestamp_format = "DD/MM/YY HH:MI" %}

{{
generate_incremental_table_query(
  table_name,
  incremental_key,
  incremental_key_type,
  timestamp_format
)
}}
